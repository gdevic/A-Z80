#**************************************************************
# Custom timing constrains
#**************************************************************
set_time_format -unit ns -decimal_places 3

# Create base input clocks into the design and tie them to the input ports (chip pins) into the FPGA
create_clock -name "CLOCK_50" -period 50MHz [get_ports {CLOCK_50}]

# Cast a generic min/max input delay
set_input_delay -clock CLOCK_50 -max 5 [all_inputs]
set_input_delay -clock CLOCK_50 -min 1 [all_inputs]

set_input_delay -add_delay -max -clock [get_clocks {CLOCK_50}]  20.000 [get_ports {CLOCK_50}]
set_input_delay -add_delay -min -clock [get_clocks {CLOCK_50}]  1.000 [get_ports {CLOCK_50}]

# Automatically constrain PLL and other generated clocks and
# create the associated input clock based on the PLL settings
derive_pll_clocks -create_base_clocks

# Define clock divider by 4:
create_generated_clock -name pll_clk -source [get_pins {pll_|altpll_component|pll|clk[0]}] -divide_by 4 [get_registers {clk_cpu}]

# Create virtual clocks for inputs that drive logic as clocks (fake clocks)
create_clock -name "KEY2" -period 20 [get_ports {KEY2}]
create_clock -name uart -period 10.000 [get_keepers {uart_io:uart_io_|data_in_wr}]

# Set independent clock groups that don't interfere with each other:
set_clock_groups -asynchronous \
 -group [get_clocks {CLOCK_50}] \
 -group [get_registers {clk_cpu}] \
 -group [get_clocks {pll_clk}] \
 -group [get_clocks {pll_|altpll_component|pll|clk[0]}] \
 -group uart -group KEY2

# Constrain the output I/O paths
set_output_delay -clock CLOCK_50 2 [all_outputs]
