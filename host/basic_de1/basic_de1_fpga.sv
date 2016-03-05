//============================================================================
// Host design containing A-Z80 and a few peripherials
//
// This module defines a host board to be run on an FPGA.
//
//  Copyright (C) 2014-2016  Goran Devic
//
//  This program is free software; you can redistribute it and/or modify it
//  under the terms of the GNU General Public License as published by the Free
//  Software Foundation; either version 2 of the License, or (at your option)
//  any later version.
//
//  This program is distributed in the hope that it will be useful, but WITHOUT
//  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
//  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
//  more details.
//
//  You should have received a copy of the GNU General Public License along
//  with this program; if not, write to the Free Software Foundation, Inc.,
//  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
//============================================================================
module host
(
    input wire CLOCK_50,
    input wire KEY0,            // KEY0 is reset
    input wire KEY1,            // KEY1 generates a maskable interrupt (INT)
    input wire KEY2,            // KEY2 generates a non-maskable interrupt (NMI)
    output wire UART_TXD,

    output wire [5:0] GPIO_0    // Test points
);
`default_nettype none

// Export selected pins to the extension connector
assign GPIO_0[0] = reset;
assign GPIO_0[1] = locked;
assign GPIO_0[2] = nM1;
assign GPIO_0[3] = nMREQ;
assign GPIO_0[4] = nRD;
assign GPIO_0[5] = nWR;

// Basic wires and the reset logic
wire uart_tx;
wire uart_busy;
wire UartWE;
wire reset;
wire locked;

assign reset = locked & KEY0;
assign UART_TXD = uart_tx;

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

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Generate the CPU clock by dividing input clock by a factor of a power of 2
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
reg clk_cpu = 0;                        // Final CPU clock
// Note: In order to test at 3.5 MHz, the PLL needs to be set to generate 14 MHz
// and then this divider-by-4 brings the effective clock down to 3.5 MHz
reg [0:0] counter = 0;                  // Clock divider counter

always @(posedge pll_clk)
begin
    if (counter=='0)
        clk_cpu <= ~clk_cpu;
    counter <= counter - 1'b1;
end

// ----------------- INTERNAL WIRES -----------------
wire [7:0] RamData; // Data writer from the RAM module
wire RamWE;
assign RamWE = nIORQ==1 && nRD==1 && nWR==0;
assign UartWE = nIORQ==0 && nRD==1 && nWR==0;

// Memory map:
//   0000 - 3FFF  16K RAM
always_comb
begin
    case ({nIORQ,nRD,nWR})
        3'b101: begin   // Memory read
                casez (A[15:14])
                    2'b00:  D[7:0] = RamData;
                default:
                    D[7:0] = 8'h76; // HALT
                endcase
                end
        3'b001: D[7:0] = {7'h0,uart_busy};
        // IO read *** Interrupts test ***
        // This value will be pushed on the data bus on an IORQ access which
        // means that:
        // In IM0: this is the opcode of an instruction to execute, set it to 0xFF
        // In IM2: this is a vector, set it to 0x80 (to correspond to a test program Hello World)
        3'b011: D[7:0] = 8'h80;
    default:
        D[7:0] = {8{1'bz}};
    endcase
end

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Instantiate A-Z80 CPU module
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
z80_top_direct_n z80_( .*, .nRESET(reset), .CLK(clk_cpu) );

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Instantiate 16Kb of RAM memory
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ram ram_( .address(A[13:0]), .clock(pll_clk), .data(D[7:0]), .wren(RamWE), .q(RamData[7:0]) );

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Instantiate UART module
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
uart #( .BAUD(115200), .IN_CLOCK(50000000) ) uart_(
   // Outputs
   .busy(uart_busy),
   .uart_tx(uart_tx),
   // Inputs
   .wr(UartWE),
   .data(D[7:0]),
   .clk(CLOCK_50),
   .reset(!reset)
);

endmodule
