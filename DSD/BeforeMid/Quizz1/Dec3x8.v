module Dec3x8 (y, En, w);

	output [0:7] y;
	input En;
	input [2:0] w;
	//Write your code here
	
	wire c1, c2;
	
	assign c1 = ~w[2]&En;
	assign c2 = w[2]&En;
	
	Dec2x4 d1 (y[0:3], c1, w[1:0]);
	Dec2x4 d2 (y[4:7], c2, w[1:0]);
		
endmodule