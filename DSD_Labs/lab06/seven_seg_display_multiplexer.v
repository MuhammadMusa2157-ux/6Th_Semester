`timescale 1ns / 1ps

module seven_seg_display_multiplexer(
	input clk,
	input [7:0] in0, in1, in2,
	output reg [2:0] enables,
	output reg [7:0] segments
);

reg [1:0] enable_sel;

always @(posedge clk) begin

	  enable_sel <= enable_sel + 2'b01;
	  
	  case(enable_sel)
			0: begin
				 enables <= 3'b110; 
				 segments <= in0;
			end
			1: begin
				 enables <= 3'b101;
				 segments <= in1;
			end
			2: begin
				 enables <= 3'b011;
				 segments <= in2;
			end
			default: begin
				 enables <= 3'b111;
				 segments <= 8'b11111111;
			end
	  endcase
end

endmodule