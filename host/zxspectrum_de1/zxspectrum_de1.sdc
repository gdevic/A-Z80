#**************************************************************
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

create_clock -name "CLOCK_27" -period 27MHz [get_ports {CLOCK_27}]
create_clock -name "CLOCK_24" -period 24MHz [get_ports {CLOCK_24}]
create_clock -name KEY1 -period 10.000 [get_ports {KEY1}]
create_clock -name beep -period 10.000 [get_registers {ula:ula_|beep}]

derive_pll_clocks -create_base_clocks

#**************************************************************
# Create Generated Clock
#**************************************************************

create_generated_clock -name clk_cpu -source [get_pins {ula_|clocks_|clk_cpu|clk}] -divide_by 4 [get_pins {ula_|clocks_|clk_cpu|regout}]

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

set_input_delay -clock CLOCK_27 -max 2 [all_inputs]
set_input_delay -clock CLOCK_27 -min 1 [all_inputs]

set_input_delay -add_delay -max -clock [get_clocks {CLOCK_24}]  2.000 [get_ports {CLOCK_24}]
set_input_delay -add_delay -min -clock [get_clocks {CLOCK_24}]  1.000 [get_ports {CLOCK_24}]

set_input_delay -add_delay -max -clock [get_clocks {CLOCK_27}]  2.000 [get_ports {CLOCK_27}]
set_input_delay -add_delay -min -clock [get_clocks {CLOCK_27}]  1.000 [get_ports {CLOCK_27}]

#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -clock CLOCK_24 10 [all_outputs]

#**************************************************************
# Set Clock Groups
#**************************************************************

set_clock_groups -asynchronous \
 -group [get_clocks {CLOCK_24}] \
 -group [get_clocks {CLOCK_27}] \
 -group [get_clocks {clk_cpu}] \
 -group [get_clocks {KEY1}] \
 -group [get_clocks {beep}] \
 -group ula_|pll_|altpll_component|pll|clk[0] \
 -group ula_|pll_|altpll_component|pll|clk[1]

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

