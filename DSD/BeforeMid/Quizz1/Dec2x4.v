module Dec2x4 (y, En, w);
	
	output [0:3] y;
	input En;
	input [1:0] w;
	
	reg [0:3] y;
	
	always @(En or w)
		if (En)
			case (w)
				2'b00: y = 4'b1000;
				2'b01: y = 4'b0100;
				2'b10: y = 4'b0010;
				2'b11: y = 4'b0001;
			endcase
		else
			y = 4'b0000;
		
endmodule