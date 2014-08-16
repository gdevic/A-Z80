// Test reset circuit
`timescale 100 ps/ 100 ps

module test_reset;

//----------------------------------------------------------
// Input reset from the pin; state from the sequencer
//----------------------------------------------------------
logic reset_in = 0;
logic M1 = 0;
logic T2 = 0;

logic clrpc;            // Load 0 to PC
logic reset;            // Internal reset signal
logic nreset;           // Internal inverted reset signal

initial begin
    // Test normal reset sequence - 3 clocks long
    #2 reset_in = 1;
    #6 reset_in = 0;
    #2
    // Test special reset sequence: a reset pin is briefly
    // asserted at M1/T1 and CLRPC should hold until the next
    // M1/T2
    #2 reset_in = 1; M1=1;
    #2 reset_in = 0; M1=1; T2=1;
    #2               M1=1; T2=0;
    #8               M1=1; T2=1;
    #2               M1=1; T2=0;
    
    #1 $display("End of test");
end

bit clk = 1;
initial repeat (30) #1 clk = ~clk;

//--------------------------------------------------------------
// Instantiate DUT
//--------------------------------------------------------------

reset reset_block ( .* );

endmodule

