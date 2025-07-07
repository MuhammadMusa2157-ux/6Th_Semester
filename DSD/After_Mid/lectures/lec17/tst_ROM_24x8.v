module tst_ROM_24x8;

	reg [4:0] addrb;
	wire [7:0] datab;
	reg cs, read_en;
	
	ROM_24x8 rom (cs, addrb, datab, read_en);
	
	initial begin
		#5 addrb =  0; 	//00 000
		#10 addrb = 7; 	//00 111
		#10 addrb = 8; 	//01 000
		#5 addrb = 15; 	//01 111
		#5 addrb = 14; 	//01 110
		#5 addrb = 11; 	//01 011
		#5 addrb = 12; 	//01 100
		#5 addrb = 9; 	 //01 001
		#5 addrb = 16; 	//10 000
		#5 addrb = 23; 	//10 111
		#5 addrb = 20; 	//10 100
	end
	
	initial begin
		cs = 1;
		read_en = 1;		
	end

endmodule