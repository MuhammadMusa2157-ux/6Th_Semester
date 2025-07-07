module counter_dn (count, clk, rst);

	output [3:0] count;
	input clk, rst;
	
	reg [3:0] count;

	always @(posedge clk or rst) 
	if (rst)
		count = 4'b0000;
	else
		count = count - 1;	

endmodule