module D_FF (Clk, Reset, D, Q, Qn);
input Clk, Reset, D;
output reg Q, Qn;
wire Clk_out; 

Clk_div #(.counter_div(25'd4) )clk_div_inst (.Clk(Clk), .Reset(Reset), .Clk_out(Clk_out)); // Instantiate clock divider
always @(posedge Clk_out or posedge Reset) begin
    if (Reset) begin
        Q <= 0; // Reset Q to 0
        Qn <= 1; // Reset Qn to 1
    end else begin
        Q <= D; // Set Q to D on clock edge
        Qn <= ~D; // Set Qn to the inverse of D
    end
end
endmodule //D_FF
