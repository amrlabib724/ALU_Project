module Clk_div (Clk,Reset,Clk_out);
    input Clk, Reset;
    output reg Clk_out;

    reg [24:0] counter=0; // 25-bit counter for division
    reg [24:0] counter_div = 249_999; // 100 Hz output from 50 MHz input


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
