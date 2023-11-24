`timescale 1ns / 1ps

module datapath(
    output wire zero,
    output wire lsb_b,
    output [7:0] p,
    input clr,
    input clk,
    input [3:0] A,
    input [3:0] b,
    input en_a,
    input ld_shift_a,
    input en_b,
    input ld_shift_b,
    input en_p,
    input ld_add_p

    );
    wire [7:0] a; // Declare a as a wire
    wire clk_cmb; // Declare clk_cmb as a wire

    // Declare internal wires used in module instantiation
    wire [7:0] ra_out;
    wire [3:0] rb_out;
    
    // Assignments
    assign a = {4'b0000, A};
    assign clk_cmb = clk + clr;



 
lsr_and_mux #(.N(8)) ra ( .a(a), .b(ra_out), .en(en_a), .ld(ld_shift_a), .clk(clk), .clr(clr),.q(ra_out));
rsr_and_mux #(.N(4)) rb ( .a(b), .b(rb_out), .en(en_b), .ld(ld_shift_b), .clk(clk), .clr(clr),.q(rb_out),.zero(zero),.lsb_b(lsb_b));

adder_and_mux #(.N(8)) rp ( .a(8'b00000000), .b(ra_out+p), .en(en_p), .ld(ld_add_p), .clk(clk), .clr(clr),.q(p));


endmodule
