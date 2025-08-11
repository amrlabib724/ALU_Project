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
        #700 D = 1; 
        #200 D = 0; 
        #500 D = 0; 
        #700 D = 1; 
        #300 D = 0; 
        #700 D = 1; 
    end 
    // Monitor output
    initial begin
        $monitor("Time: %0t ns, D: %b, Q: %b, Qn: %b", $time, D, Q, Qn);
    end 
    //Simulation time
    initial begin
        #20000 $stop ;
    end
endmodule //D_ff_testbench