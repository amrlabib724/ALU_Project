vlib work      
vlog ALU.v 
vlog Clk_div.v  
vlog D_FF.v  
vlog Debouncer.v  
vlog DEC_To_BCD.v  
vlog AN_SEL.v  
vlog mux_4x1_control.v  
vlog seven_seg_decode.v  
vlog ALU_TOP.v  
vlog ALU_TOP_testbench.v  
vsim -voptargs=+acc work.ALU_TOP_testbench 
add wave *
run -all
#quit -sim