//--------------------------------------------------------------
// Testbench for the host board
//--------------------------------------------------------------
// 50 MHz for functional simulation (low precision)
`timescale 10 ns/ 10 ns

module test_bench_host();

// These are the various test points on the host_
wire tp_reset;
wire tp_slow_clk;
wire tp_nM1;
wire tp_nMREQ;
wire tp_nRFSH;
wire tp_nRD;
wire tp_nWR;
wire tp_nIORQ;
wire tp_A0;
wire tp_A1;
wire tp_A2;
wire tp_A3;
wire tp_D0;
wire tp_D1;
wire tp_D2;
wire tp_D3;

reg reset;
wire uart_tx;

// Toggle reset; the reset on the board is a push-button
// with negative polarity
initial begin : init
    force host_.z80_.fpga_reset=1;
#2  force host_.z80_.fpga_reset=0;
    reset = 0;
#10 reset = 1;
end : init

reg clk = 1;
initial forever #1 clk = ~clk;

// Make the wait for UART a little bit less painful on ModelSim
defparam host_.uart_io_.uart_core_.BAUD = 500000;

// Set the CPU slowdown factor for the ModelSim run:
// 50 MHz divided by 2^2 / 2 gives about 6.25 MHz
defparam host_.CPU_SLOWDOWN = 2;

host host_( .*, .clk(clk), .reset(reset), .uart_tx(uart_tx) );

endmodule
