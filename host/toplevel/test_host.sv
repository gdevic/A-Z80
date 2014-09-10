//--------------------------------------------------------------
// Testbench for the host board
//--------------------------------------------------------------
// 5 MHz for a functional simulation (no delay timings)
`timescale 100 ns/ 100 ns

module test_bench_host();

wire reset;
wire uart_tx;

initial begin : init
end : init

bit clk = 1;
initial forever #1 clk = ~clk;

host host_( .* );

endmodule
