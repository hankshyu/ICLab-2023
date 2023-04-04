`timescale 1ns/1ps
`include "PATTERN.v"
`ifdef RTL
`include "QS.v"
`elsif GATE
`include "QS_SYN.v"
`endif

module TESTBED();

//Connection wires
wire			clk,rst_n,in_valid;
wire	[7:0]	in_data;
wire		action;

wire		out_valid;
wire	[7:0]out_data;

initial begin
  `ifdef RTL
    $fsdbDumpfile("QS.fsdb");
        $fsdbDumpvars(0,"+mda");
    $fsdbDumpvars();
  `endif
  `ifdef GATE
    $sdf_annotate("QS_SYN.sdf",My_QS);
    $fsdbDumpfile("QS_SYN.fsdb");
        $fsdbDumpvars(0,"+mda");
    $fsdbDumpvars();
  `endif
end

QS My_QS(
        // input signals
		clk,
		rst_n,
		in_valid,
		in_data,
		action,
        // output signals
		out_valid,
		out_data
);

PATTERN My_PATTERN(
        // input signals
		clk,
		rst_n,
		in_valid,
		in_data,
		action,
        // output signals
		out_valid,
		out_data
);

endmodule
