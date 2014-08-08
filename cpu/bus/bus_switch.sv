//============================================================================
// Bus switch in bus A-Z80 CPU
//
// Copyright 2014 Goran Devic
//
// This module provides control data bus switch signals. The sole purpose of
// having these wires defined in this module is to get all control signals
// (which are processed by genglobals.py) to appear in the list of global
// control signals ("globals.i") for consistency.
//============================================================================
`timescale 100 ps/ 100 ps

module bus_switch
(
    input wire bus_sw_1u,               // Input for the SW1 upstream
    input wire bus_sw_1d,               // Input for the SW1 downstream

    input wire bus_sw_2u,               // Input for the SW2 upstream
    input wire bus_sw_2d,               // Input for the SW2 downstream

    //--------------------------------------------------------------------
    
    output wire ctl_sw_1u,              // SW1 upstream
    output wire ctl_sw_1d,              // SW1 downstream
    
    output wire ctl_sw_2u,              // SW2 upstream
    output wire ctl_sw_2d               // SW2 downstream
);

assign ctl_sw_1u = bus_sw_1u;
assign ctl_sw_1d = bus_sw_1d;

assign ctl_sw_2u = bus_sw_2u;
assign ctl_sw_2d = bus_sw_2d;

endmodule
