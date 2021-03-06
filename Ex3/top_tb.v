//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Up/Down counter
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex3 - counter
// Guidance: start with simple tests of the module (how should it react to each 
// control signal?). Don't try to test everything at once - validate one part of 
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
	//Parameters    
	parameter CLK_PERIOD = 10;

	//Registers
	reg clk;
	reg rst;
	reg enable;
	reg direction;
	
	//Wires
	wire [7:0] counter_out;	

	//Clock generation
	initial
	begin
		clk = 1'b0;
		forever
		#(CLK_PERIOD/2) clk=~clk;
	end

	//User logic
	initial begin
		rst = 1;
		#10
		rst = 0;
		enable = 1;
		direction = 1;
	end
			
	
    
	//Finish test, check for success
	initial begin
		#100
		$finish;
	end
	

	//Instantiate counter module
	counter top (
	.clk (clk),
	.rst (rst),
	.enable (enable),
	.direction (direction),
	.counter_out (counter_out)
	);
 
endmodule 
