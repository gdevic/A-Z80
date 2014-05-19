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
// CREATED		"Mon May 19 01:17:31 2014"

module alu_zero(
	a,
	b,
	zero,
	parity
);


input wire	[3:0] a;
input wire	[3:0] b;
output wire	zero;
output wire	parity;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;




assign	SYNTHESIZED_WIRE_3 = ~(a[2] | a[3] | a[1] | a[0]);

assign	SYNTHESIZED_WIRE_7 = SYNTHESIZED_WIRE_0 ^ a[1];

assign	SYNTHESIZED_WIRE_0 = a[3] ^ a[2];

assign	parity = SYNTHESIZED_WIRE_1 ^ SYNTHESIZED_WIRE_2;

assign	SYNTHESIZED_WIRE_4 = ~(b[2] | b[3] | b[1] | b[0]);

assign	zero = SYNTHESIZED_WIRE_3 & SYNTHESIZED_WIRE_4;

assign	SYNTHESIZED_WIRE_5 = b[1] ^ b[0];

assign	SYNTHESIZED_WIRE_6 = b[2] ^ SYNTHESIZED_WIRE_5;

assign	SYNTHESIZED_WIRE_2 = b[3] ^ SYNTHESIZED_WIRE_6;

assign	SYNTHESIZED_WIRE_1 = SYNTHESIZED_WIRE_7 ^ a[0];


endmodule
