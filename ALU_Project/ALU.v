module ALU (
input [7:0]A,B,
input [2:0]OP_SEL,
output reg [8:0]Out_with_carry
);
  always @(*) begin
    case (OP_SEL)
        3'b001 : Out_with_carry = A + B ;
        3'b010 : Out_with_carry ={1'b0,A - B};
        3'b011: Out_with_carry = {1'b0, ~A + 1}; 
        3'b101: Out_with_carry = {1'b0, A | B};  
        3'b110: Out_with_carry = {1'b0, A ^ B};  
    default : Out_with_carry = 8'b0; 
    endcase
  end

endmodule //ALU
