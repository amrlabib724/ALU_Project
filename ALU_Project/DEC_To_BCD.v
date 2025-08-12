module DEC_To_BCD(input [8:0]BINARY,output reg [11:0]BCD);

integer i;

always @(*) begin
  BCD = 12'b0;
  for (i=8;i>=0;i=i-1)begin
    BCD = {BCD[10:0],BINARY[i]};
  if (i>0)begin
  if (BCD[3:0]>4) BCD[3:0] = BCD[3:0] + 3;
  if (BCD[7:4]>4) BCD[7:4] = BCD[7:4] + 3;
  if (BCD[11:8]>4) BCD[11:8] = BCD[11:8] + 3;
      
    end
  end

end
endmodule //DEC_To_BCD
