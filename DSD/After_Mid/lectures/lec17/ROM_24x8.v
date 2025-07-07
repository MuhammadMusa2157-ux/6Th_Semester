module ROM_24x8 (cs, addrb, datab, read_en);

	input [4:0] addrb;
	output [7:0] datab;
	input cs, read_en;
	
	wire [7:0] datab1, datab2, datab3;
	wire [3:0] OUT;
	
	Dec_24 d1 (addrb[4], addrb[3], OUT);
	
	ROM1_8x8 rc1 (OUT[0], addrb[2:0], datab1, read_en);
	ROM2_8x8 rc2 (OUT[1], addrb[2:0], datab2, read_en);
	ROM3_8x8 rc3 (OUT[2], addrb[2:0], datab3, read_en);
	
	assign datab = (cs && read_en)?datab1 | datab2 | datab3:8'bz;
	
endmodule