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
// CREATED		"Fri Jun 13 08:17:25 2014"

module data_pins(
	ctl_db_we,
	ctl_db_pin_re,
	ctl_db_pin_oe,
	ctl_db_oe,
	db,
	dpin
);


input wire	ctl_db_we;
input wire	ctl_db_pin_re;
input wire	ctl_db_pin_oe;
input wire	ctl_db_oe;
inout wire	[7:0] db;
inout wire	[7:0] dpin;

wire	[7:0] SYNTHESIZED_WIRE_0;
wire	[7:0] SYNTHESIZED_WIRE_1;
reg	[7:0] SYNTHESIZED_WIRE_6;
wire	[7:0] SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;




assign	SYNTHESIZED_WIRE_1 = {ctl_db_we,ctl_db_we,ctl_db_we,ctl_db_we,ctl_db_we,ctl_db_we,ctl_db_we,ctl_db_we} & db;

assign	SYNTHESIZED_WIRE_0 = {ctl_db_pin_re,ctl_db_pin_re,ctl_db_pin_re,ctl_db_pin_re,ctl_db_pin_re,ctl_db_pin_re,ctl_db_pin_re,ctl_db_pin_re} & dpin;

assign	SYNTHESIZED_WIRE_4 = SYNTHESIZED_WIRE_0 | SYNTHESIZED_WIRE_1;

assign	SYNTHESIZED_WIRE_5 = ctl_db_we | ctl_db_pin_re;

assign	db[7] = ctl_db_oe ? SYNTHESIZED_WIRE_6[7] : 1'bz;
assign	db[6] = ctl_db_oe ? SYNTHESIZED_WIRE_6[6] : 1'bz;
assign	db[5] = ctl_db_oe ? SYNTHESIZED_WIRE_6[5] : 1'bz;
assign	db[4] = ctl_db_oe ? SYNTHESIZED_WIRE_6[4] : 1'bz;
assign	db[3] = ctl_db_oe ? SYNTHESIZED_WIRE_6[3] : 1'bz;
assign	db[2] = ctl_db_oe ? SYNTHESIZED_WIRE_6[2] : 1'bz;
assign	db[1] = ctl_db_oe ? SYNTHESIZED_WIRE_6[1] : 1'bz;
assign	db[0] = ctl_db_oe ? SYNTHESIZED_WIRE_6[0] : 1'bz;

assign	dpin[7] = ctl_db_pin_oe ? SYNTHESIZED_WIRE_6[7] : 1'bz;
assign	dpin[6] = ctl_db_pin_oe ? SYNTHESIZED_WIRE_6[6] : 1'bz;
assign	dpin[5] = ctl_db_pin_oe ? SYNTHESIZED_WIRE_6[5] : 1'bz;
assign	dpin[4] = ctl_db_pin_oe ? SYNTHESIZED_WIRE_6[4] : 1'bz;
assign	dpin[3] = ctl_db_pin_oe ? SYNTHESIZED_WIRE_6[3] : 1'bz;
assign	dpin[2] = ctl_db_pin_oe ? SYNTHESIZED_WIRE_6[2] : 1'bz;
assign	dpin[1] = ctl_db_pin_oe ? SYNTHESIZED_WIRE_6[1] : 1'bz;
assign	dpin[0] = ctl_db_pin_oe ? SYNTHESIZED_WIRE_6[0] : 1'bz;


always@(SYNTHESIZED_WIRE_5 or SYNTHESIZED_WIRE_4)
begin
if (SYNTHESIZED_WIRE_5)
	SYNTHESIZED_WIRE_6 <= SYNTHESIZED_WIRE_4;
end


endmodule
