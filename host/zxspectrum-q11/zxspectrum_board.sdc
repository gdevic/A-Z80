## Generated SDC file "zxspectrum_board.sdc"

## Copyright (C) 1991-2011 Altera Corporation
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, Altera MegaCore Function License 
## Agreement, or other applicable license agreement, including, 
## without limitation, that your use is for the sole purpose of 
## programming logic devices manufactured by Altera and sold by 
## Altera or its authorized distributors.  Please refer to the 
## applicable agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus II"
## VERSION "Version 11.0 Build 208 07/03/2011 Service Pack 1 SJ Full Version"

## DATE    "Sun Oct 26 08:07:36 2014"

##
## DEVICE  "EP2C20F484C7"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {CLOCK_27} -period 37.037 -waveform { 0.000 18.518 } [get_ports {CLOCK_27}]
create_clock -name {ula:ula_|clocks:clocks_|clk_cpu} -period 1.000 -waveform { 0.000 0.500 } [get_registers {ula:ula_|clocks:clocks_|clk_cpu}]
create_clock -name {ula:ula_|clocks:clocks_|div2} -period 1.000 -waveform { 0.000 0.500 } [get_registers {ula:ula_|clocks:clocks_|div2}]
create_clock -name {z80_top_direct_n:z80_|clk_delay:clk_delay_|SYNTHESIZED_WIRE_8} -period 1.000 -waveform { 0.000 0.500 } [get_registers {z80_top_direct_n:z80_|clk_delay:clk_delay_|SYNTHESIZED_WIRE_8}]


#**************************************************************
# Create Generated Clock
#**************************************************************

derive_pll_clocks

#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

derive_clock_uncertainty

#**************************************************************
# Set Input Delay
#**************************************************************



#**************************************************************
# Set Output Delay
#**************************************************************



#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

