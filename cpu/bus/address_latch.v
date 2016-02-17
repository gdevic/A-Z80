// Copyright (C) 1991-2013 Altera Corporation
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
// VERSION		"Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"
// CREATED		"Wed Feb 17 00:27:29 2016"

module address_latch(
	ctl_inc_cy,
	ctl_inc_dec,
	ctl_inc_zero,
	ctl_al_we,
	ctl_inc_limit6,
	ctl_bus_inc_oe,
	clk,
	ctl_apin_mux,
	ctl_apin_mux2,
	nreset,
	address_is_1,
	abus,
	address
);


input wire	ctl_inc_cy;
input wire	ctl_inc_dec;
input wire	ctl_inc_zero;
input wire	ctl_al_we;
input wire	ctl_inc_limit6;
input wire	ctl_bus_inc_oe;
input wire	clk;
input wire	ctl_apin_mux;
input wire	ctl_apin_mux2;
input wire	nreset;
output wire	address_is_1;
inout wire	[15:0] abus;
output wire	[15:0] address;

reg	[15:0] Q;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	[15:0] SYNTHESIZED_WIRE_4;
wire	[15:0] SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_6;
wire	[15:0] SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_12;





always@(posedge clk)
begin
if (SYNTHESIZED_WIRE_0)
	begin
	Q[15:0] <= abus[15:0];
	end
end

assign	address_is_1 = ~(SYNTHESIZED_WIRE_1 | SYNTHESIZED_WIRE_2);

assign	SYNTHESIZED_WIRE_11 = {SYNTHESIZED_WIRE_3,SYNTHESIZED_WIRE_3,SYNTHESIZED_WIRE_3,SYNTHESIZED_WIRE_3,SYNTHESIZED_WIRE_3,SYNTHESIZED_WIRE_3,SYNTHESIZED_WIRE_3,SYNTHESIZED_WIRE_3,SYNTHESIZED_WIRE_3,SYNTHESIZED_WIRE_3,SYNTHESIZED_WIRE_3,SYNTHESIZED_WIRE_3,SYNTHESIZED_WIRE_3,SYNTHESIZED_WIRE_3,SYNTHESIZED_WIRE_3,SYNTHESIZED_WIRE_3} & SYNTHESIZED_WIRE_4;

assign	abus[15] = ctl_bus_inc_oe ? SYNTHESIZED_WIRE_11[15] : 1'bz;
assign	abus[14] = ctl_bus_inc_oe ? SYNTHESIZED_WIRE_11[14] : 1'bz;
assign	abus[13] = ctl_bus_inc_oe ? SYNTHESIZED_WIRE_11[13] : 1'bz;
assign	abus[12] = ctl_bus_inc_oe ? SYNTHESIZED_WIRE_11[12] : 1'bz;
assign	abus[11] = ctl_bus_inc_oe ? SYNTHESIZED_WIRE_11[11] : 1'bz;
assign	abus[10] = ctl_bus_inc_oe ? SYNTHESIZED_WIRE_11[10] : 1'bz;
assign	abus[9] = ctl_bus_inc_oe ? SYNTHESIZED_WIRE_11[9] : 1'bz;
assign	abus[8] = ctl_bus_inc_oe ? SYNTHESIZED_WIRE_11[8] : 1'bz;
assign	abus[7] = ctl_bus_inc_oe ? SYNTHESIZED_WIRE_11[7] : 1'bz;
assign	abus[6] = ctl_bus_inc_oe ? SYNTHESIZED_WIRE_11[6] : 1'bz;
assign	abus[5] = ctl_bus_inc_oe ? SYNTHESIZED_WIRE_11[5] : 1'bz;
assign	abus[4] = ctl_bus_inc_oe ? SYNTHESIZED_WIRE_11[4] : 1'bz;
assign	abus[3] = ctl_bus_inc_oe ? SYNTHESIZED_WIRE_11[3] : 1'bz;
assign	abus[2] = ctl_bus_inc_oe ? SYNTHESIZED_WIRE_11[2] : 1'bz;
assign	abus[1] = ctl_bus_inc_oe ? SYNTHESIZED_WIRE_11[1] : 1'bz;
assign	abus[0] = ctl_bus_inc_oe ? SYNTHESIZED_WIRE_11[0] : 1'bz;

assign	SYNTHESIZED_WIRE_1 = Q[7] | Q[5] | Q[6] | Q[4] | Q[2] | Q[3] | Q[1] | SYNTHESIZED_WIRE_6;

assign	SYNTHESIZED_WIRE_2 = Q[15] | Q[13] | Q[14] | Q[12] | Q[10] | Q[11] | Q[9] | Q[8];


address_mux	b2v_inst7(
	.select(ctl_apin_mux2),
	.in0(SYNTHESIZED_WIRE_7),
	.in1(Q),
	.out(address));


inc_dec	b2v_inst_inc_dec(
	.limit6(ctl_inc_limit6),
	.decrement(ctl_inc_dec),
	.carry_in(ctl_inc_cy),
	.d(Q),
	.address(SYNTHESIZED_WIRE_4));


address_mux	b2v_mux(
	.select(ctl_apin_mux),
	.in0(abus),
	.in1(SYNTHESIZED_WIRE_11),
	.out(SYNTHESIZED_WIRE_7));

assign	SYNTHESIZED_WIRE_6 =  ~Q[0];

assign	SYNTHESIZED_WIRE_12 =  ~nreset;

assign	SYNTHESIZED_WIRE_0 = SYNTHESIZED_WIRE_12 | ctl_al_we;

assign	SYNTHESIZED_WIRE_3 = ~(SYNTHESIZED_WIRE_12 | ctl_inc_zero);


endmodule
