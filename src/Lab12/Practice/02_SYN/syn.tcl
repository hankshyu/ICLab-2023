#======================================================
#
# Synopsys Synthesis Scripts (Design Vision dctcl mode)
#
#======================================================

#======================================================
#  Set Libraries
#======================================================

set search_path {./../01_RTL \
                 ./../04_MEM \
                 ~iclabta01/umc018/Synthesis/ \
                 /usr/synthesis/libraries/syn/ }

set synthetic_library {dw_foundation.sldb}
set link_library {* dw_foundation.sldb standard.sldb slow.db RA1SH.db RA1SH1.db RA1SH2.db}
set target_library {slow.db}

#report_lib slow
#======================================================
#  Global Parameters
#======================================================
set DESIGN "FFT2D"
set CYCLE 6.0
#======================================================
#  Read RTL Code
#======================================================
read_verilog {$DESIGN\.v}
current_design $DESIGN

#======================================================
#  Global Setting
#======================================================

#======================================================
#  Set Design Constraints
#======================================================
create_clock -name "clk" -period $CYCLE clk
set_input_delay  [ expr $CYCLE*0.5 ] -clock clk [all_inputs]
set_output_delay [ expr $CYCLE*0.5 ] -clock clk [all_outputs]
set_input_delay 0 -clock clk clk
set_input_delay 0 -clock clk rst_n
set_load 0.05 [all_outputs]
set_dont_use slow/JKFF*

#======================================================
#  Optimization
#======================================================
check_design > Report/$DESIGN\.check
set_fix_multiple_port_nets -all -buffer_constants
compile_ultra

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
write_sdc Netlist/$DESIGN\_SYN.sdc

#======================================================
#  Finish and Quit
#======================================================
exit

