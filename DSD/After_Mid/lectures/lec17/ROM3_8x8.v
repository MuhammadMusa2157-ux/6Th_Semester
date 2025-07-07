module ROM3_8x8 (cs, addrb, datab, read_en);

	input [2:0] addrb;
	output [7:0] datab;
	input read_en, cs;
	
	reg [7:0] datab;
	
	always @ (*)
		if (read_en & cs)
			case (addrb)
				0: datab = 128;
				1: datab = 138;
				2: datab = 148;
				3: datab = 158;
				4: datab = 168;
				5: datab = 178;
				6: datab = 188;
				7: datab = 198;
			endcase
		else
			datab = 8'b0;

endmodule