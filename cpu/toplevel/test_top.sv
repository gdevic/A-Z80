//--------------------------------------------------------------
// Testbench for the top level design
//--------------------------------------------------------------
`timescale 100 ps/ 100 ps
`define TD  #1

`include "z80.svh"

module test_bench(z80_if.tb z);

assign clk = z.CLK;

initial begin
    $display("Test: Start of test at %d", $time);
    z.nINT <= 0;
    z.nNMI <= 0;
    z.nRESET <= 1;
    z.nBUSRQ <= 0;

    repeat (3) @(posedge clk);
    z.nRESET <= 0;

end

endmodule

module test_top();

logic clk = 0;
initial repeat (20) `TD clk = ~clk;

// Instantiate the bus interface to the design
z80_if z80(clk);
// Create an instance of our Z80 design
z80_top dut(z80);
// Create an instance of the test bench
test_bench tb(z80);

endmodule
