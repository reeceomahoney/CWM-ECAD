//////////////////////////////////////////////////////////////////////////////////
// Exercise #5 
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to implement a UK traffic lights 
//  sequencing system. 
//
//  inputs:
//           clk
//
//  outputs:
//           red, amber, green
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

module traffic (
	input clk,
	output reg [2:0] light
	);

//Stars at some undesired value
initial begin
	light <= 3'b101;
end

always@(posedge clk) begin
	light <= (light==3'b100) ? 3'b110: (light==3'b110) ? 3'b001: (light==3'b001) ? 3'b010: 		(light==3'b010) ? 3'b100: 3'b100;
end
endmodule
