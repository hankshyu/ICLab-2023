/**************************************************************************/
// Copyright (c) 2023, OASIS Lab
// MODULE: TESTBED
// FILE NAME: TESTBED.v
// VERSRION: 1.0
// DATE: Feb 8, 2023
// AUTHOR: Kuan-Wei Chen, NYCU IEE
// CODE TYPE: RTL or Behavioral Level (Verilog)
// DESCRIPTION: 2023 Spring IC Lab / Exersise Lab03 / SUBWAY
// MODIFICATION HISTORY:
// Date                 Description
// 
/**************************************************************************/
`timescale 1ns/10ps

`include "PATTERN.v"
`ifdef RTL
    `include "SUBWAY.v"
`endif
`ifdef GATE
    `include "SUBWAY_SYN.v"
`endif

module TESTBED;

wire         clk, rst_n, in_valid;
wire  [1:0]  init;
wire  [1:0]  in0, in1, in2, in3;
wire         out_valid;
wire  [1:0]  out;

initial begin
    `ifdef RTL
        $fsdbDumpfile("SUBWAY.fsdb");
        $fsdbDumpvars(0,"+mda");
    `endif
    `ifdef GATE
        $sdf_annotate("SUBWAY_SYN.sdf", u_SUBWAY);
        $fsdbDumpfile("SUBWAY_SYN.fsdb");
        $fsdbDumpvars(0,"+mda"); 
    `endif
end

SUBWAY u_SUBWAY(
    .clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid),
    .init(init),
    .in0(in0),
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .out_valid(out_valid),
    .out(out)
);
    
PATTERN u_PATTERN(
    .clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid),
    .init(init),
    .in0(in0),
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .out_valid(out_valid),
    .out(out)
);

endmodule
