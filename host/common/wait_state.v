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
// CREATED		"Thu Dec 08 00:16:50 2016"

module wait_state(
	CLK,
	nM1,
	nMREQ,
	nWAIT_M1,
	nWAIT_Mem
);


input wire	CLK;
input wire	nM1;
input wire	nMREQ;
output wire	nWAIT_M1;
output wire	nWAIT_Mem;

reg	SYNTHESIZED_WIRE_1;
reg	DFF_inst3;
reg	DFF_inst2;
reg	DFF_inst5;
wire	SYNTHESIZED_WIRE_0;

assign	nWAIT_M1 = DFF_inst2;



assign	SYNTHESIZED_WIRE_0 =  ~SYNTHESIZED_WIRE_1;


always@(posedge CLK or negedge DFF_inst3)
begin
if (!DFF_inst3)
	begin
	DFF_inst2 <= 1;
	end
else
	begin
	DFF_inst2 <= nM1;
	end
end


always@(posedge CLK)
begin
	begin
	DFF_inst3 <= DFF_inst2;
	end
end


always@(posedge CLK)
begin
	begin
	SYNTHESIZED_WIRE_1 <= nMREQ;
	end
end


always@(posedge CLK)
begin
	begin
	DFF_inst5 <= SYNTHESIZED_WIRE_1;
	end
end

assign	nWAIT_Mem = ~(DFF_inst5 & SYNTHESIZED_WIRE_0);


endmodule
