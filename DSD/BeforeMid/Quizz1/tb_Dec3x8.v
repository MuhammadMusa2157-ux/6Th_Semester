module tb_Dec3x8;
	
	wire [0:7] y;
	reg En;
	reg [2:0] w;
	
	Dec3x8 dut (y, En, w);
	
	initial begin
		#0 En = 1'b0; 
		#5 w = 3'b101;
		#5 En = 1'b1; 
		#5 w = 3'b000;
		#5 w = 3'b001;
		#5 w = 3'b010;
		#5 w = 3'b011;
		#5 En = 1'b0;
		#5 w = 3'b100;
		#5 w = 3'b101;
		#5 w = 3'b110;
		#5 En = 1'b1;
		#5 w = 3'b100;
		#5 w = 3'b101;
		#5 w = 3'b110;
		#5 w = 3'b111;	
	end
	
	initial
		$monitor ("%d, En=%b, ABC=%b, Out[D0...D7]=%b", $time, En, w, y);

endmodule