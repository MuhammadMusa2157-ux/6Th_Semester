module add4 (C, S, A, B);

	output [3:0] S;
	output C;
	input [3:0] A, B;
	
	assign {C, S} = A + B;
	
endmodule