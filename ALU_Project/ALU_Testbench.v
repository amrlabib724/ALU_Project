module ALU_Testbench();
  reg [7:0] A, B;
  reg [2:0] OP_SEL;
  wire [8:0] Out_with_carry;

  ALU dut (.A(A),.B(B),.OP_SEL(OP_SEL),.Out_with_carry(Out_with_carry));

  initial begin
    // Test addition
    A = 8'd10; B = 8'd20; OP_SEL = 3'b001; #10;
    $display("%d + %d = %d",A,B,Out_with_carry);

    // Test subtraction
    A = 8'd30; B = 8'd15; OP_SEL = 3'b010; #10;
    $display("%d - %d = %d",A,B, Out_with_carry);

    // Test negation
    A = 8'd5; OP_SEL = 3'b011; #10;
    $display("~(%b) = %b",A, Out_with_carry);

    // Test AND operation
    A = 8'b11001100; B = 8'b10101010; OP_SEL = 3'b100; #10;
    $display("%b & %b = %b",A,B, Out_with_carry);

    // Test OR operation
    A = 8'b11001100; B = 8'b10101010; OP_SEL = 3'b101; #10;
    $display("%b | %b = %b",A,B, Out_with_carry);

    // Test XOR operation
    A = 8'b11001100; B = 8'b10101010; OP_SEL = 3'b110; #10;
    $display("%b ^ %b = %b",A,B, Out_with_carry);

    // Default case
    OP_SEL = 3'b000; #10;
    $display("Default case output: %b", Out_with_carry);

    $stop;
  end
endmodule//ALU_Testbench
