//############################################################################
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//   (C) Copyright Optimum Application-Specific Integrated System Laboratory
//   All Right Reserved
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   ICLAB 2023 Spring
//   Lab09  : Online Shopping Platform Simulation
//   Author : Zhi-Ting Dong (yjdzt918.ee11@nycu.edu.tw)
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   File Name   : TESTBED_bak.sv
//   Module Name : TESTBED
//   Release version : V1.0 (Release Date: 2023-04)
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//############################################################################
`timescale 1ns/1ps

`include "Usertype_OS.sv"
`include "INF.sv"
`include "PATTERN.sv"
`include "PATTERN_bridge.sv"
`include "PATTERN_OS.sv"
`include "../00_TESTBED/pseudo_DRAM.sv"

`ifdef RTL
  `include "bridge.sv"
  `include "OS.sv"
  `define CYCLE_TIME 4.5
`endif

`ifdef GATE
  `include "bridge_SYN.v"
  `include "bridge_Wrapper.sv"
  `include "OS_SYN.v"
  `include "OS_Wrapper.sv"
  `define CYCLE_TIME 4.5
`endif

module TESTBED;
  
parameter simulation_cycle = `CYCLE_TIME;
reg  SystemClock;

INF             inf();
PATTERN         test_p(.clk(SystemClock), .inf(inf.PATTERN));
PATTERN_bridge  test_pb(.clk(SystemClock), .inf(inf.PATTERN_bridge));
PATTERN_OS      test_pp(.clk(SystemClock), .inf(inf.PATTERN_OS));
pseudo_DRAM     dram_r(.clk(SystemClock), .inf(inf.DRAM)); 

`ifdef RTL
bridge  dut_b(.clk(SystemClock), .inf(inf.bridge_inf) );
OS      dut_p(.clk(SystemClock), .inf(inf.OS_inf) );
`endif

`ifdef GATE
bridge_svsim  dut_b(.clk(SystemClock), .inf(inf.bridge_inf) );
OS_svsim      dut_p(.clk(SystemClock), .inf(inf.OS_inf) );
`endif  
//------ Generate Clock ------------
initial begin
  SystemClock = 0;
  #30
  forever begin
    #(simulation_cycle/2.0)
    SystemClock = ~SystemClock;
  end
end
  
//------ Dump FSDB File ------------  
initial begin
  `ifdef RTL
    // $fsdbDumpfile("OSB.fsdb");
    // $fsdbDumpvars(0,"+all");
    // $fsdbDumpSVA;
  `elsif GATE
    //$fsdbDumpfile("OS_SYN.fsdb");
    $sdf_annotate("bridge_SYN.sdf",dut_b.bridge);      
    $sdf_annotate("OS_SYN.sdf",dut_p.OS);      
    //$fsdbDumpvars(0,"+all");
  `endif
end

endmodule