//============================================================================
// Implementation of the Sinclair ZX Spectrum ULA
//
// This module contains the clocks section.
//
// TODO: Video RAM contention would cause a clock gating which would be
// implemented in this module. RAM contention is not implemented since we are
// using a dual-port RAM.
//============================================================================
module clocks
(
    input wire clk_ula,         // Input ULA clock of 14 MHz
    output reg clk_cpu          // Output 3.5 MHz CPU clock
);

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// Generate 3.5 MHz Z80 CPU clock by dividing input clock of 14 MHz by 4
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
reg [0:0] counter;

// Note: In order to test at 3.5 MHz, the PLL needs to be set to generate 14 MHz
// and then this divider-by-4 brings the effective clock down to 3.5 MHz
always @(posedge clk_ula)
begin
    if (counter=='0)
        clk_cpu <= ~clk_cpu;
    counter <= counter - 1'b1;
end

endmodule
