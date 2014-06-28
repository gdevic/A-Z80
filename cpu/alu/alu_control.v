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
// CREATED		"Sat Jun 28 09:15:39 2014"

module alu_control(
	alu_shift_db0,
	alu_shift_db7,
	ctl_shift_en,
	shift_cf_in,
	op543,
	alu_shift_in,
	alu_shift_right,
	alu_shift_left,
	shift_cf_out
);


input wire	alu_shift_db0;
input wire	alu_shift_db7;
input wire	ctl_shift_en;
input wire	shift_cf_in;
input wire	[2:0] op543;
output wire	alu_shift_in;
output wire	alu_shift_right;
output wire	alu_shift_left;
output wire	shift_cf_out;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_5;

assign	SYNTHESIZED_WIRE_7 = 0;
assign	SYNTHESIZED_WIRE_5 = 1;




assign	alu_shift_right = ctl_shift_en & op543[0];

assign	alu_shift_left = ctl_shift_en & SYNTHESIZED_WIRE_0;

assign	SYNTHESIZED_WIRE_2 = alu_shift_db0 & op543[0];

assign	SYNTHESIZED_WIRE_3 = alu_shift_db7 & SYNTHESIZED_WIRE_1;

assign	shift_cf_out = SYNTHESIZED_WIRE_2 | SYNTHESIZED_WIRE_3;


alu_mux_8	b2v_inst_shift_mux(
	.in0(alu_shift_db7),
	.in1(alu_shift_db0),
	.in2(shift_cf_in),
	.in3(shift_cf_in),
	.in4(SYNTHESIZED_WIRE_7),
	.in5(alu_shift_db7),
	.in6(SYNTHESIZED_WIRE_5),
	.in7(SYNTHESIZED_WIRE_7),
	.sel(op543),
	.out(alu_shift_in));

assign	SYNTHESIZED_WIRE_0 =  ~op543[0];

assign	SYNTHESIZED_WIRE_1 =  ~op543[0];



endmodule
