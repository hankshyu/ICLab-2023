#======================================================
#
# Synopsys Synthesis Scripts (Design Vision dctcl mode)
# Date: 4/02/2023 (Hsu, hank)
#======================================================



#======================================================
#  Specify Libraries
#======================================================
set search_path {./../01_RTL \
                 ~iclabta01/umc018/Synthesis/ \
                 /usr/synthesis/libraries/syn/}

set synthetic_library {dw_foundation.sldb}
set link_library {* dw_foundation.sldb standard.sldb slow.db}  
set target_library {slow.db}

#======================================================
#  Global Parameters
#======================================================
set DESIGN "EC_TOP"
set CYCLE 18.9

#======================================================
#  Read RTL Code
#======================================================
analyze -format verilog {EC_TOP.v INV_IP.v}
elaborate $DESIGN 
current_design $DESIGN
#======================================================
#  Global Setting
#======================================================

#======================================================
#  Develop desgin environment
#======================================================
set_wire_load_mode top
set_load 0.05 [all_outputs]

#======================================================
#  Set Design Constraints
#======================================================
create_clock -name "clk" -period $CYCLE clk
set_input_delay  [ expr $CYCLE*0.5 ] -clock clk [all_inputs]
set_output_delay [ expr $CYCLE*0.5 ] -clock clk [all_outputs]
set_input_delay 0 -clock clk clk
set_input_delay 0 -clock clk rst_n

set_dont_use slow/JKFF*
#======================================================
#  Optimization(Compile strategy)
#======================================================
check_design > Report/$DESIGN\.check
set_fix_multiple_port_nets -all -buffer_constants
#set_fix_hold [all_clocks]
compile_ultra
# compile

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

write_sdf -version 3.0 -context verilog -load_delay cell Netlist/$DESIGN\_SYN.sdf -significant_digits 6
#======================================================
#  Finish and Quit
#======================================================
report_area
report_timing
exit
