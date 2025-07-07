module tst_ROM_8x16;

	reg [2:0] addrb;
	wire [15:0] datab;
	reg cs, read_en;
	
	ROM_8x16 rom (cs, addrb, datab, read_en);
	
	initial begin
		#5 addrb =  0; 
		#10 addrb = 7;
		#10 addrb = 5;
		#5 addrb = 4; 
		#5 addrb = 6;
		#5 addrb = 1; 
		#5 addrb = 2;
		#5 addrb = 3;
		
	end
	
	initial begin
		cs = 1;
		read_en = 1;		
	end

endmodule