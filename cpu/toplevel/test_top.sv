//--------------------------------------------------------------
// Testbench for the top level design
//--------------------------------------------------------------
`timescale 100 ps/ 100 ps
`define TD  #1
`define CLR 1
`define SET 0

`include "z80.svh"

module test_bench(z80_if.tb z);

assign clk = z.CLK;

initial begin : init
    $display("Test: Start of test at %d", $time);
    z.nWAIT <= `CLR;
    z.nINT <= `CLR;
    z.nNMI <= `CLR;
    z.nRESET <= `SET;
    z.nBUSRQ <= `CLR;

    repeat (3) @(posedge clk);
    z.nRESET <= `CLR;
end : init

endmodule

module test_top();

bit clk = 1;
initial repeat (50) `TD clk = ~clk;

z80_if z80(clk);            // Instantiate the Z80 bus interface
z80_top dut(z80);           // Create an instance of our Z80 design
test_bench tb(z80);         // Create an instance of the test bench

ram ram( .Address(z80.A), .Data(z80.D), .CS(z80.nMREQ), .WE(z80.nWR), .OE(z80.nRD) );

endmodule
