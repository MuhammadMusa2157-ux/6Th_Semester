module tst_ROM_16x8;

	reg [3:0] addrb;
	wire [7:0] datab;
	reg cs, read_en;
	
	ROM_16x8 rom (cs, addrb, datab, read_en);
	
	initial begin
		#5 addrb =  0; 	//0 000
		#10 addrb = 7; 	//0 111
		#10 addrb = 8; 	//1 000
		#5 addrb = 15; 	//1 111
		#5 addrb = 14; 	//1 110
		#5 addrb = 11; 	//1 011
		#5 addrb = 12; 	//1 100
		#5 addrb = 9; 	 //1 001
	end
	
	initial begin
		cs = 1;
		read_en = 1;		
	end

endmodule

