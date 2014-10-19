//============================================================================
// Host design containing A-Z80 and a few peripherials
//
// This module defines a host board to be run on an FPGA.
//
//============================================================================
module host
(
    input wire CLOCK_50,
    input wire KEY0,            // KEY0 is reset
    input wire KEY1,            // KEY1 generates a maskable interrupt (INT)
    input wire KEY2,            // KEY2 generates a non-maskable interrupt (NMI)
    output wire UART_TXD,
    
    output wire [5:0] GPIO_0    // Test
);
`default_nettype none

wire reset;
assign reset = locked & KEY0;

wire uart_tx;
assign UART_TXD = uart_tx;

wire locked;

assign GPIO_0[0] = reset;
assign GPIO_0[1] = pll_clk;
assign GPIO_0[2] = locked;
assign GPIO_0[3] = nM1;
assign GPIO_0[4] = nRD;
assign GPIO_0[5] = nRFSH;

// ----------------- CPU PINS -----------------
wire nM1;
wire nMREQ;
wire nIORQ;
wire nRD;
wire nWR;
wire nRFSH;
wire nHALT;
wire nBUSACK;

wire nWAIT = 1;
wire nBUSRQ = 1;
wire nINT = KEY1;
wire nNMI = KEY2;

wire [15:0] A;
wire [7:0] D;

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Instantiate PLL
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
wire pll_clk;
pll pll_( .locked(locked), .inclk0(CLOCK_50), .c0(pll_clk) );

// ----------------- INTERNAL WIRES -----------------
wire [7:0] RamData;                     // RamData is a data writer from the RAM module
wire RamWE;
assign RamWE = nIORQ==1 && nRD==1 && nWR==0;

// Memory map:
//   0000 - 3FFF  16K RAM
assign D[7:0] = (A[15:14]=='h0 && nIORQ==1 && nRD==0 && nWR==1) ? RamData :
                {8{1'bz}};

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Instantiate A-Z80 CPU module
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
z80_top_direct_n z80_( .*, .nRESET(reset), .CLK(pll_clk) );

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Instantiate 16Kb of RAM memory
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ram ram_( .address(A[13:0]), .clock(pll_clk), .data(D[7:0]), .wren(RamWE), .q(RamData[7:0]) );

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Instantiate UART module
// UART uses negative signalling logic, so invert control inputs
// IO Map:
//   0000 - 00FF  Write a byte to UART
//   0200 - 02FF  Get UART busy status in bit 0
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
uart_io uart_io_( .*, .reset(!reset), .clk(CLOCK_50), .Address(A[15:8]), .Data(D[7:0]), .IORQ(!nIORQ), .RD(!nRD), .WR(!nWR) );

endmodule
