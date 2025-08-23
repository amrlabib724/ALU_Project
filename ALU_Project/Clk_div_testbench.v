
module Clk_div_testbench();
    reg Clk, Reset;
    wire Clk_out;

    // Instantiate the clock divider
Clk_div #(.counter_div(25'd249_999)) dut( .Clk(Clk),.Reset(Reset),.Clk_out(Clk_out)); // 100 Hz output from 50 MHz input
    // Clock generation
    initial begin
        Clk = 0;
        forever #10 Clk = ~Clk; // 50 MHz clock    
    end

    // Reset pulse
    initial begin
        Reset = 1;
        #20 Reset = 0;
    end

    // Monitor output
    initial begin
        $monitor("Time: %0t ns, Clk_out: %b", $time, Clk_out);
    end
    
    // Simulation time
    initial begin
        #20_000_000_00 $finish; // Run for 2 seconds
    end
endmodule
