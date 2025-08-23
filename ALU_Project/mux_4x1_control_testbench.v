module mux_4x1_control_testbench ();
    
reg [3:0] Ones, Tens, Hundreds, Letters,out_expected;
reg [1:0] AN_SEL;
    
wire [3:0] digit_BCD;
mux_4x1_control dut (
    .Ones(Ones),
    .Tens(Tens),
    .Hundreds(Hundreds),
    .Letters(Letters),
    .AN_SEL(AN_SEL),
    .digit_BCD(digit_BCD)
);

initial begin
    // Test case 1: Select Ones
    Ones = 4'd3; Tens = 4'd9; Hundreds = 4'd5; Letters = 4'hA; // Example values
    AN_SEL = 2'b00;
    out_expected = Ones; // Expected output for Ones
    #10;
    
    // Test case 2: Select Tens
    AN_SEL = 2'b01;
    out_expected = Tens; // Expected output for Tens
    #10;

    // Test case 3: Select Hundreds
    AN_SEL = 2'b10;
    out_expected = Hundreds; // Expected output for Hundreds
    #10;

    // Test case 4: Select Letters
    AN_SEL = 2'b11;
    out_expected = Letters; // Expected output for Letters
    #10;

    // Test case 5: Default case
    AN_SEL = 2'bxx; // Invalid selection
    out_expected = 4'b0000; // Default output
    #10;

    $stop; // Stop the simulation
end
initial begin 
    $monitor("AN_SEL = %b, digit_BCD = %h ,out_expected = %h", AN_SEL, digit_BCD, out_expected);
end
endmodule //mux_4x1_control
