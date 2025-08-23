module D_FF (Clk, Reset, D, Q, Qn);
input Clk, Reset, D;
    
output reg Q, Qn;

always @(posedge Clk or posedge Reset) begin
    if (Reset) begin
        Q <= 0; // Reset Q to 0
        Qn <= 1; // Reset Qn to 1
    end else begin
        Q <= D; // Set Q to D on clock edge
        Qn <= ~D; // Set Qn to the inverse of D
    end
end
endmodule //D_FF
