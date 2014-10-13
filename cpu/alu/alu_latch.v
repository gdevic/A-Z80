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
// CREATED		"Mon Oct 13 12:12:06 2014"

module alu_latch(
	D,
	ENA,
	NCLK,
	Q
);


input wire	D;
input wire	ENA;
input wire	NCLK;
output reg	Q;

wire	SYNTHESIZED_WIRE_0;





always@(SYNTHESIZED_WIRE_0 or D)
begin
if (SYNTHESIZED_WIRE_0)
	Q <= D;
end

assign	SYNTHESIZED_WIRE_0 = ENA & NCLK;


endmodule
