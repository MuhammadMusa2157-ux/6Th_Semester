`timescale 1ns / 1ps

module haff_Adder( A,B,S,Cin);
      input A,B;
		output S,Cin;
    assign {S,Cin}=A+B


endmodule
