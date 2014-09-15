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
// CREATED		"Mon Sep 15 09:24:47 2014"

module clatch1(
	clk,
	ena,
	D,
	Q
);


input wire	clk;
input wire	ena;
input wire	D;
output wire	Q;

wire	nena;
reg	DFFE_mem;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;




assign	SYNTHESIZED_WIRE_1 = D & ena;

assign	SYNTHESIZED_WIRE_0 = DFFE_mem & nena;


always@(posedge clk)
begin
if (ena)
	begin
	DFFE_mem <= D;
	end
end

assign	nena =  ~ena;

assign	Q = SYNTHESIZED_WIRE_0 | SYNTHESIZED_WIRE_1;


endmodule
