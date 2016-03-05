//============================================================================
// Host design containing A-Z80 and a few peripherials
//
// This module does not define a physical board but is only meant to be
// compiled within the ModelSim host test.
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
    input wire clk,
    input wire reset,
    input wire nint,
    input wire nnmi,
    output wire uart_tx
);

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
wire nINT = nint;
wire nNMI = nnmi;
wire nBUSRQ = 1;

wire [15:0] A;
wire [7:0] D;

// ----------------- INTERNAL WIRES -----------------
wire [7:0] RamData;                     // RamData is a data writer from the RAM module
wire RamWE;
assign RamWE = nIORQ==1 && nRD==1 && nWR==0;

wire uart_busy;
wire UartWE = nIORQ==0 && nRD==1 && nWR==0;

// Memory map:
//   0000 - 3FFF  16K RAM
assign D[7:0] = (A[15:14]=='h0 && nIORQ==1 && nRD==0 && nWR==1) ? RamData :
                (nIORQ==0 && nRD==1 && nWR==1) ? 8'h80 :
                (nIORQ==0 && nRD==0 && nWR==1) ? {7'h0,uart_busy} :
                {8{1'bz}};

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Instantiate A-Z80 CPU module
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
z80_top_direct_n z80_( .*, .nRESET(reset), .CLK(clk) );

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Instantiate 16Kb of RAM memory
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ram ram_( .address(A[13:0]), .clock(clk), .data(D[7:0]), .wren(RamWE), .q(RamData[7:0]) );

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Instantiate UART module
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
uart #( .BAUD(115200), .IN_CLOCK(10000000) ) uart_(
   // Outputs
   .busy(uart_busy),
   .uart_tx(uart_tx),
   // Inputs
   .wr(UartWE),
   .data(D[7:0]),
   .clk(clk),
   .reset(!reset)
);

endmodule
