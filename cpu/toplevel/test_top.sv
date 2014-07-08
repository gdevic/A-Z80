//--------------------------------------------------------------
// Testbench for the top level design
//--------------------------------------------------------------
`timescale 100 ps/ 100 ps

`include "z80.svh"

module test_bench(intf.tb tb_if);

initial begin
    tb_if.nINT = 0;
    tb_if.nNMI = 0;
    tb_if.nRESET = 1;
    tb_if.nBUSRQ = 0;

    #2 tb_if.nRESET = 0;

    #100 $display("End of test");
    $stop;
end

final begin
    $display("Final: End of test at %d", $time);
end

endmodule

module test_top();

logic clk = 0;
always #1 clk++;

intf bus_if(clk);
z80_top d(bus_if);
test_bench tb(bus_if);

endmodule
