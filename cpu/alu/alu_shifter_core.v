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
// CREATED		"Sun May 18 12:39:37 2014"

module alu_shifter_core(
	shift_enable,
	shift_right,
	shift_in,
	oe,
	db,
	cy_out,
	out
);


input wire	shift_enable;
input wire	shift_right;
input wire	shift_in;
input wire	oe;
input wire	[7:0] db;
output wire	cy_out;
output wire	[7:0] out;

wire	[7:0] out_ALTERA_SYNTHESIZED;
wire	SYNTHESIZED_WIRE_51;
wire	SYNTHESIZED_WIRE_52;
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
wire	SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_31;
wire	SYNTHESIZED_WIRE_32;
wire	SYNTHESIZED_WIRE_33;
wire	SYNTHESIZED_WIRE_34;
wire	SYNTHESIZED_WIRE_35;
wire	SYNTHESIZED_WIRE_36;
wire	SYNTHESIZED_WIRE_37;
wire	SYNTHESIZED_WIRE_38;
wire	SYNTHESIZED_WIRE_39;
wire	SYNTHESIZED_WIRE_40;
wire	SYNTHESIZED_WIRE_41;
wire	SYNTHESIZED_WIRE_42;
wire	SYNTHESIZED_WIRE_43;
wire	SYNTHESIZED_WIRE_44;
wire	SYNTHESIZED_WIRE_45;
wire	SYNTHESIZED_WIRE_46;
wire	SYNTHESIZED_WIRE_47;
wire	SYNTHESIZED_WIRE_48;
wire	SYNTHESIZED_WIRE_49;
wire	SYNTHESIZED_WIRE_50;




assign	SYNTHESIZED_WIRE_42 = db[0] & shift_right;

assign	SYNTHESIZED_WIRE_41 = db[7] & SYNTHESIZED_WIRE_51;

assign	SYNTHESIZED_WIRE_17 = db[0] & SYNTHESIZED_WIRE_52;

assign	SYNTHESIZED_WIRE_18 = shift_in & shift_enable & SYNTHESIZED_WIRE_51;

assign	SYNTHESIZED_WIRE_19 = db[1] & shift_enable & shift_right;

assign	SYNTHESIZED_WIRE_20 = db[1] & SYNTHESIZED_WIRE_52;

assign	SYNTHESIZED_WIRE_21 = db[0] & shift_enable & SYNTHESIZED_WIRE_51;

assign	SYNTHESIZED_WIRE_22 = db[2] & shift_enable & shift_right;

assign	SYNTHESIZED_WIRE_23 = db[2] & SYNTHESIZED_WIRE_52;

assign	SYNTHESIZED_WIRE_24 = db[1] & shift_enable & SYNTHESIZED_WIRE_51;

assign	SYNTHESIZED_WIRE_25 = db[3] & shift_enable & shift_right;

assign	SYNTHESIZED_WIRE_26 = db[3] & SYNTHESIZED_WIRE_52;

assign	SYNTHESIZED_WIRE_27 = db[2] & shift_enable & SYNTHESIZED_WIRE_51;

assign	SYNTHESIZED_WIRE_28 = db[4] & shift_enable & shift_right;

assign	SYNTHESIZED_WIRE_29 = db[4] & SYNTHESIZED_WIRE_52;

assign	SYNTHESIZED_WIRE_30 = db[3] & shift_enable & SYNTHESIZED_WIRE_51;

assign	SYNTHESIZED_WIRE_31 = db[5] & shift_enable & shift_right;

assign	SYNTHESIZED_WIRE_32 = db[5] & SYNTHESIZED_WIRE_52;

assign	SYNTHESIZED_WIRE_33 = db[4] & shift_enable & SYNTHESIZED_WIRE_51;

assign	SYNTHESIZED_WIRE_34 = db[6] & shift_enable & shift_right;

assign	SYNTHESIZED_WIRE_35 = db[6] & SYNTHESIZED_WIRE_52;

assign	SYNTHESIZED_WIRE_36 = db[5] & shift_enable & SYNTHESIZED_WIRE_51;

assign	SYNTHESIZED_WIRE_37 = db[7] & shift_enable & shift_right;

assign	SYNTHESIZED_WIRE_38 = db[7] & SYNTHESIZED_WIRE_52;

assign	SYNTHESIZED_WIRE_39 = db[6] & shift_enable & SYNTHESIZED_WIRE_51;

assign	SYNTHESIZED_WIRE_40 = shift_in & shift_enable & shift_right;

assign	SYNTHESIZED_WIRE_51 =  ~shift_right;

assign	SYNTHESIZED_WIRE_52 =  ~shift_enable;

assign	SYNTHESIZED_WIRE_43 = SYNTHESIZED_WIRE_17 | SYNTHESIZED_WIRE_18 | SYNTHESIZED_WIRE_19;

assign	SYNTHESIZED_WIRE_44 = SYNTHESIZED_WIRE_20 | SYNTHESIZED_WIRE_21 | SYNTHESIZED_WIRE_22;

assign	SYNTHESIZED_WIRE_45 = SYNTHESIZED_WIRE_23 | SYNTHESIZED_WIRE_24 | SYNTHESIZED_WIRE_25;

assign	SYNTHESIZED_WIRE_46 = SYNTHESIZED_WIRE_26 | SYNTHESIZED_WIRE_27 | SYNTHESIZED_WIRE_28;

assign	SYNTHESIZED_WIRE_47 = SYNTHESIZED_WIRE_29 | SYNTHESIZED_WIRE_30 | SYNTHESIZED_WIRE_31;

assign	SYNTHESIZED_WIRE_48 = SYNTHESIZED_WIRE_32 | SYNTHESIZED_WIRE_33 | SYNTHESIZED_WIRE_34;

assign	SYNTHESIZED_WIRE_49 = SYNTHESIZED_WIRE_35 | SYNTHESIZED_WIRE_36 | SYNTHESIZED_WIRE_37;

assign	SYNTHESIZED_WIRE_50 = SYNTHESIZED_WIRE_38 | SYNTHESIZED_WIRE_39 | SYNTHESIZED_WIRE_40;

assign	cy_out = SYNTHESIZED_WIRE_41 | SYNTHESIZED_WIRE_42;

assign	out_ALTERA_SYNTHESIZED[0] = oe ? SYNTHESIZED_WIRE_43 : 1'bz;

assign	out_ALTERA_SYNTHESIZED[1] = oe ? SYNTHESIZED_WIRE_44 : 1'bz;

assign	out_ALTERA_SYNTHESIZED[2] = oe ? SYNTHESIZED_WIRE_45 : 1'bz;

assign	out_ALTERA_SYNTHESIZED[3] = oe ? SYNTHESIZED_WIRE_46 : 1'bz;

assign	out_ALTERA_SYNTHESIZED[4] = oe ? SYNTHESIZED_WIRE_47 : 1'bz;

assign	out_ALTERA_SYNTHESIZED[5] = oe ? SYNTHESIZED_WIRE_48 : 1'bz;

assign	out_ALTERA_SYNTHESIZED[6] = oe ? SYNTHESIZED_WIRE_49 : 1'bz;

assign	out_ALTERA_SYNTHESIZED[7] = oe ? SYNTHESIZED_WIRE_50 : 1'bz;

assign	out = out_ALTERA_SYNTHESIZED;

endmodule
