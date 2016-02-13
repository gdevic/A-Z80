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
    input wire CLOCK_100,
    input wire KEY0,            // KEY0 is reset
    input wire KEY1,            // KEY1 generates a maskable interrupt (INT)
    input wire KEY2,            // KEY2 generates a non-maskable interrupt (NMI)
    output wire UART_TXD,
    inout wire [7:0] GPIO_0,
    output wire [7:0] GPIO_1,
    output wire [7:0] GPIO_2,
    inout wire [7:0] GPIO_3
);
//`default_nettype none

// Export selected pins to the extension connector
assign GPIO_0[7:0] = A[7:0];
assign GPIO_1[7:0] = A[15:8];
assign GPIO_2[7:0] = D[7:0];

wire reset;
assign reset = KEY0;

wire uart_tx;
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

assign GPIO_3 = {nM1, nMREQ, nRFSH, nHALT, nBUSACK};

reg nWAIT = 1;
reg nBUSRQ = 1;
wire nINT;
assign nINT = KEY1;
wire nNMI;
assign nNMI = KEY2;

wire [15:0] A;
wire [7:0] D;

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Instantiate PLL
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
wire clk_cpu; // CPU clock of 10MHz
wire clk_uart; // 50MHz clock for UART

clock pll (
    .CLK_IN1(CLOCK_100),
    .CLK_OUT1(clk_cpu), // 10 MHz
    .CLK_OUT2(clk_uart) // 50 MHz
);

// ----------------- INTERNAL regS -----------------
wire [7:0] RamData;                     // RamData is a data writer from the RAM module
wire RamWE;
assign RamWE = nIORQ==1 && nRD==1 && nWR==0;

// Memory map:
//   0000 - 3FFF  16K RAM
//   <alias RAM> x 4
assign D[7:0] = {nIORQ,nRD,nWR}==3'b101 ? RamData :
                {8{1'bz}};

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Instantiate A-Z80 CPU module
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
z80_top_direct_n z80_(
    .nM1 (nM1),
    .nMREQ (nMREQ),
    .nIORQ (nIORQ),
    .nRD (nRD),
    .nWR (nWR),
    .nRFSH (nRFSH),
    .nHALT (nHALT),
    .nBUSACK (nBUSACK),

    .nWAIT (nWAIT),
    .nINT (nINT),
    .nNMI (nNMI),
    .nRESET (reset),
    .nBUSRQ (nBUSRQ),

    .CLK (clk_cpu),
    .A (A),
    .D (D)
);

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Instantiate 16Kb of RAM memory
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ram ram_(
    .addra(A[13:0]),
    .clka(clk_cpu),
    .dina(D),
    .wea(RamWE),
    .douta(RamData)
);

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Instantiate UART module
// UART uses negative signalling logic, so invert control inputs
// IO Map:
//   0000 - 00FF  Write a byte to UART
//   0200 - 02FF  Get UART busy status in bit 0
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
uart_io uart_io_(
    .reset(!reset),
    .clk(clk_uart),
    .Address(A[15:8]),
    .Data(D),
    .IORQ(!nIORQ),
    .RD(!nRD),
    .WR(!nWR),
    .uart_tx(uart_tx)
);

endmodule
