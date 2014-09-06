//--------------------------------------------------------------
// Testbench for the top level design
//--------------------------------------------------------------
`timescale 100 ps/ 100 ps
`define TD  #1
`define CLR 1
`define SET 0

`include "z80.svh"

module test_bench_top(z80_if.tb z);

assign clk = z.CLK;

initial begin : init
    $display("Test: Start of test at %d", $time);
    z.nWAIT <= `CLR;
    z.nINT <= `CLR;
    z.nNMI <= `CLR;
    z.nBUSRQ <= `CLR;
    force dut.z80_top.fpga_reset=1;
    z.nRESET <= `SET;
    #2 force dut.z80_top.fpga_reset=0;
    repeat (3) @(posedge clk);
    z.nRESET <= `CLR;
end : init

// Infuse a NMI at a certain clock
initial begin : nmi_once
    repeat (100) @(posedge clk);
//    z.nNMI <= `SET;
    repeat (1) @(posedge clk);
    z.nNMI <= `CLR;
end : nmi_once

// Test sending a periodic NMI
always begin : nmi_rep
//    #5000 z.nNMI <= `SET;
    #2    z.nNMI <= `CLR;
end : nmi_rep

endmodule

module test_top();

bit clk = 1;
// Comment out a version that is needed (time-limited or unlimited)
//initial repeat (10000) `TD clk = ~clk;
initial forever `TD clk = ~clk;

z80_if z80(clk);            // Instantiate the Z80 bus interface
z80_top dut(z80);           // Create an instance of our Z80 design
test_bench_top tb(z80);         // Create an instance of the test bench

ram ram( .Address(z80.A), .Data(z80.D), .CS(z80.nMREQ), .WE(z80.nWR), .OE(z80.nRD) );
io  io( .Address(z80.A), .Data(z80.D), .CS(z80.nIORQ), .WE(z80.nWR), .OE(z80.nRD) );

endmodule
