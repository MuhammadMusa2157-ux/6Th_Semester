module top_counter_dn;

	wire [3:0] count;
	wire clk, rst;
	
	counter_dn cnt (count, clk, rst);
	test_counter_dn tb (count, clk, rst);

endmodule 