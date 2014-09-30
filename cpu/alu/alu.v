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
// CREATED		"Tue Sep 30 08:05:39 2014"

module alu(
	alu_core_R,
	alu_core_V,
	alu_core_S,
	alu_bs_oe,
	alu_parity_in,
	alu_oe,
	alu_shift_oe,
	alu_core_cf_in,
	alu_op2_oe,
	alu_op1_oe,
	alu_res_oe,
	alu_op1_sel_low,
	alu_op1_sel_zero,
	alu_op1_sel_bus,
	alu_op2_sel_zero,
	alu_op2_sel_bus,
	alu_op2_sel_lq,
	alu_op_low,
	alu_shift_in,
	alu_sel_op2_neg,
	alu_sel_op2_high,
	alu_shift_left,
	alu_shift_right,
	nclk,
	bsel,
	alu_zero,
	alu_parity_out,
	alu_high_eq_9,
	alu_high_gt_9,
	alu_low_gt_9,
	alu_shift_db0,
	alu_shift_db7,
	alu_core_cf_out,
	alu_sf_out,
	alu_yf_out,
	alu_xf_out,
	alu_vf_out,
	db,
	test_db_high,
	test_db_low
);


input wire	alu_core_R;
input wire	alu_core_V;
input wire	alu_core_S;
input wire	alu_bs_oe;
input wire	alu_parity_in;
input wire	alu_oe;
input wire	alu_shift_oe;
input wire	alu_core_cf_in;
input wire	alu_op2_oe;
input wire	alu_op1_oe;
input wire	alu_res_oe;
input wire	alu_op1_sel_low;
input wire	alu_op1_sel_zero;
input wire	alu_op1_sel_bus;
input wire	alu_op2_sel_zero;
input wire	alu_op2_sel_bus;
input wire	alu_op2_sel_lq;
input wire	alu_op_low;
input wire	alu_shift_in;
input wire	alu_sel_op2_neg;
input wire	alu_sel_op2_high;
input wire	alu_shift_left;
input wire	alu_shift_right;
input wire	nclk;
input wire	[2:0] bsel;
output wire	alu_zero;
output wire	alu_parity_out;
output wire	alu_high_eq_9;
output wire	alu_high_gt_9;
output wire	alu_low_gt_9;
output wire	alu_shift_db0;
output wire	alu_shift_db7;
output wire	alu_core_cf_out;
output wire	alu_sf_out;
output wire	alu_yf_out;
output wire	alu_xf_out;
output wire	alu_vf_out;
inout wire	[7:0] db;
output wire	[3:0] test_db_high;
output wire	[3:0] test_db_low;

wire	[3:0] alu_op1;
wire	[3:0] alu_op2;
wire	[3:0] db_high;
wire	[3:0] db_low;
reg	[3:0] op1_high;
reg	[3:0] op1_low;
reg	[3:0] op2_high;
reg	[3:0] op2_low;
wire	[3:0] result_hi;
reg	[3:0] result_lo;
wire	[3:0] SYNTHESIZED_WIRE_0;
wire	[3:0] SYNTHESIZED_WIRE_1;
wire	[3:0] SYNTHESIZED_WIRE_2;
wire	[3:0] SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_32;
wire	[3:0] SYNTHESIZED_WIRE_5;
wire	[3:0] SYNTHESIZED_WIRE_7;
wire	[3:0] SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	[3:0] SYNTHESIZED_WIRE_10;
wire	[3:0] SYNTHESIZED_WIRE_11;
wire	[3:0] SYNTHESIZED_WIRE_12;
wire	[3:0] SYNTHESIZED_WIRE_13;
wire	[3:0] SYNTHESIZED_WIRE_14;
wire	[3:0] SYNTHESIZED_WIRE_15;
wire	[3:0] SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
wire	[3:0] SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_20;
wire	[3:0] SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_22;
wire	[3:0] SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_24;
wire	[3:0] SYNTHESIZED_WIRE_25;
wire	SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_29;
wire	[3:0] SYNTHESIZED_WIRE_30;
wire	[3:0] SYNTHESIZED_WIRE_31;




assign	db_low[3] = alu_bs_oe ? SYNTHESIZED_WIRE_0[3] : 1'bz;
assign	db_low[2] = alu_bs_oe ? SYNTHESIZED_WIRE_0[2] : 1'bz;
assign	db_low[1] = alu_bs_oe ? SYNTHESIZED_WIRE_0[1] : 1'bz;
assign	db_low[0] = alu_bs_oe ? SYNTHESIZED_WIRE_0[0] : 1'bz;

assign	db_high[3] = alu_bs_oe ? SYNTHESIZED_WIRE_1[3] : 1'bz;
assign	db_high[2] = alu_bs_oe ? SYNTHESIZED_WIRE_1[2] : 1'bz;
assign	db_high[1] = alu_bs_oe ? SYNTHESIZED_WIRE_1[1] : 1'bz;
assign	db_high[0] = alu_bs_oe ? SYNTHESIZED_WIRE_1[0] : 1'bz;


alu_core	b2v_core(
	.cy_in(alu_core_cf_in),
	.S(alu_core_S),
	.V(alu_core_V),
	.R(alu_core_R),
	.op1(alu_op1),
	.op2(alu_op2),
	.cy_out(alu_core_cf_out),
	.vf_out(alu_vf_out),
	.result(result_hi));

assign	db[3] = alu_oe ? db_low[3] : 1'bz;
assign	db[2] = alu_oe ? db_low[2] : 1'bz;
assign	db[1] = alu_oe ? db_low[1] : 1'bz;
assign	db[0] = alu_oe ? db_low[0] : 1'bz;

assign	db[7] = alu_oe ? db_high[3] : 1'bz;
assign	db[6] = alu_oe ? db_high[2] : 1'bz;
assign	db[5] = alu_oe ? db_high[1] : 1'bz;
assign	db[4] = alu_oe ? db_high[0] : 1'bz;


alu_bit_select	b2v_input_bit_select(
	.bsel(bsel),
	.bs_out_high(SYNTHESIZED_WIRE_1),
	.bs_out_low(SYNTHESIZED_WIRE_0));


alu_shifter_core	b2v_input_shift(
	.shift_in(alu_shift_in),
	.shift_left(alu_shift_left),
	.shift_right(alu_shift_right),
	.db(db),
	.shift_db0(alu_shift_db0),
	.shift_db7(alu_shift_db7),
	.out_high(SYNTHESIZED_WIRE_31),
	.out_low(SYNTHESIZED_WIRE_30));

assign	alu_op1 = SYNTHESIZED_WIRE_2 | SYNTHESIZED_WIRE_3;

assign	SYNTHESIZED_WIRE_17 =  ~alu_op_low;

assign	db_low[3] = alu_op2_oe ? op2_low[3] : 1'bz;
assign	db_low[2] = alu_op2_oe ? op2_low[2] : 1'bz;
assign	db_low[1] = alu_op2_oe ? op2_low[1] : 1'bz;
assign	db_low[0] = alu_op2_oe ? op2_low[0] : 1'bz;

assign	db_high[3] = alu_op2_oe ? op2_high[3] : 1'bz;
assign	db_high[2] = alu_op2_oe ? op2_high[2] : 1'bz;
assign	db_high[1] = alu_op2_oe ? op2_high[1] : 1'bz;
assign	db_high[0] = alu_op2_oe ? op2_high[0] : 1'bz;

assign	SYNTHESIZED_WIRE_5 =  ~op2_low;

assign	SYNTHESIZED_WIRE_7 =  ~op2_high;

assign	SYNTHESIZED_WIRE_12 = op2_low & {SYNTHESIZED_WIRE_32,SYNTHESIZED_WIRE_32,SYNTHESIZED_WIRE_32,SYNTHESIZED_WIRE_32};

assign	SYNTHESIZED_WIRE_11 = {alu_sel_op2_neg,alu_sel_op2_neg,alu_sel_op2_neg,alu_sel_op2_neg} & SYNTHESIZED_WIRE_5;

assign	SYNTHESIZED_WIRE_14 = op2_high & {SYNTHESIZED_WIRE_32,SYNTHESIZED_WIRE_32,SYNTHESIZED_WIRE_32,SYNTHESIZED_WIRE_32};

assign	SYNTHESIZED_WIRE_13 = {alu_sel_op2_neg,alu_sel_op2_neg,alu_sel_op2_neg,alu_sel_op2_neg} & SYNTHESIZED_WIRE_7;

assign	SYNTHESIZED_WIRE_16 = SYNTHESIZED_WIRE_8 & {SYNTHESIZED_WIRE_9,SYNTHESIZED_WIRE_9,SYNTHESIZED_WIRE_9,SYNTHESIZED_WIRE_9};

assign	SYNTHESIZED_WIRE_15 = {alu_sel_op2_high,alu_sel_op2_high,alu_sel_op2_high,alu_sel_op2_high} & SYNTHESIZED_WIRE_10;

assign	SYNTHESIZED_WIRE_8 = SYNTHESIZED_WIRE_11 | SYNTHESIZED_WIRE_12;

assign	SYNTHESIZED_WIRE_10 = SYNTHESIZED_WIRE_13 | SYNTHESIZED_WIRE_14;

assign	alu_op2 = SYNTHESIZED_WIRE_15 | SYNTHESIZED_WIRE_16;

assign	SYNTHESIZED_WIRE_32 =  ~alu_sel_op2_neg;

assign	SYNTHESIZED_WIRE_9 =  ~alu_sel_op2_high;

assign	db_low[3] = alu_res_oe ? result_lo[3] : 1'bz;
assign	db_low[2] = alu_res_oe ? result_lo[2] : 1'bz;
assign	db_low[1] = alu_res_oe ? result_lo[1] : 1'bz;
assign	db_low[0] = alu_res_oe ? result_lo[0] : 1'bz;

assign	db_high[3] = alu_res_oe ? result_hi[3] : 1'bz;
assign	db_high[2] = alu_res_oe ? result_hi[2] : 1'bz;
assign	db_high[1] = alu_res_oe ? result_hi[1] : 1'bz;
assign	db_high[0] = alu_res_oe ? result_hi[0] : 1'bz;

assign	SYNTHESIZED_WIRE_3 = op1_low & {alu_op_low,alu_op_low,alu_op_low,alu_op_low};

assign	SYNTHESIZED_WIRE_2 = {SYNTHESIZED_WIRE_17,SYNTHESIZED_WIRE_17,SYNTHESIZED_WIRE_17,SYNTHESIZED_WIRE_17} & op1_high;

assign	SYNTHESIZED_WIRE_18 = alu_op_low & nclk;


always@(SYNTHESIZED_WIRE_18 or result_hi)
begin
if (SYNTHESIZED_WIRE_18)
	result_lo <= result_hi;
end


always@(SYNTHESIZED_WIRE_20 or SYNTHESIZED_WIRE_19)
begin
if (SYNTHESIZED_WIRE_20)
	op1_high <= SYNTHESIZED_WIRE_19;
end


always@(SYNTHESIZED_WIRE_22 or SYNTHESIZED_WIRE_21)
begin
if (SYNTHESIZED_WIRE_22)
	op1_low <= SYNTHESIZED_WIRE_21;
end


always@(SYNTHESIZED_WIRE_24 or SYNTHESIZED_WIRE_23)
begin
if (SYNTHESIZED_WIRE_24)
	op2_high <= SYNTHESIZED_WIRE_23;
end


always@(SYNTHESIZED_WIRE_26 or SYNTHESIZED_WIRE_25)
begin
if (SYNTHESIZED_WIRE_26)
	op2_low <= SYNTHESIZED_WIRE_25;
end

assign	db_low[3] = alu_op1_oe ? op1_low[3] : 1'bz;
assign	db_low[2] = alu_op1_oe ? op1_low[2] : 1'bz;
assign	db_low[1] = alu_op1_oe ? op1_low[1] : 1'bz;
assign	db_low[0] = alu_op1_oe ? op1_low[0] : 1'bz;

assign	db_high[3] = alu_op1_oe ? op1_high[3] : 1'bz;
assign	db_high[2] = alu_op1_oe ? op1_high[2] : 1'bz;
assign	db_high[1] = alu_op1_oe ? op1_high[1] : 1'bz;
assign	db_high[0] = alu_op1_oe ? op1_high[0] : 1'bz;


alu_mux_2z	b2v_op1_latch_mux_high(
	.sel_a(alu_op1_sel_bus),
	.sel_zero(alu_op1_sel_zero),
	.nclk(nclk),
	.a(db_high),
	.ena_out(SYNTHESIZED_WIRE_20),
	.Q(SYNTHESIZED_WIRE_19));


alu_mux_3z	b2v_op1_latch_mux_low(
	.sel_a(alu_op1_sel_bus),
	.sel_b(alu_op1_sel_low),
	.sel_zero(alu_op1_sel_zero),
	.nclk(nclk),
	.a(db_low),
	.b(db_high),
	.ena_out(SYNTHESIZED_WIRE_22),
	.Q(SYNTHESIZED_WIRE_21));


alu_mux_3z	b2v_op2_latch_mux_high(
	.sel_a(alu_op2_sel_bus),
	.sel_b(alu_op2_sel_lq),
	.sel_zero(alu_op2_sel_zero),
	.nclk(nclk),
	.a(db_high),
	.b(db_low),
	.ena_out(SYNTHESIZED_WIRE_24),
	.Q(SYNTHESIZED_WIRE_23));


alu_mux_3z	b2v_op2_latch_mux_low(
	.sel_a(alu_op2_sel_bus),
	.sel_b(alu_op2_sel_lq),
	.sel_zero(alu_op2_sel_zero),
	.nclk(nclk),
	.a(db_low),
	.b(alu_op1),
	.ena_out(SYNTHESIZED_WIRE_26),
	.Q(SYNTHESIZED_WIRE_25));

assign	alu_parity_out = SYNTHESIZED_WIRE_27 ^ result_hi[0];

assign	SYNTHESIZED_WIRE_27 = SYNTHESIZED_WIRE_28 ^ result_hi[1];

assign	SYNTHESIZED_WIRE_28 = SYNTHESIZED_WIRE_29 ^ result_hi[2];

assign	SYNTHESIZED_WIRE_29 = alu_parity_in ^ result_hi[3];


alu_prep_daa	b2v_prep_daa(
	.high(op1_high),
	.low(op1_low),
	.low_gt_9(alu_low_gt_9),
	.high_gt_9(alu_high_gt_9),
	.high_eq_9(alu_high_eq_9));

assign	db_low[3] = alu_shift_oe ? SYNTHESIZED_WIRE_30[3] : 1'bz;
assign	db_low[2] = alu_shift_oe ? SYNTHESIZED_WIRE_30[2] : 1'bz;
assign	db_low[1] = alu_shift_oe ? SYNTHESIZED_WIRE_30[1] : 1'bz;
assign	db_low[0] = alu_shift_oe ? SYNTHESIZED_WIRE_30[0] : 1'bz;

assign	db_high[3] = alu_shift_oe ? SYNTHESIZED_WIRE_31[3] : 1'bz;
assign	db_high[2] = alu_shift_oe ? SYNTHESIZED_WIRE_31[2] : 1'bz;
assign	db_high[1] = alu_shift_oe ? SYNTHESIZED_WIRE_31[1] : 1'bz;
assign	db_high[0] = alu_shift_oe ? SYNTHESIZED_WIRE_31[0] : 1'bz;

assign	alu_zero = ~(db_low[2] | db_low[1] | db_low[3] | db_high[1] | db_high[0] | db_high[2] | db_low[0] | db_high[3]);

assign	alu_sf_out = db_high[3];
assign	alu_yf_out = db_high[1];
assign	alu_xf_out = db_low[3];
assign	test_db_high = db_high;
assign	test_db_low = db_low;

endmodule
