module test1_fsm_counter;
	
	reg clock;
	wire [2:0] count;	
		
	fsm_counter dut (count, clock);

	initial 
		clock = 0;
	
	always 
		#30 clock = ~clock;
	
endmodule