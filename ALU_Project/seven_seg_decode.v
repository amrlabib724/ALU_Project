module seven_seg_decode (digit_BCD,seven_seg);
 input [3:0] digit_BCD;
 output reg [6:0] seven_seg;
     always @(*) begin
        case (digit_BCD)
            4'd0: seven_seg = 7'b1111110;
            4'd1: seven_seg = 7'b0110000;
            4'd2: seven_seg = 7'b1101101;
            4'd3: seven_seg = 7'b1111001;
            4'd4: seven_seg = 7'b0110011;
            4'd5: seven_seg = 7'b1011011;
            4'd6: seven_seg = 7'b1011111;
            4'd7: seven_seg = 7'b1110000;
            4'd8: seven_seg = 7'b1111111;
            4'd9: seven_seg = 7'b1111011;
            4'hA: seven_seg = 7'b1110111; 
            4'hB: seven_seg = 7'b0011111; 
            4'hC: seven_seg = 7'b1001110; 
          default: seven_seg = 7'b0000000; 
        endcase
    end
endmodule //seven_seg_decode
