module mux_4x1_control (Ones, Tens, Hundreds, Letters, AN_SEL,digit_BCD);
input [3:0] Ones, Tens, Hundreds, Letters;
input [1:0] AN_SEL; // 2-bit AN_SEL input
    
output reg [3:0] digit_BCD; // 4-bit output for BCD
    
always @(*) begin
    case (AN_SEL)
        2'b00: digit_BCD = Ones;      // Select Ones
        2'b01: digit_BCD = Tens;      // Select Tens
        2'b10: digit_BCD = Hundreds;   // Select Hundreds
        2'b11: digit_BCD = Letters;    // Select Letters
        default: digit_BCD = 4'b0000;  // Default case to avoid latches
    endcase
end

endmodule //mux_4x1_control
