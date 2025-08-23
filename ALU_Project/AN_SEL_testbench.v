module AN_SEL_testbench();
reg Clk, Reset;
wire [3:0] AN; 
wire [1:0] sel;
wire Clk_out;

Clk_div #(.counter_div(25'd4)) Clk_div_inst( .Clk(Clk),.Reset(Reset),.Clk_out(Clk_out)); 

AN_SEL dut (.Clk(Clk_out),.Reset(Reset),.AN(AN),.sel(sel));
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
        $monitor("Time: %0t ns, AN: %b, sel: %b", $time, AN, sel);
    end
    // Simulation time
    initial begin
        #2000 $stop; // Run for 2000 ns
    end


endmodule //AN_SEL_testbench
