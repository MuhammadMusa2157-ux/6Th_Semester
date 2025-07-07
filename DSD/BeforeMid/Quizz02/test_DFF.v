module test_DFF (D, CLK, CLR, Q, Qn);

	output D, CLK, CLR;
	input Q, Qn;
	
	reg CLK;
	reg CLR;
	reg D;

	always
		#5 CLK = ~CLK; //Toggle clk every 5 time units

	initial
	begin
		CLK = 1'b0; //Set clk to 0		
		CLR = 1'b0;
		#12
		CLR = 1'b1; D = 1;
		#15 D = 0;
		#20 D = 1;
		#15 D = 1;
		#15 D = 0;
		#15 D = 1;
		#15 D = 0;
		#15 D = 1;
		#200 $finish; //Terminate the simulation
	end

	initial
		$monitor($time, ": CLK = %b, CLR = %b, D = %b, Q = %b, Q' = %b", CLK, CLR, D, Q, Qn);

endmodule