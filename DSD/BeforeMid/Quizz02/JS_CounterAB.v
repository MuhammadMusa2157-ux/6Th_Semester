module JS_CounterAB (CLK, CLR, Q);

	input CLK, CLR;
	output [0:3] Q;
	//Write your code here

	wire [0:3] Qn; 	
	
	DFF dff0 (Qn[3], CLK, CLR, Q[0], Qn[0]);
	DFF dff1 (Q[0], CLK, CLR, Q[1], Qn[1]);
	DFF dff2 (Q[1], CLK, CLR, Q[2], Qn[2]);
	DFF dff3 (Q[2], CLK, CLR, Q[3], Qn[3]);
	
endmodule