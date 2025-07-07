 module ring_counter #(parameter WIDTH=4) 
(
 input clk,
 input reset, 
output reg [WIDTH-1:0] out=1
 );
 always @ (posedge clk) begin
 if (reset) 
out <= 1;
 else begin
 out <= out << 1; 
out[0] <= out[WIDTH-1];
 end
 end
 endmodules