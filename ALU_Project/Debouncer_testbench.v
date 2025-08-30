module Debouncer_testbench();
    reg Clk, Reset, pb_in;
    
    wire pb_out, Clk_out;

    integer i ;

    Clk_div #(.counter_div(25'd4)) Clk_div_inst( .Clk(Clk),.Reset(Reset),.Clk_out(Clk_out)); 
    
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
        #50 Reset = 0;
    end

    // Input stimulus
    initial begin
       for (i =0 ;i<15 ;i=i+1 ) begin
        pb_in=1;
        #50;
        pb_in=~pb_in;
        #50;
       end
       pb_in=1;
       #550;
       pb_in=0;
       #100;
       $stop;
    end 

    // Monitor output
    initial begin
        $monitor("Time: %0t ns, pb_in: %b, pb_out: %b", $time, pb_in, pb_out);
    end 


endmodule //Debouncer
