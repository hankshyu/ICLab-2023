00_TESTBED

PATTERN.sv and TESTBED.sv are for whole design verification.

There are 2 more patterns: PATTERN_OS.sv and PATTERN_bridge.sv. There are also 2 ways to use these patterns.

1. PATTERN_OS.sv and PATTERN_bridge.sv can be used to verify the signals between OS and bridge, and signals between bridge and DRAM.
2. PATTERN_OS.sv can be used to verify OS.sv solely. PATTERN_bridge.sv can be used to verify bridge.sv solely. 

The first way will be used by TA during demo. If you want to use it in second way, you have to modify the modport in INF.sv

=========================================

01_RTL

./01_run         : To run the whole design.
./01_run_OS      : If you use PATTERN_OS.sv in second way, you can use this command.
./01_run_bridge  : If you use PATTERN_bridge.sv in second way, you can use this command.

=========================================

02_SYN

./01_run_dc_OS      : Systhesis OS.sv
./01_run_dc_bridge  : Systhesis bridge.sv
