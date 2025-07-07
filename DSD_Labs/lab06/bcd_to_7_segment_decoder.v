`timescale 1ns / 1ps

module bcd_to_7_segment_decoder(
    input [3:0] BCD,
    output reg [7:0] segments
);

always @(BCD) begin
    case (BCD)
        0 : segments <= 8'b00000011;
        1 : segments <= 8'b10011111;
        2 : segments <= 8'b00100101;
        3 : segments <= 8'b00001101;
        4 : segments <= 8'b10011001;
        5 : segments <= 8'b01001001;
        6 : segments <= 8'b01000001;
        7 : segments <= 8'b00011111;
        8 : segments <= 8'b00000001;
        9 : segments <= 8'b00001001;
        default : segments <= 8'b11111111;
    endcase
end
endmodule