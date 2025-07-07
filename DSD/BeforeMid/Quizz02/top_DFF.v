module top_DFF;

	wire D, CLK, CLR, Q, Qn;

	DFF dff (D, CLK, CLR, Q, Qn);
	test_DFF  t_dff (D, CLK, CLR, Q, Qn);

endmodule