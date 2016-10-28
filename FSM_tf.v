`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:45:21 11/19/2014
// Design Name:   Level_to_pulse
// Module Name:   H:/ECE 205L//Borrowing/FSM/LtoP.tf
// Project Name:  FSM
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Level_to_pulse
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FSM_tf;

	// Inputs
	reg clk;
	reg rst;
	reg L;

	// Outputs
	wire P;

	// Instantiate the Unit Under Test (UUT)
	Level_to_pulse uut (
		.clk(clk), 
		.rst(rst), 
		.L(L), 
		.P(P)
	);
	
	always
	#5 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		L = 0;
		
		#10 rst = 1;
		#5 rst = 0;
		#5 L = 1;
		#10 L = 0;
		#40 L = 1;
		#20 L = 0;
		#30 L = 1;
		#60 L = 0;
		
		#10 $finish;

	end
      
endmodule

