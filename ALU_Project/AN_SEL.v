module AN_SEL (Clk,Reset,AN,sel);
input Clk, Reset;
output reg [3:0] AN;
output reg [1:0] sel; 

always @(posedge Clk or posedge Reset) begin
    if (Reset) begin
        sel <= 2'b00; 
    end
    else begin
        sel <= sel + 1; 
    end
    end

    always @(*) begin
        case (sel)
            2'b00: AN = 4'b1110; // Enable first 7_sig for Ones
            2'b01: AN = 4'b1101; // Enable second 7_sig for Tens
            2'b10: AN = 4'b1011; // Enable third 7_sig for Hundreds
            2'b11: AN = 4'b0111; // Enable fourth 7_sig for Letters
            default: AN = 4'b1111; // Disable all 7_seg
        endcase
    end

endmodule //AN_SEL

