#======================================================
#
# Synopsys Synthesis Scripts (Design Vision dctcl mode)
#
#======================================================

#======================================================
#  Set Libraries
#======================================================
set search_path {./../01_RTL \
				 ./ \
				 ~iclabta01/umc018/Synthesis/ \
				 /usr/synthesis/libraries/syn/ \
				 /usr/synthesis/dw/}
				   
set synthetic_library {dw_foundation.sldb}
set link_library {* dw_foundation.sldb standard.sldb slow.db}
set target_library {slow.db}

#======================================================
#  Global Parameters
#======================================================
set DESIGN "CDC"

set CYCLE1 3.2
set CYCLE2 18.4
set C1_DLY  [expr 0.5*$CYCLE1]
set C2_DLY [expr 0.5*$CYCLE2]

#======================================================
#  Read RTL Code
#======================================================
set hdlin_auto_save_templates TRUE

read_sverilog $DESIGN.v
current_design $DESIGN

#======================================================
#  Global Setting
#======================================================
set_wire_load_mode top

set sync_r2w_name "sync_r2w"
set sync_w2r_name "sync_w2r"


#======================================================
#  Set Design Constraints
#======================================================
set_dont_use slow/JKFF*
create_clock -name "clk1" -period $CYCLE1 clk1
create_clock -name "clk2" -period $CYCLE2 clk2 

read_sdc $DESIGN\.sdc

set_dont_touch [all_clocks]
set_ideal_network       [all_clocks]


set_input_delay [expr 0.5*$CYCLE1] -clock clk1 [all_inputs]

set_output_delay [expr 0.5*$CYCLE1] -clock clk1 [get_ports ready]
set_output_delay [expr 0.5*$CYCLE2] -clock clk2 [get_ports out]
set_output_delay [expr 0.5*$CYCLE2] -clock clk2 [get_ports out_valid]

set_input_delay 0 -clock clk1 clk1
set_input_delay 0 -clock clk2 clk2
set_input_delay 0 -clock clk1 rst_n 
set_input_delay 0 -clock clk2 rst_n

# modified accordng to announcement on 04/15 03:55
set_load 0.05 [get_ports ready]
set_load 20 [get_ports out]
set_load 20 [get_ports out_valid]

#======================================================
#  Optimization  
#======================================================
uniquify
check_design > Report/$DESIGN\.check
set_fix_multiple_port_nets -all -buffer_constants

read_sverilog sync_r2w.v
compile
set_dont_touch sync_r2w

read_sverilog sync_w2r.v
compile
set_dont_touch sync_w2r

current_design $DESIGN
compile_ultra

#======================================================
#  Output Reports 
#======================================================
report_timing >  Report/$DESIGN\.timing
report_timing -delay_type min  >  Report/$DESIGN\.timing_hold
report_area >  Report/$DESIGN\.area
report_resource >  Report/$DESIGN\.resource

#======================================================
#  Change Naming Rule
#======================================================
set bus_inference_style "%s\[%d\]"
set bus_naming_style "%s\[%d\]"
set hdlout_internal_busses true

change_names -hierarchy -rule verilog

define_name_rules name_rule -allowed "a-z A-Z 0-9 _" -max_length 255 -type cell
define_name_rules name_rule -allowed "a-z A-Z 0-9 _[]" -max_length 255 -type net
define_name_rules name_rule -map {{"\\*cell\\*" "cell"}}
change_names -hierarchy -rules name_rule

#======================================================
#  Output Results
#======================================================

set verilogout_higher_designs_first true
write -format verilog -output Netlist/$DESIGN\_SYN.v -hierarchy
write_sdc Netlist/$DESIGN\_SYN.sdc
write_sdf -version 3.0 -context verilog -load_delay cell Netlist/$DESIGN\_SYN.sdf -significant_digits 6

report_area
report_timing
#======================================================
#  Finish and Quit
#======================================================
exit
