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
// CREATED		"Tue Jun 17 18:30:13 2014"

module alu_mux_4(
	in0,
	in1,
	in2,
	in3,
	sel,
	out
);


input wire	in0;
input wire	in1;
input wire	in2;
input wire	in3;
input wire	[1:0] sel;
output wire	out;

wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;




assign	SYNTHESIZED_WIRE_4 = SYNTHESIZED_WIRE_8 & SYNTHESIZED_WIRE_9 & in0;

assign	SYNTHESIZED_WIRE_7 = sel[0] & SYNTHESIZED_WIRE_9 & in1;

assign	SYNTHESIZED_WIRE_5 = SYNTHESIZED_WIRE_8 & sel[1] & in2;

assign	SYNTHESIZED_WIRE_6 = sel[0] & sel[1] & in3;

assign	out = SYNTHESIZED_WIRE_4 | SYNTHESIZED_WIRE_5 | SYNTHESIZED_WIRE_6 | SYNTHESIZED_WIRE_7;

assign	SYNTHESIZED_WIRE_8 =  ~sel[0];

assign	SYNTHESIZED_WIRE_9 =  ~sel[1];


endmodule
