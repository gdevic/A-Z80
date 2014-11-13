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
// CREATED		"Thu Nov 13 23:03:02 2014"

module control_pins_n(
	m1,
	mreq,
	iorq,
	rd,
	wr,
	rfsh,
	busack,
	CPUCLK,
	pin_control_oe,
	in_halt,
	pin_nWAIT,
	pin_nBUSRQ,
	pin_nINT,
	pin_nNMI,
	pin_nRESET,
	nmi,
	busrq,
	clk,
	intr,
	mwait,
	reset_in,
	pin_nM1,
	pin_nMREQ,
	pin_nIORQ,
	pin_nRD,
	pin_nWR,
	pin_nRFSH,
	pin_nHALT,
	pin_nBUSACK
);


input wire	m1;
input wire	mreq;
input wire	iorq;
input wire	rd;
input wire	wr;
input wire	rfsh;
input wire	busack;
input wire	CPUCLK;
input wire	pin_control_oe;
input wire	in_halt;
input wire	pin_nWAIT;
input wire	pin_nBUSRQ;
input wire	pin_nINT;
input wire	pin_nNMI;
input wire	pin_nRESET;
output wire	nmi;
output wire	busrq;
output wire	clk;
output wire	intr;
output wire	mwait;
output wire	reset_in;
output wire	pin_nM1;
output wire	pin_nMREQ;
output wire	pin_nIORQ;
output wire	pin_nRD;
output wire	pin_nWR;
output wire	pin_nRFSH;
output wire	pin_nHALT;
output wire	pin_nBUSACK;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;

assign	clk = CPUCLK;



assign	pin_nM1 =  ~m1;

assign	pin_nMREQ = pin_control_oe ? SYNTHESIZED_WIRE_0 : 1'bz;

assign	pin_nIORQ = pin_control_oe ? SYNTHESIZED_WIRE_1 : 1'bz;

assign	pin_nRD = pin_control_oe ? SYNTHESIZED_WIRE_2 : 1'bz;

assign	pin_nWR = pin_control_oe ? SYNTHESIZED_WIRE_3 : 1'bz;

assign	pin_nRFSH = pin_control_oe ? SYNTHESIZED_WIRE_4 : 1'bz;

assign	SYNTHESIZED_WIRE_4 =  ~rfsh;

assign	busrq =  ~pin_nBUSRQ;

assign	pin_nHALT =  ~in_halt;

assign	mwait =  ~pin_nWAIT;

assign	pin_nBUSACK =  ~busack;

assign	intr =  ~pin_nINT;

assign	nmi =  ~pin_nNMI;

assign	reset_in =  ~pin_nRESET;

assign	SYNTHESIZED_WIRE_3 =  ~wr;

assign	SYNTHESIZED_WIRE_2 =  ~rd;

assign	SYNTHESIZED_WIRE_0 =  ~mreq;

assign	SYNTHESIZED_WIRE_1 =  ~iorq;


endmodule
