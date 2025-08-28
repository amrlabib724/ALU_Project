module seven_seg_decode (digit_BCD,seven_seg);
 input [3:0] digit_BCD;
 output reg [6:0] seven_seg;
     always @(*) begin
        case (digit_BCD)
            4'd0: seven_seg = 7'b0000001; // 0
            4'd1: seven_seg = 7'b1001111; // 1
            4'd2: seven_seg = 7'b0010010; // 2
            4'd3: seven_seg = 7'b0000110; // 3
            4'd4: seven_seg = 7'b1001100; // 4
            4'd5: seven_seg = 7'b0100100; // 5
            4'd6: seven_seg = 7'b0100000; // 6
            4'd7: seven_seg = 7'b0001111; // 7
            4'd8: seven_seg = 7'b0000000; // 8
            4'd9: seven_seg = 7'b0000100; // 9
            4'hA: seven_seg = 7'b0001000; // A
            4'hB: seven_seg = 7'b1100000; // B
            4'hC: seven_seg = 7'b0110001; // C
          default: seven_seg = 7'b1111111; // default
        endcase
    end
endmodule //seven_seg_decode
