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
// CREATED		"Wed Jul 02 19:50:06 2014"

module alu_control(
	alu_shift_db0,
	alu_shift_db7,
	ctl_shift_en,
	alu_low_gt_9,
	alu_high_gt_9,
	alu_high_eq_9,
	ctl_daa_66,
	ctl_daa_oe,
	flags_hf,
	ctl_alu_op_low,
	alu_parity_out,
	flags_cf,
	flags_zf,
	flags_pf,
	flags_sf,
	ctl_cond_short,
	alu_vf_out,
	iff2,
	address_is_1,
	ctl_pf_sel,
	op543,
	alu_shift_in,
	alu_shift_right,
	alu_shift_left,
	shift_cf_out,
	alu_parity_in,
	flags_cond_true,
	daa_cf_out,
	pf_sel,
	db
);


input wire	alu_shift_db0;
input wire	alu_shift_db7;
input wire	ctl_shift_en;
input wire	alu_low_gt_9;
input wire	alu_high_gt_9;
input wire	alu_high_eq_9;
input wire	ctl_daa_66;
input wire	ctl_daa_oe;
input wire	flags_hf;
input wire	ctl_alu_op_low;
input wire	alu_parity_out;
input wire	flags_cf;
input wire	flags_zf;
input wire	flags_pf;
input wire	flags_sf;
input wire	ctl_cond_short;
input wire	alu_vf_out;
input wire	iff2;
input wire	address_is_1;
input wire	[1:0] ctl_pf_sel;
input wire	[2:0] op543;
output wire	alu_shift_in;
output wire	alu_shift_right;
output wire	alu_shift_left;
output wire	shift_cf_out;
output wire	alu_parity_in;
output wire	flags_cond_true;
output wire	daa_cf_out;
output wire	pf_sel;
output wire	[7:0] db;

wire	flags_cf_int;
wire	[7:0] out;
wire	[2:0] sel;
reg	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_25;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_21;

assign	daa_cf_out = SYNTHESIZED_WIRE_11;
assign	SYNTHESIZED_WIRE_26 = 0;
assign	SYNTHESIZED_WIRE_21 = 1;





assign	db[7] = ctl_daa_oe ? out[7] : 1'bz;
assign	db[6] = ctl_daa_oe ? out[6] : 1'bz;
assign	db[5] = ctl_daa_oe ? out[5] : 1'bz;
assign	db[4] = ctl_daa_oe ? out[4] : 1'bz;
assign	db[3] = ctl_daa_oe ? out[3] : 1'bz;
assign	db[2] = ctl_daa_oe ? out[2] : 1'bz;
assign	db[1] = ctl_daa_oe ? out[1] : 1'bz;
assign	db[0] = ctl_daa_oe ? out[0] : 1'bz;

assign	alu_shift_right = ctl_shift_en & op543[0];

assign	alu_parity_in = SYNTHESIZED_WIRE_0 & SYNTHESIZED_WIRE_1;

assign	sel[2] = op543[2] & SYNTHESIZED_WIRE_2;

assign	sel[0] = op543[0];


assign	sel[1] = op543[1];


assign	out[1] = SYNTHESIZED_WIRE_23;


assign	out[2] = SYNTHESIZED_WIRE_23;


assign	out[5] = SYNTHESIZED_WIRE_24;


assign	out[6] = SYNTHESIZED_WIRE_24;


assign	alu_shift_left = ctl_shift_en & SYNTHESIZED_WIRE_7;

assign	SYNTHESIZED_WIRE_25 = flags_hf | alu_low_gt_9;

assign	SYNTHESIZED_WIRE_12 = SYNTHESIZED_WIRE_25 & alu_high_eq_9;

assign	SYNTHESIZED_WIRE_23 = SYNTHESIZED_WIRE_25 | ctl_daa_66;

assign	SYNTHESIZED_WIRE_11 = flags_cf_int | alu_high_gt_9;

assign	SYNTHESIZED_WIRE_24 = SYNTHESIZED_WIRE_10 | ctl_daa_66;

assign	SYNTHESIZED_WIRE_10 = SYNTHESIZED_WIRE_11 | SYNTHESIZED_WIRE_12;

assign	SYNTHESIZED_WIRE_14 = alu_shift_db0 & op543[0];

assign	SYNTHESIZED_WIRE_15 = alu_shift_db7 & SYNTHESIZED_WIRE_13;

assign	shift_cf_out = SYNTHESIZED_WIRE_14 | SYNTHESIZED_WIRE_15;


alu_mux_8	b2v_inst_cond_mux(
	.in0(SYNTHESIZED_WIRE_16),
	.in1(flags_zf),
	.in2(SYNTHESIZED_WIRE_17),
	.in3(flags_cf_int),
	.in4(SYNTHESIZED_WIRE_18),
	.in5(flags_pf),
	.in6(SYNTHESIZED_WIRE_19),
	.in7(flags_sf),
	.sel(sel),
	.out(flags_cond_true));


alu_mux_4	b2v_inst_pf_sel(
	.in0(alu_parity_out),
	.in1(alu_vf_out),
	.in2(iff2),
	.in3(address_is_1),
	.sel(ctl_pf_sel),
	.out(pf_sel));


alu_mux_8	b2v_inst_shift_mux(
	.in0(alu_shift_db7),
	.in1(alu_shift_db0),
	.in2(flags_cf_int),
	.in3(flags_cf_int),
	.in4(SYNTHESIZED_WIRE_26),
	.in5(alu_shift_db7),
	.in6(SYNTHESIZED_WIRE_21),
	.in7(SYNTHESIZED_WIRE_26),
	.sel(op543),
	.out(alu_shift_in));


always@(ctl_alu_op_low or alu_parity_out)
begin
if (ctl_alu_op_low)
	SYNTHESIZED_WIRE_0 <= alu_parity_out;
end

assign	SYNTHESIZED_WIRE_7 =  ~op543[0];

assign	SYNTHESIZED_WIRE_13 =  ~op543[0];

assign	SYNTHESIZED_WIRE_1 =  ~ctl_alu_op_low;

assign	SYNTHESIZED_WIRE_16 =  ~flags_zf;

assign	SYNTHESIZED_WIRE_17 =  ~flags_cf_int;

assign	SYNTHESIZED_WIRE_18 =  ~flags_pf;

assign	SYNTHESIZED_WIRE_19 =  ~flags_sf;

assign	SYNTHESIZED_WIRE_2 =  ~ctl_cond_short;


assign	flags_cf_int = flags_cf;
assign	out[3] = 0;
assign	out[0] = 0;
assign	out[4] = 0;
assign	out[7] = 0;

endmodule
