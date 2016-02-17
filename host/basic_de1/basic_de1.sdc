## Generated SDC file "basic_de1.sdc"

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

create_clock -name {CLOCK_50} -period 20.000 -waveform { 0.000 10.000 } [get_ports {CLOCK_50}]
create_clock -name {KEY2} -period 20.000 -waveform { 0.000 10.000 } [get_ports {KEY2}]

#**************************************************************
# Create Generated Clock
#**************************************************************

create_generated_clock -name {pll_|altpll_component|pll|clk[0]} -source [get_pins {pll_|altpll_component|pll|inclk[0]}] -duty_cycle 50.000 -multiply_by 1 -master_clock {CLOCK_50} [get_pins {pll_|altpll_component|pll|clk[0]}]
create_generated_clock -name {clk_cpu} -source [get_nets {pll_|altpll_component|_clk0}] -divide_by 4 -master_clock {pll_|altpll_component|pll|clk[0]} [get_nets {clk_cpu}]

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

set_input_delay -add_delay -max -clock [get_clocks {CLOCK_50}]  2.000 [get_ports {CLOCK_50}]
set_input_delay -add_delay -min -clock [get_clocks {CLOCK_50}]  1.000 [get_ports {CLOCK_50}]
set_input_delay -add_delay -max -clock [get_clocks {CLOCK_50}]  2.000 [get_ports {KEY0}]
set_input_delay -add_delay -min -clock [get_clocks {CLOCK_50}]  1.000 [get_ports {KEY0}]
set_input_delay -add_delay -max -clock [get_clocks {CLOCK_50}]  2.000 [get_ports {KEY1}]
set_input_delay -add_delay -min -clock [get_clocks {CLOCK_50}]  1.000 [get_ports {KEY1}]
set_input_delay -add_delay -max -clock [get_clocks {CLOCK_50}]  2.000 [get_ports {KEY2}]
set_input_delay -add_delay -min -clock [get_clocks {CLOCK_50}]  1.000 [get_ports {KEY2}]

#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay -max -clock [get_clocks {CLOCK_50}]  9.000 [get_ports {GPIO_0[0]}]
set_output_delay -add_delay -min -clock [get_clocks {CLOCK_50}]  -5.000 [get_ports {GPIO_0[0]}]
set_output_delay -add_delay -max -clock [get_clocks {CLOCK_50}]  6.000 [get_ports {GPIO_0[1]}]
set_output_delay -add_delay -min -clock [get_clocks {CLOCK_50}]  -5.000 [get_ports {GPIO_0[1]}]
set_output_delay -add_delay -max -clock [get_clocks {CLOCK_50}]  6.000 [get_ports {GPIO_0[2]}]
set_output_delay -add_delay -min -clock [get_clocks {CLOCK_50}]  -5.000 [get_ports {GPIO_0[2]}]
set_output_delay -add_delay -max -clock [get_clocks {CLOCK_50}]  6.000 [get_ports {GPIO_0[3]}]
set_output_delay -add_delay -min -clock [get_clocks {CLOCK_50}]  -5.000 [get_ports {GPIO_0[3]}]
set_output_delay -add_delay -max -clock [get_clocks {CLOCK_50}]  6.000 [get_ports {GPIO_0[4]}]
set_output_delay -add_delay -min -clock [get_clocks {CLOCK_50}]  -5.000 [get_ports {GPIO_0[4]}]
set_output_delay -add_delay -max -clock [get_clocks {CLOCK_50}]  6.000 [get_ports {GPIO_0[5]}]
set_output_delay -add_delay -min -clock [get_clocks {CLOCK_50}]  -5.000 [get_ports {GPIO_0[5]}]
set_output_delay -add_delay -max -clock [get_clocks {CLOCK_50}]  6.000 [get_ports {UART_TXD}]
set_output_delay -add_delay -min -clock [get_clocks {CLOCK_50}]  -5.000 [get_ports {UART_TXD}]
set_output_delay -add_delay -max -clock [get_clocks {CLOCK_50}]  6.000 [get_ports {~LVDS91p/nCEO~}]
set_output_delay -add_delay -min -clock [get_clocks {CLOCK_50}]  -5.000 [get_ports {~LVDS91p/nCEO~}]

#**************************************************************
# Set Clock Groups
#**************************************************************

set_clock_groups -asynchronous -group [get_clocks {CLOCK_50}] -group [get_clocks {KEY2}]

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

