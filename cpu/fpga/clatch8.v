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
// CREATED		"Mon Sep 15 09:54:16 2014"

module clatch8(
	clk,
	ena,
	D,
	Q
);


input wire	clk;
input wire	ena;
input wire	[7:0] D;
output wire	[7:0] Q;

wire	nena;
wire	[7:0] sel1;
wire	[7:0] sel2;
reg	[7:0] DFFE_mem;




assign	sel1 = D & {ena,ena,ena,ena,ena,ena,ena,ena};

assign	sel2 = DFFE_mem & {nena,nena,nena,nena,nena,nena,nena,nena};


always@(posedge clk)
begin
if (ena)
	begin
	DFFE_mem[7:0] <= D[7:0];
	end
end

assign	nena =  ~ena;

assign	Q = sel2 | sel1;


endmodule
