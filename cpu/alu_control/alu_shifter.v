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
// CREATED		"Tue May 20 15:54:44 2014"

module alu_shifter(
	shift_enable,
	shift_in,
	db,
	op543,
	shift_out,
	db_in_high,
	db_in_low
);


input wire	shift_enable;
input wire	shift_in;
input wire	[7:0] db;
input wire	[2:0] op543;
output wire	shift_out;
output wire	[3:0] db_in_high;
output wire	[3:0] db_in_low;

wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_6;

assign	SYNTHESIZED_WIRE_8 = 0;
assign	SYNTHESIZED_WIRE_4 = 1;





alu_mux_8	b2v_inst1(
	.in0(SYNTHESIZED_WIRE_7),
	.in1(SYNTHESIZED_WIRE_1),
	.in2(shift_in),
	.in3(shift_in),
	.in4(SYNTHESIZED_WIRE_8),
	.in5(SYNTHESIZED_WIRE_7),
	.in6(SYNTHESIZED_WIRE_4),
	.in7(SYNTHESIZED_WIRE_8),
	.sel(op543),
	.out(SYNTHESIZED_WIRE_6));

assign	SYNTHESIZED_WIRE_1 = db[0];


assign	SYNTHESIZED_WIRE_7 = db[7];



alu_shifter_core	b2v_shifter_core_inst(
	.shift_in(SYNTHESIZED_WIRE_6),
	.shift_right(op543[0]),
	.shift_enable(shift_enable),
	.db(db),
	.shift_out(shift_out),
	.out_high(db_in_high),
	.out_low(db_in_low));



endmodule
