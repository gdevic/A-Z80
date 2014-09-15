// Test address latch and increment block

// 5 MHz for simulation
`timescale 1us/ 100 ns

module test_clatch;

// ----------------- CLOCKS AND RESET -----------------
// Define one full T-clock cycle delay
`define T #2

bit clk = 1;
//initial repeat (30) #1 clk = ~clk;
initial forever #1 clk = ~clk;
logic nclk;
assign nclk = ~clk;

// ----------------------------------------------------

reg [15:0] D;               // clatch input bus
wire [15:0] Q;              // Read it using this bus

// ----------------- INPUT CONTROL -----------------
reg ena;                    // Latch enable

initial begin
    D = 'z;
    ena = 0;

    //------------------------------------------------------------
    `T  D = 16'h8F55;
    `T  D = 16'hAABB;
        ena = 1;
    `T  D = 16'hBBCC;
    `T  D = 16'hFFFF;
    `T  D = 16'h789A;
        ena = 0;
    `T  D = 16'h0000;

    `T $display("End of test");
end

// Instantiate a latch block
clatch16 clatch16_( .*, .D(D[15:0]), .clk(nclk) );

clatch1 clatch1_( .*, .D(D[0]), .Q(Q[0]), .clk(nclk) );

endmodule
