#======================================================
#
# Synopsys Synthesis Scripts (Design Vision dctcl mode)
#
#======================================================

#======================================================
#  Set Libraries
#======================================================

set search_path {./../01_RTL \
                   ~iclabta01/umc018/Synthesis \
                   /usr/synopsys/libraries/syn/ \
                   /usr/synthesis/dw/ }

set link_library {* slow.db dw_foundation.sldb standard.sldb}
#set synthetic_library {standard.sldb dw01.sldb dw02.sldb dw03.sldb dw04.sldb dw05.sldb}
set synthetic_library {dw_foundation.sldb}
set target_library {slow.db}


#======================================================
#  Global Parameters
#======================================================
set DESIGN "OS"
set CLK_period 4.2
set IN_DLY [expr 0.5*$CLK_period]
set OUT_DLY [expr 0.5*$CLK_period]
set hdlin_ff_always_sync_set_reset true
#======================================================
#  Read RTL Code
#======================================================


set hdlin_auto_save_templates TRUE
read_sverilog { Usertype_OS.sv INF.sv OS.sv }
# read_verilog -rtl $DESIGN\.sv
current_design $DESIGN

#======================================================
#  Global Setting
#======================================================
set_wire_load_mode top

#======================================================
#  Set Design Constraints
#======================================================
create_clock -name "clk" -period $CLK_period clk
# create_clock -name "clk" -period $CLK_period inf.clk
set_ideal_net clk
set_input_delay $IN_DLY -clock clk [all_inputs]
set_input_delay 0 -clock clk clk
# set_input_delay $IN_DLY -clock clk reset
set_output_delay $OUT_DLY -clock clk [all_outputs]
set_load 0.05 [all_outputs]
#set hdlin_ff_always_sync_set_reset true

#======================================================
#  Optimization
#======================================================
uniquify
check_design > Report/$DESIGN\.check
set_fix_multiple_port_nets -all -buffer_constants


set_fix_hold [all_clocks]
current_design $DESIGN
compile_ultra
#compile
#======================================================
#  Output Reports 
#======================================================
report_timing >  Report/$DESIGN\.timing
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
write -format svsim   -output Netlist/$DESIGN\_Wrapper.sv
write_sdf -version 3.0 -context verilog -load_delay cell Netlist/$DESIGN\_SYN.sdf

#======================================================
#  Finish and Quit
#======================================================
exit