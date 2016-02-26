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

    inout wire [7:0] GPIO_0,    // Test points
    output wire [7:0] GPIO_1,
    output wire [7:0] GPIO_2,
    inout wire [7:0] GPIO_3
);
`default_nettype none

// Export selected pins to the extension connector
assign GPIO_0[7:0] = A[7:0];
assign GPIO_1[7:0] = A[15:8];
assign GPIO_2[7:0] = D[7:0];
assign GPIO_3 = {reset, uart_tx, nM1, nMREQ, nRFSH, nHALT, nBUSACK};

// Basic wires and the reset logic
wire uart_tx;
wire reset;
wire locked;

assign reset = locked & ~KEY0;
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
wire nINT = ~KEY1;
wire nNMI = ~KEY2;

wire [15:0] A;
reg [7:0] D;

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Instantiate PLL
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
wire pll_clk;
//wire clk_cpu; // CPU clock of 10MHz
wire clk_uart; // 50MHz clock for UART

clock pll ( .CLK_IN1(CLOCK_100), .CLK_OUT1(pll_clk), .CLK_OUT2(clk_uart), .LOCKED(locked) );

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Generate the CPU clock by dividing input clock by a factor of a power of 2
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
reg clk_cpu = 0;                        // Final CPU clock
// Note: In order to test at 3.5 MHz, the PLL needs to be set to generate 14 MHz
// and then this divider-by-4 brings the effective clock down to 3.5 MHz
reg [0:0] counter = 0;                  // Clock divider counter

always @(posedge pll_clk)
begin
    if (counter==1'b0)
        clk_cpu <= ~clk_cpu;
    counter <= counter - 1'b1;
end

// ----------------- INTERNAL WIRES -----------------
wire [7:0] RomData; // Data writer from the ROM module
wire [7:0] RamData; // Data writer from the RAM module
wire [7:0] UartData = D;
wire [7:0] CpuData = D;

wire RamWE;
assign RamWE = nIORQ==1 && nRD==1 && nWR==0;

// Memory map:
//   0000 - 01FF  512b ROM
//   0200 - 03FF  512b RAM
//   <repeats>
always @(*) // always_comb
begin
    case ({nIORQ,nRD,nWR})
        // -------------------------------- Memory read --------------------------------
        3'b101: begin
                casez (A[9])
                    1'b0:  D[7:0] = RomData;
                    1'b1:  D[7:0] = RamData;
                default:
                    D[7:0] = 8'h76; // HALT
                endcase
            end
        3'bX10: D[7:0] = CpuData;
        // ---------------------------------- IO read ----------------------------------
        3'b001: D[7:0] = UartData;
        // IO read *** Interrupts test ***
        // This value will be pushed on the data bus on an IORQ access which
        // means that:
        // In IM0: this is the opcode of an instruction to execute, set it to 0xFF
        // In IM2: this is a vector, set it to 0x80 (to correspond to a test program Hello World)
        3'b011: D[7:0] = 8'h80;
    default:
        D[7:0] = {8{1'bz}};
    endcase
    if (nRFSH==0)
        D[7:0] = CpuData;
end

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
    .D (CpuData)
);

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Instantiate 512 bytes of ROM memory
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
rom rom_(
  .clka(clk_cpu),
  .addra(A[8:0]),
  .douta(RomData)
);

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Instantiate 512 bytes of RAM memory
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ram ram_(
    .addra(A[8:0]),
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
    .Data(UartData),
    .IORQ(!nIORQ),
    .RD(!nRD),
    .WR(!nWR),
    .uart_tx(uart_tx)
);

endmodule
