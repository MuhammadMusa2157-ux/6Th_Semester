 module ring_counter_tb;
 reg clk;
 reg reset;
 wire [7:0] out;
 ring_counter #(8) uut (clk, reset, out);
 always #5 clk = ~clk;
 initial begin
 reset = 0;
 clk = 0;
 #100;
 $finish;
 end
 endmodule
