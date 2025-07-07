module JS_CounterC (CLK, CLR, Q);

	input CLK, CLR;
	output [0:3] Q;
	
	parameter S0 = 4'b0000, S1 = 4'b1000, S2 = 4'b1100, S3 = 4'b1110,
	          S4 = 4'b1111, S5 = 4'b0111, S6 = 4'b0011, S7 = 4'b0001;
	
	reg [0:3] Q;
	
	always @(posedge CLK)
		if (~CLR)
			Q = S0;
		else
			case (Q)
				S0: Q = S1;
				S1: Q = S2;
				S2: Q = S3;
				S3: Q = S4;
				S4: Q = S5;
				S5: Q = S6;
				S6: Q = S7;
				S7: Q = S0;
				default: Q = S0;
			endcase
			
endmodule