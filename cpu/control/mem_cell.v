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
// CREATED		"Wed Oct 29 05:42:00 2014"

module mem_cell(
	we,
	clk,
	D,
	nreset,
	Q
);


input wire	we;
input wire	clk;
input wire	D;
input wire	nreset;
output reg	Q;

reg	DFFE_hold;
wire	SYNTHESIZED_WIRE_0;





always@(posedge clk or negedge nreset)
begin
if (!nreset)
	begin
	Q <= 0;
	end
else
	begin
	Q <= DFFE_hold;
	end
end


always@(posedge SYNTHESIZED_WIRE_0 or negedge nreset)
begin
if (!nreset)
	begin
	DFFE_hold <= 0;
	end
else
if (we)
	begin
	DFFE_hold <= D;
	end
end

assign	SYNTHESIZED_WIRE_0 =  ~clk;


endmodule
