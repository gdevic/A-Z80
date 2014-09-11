//--------------------------------------------------------------
// Testbench for the host board
//--------------------------------------------------------------
// 50 MHz for a functional simulation (no delay timings)
`timescale 10 ns/ 10 ns

module test_bench_host();

logic reset;
logic uart_tx;

// Toggle reset; the reset on the board is a push-button
// with negative polarity
initial begin : init
    reset = 0;
    #10 reset = 1;
end : init

bit clk = 1;
initial forever #1 clk = ~clk;

host host_( .* );

endmodule
