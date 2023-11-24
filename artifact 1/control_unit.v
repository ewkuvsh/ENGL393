`timescale 1ns / 1ps

module control_unit(
    input start,
    input zero,
    input lsb,
    input clr,
    input clk,
    output reg en_a,
    output reg ld_shift_a,
    output reg  en_b,
    output reg ld_shift_b,
    output reg en_p,
    output reg ld_add_p
    );
reg [1:0] cur;
reg [1:0] next; 
parameter idle = 2'b00, load = 2'b01,shift = 2'b10, add = 2'b11;


assign clk_cmb = clk + clr;
initial begin
    en_a = 0; 
     ld_shift_a=0;
     en_b=0;
     ld_shift_b=0;
     en_p=0;
     ld_add_p=0;
     cur = idle;
     next = idle;
     end
always @ (negedge clk_cmb)
 begin 
    if (clr == 1) 
        cur = idle;
    else
        cur = next;
 end

always @(*) begin
    case(cur)
    idle: if (start == 1) 
            next = load;
          else
            next = start;
    load: if(zero == 0) 
            next = idle;
         else if(lsb == 1) 
            next = add;
          else 
            next = shift;
            
     shift: if(zero==0)
                next = idle;
            else if(lsb==1)
                next = add;
            else
                next = shift;
     add:  next = shift;
        

     endcase
end


always @(*) begin //combinational logic block
   

        case(cur)
         idle:    begin  
                     en_a = 0; 
                     ld_shift_a=0;
                     en_b=0;
                     ld_shift_b=0;
                     en_p=0;
                     ld_add_p=0; 
                   end
         load:    begin  
                     en_a = 1; 
                     ld_shift_a=0;
                     en_b=1;
                     ld_shift_b=0;
                     en_p=1;
                     ld_add_p=0;
                   end
         shift:    begin  
                     en_a = 1; 
                     ld_shift_a=1;
                     en_b=1;
                     ld_shift_b=1;
                     en_p=0;
                     ld_add_p=0;
                    end
           add:    begin  
                     en_a = 0; 
                     ld_shift_a=0;
                     en_b=0;
                     ld_shift_b=0;
                     en_p=1;
                     ld_add_p=1; 
                   end
        endcase
                     
                     
            


end
    
endmodule


