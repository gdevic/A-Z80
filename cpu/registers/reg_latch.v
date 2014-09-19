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
// CREATED		"Thu Sep 18 21:13:57 2014"

module reg_latch(
	we,
	oe,
	nclk,
	db
);


input wire	we;
input wire	oe;
input wire	nclk;
inout wire	[7:0] db;

reg	[7:0] DFFE_reg;




assign	db[7] = oe ? DFFE_reg[7] : 1'bz;
assign	db[6] = oe ? DFFE_reg[6] : 1'bz;
assign	db[5] = oe ? DFFE_reg[5] : 1'bz;
assign	db[4] = oe ? DFFE_reg[4] : 1'bz;
assign	db[3] = oe ? DFFE_reg[3] : 1'bz;
assign	db[2] = oe ? DFFE_reg[2] : 1'bz;
assign	db[1] = oe ? DFFE_reg[1] : 1'bz;
assign	db[0] = oe ? DFFE_reg[0] : 1'bz;


always@(posedge nclk)
begin
if (we)
	begin
	DFFE_reg[7:0] <= db[7:0];
	end
end


endmodule
