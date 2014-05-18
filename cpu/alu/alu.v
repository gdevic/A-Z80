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
// CREATED		"Sun May 18 15:51:46 2014"

module alu(
	alu_shift_oe,
	alu_oe,
	alu_shift_enable,
	alu_shift_cy_in,
	alu_core_cy_in,
	alu_core_R,
	alu_core_V,
	alu_core_S,
	alu_bs_oe,
	alu_mm,
	sel_jj,
	sel_ll,
	sel_kk,
	alu_shift_op,
	bsel,
	alu_shift_cy_out,
	alu_core_cy_out,
	db
);


input wire	alu_shift_oe;
input wire	alu_oe;
input wire	alu_shift_enable;
input wire	alu_shift_cy_in;
input wire	alu_core_cy_in;
input wire	alu_core_R;
input wire	alu_core_V;
input wire	alu_core_S;
input wire	alu_bs_oe;
input wire	alu_mm;
input wire	sel_jj;
input wire	sel_ll;
input wire	sel_kk;
input wire	[2:0] alu_shift_op;
input wire	[2:0] bsel;
output wire	alu_shift_cy_out;
output wire	alu_core_cy_out;
inout wire	[7:0] db;

wire	[3:0] db_high;
wire	[3:0] db_low;
wire	[3:0] SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
reg	[3:0] SYNTHESIZED_WIRE_2;





alu_shifter	b2v_inst(
	.alu_shift_oe(alu_shift_oe),
	.alu_oe(alu_oe),
	.alu_shift_enable(alu_shift_enable),
	.cf_in(alu_shift_cy_in),
	.db(db),
	.db_high(db_high),
	.db_low(db_low),
	.op543(alu_shift_op),
	.cf_out(alu_shift_cy_out)
	
	
	);


alu_core	b2v_inst2(
	.cy_in(alu_core_cy_in),
	.S(alu_core_S),
	.V(alu_core_V),
	.R(alu_core_R),
	
	
	.cy_out(alu_core_cy_out)
	);


alu_bit_select	b2v_inst3(
	.oe(alu_bs_oe),
	.bsel(bsel),
	.bs_out_high(db_high),
	.bs_out_low(db_low));


alu_op1_mux_low	b2v_inst_mux(
	.sel_ll(sel_jj),
	.sel_jj(sel_ll),
	.sel_kk(sel_kk),
	.jj(db_high),
	.ll(db_low),
	.ena_out(SYNTHESIZED_WIRE_1),
	.Q(SYNTHESIZED_WIRE_0));


always@(SYNTHESIZED_WIRE_1 or SYNTHESIZED_WIRE_0)
begin
if (SYNTHESIZED_WIRE_1)
	SYNTHESIZED_WIRE_2 <= SYNTHESIZED_WIRE_0;
end

assign	db_low[3] = alu_mm ? SYNTHESIZED_WIRE_2[3] : 1'bz;
assign	db_low[2] = alu_mm ? SYNTHESIZED_WIRE_2[2] : 1'bz;
assign	db_low[1] = alu_mm ? SYNTHESIZED_WIRE_2[1] : 1'bz;
assign	db_low[0] = alu_mm ? SYNTHESIZED_WIRE_2[0] : 1'bz;


endmodule
