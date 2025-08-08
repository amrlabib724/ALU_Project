module Clk_div #(parameter counter_div = 25'd249_999) (Clk,Reset,Clk_out);
    input Clk, Reset;
    output reg Clk_out;

    reg [24:0] counter=0; // 25-bit counter for division


    always @(posedge Clk or posedge Reset) begin
        if (Reset) begin
            counter <= 0;
            Clk_out <= 0;
        end else if (counter < counter_div ) begin // Adjust this value for desired frequency
                counter <= counter + 1; // Increment counter
            end else begin
                Clk_out <= ~Clk_out; // Toggle output clock
                counter <= 0; // Reset counter
            end
        end

endmodule //Clk_div
