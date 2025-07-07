`timescale 1ns / 1ps

module clock_divider #(parameter N=50000000)(
	input clk_in, 
	output reg clk_out 
);

reg [26:0] counter; 


always @(posedge clk_in ) begin
	if (counter == N - 1) begin
		counter <= 0;
		clk_out <= ~clk_out;
	end else begin
		counter <= counter + 27'd1;
	end
end
endmodule