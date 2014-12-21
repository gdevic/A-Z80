#**************************************************************
# Custom timing constrains
#**************************************************************
set_time_format -unit ns -decimal_places 3

# Create base input clocks into the design and tie them to the input ports (chip pins) into the FPGA
create_clock -name "CLOCK_27" -period 27MHz [get_ports {CLOCK_27}]
create_clock -name "CLOCK_24" -period 24MHz [get_ports {CLOCK_24}]

# Cast a generic min/max input delay
set_input_delay -clock CLOCK_27 -max 5 [all_inputs]
set_input_delay -clock CLOCK_27 -min 1 [all_inputs]

set_input_delay -add_delay -max -clock [get_clocks {CLOCK_24}]  20.000 [get_ports {CLOCK_24}]
set_input_delay -add_delay -min -clock [get_clocks {CLOCK_24}]  1.000 [get_ports {CLOCK_24}]

set_input_delay -add_delay -max -clock [get_clocks {CLOCK_27}]  20.000 [get_ports {CLOCK_27}]
set_input_delay -add_delay -min -clock [get_clocks {CLOCK_27}]  1.000 [get_ports {CLOCK_27}]

# Automatically constrain PLL and other generated clocks and
# create the associated input clock based on the PLL settings
derive_pll_clocks -create_base_clocks
# The line above basically creates these clocks:
#create_generated_clock -name {ula_|pll_|altpll_component|pll|clk[0]} -source [get_pins {ula_|pll_|altpll_component|pll|inclk[0]}] -duty_cycle 50.000 -multiply_by 14 -divide_by 15 -master_clock {CLOCK_27} [get_pins {ula_|pll_|altpll_component|pll|clk[0]}] 
#create_generated_clock -name {ula_|pll_|altpll_component|pll|clk[1]} -source [get_pins {ula_|pll_|altpll_component|pll|inclk[0]}] -duty_cycle 50.000 -multiply_by 14 -divide_by 27 -master_clock {CLOCK_27} [get_pins {ula_|pll_|altpll_component|pll|clk[1]}] 

# Define clock divider by 4:
create_generated_clock -name clk_cpu -source [get_pins {ula_|clocks_|clk_cpu|clk}] -divide_by 4 [get_pins {ula_|clocks_|clk_cpu|regout}]

# Create false clocks
create_clock -name KEY1 -period 10.000 [get_ports {KEY1}]
create_clock -name beep -period 10.000 [get_registers {ula:ula_|beep}]

# Set independent clock groups that don't interfere with each other:
set_clock_groups -asynchronous \
 -group [get_clocks {CLOCK_24}] \
 -group [get_clocks {CLOCK_27}] \
 -group [get_clocks {clk_cpu}] \
 -group [get_clocks {KEY1}] \
 -group [get_clocks {beep}] \
 -group ula_|pll_|altpll_component|pll|clk[0] \
 -group ula_|pll_|altpll_component|pll|clk[1]

# Constrain the output I/O paths
set_output_delay -clock CLOCK_24 2 [all_outputs]
