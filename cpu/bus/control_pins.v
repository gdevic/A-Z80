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
// CREATED		"Sun Jul 06 08:31:51 2014"

module control_pins(
	ctl_bus_pin_oe,
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
	halt,
	mwait,
	busack,
	CPUCLK,
	nM1,
	nMREQ,
	nIORQ,
	nRD,
	nWR,
	nRFSH,
	nHALT,
	nWAIT,
	nBUSACK,
	int,
	nmi,
	reset,
	busrq,
	clk
);


input wire	ctl_bus_pin_oe;
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
input wire	halt;
input wire	mwait;
input wire	busack;
input wire	CPUCLK;
output wire	nM1;
output wire	nMREQ;
output wire	nIORQ;
output wire	nRD;
output wire	nWR;
output wire	nRFSH;
output wire	nHALT;
output wire	nWAIT;
output wire	nBUSACK;
output wire	int;
output wire	nmi;
output wire	reset;
output wire	busrq;
output wire	clk;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;

assign	clk = CPUCLK;



assign	nM1 =  ~m1;

assign	nMREQ = ctl_bus_pin_oe ? SYNTHESIZED_WIRE_0 : 1'bz;

assign	nIORQ = ctl_bus_pin_oe ? SYNTHESIZED_WIRE_1 : 1'bz;

assign	nRD = ctl_bus_pin_oe ? SYNTHESIZED_WIRE_2 : 1'bz;

assign	nWR = ctl_bus_pin_oe ? SYNTHESIZED_WIRE_3 : 1'bz;

assign	nRFSH = ctl_bus_pin_oe ? SYNTHESIZED_WIRE_4 : 1'bz;

assign	SYNTHESIZED_WIRE_4 =  ~rfsh;

assign	busrq =  ~nBUSRQ;

assign	nHALT =  ~halt;

assign	nWAIT =  ~mwait;

assign	nBUSACK =  ~busack;

assign	int =  ~nINT;

assign	nmi =  ~nNMI;

assign	reset =  ~nRESET;

assign	SYNTHESIZED_WIRE_3 =  ~wr;

assign	SYNTHESIZED_WIRE_2 =  ~rd;

assign	SYNTHESIZED_WIRE_0 =  ~mreq;

assign	SYNTHESIZED_WIRE_1 =  ~iorq;


endmodule
