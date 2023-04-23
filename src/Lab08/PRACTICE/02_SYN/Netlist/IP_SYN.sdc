###################################################################

# Created by write_sdc on Fri Apr 21 00:35:43 2023

###################################################################
set sdc_version 2.1

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_load -pin_load 0.05 [get_ports out_valid]
set_load -pin_load 0.05 [get_ports {out_number[11]}]
set_load -pin_load 0.05 [get_ports {out_number[10]}]
set_load -pin_load 0.05 [get_ports {out_number[9]}]
set_load -pin_load 0.05 [get_ports {out_number[8]}]
set_load -pin_load 0.05 [get_ports {out_number[7]}]
set_load -pin_load 0.05 [get_ports {out_number[6]}]
set_load -pin_load 0.05 [get_ports {out_number[5]}]
set_load -pin_load 0.05 [get_ports {out_number[4]}]
set_load -pin_load 0.05 [get_ports {out_number[3]}]
set_load -pin_load 0.05 [get_ports {out_number[2]}]
set_load -pin_load 0.05 [get_ports {out_number[1]}]
set_load -pin_load 0.05 [get_ports {out_number[0]}]
create_clock [get_ports clk]  -period 20  -waveform {0 10}
set_max_delay 20  -from [list [get_ports clk] [get_ports rst_n] [get_ports in_valid_1]          \
[get_ports {in_image[7]}] [get_ports {in_image[6]}] [get_ports {in_image[5]}]  \
[get_ports {in_image[4]}] [get_ports {in_image[3]}] [get_ports {in_image[2]}]  \
[get_ports {in_image[1]}] [get_ports {in_image[0]}] [get_ports in_valid_2]     \
[get_ports {in_mode[1]}] [get_ports {in_mode[0]}] [get_ports cg_en]]  -to [list [get_ports out_valid] [get_ports {out_number[11]}] [get_ports       \
{out_number[10]}] [get_ports {out_number[9]}] [get_ports {out_number[8]}]      \
[get_ports {out_number[7]}] [get_ports {out_number[6]}] [get_ports             \
{out_number[5]}] [get_ports {out_number[4]}] [get_ports {out_number[3]}]       \
[get_ports {out_number[2]}] [get_ports {out_number[1]}] [get_ports             \
{out_number[0]}]]
set_input_delay -clock clk  0  [get_ports clk]
set_input_delay -clock clk  0  [get_ports rst_n]
set_input_delay -clock clk  10  [get_ports in_valid_1]
set_input_delay -clock clk  10  [get_ports {in_image[7]}]
set_input_delay -clock clk  10  [get_ports {in_image[6]}]
set_input_delay -clock clk  10  [get_ports {in_image[5]}]
set_input_delay -clock clk  10  [get_ports {in_image[4]}]
set_input_delay -clock clk  10  [get_ports {in_image[3]}]
set_input_delay -clock clk  10  [get_ports {in_image[2]}]
set_input_delay -clock clk  10  [get_ports {in_image[1]}]
set_input_delay -clock clk  10  [get_ports {in_image[0]}]
set_input_delay -clock clk  10  [get_ports in_valid_2]
set_input_delay -clock clk  10  [get_ports {in_mode[1]}]
set_input_delay -clock clk  10  [get_ports {in_mode[0]}]
set_input_delay -clock clk  0  [get_ports cg_en]
set_output_delay -clock clk  10  [get_ports out_valid]
set_output_delay -clock clk  10  [get_ports {out_number[11]}]
set_output_delay -clock clk  10  [get_ports {out_number[10]}]
set_output_delay -clock clk  10  [get_ports {out_number[9]}]
set_output_delay -clock clk  10  [get_ports {out_number[8]}]
set_output_delay -clock clk  10  [get_ports {out_number[7]}]
set_output_delay -clock clk  10  [get_ports {out_number[6]}]
set_output_delay -clock clk  10  [get_ports {out_number[5]}]
set_output_delay -clock clk  10  [get_ports {out_number[4]}]
set_output_delay -clock clk  10  [get_ports {out_number[3]}]
set_output_delay -clock clk  10  [get_ports {out_number[2]}]
set_output_delay -clock clk  10  [get_ports {out_number[1]}]
set_output_delay -clock clk  10  [get_ports {out_number[0]}]
