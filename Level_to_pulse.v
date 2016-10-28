`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:02:13 11/19/2014 
// Design Name: 
// Module Name:    Level_to_pulse 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Level_to_pulse(
    input clk,
    input rst,
	 input L,
    output P
    );
	 reg [1:0] Q;
	 wire [1:0]Qp;
	 //reg [1:0] state;
	 
//state logic
always @ (posedge clk, posedge rst)
if (rst) begin
Q <= 2'b00;
end else begin
Q <= Qp;
end
//next state logic
assign Qp[0] = L & Q[1]| L & ~Q[0];
assign Qp[1] = L & Q[1]| L & Q[0];

//output logic
assign P = Q[1] & ~Q[0];

endmodule
