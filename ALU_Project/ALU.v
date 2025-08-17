module ALU (
input [7:0]sw,
input pb_a, pb_b, pb_op, reset, Clk,
output reg [8:0]Out_with_carry,
output reg [3:0] Letters,
output reg [7:0] LED
);

reg [7:0] A, B;
reg [2:0] OP_SEL;
always @(posedge Clk or posedge reset) begin
    if (reset) begin
        A <= 8'b0;
        B <= 8'b0;
        OP_SEL <= 3'b0;
        LED <= 8'b0;
        Letters <= 4'd0;
        Out_with_carry <= 9'b0;
    end 
    else if (pb_a) begin
        A <= sw; 
        LED <=A;
        Out_with_carry <= {1'b0, A }; 
        Letters <= 4'hA; 
    end 
    else if (pb_b) begin
        B <=sw; 
        LED <=B;
        Out_with_carry <= {1'b0, B }; 
        Letters <= 4'hB; 
    end 
    else if (pb_op) begin
      OP_SEL <=sw[2:0];
      LED <= {5'b0,OP_SEL};
      Letters <= 4'hC;  
     case (OP_SEL)
        3'b001 : Out_with_carry = A + B;
        3'b010 : Out_with_carry = {1'b0,A - B};
        3'b011 : Out_with_carry = {1'b0, ~A + 1}; 
        3'b101 : Out_with_carry = {1'b0, A | B};  
        3'b110 : Out_with_carry = {1'b0, A ^ B};  
    default : Out_with_carry = 9'b0; 
    endcase  
    end
end
endmodule //ALU











