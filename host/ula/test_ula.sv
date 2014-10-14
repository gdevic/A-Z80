//============================================================================
// Test the implementation of the Sinclair ZX Spectrum ULA
//============================================================================
module test_ula
(
    input wire CLOCK_27,            // Input clock 27 MHz

    output wire [3:0] VGA_R,
    output wire [3:0] VGA_G,
    output wire [3:0] VGA_B,
    output reg VGA_HS,
    output reg VGA_VS,

    output wire [1:0] GPIO_0,
    input wire SW0,
    input wire SW1,
    input wire SW2
);

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Instantiate PLL
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
wire clk_pix;                   // VGA pixel clock (25.175 MHz)
wire clk_ula;                   // ULA master clock (14 MHz)
pll pll_( .inclk0(CLOCK_27), .c0(clk_pix), .c1(clk_ula) );

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
video video_( .* );


endmodule
