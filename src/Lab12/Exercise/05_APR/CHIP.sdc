###################################################################

# Created by write_sdc on Thu May  4 22:05:21 2023

###################################################################
set sdc_version 2.1

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_wire_load_mode top
set_load -pin_load 0.05 [get_ports out_valid]
set_load -pin_load 0.05 [get_ports {out[3]}]
set_load -pin_load 0.05 [get_ports {out[2]}]
set_load -pin_load 0.05 [get_ports {out[1]}]
set_load -pin_load 0.05 [get_ports {out[0]}]
create_clock [get_ports clk]  -period 10  -waveform {0 5}
set_input_delay -clock clk  0  [get_ports clk]
set_input_delay -clock clk  5  [get_ports rst_n]
set_input_delay -clock clk  5  [get_ports in_valid]
set_input_delay -clock clk  5  [get_ports {col[3]}]
set_input_delay -clock clk  5  [get_ports {col[2]}]
set_input_delay -clock clk  5  [get_ports {col[1]}]
set_input_delay -clock clk  5  [get_ports {col[0]}]
set_input_delay -clock clk  5  [get_ports {row[3]}]
set_input_delay -clock clk  5  [get_ports {row[2]}]
set_input_delay -clock clk  5  [get_ports {row[1]}]
set_input_delay -clock clk  5  [get_ports {row[0]}]
set_input_delay -clock clk  5  [get_ports in_valid_num]
set_input_delay -clock clk  5  [get_ports {in_num[2]}]
set_input_delay -clock clk  5  [get_ports {in_num[1]}]
set_input_delay -clock clk  5  [get_ports {in_num[0]}]
set_input_delay -clock clk  5  [get_ports Port10]
set_output_delay -clock clk  5  [get_ports out_valid]
set_output_delay -clock clk  5  [get_ports {out[3]}]
set_output_delay -clock clk  5  [get_ports {out[2]}]
set_output_delay -clock clk  5  [get_ports {out[1]}]
set_output_delay -clock clk  5  [get_ports {out[0]}]
