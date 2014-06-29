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
// CREATED		"Sun Jun 29 14:03:25 2014"

module alu_control(
	alu_shift_db0,
	alu_shift_db7,
	ctl_shift_en,
	shift_cf_in,
	alu_low_gt_9,
	alu_high_gt_9,
	alu_high_eq_9,
	ctl_daa_66,
	ctl_daa_oe,
	flags_cf,
	flags_hf,
	op543,
	alu_shift_in,
	alu_shift_right,
	alu_shift_left,
	shift_cf_out,
	db
);


input wire	alu_shift_db0;
input wire	alu_shift_db7;
input wire	ctl_shift_en;
input wire	shift_cf_in;
input wire	alu_low_gt_9;
input wire	alu_high_gt_9;
input wire	alu_high_eq_9;
input wire	ctl_daa_66;
input wire	ctl_daa_oe;
input wire	flags_cf;
input wire	flags_hf;
input wire	[2:0] op543;
output wire	alu_shift_in;
output wire	alu_shift_right;
output wire	alu_shift_left;
output wire	shift_cf_out;
output wire	[7:0] db;

wire	hf;
wire	[7:0] out;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_14;

assign	SYNTHESIZED_WIRE_19 = 0;
assign	SYNTHESIZED_WIRE_14 = 1;





assign	db[7] = ctl_daa_oe ? out[7] : 1'bz;
assign	db[6] = ctl_daa_oe ? out[6] : 1'bz;
assign	db[5] = ctl_daa_oe ? out[5] : 1'bz;
assign	db[4] = ctl_daa_oe ? out[4] : 1'bz;
assign	db[3] = ctl_daa_oe ? out[3] : 1'bz;
assign	db[2] = ctl_daa_oe ? out[2] : 1'bz;
assign	db[1] = ctl_daa_oe ? out[1] : 1'bz;
assign	db[0] = ctl_daa_oe ? out[0] : 1'bz;

assign	alu_shift_right = ctl_shift_en & op543[0];

assign	out[5] =  ~SYNTHESIZED_WIRE_16;

assign	out[6] =  ~SYNTHESIZED_WIRE_16;

assign	alu_shift_left = ctl_shift_en & SYNTHESIZED_WIRE_2;

assign	SYNTHESIZED_WIRE_17 = hf | alu_low_gt_9;

assign	SYNTHESIZED_WIRE_5 = SYNTHESIZED_WIRE_17 & alu_high_eq_9;

assign	SYNTHESIZED_WIRE_4 = flags_cf | alu_high_gt_9;

assign	SYNTHESIZED_WIRE_9 = SYNTHESIZED_WIRE_4 | SYNTHESIZED_WIRE_5;

assign	SYNTHESIZED_WIRE_7 = alu_shift_db0 & op543[0];

assign	SYNTHESIZED_WIRE_8 = alu_shift_db7 & SYNTHESIZED_WIRE_6;

assign	shift_cf_out = SYNTHESIZED_WIRE_7 | SYNTHESIZED_WIRE_8;

assign	SYNTHESIZED_WIRE_16 = ~(SYNTHESIZED_WIRE_9 | ctl_daa_66);

assign	SYNTHESIZED_WIRE_18 = ~(SYNTHESIZED_WIRE_17 | ctl_daa_66);

assign	out[1] =  ~SYNTHESIZED_WIRE_18;

assign	out[2] =  ~SYNTHESIZED_WIRE_18;


alu_mux_8	b2v_inst_shift_mux(
	.in0(alu_shift_db7),
	.in1(alu_shift_db0),
	.in2(shift_cf_in),
	.in3(shift_cf_in),
	.in4(SYNTHESIZED_WIRE_19),
	.in5(alu_shift_db7),
	.in6(SYNTHESIZED_WIRE_14),
	.in7(SYNTHESIZED_WIRE_19),
	.sel(op543),
	.out(alu_shift_in));

assign	SYNTHESIZED_WIRE_2 =  ~op543[0];

assign	SYNTHESIZED_WIRE_6 =  ~op543[0];


assign	hf = flags_hf;
assign	out[0] = 0;
assign	out[3] = 0;
assign	out[4] = 0;
assign	out[7] = 0;

endmodule
