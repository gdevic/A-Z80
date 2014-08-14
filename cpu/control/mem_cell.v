// Copyright (C) 1991-2011 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.

// PROGRAM		"Quartus II 64-Bit"
// VERSION		"Version 11.0 Build 208 07/03/2011 Service Pack 1 SJ Full Version"
// CREATED		"Thu Aug 14 07:20:36 2014"

module mem_cell(
	we,
	clk,
	D,
	reset,
	Q
);


input wire	we;
input wire	clk;
input wire	D;
input wire	reset;
output reg	Q;

wire	SYNTHESIZED_WIRE_5;
reg	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_4;

assign	SYNTHESIZED_WIRE_2 = 1;
assign	SYNTHESIZED_WIRE_4 = 1;



assign	SYNTHESIZED_WIRE_5 =  ~reset;




always@(SYNTHESIZED_WIRE_5 or SYNTHESIZED_WIRE_2 or clk or SYNTHESIZED_WIRE_1)
begin
if (~SYNTHESIZED_WIRE_5)
		Q <= 1'b0;
else if (~SYNTHESIZED_WIRE_2)
		Q <= 1'b1;
else if (clk)
	Q <= SYNTHESIZED_WIRE_1;
end


always@(SYNTHESIZED_WIRE_5 or SYNTHESIZED_WIRE_4 or we or D)
begin
if (~SYNTHESIZED_WIRE_5)
		SYNTHESIZED_WIRE_1 <= 1'b0;
else if (~SYNTHESIZED_WIRE_4)
		SYNTHESIZED_WIRE_1 <= 1'b1;
else if (we)
	SYNTHESIZED_WIRE_1 <= D;
end


endmodule
