module DFF (D, clock, reset, Q, Qn);

	input D; //Data input
	input clock; //Clock input
	input reset; //Asynchronous active-low reset
	output Q, Qn; //Outputs Q and Q'
	
	reg Q;
	
	always @(posedge clock or negedge reset)
		if (reset==1'b0)
			Q <= 0;
		else
			Q <= D;
			
	assign Qn = ~Q;
	
endmodule