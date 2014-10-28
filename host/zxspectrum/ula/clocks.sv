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
reg div2;                       // Divide input clock by 2

always @(posedge clk_ula)
begin
    div2 <= !div2;
end

always @(posedge div2)
begin
    clk_cpu = !clk_cpu;         // Divide /2 clock by 2
end

endmodule
