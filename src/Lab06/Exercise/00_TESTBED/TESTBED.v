//############################################################################
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//   (C) Copyright Optimum Application-Specific Integrated System Laboratory
//   All Right Reserved
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   ICLAB 2023 Spring
//   Lab06-Exercise		: Elliptic Curve Group Operation
//   Author     	    : Zhi-Ting Dong (yjdzt918.ee11@nycu.edu.tw)
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   File Name   : TESETBED.v
//   Module Name : TESETBED
//   Release version : V1.0 (Release Date: 2023-03)
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//############################################################################

`timescale 1ns/1ps 

`ifdef RTL_TOP
  `include "EC_TOP.v"
  `include "PATTERN.v"
`endif

`ifdef GATE_TOP
  `include "EC_TOP_SYN.v"
  `include "PATTERN.v"
`endif
	  		  	
module TESTBED; 

//Connection wires
wire clk, rst_n;
wire in_valid, out_valid;
wire [6-1:0] in_Px, in_Py, in_Qx, in_Qy, in_prime, in_a, out_Rx, out_Ry;

initial begin
	`ifdef RTL_TOP
		$fsdbDumpfile("EC_TOP.fsdb");
		$fsdbDumpvars(0,"+mda");   
	`endif

	`ifdef GATE_TOP
		$sdf_annotate("EC_TOP_SYN.sdf", My_DESIGN);
		$fsdbDumpfile("EC_TOP_SYN.fsdb");
		$fsdbDumpvars(0,"+mda");    
	`endif
end

`ifdef RTL_TOP
	EC_TOP My_DESIGN(
		.clk(clk),
		.rst_n(rst_n),
		.in_valid(in_valid),
		.in_Px(in_Px),
		.in_Py(in_Py),
		.in_Qx(in_Qx),
		.in_Qy(in_Qy),
    .in_prime(in_prime),
    .in_a(in_a),
		.out_valid(out_valid),
		.out_Rx(out_Rx),
    .out_Ry(out_Ry)
	);


	PATTERN My_PATTERN(
		.clk(clk),
		.rst_n(rst_n),
		.in_valid(in_valid),
		.in_Px(in_Px),
		.in_Py(in_Py),
		.in_Qx(in_Qx),
		.in_Qy(in_Qy),
    .in_prime(in_prime),
    .in_a(in_a),
		.out_valid(out_valid),
		.out_Rx(out_Rx),
    .out_Ry(out_Ry)
	);

`elsif GATE_TOP
	EC_TOP My_DESIGN(
		.clk(clk),
		.rst_n(rst_n),
		.in_valid(in_valid),
		.in_Px(in_Px),
		.in_Py(in_Py),
		.in_Qx(in_Qx),
		.in_Qy(in_Qy),
    .in_prime(in_prime),
    .in_a(in_a),
		.out_valid(out_valid),
		.out_Rx(out_Rx),
    .out_Ry(out_Ry)
	);
	
	PATTERN My_PATTERN(
		.clk(clk),
		.rst_n(rst_n),
		.in_valid(in_valid),
		.in_Px(in_Px),
		.in_Py(in_Py),
		.in_Qx(in_Qx),
		.in_Qy(in_Qy),
    .in_prime(in_prime),
    .in_a(in_a),
		.out_valid(out_valid),
		.out_Rx(out_Rx),
    .out_Ry(out_Ry)
	);
`endif  

 
endmodule