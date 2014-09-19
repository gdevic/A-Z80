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
// CREATED		"Fri Sep 19 08:48:03 2014"

module mem_cell(
	we,
	clk,
	D,
	reset,
	Q
);


input wire	we;
input wire	clk;
input wire	D;
input wire	reset;
output reg	Q;

wire	SYNTHESIZED_WIRE_3;
reg	DFFE_hold;
wire	SYNTHESIZED_WIRE_2;





always@(posedge clk or negedge SYNTHESIZED_WIRE_3)
begin
if (!SYNTHESIZED_WIRE_3)
	begin
	Q <= 0;
	end
else
	begin
	Q <= DFFE_hold;
	end
end


always@(posedge SYNTHESIZED_WIRE_2 or negedge SYNTHESIZED_WIRE_3)
begin
if (!SYNTHESIZED_WIRE_3)
	begin
	DFFE_hold <= 0;
	end
else
if (we)
	begin
	DFFE_hold <= D;
	end
end

assign	SYNTHESIZED_WIRE_3 =  ~reset;

assign	SYNTHESIZED_WIRE_2 =  ~clk;


endmodule
