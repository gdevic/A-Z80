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
// CREATED		"Wed Sep 24 00:13:11 2014"

module alu_flags(
	ctl_flags_oe,
	ctl_flags_bus,
	ctl_flags_alu,
	alu_sf_out,
	alu_yf_out,
	alu_xf_out,
	ctl_flags_nf_set,
	alu_zero,
	shift_cf_out,
	alu_core_cf_out,
	daa_cf_out,
	ctl_flags_cf_set,
	ctl_flags_cf_cpl,
	pf_sel,
	ctl_flags_cf_we,
	ctl_flags_sz_we,
	ctl_flags_xy_we,
	ctl_flags_hf_we,
	ctl_flags_pf_we,
	ctl_flags_nf_we,
	ctl_flags_cf2_we,
	ctl_flags_hf_cpl,
	ctl_flags_use_cf2,
	ctl_flags_hf2_we,
	ctl_flags_nf_clr,
	nclk,
	ctl_flags_cf2_sel,
	flags_sf,
	flags_zf,
	flags_hf,
	flags_pf,
	flags_cf,
	flags_nf,
	flags_cf_latch,
	flags_hf2,
	db
);


input wire	ctl_flags_oe;
input wire	ctl_flags_bus;
input wire	ctl_flags_alu;
input wire	alu_sf_out;
input wire	alu_yf_out;
input wire	alu_xf_out;
input wire	ctl_flags_nf_set;
input wire	alu_zero;
input wire	shift_cf_out;
input wire	alu_core_cf_out;
input wire	daa_cf_out;
input wire	ctl_flags_cf_set;
input wire	ctl_flags_cf_cpl;
input wire	pf_sel;
input wire	ctl_flags_cf_we;
input wire	ctl_flags_sz_we;
input wire	ctl_flags_xy_we;
input wire	ctl_flags_hf_we;
input wire	ctl_flags_pf_we;
input wire	ctl_flags_nf_we;
input wire	ctl_flags_cf2_we;
input wire	ctl_flags_hf_cpl;
input wire	ctl_flags_use_cf2;
input wire	ctl_flags_hf2_we;
input wire	ctl_flags_nf_clr;
input wire	nclk;
input wire	[1:0] ctl_flags_cf2_sel;
output wire	flags_sf;
output wire	flags_zf;
output wire	flags_hf;
output wire	flags_pf;
output wire	flags_cf;
output wire	flags_nf;
output wire	flags_cf_latch;
output wire	flags_hf2;
inout wire	[7:0] db;

wire	flags_cf2_latch;
wire	flags_xf;
wire	flags_yf;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
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
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_25;
wire	SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_40;
wire	SYNTHESIZED_WIRE_32;
wire	SYNTHESIZED_WIRE_33;
wire	SYNTHESIZED_WIRE_34;
wire	SYNTHESIZED_WIRE_35;
wire	SYNTHESIZED_WIRE_36;
wire	SYNTHESIZED_WIRE_37;
wire	SYNTHESIZED_WIRE_38;
wire	SYNTHESIZED_WIRE_39;

assign	flags_sf = SYNTHESIZED_WIRE_20;
assign	flags_zf = SYNTHESIZED_WIRE_21;
assign	flags_hf = SYNTHESIZED_WIRE_22;
assign	flags_pf = SYNTHESIZED_WIRE_23;
assign	flags_cf = SYNTHESIZED_WIRE_25;
assign	flags_nf = SYNTHESIZED_WIRE_24;
assign	flags_cf_latch = SYNTHESIZED_WIRE_38;
assign	SYNTHESIZED_WIRE_39 = 0;



assign	SYNTHESIZED_WIRE_28 = ctl_flags_cf_we & SYNTHESIZED_WIRE_0;

assign	SYNTHESIZED_WIRE_7 = db[7] & ctl_flags_bus;

assign	SYNTHESIZED_WIRE_14 = alu_xf_out & ctl_flags_alu;

assign	SYNTHESIZED_WIRE_17 = db[2] & ctl_flags_bus;

assign	SYNTHESIZED_WIRE_16 = pf_sel & ctl_flags_alu;

assign	SYNTHESIZED_WIRE_3 = db[1] & ctl_flags_bus;

assign	SYNTHESIZED_WIRE_22 = SYNTHESIZED_WIRE_1 ^ ctl_flags_hf_cpl;

assign	SYNTHESIZED_WIRE_19 = db[0] & ctl_flags_bus;

assign	SYNTHESIZED_WIRE_18 = ctl_flags_alu & alu_core_cf_out;

assign	SYNTHESIZED_WIRE_0 =  ~ctl_flags_cf2_we;

assign	SYNTHESIZED_WIRE_25 = SYNTHESIZED_WIRE_2 ^ ctl_flags_cf_cpl;

assign	SYNTHESIZED_WIRE_6 = alu_sf_out & ctl_flags_alu;

assign	SYNTHESIZED_WIRE_4 = alu_sf_out | ctl_flags_nf_set | SYNTHESIZED_WIRE_3;


assign	SYNTHESIZED_WIRE_32 = SYNTHESIZED_WIRE_4 & SYNTHESIZED_WIRE_5;

assign	SYNTHESIZED_WIRE_5 =  ~ctl_flags_nf_clr;

assign	SYNTHESIZED_WIRE_9 = db[6] & ctl_flags_bus;

assign	SYNTHESIZED_WIRE_34 = SYNTHESIZED_WIRE_6 | SYNTHESIZED_WIRE_7;

assign	SYNTHESIZED_WIRE_37 = SYNTHESIZED_WIRE_8 | SYNTHESIZED_WIRE_9;

assign	SYNTHESIZED_WIRE_36 = SYNTHESIZED_WIRE_10 | SYNTHESIZED_WIRE_11;

assign	SYNTHESIZED_WIRE_40 = SYNTHESIZED_WIRE_12 | SYNTHESIZED_WIRE_13;

assign	SYNTHESIZED_WIRE_35 = SYNTHESIZED_WIRE_14 | SYNTHESIZED_WIRE_15;

assign	SYNTHESIZED_WIRE_33 = SYNTHESIZED_WIRE_16 | SYNTHESIZED_WIRE_17;

assign	SYNTHESIZED_WIRE_8 = alu_zero & ctl_flags_alu;

assign	SYNTHESIZED_WIRE_27 = SYNTHESIZED_WIRE_18 | SYNTHESIZED_WIRE_19;

assign	db[7] = ctl_flags_oe ? SYNTHESIZED_WIRE_20 : 1'bz;

assign	SYNTHESIZED_WIRE_11 = db[5] & ctl_flags_bus;

assign	db[6] = ctl_flags_oe ? SYNTHESIZED_WIRE_21 : 1'bz;

assign	db[5] = ctl_flags_oe ? flags_yf : 1'bz;

assign	db[4] = ctl_flags_oe ? SYNTHESIZED_WIRE_22 : 1'bz;

assign	db[3] = ctl_flags_oe ? flags_xf : 1'bz;

assign	db[2] = ctl_flags_oe ? SYNTHESIZED_WIRE_23 : 1'bz;

assign	db[1] = ctl_flags_oe ? SYNTHESIZED_WIRE_24 : 1'bz;

assign	db[0] = ctl_flags_oe ? SYNTHESIZED_WIRE_25 : 1'bz;

assign	SYNTHESIZED_WIRE_10 = alu_yf_out & ctl_flags_alu;

assign	SYNTHESIZED_WIRE_2 = ctl_flags_cf_set | SYNTHESIZED_WIRE_26;

assign	SYNTHESIZED_WIRE_13 = db[4] & ctl_flags_bus;

assign	SYNTHESIZED_WIRE_12 = alu_core_cf_out & ctl_flags_alu;

assign	SYNTHESIZED_WIRE_15 = db[3] & ctl_flags_bus;


alu_latch	b2v_inst_latch_cf(
	.D(SYNTHESIZED_WIRE_27),
	.ENA(SYNTHESIZED_WIRE_28),
	.NCLK(nclk),
	.Q(SYNTHESIZED_WIRE_38));


alu_latch	b2v_inst_latch_cf2(
	.D(SYNTHESIZED_WIRE_29),
	.ENA(ctl_flags_cf2_we),
	.NCLK(nclk),
	.Q(flags_cf2_latch));


alu_latch	b2v_inst_latch_hf(
	.D(SYNTHESIZED_WIRE_40),
	.ENA(ctl_flags_hf_we),
	.NCLK(nclk),
	.Q(SYNTHESIZED_WIRE_1));


alu_latch	b2v_inst_latch_hf2(
	.D(SYNTHESIZED_WIRE_40),
	.ENA(ctl_flags_hf2_we),
	.NCLK(nclk),
	.Q(flags_hf2));


alu_latch	b2v_inst_latch_nf(
	.D(SYNTHESIZED_WIRE_32),
	.ENA(ctl_flags_nf_we),
	.NCLK(nclk),
	.Q(SYNTHESIZED_WIRE_24));


alu_latch	b2v_inst_latch_pf(
	.D(SYNTHESIZED_WIRE_33),
	.ENA(ctl_flags_pf_we),
	.NCLK(nclk),
	.Q(SYNTHESIZED_WIRE_23));


alu_latch	b2v_inst_latch_sf(
	.D(SYNTHESIZED_WIRE_34),
	.ENA(ctl_flags_sz_we),
	.NCLK(nclk),
	.Q(SYNTHESIZED_WIRE_20));


alu_latch	b2v_inst_latch_xf(
	.D(SYNTHESIZED_WIRE_35),
	.ENA(ctl_flags_xy_we),
	.NCLK(nclk),
	.Q(flags_xf));


alu_latch	b2v_inst_latch_yf(
	.D(SYNTHESIZED_WIRE_36),
	.ENA(ctl_flags_xy_we),
	.NCLK(nclk),
	.Q(flags_yf));


alu_latch	b2v_inst_latch_zf(
	.D(SYNTHESIZED_WIRE_37),
	.ENA(ctl_flags_sz_we),
	.NCLK(nclk),
	.Q(SYNTHESIZED_WIRE_21));


alu_mux_2	b2v_inst_mux_cf(
	.in0(SYNTHESIZED_WIRE_38),
	.in1(flags_cf2_latch),
	.sel1(ctl_flags_use_cf2),
	.out(SYNTHESIZED_WIRE_26));


alu_mux_4	b2v_inst_mux_cf2(
	.in0(alu_core_cf_out),
	.in1(shift_cf_out),
	.in2(daa_cf_out),
	.in3(SYNTHESIZED_WIRE_39),
	.sel(ctl_flags_cf2_sel),
	.out(SYNTHESIZED_WIRE_29));


endmodule
