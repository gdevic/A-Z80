#**************************************************************
# Custom timing constrains
#**************************************************************
set_time_format -unit ns -decimal_places 3

# Create base input clocks into the design and tie them to the
# input ports (chip pins) into the FPGA
# Uncomment those clocks that are used in the design:
#create_clock -name "CLOCK_50" -period 50MHz [get_ports {CLOCK_50}]
create_clock -name "CLOCK_27" -period 27MHz [get_ports {CLOCK_27}]
create_clock -name "CLOCK_24" -period 24MHz [get_ports {CLOCK_24}]

set_input_delay -add_delay -max -clock [get_clocks {CLOCK_24}]  20.000 [get_ports {CLOCK_24}]
set_input_delay -add_delay -min -clock [get_clocks {CLOCK_24}]  1.000 [get_ports {CLOCK_24}]

set_input_delay -add_delay -max -clock [get_clocks {CLOCK_27}]  20.000 [get_ports {CLOCK_27}]
set_input_delay -add_delay -min -clock [get_clocks {CLOCK_27}]  1.000 [get_ports {CLOCK_27}]

# Automatically constrain PLL and other generated clocks and
# create the associated input clock based on the PLL settings
derive_pll_clocks -create_base_clocks

# Define clock divider by 4:
create_generated_clock -name div4 -source [get_pins {ula_|clocks_|clk_cpu|clk}] -divide_by 4 [get_pins {ula_|clocks_|clk_cpu|regout}]

# Define the global clock control that the final cpu clock is being driven by:
create_generated_clock -name clk_cpu -source [get_pins {clkctrl_|clkctrl_altclkctrl_6df_component|clkctrl1|inclk[0]}] [get_pins {clkctrl_|clkctrl_altclkctrl_6df_component|clkctrl1|outclk}]


# Set independent clock groups that don't interfere with each other:
set_clock_groups -asynchronous \
 -group [get_clocks {CLOCK_24}] \
 -group [get_clocks {CLOCK_27}] \
 -group [get_clocks {clk_cpu}]

set_false_path -from  [get_clocks {clk_cpu}]   -to  [get_clocks {ula_|pll_|altpll_component|pll|clk[0]}]
set_false_path -from  [get_clocks {CLOCK_24}]  -to  [get_clocks {ula_|pll_|altpll_component|pll|clk[0]}]
set_false_path -from [get_keepers {ula:ula_|video:video_|vga_vc[9]}] -to [get_keepers {z80_top_direct_n:z80_|interrupts:interrupts_|int_armed}]

