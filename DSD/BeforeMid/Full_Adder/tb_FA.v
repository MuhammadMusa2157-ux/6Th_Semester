module FA_TB(); // Testbench modules don't have input/output ports

  reg A, B, Cin;
  wire S, Cout; // Corrected: Cout instead of Cin

  FA FA_instance(A, B, Cin, S, Cout); // Instantiate the Full Adder module

  initial begin
    #10 A = 0; B = 0; Cin = 0;
    #10 A = 0; B = 0; Cin = 1;
    #10 A = 0; B = 1; Cin = 0;
    #10 A = 0; B = 1; Cin = 1;
    #10 A = 1; B = 0; Cin = 0;
    #10 A = 1; B = 0; Cin = 1;
    #10 A = 1; B = 1; Cin = 0;
    #10 A = 1; B = 1; Cin = 1;
    #10 $finish; // Add $finish to end the simulation
  end

  initial begin
    $monitor("A=%b, B=%b, Cin=%b, S=%b, Cout=%b", A, B, Cin, S, Cout);
  end

endmodule