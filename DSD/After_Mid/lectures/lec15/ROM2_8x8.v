module ROM2_8x8 (cs, addrb, datab, read_en);

	input [2:0] addrb;
	output [7:0] datab;
	input read_en, cs;
	
	reg [7:0] datab;
	
	always @ (*)
		if (read_en & cs)
			case (addrb)
				0: datab = 8'h2e;
				1: datab = 8'h38;
				2: datab = 8'h4c;
				3: datab = 8'h58;
				4: datab = 8'h68;
				5: datab = 8'h7f;
				6: datab = 8'h88;
				7: datab = 8'h9a;
			endcase
		else
			datab = 8'b0;
		
endmodule