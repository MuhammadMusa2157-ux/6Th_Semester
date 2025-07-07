module fsm_counter (count, clock); 

	input clock; 
	output [2:0] count; 
	reg [2:0] count; 
	//use parameter statement to define states 
	parameter A = 3'b000, B = 3'b100, C = 3'b111, D = 3'b010, E = 3'b011;
	 
	always @ (posedge clock) 
		//use case statement to implement state transitions 
		case(count) 
			A: count <= B; 
			B: count <= C; 
			C: count <= D; 
			D: count <= E; 
			E: count <= A; 
			default: count <= C; 
		endcase 
		
endmodule