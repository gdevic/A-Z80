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
// CREATED		"Fri Aug 15 23:00:54 2014"

module control_pins_n(
	nINT,
	nNMI,
	nRESET,
	nBUSRQ,
	m1,
	mreq,
	iorq,
	rd,
	wr,
	rfsh,
	busack,
	CPUCLK,
	pin_control_oe,
	nWAIT,
	in_halt,
	nM1,
	nMREQ,
	nIORQ,
	nRD,
	nWR,
	nRFSH,
	nHALT,
	nBUSACK,
	nmi,
	busrq,
	clk,
	intr,
	mwait,
	reset_in
);


input wire	nINT;
input wire	nNMI;
input wire	nRESET;
input wire	nBUSRQ;
input wire	m1;
input wire	mreq;
input wire	iorq;
input wire	rd;
input wire	wr;
input wire	rfsh;
input wire	busack;
input wire	CPUCLK;
input wire	pin_control_oe;
input wire	nWAIT;
input wire	in_halt;
output wire	nM1;
output wire	nMREQ;
output wire	nIORQ;
output wire	nRD;
output wire	nWR;
output wire	nRFSH;
output wire	nHALT;
output wire	nBUSACK;
output wire	nmi;
output wire	busrq;
output wire	clk;
output wire	intr;
output wire	mwait;
output wire	reset_in;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;

assign	clk = CPUCLK;



assign	nM1 =  ~m1;

assign	nMREQ = pin_control_oe ? SYNTHESIZED_WIRE_0 : 1'bz;

assign	nIORQ = pin_control_oe ? SYNTHESIZED_WIRE_1 : 1'bz;

assign	nRD = pin_control_oe ? SYNTHESIZED_WIRE_2 : 1'bz;

assign	nWR = pin_control_oe ? SYNTHESIZED_WIRE_3 : 1'bz;

assign	nRFSH = pin_control_oe ? SYNTHESIZED_WIRE_4 : 1'bz;

assign	SYNTHESIZED_WIRE_4 =  ~rfsh;

assign	busrq =  ~nBUSRQ;

assign	nHALT =  ~in_halt;

assign	mwait =  ~nWAIT;

assign	nBUSACK =  ~busack;

assign	intr =  ~nINT;

assign	nmi =  ~nNMI;

assign	reset_in =  ~nRESET;

assign	SYNTHESIZED_WIRE_3 =  ~wr;

assign	SYNTHESIZED_WIRE_2 =  ~rd;

assign	SYNTHESIZED_WIRE_0 =  ~mreq;

assign	SYNTHESIZED_WIRE_1 =  ~iorq;


endmodule
