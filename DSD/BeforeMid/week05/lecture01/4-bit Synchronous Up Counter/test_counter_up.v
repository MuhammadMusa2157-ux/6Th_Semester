module test_counter_up (count, clk, rst);

	input [3:0] count;
	output clk, rst;
	
	reg clk, rst;
	
	always
		#5 clk = ~clk; //toggle clk every 5 time units

	initial
	begin
		clk = 1'b0; //at t = 0, set clk to 0
		rst = 1'b0; //at t = 0, set rst to 0 to clear the counter
		#20 rst = 1'b1; //at t = 20, set rst to 1 to run the counter
		#125 rst = 1'b0; //at t = 145, set rst to 0 to clear the counter
		#35 rst = 1'b1; //at t = 180, set rst to 1 to restart the counter		
	end

	// monitor the outputs
	initial
		$monitor($time, ", rst = %b, count = %d", rst, count);

endmodule