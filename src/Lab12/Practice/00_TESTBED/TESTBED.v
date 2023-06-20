`timescale 1ns/10ps
`include "PATTERN.v"

`ifdef RTL
    `include "FFT2D.v"
`elsif GATE
    `include "FFT2D_SYN.v"
`elsif CHIP
    `include "CHIP_SYN.v"
`elsif POST
    `include "CHIP.v"
`endif
	  		  	
module TESTBED;

wire        clk, rst_n, IN_VALID, MODE;
wire [18:0] FFT2D_IN_R, FFT2D_IN_I;

wire        OUT_VALID;
wire [18:0] FFT2D_OUT_R, FFT2D_OUT_I;


initial begin
  `ifdef RTL
    $fsdbDumpfile("FFT2D.fsdb");
    $fsdbDumpvars(0,"+mda");
  `elsif GATE
    $sdf_annotate("FFT2D_SYN.sdf",u_FFT2D);
    //$fsdbDumpfile("FFT2D_SYN.fsdb");
    //$fsdbDumpvars(0,"+mda");
  `elsif CHIP
    $fsdbDumpfile("CHIP_SYN.fsdb");
    $fsdbDumpvars(0,"+mda");
  `elsif POST
    $sdf_annotate("CHIP.sdf",u_CHIP);
    $fsdbDumpfile("CHIP_POST.fsdb");
    $fsdbDumpvars(0,"+mda");
  `endif
end

`ifdef RTL
     FFT2D u_FFT2D(
    .clk(clk),
    .rst_n(rst_n),
    .IN_VALID(IN_VALID),
    .MODE(MODE),
    .FFT2D_IN_R(FFT2D_IN_R),
    .FFT2D_IN_I(FFT2D_IN_I),
    .OUT_VALID(OUT_VALID),
    .FFT2D_OUT_R(FFT2D_OUT_R),
    .FFT2D_OUT_I(FFT2D_OUT_I)
    );
`elsif GATE
     FFT2D u_FFT2D(
    .clk(clk),
    .rst_n(rst_n),
    .IN_VALID(IN_VALID),
    .MODE(MODE),
    .FFT2D_IN_R(FFT2D_IN_R),
    .FFT2D_IN_I(FFT2D_IN_I),
    .OUT_VALID(OUT_VALID),
    .FFT2D_OUT_R(FFT2D_OUT_R),
    .FFT2D_OUT_I(FFT2D_OUT_I)
    );
`elsif CHIP
    CHIP u_CHIP(
    .clk(clk),
    .rst_n(rst_n),
    .IN_VALID(IN_VALID),
    .MODE(MODE),
    .FFT2D_IN_R(FFT2D_IN_R),
    .FFT2D_IN_I(FFT2D_IN_I),
    .OUT_VALID(OUT_VALID),
    .FFT2D_OUT_R(FFT2D_OUT_R),
    .FFT2D_OUT_I(FFT2D_OUT_I)
    );
`elsif POST
    CHIP u_CHIP(
    .clk(clk),
    .rst_n(rst_n),
    .IN_VALID(IN_VALID),
    .MODE(MODE),
    .FFT2D_IN_R(FFT2D_IN_R),
    .FFT2D_IN_I(FFT2D_IN_I),
    .OUT_VALID(OUT_VALID),
    .FFT2D_OUT_R(FFT2D_OUT_R),
    .FFT2D_OUT_I(FFT2D_OUT_I)
    );
`endif
	
PATTERN u_PATTERN(
    .clk(clk),
    .rst_n(rst_n),
    .IN_VALID(IN_VALID),
    .MODE(MODE),
    .FFT2D_IN_R(FFT2D_IN_R),
    .FFT2D_IN_I(FFT2D_IN_I),
    .OUT_VALID(OUT_VALID),
    .FFT2D_OUT_R(FFT2D_OUT_R),
    .FFT2D_OUT_I(FFT2D_OUT_I)
    );
 
 
endmodule
