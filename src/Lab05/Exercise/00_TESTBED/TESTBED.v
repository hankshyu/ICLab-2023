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

`include "PATTERN.v"

module TESTBED();

wire clk;
wire rst_n;

wire in_valid, in_valid2;
wire [7:0] matrix;
wire [1:0]  matrix_size,mode;
wire [4:0]  matrix_idx;

wire out_valid;
wire [49:0] out_value;


MMT U_MMT(
	.clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid),
    .in_valid2(in_valid2), 
    .matrix(matrix),
	.matrix_size(matrix_size),
    .matrix_idx(matrix_idx), 
    .mode(mode),

    .out_valid(out_valid),
    .out_value(out_value)
);

PATTERN U_PATTERN(
	.clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid),
    .in_valid2(in_valid2), 
    .matrix(matrix),
	.matrix_size(matrix_size),
    .matrix_idx(matrix_idx), 
    .mode(mode),

    .out_valid(out_valid),
    .out_value(out_value)
);

initial begin
	`ifdef RTL
		$fsdbDumpfile("MMT.fsdb");
		$fsdbDumpvars(0,"+mda");
		$fsdbDumpvars();
	`endif
	`ifdef GATE
		$sdf_annotate("MMT_SYN.sdf",U_MMT);
		//$fsdbDumpfile("MMT_SYN.fsdb");
		//$fsdbDumpvars();
	`endif
end

endmodule
