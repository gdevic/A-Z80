//--------------------------------------------------------------
// Testbench for the top level design
//--------------------------------------------------------------
`timescale 100 ps/ 100 ps

`include "z80.svh"

module test_top();

z80_ifc pin();
z80_top cpu(pin);

logic clk = 0;
always #10 clk++;

initial begin
    cpu.nM1 = 0;

    #1 $display("End of test");
end

endmodule
