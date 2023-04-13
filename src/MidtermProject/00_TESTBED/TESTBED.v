`timescale 1ns/100ps

`include "PATTERN.v"
`ifdef RTL
`include "GLCM.v"
`elsif GATE
`include "GLCM_SYN.v"
`endif

module TESTBED();
parameter ID_WIDTH = 4 , ADDR_WIDTH = 32, DATA_WIDTH = 32;
//Connection wires
wire			  clk,rst_n;
        
// -----------------------------
// IO Port 
wire [ADDR_WIDTH-1:0]      in_addr_M;
wire [ADDR_WIDTH-1:0]      in_addr_G;
wire [1:0]  	  		in_dir;
wire [3:0]		    	in_dis;
wire 			    	in_valid;
wire 	              out_valid;
// -----------------------------


// axi write address channel 
wire [ID_WIDTH-1:0]        awid_m_inf;
wire [ADDR_WIDTH-1:0]    awaddr_m_inf;
wire [2:0]            awsize_m_inf;
wire [1:0]           awburst_m_inf;
wire [3:0]             awlen_m_inf;
wire                 awvalid_m_inf;
wire                 awready_m_inf;
// axi write data channel 
wire [ DATA_WIDTH-1:0]     wdata_m_inf;
wire                   wlast_m_inf;
wire                  wvalid_m_inf;
wire                  wready_m_inf;
// axi write response channel
wire [ID_WIDTH-1:0]         bid_m_inf;
wire [1:0]             bresp_m_inf;
wire              	   bvalid_m_inf;
wire                  bready_m_inf;
// -----------------------------
// axi read address channel 
wire [ID_WIDTH-1:0]       arid_m_inf;
wire [ADDR_WIDTH-1:0]   araddr_m_inf;
wire [3:0]            arlen_m_inf;
wire [2:0]           arsize_m_inf;
wire [1:0]          arburst_m_inf;
wire                arvalid_m_inf;
wire               arready_m_inf;
// -----------------------------
// axi read data channel 
wire [ID_WIDTH-1:0]         rid_m_inf;
wire [DATA_WIDTH-1:0]     rdata_m_inf;
wire [1:0]             rresp_m_inf;
wire                   rlast_m_inf;
wire                  rvalid_m_inf;
wire                  rready_m_inf;
// -----------------------------
initial begin
  `ifdef RTL
    $fsdbDumpfile("GLCM.fsdb");
    $fsdbDumpvars(0,"+mda");
  `endif
  `ifdef GATE
    $sdf_annotate("GLCM_SYN.sdf",U_GLCM);
    $fsdbDumpfile("GLCM_SYN.fsdb");
    $fsdbDumpvars(0,"+mda");
  `endif
end

GLCM U_GLCM(
      .clk             (  clk           ), 
	  .rst_n           (  rst_n         ),
	   

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
      . bready_m_inf   ( bready_m_inf   ),
	  
	  
	  
      . in_addr_M      	( in_addr_M   ),
      . in_addr_G      	( in_addr_G   ),
      . in_dir      	( in_dir   ),
      . in_dis      	( in_dis   ),
      . in_valid      	( in_valid   ),
      . out_valid      	( out_valid   )
);

PATTERN U_PATTERN(
        .clk            ( clk           ),
        .rst_n          ( rst_n         ),
	
	
		

        
        .   awid_s_inf  (   awid_m_inf  ),
        . awaddr_s_inf  ( awaddr_m_inf  ),
        . awsize_s_inf  ( awsize_m_inf  ),
        .awburst_s_inf  (awburst_m_inf  ),
        .  awlen_s_inf  (  awlen_m_inf  ),
        .awvalid_s_inf  (awvalid_m_inf  ),
        .awready_s_inf  (awready_m_inf  ),
                                            
        .  wdata_s_inf  (  wdata_m_inf  ),
        .  wlast_s_inf  (  wlast_m_inf  ),
        . wvalid_s_inf  ( wvalid_m_inf  ),
        . wready_s_inf  ( wready_m_inf  ),
                                            
        .    bid_s_inf  (    bid_m_inf  ),
        .  bresp_s_inf  (  bresp_m_inf  ),
        . bvalid_s_inf  ( bvalid_m_inf  ),
        . bready_s_inf  ( bready_m_inf  ),
                                            
        .   arid_s_inf  (   arid_m_inf  ),
        . araddr_s_inf  ( araddr_m_inf  ),
        .  arlen_s_inf  (  arlen_m_inf  ),
        . arsize_s_inf  ( arsize_m_inf  ),
        .arburst_s_inf  (arburst_m_inf  ),
        .arvalid_s_inf  (arvalid_m_inf  ),
        .arready_s_inf  (arready_m_inf  ), 
                                            
        .    rid_s_inf  (    rid_m_inf  ),
        .  rdata_s_inf  (  rdata_m_inf  ),
        .  rresp_s_inf  (  rresp_m_inf  ),
        .  rlast_s_inf  (  rlast_m_inf  ),
        . rvalid_s_inf  ( rvalid_m_inf  ),
        . rready_s_inf  ( rready_m_inf  ),
		
		
      . in_addr_M      	( in_addr_M   ),
      . in_addr_G      	( in_addr_G   ),
      . in_dir      	( in_dir   ),
      . in_dis      	( in_dis   ),
      . in_valid      	( in_valid   ),
      . out_valid      	( out_valid   )		
		
		
		
);

endmodule
