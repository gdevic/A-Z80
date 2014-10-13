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
// CREATED		"Mon Oct 13 12:40:27 2014"

module address_pins(
	bus_ab_pin_oe,
	bus_ab_pin_we,
	address,
	abus
);


input wire	bus_ab_pin_oe;
input wire	bus_ab_pin_we;
input wire	[15:0] address;
output wire	[15:0] abus;

reg	[15:0] SYNTHESIZED_WIRE_0;





always@(bus_ab_pin_we or address)
begin
if (bus_ab_pin_we)
	SYNTHESIZED_WIRE_0 <= address;
end

assign	abus[15] = bus_ab_pin_oe ? SYNTHESIZED_WIRE_0[15] : 1'bz;
assign	abus[14] = bus_ab_pin_oe ? SYNTHESIZED_WIRE_0[14] : 1'bz;
assign	abus[13] = bus_ab_pin_oe ? SYNTHESIZED_WIRE_0[13] : 1'bz;
assign	abus[12] = bus_ab_pin_oe ? SYNTHESIZED_WIRE_0[12] : 1'bz;
assign	abus[11] = bus_ab_pin_oe ? SYNTHESIZED_WIRE_0[11] : 1'bz;
assign	abus[10] = bus_ab_pin_oe ? SYNTHESIZED_WIRE_0[10] : 1'bz;
assign	abus[9] = bus_ab_pin_oe ? SYNTHESIZED_WIRE_0[9] : 1'bz;
assign	abus[8] = bus_ab_pin_oe ? SYNTHESIZED_WIRE_0[8] : 1'bz;
assign	abus[7] = bus_ab_pin_oe ? SYNTHESIZED_WIRE_0[7] : 1'bz;
assign	abus[6] = bus_ab_pin_oe ? SYNTHESIZED_WIRE_0[6] : 1'bz;
assign	abus[5] = bus_ab_pin_oe ? SYNTHESIZED_WIRE_0[5] : 1'bz;
assign	abus[4] = bus_ab_pin_oe ? SYNTHESIZED_WIRE_0[4] : 1'bz;
assign	abus[3] = bus_ab_pin_oe ? SYNTHESIZED_WIRE_0[3] : 1'bz;
assign	abus[2] = bus_ab_pin_oe ? SYNTHESIZED_WIRE_0[2] : 1'bz;
assign	abus[1] = bus_ab_pin_oe ? SYNTHESIZED_WIRE_0[1] : 1'bz;
assign	abus[0] = bus_ab_pin_oe ? SYNTHESIZED_WIRE_0[0] : 1'bz;


endmodule
