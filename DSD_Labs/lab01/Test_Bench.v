module NAND_OR_TB();
  reg A, B;
  wire o;

  // Instantiate the NAND_OR module (DUT - Device Under Test)
  NAND_OR n4(o, A, B); // Correct port order: output first, then inputs

  initial begin
    A = 0; // Initialize A
    B = 0; // Initialize B
    #10;  // Wait for a short time (10 time units)

    // Test case 1: A=0, B=0
    #10; // Wait 10 time units
    $display("A=%b, B=%b, out=%b", A, B, o);

    // Test case 2: A=0, B=1
    A = 0;
    B = 1;
    #10;
    $display("A=%b, B=%b, out=%b", A, B, o);

    // Test case 3: A=1, B=0
    A = 1;
    B = 0;
    #10;
    $display("A=%b, B=%b, out=%b", A, B, o);

    // Test case 4: A=1, B=1
    A = 1;
    B = 1;
    #10;
    $display("A=%b, B=%b, out=%b", A, B, o);

    $finish; // End the simulation
  end

endmodule

// The NAND_OR module (from the previous correction)
module NAND_OR(o, A, B);
  input A, B;
  output o;
  wire nand_out1;

  nand n1(nand_out1, A, B); // NAND A and B
  nand n2(o, nand_out1);    // NAND the output of n1 (effectively an inverter)

endmodule
