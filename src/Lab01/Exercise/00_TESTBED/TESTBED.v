//############################################################################
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//   (C) Copyright Laboratory System Integration and Silicon Implementation
//   All Right Reserved
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   ICLAB 2023 Spring
//   Lab01-Practice		: Chinese Course
//   Author     		: Yi-Hsuan, Chang (vvera.ee11@nycu.edu.tw)
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   File Name   : TESETBED.v
//   Module Name : TESETBED
//   Release version : V1.0 (Release Date: 2023-02)
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//############################################################################

`timescale 1ns/10ps
`include "PATTERN.v"
`ifdef RTL
  `include "CC.v"
`endif
`ifdef GATE
  `include "CC_SYN.v"
`endif
	  		  	
module TESTBED; 

//Connection wires
wire [3:0] in_s0, in_s1, in_s2, in_s3, in_s4, in_s5, in_s6;
wire [2:0] opt;
wire [1:0] a;
wire [2:0] b;
wire [2:0] s_id0;
wire [2:0] s_id1;
wire [2:0] s_id2;
wire [2:0] s_id3;
wire [2:0] s_id4;
wire [2:0] s_id5;
wire [2:0] s_id6;
wire [2:0] out;

initial begin
  `ifdef RTL
    $fsdbDumpfile("CC.fsdb");
	$fsdbDumpvars(0,"+mda");
    $fsdbDumpvars();
  `endif
  `ifdef GATE
    $sdf_annotate("CC_SYN.sdf", My_CC);
    $fsdbDumpfile("CC_SYN.fsdb");
	  $fsdbDumpvars(0,"+mda");
    $fsdbDumpvars();    
  `endif
end

CC My_CC(
.in_s0(in_s0),
.in_s1(in_s1),
.in_s2(in_s2),
.in_s3(in_s3),
.in_s4(in_s4),
.in_s5(in_s5),
.in_s6(in_s6),
.opt(opt),
.a(a),
.b(b),
.s_id0(s_id0),
.s_id1(s_id1),
.s_id2(s_id2),
.s_id3(s_id3),
.s_id4(s_id4),
.s_id5(s_id5),
.s_id6(s_id6),
.out(out)
);

PATTERN My_PATTERN(
.in_s0(in_s0),
.in_s1(in_s1),
.in_s2(in_s2),
.in_s3(in_s3),
.in_s4(in_s4),
.in_s5(in_s5),
.in_s6(in_s6),
.opt(opt),
.a(a),
.b(b),
.s_id0(s_id0),
.s_id1(s_id1),
.s_id2(s_id2),
.s_id3(s_id3),
.s_id4(s_id4),
.s_id5(s_id5),
.s_id6(s_id6),
.out(out)
);
  
 
endmodule
