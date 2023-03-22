`timescale 1ns/1ps
`include "PATTERN.v"
`ifdef RTL
`include "NN.v"
`elsif GATE
`include "NN_SYN.v"
`endif

module TESTBED();
	parameter inst_sig_width = 23;
	parameter inst_exp_width = 8;
	parameter inst_ieee_compliance = 0;
	parameter inst_arch = 2;
	
	wire clk, rst_n, in_valid;
	wire [inst_sig_width+inst_exp_width:0] data_x;
	wire [inst_sig_width+inst_exp_width:0] data_h;
	wire [inst_sig_width+inst_exp_width:0] weight_u, weight_w, weight_v;
	wire out_valid;
	wire [inst_sig_width+inst_exp_width:0]out;	

initial begin
	`ifdef RTL
		$fsdbDumpfile("NN.fsdb");
		$fsdbDumpvars(0,"+mda");
	`elsif GATE
		$fsdbDumpfile("NN_SYN.fsdb");
		$sdf_annotate("NN_SYN.sdf",I_NN);      
		$fsdbDumpvars(0,"+mda");
	`endif
end

NN I_NN
(
	// Input signals
	.clk(clk),
	.rst_n(rst_n),
	.in_valid(in_valid),
	.data_x(data_x),
	.data_h(data_h),
	.weight_u(weight_u),
	.weight_v(weight_v),
	.weight_w(weight_w),
	// Output signals
	.out_valid(out_valid),
	.out(out)
);


PATTERN I_PATTERN
(
	// Input signals
	.clk(clk),
	.rst_n(rst_n),
	.in_valid(in_valid),
	.data_x(data_x),
	.data_h(data_h),
	.weight_u(weight_u),
	.weight_v(weight_v),
	.weight_w(weight_w),
	// Output signals
	.out_valid(out_valid),
	.out(out)
);

endmodule
