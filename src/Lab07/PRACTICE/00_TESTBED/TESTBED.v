`timescale 1ns/1ps
`include "PATTERN.v"

`ifdef RTL
`include "CONV.v"
`include "syn_XOR.v"
`include "synchronizer.v"
`elsif GATE
`include "CONV_SYN.v"
`endif

module TESTBED();


wire clk_1,clk_2;
wire rst_n;
wire in_valid;
wire [2:0] in_data1;
wire [2:0] in_data2;

wire out_valid;
wire[7:0] out_data;

initial begin
  `ifdef RTL
    $fsdbDumpfile("CONV.fsdb");
	//   $fsdbDumpvars();
	  $fsdbDumpvars(0,"+mda");
  `elsif GATE
    $fsdbDumpfile("CONV_SYN.fsdb");
	  $sdf_annotate("CONV_SYN_pt.sdf",I_CONV,,,"maximum");      
	  $fsdbDumpvars(0,"+mda");
	//   $fsdbDumpvars();
  `endif
end

CONV I_CONV
(
	.clk_1(clk_1),
	.clk_2(clk_2),
	.rst_n(rst_n),
	.in_valid(in_valid),
	.in_data1(in_data1),
	.in_data2(in_data2),
	.out_valid(out_valid),
	.out_data(out_data)
);


PATTERN I_PATTERN
(
	.clk_1(clk_1),
	.clk_2(clk_2),
	.rst_n(rst_n),
	.in_valid(in_valid),
	.in_data1(in_data1),
	.in_data2(in_data2),
	.out_valid(out_valid),
	.out_data(out_data)
);

endmodule
