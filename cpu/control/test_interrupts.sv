// Test interrupts unit

// 5 MHz for a functional simulation (no delay timings)
`timescale 100 ns/ 100 ns

module test_interrupts;

//----------------------------------------------------------
// Control the IFF1 and IFF2 flags
//----------------------------------------------------------
logic ctl_iffx_set = 0;
logic ctl_iffx_clr = 0;
logic ctl_iff1_iff2 = 0;
logic ctl_iff1_clr = 0;

logic iff1;
logic iff2;

//----------------------------------------------------------
// Control the IM (interrupt mode) register
//----------------------------------------------------------
logic ctl_im_sel3 = 0;
logic ctl_im_sel4 = 0;
logic ctl_im_set = 0;

logic im1;
logic im2;

logic nreset = 1;

initial begin
    @(posedge reset);

    // Test the IFF1/IFF2 control
    #1 ctl_iffx_set = 1;        // Set both IFF flags
    #1 ctl_iffx_set = 0;
    #1 ctl_iffx_clr = 1;        // Clear both IFF flags
    #1 ctl_iffx_clr = 0;
    #1 ctl_iff1_iff2 = 1;       // IFF2->IFF1 (should both be 0)
    #1 ctl_iff1_iff2 = 0;
    #1 ctl_iffx_set = 1;        // Set both IFF flags
    #1 ctl_iffx_set = 0;
    #1 ctl_iff1_iff2 = 1;       // IFF2->IFF1 (should both be 1)
    #1 ctl_iff1_iff2 = 0;
    #1 ctl_iff1_clr = 1;        // Clear only IFF1
    #1 ctl_iff1_clr = 0;
    #1 ctl_iff1_iff2 = 1;       // IFF2->IFF1 (should both be 1)
    #1 ctl_iff1_iff2 = 0;

    // Test the IM register control
    #1 ctl_im_sel3 = 0; ctl_im_sel4 = 0; ctl_im_set = 1;
    #1 ctl_im_sel3 = 0; ctl_im_sel4 = 1; ctl_im_set = 1;
    #1 ctl_im_sel3 = 1; ctl_im_sel4 = 1; ctl_im_set = 1;
    #1 ctl_im_sel3 = 0; ctl_im_sel4 = 0; ctl_im_set = 1;
    
    #1 $display("End of test");
end

initial begin : assert_reset
    nreset = 0;
    #1 nreset = 1;
end : assert_reset

//--------------------------------------------------------------
// Instantiate DUT
//--------------------------------------------------------------

interrupts interrupts ( .* );

endmodule

