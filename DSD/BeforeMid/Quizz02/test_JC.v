module test_JC (CLK, CLR, Q);

	output CLK, CLR;
	input [0:3] Q;
	
	reg CLK, CLR;

	always
		#5 CLK = ~CLK; //Toggle clk every 5 time units

	initial
	begin
		CLK = 1'b0; //Set clk to 0		
		CLR = 1'b0;
		#12
		CLR = 1'b1; 
		#500 $finish; //Terminate the simulation
	end

	initial
		$monitor ($time, ": CLR = %b, Q = %b", CLR, Q);

endmodule