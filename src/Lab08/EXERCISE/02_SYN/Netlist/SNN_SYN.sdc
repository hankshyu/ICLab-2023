###################################################################

# Created by write_sdc on Sun Apr 23 20:51:34 2023

###################################################################
set sdc_version 2.1

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_load -pin_load 0.05 [get_ports out_valid]
set_load -pin_load 0.05 [get_ports {out_data[9]}]
set_load -pin_load 0.05 [get_ports {out_data[8]}]
set_load -pin_load 0.05 [get_ports {out_data[7]}]
set_load -pin_load 0.05 [get_ports {out_data[6]}]
set_load -pin_load 0.05 [get_ports {out_data[5]}]
set_load -pin_load 0.05 [get_ports {out_data[4]}]
set_load -pin_load 0.05 [get_ports {out_data[3]}]
set_load -pin_load 0.05 [get_ports {out_data[2]}]
set_load -pin_load 0.05 [get_ports {out_data[1]}]
set_load -pin_load 0.05 [get_ports {out_data[0]}]
create_clock [get_ports clk]  -period 15  -waveform {0 7.5}
set_max_delay 15  -from [list [get_ports clk] [get_ports rst_n] [get_ports cg_en] [get_ports    \
in_valid] [get_ports {img[7]}] [get_ports {img[6]}] [get_ports {img[5]}]       \
[get_ports {img[4]}] [get_ports {img[3]}] [get_ports {img[2]}] [get_ports      \
{img[1]}] [get_ports {img[0]}] [get_ports {ker[7]}] [get_ports {ker[6]}]       \
[get_ports {ker[5]}] [get_ports {ker[4]}] [get_ports {ker[3]}] [get_ports      \
{ker[2]}] [get_ports {ker[1]}] [get_ports {ker[0]}] [get_ports {weight[7]}]    \
[get_ports {weight[6]}] [get_ports {weight[5]}] [get_ports {weight[4]}]        \
[get_ports {weight[3]}] [get_ports {weight[2]}] [get_ports {weight[1]}]        \
[get_ports {weight[0]}]]  -to [list [get_ports out_valid] [get_ports {out_data[9]}] [get_ports          \
{out_data[8]}] [get_ports {out_data[7]}] [get_ports {out_data[6]}] [get_ports  \
{out_data[5]}] [get_ports {out_data[4]}] [get_ports {out_data[3]}] [get_ports  \
{out_data[2]}] [get_ports {out_data[1]}] [get_ports {out_data[0]}]]
set_false_path   -from [get_clocks clk]  -to [list [get_cells instgor9/latch_or_sleep_reg] [get_cells                  \
instgor8/latch_or_sleep_reg] [get_cells instgor7/latch_or_sleep_reg]           \
[get_cells instgor6/latch_or_sleep_reg] [get_cells                             \
instgor5/latch_or_sleep_reg] [get_cells instgor4/latch_or_sleep_reg]           \
[get_cells instgor3/latch_or_sleep_reg] [get_cells                             \
instgor2/latch_or_sleep_reg] [get_cells instgor0/latch_or_sleep_reg]           \
[get_cells GATED_imgshreg/latch_or_sleep_reg]]
set_input_delay -clock clk  0  [get_ports clk]
set_input_delay -clock clk  0  [get_ports rst_n]
set_input_delay -clock clk  0  [get_ports cg_en]
set_input_delay -clock clk  7.5  [get_ports in_valid]
set_input_delay -clock clk  7.5  [get_ports {img[7]}]
set_input_delay -clock clk  7.5  [get_ports {img[6]}]
set_input_delay -clock clk  7.5  [get_ports {img[5]}]
set_input_delay -clock clk  7.5  [get_ports {img[4]}]
set_input_delay -clock clk  7.5  [get_ports {img[3]}]
set_input_delay -clock clk  7.5  [get_ports {img[2]}]
set_input_delay -clock clk  7.5  [get_ports {img[1]}]
set_input_delay -clock clk  7.5  [get_ports {img[0]}]
set_input_delay -clock clk  7.5  [get_ports {ker[7]}]
set_input_delay -clock clk  7.5  [get_ports {ker[6]}]
set_input_delay -clock clk  7.5  [get_ports {ker[5]}]
set_input_delay -clock clk  7.5  [get_ports {ker[4]}]
set_input_delay -clock clk  7.5  [get_ports {ker[3]}]
set_input_delay -clock clk  7.5  [get_ports {ker[2]}]
set_input_delay -clock clk  7.5  [get_ports {ker[1]}]
set_input_delay -clock clk  7.5  [get_ports {ker[0]}]
set_input_delay -clock clk  7.5  [get_ports {weight[7]}]
set_input_delay -clock clk  7.5  [get_ports {weight[6]}]
set_input_delay -clock clk  7.5  [get_ports {weight[5]}]
set_input_delay -clock clk  7.5  [get_ports {weight[4]}]
set_input_delay -clock clk  7.5  [get_ports {weight[3]}]
set_input_delay -clock clk  7.5  [get_ports {weight[2]}]
set_input_delay -clock clk  7.5  [get_ports {weight[1]}]
set_input_delay -clock clk  7.5  [get_ports {weight[0]}]
set_output_delay -clock clk  7.5  [get_ports out_valid]
set_output_delay -clock clk  7.5  [get_ports {out_data[9]}]
set_output_delay -clock clk  7.5  [get_ports {out_data[8]}]
set_output_delay -clock clk  7.5  [get_ports {out_data[7]}]
set_output_delay -clock clk  7.5  [get_ports {out_data[6]}]
set_output_delay -clock clk  7.5  [get_ports {out_data[5]}]
set_output_delay -clock clk  7.5  [get_ports {out_data[4]}]
set_output_delay -clock clk  7.5  [get_ports {out_data[3]}]
set_output_delay -clock clk  7.5  [get_ports {out_data[2]}]
set_output_delay -clock clk  7.5  [get_ports {out_data[1]}]
set_output_delay -clock clk  7.5  [get_ports {out_data[0]}]
