module HA(
    input A, B,
    output S, Cy
);
    assign S = A ^ B; // XOR for sum
    assign Cy = A & B; // AND for carry
endmodule

module full_adder(
    input A, B, Cin,
    output Sum, Cout
);

    wire c0, c1, c2;

    HA ha0 (.A(A), .B(B), .S(c0), .Cy(c1));
    HA ha1 (.A(c0), .B(Cin), .S(Sum), .Cy(c2)); 
    or o1 (Cout, c1, c2);

endmodule