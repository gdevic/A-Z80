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
// CREATED		"Tue Sep 09 17:33:45 2014"

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
	pin_RESET,
	pin_WAIT,
	pin_BUSRQ,
	pin_INT,
	pin_NMI,
	nmi,
	busrq,
	clk,
	intr,
	mwait,
	reset_in,
	pin_M1,
	pin_MREQ,
	pin_IORQ,
	pin_RD,
	pin_WR,
	pin_RFSH,
	pin_HALT,
	pin_BUSACK
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
input wire	pin_RESET;
input wire	pin_WAIT;
input wire	pin_BUSRQ;
input wire	pin_INT;
input wire	pin_NMI;
output wire	nmi;
output wire	busrq;
output wire	clk;
output wire	intr;
output wire	mwait;
output wire	reset_in;
output wire	pin_M1;
output wire	pin_MREQ;
output wire	pin_IORQ;
output wire	pin_RD;
output wire	pin_WR;
output wire	pin_RFSH;
output wire	pin_HALT;
output wire	pin_BUSACK;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;

assign	clk = CPUCLK;



assign	pin_M1 =  ~m1;

assign	pin_MREQ = pin_control_oe ? SYNTHESIZED_WIRE_0 : 1'bz;

assign	pin_IORQ = pin_control_oe ? SYNTHESIZED_WIRE_1 : 1'bz;

assign	pin_RD = pin_control_oe ? SYNTHESIZED_WIRE_2 : 1'bz;

assign	pin_WR = pin_control_oe ? SYNTHESIZED_WIRE_3 : 1'bz;

assign	pin_RFSH = pin_control_oe ? SYNTHESIZED_WIRE_4 : 1'bz;

assign	SYNTHESIZED_WIRE_4 =  ~rfsh;

assign	busrq =  ~pin_BUSRQ;

assign	pin_HALT =  ~in_halt;

assign	mwait =  ~pin_WAIT;

assign	pin_BUSACK =  ~busack;

assign	intr =  ~pin_INT;

assign	nmi =  ~pin_NMI;

assign	reset_in =  ~pin_RESET;

assign	SYNTHESIZED_WIRE_3 =  ~wr;

assign	SYNTHESIZED_WIRE_2 =  ~rd;

assign	SYNTHESIZED_WIRE_0 =  ~mreq;

assign	SYNTHESIZED_WIRE_1 =  ~iorq;


endmodule
