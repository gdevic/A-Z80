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
// CREATED		"Sun Jul 06 08:32:07 2014"

module data_switch(
	ctl_sw_up,
	ctl_sw_down,
	db_down,
	db_up
);


input wire	ctl_sw_up;
input wire	ctl_sw_down;
inout wire	[7:0] db_down;
inout wire	[7:0] db_up;





assign	db_up[7] = ctl_sw_up ? db_down[7] : 1'bz;
assign	db_up[6] = ctl_sw_up ? db_down[6] : 1'bz;
assign	db_up[5] = ctl_sw_up ? db_down[5] : 1'bz;
assign	db_up[4] = ctl_sw_up ? db_down[4] : 1'bz;
assign	db_up[3] = ctl_sw_up ? db_down[3] : 1'bz;
assign	db_up[2] = ctl_sw_up ? db_down[2] : 1'bz;
assign	db_up[1] = ctl_sw_up ? db_down[1] : 1'bz;
assign	db_up[0] = ctl_sw_up ? db_down[0] : 1'bz;

assign	db_down[7] = ctl_sw_down ? db_up[7] : 1'bz;
assign	db_down[6] = ctl_sw_down ? db_up[6] : 1'bz;
assign	db_down[5] = ctl_sw_down ? db_up[5] : 1'bz;
assign	db_down[4] = ctl_sw_down ? db_up[4] : 1'bz;
assign	db_down[3] = ctl_sw_down ? db_up[3] : 1'bz;
assign	db_down[2] = ctl_sw_down ? db_up[2] : 1'bz;
assign	db_down[1] = ctl_sw_down ? db_up[1] : 1'bz;
assign	db_down[0] = ctl_sw_down ? db_up[0] : 1'bz;


endmodule
