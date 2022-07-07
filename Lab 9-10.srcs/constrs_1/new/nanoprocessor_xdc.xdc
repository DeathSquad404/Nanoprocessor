## R7 values
set_property PACKAGE_PIN U16 [get_ports {S_LED[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {S_LED[0]}]
set_property PACKAGE_PIN E19 [get_ports {S_LED[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {S_LED[1]}]
set_property PACKAGE_PIN U19 [get_ports {S_LED[2]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {S_LED[2]}]
set_property PACKAGE_PIN V19 [get_ports {S_LED[3]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {S_LED[3]}]
    
## Zero flag
set_property PACKAGE_PIN P1 [get_ports {ZERO_FLAG}]
    set_property IOSTANDARD LVCMOS33 [get_ports {ZERO_FLAG}]

## Sign Flag
set_property PACKAGE_PIN V14 [get_ports {Sign}]
    set_property IOSTANDARD LVCMOS33 [get_ports {Sign}]

## Overflow
set_property PACKAGE_PIN L1 [get_ports {OVERFLOW}]
    set_property IOSTANDARD LVCMOS33 [get_ports {OVERFLOW}]
    
##7 segment display
set_property PACKAGE_PIN W7 [get_ports {S_7_Seg_val[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {S_7_Seg_val[0]}]
set_property PACKAGE_PIN W6 [get_ports {S_7_Seg_val[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {S_7_Seg_val[1]}]
set_property PACKAGE_PIN U8 [get_ports {S_7_Seg_val[2]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {S_7_Seg_val[2]}]
set_property PACKAGE_PIN V8 [get_ports {S_7_Seg_val[3]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {S_7_Seg_val[3]}]
set_property PACKAGE_PIN U5 [get_ports {S_7_Seg_val[4]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {S_7_Seg_val[4]}]
set_property PACKAGE_PIN V5 [get_ports {S_7_Seg_val[5]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {S_7_Seg_val[5]}]
set_property PACKAGE_PIN U7 [get_ports {S_7_Seg_val[6]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {S_7_Seg_val[6]}]  
   
## an    
set_property PACKAGE_PIN U2 [get_ports {an[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]
set_property PACKAGE_PIN U4 [get_ports {an[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]
set_property PACKAGE_PIN V4 [get_ports {an[2]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]
set_property PACKAGE_PIN W4 [get_ports {an[3]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]      

## Clock signal
set_property PACKAGE_PIN W5 [get_ports CLK]
    set_property IOSTANDARD LVCMOS33 [get_ports CLK]
    create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports CLK]

## Reset
set_property PACKAGE_PIN V17 [get_ports {RESET}]
    set_property IOSTANDARD LVCMOS33 [get_ports {RESET}]