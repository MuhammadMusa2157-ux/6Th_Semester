module Top;
	
	wire A, B, S, Cy;

	HA ha (S, Cy, A, B);
	tb_HA tb (S, Cy, A, B);

endmodule