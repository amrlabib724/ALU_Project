module ALU_TOP_testbench;

    reg pb_a_tb, pb_b_tb, pb_op_tb, reset_tb, Clk_tb;
    reg [7:0] sw_tb;

    wire [3:0] AN_SEL_tb;
    wire [6:0] seven_seg_out_tb;
    wire [7:0] LED_tb;

    // Instantiate DUT
    ALU_TOP uut (
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


  initial begin
  Clk_tb = 0;
  forever #10 Clk_tb = ~Clk_tb;// 50 MHz clock
end

    // Stimulus
    initial begin
        // Init
       reset_tb = 1;
        // pb_a = 0;
        // pb_b = 0;
        // pb_op = 0;
        // sw = 8'b00000000; // Initialize switches to 0 
        // Release reset
       #500 reset_tb = 0; // Release reset
        // Test case 1: Set A
        pb_a_tb = 1; pb_b_tb = 0; pb_op_tb = 0; 
        sw_tb = 8'b00001111; // Set A to 15
        #500 pb_a_tb = 0; // 
       $display("  seven_seg_out: %b, LED_A: %d",  seven_seg_out_tb, LED_tb);

         // Test case 1: Set A
        pb_a_tb = 0; pb_b_tb = 1; pb_op_tb = 0; 
        sw_tb= 8'b00000101; // Set B to `5
        #500 pb_b_tb = 0; // 
          pb_a_tb = 0; pb_b_tb = 0; pb_op_tb = 1; 
        sw_tb= 8'b000000001; // Set B to 1`
        #500 pb_op_tb = 0; // 

       $display("  seven_seg_out: %b, LED_B: %d  ",  seven_seg_out_tb, LED_tb );

        // Finish simulation
        $stop;
    end

endmodule
