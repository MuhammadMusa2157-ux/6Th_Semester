module top_counter_up;

	wire [3:0] count;
	wire clk, rst;
	
	counter_up cnt (count, clk, rst);
	test_counter_up tb (count, clk, rst);

endmodule 