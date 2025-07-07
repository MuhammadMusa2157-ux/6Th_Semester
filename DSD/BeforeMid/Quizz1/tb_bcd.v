module tb_bcd;
	
	wire [3:0] S;
	wire C;
	reg [3:0] A, B;
	
	bcd dut (C, S, A, B);
	
	initial begin
		#0 A=4'b0000; B=4'b0001;
		#2 A=4'b0101; B=4'b0001;
		#2 A=4'b0101; B=4'b0101;
		#2 A=4'b1000; B=4'b0100;
		#2 A=4'b1000; B=4'b0101;
		#2 A=4'b1000; B=4'b1000;
		#2 A=4'b0111; B=4'b0111;
		#2 A=4'b1001; B=4'b0101;
		#2 A=4'b1001; B=4'b0110;
		#2 A=4'b1001; B=4'b1001;
	end
	
	initial
		$monitor ("%d, A=%b, B=%b, SUM=000%b%b", $time, A, B, C, S);

endmodule