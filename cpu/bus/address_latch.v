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
// CREATED		"Thu Jul 10 18:54:06 2014"

module address_latch(
	ctl_bus_inc_we,
	ctl_inc_cy,
	ctl_inc_dec,
	ctl_inc_zero,
	ctl_al_we,
	ctl_ab_mux_inc,
	ctl_inc_limit6,
	address_is_1,
	abus,
	address
);


input wire	ctl_bus_inc_we;
input wire	ctl_inc_cy;
input wire	ctl_inc_dec;
input wire	ctl_inc_zero;
input wire	ctl_al_we;
input wire	ctl_ab_mux_inc;
input wire	ctl_inc_limit6;
output wire	address_is_1;
inout wire	[15:0] abus;
output wire	[15:0] address;

wire	SYNTHESIZED_WIRE_0;
reg	[15:0] SYNTHESIZED_WIRE_9;
wire	[15:0] SYNTHESIZED_WIRE_10;
wire	[15:0] SYNTHESIZED_WIRE_3;
wire	[15:0] SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	[15:0] SYNTHESIZED_WIRE_7;




assign	SYNTHESIZED_WIRE_4 = {SYNTHESIZED_WIRE_0,SYNTHESIZED_WIRE_0,SYNTHESIZED_WIRE_0,SYNTHESIZED_WIRE_0,SYNTHESIZED_WIRE_0,SYNTHESIZED_WIRE_0,SYNTHESIZED_WIRE_0,SYNTHESIZED_WIRE_0,SYNTHESIZED_WIRE_0,SYNTHESIZED_WIRE_0,SYNTHESIZED_WIRE_0,SYNTHESIZED_WIRE_0,SYNTHESIZED_WIRE_0,SYNTHESIZED_WIRE_0,SYNTHESIZED_WIRE_0,SYNTHESIZED_WIRE_0} & SYNTHESIZED_WIRE_9;

assign	SYNTHESIZED_WIRE_3 = {ctl_ab_mux_inc,ctl_ab_mux_inc,ctl_ab_mux_inc,ctl_ab_mux_inc,ctl_ab_mux_inc,ctl_ab_mux_inc,ctl_ab_mux_inc,ctl_ab_mux_inc,ctl_ab_mux_inc,ctl_ab_mux_inc,ctl_ab_mux_inc,ctl_ab_mux_inc,ctl_ab_mux_inc,ctl_ab_mux_inc,ctl_ab_mux_inc,ctl_ab_mux_inc} & SYNTHESIZED_WIRE_10;

assign	address = SYNTHESIZED_WIRE_3 | SYNTHESIZED_WIRE_4;

assign	SYNTHESIZED_WIRE_0 =  ~ctl_ab_mux_inc;

assign	SYNTHESIZED_WIRE_5 =  ~ctl_inc_zero;

assign	SYNTHESIZED_WIRE_7 = {SYNTHESIZED_WIRE_5,SYNTHESIZED_WIRE_5,SYNTHESIZED_WIRE_5,SYNTHESIZED_WIRE_5,SYNTHESIZED_WIRE_5,SYNTHESIZED_WIRE_5,SYNTHESIZED_WIRE_5,SYNTHESIZED_WIRE_5,SYNTHESIZED_WIRE_5,SYNTHESIZED_WIRE_5,SYNTHESIZED_WIRE_5,SYNTHESIZED_WIRE_5,SYNTHESIZED_WIRE_5,SYNTHESIZED_WIRE_5,SYNTHESIZED_WIRE_5,SYNTHESIZED_WIRE_5} & SYNTHESIZED_WIRE_9;

assign	abus[15] = ctl_bus_inc_we ? SYNTHESIZED_WIRE_7[15] : 1'bz;
assign	abus[14] = ctl_bus_inc_we ? SYNTHESIZED_WIRE_7[14] : 1'bz;
assign	abus[13] = ctl_bus_inc_we ? SYNTHESIZED_WIRE_7[13] : 1'bz;
assign	abus[12] = ctl_bus_inc_we ? SYNTHESIZED_WIRE_7[12] : 1'bz;
assign	abus[11] = ctl_bus_inc_we ? SYNTHESIZED_WIRE_7[11] : 1'bz;
assign	abus[10] = ctl_bus_inc_we ? SYNTHESIZED_WIRE_7[10] : 1'bz;
assign	abus[9] = ctl_bus_inc_we ? SYNTHESIZED_WIRE_7[9] : 1'bz;
assign	abus[8] = ctl_bus_inc_we ? SYNTHESIZED_WIRE_7[8] : 1'bz;
assign	abus[7] = ctl_bus_inc_we ? SYNTHESIZED_WIRE_7[7] : 1'bz;
assign	abus[6] = ctl_bus_inc_we ? SYNTHESIZED_WIRE_7[6] : 1'bz;
assign	abus[5] = ctl_bus_inc_we ? SYNTHESIZED_WIRE_7[5] : 1'bz;
assign	abus[4] = ctl_bus_inc_we ? SYNTHESIZED_WIRE_7[4] : 1'bz;
assign	abus[3] = ctl_bus_inc_we ? SYNTHESIZED_WIRE_7[3] : 1'bz;
assign	abus[2] = ctl_bus_inc_we ? SYNTHESIZED_WIRE_7[2] : 1'bz;
assign	abus[1] = ctl_bus_inc_we ? SYNTHESIZED_WIRE_7[1] : 1'bz;
assign	abus[0] = ctl_bus_inc_we ? SYNTHESIZED_WIRE_7[0] : 1'bz;


always@(ctl_al_we or SYNTHESIZED_WIRE_10)
begin
if (ctl_al_we)
	SYNTHESIZED_WIRE_9 <= SYNTHESIZED_WIRE_10;
end


inc_dec	b2v_inst_inc_dec(
	.limit6(ctl_inc_limit6),
	.decrement(ctl_inc_dec),
	.carry_in(ctl_inc_cy),
	.d(abus),
	.address_is_1(address_is_1),
	.address(SYNTHESIZED_WIRE_10));


endmodule
