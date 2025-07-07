module add6 (Sum, Co, A, B);

	output [5:0] Sum; output Co;
	input [5:0] A, B;
	
	assign {Co, Sum} = A + B;
	
endmodule