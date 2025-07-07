module Top;
	
	wire co, s, a, b, ci;
	
	tb_FA tb (co, sum, a, b, ci);
	FA fa (co, sum, a, b, ci);

endmodule