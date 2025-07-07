module test_ud_counter;

	reg clock;
	reg reset;
	reg mode;
	wire [3:0] out;
	
	ud_counter ud (.C(clock), .R(reset), 
	.COUNT(out), .UD(mode));

	always
		#5 clock = ~clock;

	initial
	begin
		clock = 1'b0; 
		reset = 1'b1;
		mode = 1'b0;
		#7
		reset = 1'b0;
		#50
		mode = 1'b1;	
		#80
		mode = 1'b0;	
		#400 $finish; 
	end

	initial
		$monitor($time, "   UD = %b,   COUNT = %b", mode, out);

endmodule
