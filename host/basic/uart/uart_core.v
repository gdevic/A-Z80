//============================================================================
// Module uart
//
// This module implements RS232 (UART) transmitter block
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
module uart_core #(parameter BAUD = 115200)
(
    input wire clk,                    // Input clock that drives the execution
    input wire reset,                  // Async positive edge reset
    input wire [7:0] data_in,          // Byte to transmit
    input wire data_in_wr,             // Signal to accept a byte to transmit

    output reg uart_tx,                // UART transmit wire
    output reg busy_tx                 // Signal that we are busy transmitting
);

//============================================================================
// Define internal registers and states
//============================================================================
`define COUNT  (50000000/BAUD)          // Given 50MHz input, determine the proper divisor for a given BAUD rate
integer baud_count = `COUNT;            // Counter for clock divide down to meet the BAUD rate

reg [7:0] data;                         // Stores a byte to transmit

//============================================================================
// State and cycle change logic
//============================================================================

parameter
    IDLE = 4'd0,
    START = 4'd1,
    D0 = 4'd2,
    D1 = 4'd3,
    D2 = 4'd4,
    D3 = 4'd5,
    D4 = 4'd6,
    D5 = 4'd7,
    D6 = 4'd8,
    D7 = 4'd9,
    STOP = 4'd10,
    BRK1 = 4'd11;

reg [3:0] state = IDLE, next_state = IDLE;

// Present state logic
always @(posedge clk or posedge reset)
begin
   if (reset) begin
      state <= IDLE;
      baud_count <= `COUNT;
   end else begin
      baud_count <= baud_count - 1;
      if (baud_count==0) begin
         state <= next_state;
         baud_count <= `COUNT;
      end
   end
end

// Next state logic
always @(posedge clk)
begin
   case (state)
      IDLE  :   if (data_in_wr) begin
                    next_state <= START;
                    data <= data_in;
                end
      START :   next_state <= D0;
      D0    :   next_state <= D1;
      D1    :   next_state <= D2;
      D2    :   next_state <= D3;
      D3    :   next_state <= D4;
      D4    :   next_state <= D5;
      D5    :   next_state <= D6;
      D6    :   next_state <= D7;
      D7    :   next_state <= STOP;
      STOP  :   next_state <= BRK1; // BRK bit is providing necessary space between characters
      BRK1  :   next_state <= IDLE;
   endcase
   // Make it 'busy' if we are not idling or if the new data is being written
   busy_tx <= (state==IDLE && next_state==IDLE) ? 1'h0 | data_in_wr : 1'h1;
end

always @(*) // always_comb
begin
   case (state)
      START :   uart_tx = 'b0;       // Start bit is low (start detect is neg edge)
      D0    :   uart_tx = data[0];   // Followed by 8 data bits
      D1    :   uart_tx = data[1];
      D2    :   uart_tx = data[2];
      D3    :   uart_tx = data[3];
      D4    :   uart_tx = data[4];
      D5    :   uart_tx = data[5];
      D6    :   uart_tx = data[6];
      D7    :   uart_tx = data[7];
      STOP, BRK1 : uart_tx = 'b1;    // "Stop" and "break" bits are high
      default : uart_tx = 'b1;       // By default, keep the data line high
   endcase
end

endmodule
