module ROM2_8x8 (cs, addrb, datab, read_en);

	input [2:0] addrb;
	output [7:0] datab;
	input read_en, cs;
	
	reg [7:0] datab;
	
	always @ (*)
		if (read_en & cs)
			case (addrb)
				0: datab = 28;
				1: datab = 38;
				2: datab = 48;
				3: datab = 58;
				4: datab = 68;
				5: datab = 78;
				6: datab = 88;
				7: datab = 98;
			endcase
		else
			datab = 8'b0;
		
endmodule