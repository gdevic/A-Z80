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
// CREATED		"Thu May 22 08:25:07 2014"

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
	alu_shift_sra,
	alu_shift_enable,
	alu_shift_right,
	alu_shift_in,
	alu_sel_op2_neg,
	alu_sel_op2_high,
	bsel,
	alu_zero,
	alu_core_cf_out,
	alu_parity_out,
	alu_high_eq_9,
	alu_high_gt_9,
	alu_low_gt_9,
	alu_shift_out,
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
input wire	alu_shift_sra;
input wire	alu_shift_enable;
input wire	alu_shift_right;
input wire	alu_shift_in;
input wire	alu_sel_op2_neg;
input wire	alu_sel_op2_high;
input wire	[2:0] bsel;
output wire	alu_zero;
output wire	alu_core_cf_out;
output wire	alu_parity_out;
output wire	alu_high_eq_9;
output wire	alu_high_gt_9;
output wire	alu_low_gt_9;
output wire	alu_shift_out;
inout wire	[7:0] db;
output wire	[3:0] test_db_high;
output wire	[3:0] test_db_low;

wire	[3:0] db_high;
wire	[3:0] db_low;
wire	[3:0] SYNTHESIZED_WIRE_0;
wire	[3:0] SYNTHESIZED_WIRE_1;
wire	[3:0] SYNTHESIZED_WIRE_48;
wire	[3:0] SYNTHESIZED_WIRE_3;
wire	[3:0] SYNTHESIZED_WIRE_4;
wire	[3:0] SYNTHESIZED_WIRE_5;
reg	[3:0] SYNTHESIZED_WIRE_49;
reg	[3:0] SYNTHESIZED_WIRE_50;
wire	SYNTHESIZED_WIRE_51;
wire	[3:0] SYNTHESIZED_WIRE_12;
wire	[3:0] SYNTHESIZED_WIRE_15;
wire	[3:0] SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	[3:0] SYNTHESIZED_WIRE_18;
wire	[3:0] SYNTHESIZED_WIRE_19;
wire	[3:0] SYNTHESIZED_WIRE_20;
wire	[3:0] SYNTHESIZED_WIRE_21;
wire	[3:0] SYNTHESIZED_WIRE_22;
wire	[3:0] SYNTHESIZED_WIRE_23;
wire	[3:0] SYNTHESIZED_WIRE_24;
reg	[3:0] SYNTHESIZED_WIRE_52;
wire	[3:0] SYNTHESIZED_WIRE_53;
reg	[3:0] SYNTHESIZED_WIRE_54;
wire	SYNTHESIZED_WIRE_28;
reg	[3:0] SYNTHESIZED_WIRE_55;
wire	[3:0] SYNTHESIZED_WIRE_33;
wire	SYNTHESIZED_WIRE_34;
wire	[3:0] SYNTHESIZED_WIRE_35;
wire	SYNTHESIZED_WIRE_36;
wire	[3:0] SYNTHESIZED_WIRE_37;
wire	SYNTHESIZED_WIRE_38;
wire	[3:0] SYNTHESIZED_WIRE_40;
wire	SYNTHESIZED_WIRE_41;
wire	[3:0] SYNTHESIZED_WIRE_44;
wire	[3:0] SYNTHESIZED_WIRE_45;




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
	.op1(SYNTHESIZED_WIRE_48),
	.op2(SYNTHESIZED_WIRE_3),
	.cy_out(alu_core_cf_out),
	.result(SYNTHESIZED_WIRE_53));

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
	.shift_right(alu_shift_right),
	.shift_enable(alu_shift_enable),
	.shift_sra(alu_shift_sra),
	.db(db),
	.shift_out(alu_shift_out),
	.out_high(SYNTHESIZED_WIRE_45),
	.out_low(SYNTHESIZED_WIRE_44));

assign	SYNTHESIZED_WIRE_48 = SYNTHESIZED_WIRE_4 | SYNTHESIZED_WIRE_5;

assign	SYNTHESIZED_WIRE_28 =  ~alu_op_low;

assign	db_low[3] = alu_op2_oe ? SYNTHESIZED_WIRE_49[3] : 1'bz;
assign	db_low[2] = alu_op2_oe ? SYNTHESIZED_WIRE_49[2] : 1'bz;
assign	db_low[1] = alu_op2_oe ? SYNTHESIZED_WIRE_49[1] : 1'bz;
assign	db_low[0] = alu_op2_oe ? SYNTHESIZED_WIRE_49[0] : 1'bz;

assign	db_high[3] = alu_op2_oe ? SYNTHESIZED_WIRE_50[3] : 1'bz;
assign	db_high[2] = alu_op2_oe ? SYNTHESIZED_WIRE_50[2] : 1'bz;
assign	db_high[1] = alu_op2_oe ? SYNTHESIZED_WIRE_50[1] : 1'bz;
assign	db_high[0] = alu_op2_oe ? SYNTHESIZED_WIRE_50[0] : 1'bz;

assign	SYNTHESIZED_WIRE_12 =  ~SYNTHESIZED_WIRE_49;

assign	SYNTHESIZED_WIRE_15 =  ~SYNTHESIZED_WIRE_50;

assign	SYNTHESIZED_WIRE_20 = SYNTHESIZED_WIRE_49 & {SYNTHESIZED_WIRE_51,SYNTHESIZED_WIRE_51,SYNTHESIZED_WIRE_51,SYNTHESIZED_WIRE_51};

assign	SYNTHESIZED_WIRE_19 = {alu_sel_op2_neg,alu_sel_op2_neg,alu_sel_op2_neg,alu_sel_op2_neg} & SYNTHESIZED_WIRE_12;

assign	SYNTHESIZED_WIRE_22 = SYNTHESIZED_WIRE_50 & {SYNTHESIZED_WIRE_51,SYNTHESIZED_WIRE_51,SYNTHESIZED_WIRE_51,SYNTHESIZED_WIRE_51};

assign	SYNTHESIZED_WIRE_21 = {alu_sel_op2_neg,alu_sel_op2_neg,alu_sel_op2_neg,alu_sel_op2_neg} & SYNTHESIZED_WIRE_15;

assign	SYNTHESIZED_WIRE_24 = SYNTHESIZED_WIRE_16 & {SYNTHESIZED_WIRE_17,SYNTHESIZED_WIRE_17,SYNTHESIZED_WIRE_17,SYNTHESIZED_WIRE_17};

assign	SYNTHESIZED_WIRE_23 = {alu_sel_op2_high,alu_sel_op2_high,alu_sel_op2_high,alu_sel_op2_high} & SYNTHESIZED_WIRE_18;

assign	SYNTHESIZED_WIRE_16 = SYNTHESIZED_WIRE_19 | SYNTHESIZED_WIRE_20;

assign	SYNTHESIZED_WIRE_18 = SYNTHESIZED_WIRE_21 | SYNTHESIZED_WIRE_22;

assign	SYNTHESIZED_WIRE_3 = SYNTHESIZED_WIRE_23 | SYNTHESIZED_WIRE_24;

assign	SYNTHESIZED_WIRE_51 =  ~alu_sel_op2_neg;

assign	SYNTHESIZED_WIRE_17 =  ~alu_sel_op2_high;

assign	db_low[3] = alu_res_oe ? SYNTHESIZED_WIRE_52[3] : 1'bz;
assign	db_low[2] = alu_res_oe ? SYNTHESIZED_WIRE_52[2] : 1'bz;
assign	db_low[1] = alu_res_oe ? SYNTHESIZED_WIRE_52[1] : 1'bz;
assign	db_low[0] = alu_res_oe ? SYNTHESIZED_WIRE_52[0] : 1'bz;

assign	db_high[3] = alu_res_oe ? SYNTHESIZED_WIRE_53[3] : 1'bz;
assign	db_high[2] = alu_res_oe ? SYNTHESIZED_WIRE_53[2] : 1'bz;
assign	db_high[1] = alu_res_oe ? SYNTHESIZED_WIRE_53[1] : 1'bz;
assign	db_high[0] = alu_res_oe ? SYNTHESIZED_WIRE_53[0] : 1'bz;

assign	SYNTHESIZED_WIRE_5 = SYNTHESIZED_WIRE_54 & {alu_op_low,alu_op_low,alu_op_low,alu_op_low};

assign	SYNTHESIZED_WIRE_4 = {SYNTHESIZED_WIRE_28,SYNTHESIZED_WIRE_28,SYNTHESIZED_WIRE_28,SYNTHESIZED_WIRE_28} & SYNTHESIZED_WIRE_55;


always@(alu_op_low or SYNTHESIZED_WIRE_53)
begin
if (alu_op_low)
	SYNTHESIZED_WIRE_52 <= SYNTHESIZED_WIRE_53;
end

assign	db_low[3] = alu_op1_oe ? SYNTHESIZED_WIRE_54[3] : 1'bz;
assign	db_low[2] = alu_op1_oe ? SYNTHESIZED_WIRE_54[2] : 1'bz;
assign	db_low[1] = alu_op1_oe ? SYNTHESIZED_WIRE_54[1] : 1'bz;
assign	db_low[0] = alu_op1_oe ? SYNTHESIZED_WIRE_54[0] : 1'bz;

assign	db_high[3] = alu_op1_oe ? SYNTHESIZED_WIRE_55[3] : 1'bz;
assign	db_high[2] = alu_op1_oe ? SYNTHESIZED_WIRE_55[2] : 1'bz;
assign	db_high[1] = alu_op1_oe ? SYNTHESIZED_WIRE_55[1] : 1'bz;
assign	db_high[0] = alu_op1_oe ? SYNTHESIZED_WIRE_55[0] : 1'bz;


always@(SYNTHESIZED_WIRE_34 or SYNTHESIZED_WIRE_33)
begin
if (SYNTHESIZED_WIRE_34)
	SYNTHESIZED_WIRE_55 <= SYNTHESIZED_WIRE_33;
end


alu_mux_2z	b2v_op1_latch_mux_high(
	.sel_a(alu_op1_sel_bus),
	.sel_zero(alu_op1_sel_zero),
	.a(db_high),
	.ena_out(SYNTHESIZED_WIRE_34),
	.Q2(SYNTHESIZED_WIRE_33));


alu_mux_3z	b2v_op1_latch_mux_low(
	.sel_a(alu_op1_sel_bus),
	.sel_b(alu_op1_sel_low),
	.sel_zero(alu_op1_sel_zero),
	.a(db_low),
	.b(db_high),
	.ena_out(SYNTHESIZED_WIRE_36),
	.Q(SYNTHESIZED_WIRE_35));


always@(SYNTHESIZED_WIRE_36 or SYNTHESIZED_WIRE_35)
begin
if (SYNTHESIZED_WIRE_36)
	SYNTHESIZED_WIRE_54 <= SYNTHESIZED_WIRE_35;
end


always@(SYNTHESIZED_WIRE_38 or SYNTHESIZED_WIRE_37)
begin
if (SYNTHESIZED_WIRE_38)
	SYNTHESIZED_WIRE_50 <= SYNTHESIZED_WIRE_37;
end


alu_mux_3z	b2v_op2_latch_mux_high(
	.sel_a(alu_op2_sel_bus),
	.sel_b(alu_op2_sel_lq),
	.sel_zero(alu_op2_sel_zero),
	.a(db_high),
	.b(db_low),
	.ena_out(SYNTHESIZED_WIRE_38),
	.Q(SYNTHESIZED_WIRE_37));


alu_mux_3z	b2v_op2_latch_mux_low(
	.sel_a(alu_op2_sel_bus),
	.sel_b(alu_op2_sel_lq),
	.sel_zero(alu_op2_sel_zero),
	.a(db_low),
	.b(SYNTHESIZED_WIRE_48),
	.ena_out(SYNTHESIZED_WIRE_41),
	.Q(SYNTHESIZED_WIRE_40));


always@(SYNTHESIZED_WIRE_41 or SYNTHESIZED_WIRE_40)
begin
if (SYNTHESIZED_WIRE_41)
	SYNTHESIZED_WIRE_49 <= SYNTHESIZED_WIRE_40;
end


alu_prep_daa	b2v_prep_daa(
	.high(SYNTHESIZED_WIRE_55),
	.low(SYNTHESIZED_WIRE_54),
	.low_gt_9(alu_low_gt_9),
	.high_gt_9(alu_high_gt_9),
	.high_eq_9(alu_high_eq_9));

assign	db_low[3] = alu_shift_oe ? SYNTHESIZED_WIRE_44[3] : 1'bz;
assign	db_low[2] = alu_shift_oe ? SYNTHESIZED_WIRE_44[2] : 1'bz;
assign	db_low[1] = alu_shift_oe ? SYNTHESIZED_WIRE_44[1] : 1'bz;
assign	db_low[0] = alu_shift_oe ? SYNTHESIZED_WIRE_44[0] : 1'bz;

assign	db_high[3] = alu_shift_oe ? SYNTHESIZED_WIRE_45[3] : 1'bz;
assign	db_high[2] = alu_shift_oe ? SYNTHESIZED_WIRE_45[2] : 1'bz;
assign	db_high[1] = alu_shift_oe ? SYNTHESIZED_WIRE_45[1] : 1'bz;
assign	db_high[0] = alu_shift_oe ? SYNTHESIZED_WIRE_45[0] : 1'bz;


alu_zero	b2v_zero_parity(
	.parity_in(alu_parity_in),
	.ap(SYNTHESIZED_WIRE_53),
	.b(SYNTHESIZED_WIRE_52),
	.parity_out(alu_parity_out),
	.zero(alu_zero));

assign	test_db_high = db_high;
assign	test_db_low = db_low;

endmodule
