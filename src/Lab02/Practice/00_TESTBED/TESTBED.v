//############################################################################
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//   (C) Copyright Laboratory System Integration and Silicon Implementation
//   All Right Reserved
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   ICLAB 2018 Fall
//   Lab02 Practice		: Complex Number Calculater
//   Author     		: Ping-Yuan Tsai (bubblegame@si2lab.org)
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   File Name   : TESETBED.v
//   Module Name : TESETBED
//   Release version : V1.0 (Release Date: 2018-09)
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//############################################################################

`timescale 1ns/10ps

`include "PATTERN.v"
`ifdef RTL
  `include "CNC.v"
`endif
`ifdef GATE
  `include "CNC_SYN.v"
`endif
	  		  	
module TESTBED;

wire          clk, rst_n, IN_VALID;
wire  [ 1:0]  MODE;
wire  [ 7:0]  IN;
wire          OUT_VALID;
wire  [16:0]  OUT;


initial begin
  `ifdef RTL
    $fsdbDumpfile("CNC.fsdb");
    $fsdbDumpvars();
  `endif
  `ifdef GATE
    $sdf_annotate("CNC_SYN.sdf", u_CNC);
    $fsdbDumpfile("CNC_SYN.fsdb");
    $fsdbDumpvars();    
  `endif
end

CNC u_CNC(
    .clk(clk),
    .rst_n(rst_n),
    .IN_VALID(IN_VALID),
    .MODE(MODE),
    .IN(IN),
    .OUT_VALID(OUT_VALID),
    .OUT(OUT)
    );
	
PATTERN u_PATTERN(
    .clk(clk),
    .rst_n(rst_n),
    .IN_VALID(IN_VALID),
    .MODE(MODE),
    .IN(IN),
    .OUT_VALID(OUT_VALID),
    .OUT(OUT)
    );
  
 
endmodule
