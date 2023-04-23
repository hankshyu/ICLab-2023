`timescale 1ns/1ps

`ifdef RTL
`include "IP.v"

`elsif GATE
`include "IP_SYN.v"

`endif

`include "PATTERN.v"

module TESTBED();
	wire clk, rst_n, in_valid_1, in_valid_2, cg_en;
	wire [7:0] in_image;
	wire [1:0] in_mode;
	wire out_valid;
	wire signed	[11:0] out_number;	

	
initial begin
	`ifdef RTL
		$fsdbDumpfile("IP.fsdb");
		$fsdbDumpvars();
		$fsdbDumpvars(0,"+mda");
	`elsif GATE
		$fsdbDumpfile("IP_SYN.fsdb");
		$sdf_annotate("IP_SYN.sdf",I_IP);      
		//$fsdbDumpvars(0,"+mda");
		$fsdbDumpvars();
	`endif
end

IP I_IP
(
	// Input signals
	.clk(clk),
	.rst_n(rst_n),
	.in_valid_1(in_valid_1),
	.in_image(in_image),
	.in_valid_2(in_valid_2),
	.in_mode(in_mode),
	.cg_en(cg_en),
	// Output signals
	.out_valid(out_valid),
	.out_number(out_number)
);


PATTERN I_PATTERN
(
	// Output signals
	.clk(clk),
	.rst_n(rst_n),
	.in_valid_1(in_valid_1),
	.in_image(in_image),
	.in_valid_2(in_valid_2),
	.in_mode(in_mode),
	.cg_en(cg_en),
	// Input signals
	.out_valid(out_valid),
	.out_number(out_number)
);

endmodule
