//============================================================================
// Host design containing A-Z80 and a few peripherials
//
// This module defines a host board to be run on an FPGA.
//
//  Copyright (C) 2014  Goran Devic
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
    inout wire [31:0] GPIO_1,
    output wire [5:0] GPIO_0
);
`default_nettype none

// Export selected pins to the extension connector
assign GPIO_1[15:0] = A[15:0];
assign GPIO_1[23:16] = D[7:0];
assign GPIO_1[31:24] = {nM1,nMREQ,nIORQ,nRD,nWR,nRFSH,nHALT,nBUSACK};

wire reset;
assign reset = locked & KEY0;

wire uart_tx;
assign UART_TXD = uart_tx;

assign GPIO_0 = A[15:10];

//assign GPIO_0[0] = reset;
//assign GPIO_0[1] = pll_clk;
//assign GPIO_0[2] = locked;
//assign GPIO_0[3] = nM1;
//assign GPIO_0[4] = nRD;
//assign GPIO_0[5] = nRFSH;

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
wire clk_pll; // Unmodified 50MHz clock
wire clk_cpu; // CPU clock of 10MHz
wire locked;

pll pll_( .locked(locked), .inclk0(CLOCK_50), .c0(clk_pll), .c1(clk_cpu) );

// ----------------- INTERNAL WIRES -----------------
wire [7:0] RamData;                     // RamData is a data writer from the RAM module
wire RamWE;
assign RamWE = nIORQ==1 && nRD==1 && nWR==0;

// Memory map:
//   0000 - 3FFF  16K RAM
assign D[7:0] = (A[15:14]=='h0 && nIORQ==1 && nRD==0 && nWR==1) ? RamData :
                {8{1'bz}};

// Memory map:
//   0000 - 3FFF  16K RAM
always @(*) // always_comb
begin
    D[7:0] = {8{1'bz}};
    case ({nIORQ,nRD,nWR})
        3'b101: begin   // Memory read
                casez (A[15:14])
                    2'b00:  D[7:0] = RamData;
                default:
                    D[7:0] = 8'h76; // HALT
                endcase
                end
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
z80_top_direct_n z80_( .*, .A(A[15:0]), .nRESET(reset), .CLK(clk_cpu) );

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Instantiate 16Kb of RAM memory
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ram ram_( .address(A[13:0]), .clock(clk_cpu), .data(D[7:0]), .wren(RamWE), .q(RamData[7:0]) );

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Instantiate UART module
// UART uses negative signalling logic, so invert control inputs
// IO Map:
//   0000 - 00FF  Write a byte to UART
//   0200 - 02FF  Get UART busy status in bit 0
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
uart_io uart_io_( .*, .reset(!reset), .clk(clk_pll), .Address(A[15:8]), .Data(D[7:0]), .IORQ(!nIORQ), .RD(!nRD), .WR(!nWR) );

endmodule
