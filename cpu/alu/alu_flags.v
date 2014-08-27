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
// CREATED		"Wed Aug 27 08:34:02 2014"

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
	ctl_daa,
	ctl_flags_cf_set,
	ctl_flags_cf_cpl,
	pf_sel,
	ctl_flags_cf_we,
	ctl_flags_sz_we,
	ctl_flags_xy_we,
	ctl_flags_hf_we,
	ctl_flags_pf_we,
	ctl_flags_nf_we,
	ctl_flags_sel_cf2,
	ctl_flags_cf2_we,
	ctl_flags_hf_cpl,
	flags_sf,
	flags_zf,
	flags_hf,
	flags_pf,
	flags_cf,
	flags_nf,
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
input wire	ctl_daa;
input wire	ctl_flags_cf_set;
input wire	ctl_flags_cf_cpl;
input wire	pf_sel;
input wire	ctl_flags_cf_we;
input wire	ctl_flags_sz_we;
input wire	ctl_flags_xy_we;
input wire	ctl_flags_hf_we;
input wire	ctl_flags_pf_we;
input wire	ctl_flags_nf_we;
input wire	ctl_flags_sel_cf2;
input wire	ctl_flags_cf2_we;
input wire	ctl_flags_hf_cpl;
output wire	flags_sf;
output wire	flags_zf;
output wire	flags_hf;
output wire	flags_pf;
output wire	flags_cf;
output wire	flags_nf;
inout wire	[7:0] db;

reg	latch_cf;
reg	latch_cf2;
wire	SYNTHESIZED_WIRE_0;
reg	SYNTHESIZED_WIRE_1;
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
reg	SYNTHESIZED_WIRE_18;
reg	SYNTHESIZED_WIRE_19;
reg	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_21;
reg	SYNTHESIZED_WIRE_22;
reg	SYNTHESIZED_WIRE_23;
reg	SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_25;
wire	SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_31;
wire	SYNTHESIZED_WIRE_32;
wire	SYNTHESIZED_WIRE_33;
wire	SYNTHESIZED_WIRE_34;
wire	SYNTHESIZED_WIRE_35;
wire	SYNTHESIZED_WIRE_36;

assign	flags_sf = SYNTHESIZED_WIRE_18;
assign	flags_zf = SYNTHESIZED_WIRE_19;
assign	flags_hf = SYNTHESIZED_WIRE_21;
assign	flags_pf = SYNTHESIZED_WIRE_23;
assign	flags_cf = SYNTHESIZED_WIRE_25;
assign	flags_nf = SYNTHESIZED_WIRE_24;



assign	SYNTHESIZED_WIRE_28 = ctl_flags_cf_we & SYNTHESIZED_WIRE_0;

assign	SYNTHESIZED_WIRE_4 = db[7] & ctl_flags_bus;

assign	SYNTHESIZED_WIRE_11 = alu_xf_out & ctl_flags_alu;

assign	SYNTHESIZED_WIRE_14 = db[2] & ctl_flags_bus;

assign	SYNTHESIZED_WIRE_13 = pf_sel & ctl_flags_alu;

assign	SYNTHESIZED_WIRE_15 = db[1] & ctl_flags_bus;

assign	SYNTHESIZED_WIRE_21 = SYNTHESIZED_WIRE_1 ^ ctl_flags_hf_cpl;

assign	SYNTHESIZED_WIRE_17 = db[0] & ctl_flags_bus;

assign	SYNTHESIZED_WIRE_16 = ctl_flags_alu & alu_core_cf_out;

assign	SYNTHESIZED_WIRE_0 =  ~ctl_flags_cf2_we;

assign	SYNTHESIZED_WIRE_25 = SYNTHESIZED_WIRE_2 ^ ctl_flags_cf_cpl;

assign	SYNTHESIZED_WIRE_3 = alu_sf_out & ctl_flags_alu;

assign	SYNTHESIZED_WIRE_6 = db[6] & ctl_flags_bus;

assign	SYNTHESIZED_WIRE_33 = SYNTHESIZED_WIRE_3 | SYNTHESIZED_WIRE_4;

assign	SYNTHESIZED_WIRE_36 = SYNTHESIZED_WIRE_5 | SYNTHESIZED_WIRE_6;

assign	SYNTHESIZED_WIRE_35 = SYNTHESIZED_WIRE_7 | SYNTHESIZED_WIRE_8;

assign	SYNTHESIZED_WIRE_30 = SYNTHESIZED_WIRE_9 | SYNTHESIZED_WIRE_10;

assign	SYNTHESIZED_WIRE_34 = SYNTHESIZED_WIRE_11 | SYNTHESIZED_WIRE_12;

assign	SYNTHESIZED_WIRE_32 = SYNTHESIZED_WIRE_13 | SYNTHESIZED_WIRE_14;

assign	SYNTHESIZED_WIRE_31 = ctl_flags_nf_set | SYNTHESIZED_WIRE_15;

assign	SYNTHESIZED_WIRE_5 = alu_zero & ctl_flags_alu;

assign	SYNTHESIZED_WIRE_27 = SYNTHESIZED_WIRE_16 | SYNTHESIZED_WIRE_17;

assign	db[7] = ctl_flags_oe ? SYNTHESIZED_WIRE_18 : 1'bz;

assign	SYNTHESIZED_WIRE_8 = db[5] & ctl_flags_bus;

assign	db[6] = ctl_flags_oe ? SYNTHESIZED_WIRE_19 : 1'bz;

assign	db[5] = ctl_flags_oe ? SYNTHESIZED_WIRE_20 : 1'bz;

assign	db[4] = ctl_flags_oe ? SYNTHESIZED_WIRE_21 : 1'bz;

assign	db[3] = ctl_flags_oe ? SYNTHESIZED_WIRE_22 : 1'bz;

assign	db[2] = ctl_flags_oe ? SYNTHESIZED_WIRE_23 : 1'bz;

assign	db[1] = ctl_flags_oe ? SYNTHESIZED_WIRE_24 : 1'bz;

assign	db[0] = ctl_flags_oe ? SYNTHESIZED_WIRE_25 : 1'bz;

assign	SYNTHESIZED_WIRE_7 = alu_yf_out & ctl_flags_alu;

assign	SYNTHESIZED_WIRE_2 = ctl_flags_cf_set | SYNTHESIZED_WIRE_26;

assign	SYNTHESIZED_WIRE_10 = db[4] & ctl_flags_bus;

assign	SYNTHESIZED_WIRE_9 = alu_core_cf_out & ctl_flags_alu;

assign	SYNTHESIZED_WIRE_12 = db[3] & ctl_flags_bus;


always@(SYNTHESIZED_WIRE_28 or SYNTHESIZED_WIRE_27)
begin
if (SYNTHESIZED_WIRE_28)
	latch_cf <= SYNTHESIZED_WIRE_27;
end


always@(ctl_flags_cf2_we or SYNTHESIZED_WIRE_29)
begin
if (ctl_flags_cf2_we)
	latch_cf2 <= SYNTHESIZED_WIRE_29;
end


always@(ctl_flags_hf_we or SYNTHESIZED_WIRE_30)
begin
if (ctl_flags_hf_we)
	SYNTHESIZED_WIRE_1 <= SYNTHESIZED_WIRE_30;
end


always@(ctl_flags_nf_we or SYNTHESIZED_WIRE_31)
begin
if (ctl_flags_nf_we)
	SYNTHESIZED_WIRE_24 <= SYNTHESIZED_WIRE_31;
end


always@(ctl_flags_pf_we or SYNTHESIZED_WIRE_32)
begin
if (ctl_flags_pf_we)
	SYNTHESIZED_WIRE_23 <= SYNTHESIZED_WIRE_32;
end


always@(ctl_flags_sz_we or SYNTHESIZED_WIRE_33)
begin
if (ctl_flags_sz_we)
	SYNTHESIZED_WIRE_18 <= SYNTHESIZED_WIRE_33;
end


always@(ctl_flags_xy_we or SYNTHESIZED_WIRE_34)
begin
if (ctl_flags_xy_we)
	SYNTHESIZED_WIRE_22 <= SYNTHESIZED_WIRE_34;
end


always@(ctl_flags_xy_we or SYNTHESIZED_WIRE_35)
begin
if (ctl_flags_xy_we)
	SYNTHESIZED_WIRE_20 <= SYNTHESIZED_WIRE_35;
end


always@(ctl_flags_sz_we or SYNTHESIZED_WIRE_36)
begin
if (ctl_flags_sz_we)
	SYNTHESIZED_WIRE_19 <= SYNTHESIZED_WIRE_36;
end


alu_mux_2	b2v_inst_mux_cf(
	.in0(shift_cf_out),
	.in1(daa_cf_out),
	.sel1(ctl_daa),
	.out(SYNTHESIZED_WIRE_29));


alu_mux_2	b2v_inst_mux_cf2(
	.in0(latch_cf),
	.in1(latch_cf2),
	.sel1(ctl_flags_sel_cf2),
	.out(SYNTHESIZED_WIRE_26));


endmodule
