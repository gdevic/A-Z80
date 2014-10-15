//============================================================================
// Test the implementation of the Sinclair ZX Spectrum ULA
//============================================================================
module test_ula
(
    input wire CLOCK_27,        // Input clock 27 MHz
    input wire KEY0,            // Button 0 is reset

    output wire [3:0] VGA_R,
    output wire [3:0] VGA_G,
    output wire [3:0] VGA_B,
    output reg VGA_HS,
    output reg VGA_VS,

    output wire [21:0] FL_ADDR,
    input wire [7:0] FL_DQ,
    output wire FL_CE_N,
    output wire FL_OE_N,
    output wire FL_RST_N,
    output wire FL_WE_N,
    
    output wire [6:0] GPIO_0,   // Scope test points
    input wire SW0,
    input wire SW1,
    input wire SW2
);

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Instantiate PLL and clocks block
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
wire clk_pix;                   // VGA pixel clock (25.175 MHz)
wire clk_ula;                   // ULA master clock (14 MHz)
pll pll_( .inclk0(CLOCK_27), .c0(clk_pix), .c1(clk_ula) );

wire clk_cpu;                   // Clocks generates CPU clocks of 3.5 MHz
clocks clocks_( .* );

// Various scope test points
assign GPIO_0[0] = CLOCK_27;
assign GPIO_0[1] = clk_pix;
assign GPIO_0[2] = clk_ula;
assign GPIO_0[3] = clk_cpu;
assign GPIO_0[4] = VGA_VS;
assign GPIO_0[5] = VGA_HS;
assign GPIO_0[6] = VGA_B[0];

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Instantiate RAM that contains a sample screen image
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
reg [12:0] vram_address;
reg [7:0] vram_data;
ram8 ram8_( .address(vram_address), .clock(clk_pix), .data(0), .wren(0), .q(vram_data));

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// State register containing the border color index
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
reg [7:0] state;

// Testing: assign the border color index based on the board switches
wire [2:0] border;              // Border color index value
assign border = { SW2, SW1, SW0 };

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Instantiate ULA's video subsystem
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//video video_( .*, .vram_address(vram_address), .vram_data(vram_data) );

// Use flash interface instead of the internal RAM
assign FL_CE_N = 0;
assign FL_OE_N = 0;
assign FL_RST_N = KEY0;
assign FL_WE_N = 1;
assign FL_ADDR[21:13] = 'b10;
video video_( .*, .vram_address(FL_ADDR[12:0]), .vram_data(FL_DQ) );

endmodule
