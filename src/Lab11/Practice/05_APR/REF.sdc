###################################################################

# Created by write_sdc on Wed Sep 25 19:09:55 2013

###################################################################
set sdc_version 1.7

#define your sdc here
create_clock -name "CLK" -add -period 8.0 -waveform {0.0 4.0} [get_ports CLK]
set_propagated_clock [all_clocks]

set_clock_gating_check -setup 0.0
set_input_delay -clock [get_clocks CLK] -add_delay 4.0 [get_ports RESET]
set_input_delay -clock [get_clocks CLK] -add_delay 4.0 [get_ports {IN_VALID}]
set_input_delay -clock [get_clocks CLK] -add_delay 4.0 [get_ports {IN[0]}]
set_input_delay -clock [get_clocks CLK] -add_delay 4.0 [get_ports {IN[1]}]
set_input_delay -clock [get_clocks CLK] -add_delay 4.0 [get_ports {IN[2]}]
set_input_delay -clock [get_clocks CLK] -add_delay 4.0 [get_ports {IN[3]}]
set_input_delay -clock [get_clocks CLK] -add_delay 4.0 [get_ports {IN[4]}]
set_input_delay -clock [get_clocks CLK] -add_delay 4.0 [get_ports {IN[5]}]
set_input_delay -clock [get_clocks CLK] -add_delay 4.0 [get_ports {IN[6]}]
set_input_delay -clock [get_clocks CLK] -add_delay 4.0 [get_ports {IN[7]}]

set_output_delay -clock [get_clocks CLK] -add_delay 1.0 [get_ports {OUT_VALID}]
set_output_delay -clock [get_clocks CLK] -add_delay 1.0 [get_ports {OUT[0]}]
set_output_delay -clock [get_clocks CLK] -add_delay 1.0 [get_ports {OUT[1]}]
set_output_delay -clock [get_clocks CLK] -add_delay 1.0 [get_ports {REQ}]




