//--------------------------------------------------------------
// Testbench for the host board
//--------------------------------------------------------------
`timescale 10 ns/ 10 ns

module test_bench_host();

reg reset;
reg nint;
reg nnmi;
wire uart_tx;

// Proper sequence for the ModelSim reset
initial begin : init
    reset = 0;
    nint = 1;
    nnmi = 1;
#10 reset = 1;
end : init

reg clk = 1;
initial forever #1 clk = ~clk;

host host_( .nint(nint), .nnmi(nnmi), .clk(clk), .reset(reset), .uart_tx(uart_tx) );

endmodule
