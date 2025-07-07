`timescale 1ns / 1ps

module bcd_counter_tb;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [3:0] bcd1;
	wire [3:0] bcd2;
	wire [3:0] bcd3;

	// Instantiate the Unit Under Test (UUT)
	bcd_counter uut (
		.clk(clk), 
		.reset(reset), 
		.bcd1(bcd1), 
		.bcd2(bcd2), 
		.bcd3(bcd3)
	);

	always #1 clk = ~clk;
	
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		#1;
		
		reset = 0;
		
      #500
		$finish;

	end
      
endmodule

