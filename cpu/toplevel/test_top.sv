//--------------------------------------------------------------
// Testbench for the top level design
//--------------------------------------------------------------
`timescale 100 ps/ 100 ps
`define TD  #1

`include "z80.svh"

module test_bench(intf.tb tb_if);

assign clk = tb_if.CPUCLK;

initial begin
    $display("Test: Start of test at %d", $time);
    tb_if.nINT <= 0;
    tb_if.nNMI <= 0;
    tb_if.nRESET <= 1;
    tb_if.nBUSRQ <= 0;

    repeat (3) @(posedge clk);
    tb_if.nRESET <= 0;

end

endmodule

module test_top();

logic clk = 0;
initial repeat (20) `TD clk = ~clk;

// Instantiate the bus interface to the design
intf        bus_if(clk);
// Create an instance of our Z80 design
z80_top     d(bus_if);
// Create an instance of the test bench
test_bench  tb(bus_if);

endmodule
