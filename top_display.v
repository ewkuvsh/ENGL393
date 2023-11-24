`timescale 1ns / 1ps


module top_display(
    input clk,
    input clr,
    input [3:0] a,
    input [3:0] b,
    input start,
    output [3:0] an,
    output [6:0] ag
    );
    wire [7:0] p;
    seq_multiplier sm1(.clk(clk),.clr(clr),.start(start),.a(a),.b(b),.p(p));
    display_controller disp1(.clk(clk),.clr(clr),.Dig1(a),.Dig2(b),.Dig3(p[7:4]),.Dig4(p[3:0]),.AN(an),.CA(ag));
    
   
endmodule


