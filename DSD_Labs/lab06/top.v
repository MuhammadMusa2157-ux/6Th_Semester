`timescale 1ns / 1ps


module top(
		input clk, reset,
		output wire [7:0] segments,
		output wire [2:0] enables
    );

wire clk_1hz;
wire clk_1khz;

wire [3:0] bcd0, bcd1, bcd2;
wire [7:0] in0, in1, in2;

// Clock Divider Instances
clock_divider #(50000000) U0(clk, clk_1hz);
clock_divider 	  #(50000) U1(clk, clk_1khz);

bcd_counter U2(clk_1hz, ~reset, bcd0, bcd1, bcd2);

// BCD to 7 segment decoder instances
bcd_to_7_segment_decoder U3(bcd0, in0);
bcd_to_7_segment_decoder U4(bcd1, in1);
bcd_to_7_segment_decoder U5(bcd2, in2);


seven_seg_display_multiplexer U6(clk_1khz, in0, in1, in2, enables, segments);


endmodule
