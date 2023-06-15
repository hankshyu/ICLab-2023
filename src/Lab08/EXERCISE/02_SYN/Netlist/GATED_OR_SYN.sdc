###################################################################

# Created by write_sdc on Sun Apr 23 20:49:47 2023

###################################################################
set sdc_version 2.1

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_load -pin_load 0.05 [get_ports CLOCK_GATED]
set_max_delay 15  -from [list [get_ports CLOCK] [get_ports SLEEP_CTRL] [get_ports RST_N]]  -to [get_ports CLOCK_GATED]
