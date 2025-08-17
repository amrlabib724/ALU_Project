module ALU_Testbench();
  reg [7:0] sw ;
  reg pb_a, pb_b, pb_op, reset, Clk;
  wire [8:0] Out_with_carry;
  wire [3:0] Letters;
  wire [7:0] LED_tb;

  ALU dut (
    .sw(sw),
    .pb_a(pb_a),
    .pb_b(pb_b),
    .pb_op(pb_op),
    .reset(reset),
    .Clk(Clk),
    .Out_with_carry(Out_with_carry),
    .Letters(Letters),
    .LED(LED_tb)
  );
  initial begin
    Clk = 0;
    forever #10 Clk = ~Clk; // 50 MHz clock

  end
initial begin
  reset =1;
  #100;
  reset = 0; // Assert reset
  #20;
  sw=8'b00001111; // Set A to 15
  pb_a = 1; pb_b = 0; pb_op = 0;
  #100 pb_a = 0; // Release A
  $display(" A= %d ,LED_A: %d , Out with Carry = %d ", sw, LED_tb,Out_with_carry);
  // Test case 2: Set B
  sw = 8'b00000101; // Set B to 5 
  pb_a = 0; pb_b = 1; pb_op = 0;
  #100 pb_b = 0; // Release B
  $display(" B= %d ,LED_B: %d , Out with Carry = %d ", sw, LED_tb,Out_with_carry);
  // Test case 3: Perform operation
  pb_a = 0; pb_b = 0; pb_op = 1;
  sw = 8'b00000001; // Set operation to addition  
  #100 pb_op = 0; // Release operation
  $display(" Operation: %d ,LED_OP: %d , Out with Carry = %d ", sw, LED_tb,Out_with_carry);
  // Test case 4: Perform another operation
  pb_a = 0; pb_b = 0; pb_op = 1;    
  sw = 8'b00000010; // Set operation to subtraction
  #100 pb_op = 0; // Release operation
  $display(" Operation: %d ,LED_OP: %d , Out with Carry = %d ", sw, LED_tb,Out_with_carry);
  $stop; // Stop simulation
end
endmodule //ALU_Testbench