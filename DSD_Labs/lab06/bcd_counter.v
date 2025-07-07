`timescale 1ns / 1ps

module bcd_counter(
		input clk, reset,
		output reg [3:0] bcd1 = 0, bcd2 = 0, bcd3 = 0
    );


always @ (posedge clk, posedge reset) begin
	if (reset) begin
		bcd1 <= 0;
		bcd2 <= 0;
		bcd3 <= 0;
	end
	else begin 
		if ( bcd1 == 9) begin
			 bcd1 <= 0; 
			 if (bcd2 == 9) begin
					bcd2 <= 0;
					
					if (bcd3 ==9) begin
						bcd3 <=0;
					end
					else begin
						bcd3 <= bcd3 +4'd1;
					end
			 end
			 else begin
				bcd2 <= bcd2+4'd1;
			 end
		end
		else begin
			bcd1 <= bcd1 +4'd1;
		end
	end
end	
endmodule
