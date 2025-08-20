module Debouncer_testbench();
    reg Clk, Reset, pb_in;
    wire pb_out, Clk_out;

    Clk_div #(.counter_div(25'd4)) Clk_div_inst( .Clk(Clk),.Reset(Reset),.Clk_out(Clk_out)); // 100 Hz output from 50 MHz input
    // Instantiate the debouncer
    Debouncer dut (.pb_in(pb_in), .Clk(Clk_out), .Reset(Reset), .pb_out(pb_out));

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

    // Input stimulus
    initial begin
        pb_in = 0;
        #100 pb_in = 1; // Simulate button press
        #200 pb_in = 0; // Simulate button release
        #300 pb_in = 1; // Simulate another button press
        #400 pb_in = 0; // Simulate button release again
    end 

    // Monitor output
    initial begin
        $monitor("Time: %0t ns, pb_in: %b, pb_out: %b", $time, pb_in, pb_out);
    end 

    // Simulation time
    initial begin
        #1000 $stop; // Run for 1000 ns
    end

endmodule //Debouncer