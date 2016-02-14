`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:   00:18:56 02/14/2016
// Design Name:   host
// Module Name:   R:/Z80/host/basic_nexys3/test_host.v
// Project Name:  host_nexys3
// Target Device:
// Tool versions:
// Description:
//
// Verilog Test Fixture created by ISE for module: host
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////

module test_host;

	// Inputs
	reg CLOCK_100;
	reg KEY0;
	reg KEY1;
	reg KEY2;

	// Outputs
	wire UART_TXD;
	wire [7:0] GPIO_1;
	wire [7:0] GPIO_2;

	// Bidirs
	wire [7:0] GPIO_0;
	wire [7:0] GPIO_3;

	// Instantiate the Unit Under Test (UUT)
	host uut (
		.CLOCK_100(CLOCK_100),
		.KEY0(KEY0),
		.KEY1(KEY1),
		.KEY2(KEY2),
		.UART_TXD(UART_TXD),
		.GPIO_0(GPIO_0),
		.GPIO_1(GPIO_1),
		.GPIO_2(GPIO_2),
		.GPIO_3(GPIO_3)
	);

	initial begin
		// Initialize Inputs
		CLOCK_100 = 0;
		KEY0 = 0;
		KEY1 = 1;
		KEY2 = 1;

		// Wait 100 ns for global reset to finish
		#100;
        KEY0 = 1;

		// Add stimulus here
        forever #1 CLOCK_100 = ~CLOCK_100;

	end

endmodule

