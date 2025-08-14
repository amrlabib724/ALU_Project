module ALU_TOP (pb_a, pb_b, pb_op,sw, reset,Clk, AN_SEL,LED,seven_seg_out);

input pb_a, pb_b, pb_op, reset, Clk;
input [7:0] sw;

output  [3:0] AN_SEL;
output [6:0] seven_seg_out;
output reg [7:0] LED=0;

reg [7:0] A=0, B=0;
reg [3:0] Letters=0;
reg [2:0] OP_SEL=0;

wire [11:0] BCD_out; 
wire [8:0] Out_with_carry;
wire [7:0] sw_debounced;
wire [3:0] seven_seg_in; // Input for seven segment display
wire [1:0] sel_in; 
wire pb_a_debounced, pb_b_debounced, pb_op_debounced,reset_debounced,slow_clk;


// Clk Divider for slower clock signal
Clk_div #(.counter_div(25'd4)) clk_div_inst (.Clk(Clk), .Reset(reset_debounced), .Clk_out(slow_clk));



//Instatiate debounce modules for buttons and switches
Debouncer pb_a_debounce (.Clk(Clk), .Reset(1'b0), .pb_in(pb_a), .pb_out(pb_a_debounced));
Debouncer pb_b_debounce (.Clk(Clk), .Reset(reset_debounced), .pb_in(pb_b), .pb_out(pb_b_debounced));
Debouncer pb_op_debounce(.Clk(Clk), .Reset(reset_debounced), .pb_in(pb_op), .pb_out(pb_op_debounced));
Debouncer sw_debounce_0 (.Clk(Clk), .Reset(reset_debounced), .pb_in(sw[0]), .pb_out(sw_debounced[0]));
Debouncer sw_debounce_1 (.Clk(Clk), .Reset(reset_debounced), .pb_in(sw[1]), .pb_out(sw_debounced[1]));
Debouncer sw_debounce_2 (.Clk(Clk), .Reset(reset_debounced), .pb_in(sw[2]), .pb_out(sw_debounced[2]));
Debouncer sw_debounce_3 (.Clk(Clk), .Reset(reset_debounced), .pb_in(sw[3]), .pb_out(sw_debounced[3]));
Debouncer sw_debounce_4 (.Clk(Clk), .Reset(reset_debounced), .pb_in(sw[4]), .pb_out(sw_debounced[4]));
Debouncer sw_debounce_5 (.Clk(Clk), .Reset(reset_debounced), .pb_in(sw[5]), .pb_out(sw_debounced[5]));
Debouncer sw_debounce_6 (.Clk(Clk), .Reset(reset_debounced), .pb_in(sw[6]), .pb_out(sw_debounced[6]));
Debouncer sw_debounce_7 (.Clk(Clk), .Reset(reset_debounced), .pb_in(sw[7]), .pb_out(sw_debounced[7]));


//sellect A and B based on button presses
always @(posedge slow_clk or posedge reset_debounced) begin
    if (reset_debounced) begin
        A <= 8'b0;
        B <= 8'b0;
        OP_SEL <= 3'b0;
        LED <= 8'b0;
        Letters <= 4'd0;
    end else if (pb_a_debounced) begin
        A <= sw_debounced; 
        LED <= sw_debounced;
        Letters <= 4'hB; 
        end
        else if (pb_b_debounced) begin
        B <= sw_debounced; 
        Letters <= 4'hA; 
        LED <= sw_debounced;

        end
        else if (pb_op_debounced) begin
        OP_SEL <= sw_debounced[2:0];
        LED <= {5'b0,sw_debounced[2:0]};
        Letters <= 4'hC;    
    end
end

// Instantiate ALU module
ALU alu_inst ( .A(A), .B(B), .OP_SEL(OP_SEL), .Out_with_carry(Out_with_carry));

// Instantiate AN_SEL module
AN_SEL an_sel_inst(.Clk(Clk), .Reset(reset_debounced), .AN(AN_SEL), .sel(sel_in));

// Instantiate DEC_To_BCD module
DEC_To_BCD dec_to_bcd_inst (.BINARY(Out_with_carry),.BCD(BCD_out));

// Instantiate mux_control model
mux_4x1_control mux_control_inst (
    .Ones(BCD_out[3:0]),
    .Tens(BCD_out[7:4]),
    .Hundreds(BCD_out[11:8]),
    .Letters(Letters),
    .AN_SEL(sel_in),
    .digit_BCD(seven_seg_in)
);

// Instantiate seven_seg_decode module
seven_seg_decode seven_seg_decode_inst (
    .digit_BCD(seven_seg_in),
    .seven_seg(seven_seg_out)
);
endmodule //ALU_TOP
