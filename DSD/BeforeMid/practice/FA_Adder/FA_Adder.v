module FA(A, B, Cin, S, Cout);
  // Input ports:
  input A, B, Cin; // A and B are the two input bits, Cin is the carry-in bit

 
  output S, Cout; // S is the sum output, Cout is the carry-out output

 
  wire C1, C2; // C1 and C2 are intermediate wires to store partial carry values

  assign S = A ^ B ^ Cin;

  assign C1 = A & B;
  assign C2 = Cin & (A ^ B);

  
  assign Cout = C1 | C2;

endmodule