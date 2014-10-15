//============================================================================
// Sinclair ZX Spectrum host board
//============================================================================
module zxspectrum_board
(
    input wire CLOCK_27,            // Input clock 27 MHz
    input wire KEY0,                // RESET button

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
    output wire SRAM_LB_N
);

wire reset;                         // Reset signal is assigned to
assign reset = KEY0;                // pushbutton 0

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Instantiate PLL
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
wire clk_pix;                   // VGA pixel clock (25.175 MHz)
wire clk_ula;                   // ULA master clock (14 MHz)
pll pll_( .inclk0(CLOCK_27), .c0(clk_pix), .c1(clk_ula) );

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Instantiate ULA modules
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
reg [7:0] state;
reg [2:0] border = 4;

wire [12:0] vram_address;       // ULA video block requests RAM address
wire [7:0] vram_data;           // ULA video block reads RAM data

video video_( .* );

wire clk_cpu;                   // Clocks generates CPU clocks of 3.5 MHz
clocks clocks_( .* );

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Internal buses and address map selection logic
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
wire [15:0] A;                  // Global address bus
wire [7:0] D;                   // CPU data bus

wire [7:0] ram_data;            // Internal RAM output data bus
wire RamWE;
assign RamWE = A[15:14]==2'b01 && nIORQ==1 && nRD==1 && nWR==0;
wire ExtRamWE;
assign ExtRamWE = A[15]==1 && nIORQ==1 && nRD==1 && nWR==0;
assign SRAM_DQ[15:0] = ExtRamWE? {8'b0,D[7:0]} : {16{1'bz}};

// Memory map:
//   0000 - 3FFF  16K ROM (mapped to the external Flash memory)
//   4000 - 7FFF  16K dual-port RAM
//   8000 - FFFF  32K RAM (mapped to the external SRAM memory)
always_comb
begin
    D[7:0] = {8{1'bz}};
    case ({nIORQ,nRD,nWR})
        3'b101: begin   // Memory read
                casez (A[15:14])
                    2'b00:  D[7:0] = FL_DQ;
                    2'b01:  D[7:0] = ram_data;
                    2'b1?:  D[7:0] = SRAM_DQ[7:0];
                endcase
                end
    endcase
end

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// 16K of ZX Spectrum ROM is in the flash at the address 0
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
assign FL_ADDR[21:0] = {{8{1'b0}}, A[13:0]};
assign FL_RST_N = KEY0;
assign FL_CE_N = 0;
assign FL_OE_N = 0;
assign FL_WE_N = 1;

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Instantiate 16K dual-port RAM
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// "A" side is the CPU side, "B" side is the VGA image generator
ram16 ram16_(
    .clock      (clk_pix),      // RAM connects to the higher, pixel clock rate

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
assign SRAM_ADDR[17:0] = {{3{1'b0}}, A[14:0]};
assign SRAM_CE_N = 0;
assign SRAM_OE_N = 0;
assign SRAM_WE_N = !ExtRamWE;
assign SRAM_UB_N = 1;
assign SRAM_LB_N = 0;

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
wire nINT = 1;
wire nNMI = 1;
wire nBUSRQ = 1;

z80_top_direct_n z80_( .*, .nRESET(reset), .CLK(clk_cpu) );

endmodule
