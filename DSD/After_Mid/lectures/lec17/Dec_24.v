module Dec_24 (A, B, OUT);

	input A, B;
	output [3:0] OUT;
	
	assign OUT[0] = ~A & ~B;
	assign OUT[1] = ~A & B;
	assign OUT[2] = A & ~B;
	assign OUT[3] = A & B;
	
endmodule