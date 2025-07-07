module FA(A, B, Cin, S, Cout);
  input A, B, Cin;
  output S, Cout;
  wire C1, C2; // Removed C3 as it wasn't used

  assign S = A ^ B ^ Cin;
  assign C1 = A & B;
  assign C2 = Cin & (A ^ B);
  assign Cout = C1 | C2; 

endmodule
