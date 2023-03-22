 #======================================================
#
# Synopsys Synthesis Scripts (Design Vision dctcl mode)
#
#======================================================

#======================================================
#  Set Libraries
#======================================================
set search_path    {./../01_RTL \
                    ~iclabta01/umc018/Synthesis/ \
                    /usr/synthesis/libraries/syn/ }

set synthetic_library {dw_foundation.sldb}
set link_library {* dw_foundation.sldb standard.sldb slow.db}
set target_library {slow.db}

#======================================================
#  Global Parameters
#======================================================
set DESIGN "QUEEN"
set hdlin_ff_always_sync_set_reset true
set CYCLE 6.0

#======================================================
#  Read RTL Code
#======================================================

read_sverilog { QUEEN.v}
current_design QUEEN

#======================================================
#  Global Setting
#======================================================
set_wire_load_mode top

#======================================================
#  Set Design Constraints
#======================================================
create_clock -name "clk" -period $CYCLE clk 
set_input_delay  [ expr $CYCLE*0.5 ] -clock clk [all_inputs]
set_output_delay [ expr $CYCLE*0.5 ] -clock clk [all_outputs]
set_input_delay 0 -clock clk clk
set_load 0.05 [all_outputs]

#======================================================
#  Optimization
#======================================================
uniquify
set_fix_multiple_port_nets -all -buffer_constants
compile_ultra

#======================================================
#  Output Reports 
#======================================================
check_design > Report/TT.check
report_timing >  Report/TT.timing
report_area >  Report/TT.area
report_resource >  Report/TT.resource

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
write -format verilog -output Netlist/QUEEN_SYN.v -hierarchy
write_sdf -version 2.1 -context verilog -load_delay cell Netlist/QUEEN_SYN.sdf
report_area
report_timing
#======================================================
#  Finish and Quit
#======================================================
exit
