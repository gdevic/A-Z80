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
// CREATED		"Sun May 18 15:08:10 2014"

module alu_bit_select(
	oe,
	bsel,
	bs_out_high,
	bs_out_low
);


input wire	oe;
input wire	[2:0] bsel;
output wire	[3:0] bs_out_high;
output wire	[3:0] bs_out_low;

wire	[3:0] bs_out_high_ALTERA_SYNTHESIZED;
wire	[3:0] bs_out_low_ALTERA_SYNTHESIZED;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_19;




assign	SYNTHESIZED_WIRE_12 = SYNTHESIZED_WIRE_20 & SYNTHESIZED_WIRE_21 & SYNTHESIZED_WIRE_22;

assign	SYNTHESIZED_WIRE_13 = bsel[0] & SYNTHESIZED_WIRE_21 & SYNTHESIZED_WIRE_22;

assign	SYNTHESIZED_WIRE_14 = SYNTHESIZED_WIRE_20 & bsel[1] & SYNTHESIZED_WIRE_22;

assign	SYNTHESIZED_WIRE_15 = bsel[0] & bsel[1] & SYNTHESIZED_WIRE_22;

assign	SYNTHESIZED_WIRE_16 = SYNTHESIZED_WIRE_20 & SYNTHESIZED_WIRE_21 & bsel[2];

assign	SYNTHESIZED_WIRE_17 = bsel[0] & SYNTHESIZED_WIRE_21 & bsel[2];

assign	SYNTHESIZED_WIRE_18 = SYNTHESIZED_WIRE_20 & bsel[1] & bsel[2];

assign	SYNTHESIZED_WIRE_19 = bsel[0] & bsel[1] & bsel[2];

assign	SYNTHESIZED_WIRE_20 =  ~bsel[0];

assign	SYNTHESIZED_WIRE_21 =  ~bsel[1];

assign	SYNTHESIZED_WIRE_22 =  ~bsel[2];

assign	bs_out_low_ALTERA_SYNTHESIZED[0] = oe ? SYNTHESIZED_WIRE_12 : 1'bz;

assign	bs_out_low_ALTERA_SYNTHESIZED[1] = oe ? SYNTHESIZED_WIRE_13 : 1'bz;

assign	bs_out_low_ALTERA_SYNTHESIZED[2] = oe ? SYNTHESIZED_WIRE_14 : 1'bz;

assign	bs_out_low_ALTERA_SYNTHESIZED[3] = oe ? SYNTHESIZED_WIRE_15 : 1'bz;

assign	bs_out_high_ALTERA_SYNTHESIZED[0] = oe ? SYNTHESIZED_WIRE_16 : 1'bz;

assign	bs_out_high_ALTERA_SYNTHESIZED[1] = oe ? SYNTHESIZED_WIRE_17 : 1'bz;

assign	bs_out_high_ALTERA_SYNTHESIZED[2] = oe ? SYNTHESIZED_WIRE_18 : 1'bz;

assign	bs_out_high_ALTERA_SYNTHESIZED[3] = oe ? SYNTHESIZED_WIRE_19 : 1'bz;

assign	bs_out_high = bs_out_high_ALTERA_SYNTHESIZED;
assign	bs_out_low = bs_out_low_ALTERA_SYNTHESIZED;

endmodule
