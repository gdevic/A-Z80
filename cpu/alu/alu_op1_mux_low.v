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
// CREATED		"Sun May 18 16:11:05 2014"

module alu_op1_mux_low(
	sel_kk,
	sel_ll,
	sel_jj,
	jj,
	ll,
	ena_out,
	Q
);


input wire	sel_kk;
input wire	sel_ll;
input wire	sel_jj;
input wire	[3:0] jj;
input wire	[3:0] ll;
output wire	ena_out;
output wire	[3:0] Q;

wire	[3:0] SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	[3:0] SYNTHESIZED_WIRE_2;
wire	[3:0] SYNTHESIZED_WIRE_3;




assign	SYNTHESIZED_WIRE_3 = ll & {sel_ll,sel_ll,sel_ll,sel_ll};

assign	Q = SYNTHESIZED_WIRE_0 & {SYNTHESIZED_WIRE_1,SYNTHESIZED_WIRE_1,SYNTHESIZED_WIRE_1,SYNTHESIZED_WIRE_1};

assign	SYNTHESIZED_WIRE_1 =  ~sel_kk;

assign	SYNTHESIZED_WIRE_0 = SYNTHESIZED_WIRE_2 | SYNTHESIZED_WIRE_3;

assign	SYNTHESIZED_WIRE_2 = jj & {sel_jj,sel_jj,sel_jj,sel_jj};

assign	ena_out = sel_jj | sel_kk | sel_ll;


endmodule
