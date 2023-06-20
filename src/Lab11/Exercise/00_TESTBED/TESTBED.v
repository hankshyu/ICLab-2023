//############################################################################
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//      (C) Copyright NCTU OASIS Lab      
//            All Right Reserved
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   2022 ICLAB fall Course
//   Lab05			: SRAM, Matrix Multiplication with Systolic Array
//   Author         : Jia Fu-Tsao (jiafutsao.ee10g@nctu.edu.tw)
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
`ifdef RTL
    `include "MMSA.v"
`endif

`ifdef GATE
    `include "MMSA_SYN.v"
`endif

`ifdef APR
    `include "CHIP_SYN.v"
`endif

`ifdef POST
    `include "CHIP.v"
`endif
`include "PATTERN.v"

module TESTBED();

wire clk;
wire rst_n;

wire in_valid, in_valid2;
wire matrix;
wire i_mat_idx, w_mat_idx;
wire [1:0] matrix_size;

wire out_valid;
wire out_value;

PATTERN U_PATTERN(
	.clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid),
    .in_valid2(in_valid2), 
    .matrix(matrix),
	.matrix_size(matrix_size),
    .i_mat_idx(i_mat_idx), 
    .w_mat_idx(w_mat_idx),

    .out_valid(out_valid),
    .out_value(out_value)
);

`ifdef RTL
    MMSA U_MMSA(
        .clk(clk),
        .rst_n(rst_n),
        .in_valid(in_valid),
        .in_valid2(in_valid2), 
        .matrix(matrix),
        .matrix_size(matrix_size),
        .i_mat_idx(i_mat_idx), 
        .w_mat_idx(w_mat_idx),

        .out_valid(out_valid),
        .out_value(out_value)
    );
`endif
`ifdef GATE
    MMSA U_MMSA(
        .clk(clk),
        .rst_n(rst_n),
        .in_valid(in_valid),
        .in_valid2(in_valid2), 
        .matrix(matrix),
        .matrix_size(matrix_size),
        .i_mat_idx(i_mat_idx), 
        .w_mat_idx(w_mat_idx),

        .out_valid(out_valid),
        .out_value(out_value)
    );
`endif
`ifdef APR
    CHIP U_CHIP(
        .clk(clk),
        .rst_n(rst_n),
        .in_valid(in_valid),
        .in_valid2(in_valid2), 
        .matrix(matrix),
        .matrix_size(matrix_size),
        .i_mat_idx(i_mat_idx), 
        .w_mat_idx(w_mat_idx),

        .out_valid(out_valid),
        .out_value(out_value)
    );
`endif
`ifdef POST
    CHIP U_CHIP(
        .clk(clk),
        .rst_n(rst_n),
        .in_valid(in_valid),
        .in_valid2(in_valid2), 
        .matrix(matrix),
        .matrix_size(matrix_size),
        .i_mat_idx(i_mat_idx), 
        .w_mat_idx(w_mat_idx),

        .out_valid(out_valid),
        .out_value(out_value)
    );
`endif


initial begin
	`ifdef RTL
		$fsdbDumpfile("MMSA.fsdb");
		$fsdbDumpvars(0,"+mda");
		$fsdbDumpvars();
	`endif
	`ifdef GATE
		$sdf_annotate("MMSA_SYN.sdf", U_MMSA);
		$fsdbDumpfile("MMSA_SYN.fsdb");
		$fsdbDumpvars();
	`endif
    `ifdef APR
		$sdf_annotate("MMSA_SYN.sdf", U_CHIP.CORE);
		// $fsdbDumpfile("CHIP_SYN.fsdb");
		// $fsdbDumpvars(2,"+mda");
	`endif
    `ifdef POST
        $sdf_annotate("CHIP.sdf", U_CHIP);
        // $fsdbDumpfile("CHIP.fsdb");
        // $fsdbDumpvars(2,"+mda");
    `endif
end

endmodule
