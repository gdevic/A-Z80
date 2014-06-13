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
// CREATED		"Fri Jun 13 08:17:13 2014"

module address_pins(
	ctl_ab_we,
	ctl_ab_pin_oe,
	ab,
	apin
);


input wire	ctl_ab_we;
input wire	ctl_ab_pin_oe;
input wire	[15:0] ab;
output wire	[15:0] apin;

reg	[15:0] SYNTHESIZED_WIRE_0;




assign	apin[15] = ctl_ab_pin_oe ? SYNTHESIZED_WIRE_0[15] : 1'bz;
assign	apin[14] = ctl_ab_pin_oe ? SYNTHESIZED_WIRE_0[14] : 1'bz;
assign	apin[13] = ctl_ab_pin_oe ? SYNTHESIZED_WIRE_0[13] : 1'bz;
assign	apin[12] = ctl_ab_pin_oe ? SYNTHESIZED_WIRE_0[12] : 1'bz;
assign	apin[11] = ctl_ab_pin_oe ? SYNTHESIZED_WIRE_0[11] : 1'bz;
assign	apin[10] = ctl_ab_pin_oe ? SYNTHESIZED_WIRE_0[10] : 1'bz;
assign	apin[9] = ctl_ab_pin_oe ? SYNTHESIZED_WIRE_0[9] : 1'bz;
assign	apin[8] = ctl_ab_pin_oe ? SYNTHESIZED_WIRE_0[8] : 1'bz;
assign	apin[7] = ctl_ab_pin_oe ? SYNTHESIZED_WIRE_0[7] : 1'bz;
assign	apin[6] = ctl_ab_pin_oe ? SYNTHESIZED_WIRE_0[6] : 1'bz;
assign	apin[5] = ctl_ab_pin_oe ? SYNTHESIZED_WIRE_0[5] : 1'bz;
assign	apin[4] = ctl_ab_pin_oe ? SYNTHESIZED_WIRE_0[4] : 1'bz;
assign	apin[3] = ctl_ab_pin_oe ? SYNTHESIZED_WIRE_0[3] : 1'bz;
assign	apin[2] = ctl_ab_pin_oe ? SYNTHESIZED_WIRE_0[2] : 1'bz;
assign	apin[1] = ctl_ab_pin_oe ? SYNTHESIZED_WIRE_0[1] : 1'bz;
assign	apin[0] = ctl_ab_pin_oe ? SYNTHESIZED_WIRE_0[0] : 1'bz;


always@(ctl_ab_we or ab)
begin
if (ctl_ab_we)
	SYNTHESIZED_WIRE_0 <= ab;
end


endmodule
