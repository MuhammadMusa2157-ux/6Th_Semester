module bcd (C, S, A, B);

	output [3:0] S;
	output C;
	input [3:0] A, B;
	//Write your code here

	wire cy, cz;
	wire [3:0] sum;
	
	add4 a1 (cy, sum, A, B);
	assign C = cy | (sum[3]&sum[2]) | (sum[3]&sum[1]);
	add4 a2 (cz, S, {1'b0, C, C, 1'b0}, sum);
	
endmodule