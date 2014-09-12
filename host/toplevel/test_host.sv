//--------------------------------------------------------------
// Testbench for the host board
//--------------------------------------------------------------
// 50 MHz for a functional simulation (no delay timings)
`timescale 10 ns/ 10 ns

module test_bench_host();

reg reset;
wire uart_tx;

// Toggle reset; the reset on the board is a push-button
// with negative polarity
initial begin : init
    reset = 0;
    #10 reset = 1;
end : init

reg clk = 1;
initial forever #1 clk = ~clk;

host host_( .clk(clk), .reset(reset), .uart_tx(uart_tx) );

endmodule
