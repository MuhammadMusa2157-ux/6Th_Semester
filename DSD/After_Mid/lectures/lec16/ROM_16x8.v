module ROM_16x8 (cs, addrb, datab, read_en);

	input [3:0] addrb;
	output [7:0] datab;
	input cs, read_en;
	
	wire [7:0] datab1, datab2;
	wire [1:0] OUT;
	
	assign OUT[0] = cs && ~addrb[3];
	assign OUT[1] = cs && addrb[3];
	
	ROM1_8x8 rc1 (OUT[0], addrb[2:0], datab1, read_en);
	ROM2_8x8 rc2 (OUT[1], addrb[2:0], datab2, read_en);
	
	assign datab = (cs && read_en)?datab1 | datab2:8'bz;
	
endmodule