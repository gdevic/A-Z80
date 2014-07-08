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
// CREATED		"Mon Jul 07 22:16:26 2014"

module control_pins_p(
	ctl_bus_pin_oe,
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
	pBUSRQ,
	pINT,
	pNMI,
	pRESET,
	nmi,
	reset,
	busrq,
	clk,
	intr,
	pM1,
	pMREQ,
	pIORQ,
	pRD,
	pWR,
	pRFSH,
	pHALT,
	pWAIT,
	pBUSACK
);


input wire	ctl_bus_pin_oe;
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
input wire	pBUSRQ;
input wire	pINT;
input wire	pNMI;
input wire	pRESET;
output wire	nmi;
output wire	reset;
output wire	busrq;
output wire	clk;
output wire	intr;
output wire	pM1;
output wire	pMREQ;
output wire	pIORQ;
output wire	pRD;
output wire	pWR;
output wire	pRFSH;
output wire	pHALT;
output wire	pWAIT;
output wire	pBUSACK;


assign	nmi = pNMI;
assign	reset = pRESET;
assign	busrq = pBUSRQ;
assign	clk = CPUCLK;
assign	intr = pINT;
assign	pM1 = m1;
assign	pHALT = halt;
assign	pWAIT = mwait;
assign	pBUSACK = busack;



assign	pMREQ = ctl_bus_pin_oe ? mreq : 1'bz;

assign	pIORQ = ctl_bus_pin_oe ? iorq : 1'bz;

assign	pRD = ctl_bus_pin_oe ? rd : 1'bz;

assign	pWR = ctl_bus_pin_oe ? wr : 1'bz;

assign	pRFSH = ctl_bus_pin_oe ? rfsh : 1'bz;


endmodule
