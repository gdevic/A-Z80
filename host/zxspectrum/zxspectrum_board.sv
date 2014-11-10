//============================================================================
// Sinclair ZX Spectrum host board
//============================================================================
module zxspectrum_board
(
    //-------- Clocks and reset -----------------
    input wire CLOCK_27,            // Input clock 27 MHz
    input wire CLOCK_24,            // Input clock 24 MHz
    input wire KEY0,                // RESET button

    //-------- PS/2 Keyboard --------------------
    input wire PS2_CLK,
    input wire PS2_DAT,
    
    //-------- Audio (Tape player) --------------
    inout wire I2C_SCLK,
    inout wire I2C_SDAT,    
    output wire AUD_XCK,
    output wire AUD_ADCLRCK,
    output wire AUD_DACLRCK,
    output wire AUD_BCLK,
    output wire AUD_DACDAT,
    input wire AUD_ADCDAT,

    //-------- VGA connector --------------------
    output wire [3:0] VGA_R,
    output wire [3:0] VGA_G,
    output wire [3:0] VGA_B,
    output reg VGA_HS,
    output reg VGA_VS,

    //-------- Flash memory interface -----------
    output wire [21:0] FL_ADDR,
    input wire [7:0] FL_DQ,
    output wire FL_CE_N,
    output wire FL_OE_N,
    output wire FL_WE_N,
    output wire FL_RST_N,
    
    //-------- SRAM memory interface ------------
    output wire [17:0] SRAM_ADDR,
    inout reg [15:0] SRAM_DQ,
    output wire SRAM_CE_N,
    output wire SRAM_OE_N,
    output wire SRAM_WE_N,
    output wire SRAM_UB_N,
    output wire SRAM_LB_N,

    //-------- Misc and debug -------------------
    input wire SW0,                 // Enable/disable interrupts
    output wire [0:0] LEDR,         // Glow red when interrupts are *disabled*
    inout wire [31:0] GPIO_1
);
`default_nettype none

wire reset;
wire locked;
assign reset = locked & KEY0;

assign GPIO_1[15:0] = A[15:0];
assign GPIO_1[23:16] = D[7:0];
assign GPIO_1[31:24] = {nM1,nMREQ,nIORQ,nRD,nWR,nRFSH,nHALT,nBUSACK};
//assign GPIO_1[] = {nWAIT,nINT,nNMI,nRESET,nBUSRQ,CLK};

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Internal buses and address map selection logic
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
wire [15:0] A;                  // Global address bus
wire [7:0] D;                   // CPU data bus

wire [7:0] ram_data;            // Internal 16K RAM data
wire RamWE;
assign RamWE = A[15:14]==2'b01 && nIORQ==1 && nRD==1 && nWR==0;

wire ExtRamWE;                  // Extended (and external) 32K RAM
assign ExtRamWE = A[15]==1 && nIORQ==1 && nRD==1 && nWR==0;
assign SRAM_DQ[15:0] = ExtRamWE? {8'b0,D[7:0]} : {16{1'bz}};

wire [7:0] ula_data;            // ULA
wire io_we;
assign io_we = nIORQ==0 && nRD==1 && nWR==0;

// Memory map:
//   0000 - 3FFF  16K ROM (mapped to the external Flash memory)
//   4000 - 7FFF  16K dual-port RAM
//   8000 - FFFF  32K RAM (mapped to the external SRAM memory)
always_comb
begin
    case ({nIORQ,nRD,nWR})
        3'b101: begin   // Memory read
                casez (A[15:14])
                    2'b00:  D[7:0] = FL_DQ;
                    2'b01:  D[7:0] = ram_data;
                    // TODO: Adding 32K SRAM seems to make it more unstable: debug.
                    2'b1?:  D[7:0] = SRAM_DQ[7:0];
                endcase
                end
        // IO read, data supplied by the ULA
        3'b001: D[7:0] = ula_data;
    default:
        D[7:0] = {8{1'bz}};
    endcase
end

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// 16K of ZX Spectrum ROM is in the flash at the address 0
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
assign FL_ADDR[13:0] = A[13:0];
assign FL_ADDR[21:14] = '0;
assign FL_RST_N = KEY0;
assign FL_CE_N = 0;
assign FL_OE_N = 0;
assign FL_WE_N = 1;

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Instantiate 16K dual-port RAM
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
wire clk_vram;
// "A" side is the CPU side, "B" side is the VGA image generator
ram16 ram16_(
    .clock      (clk_vram),     // RAM connects to the higher, pixel clock rate

    .address_a  (A[13:0]),      // Address in to the RAM from the CPU side
    .data_a     (D),            // Data in to the RAM from the CPU side
    .q_a        (ram_data),     // Data out from the RAM into the data bus selector
    .wren_a     (RamWE),

    .address_b  (vram_address),
    .data_b     (0),
    .q_b        (vram_data),
    .wren_b     (0));

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// 32K of ZX Spectrum extended RAM is using the external SRAM memory
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
assign SRAM_ADDR[14:0] = A[14:0];
assign SRAM_ADDR[17:15] = '0;
assign SRAM_CE_N = 0;
assign SRAM_OE_N = 0;
assign SRAM_WE_N = !ExtRamWE;
assign SRAM_UB_N = 1;
assign SRAM_LB_N = 0;

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Instantiate ULA
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
wire clk_cpu;                   // Global CPU clock of 3.5 MHz
wire [12:0] vram_address;       // ULA video block requests a byte from the video RAM
wire [7:0] vram_data;           // ULA video block reads a byte from the video RAM
wire vs_nintr;                  // Generates a vertical retrace interrupt

ula ula_( .*, .clk_cpu(clk_cpu) );

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Instantiate A-Z80 CPU
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
wire nM1;
wire nMREQ;
wire nIORQ;
wire nRD;
wire nWR;
wire nRFSH;
wire nHALT;
wire nBUSACK;

wire nWAIT = 1;
wire nINT = (SW0==0)? vs_nintr : '1;// SW0 disables interrupts and, hence, keyboard
assign LEDR[0] = SW0;               // Glow red when keyboard is *disabled*
wire nNMI = 1;
wire nBUSRQ = 1;

z80_top_direct_n z80_( .*, .nRESET(reset), .CLK(clk_cpu) );

endmodule
