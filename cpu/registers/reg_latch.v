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
// CREATED		"Wed May 14 22:45:22 2014"

module reg_latch(
	we,
	oen,
	db
);


input wire	we;
input wire	oen;
inout wire	[7:0] db;

reg	[7:0] SYNTHESIZED_WIRE_0;




assign	db[7] = oen ? SYNTHESIZED_WIRE_0[7] : 1'bz;
assign	db[6] = oen ? SYNTHESIZED_WIRE_0[6] : 1'bz;
assign	db[5] = oen ? SYNTHESIZED_WIRE_0[5] : 1'bz;
assign	db[4] = oen ? SYNTHESIZED_WIRE_0[4] : 1'bz;
assign	db[3] = oen ? SYNTHESIZED_WIRE_0[3] : 1'bz;
assign	db[2] = oen ? SYNTHESIZED_WIRE_0[2] : 1'bz;
assign	db[1] = oen ? SYNTHESIZED_WIRE_0[1] : 1'bz;
assign	db[0] = oen ? SYNTHESIZED_WIRE_0[0] : 1'bz;


always@(we or db)
begin
if (we)
	SYNTHESIZED_WIRE_0 <= db;
end


endmodule
