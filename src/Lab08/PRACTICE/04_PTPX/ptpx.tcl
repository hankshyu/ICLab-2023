#======================================================
#
# PrimeTime  Scripts (dctcl mode)
#
#======================================================

#======================================================
#  1. Set the Power Analysis Mode
#======================================================

set power_enable_analysis true
set power_analysis_mode time_based
set power_report_leakage_breakdowns true
set power_clock_network_include_register_clock_pin_power false

#======================================================
#  2. Read and link the design
#======================================================

set search_path { ./ \
                  ./File/ \
			      ~iclabta01/umc018/Synthesis/  \
                  /usr/syn/libraries/syn/ \
                }
set link_library {* slow.db fast.db }
set synthetic_library {standard.sldb dw_foundation.sldb}
set target_library {slow.db fast.db}

set DESIGN "IP"
read_verilog File/$DESIGN\_SYN.v
current_design $DESIGN
link

#======================================================
#  3. Set transition time / annotate parasitics
#======================================================
set_input_transition .1 [all_inputs]
read_sdc File/$DESIGN\_SYN.sdc
read_sdf -load_delay net File/$DESIGN\_SYN.sdf

#======================================================
#  4. Read Switching Activity File
#======================================================
read_vcd -strip_path TESTBED/I_$DESIGN File/$DESIGN\_SYN.fsdb

#======================================================
#  5. Perform power analysis
#======================================================
check_power
update_power

#======================================================
#  6. Generate Power Report
#======================================================
# BUG command 

set_power_analysis_options -waveform_interval 1 -waveform_format out -waveform_output vcd
# vcd.out
report_power > Report/$DESIGN\_POWER 
 

exit
