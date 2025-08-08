module Debouncing (Clk,pb_in,pb_out);
input Clk,  pb_in;
output reg pb_out;
wire Clk_out; // Internal clock signal for debouncing

// Instantiate the clock divider to generate a slower clock for debouncing
Clk_div #(.counter_div(25'd4) )clk_div_inst (.Clk(Clk), .Reset(1'b0), .Clk_out(Clk_out)); // Instantiate clock divider

always @(posedge Clk_out) begin
    pb_out <= pb_in; // Simple debouncing logic
    end
endmodule //Debouncing

