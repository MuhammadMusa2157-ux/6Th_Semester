module ROM1_8x8 (cs, addrb, datab, read_en);

	input [2:0] addrb;
	output [7:0] datab;
	input read_en, cs;
	
	reg [7:0] datab;
	
	always @ (*)
		if  (read_en & cs)
			case (addrb)
				0: datab = 8'h21;
				1: datab = 8'hab;
				2: datab = 8'h33;
				3: datab = 8'h99;
				4: datab = 8'ha3;
				5: datab = 8'hff;
				6: datab = 8'hcd;
				7: datab = 8'h88;
			endcase
		else
			datab = 8'b0;

endmodule