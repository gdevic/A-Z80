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
// CREATED		"Sun Aug 17 13:54:07 2014"

module reset(
	reset_in,
	clk,
	M1,
	T2,
	fpga_reset,
	clrpc,
	reset,
	nreset
);


input wire	reset_in;
input wire	clk;
input wire	M1;
input wire	T2;
input wire	fpga_reset;
output reg	clrpc;
output wire	reset;
output wire	nreset;

wire	nclk;
reg	x1;
wire	x2;
wire	x3;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_4;
reg	DFF_res;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;

assign	reset = DFF_res;
assign	nreset = SYNTHESIZED_WIRE_9;
assign	SYNTHESIZED_WIRE_1 = 1;
assign	SYNTHESIZED_WIRE_6 = 1;
assign	SYNTHESIZED_WIRE_8 = 1;




always@(posedge nclk or negedge SYNTHESIZED_WIRE_1 or negedge SYNTHESIZED_WIRE_11)
begin
if (!SYNTHESIZED_WIRE_1)
	begin
	x1 <= 0;
	end
else
	begin
if (!SYNTHESIZED_WIRE_11)
	begin
	x1 <= 1;
	end
else
	begin
	x1 <= ~x1 & reset_in | x1 & ~SYNTHESIZED_WIRE_2;
	end
	end
end

assign	SYNTHESIZED_WIRE_2 =  ~reset_in;

assign	x2 = x1 & SYNTHESIZED_WIRE_12;

assign	SYNTHESIZED_WIRE_12 = M1 & T2;

assign	x3 = x1 & SYNTHESIZED_WIRE_4;


assign	SYNTHESIZED_WIRE_9 =  ~DFF_res;


assign	SYNTHESIZED_WIRE_4 =  ~SYNTHESIZED_WIRE_12;


assign	nclk =  ~clk;

assign	SYNTHESIZED_WIRE_11 =  ~fpga_reset;


always@(posedge clk or negedge SYNTHESIZED_WIRE_6 or negedge SYNTHESIZED_WIRE_11)
begin
if (!SYNTHESIZED_WIRE_6)
	begin
	DFF_res <= 0;
	end
else
if (!SYNTHESIZED_WIRE_11)
	begin
	DFF_res <= 1;
	end
else
	begin
	DFF_res <= x3;
	end
end


always@(posedge nclk or negedge SYNTHESIZED_WIRE_9 or negedge SYNTHESIZED_WIRE_8)
begin
if (!SYNTHESIZED_WIRE_9)
	begin
	clrpc <= 0;
	end
else
	begin
if (!SYNTHESIZED_WIRE_8)
	begin
	clrpc <= 1;
	end
else
	begin
	clrpc <= ~clrpc & x2 | clrpc & ~SYNTHESIZED_WIRE_12;
	end
	end
end


endmodule
