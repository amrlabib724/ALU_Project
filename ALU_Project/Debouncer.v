module Debouncer (pb_in,Clk,Reset,pb_out);
input pb_in,Clk,Reset;
output pb_out; // Initialize output to 0   
wire Q1, Qn2,Q1_and_Qn2; // Outputs from D flip-flops
// Instantiate the clock divider to generate a slower clock for debouncing  
D_FF D_FF_1 (.Clk(Clk), .Reset(Reset), .D(pb_in), .Q(Q1), .Qn());
D_FF D_FF_2 (.Clk(Clk), .Reset(Reset), .D(Q1), .Q(), .Qn(Qn2));
and And1(Q1_and_Q2, Q1, Qn2); // AND gate to combine outputs of D flip-flops    
or  Or1(pb_out,Q1,Q1_and_Q2);        
endmodule //Debouncer

