
module DEC_To_BCD_testbench();
reg [8:0]binary ;
wire [11:0]bcd ;
DEC_To_BCD dut(.BINARY(binary),.BCD(bcd));
integer i,bcd_val=0;
initial begin
  for (i = 0; i<30; i = i+1 )begin
  binary = $random ; // Generate random binary number in the range 0-511
  //#10;
  bcd_val =  (bcd[11:8] * 100) + (bcd[7:4] * 10) + bcd[3:0];
  if (binary != bcd_val)begin
     $display("error!");
     $stop;
    end

  end 
    $stop; // Stop the simulation after checking all values
end
initial begin
    $monitor ("binary_num = %d  BCD_num = %b_%b_%b",binary,bcd[11:8],bcd[7:4],bcd[3:0]);
    end

endmodule //DEC_To_BCD_testbench