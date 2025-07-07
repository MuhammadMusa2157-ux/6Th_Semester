module test_Top;

	reg CLK, RESET;
	wire [15:0] OUT_DATA;
	
	Top t (CLK, RESET, OUT_DATA);
	
	always
		#3 CLK = ~CLK;
		
	initial
	begin
		CLK = 1'b0;
		RESET = 1'b0;
		#5
		RESET = 1'b1;
		#400 $finish;
	end
	
	initial
		$monitor(" OUT = %b", OUT_DATA);

endmodule