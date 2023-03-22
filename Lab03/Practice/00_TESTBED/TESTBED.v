//############################################################################
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//   (C) Copyright Laboratory System Integration and Silicon Implementation
//   All Right Reserved
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   2018 ICLAB fall Course
//   Lab03	    : Vector Reverse Ordering
//   Author         : Yi Syuan Chen
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   File Name   : TESTBED.v
//   Module Name : TESTBED
//   Release version : v1.0
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//############################################################################

`timescale 1ns/10ps

`include "PATTERN.v"
`ifdef RTL
  `include "VRO.v"
`endif
`ifdef GATE
  `include "VRO_SYN.v"
`endif
	  		  	
module TESTBED;

wire          clk, rst_n, in_valid;
wire  [2:0]  in;
wire          out_valid;
wire  [2:0]  out;


initial begin
  `ifdef RTL
    $fsdbDumpfile("VRO.fsdb");
    $fsdbDumpvars(0,"+mda");
  `endif
  `ifdef GATE
    $sdf_annotate("VRO_SYN.sdf", u_VRO);
    $fsdbDumpfile("VRO_SYN.fsdb");
    $fsdbDumpvars(0,"+mda");        
  `endif
end

VRO u_VRO(
    .clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid),
    .in(in),
    .out_valid(out_valid),
    .out(out)
    );
	
PATTERN u_PATTERN(
    .clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid),
    .in(in),
    .out_valid(out_valid),
    .out(out)
    );
  
 
endmodule
