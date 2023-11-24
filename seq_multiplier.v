`timescale 1ns / 1ps


module seq_multiplier(
    input clk,
    input clr,
    input start,
    input [3:0] a,
    input [3:0] b,
    output wire [7:0] p
);

    wire zero;
    wire lsb_b;
    wire en_a;
    wire ld_shift_a;
    wire en_b;
    wire ld_shift_b;    
    wire en_p;
    wire ld_add_p;
  
    control_unit c1 (
        .start(start),
        .zero(zero),
        .lsb(lsb_b),
        .clr(clr),
        .clk(clk),
        .en_a(en_a),
        .ld_shift_a(ld_shift_a),
        .en_b(en_b),
        .ld_shift_b(ld_shift_b),
        .en_p(en_p),
        .ld_add_p(ld_add_p)
    );

    datapath d1 (
        .zero(zero),
        .lsb_b(lsb_b),
        .p(p),
        .clr(clr),
        .clk(clk),
        .A(a),
        .b(b),
        .en_a(en_a),
        .ld_shift_a(ld_shift_a),
        .en_b(en_b),
        .ld_shift_b(ld_shift_b),
        .en_p(en_p),
        .ld_add_p(ld_add_p)
    );
endmodule
