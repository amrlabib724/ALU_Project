module ALU_TOP (pb_a, pb_b, pb_op, reset,Clk,sw,LED,AN_SEL,seven_seg_out);

input pb_a, pb_b, pb_op, reset, Clk;
input [7:0] sw;

output  [3:0] AN_SEL;
output  [6:0] seven_seg_out;
output  [7:0] LED;

wire [11:0] BCD_out; 
wire [8:0] Out_with_carry;
wire [3:0] seven_seg_in; 
wire [3:0] Letters;
wire [1:0] sel_in; 
wire pb_a_debounced, pb_b_debounced, pb_op_debounced,slow_clk;
// wire [7:0] sw_debounced;



// Clk Divider for slower clock signal
Clk_div #(.counter_div(25'd4)) clk_div_inst (.Clk(Clk), .Reset(reset), .Clk_out(slow_clk));



//Instatiate debounce modules for buttons and switches

// Debouncer reset_debounce (.Clk(slow_clk), .Reset(1'b0), .pb_in(reset), .pb_out(reset_debounced));
Debouncer pb_a_debounce (.Clk(slow_clk), .Reset(reset), .pb_in(pb_a), .pb_out(pb_a_debounced));
Debouncer pb_b_debounce (.Clk(slow_clk), .Reset(reset), .pb_in(pb_b), .pb_out(pb_b_debounced));
Debouncer pb_op_debounce(.Clk(slow_clk), .Reset(reset), .pb_in(pb_op), .pb_out(pb_op_debounced));
// Debouncer sw_debounce_0 (.Clk(slow_clk), .Reset(reset), .pb_in(sw[0]), .pb_out(sw_debounced[0]));
// Debouncer sw_debounce_1 (.Clk(slow_clk), .Reset(reset), .pb_in(sw[1]), .pb_out(sw_debounced[1]));
// Debouncer sw_debounce_2 (.Clk(slow_clk), .Reset(reset), .pb_in(sw[2]), .pb_out(sw_debounced[2]));
// Debouncer sw_debounce_3 (.Clk(slow_clk), .Reset(reset), .pb_in(sw[3]), .pb_out(sw_debounced[3]));
// Debouncer sw_debounce_4 (.Clk(slow_clk), .Reset(reset), .pb_in(sw[4]), .pb_out(sw_debounced[4]));
// Debouncer sw_debounce_5 (.Clk(slow_clk), .Reset(reset), .pb_in(sw[5]), .pb_out(sw_debounced[5]));
// Debouncer sw_debounce_6 (.Clk(slow_clk), .Reset(reset), .pb_in(sw[6]), .pb_out(sw_debounced[6]));
// Debouncer sw_debounce_7 (.Clk(slow_clk), .Reset(reset), .pb_in(sw[7]), .pb_out(sw_debounced[7]));



//Instantiate ALU module
ALU alu_inst (
    .sw(sw),
    .pb_a(pb_a_debounced),
    .pb_b(pb_b_debounced),
    .pb_op(pb_op_debounced),
    .reset(reset),
    .Clk(Clk), 
    .Out_with_carry(Out_with_carry),
    .Letters(Letters),
    .LED(LED)
);


// Instantiate DEC_To_BCD module
DEC_To_BCD dec_to_bcd_inst (.BINARY(Out_with_carry),.BCD(BCD_out));


// Instantiate AN_SEL module
AN_SEL an_sel_inst(.Clk(slow_clk), .Reset(reset), .AN(AN_SEL), .sel(sel_in));


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
