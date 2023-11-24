`timescale 1ns / 1ps

module mux2g
#( parameter N = 4)
( input wire [N-1:0] a,
input wire [N-1:0] b,
input wire s,
output reg [N-1:0] y
);


always @(*)
if ( s == 0)
y = a;
else // s == 1
y = b;
endmodule