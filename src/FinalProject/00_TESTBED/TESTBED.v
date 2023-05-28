//############################################################################
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//   (C) Copyright Laboratory System Integration and Silicon Implementation
//   All Right Reserved
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   ICLAB 2023 Final Project: Customized ISA Processor 
//   Author     		     : Hsi-Hao Huang
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   File Name   : TESTBED.v
//   Module Name : TESTBED.v
//   Release version : V1.0 (Release Date: 2023-May)
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//############################################################################

`timescale 1ns/1ps


`ifdef RUN
    `include "PATTERN.v"
`elsif GEN
    `include "PATTERN_gen_ans.v"
`endif

`ifdef RTL
    `include "CPU.v"
`elsif GATE
    `include "CPU_SYN.v"
`elsif CHIP
    `include "CHIP_SYN.v"
`elsif POST
    `include "CHIP.v"
`endif

module TESTBED();
parameter ID_WIDTH = 4 , ADDR_WIDTH = 32, DATA_WIDTH = 16, DRAM_NUMBER=2, WRIT_NUMBER=1;
//Connection wires
wire			  clk,rst_n;
wire			IO_stall;
        


// axi write address channel 
wire [WRIT_NUMBER * ID_WIDTH-1:0]     	 awid_m_inf;
wire [WRIT_NUMBER * ADDR_WIDTH-1:0]    awaddr_m_inf;
wire [WRIT_NUMBER * 3 -1:0]            awsize_m_inf;
wire [WRIT_NUMBER * 2 -1:0]           awburst_m_inf;
wire [WRIT_NUMBER * 7 -1:0]             awlen_m_inf;
wire [WRIT_NUMBER-1:0]                awvalid_m_inf;
wire [WRIT_NUMBER-1:0]                awready_m_inf;
// axi write data channel 
wire [WRIT_NUMBER * DATA_WIDTH-1:0]     wdata_m_inf;
wire [WRIT_NUMBER-1:0]                  wlast_m_inf;
wire [WRIT_NUMBER-1:0]                 wvalid_m_inf;
wire [WRIT_NUMBER-1:0]                 wready_m_inf;
// axi write response channel
wire [WRIT_NUMBER * ID_WIDTH-1:0]         bid_m_inf;
wire [WRIT_NUMBER * 2 -1:0]             bresp_m_inf;
wire [WRIT_NUMBER-1:0]             	   bvalid_m_inf;
wire [WRIT_NUMBER-1:0]                 bready_m_inf;
// -----------------------------
// axi read address channel 
wire [DRAM_NUMBER * ID_WIDTH-1:0]       arid_m_inf;
wire [DRAM_NUMBER * ADDR_WIDTH-1:0]   araddr_m_inf;
wire [DRAM_NUMBER * 7 -1:0]            arlen_m_inf;
wire [DRAM_NUMBER * 3 -1:0]           arsize_m_inf;
wire [DRAM_NUMBER * 2 -1:0]          arburst_m_inf;
wire [DRAM_NUMBER-1:0]               arvalid_m_inf;
wire [DRAM_NUMBER-1:0]               arready_m_inf;
// -----------------------------
// axi read data channel 
wire [DRAM_NUMBER * ID_WIDTH-1:0]         rid_m_inf;
wire [DRAM_NUMBER * DATA_WIDTH-1:0]     rdata_m_inf;
wire [DRAM_NUMBER * 2 -1:0]             rresp_m_inf;
wire [DRAM_NUMBER-1:0]                  rlast_m_inf;
wire [DRAM_NUMBER-1:0]                 rvalid_m_inf;
wire [DRAM_NUMBER-1:0]                 rready_m_inf;
// -----------------------------


initial begin
  `ifdef RTL
    $fsdbDumpfile("CPU.fsdb");
    $fsdbDumpvars(0,"+mda");
  `elsif GATE
    $sdf_annotate("CPU_SYN.sdf",My_CPU);
    $fsdbDumpfile("CPU_SYN.fsdb");
    $fsdbDumpvars(0,"+mda");
  `elsif CHIP
    //$fsdbDumpfile("CHIP_SYN.fsdb");
    //$fsdbDumpvars(0,"+mda");
  `elsif POST
    $sdf_annotate("CHIP.sdf",My_CHIP);
    //$fsdbDumpfile("CHIP_POST.fsdb");
    //$fsdbDumpvars(0,"+mda");
  `endif
end







`ifdef RTL



CPU My_CPU(
								.clk(clk),
							.rst_n(rst_n),
					  .IO_stall(IO_stall),

  
	  .   arid_m_inf   (   arid_m_inf   ),
      . araddr_m_inf   ( araddr_m_inf   ),
      .  arlen_m_inf   (  arlen_m_inf   ),
      . arsize_m_inf   ( arsize_m_inf   ),
      .arburst_m_inf   (arburst_m_inf   ),
      .arvalid_m_inf   (arvalid_m_inf   ),
      .arready_m_inf   (arready_m_inf   ),
      .   rid_m_inf    (   rid_m_inf    ),
      . rdata_m_inf    ( rdata_m_inf    ),
      . rresp_m_inf    ( rresp_m_inf    ),
      . rlast_m_inf    ( rlast_m_inf    ),
      .rvalid_m_inf    (rvalid_m_inf    ),
      .rready_m_inf    (rready_m_inf    ),

      .   awid_m_inf   (   awid_m_inf   ),
      . awaddr_m_inf   ( awaddr_m_inf   ),
      . awsize_m_inf   ( awsize_m_inf   ),
      .awburst_m_inf   (awburst_m_inf   ),
      .  awlen_m_inf   (  awlen_m_inf   ),
      .awvalid_m_inf   (awvalid_m_inf   ),
      .awready_m_inf   (awready_m_inf   ),

      .  wdata_m_inf   (  wdata_m_inf   ),
      .  wlast_m_inf   (  wlast_m_inf   ),
      . wvalid_m_inf   ( wvalid_m_inf   ),
      . wready_m_inf   ( wready_m_inf   ),

      .    bid_m_inf   (    bid_m_inf   ),
      .  bresp_m_inf   (  bresp_m_inf   ),
      . bvalid_m_inf   ( bvalid_m_inf   ),
      . bready_m_inf   ( bready_m_inf   )
  

);



`elsif GATE



CPU My_CPU(
								.clk(clk),
							.rst_n(rst_n),
					  .IO_stall(IO_stall),

  
	  .   arid_m_inf   (   arid_m_inf   ),
      . araddr_m_inf   ( araddr_m_inf   ),
      .  arlen_m_inf   (  arlen_m_inf   ),
      . arsize_m_inf   ( arsize_m_inf   ),
      .arburst_m_inf   (arburst_m_inf   ),
      .arvalid_m_inf   (arvalid_m_inf   ),
      .arready_m_inf   (arready_m_inf   ),
      .   rid_m_inf    (   rid_m_inf    ),
      . rdata_m_inf    ( rdata_m_inf    ),
      . rresp_m_inf    ( rresp_m_inf    ),
      . rlast_m_inf    ( rlast_m_inf    ),
      .rvalid_m_inf    (rvalid_m_inf    ),
      .rready_m_inf    (rready_m_inf    ),

      .   awid_m_inf   (   awid_m_inf   ),
      . awaddr_m_inf   ( awaddr_m_inf   ),
      . awsize_m_inf   ( awsize_m_inf   ),
      .awburst_m_inf   (awburst_m_inf   ),
      .  awlen_m_inf   (  awlen_m_inf   ),
      .awvalid_m_inf   (awvalid_m_inf   ),
      .awready_m_inf   (awready_m_inf   ),

      .  wdata_m_inf   (  wdata_m_inf   ),
      .  wlast_m_inf   (  wlast_m_inf   ),
      . wvalid_m_inf   ( wvalid_m_inf   ),
      . wready_m_inf   ( wready_m_inf   ),

      .    bid_m_inf   (    bid_m_inf   ),
      .  bresp_m_inf   (  bresp_m_inf   ),
      . bvalid_m_inf   ( bvalid_m_inf   ),
      . bready_m_inf   ( bready_m_inf   )
  

);



`elsif CHIP


CHIP My_CHIP(		.clk(clk),
		.rst_n(rst_n),
		  .IO_stall(IO_stall),

  
	  .   arid_m_inf   (   arid_m_inf   ),
      . araddr_m_inf   ( araddr_m_inf   ),
      .  arlen_m_inf   (  arlen_m_inf   ),
      . arsize_m_inf   ( arsize_m_inf   ),
      .arburst_m_inf   (arburst_m_inf   ),
      .arvalid_m_inf   (arvalid_m_inf   ),
      .arready_m_inf   (arready_m_inf   ),
      .   rid_m_inf    (   rid_m_inf    ),
      . rdata_m_inf    ( rdata_m_inf    ),
      . rresp_m_inf    ( rresp_m_inf    ),
      . rlast_m_inf    ( rlast_m_inf    ),
      .rvalid_m_inf    (rvalid_m_inf    ),
      .rready_m_inf    (rready_m_inf    ),

      .   awid_m_inf   (   awid_m_inf   ),
      . awaddr_m_inf   ( awaddr_m_inf   ),
      . awsize_m_inf   ( awsize_m_inf   ),
      .awburst_m_inf   (awburst_m_inf   ),
      .  awlen_m_inf   (  awlen_m_inf   ),
      .awvalid_m_inf   (awvalid_m_inf   ),
      .awready_m_inf   (awready_m_inf   ),

      .  wdata_m_inf   (  wdata_m_inf   ),
      .  wlast_m_inf   (  wlast_m_inf   ),
      . wvalid_m_inf   ( wvalid_m_inf   ),
      . wready_m_inf   ( wready_m_inf   ),

      .    bid_m_inf   (    bid_m_inf   ),
      .  bresp_m_inf   (  bresp_m_inf   ),
      . bvalid_m_inf   ( bvalid_m_inf   ),
      . bready_m_inf   ( bready_m_inf   )
  

);



`elsif POST




CHIP My_CHIP(		.clk(clk),
		.rst_n(rst_n),
		  .IO_stall(IO_stall),

  
	  .   arid_m_inf   (   arid_m_inf   ),
      . araddr_m_inf   ( araddr_m_inf   ),
      .  arlen_m_inf   (  arlen_m_inf   ),
      . arsize_m_inf   ( arsize_m_inf   ),
      .arburst_m_inf   (arburst_m_inf   ),
      .arvalid_m_inf   (arvalid_m_inf   ),
      .arready_m_inf   (arready_m_inf   ),
      .   rid_m_inf    (   rid_m_inf    ),
      . rdata_m_inf    ( rdata_m_inf    ),
      . rresp_m_inf    ( rresp_m_inf    ),
      . rlast_m_inf    ( rlast_m_inf    ),
      .rvalid_m_inf    (rvalid_m_inf    ),
      .rready_m_inf    (rready_m_inf    ),

      .   awid_m_inf   (   awid_m_inf   ),
      . awaddr_m_inf   ( awaddr_m_inf   ),
      . awsize_m_inf   ( awsize_m_inf   ),
      .awburst_m_inf   (awburst_m_inf   ),
      .  awlen_m_inf   (  awlen_m_inf   ),
      .awvalid_m_inf   (awvalid_m_inf   ),
      .awready_m_inf   (awready_m_inf   ),

      .  wdata_m_inf   (  wdata_m_inf   ),
      .  wlast_m_inf   (  wlast_m_inf   ),
      . wvalid_m_inf   ( wvalid_m_inf   ),
      . wready_m_inf   ( wready_m_inf   ),

      .    bid_m_inf   (    bid_m_inf   ),
      .  bresp_m_inf   (  bresp_m_inf   ),
      . bvalid_m_inf   ( bvalid_m_inf   ),
      . bready_m_inf   ( bready_m_inf   )
  

);



`endif











PATTERN u_PATTERN(
								.clk(clk),
							.rst_n(rst_n),
					  .IO_stall(IO_stall),

  
	  .   arid_s_inf   (   arid_m_inf   ),
      . araddr_s_inf   ( araddr_m_inf   ),
      .  arlen_s_inf   (  arlen_m_inf   ),
      . arsize_s_inf   ( arsize_m_inf   ),
      .arburst_s_inf   (arburst_m_inf   ),
      .arvalid_s_inf   (arvalid_m_inf   ),
      .arready_s_inf   (arready_m_inf   ),
      .   rid_s_inf    (   rid_m_inf    ),
      . rdata_s_inf    ( rdata_m_inf    ),
      . rresp_s_inf    ( rresp_m_inf    ),
      . rlast_s_inf    ( rlast_m_inf    ),
      .rvalid_s_inf    (rvalid_m_inf    ),
      .rready_s_inf    (rready_m_inf    ),

      .   awid_s_inf   (   awid_m_inf   ),
      . awaddr_s_inf   ( awaddr_m_inf   ),
      . awsize_s_inf   ( awsize_m_inf   ),
      .awburst_s_inf   (awburst_m_inf   ),
      .  awlen_s_inf   (  awlen_m_inf   ),
      .awvalid_s_inf   (awvalid_m_inf   ),
      .awready_s_inf   (awready_m_inf   ),

      .  wdata_s_inf   (  wdata_m_inf   ),
      .  wlast_s_inf   (  wlast_m_inf   ),
      . wvalid_s_inf   ( wvalid_m_inf   ),
      . wready_s_inf   ( wready_m_inf   ),

      .    bid_s_inf   (    bid_m_inf   ),
      .  bresp_s_inf   (  bresp_m_inf   ),
      . bvalid_s_inf   ( bvalid_m_inf   ),
      . bready_s_inf   ( bready_m_inf   )

);

endmodule
