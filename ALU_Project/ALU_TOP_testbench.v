module ALU_TOP_testbench ();

    reg pb_a_tb, pb_b_tb, pb_op_tb, reset_tb, Clk_tb;
    reg [7:0] sw_tb;

    wire [7:0] LED_tb;
    wire [3:0] AN_SEL_tb;
    wire [6:0] seven_seg_out_tb;
    integer i;

    // Instantiate DUT
    ALU_TOP dut (
        .pb_a(pb_a_tb),
        .pb_b(pb_b_tb),
        .pb_op(pb_op_tb),
        .sw(sw_tb),
        .reset(reset_tb),
        .Clk(Clk_tb),
        .AN_SEL(AN_SEL_tb),
        .LED(LED_tb),
        .seven_seg_out(seven_seg_out_tb)
    );

    // Clock generation
  initial begin
  Clk_tb = 0;
  forever #10 Clk_tb = ~Clk_tb;// 50 MHz clock
end

    initial begin

         reset_tb = 1;
       #200 reset_tb = 0;
        // Test case 1: Set A
        pb_b_tb = 0; pb_op_tb = 0; 
        sw_tb = 8'b00001111; // Set A to 15
        for (i =0 ;i<15 ;i=i+1 ) begin
        pb_a_tb=1;
        #20;
        pb_a_tb=~pb_a_tb;
        #20;
       end
        pb_a_tb=1;
       #550;
        pb_a_tb = 0; 
         // Test case 2: Set B
        #500 ;
        sw_tb= 8'b00000101; // Set B to 5
        #20;
        for (i =0 ;i<15 ;i=i+1 ) begin
        pb_b_tb=1;
        #20;
        pb_b_tb=~pb_b_tb;
        #20;
       end
       pb_b_tb=1;
       #500;
        pb_b_tb = 0; 
        // Test case 3: Perform addition
        #500
        sw_tb= 8'b000000001; // Set operation to additio
        #20;
          for (i =0 ;i<15 ;i=i+1 ) begin
        pb_op_tb=1;
        #20;
        pb_op_tb=~pb_op_tb;
        #20;
       end
       pb_op_tb=1;
       #550;
       pb_op_tb = 0; 
        #2000    
        $stop;
    end

endmodule
