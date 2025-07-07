module ring_counter_tb;

  reg clk;
  reg reset;
  wire [7:0] out;

  ring_counter uut (
    .clk(clk),
    .reset(reset),
    .out(out)
  );

  always #5 clk = ~clk;

  initial begin
    reset = 1; // Corrected: Initialize reset to high (inactive)
    clk = 0;
    #10; // Apply reset for a few clock cycles
    reset = 0; // Deassert reset
    #100;
    $finish;
  end

endmodule