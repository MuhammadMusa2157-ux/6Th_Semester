module test2_fsm_counter;
	
	reg clock;
	wire [2:0] count;	
		
	fsm_counter dut (count, clock);

	initial
		clock = 0;
		
	always 
		#5 clock = ~clock;
		
	initial begin
		$display ("***********Time-----Output");
		$monitor ($time, "   Count = %d", count);
	end
	
endmodule