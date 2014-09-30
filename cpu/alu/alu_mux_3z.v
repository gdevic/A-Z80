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
// CREATED		"Tue Sep 30 08:25:13 2014"

module alu_mux_3z(
	sel_zero,
	sel_a,
	sel_b,
	nclk,
	a,
	b,
	ena_out,
	Q
);


input wire	sel_zero;
input wire	sel_a;
input wire	sel_b;
input wire	nclk;
input wire	[3:0] a;
input wire	[3:0] b;
output wire	ena_out;
output wire	[3:0] Q;

wire	SYNTHESIZED_WIRE_0;
wire	[3:0] SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	[3:0] SYNTHESIZED_WIRE_3;
wire	[3:0] SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;




assign	SYNTHESIZED_WIRE_4 = a & {sel_a,sel_a,sel_a,sel_a};

assign	ena_out = SYNTHESIZED_WIRE_0 | sel_zero;

assign	Q = SYNTHESIZED_WIRE_1 & {SYNTHESIZED_WIRE_2,SYNTHESIZED_WIRE_2,SYNTHESIZED_WIRE_2,SYNTHESIZED_WIRE_2};

assign	SYNTHESIZED_WIRE_2 =  ~sel_zero;

assign	SYNTHESIZED_WIRE_1 = SYNTHESIZED_WIRE_3 | SYNTHESIZED_WIRE_4;

assign	SYNTHESIZED_WIRE_0 = SYNTHESIZED_WIRE_5 & nclk;

assign	SYNTHESIZED_WIRE_5 = sel_b | sel_a;

assign	SYNTHESIZED_WIRE_3 = b & {sel_b,sel_b,sel_b,sel_b};


endmodule
