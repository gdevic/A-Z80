// Test address latch and increment block

// 5 MHz for simulation
`timescale 1us/ 100 ns

module test_bus;

// ----------------- CLOCKS AND RESET -----------------
// Define one full T-clock cycle delay
`define T #2

bit clk = 1;
//initial repeat (30) #1 clk = ~clk;
initial forever #1 clk = ~clk;
logic nclk;
assign nclk = ~clk;

// ----------------------------------------------------

// Bi-directional bus that can also be tri-stated
reg  [15:0] abusw;          // Drive it using this bus
wire [15:0] abus;           // Read it using this bus

wire [15:0] address;        // Final address ouput

// ----------------- INPUT CONTROL -----------------
reg ctl_ab_mux_inc;         // Mux for the final address output
reg ctl_al_we;              // Write enable to address latch
reg ctl_bus_inc_oe;         // Write incrementer onto the internal data bus

// ----------------- INC/DEC -----------------
reg ctl_inc_dec;            // Perform decrement (1) or increment (0)
reg ctl_inc_limit6;         // Limit increment to 6 bits (for incrementing IR)
reg ctl_inc_cy;             // Address increment, carry in value (+/-1 or 0)
reg ctl_inc_zero;           // Output zero from the incrementer

// ----------------- OUTPUT/STATUS -----------------
wire address_is_1;          // Signals when the final address is 1

initial begin
    abusw = 'z;
    ctl_ab_mux_inc = 0;
    ctl_al_we = 0;
    ctl_bus_inc_oe = 0;
    ctl_inc_dec = 0;
    ctl_inc_limit6 = 0;
    ctl_inc_cy = 0;
    ctl_inc_zero = 0;

    //------------------------------------------------------------
    // Perform a simple increment and decrement
    `T  abusw = 16'h1234;
        ctl_al_we = 1;          // Write value to the latch
        ctl_ab_mux_inc = 1;     // Output incrementer to the address bus
        ctl_inc_cy = 1;         // +1  show "1235"
    `T  ctl_inc_dec = 1;        // -1  show "1233"
    // ...through overflow
    `T  abusw = 16'hffff;
        ctl_inc_dec = 0;
        ctl_inc_cy = 1;         // +1  show "0"
    `T  ctl_inc_dec = 1;        // -1  show "FFFE"
    `T  abusw = 16'h0;
        ctl_inc_dec = 0;
        ctl_inc_cy = 1;         // +1  show "1"
    `T  ctl_inc_dec = 1;        // -1  show "FFFF"
    `T  ctl_inc_cy = 0;         // show "0000"
    `T  ctl_inc_dec = 0;        // show "0000"

    //------------------------------------------------------------
    // Test the address latch and the mux
    `T  abusw = 16'hAA50;
        ctl_al_we = 1;          // Write AA55 to the latch
        ctl_inc_cy = 1;
    `T  ctl_al_we = 0;          // show "AA51"
    `T  ctl_ab_mux_inc = 0;     // show "AA50"

    //------------------------------------------------------------
    // Test the tri-state db
    `T  abusw = 'z;
        ctl_bus_inc_oe = 1;     // Output latched value (AA55)
    `T  ctl_bus_inc_oe = 0;     // Disable it for a cycle

    //------------------------------------------------------------
    // Test the force-to-zero
    `T  ctl_inc_zero = 1;
        ctl_bus_inc_oe = 1;     // Output zero

    `T $display("End of test");
    `T $stop();
end

// Drive 3-state bidirectional bus with these statements
assign abus = abusw;

// Instantiate address latch block
address_latch address_latch_( .* );

endmodule
