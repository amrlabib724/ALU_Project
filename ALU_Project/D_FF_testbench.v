module D_FF_testbench ();
reg Clk, Reset, D;
wire Q, Qn;
// Instantiate the D flip-flop
D_FF d_ff_inst (.Clk(Clk), .Reset(Reset), .D(D), .Q(Q), .Qn(Qn));

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
        D = 0;
        #700 D = 1; // Change D after 70 ns
        #200 D = 0; // Change D back to 0 after another 20 ns
        #500 D = 1; // Change D after 50 ns
        #500 D = 0; // Change D back to 0 after another 50 ns
        #700 D = 1; // Change D to 1 again after another 70 ns
        #300 D = 0; // Change D back to 0 after another 30 ns
        #700 D = 1; // Change D to 1 again after another 70 ns
    end 
    // Monitor output
    initial begin
        $monitor("Time: %0t ns, D: %b, Q: %b, Qn: %b", $time, D, Q, Qn);
    end 
    //Simulation time
    initial begin
        #20000 $stop ;// Run for 20000ns
    end
endmodule //D_ff_testbench