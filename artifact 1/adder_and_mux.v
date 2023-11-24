`timescale 1ns / 1ps


module adder_and_mux
#( parameter N = 4)

(

input wire [N-1:0] a,
input wire [N-1:0] b,
input wire en,
input wire ld,
input wire clk,
input wire clr,
output reg [N-1:0] q

);


wire [N-1:0] d;

assign clk_cmb = clk + clr;

mux2g #( .N(N)) M1 (.a(a ), .b(b), .s(ld), .y(d));

always @ (posedge clk_cmb)
 begin 
    if (clr == 1) 
        q = 0;
    else if(en)
        if(ld)
            q = d;
        else 
            q = d;
 end
 
 
 
 endmodule