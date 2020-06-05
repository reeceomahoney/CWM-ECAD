//////////////////////////////////////////////////////////////////////////////////
// Exercise #2 
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to design a multiplexer, where the  
//  output acts according to the following truth table:
//
//  sel | out
// -----------------
//   0  | a
//   1  | b
//
//  inputs:
//           a, b, sel
//
//  outputs:
//           out
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module mux(
    	input clk, sel, rst, button,
    	output reg [2:0] out
    	);

	wire [2:0] throw;
	wire [2:0] light;

always@(posedge clk) begin
	out <= (sel==0) ? throw: light;                 
end

//Instantiate functions
	dice dice (
	.clk (clk),
	.rst (rst),
	.button (button),
	.throw (throw)
	);

	traffic traffic (
	.clk (clk),
	.light (light)
	);


endmodule
