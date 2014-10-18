//============================================================================
// The implementation of the Sinclair ZX Spectrum ULA
//============================================================================
module ula
(
    //-------- Clocks and reset -----------------
    input wire CLOCK_50,            // Input clock 50 MHz
    input wire CLOCK_27,            // Input clock 27 MHz
    output wire clk_vram,
    input wire reset,               // KEY0 is reset
    
    //-------- CPU control ----------------------
    output wire clk_cpu,            // Generates CPU clock of 3.5 MHz
    output wire vs_nintr,           // Generates a vertical retrace interrupt

    //-------- Address and data buses -----------
    input wire [15:0] A,            // Input address bus
    input wire [7:0] D,             // Input data bus
    output wire [7:0] ula_data,     // Output data
    input wire io_we,               // Write enable to data register through IO

    output wire [12:0] vram_address,// ULA video block requests a byte from the video RAM
    input wire [7:0] vram_data,     // ULA video block reads a byte from the video RAM

    //-------- PS/2 Keyboard --------------------
    input wire PS2_CLK,
    input wire PS2_DAT,

    //-------- VGA connector --------------------
    output wire [3:0] VGA_R,
    output wire [3:0] VGA_G,
    output wire [3:0] VGA_B,
    output reg VGA_HS,
    output reg VGA_VS
);
`default_nettype none

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Instantiate PLL and clocks block
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
wire clk_pix;                   // VGA pixel clock (25.175 MHz)
wire clk_ula;                   // ULA master clock (14 MHz)
assign clk_vram = clk_pix;
pll pll_( .inclk0(CLOCK_27), .c0(clk_pix), .c1(clk_ula) );

clocks clocks_( .* );

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// The border color index
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
reg [2:0] border;              // Border color index value

always @(negedge clk_cpu)
begin
    if (A[0]==0 && io_we==1) begin
        border <= D[2:0];
    end
end

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Instantiate ULA's video subsystem
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
video video_( .* );

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Instantiate keyboard support
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
wire [7:0] scan_code;
wire scan_code_ready;
wire scan_code_error;

ps2_keyboard ps2_keyboard_( .*, .clk(CLOCK_50) );

wire [4:0] key_row;
zx_keyboard zx_keyboard_( .*, .clk(CLOCK_50) );

assign ula_data = (A[0]==0)? { 3'b0, key_row[4:0] } : 8'hFF;

endmodule
