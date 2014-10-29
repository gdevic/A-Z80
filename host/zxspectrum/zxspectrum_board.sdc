## Generated SDC file "zxspectrum_board.sdc"

## Copyright (C) 1991-2013 Altera Corporation
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
## VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"

## DATE    "Tue Oct 28 19:02:35 2014"

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

create_clock -name {CLOCK_27} -period 37.037 -waveform { 0.000 18.518 } [get_ports { CLOCK_27 }]
create_clock -name {ula:ula_|clocks:clocks_|div2} -period 142.857 -waveform { 0.000 71.428 } [get_registers { ula:ula_|clocks:clocks_|div2 }]
create_clock -name {ula:ula_|clocks:clocks_|clk_cpu} -period 285.714 -waveform { 0.000 142.857 } [get_registers { ula:ula_|clocks:clocks_|clk_cpu }]
create_clock -name {CLOCK_24} -period 41.666 -waveform { 0.000 20.500 } [get_ports { CLOCK_24 }]


#**************************************************************
# Create Generated Clock
#**************************************************************

create_generated_clock -name {ula_|pll_|altpll_component|pll|clk[0]} -source [get_pins {ula_|pll_|altpll_component|pll|inclk[0]}] -duty_cycle 50.000 -multiply_by 14 -divide_by 15 -master_clock {CLOCK_27} [get_pins {ula_|pll_|altpll_component|pll|clk[0]}] 
create_generated_clock -name {ula_|pll_|altpll_component|pll|clk[1]} -source [get_pins {ula_|pll_|altpll_component|pll|inclk[0]}] -duty_cycle 50.000 -multiply_by 14 -divide_by 27 -master_clock {CLOCK_27} [get_pins {ula_|pll_|altpll_component|pll|clk[1]}] 


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************



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

