`timescale 1ns/10ps
`include "PATTERN.v"
`ifdef RTL
  `include "VIP.v"
`endif
`ifdef GATE
  `include "VIP_SYN.v"
`endif

module TESTBENCH();

parameter inst_sig_width = 23;
parameter inst_exp_width = 8;
parameter inst_ieee_compliance = 0;
parameter inst_arch = 2;

wire in_valid,clk,rst_n,out_valid;
wire [inst_sig_width+inst_exp_width:0] vector_1, vector_2;
wire [inst_sig_width+inst_exp_width:0] out;

initial begin
    `ifdef RTL
		$fsdbDumpfile("VIP.fsdb");
        $fsdbDumpvars(0,"+mda");
    `endif
    `ifdef GATE
        $sdf_annotate("VIP_SYN.sdf",U_VIP);
        $fsdbDumpfile("VIP_SYN.fsdb");
        $fsdbDumpvars(0,"+mda");
    `endif
end

VIP U_VIP(
           .vector_1(vector_1),
		   .vector_2(vector_2),
           .in_valid(in_valid),
           .rst_n(rst_n),
           .clk(clk),
           .out_valid(out_valid),
           .out(out)
		  );

PATTERN U_PATTERN(
           .vector_1(vector_1),
		   .vector_2(vector_2),
           .in_valid(in_valid),
           .rst_n(rst_n),
           .clk(clk),
           .out_valid(out_valid),
           .out(out)
		  );

endmodule
