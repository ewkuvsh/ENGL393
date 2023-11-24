module left_shift_register
#( parameter N = 4)

(
input wire en,
input wire ld,
input wire clk,
input wire clr,
input wire [N-1:0] d,
output reg [N-1:0] q
);

assign clk_cmb = clk + clr;


always @ (posedge clk_cmb)
 begin 
    if (clr == 1) 
        q <= 0;
    else if(en)
        if(ld)
            q <= q << 1;
        else 
            q <= d;
 end
 
 
 
 endmodule