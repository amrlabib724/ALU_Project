
module Debouncing_testbench();
    reg Clk, pb_in,count;
    wire pb_outt;

    // Instantiate the debouncing module
    Debouncing dut (.Clk(Clk), .pb_in(pb_in), .pb_out(pb_outt));
    // Clock generation
    initial begin
        Clk = 0;
        forever #10 Clk = ~Clk; // Period = 20ns → 50MHz
    end

    // Input pulse generation
    initial begin
        pb_in = 0;
        #30 pb_in = 1; // Press button at time 30ns
        #20 pb_in = 0; // Release button at time 50ns
        #100 pb_in = 1; // Press button again at time 150ns
        #50 pb_in = 0; // Release button at time 200ns

    end

    // Monitor output
    initial begin
        $monitor("Time: %0t ns, pb_outt: %b", $time, pb_outt);
    end

    // Simulation time
    initial begin
        #20000000 $stop; // Run for 200 ns
    end

endmodule