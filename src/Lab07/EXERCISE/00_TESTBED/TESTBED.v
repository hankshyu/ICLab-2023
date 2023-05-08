`timescale 1ns/1ps

`include "PATTERN.v"
`ifdef RTL
  `include "CDC.v"
`endif
`ifdef GATE
  `include "CDC_SYN.v"
`endif 
	  		  	
module TESTBED;

parameter DSIZE = 8; // word size - 8 bit
parameter ASIZE = 4; // address size - 4 bit

wire		clk1, clk2, in_valid, out_valid, ready, rst_n;


wire [4:0]doraemon_id;
wire [7:0]size;
wire [7:0]iq_score;
wire [7:0]eq_score;
wire [7:0]out;
wire [2:0]size_weight,iq_weight,eq_weight;


initial begin
  `ifdef RTL
    $fsdbDumpfile("CDC.fsdb");
	$fsdbDumpvars(0,"+mda");
  `endif
  `ifdef GATE
    $sdf_annotate("CDC_SYN_pt.sdf", u_CDC,,,"maximum");
    $fsdbDumpfile("CDC_SYN.fsdb");
	$fsdbDumpvars(0,"+mda"); 
  `endif
end


CDC u_CDC(
    .clk1(clk1),
    .clk2(clk2),
    .in_valid(in_valid),
    .rst_n(rst_n),
    .ready(ready),
    .out_valid(out_valid),
    .doraemon_id(doraemon_id),
    .size(size),
    .iq_score(iq_score),
    .eq_score(eq_score),
    .out(out),
    .size_weight(size_weight),
	  .iq_weight(iq_weight),
	  .eq_weight(eq_weight)
      );
	
PATTERN u_PATTERN(
    .clk1(clk1),
    .clk2(clk2),
    .in_valid(in_valid),
    .rst_n(rst_n),
    .ready(ready),
    .out_valid(out_valid),
    .doraemon_id(doraemon_id),
    .size(size),
    .iq_score(iq_score),
    .eq_score(eq_score),
    .out(out),
    .size_weight(size_weight),
	  .iq_weight(iq_weight),
	  .eq_weight(eq_weight)
    );
  
endmodule
