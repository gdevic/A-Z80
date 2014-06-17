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
// CREATED		"Mon Jun 16 23:44:08 2014"

module alu_prep_flags(
	parity_in,
	high,
	low,
	zero,
	parity_out,
	xf,
	yf,
	sf
);


input wire	parity_in;
input wire	[3:0] high;
input wire	[3:0] low;
output wire	zero;
output wire	parity_out;
output wire	xf;
output wire	yf;
output wire	sf;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;




assign	parity_out = SYNTHESIZED_WIRE_0 ^ high[0];

assign	SYNTHESIZED_WIRE_0 = SYNTHESIZED_WIRE_1 ^ high[1];

assign	SYNTHESIZED_WIRE_1 = SYNTHESIZED_WIRE_2 ^ high[2];

assign	SYNTHESIZED_WIRE_2 = parity_in ^ high[3];

assign	SYNTHESIZED_WIRE_3 = ~(high[2] | high[3] | high[1] | high[0]);

assign	SYNTHESIZED_WIRE_4 = ~(low[2] | low[3] | low[1] | low[0]);

assign	zero = SYNTHESIZED_WIRE_3 & SYNTHESIZED_WIRE_4;

assign	xf = low[3];
assign	yf = high[1];
assign	sf = high[3];

endmodule
