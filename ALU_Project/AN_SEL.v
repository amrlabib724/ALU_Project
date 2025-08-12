module AN_SEL (Clk,Reset,AN,sel);
input Clk, Reset;
output reg [3:0] AN;
output reg [1:0] sel; // 2-bit selector input
wire slow_clk; // Internal clock signal for slower operation


Clk_div #(.counter_div(25'd249_999)) clk_div_inst (.Clk(Clk), .Reset(Reset), .Clk_out(slow_clk)); //


always @(posedge slow_clk or posedge Reset) begin
    if (Reset) begin
        sel <= 2'b00; // Reset selector to 0
    end
    else begin
        sel <= sel + 1; // Increment selector on each clock cycle
    end
    end

    always @(*) begin
        case (sel)
            2'b00: AN = 4'b1110; // Enable first 7_sig for Ones
            2'b01: AN = 4'b1101; // Enable second 7_sig for Tens
            2'b10: AN = 4'b1011; // Enable third 7_sig for Hundreds
            2'b11: AN = 4'b0111; // Enable fourth 7_sig for Letters
        endcase
    end

endmodule //AN_SEL

