`timescale 1ns/1ps
`include "PATTERN.v"

`ifdef RTL
  `include "TRIANGLE.v"
`endif
`ifdef GATE
  `include "TRIANGLE_SYN.v"
`endif
	  		  	
module TESTBED;

wire            clk, rst_n, in_valid;
wire    [7:0]  in_length;

wire            out_valid;
wire    [15:0]  out_cos;
wire	[1:0]	out_tri;


initial begin
  `ifdef RTL
    $fsdbDumpfile("TRIANGLE.fsdb");
    $fsdbDumpvars(0,"+mda");
  `endif
  `ifdef GATE
    $sdf_annotate("TRIANGLE_SYN.sdf", u_TRIANGLE);
    //$fsdbDumpfile("TRIANGLE_SYN.fsdb");
    //$fsdbDumpvars(0,"+mda");    
  `endif
end

TRIANGLE u_TRIANGLE(
    .clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid),
    .in_length(in_length),
    .out_cos(out_cos),
    .out_tri(out_tri),
    .out_valid(out_valid)
);

PATTERN u_PATTERN(
    .clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid),
    .in_length(in_length),
    .out_cos(out_cos),
    .out_tri(out_tri),
    .out_valid(out_valid)
);
  
 
endmodule
