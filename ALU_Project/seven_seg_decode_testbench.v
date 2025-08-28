module seven_seg_decode_testbench ();
reg [3:0]digit_BCD;
wire [6:0]seven_seg;
integer i;
seven_seg_decode uut (
    .digit_BCD(digit_BCD),
    .seven_seg(seven_seg)
);
initial begin
    for (i=0;i<20 ;i=i+1) begin
        digit_BCD=$random % 13 ;
        #10; 
                case (digit_BCD)
                        4'd0: if (seven_seg !== 7'b0000001)begin $display("Error for digit %d", digit_BCD);$stop;end
                        4'd1: if (seven_seg !== 7'b1001111)begin $display("Error for digit %d", digit_BCD);$stop;end
                        4'd2: if (seven_seg !== 7'b0010010)begin $display("Error for digit %d", digit_BCD);$stop;end
                        4'd3: if (seven_seg !== 7'b0000110)begin $display("Error for digit %d", digit_BCD);$stop;end
                        4'd4: if (seven_seg !== 7'b1001100)begin $display("Error for digit %d", digit_BCD);$stop;end
                        4'd5: if (seven_seg !== 7'b0100100)begin $display("Error for digit %d", digit_BCD);$stop;end
                        4'd6: if (seven_seg !== 7'b0100000)begin $display("Error for digit %d", digit_BCD);$stop;end
                        4'd7: if (seven_seg !== 7'b0001111)begin $display("Error for digit %d", digit_BCD);$stop;end
                        4'd8: if (seven_seg !== 7'b0000000)begin $display("Error for digit %d", digit_BCD);$stop;end
                        4'd9: if (seven_seg !== 7'b0000100)begin $display("Error for digit %d", digit_BCD);$stop;end
                        4'hA: if (seven_seg !== 7'b0001000)begin $display("Error for digit %d", digit_BCD);$stop;end
                        4'hB: if (seven_seg !== 7'b1100000)begin $display("Error for digit %d", digit_BCD);$stop;end
                        4'hC: if (seven_seg !== 7'b0110001)begin $display("Error for digit %d", digit_BCD);$stop;end
                    default: if (seven_seg !== 7'b1111111)begin $display("Error for invalid input %d", digit_BCD);$stop;end
        endcase
    end
    $display("All tests passed!");
    $stop;
end
endmodule //seven_seg_decode_testbench