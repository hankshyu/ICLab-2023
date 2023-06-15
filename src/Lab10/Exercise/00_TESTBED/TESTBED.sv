//############################################################################
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//   (C) Copyright Optimum Application-Specific Integrated System Laboratory
//   All Right Reserved
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   ICLAB 2023 Spring
//   Lab10  : Online Shopping Platform Simulation
//   
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   File Name   : TESTBED.sv
//   Module Name : TESTBED
//   Release version : V1.0 (Release Date: 2023-04)
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//############################################################################
`timescale 1ns/1ps

`include "Usertype_OS.sv"
`include "INF.sv"
`include "PATTERN.sv"
// `include "PATTERN_bridge.sv"
// `include "PATTERN_OS.sv"
`include "../00_TESTBED/pseudo_DRAM.sv"
`include "CHECKER.sv"


`ifdef RTL
  `include "bridge.sv"
  `include "OS.sv"
  `define CYCLE_TIME 10.0
`endif

module TESTBED;
  
parameter simulation_cycle = `CYCLE_TIME;
reg  SystemClock;

INF             inf();
PATTERN         test_p(.clk(SystemClock), .inf(inf.PATTERN));
pseudo_DRAM     dram_r(.clk(SystemClock), .inf(inf.DRAM)); 
Checker 		  check_inst (.clk(SystemClock), .inf(inf.CHECKER));
`ifdef RTL
bridge  dut_b(.clk(SystemClock), .inf(inf.bridge_inf) );
OS      dut_p(.clk(SystemClock), .inf(inf.OS_inf) );
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
    $fsdbDumpfile("OSB.fsdb");
    $fsdbDumpvars(0,"+all");
    $fsdbDumpSVA;
  `endif
end



endmodule