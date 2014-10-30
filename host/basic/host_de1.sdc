#**************************************************************
# Custom timing constrains
#**************************************************************
set_time_format -unit ns -decimal_places 3

# Create base input clocks into the design and tie them to the
# input ports (chip pins) into the FPGA
# Uncomment those clocks that are used in the design:
create_clock -name "CLOCK_50" -period 50MHz [get_ports {CLOCK_50}]
#create_clock -name "CLOCK_27" -period 27MHz [get_ports {CLOCK_27}]
#create_clock -name "CLOCK_24" -period 24MHz [get_ports {CLOCK_24}]

# Set independent clock groups that don't interfere with each other:
set_clock_groups -asynchronous \
 -group [get_clocks {CLOCK_50}] \
 -group [get_clocks {clk_cpu}] \
 -group [get_clocks {pll_|altpll_component|pll|clk[0]}]

# Automatically constrain PLL and other generated clocks and
# create the associated input clock based on the PLL settings
derive_pll_clocks -create_base_clocks

# Define clock divider flops that are used in the design:
create_generated_clock -name clk_div2 -source [get_pins {div2|clk}] -divide_by 2 [get_pins {div2|regout}]
create_generated_clock -name clk_div4 -source [get_pins {div4|clk}] -divide_by 2 [get_pins {div4|regout}]

# Define the global clock control that the final cpu clock is being driven by:
create_generated_clock -name clk_cpu -source [get_pins {clkctrl_|clkctrl_altclkctrl_6df_component|clkctrl1|inclk[0]}] [get_pins {clkctrl_|clkctrl_altclkctrl_6df_component|clkctrl1|outclk}]
