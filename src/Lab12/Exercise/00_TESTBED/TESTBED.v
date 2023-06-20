`timescale 1ns/1ps

`include "PATTERN.v"
`ifdef RTL
  `include "QUEEN.v"
`elsif GATE
  `include "QUEEN_SYN.v"
`elsif CHIP
  `include "CHIP_SYN.v"
`elsif POST
  `include "CHIP.v"
`endif
	  		  	
module TESTBED;

wire         clk, rst_n, in_valid,in_valid_num;
wire  [3:0]  col,row;
wire  [2:0]  in_num;

wire         out_valid;
wire  [3:0]  out;


initial begin
  `ifdef RTL
    //$fsdbDumpfile("QUEEN.fsdb");
	  //$fsdbDumpvars(0,"+mda");
    //$fsdbDumpvars();
  `elsif GATE
    $sdf_annotate("QUEEN_SYN.sdf", u_QUEEN);
    //$fsdbDumpfile("QUEEN_SYN.fsdb");
	  //$fsdbDumpvars(0,"+mda");
    //$fsdbDumpvars();    
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
    QUEEN u_QUEEN(
    .clk            (   clk          ),
    .rst_n          (   rst_n        ),
    .in_valid       (   in_valid     ),
    .in_valid_num   (   in_valid_num ),

    .in_num         (   in_num       ),
    .col            (   col         ),
    .row            (   row         ),

    .out_valid      (   out_valid    ),
    .out            (   out          )
   );
`elsif GATE
    QUEEN u_QUEEN(
    .clk            (   clk          ),
    .rst_n          (   rst_n        ),
    .in_valid       (   in_valid     ),
    .in_valid_num   (   in_valid_num ),

    .in_num         (   in_num       ),
    .col            (   col         ),
    .row            (   row         ),

    .out_valid      (   out_valid    ),
    .out            (   out          )
   );
`elsif CHIP
    CHIP u_CHIP(
    .clk            (   clk          ),
    .rst_n          (   rst_n        ),
    .in_valid       (   in_valid     ),
    .in_valid_num   (   in_valid_num ),

    .in_num         (   in_num       ),
    .col            (   col         ),
    .row            (   row         ),

    .out_valid      (   out_valid    ),
    .out            (   out          )
    );
`elsif POST
    CHIP u_CHIP(
    .clk            (   clk          ),
    .rst_n          (   rst_n        ),
    .in_valid       (   in_valid     ),
    .in_valid_num   (   in_valid_num ),

    .in_num         (   in_num       ),
    .col            (   col         ),
    .row            (   row         ),

    .out_valid      (   out_valid    ),
    .out            (   out          )
    );
`endif


	
PATTERN u_PATTERN(
    .clk            (   clk          ),
    .rst_n          (   rst_n        ),
    .in_valid       (   in_valid     ),
    .in_valid_num   (   in_valid_num ),

    .in_num         (   in_num       ),
    .col            (   col         ),
    .row            (   row         ),

    .out_valid      (   out_valid    ),
    .out            (   out          )
   );
  
endmodule
