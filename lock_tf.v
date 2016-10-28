`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:36:47 11/26/2014
// Design Name:   lock
// Module Name:   C:/Users/Catherine/Documents/ECE256/FSM/lock_tf.v
// Project Name:  FSM
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: lock
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module lock_tf;

	// Inputs
	reg clk;
	reg rst;
	reg b0;
	reg b1;

	// Outputs
	wire unlock;
	wire [2:0] state;

	// Instantiate the Unit Under Test (UUT)
	lock uut (
		.clk(clk), 
		.rst(rst), 
		.b0(b0), 
		.b1(b1), 
		.unlock(unlock), 
		.state(state)
	);

	always
	#5 clk = ~clk;
	
	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		b0 = 0;
		b1 = 0;

		
		#10 rst = 1;
		#5 rst = 0;
		
		#5 b0 = 1;
		#5 b0 = 0;
		#10 b1 = 1;
		#10 b1 = 0;
		#10 b0 = 1;
		#10 b0 = 0;
		#10 b1 = 1;
		#10 b1 = 0;
		#10 b0 = 1;
		#10 b0 = 0;
		#10 b1 = 1;
		#10 b1 = 0;
		#10 b1 = 1;

		
		
		#10 $finish;
        
		// Add stimulus here

	end
      
endmodule

