//////////////////////////////////////////////////////////////////////////////////
//  Engineer:        Tzu-Han Hsu
//  Create Date:     04/08/2023 11:17:10 PM
//  Module Name:     PATTERN
//  Project Name:    Gray-level co-occurrence matrix (GLCM) [ICLAB2023 Spring Midterm Project]
//  HDL(Version):    Verilog-2001
//
//  Dependencies:    MEM_MAP_define.v, pseudo_DRAM
//
//////////////////////////////////////////////////////////////////////////////////
//  Description:     1. Randomize testbench data. 
//					 2. Reads 16x16 matrix from DRAM 0x1000 ~ 0x1FFF via AXI
//					 3. Calculate golden answer for GLCM
//					 4. Sends input pattern to Unit Under Test
//					 5 Wait till UUT response out_valid
//					 6. Read 32 x 32 answer 8-bit answer from DRAM 0x2000 ~ 0x2FFF via AXI
//					 7. Compare answer 
//					 8. Bingo! 
//
//////////////////////////////////////////////////////////////////////////////////
//  Revision:
//  04/08/2023 - Build DRAM R/W system through AXI
//  09/13/2023 - R/W DRAM section fails to write, others finished
//  09/13/2023 - Revision of pseudo_DRAM
//  04/14/2023 - fix i,j index bug
//   
//////////////////////////////////////////////////////////////////////////////////
//  License information:
//
//  This software is released under the BSD-3-Clause Licence,
//  see https://opensource.org/licenses/BSD-3-Clause for details.
//  In the following license statements, "software" refers to the
//  "source code" of the complete hardware/software system.
//
//  Copyright 2023,
//                    IRIS Lab
//                    Graduate Institute of Electronics Engineering
//                    National Taiwan University
//                    Taipei, Taiwan.
//
//  All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions are met:
//
//  1. Redistributions of source code must retain the above copyright notice,
//     this list of conditions and the following disclaimer.
//
//  2. Redistributions in binary form must reproduce the above copyright notice,
//     this list of conditions and the following disclaimer in the documentation
//     and/or other materials provided with the distribution.
//
//  3. Neither the name of the copyright holder nor the names of its contributors
//     may be used to endorse or promote products derived from this software
//     without specific prior written permission.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
//  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
//  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
//  ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
//  LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
//  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
//  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
//  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
//  CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
//  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
//  POSSIBILITY OF SUCH DAMAGE.
//////////////////////////////////////////////////////////////////////////////////

`ifdef RTL
`define CYCLE_TIME 2.9
`endif
`ifdef GATE
`define CYCLE_TIME 2.9
`endif

`include "../00_TESTBED/MEM_MAP_define.v"
`include "../00_TESTBED/pseudo_DRAM.v"

module PATTERN #(parameter ID_WIDTH=4, DATA_WIDTH=32, ADDR_WIDTH=32)(
        
    clk,	
    rst_n,	
	
    in_addr_M,
    in_addr_G,
    in_dir,
    in_dis,
    in_valid,
    out_valid, 

         awid_s_inf,
       awaddr_s_inf,
       awsize_s_inf,
      awburst_s_inf,
        awlen_s_inf,
      awvalid_s_inf,
      awready_s_inf,
                    
        wdata_s_inf,
        wlast_s_inf,
       wvalid_s_inf,
       wready_s_inf,
                    
          bid_s_inf,
        bresp_s_inf,
       bvalid_s_inf,
       bready_s_inf,
                    
         arid_s_inf,
       araddr_s_inf,
        arlen_s_inf,
       arsize_s_inf,
      arburst_s_inf,
      arvalid_s_inf,
      arready_s_inf, 

          rid_s_inf,
        rdata_s_inf,
        rresp_s_inf,
        rlast_s_inf,
       rvalid_s_inf,
       rready_s_inf 
    );


// ===============================================================
// I/O Declaration
// ===============================================================
output reg			  clk,rst_n;
        
// -----------------------------
// IO port
output reg [ADDR_WIDTH-1:0]     in_addr_M;
output reg [ADDR_WIDTH-1:0]     in_addr_G;
output reg [1:0]  	  	in_dir;
output reg [3:0]	    	in_dis;
output reg 		        in_valid;
input	                        out_valid;
// -----------------------------

// axi write address channel 
input wire [ID_WIDTH-1:0]        awid_s_inf;
input wire [ADDR_WIDTH-1:0]    awaddr_s_inf;
input wire [2:0]            awsize_s_inf;
input wire [1:0]           awburst_s_inf;
input wire [3:0]             awlen_s_inf;
input wire                 awvalid_s_inf;
output wire                awready_s_inf;
// axi write data channel 
input wire [DATA_WIDTH-1:0]     wdata_s_inf;
input wire                   wlast_s_inf;
input wire                  wvalid_s_inf;
output wire                 wready_s_inf;
// axi write response channel
output wire [ID_WIDTH-1:0]         bid_s_inf;
output wire [1:0]             bresp_s_inf;
output wire              	  bvalid_s_inf;
input wire                    bready_s_inf;
// -----------------------------
// axi read address channel 
input wire [ID_WIDTH-1:0]       arid_s_inf;
input wire [ADDR_WIDTH-1:0]   araddr_s_inf;
input wire [3:0]            arlen_s_inf;
input wire [2:0]           arsize_s_inf;
input wire [1:0]          arburst_s_inf;
input wire                arvalid_s_inf;
output wire               arready_s_inf;
// -----------------------------
// axi read data channel 
output wire [ID_WIDTH-1:0]         rid_s_inf;
output wire [DATA_WIDTH-1:0]     rdata_s_inf;
output wire [1:0]             rresp_s_inf;
output wire                   rlast_s_inf;
output wire                  rvalid_s_inf;
input wire                   rready_s_inf;
// -----------------------------
// ===============================================================
// DRAM instntiation and other signals wires
// ===============================================================
reg padram; // this variable hands dram usage to the PATTERN

//PATTERN access DRAM wires
//axi write address channel
reg [ID_WIDTH-1:0]		p_awid_s_inf;
reg [ADDR_WIDTH-1:0]	p_awaddr_s_inf;
reg [2:0]				p_awsize_s_inf;
reg [1:0]				p_awburst_s_inf;
reg [3:0]				p_awlen_s_inf;
reg						p_awvalid_s_inf;
// src slav
wire					p_awready_s_inf;
// -----------------------------
// axi write data channel 
// src master
reg [DATA_WIDTH-1:0]	p_wdata_s_inf;
reg						p_wlast_s_inf;
reg						p_wvalid_s_inf;
// src slave
wire					p_wready_s_inf;
// -----------------------------
// axi write response channel 
// src slave
wire [ID_WIDTH-1:0]		p_bid_s_inf;
wire [1:0]				p_bresp_s_inf;
wire 					p_bvalid_s_inf;
// src master 
reg						p_bready_s_inf;
// -----------------------------
// axi read address channel 
// src master
reg [ID_WIDTH-1:0]		p_arid_s_inf;
reg [ADDR_WIDTH-1:0]	p_araddr_s_inf;
reg [3:0]				p_arlen_s_inf;
reg [2:0]				p_arsize_s_inf;
reg [1:0]				p_arburst_s_inf;
reg						p_arvalid_s_inf;
// src slave
wire					p_arready_s_inf;
// -----------------------------   
// axi read data channel 
// slave
wire [ID_WIDTH-1:0]		p_rid_s_inf;
wire [DATA_WIDTH-1:0]	p_rdata_s_inf;
wire [1:0]				p_rresp_s_inf;
wire					p_rlast_s_inf;
wire					p_rvalid_s_inf;
// master
reg						p_rready_s_inf;


// DRAM instantiation wires (send directly to dram)
// axi write address channel 
// src master
wire [ID_WIDTH-1:0]		i_awid_s_inf = (padram)?	p_awid_s_inf :		awid_s_inf;
wire [ADDR_WIDTH-1:0]	i_awaddr_s_inf = (padram)?	p_awaddr_s_inf :	awaddr_s_inf;
wire [2:0]				i_awsize_s_inf = (padram)?	p_awsize_s_inf :	awsize_s_inf;
wire [1:0]				i_awburst_s_inf = (padram)?	p_awburst_s_inf :	awburst_s_inf;
wire [3:0]				i_awlen_s_inf = (padram)?	p_awlen_s_inf :		awlen_s_inf;
wire					i_awvalid_s_inf = (padram)?	p_awvalid_s_inf :	awvalid_s_inf;
// src slav
wire					i_awready_s_inf;
// -----------------------------
// axi write data channel 
// src master
wire [DATA_WIDTH-1:0]	i_wdata_s_inf = (padram)?	p_wdata_s_inf : 	wdata_s_inf;
wire					i_wlast_s_inf = (padram)?	p_wlast_s_inf :		wlast_s_inf;
wire					i_wvalid_s_inf = (padram)?	p_wvalid_s_inf :	wvalid_s_inf;
// src slave
wire					i_wready_s_inf;
// -----------------------------
// axi write response channel 
// src slave
wire [ID_WIDTH-1:0]		i_bid_s_inf;
wire [1:0]				i_bresp_s_inf;
wire 					i_bvalid_s_inf;
// src master 
wire					i_bready_s_inf = (padram)?	p_bready_s_inf :	bready_s_inf;
// -----------------------------
// axi read address channel 
// src master
wire [ID_WIDTH-1:0]		i_arid_s_inf = (padram)?	p_arid_s_inf :		arid_s_inf;
wire [ADDR_WIDTH-1:0]	i_araddr_s_inf = (padram)?	p_araddr_s_inf : 	araddr_s_inf;
wire [3:0]				i_arlen_s_inf = (padram)?	p_arlen_s_inf :		arlen_s_inf;
wire [2:0]				i_arsize_s_inf = (padram)?	p_arsize_s_inf :	arsize_s_inf;
wire [1:0]				i_arburst_s_inf = (padram)?	p_arburst_s_inf :	arburst_s_inf;
wire					i_arvalid_s_inf = (padram)?	p_arvalid_s_inf :	arvalid_s_inf;
// src slave
wire					i_arready_s_inf;
// -----------------------------   
// axi read data channel 
// slave
wire [ID_WIDTH-1:0]		i_rid_s_inf;
wire [DATA_WIDTH-1:0]	i_rdata_s_inf;
wire [1:0]				i_rresp_s_inf;
wire					i_rlast_s_inf;
wire					i_rvalid_s_inf;
// master
wire					i_rready_s_inf = (padram)? p_rready_s_inf :		rready_s_inf;

//Link the outputs of the DRAM to the correct host, PATTERN or RTL:

//** RTL direction **
// -----------------------------
// axi write address channel 
assign awready_s_inf = (~padram)? i_awready_s_inf : 0;
// axi write data channel 
assign wready_s_inf = (~padram)? i_wready_s_inf : 0;
// axi write response channel
assign bid_s_inf = (~padram)? i_bid_s_inf : 0;
assign bresp_s_inf = (~padram)? i_bresp_s_inf : 0;
assign bvalid_s_inf = (~padram)? i_bvalid_s_inf : 0;
// -----------------------------
// axi read address channel 
assign arready_s_inf = (~padram)? i_arready_s_inf : 0;
// -----------------------------
// axi read data channel 
assign rid_s_inf = (~padram)? i_rid_s_inf : 0;
assign rdata_s_inf = (~padram)? i_rdata_s_inf : 0;
assign rresp_s_inf = (~padram)? i_rresp_s_inf : 0;
assign rlast_s_inf = (~padram)? i_rlast_s_inf : 0;
assign rvalid_s_inf = (~padram)? i_rvalid_s_inf : 0;

//** PATTERN direction **
// -----------------------------
// axi write address channel 
assign p_awready_s_inf = (padram)? i_awready_s_inf : 0;
// axi write data channel 
assign p_wready_s_inf = (padram)? i_wready_s_inf : 0;
// axi write response channel
assign p_bid_s_inf = (padram)? i_bid_s_inf : 0;
assign p_bresp_s_inf = (padram)? i_bresp_s_inf : 0;
assign p_bvalid_s_inf = (padram)? i_bvalid_s_inf : 0;
// -----------------------------
// axi read address channel 
assign p_arready_s_inf = (padram)? i_arready_s_inf : 0;
// -----------------------------
// axi read data channel 
assign p_rid_s_inf = (padram)? i_rid_s_inf : 0;
assign p_rdata_s_inf = (padram)? i_rdata_s_inf : 0;
assign p_rresp_s_inf = (padram)? i_rresp_s_inf : 0;
assign p_rlast_s_inf = (padram)? i_rlast_s_inf : 0;
assign p_rvalid_s_inf = (padram)? i_rvalid_s_inf : 0;


pseudo_DRAM pseudo_DRAM (
	// Glbal Signal
  	.clk(clk),
  	.rst_n(rst_n),
    // axi write address channel 
    // src master
    .awid_s_inf(i_awid_s_inf),
    .awaddr_s_inf(i_awaddr_s_inf),
    .awsize_s_inf(i_awsize_s_inf),
    .awburst_s_inf(i_awburst_s_inf),
    .awlen_s_inf(i_awlen_s_inf),
    .awvalid_s_inf(i_awvalid_s_inf),
    // src slave
    .awready_s_inf(i_awready_s_inf),
    // -----------------------------
    // axi write data channel 
    // src master
    .wdata_s_inf(i_wdata_s_inf),
    .wlast_s_inf(i_wlast_s_inf),
    .wvalid_s_inf(i_wvalid_s_inf),
    // src slave
    .wready_s_inf(i_wready_s_inf),
    // -----------------------------
    // axi write response channel 
    // src slave
    .bid_s_inf(i_bid_s_inf),
    .bresp_s_inf(i_bresp_s_inf),
    .bvalid_s_inf(i_bvalid_s_inf),
    // src master 
    .bready_s_inf(i_bready_s_inf),
    // -----------------------------
	// axi read address channel 
	// src master
	.arid_s_inf(i_arid_s_inf),
	.araddr_s_inf(i_araddr_s_inf),
	.arlen_s_inf(i_arlen_s_inf),
	.arsize_s_inf(i_arsize_s_inf),
	.arburst_s_inf(i_arburst_s_inf),
	.arvalid_s_inf(i_arvalid_s_inf),
	// src slave
	.arready_s_inf(i_arready_s_inf),
	// -----------------------------
	// axi read data channel 
	// slave
	.rid_s_inf(i_rid_s_inf),
	.rdata_s_inf(i_rdata_s_inf),
	.rresp_s_inf(i_rresp_s_inf),
	.rlast_s_inf(i_rlast_s_inf),
	.rvalid_s_inf(i_rvalid_s_inf),
	// master
	.rready_s_inf(i_rready_s_inf)
);


// ===============================================================
// Variable & Parameter Declaration
// ===============================================================
real CYCLE = `CYCLE_TIME;
integer patcount;
parameter PATNUM = 170;
parameter PRINT_MSG = 1;
integer SEED = 1709;

integer i,j,k;
integer lat,total_latency;

integer crow, ccol;
integer bef_value, aft_value;

//reg padram; // this variable hands dram usage to the PATTERN (declared above)


reg [ADDR_WIDTH-1:0]     addrm_gd;
reg [ADDR_WIDTH-1:0]     addrg_gd;
reg [1:0]  	    	dir_gd;
reg [3:0]	    	dis_gd;

reg [8-1:0] sram_gd [0:16-1][0:16-1];
reg [8-1:0] glcm_gd [0:32-1][0:32-1];
reg [8-1:0] glcm_my [0:32-1][0:32-1];
reg [8-1:0] glcm_fake [0:32-1][0:32-1];
//---------------------------------------------------------------------
// Clock Generation
//---------------------------------------------------------------------
initial clk = 0;
always #(CYCLE/2.0) clk = ~clk;

//---------------------------------------------------------------------
//   MAIN FLOW
//---------------------------------------------------------------------
initial begin

	rst_n = 1'b1;
	in_valid = 1'b0;
	in_addr_M = 'bx;
    in_addr_G = 'bx;
    in_dir = 'bx;
    in_dis = 'bx;
    in_valid = 'bx;

    force clk = 0;
 	total_latency = 0;
	reset_signal_task;
	
	for(patcount=1; patcount<=PATNUM; patcount=patcount+1) begin
			// if(PRINT_MSG) $display("\033[1;96mPATTERN\033[1;0m:%05d",patcount);
            gen_testcase;
			// if(PRINT_MSG)$display("in_addr_M : 0x%4x, in_addr_G: 0x%4x",addrm_gd, addrg_gd);
			// if(PRINT_MSG)$display("dir_gd: %d, dis_gd: %d",dir_gd, dis_gd);
			@(negedge clk); padram = 1; // obtain the control of the DRAM
            read_sram;
			// if(PRINT_MSG) printSRAM;
			// $display("");


			// if(PRINT_MSG) printSRAM_real;
			// $display("");
			
            calculate_answer;
			// if(PRINT_MSG) printGLCM_gd;
			// $display("");

			// write_glcm;
			// $display("");


			@(negedge clk);
			@(negedge clk); padram = 0; // hand over the control of DRAM
            input_task;
            wait_OUT_VALID;
			@(negedge clk);
			padram = 1;
            check_ans;
    
            @(negedge clk);
	end
  	YOU_PASS_task;
	@(negedge clk);
	@(negedge clk);
	@(negedge clk);
	$finish;
end

task reset_signal_task; begin 
  #(0.5);  rst_n=0;
  #(CYCLE/2);
  if(out_valid !== 0) begin
    $display("************************************************************");
    $display("*                       ICLAB MP FAIL                      *");
    $display("*   Output signal should be 0 after initial RESET at %t    *",$time);
    $display("************************************************************");
    $finish;
  end
  #(10);  rst_n=1;
	//Also, initialize the DRAM AXI signals
	in_valid = 0;

	p_awid_s_inf = 0;
	p_awaddr_s_inf = 0;
	p_awsize_s_inf = 0;
	p_awburst_s_inf = 0;
	p_awlen_s_inf = 0;
	p_awvalid_s_inf = 0;
	
	p_wdata_s_inf = 0;
	p_wlast_s_inf = 0;
	p_wvalid_s_inf = 0;
	
	p_bready_s_inf = 0;
	
	p_arid_s_inf = 0;
	p_araddr_s_inf = 0;
	p_arlen_s_inf = 0;
	p_arsize_s_inf = 0;
	p_arburst_s_inf = 0;
	p_arvalid_s_inf = 0;
	
	p_rready_s_inf = 0;

	for(i = 0; i < 32; i = i+1)begin
		for(j = 0; j < 32; j = j+1)begin
			glcm_gd[i][j] = 0;
			glcm_fake[i][j]={i[3:0],j[3:0]};
		end
	end

  #(3);  release clk;
end endtask

task gen_testcase; begin
    //ADDRM should be 16 x 16 so there's 256 byte.
    //The range if from 0x1000 ~ 0x1EFF 
    addrm_gd = ($random(SEED) % 'h0eff) + 'h1000;
	if(patcount == 1) addrm_gd = 'h1060;
    //ADDRM should be 32 x 32 so there's 1024 byte.
    //The range if from 0x2000 ~ 0x2BFF 
    addrg_gd = ($random(SEED) % 'h0bff) + 'h2000;

    //dir is either 2'b01, 2'b10 or 2'b11
    dir_gd = ($random(SEED) % 'd3) + 1;
    //distance value would not exceed the size of the input matrix
	if(patcount < 3)dis_gd = patcount + 1;
    else dis_gd = ($random(SEED) % 'd14) + 1;  
end endtask

//Utilize AXI protocal to read input matrix to sram_gd.
task read_sram; begin
	//send in address via AXI read address channel(1st burst read)
	for(k = 0; k < 4; k=k+1)begin
		p_arid_s_inf = 0;//id == 0?
		p_araddr_s_inf = addrm_gd + k*4*16;
		p_arlen_s_inf = 4'b1111;// 16 * 16
		p_arsize_s_inf = 3'b010;//(4bytes)
		p_arburst_s_inf = 2'b01;//2'b01(INCR)
		p_arvalid_s_inf = 1;
		@(posedge p_arready_s_inf);
		@(negedge clk);
		p_arid_s_inf = 0;
		p_araddr_s_inf = 0;
		p_arlen_s_inf = 0; 
		p_arsize_s_inf = 0; 
		p_arburst_s_inf =0;
		p_arvalid_s_inf = 0;

		p_rready_s_inf = 1;
		@(posedge p_rvalid_s_inf);
		@(negedge clk);
		for(i = 4*k; i < 4*k+4; i = i+1)begin
			{sram_gd[i][ 3], sram_gd[i][ 2], sram_gd[i][ 1], sram_gd[i][ 0]} = p_rdata_s_inf;
			@(negedge clk);
			{sram_gd[i][ 7], sram_gd[i][ 6], sram_gd[i][ 5], sram_gd[i][ 4]} = p_rdata_s_inf;
			@(negedge clk);
			{sram_gd[i][11], sram_gd[i][10], sram_gd[i][ 9], sram_gd[i][ 8]} = p_rdata_s_inf;
			@(negedge clk);
			{sram_gd[i][15], sram_gd[i][14], sram_gd[i][13], sram_gd[i][12]} = p_rdata_s_inf;
			@(negedge clk);
				
		end
		p_rready_s_inf = 0;
		@(negedge clk);
	end

end endtask

task read_glcm; begin
	
	for(k = 0; k < 32; k=k+1)begin
		p_arid_s_inf = 0;//id == 0?
		p_araddr_s_inf = addrg_gd + k*4*8;
		p_arlen_s_inf = 4'b0111;// 8
		p_arsize_s_inf = 3'b010;//(4bytes)
		p_arburst_s_inf = 2'b01;//2'b01(INCR)
		p_arvalid_s_inf = 1;
		@(posedge p_arready_s_inf);
		@(posedge clk);
		@(negedge clk);
		p_arid_s_inf = 0;
		p_araddr_s_inf = 0;
		p_arlen_s_inf = 0; 
		p_arsize_s_inf = 0; 
		p_arburst_s_inf =0;
		p_arvalid_s_inf = 0;

		@(negedge clk);
		p_rready_s_inf = 1;
		@(posedge p_rvalid_s_inf);
		@(negedge clk);

		{glcm_my[k][ 3], glcm_my[k][ 2], glcm_my[k][ 1], glcm_my[k][ 0]} = p_rdata_s_inf;
		@(negedge clk);
		{glcm_my[k][ 7], glcm_my[k][ 6], glcm_my[k][ 5], glcm_my[k][ 4]} = p_rdata_s_inf;
		@(negedge clk);
		{glcm_my[k][11], glcm_my[k][10], glcm_my[k][ 9], glcm_my[k][ 8]} = p_rdata_s_inf;
		@(negedge clk);
		{glcm_my[k][15], glcm_my[k][14], glcm_my[k][13], glcm_my[k][12]} = p_rdata_s_inf;
		@(negedge clk);
		{glcm_my[k][19], glcm_my[k][18], glcm_my[k][17], glcm_my[k][16]} = p_rdata_s_inf;
		@(negedge clk);
		{glcm_my[k][23], glcm_my[k][22], glcm_my[k][21], glcm_my[k][20]} = p_rdata_s_inf;
		@(negedge clk);
		{glcm_my[k][27], glcm_my[k][26], glcm_my[k][25], glcm_my[k][24]} = p_rdata_s_inf;
		@(negedge clk);
		{glcm_my[k][31], glcm_my[k][30], glcm_my[k][29], glcm_my[k][28]} = p_rdata_s_inf;
		@(negedge clk);

		// @(p_arvalid_s_inf);
		@(negedge clk);
		p_rready_s_inf = 0;
	end
end endtask

task calculate_answer; begin
    //Utilize the sram to calculate answer, place in glcm_gd
	for(i = 0; i < 32; i = i+1)begin
		for(j = 0; j < 32; j = j+1)begin
			glcm_gd[i][j] = 0;
		end
	end
	@(negedge clk);

    for(i = 0; i < 16; i=i+1)begin
		for(j = 0; j <16; j=j+1)begin
			crow = (dir_gd[0])? i + dis_gd: i; 
			ccol = (dir_gd[1])? j + dis_gd: j;
			bef_value = sram_gd[i][j][4:0];
			aft_value = sram_gd[crow][ccol][4:0];
			if(crow < 16 && ccol < 16)begin
				glcm_gd[bef_value][aft_value] = glcm_gd[bef_value][aft_value] + 1;
				// $display("L(%d, %d)[%02x] -> (%d, %d)[%02x]\n",i,j,bef_value, crow, ccol, aft_value);
			end else begin
				// $display("I(%d, %d)[%02x] -> (%d, %d)[%02x]\n",i,j,bef_value, crow, ccol, aft_value);
				
			end
			@(negedge clk);

		end
	end
end endtask

task input_task; begin
    @(negedge clk);
    in_valid = 1;
	in_addr_M = addrm_gd;
	in_addr_G = addrg_gd;
	in_dir = dir_gd;
	in_dis = dis_gd;
	
    @(negedge clk);
	in_valid = 1'b0;
	in_addr_M = 'bx;
	in_addr_G = 'bx;
	in_dir = 'bx;
	in_dis = 'bx;

end endtask

task wait_OUT_VALID; begin
  lat = -1;
  while(out_valid !== 1) begin
	lat = lat + 1;
	if(lat == 10001) begin//wait limit
		$display("***************************************************************");
		$display("     		    ICLAB MP FAIL      			");
		$display("         The execution latency are over 10001 cycles.         ");
		$display("***************************************************************");
		repeat(2)@(negedge clk);
		$finish;
	end
	@(negedge clk);
  end
  total_latency = total_latency + lat;
end endtask

task check_ans; begin
	// $display("STart checking ansswer!");
	read_glcm;
	// if(PRINT_MSG) printGLCM_my;
	@(negedge clk);
	for(i = 0 ; i < 32; i = i+1)begin
		for(j = 0; j < 32; j=j+1)begin
			if(glcm_gd[i][j] !== glcm_my[i][j]) begin
				$display ("--------------------------------------------------------------------");
				$display ("                     PATTERN #%d  FAILED!!!                         ",patcount);
				$display ("               Gold[%2d, %2d] = %2d, My[%2d, %2d] = %2d                 ",i,j,glcm_gd[i][j],i,j,glcm_my[i][j]);
				$display ("--------------------------------------------------------------------");
				$display ("--------------------------------------------------------------------");
				if(PRINT_MSG) $display("\033[1;96mPATTERN\033[1;0m:%05d",patcount);
				if(PRINT_MSG) $display("in_addr_M : 0x%4x, in_addr_G: 0x%4x",addrm_gd, addrg_gd);
				if(PRINT_MSG) $display("dir_gd: %d, dis_gd: %d",dir_gd, dis_gd);
				if(PRINT_MSG) printSRAM;
				if(PRINT_MSG) printSRAM_real;

				printGLCM_my;
				printGLCM_gd;
				repeat(2) @(negedge clk);		
				$finish;
			end else begin
				
			@(negedge clk);
			end
		end
	end
	@(negedge clk);

	$display("\033[0;34mPASS PATTERN NO.%4d,\033[m \033[0;32mexecution cycle : %3d\033[m",patcount ,lat+1);
end endtask

task YOU_PASS_task;begin
    $display ("--------------------------------------------------------------------");
    $display ("          ~(￣▽￣)~(＿△＿)~(￣▽￣)~(＿△＿)~(￣▽￣)~              ");
    $display ("                         Congratulations!                           ");
    $display ("          You have passed all patterns for Midterm Project !!       ");
    $display ("--------------------------------------------------------------------");        
    
    #(300);
    $finish;
end endtask

task printSRAM; begin
	$display("Row offset Col offset:");
	$display("%d %d",({4{dir_gd[0]}}&dis_gd),({4{dir_gd[1]}}&dis_gd));

	$display("\033[1;92mPrint SRAM data:\033[1;0m");
	
	$write("++||");
	for(i = 0; i < 16; i = i+1)begin
		$write("%02d ",i);
	end
	$display("");
	$write("++==");
	for(i = 0; i < 15; i = i+1)begin
		$write("===");
		
	end
	$display("==");

	for(i = 0; i < 16; i = i+1)begin
		$write("%02d||",i);
		for(j = 0; j < 16; j = j+1)begin
			$write("%02x ",sram_gd[i][j]);
		end
		$display("");
	end
end endtask

task printSRAM_real; begin

	$display("\033[1;92mPrint SRAM real stored data:\033[1;0m");
	
	$write("++||");
	for(i = 0; i < 16; i = i+1)begin
		$write("%02d ",i);
	end
	$display("");
	$write("++==");
	for(i = 0; i < 15; i = i+1)begin
		$write("===");
		
	end
	$display("==");

	for(i = 0; i < 16; i = i+1)begin
		$write("%02d||",i);
		for(j = 0; j < 16; j = j+1)begin
			$write("%02x ",sram_gd[i][j][4:0]);
		end
		$display("");
	end
end endtask


task printGLCM_gd; begin
	$display("\033[1;92mPrint GLCM golden answer:\033[1;0m");
	
	$write("++||");
	for(i = 0; i < 32; i = i+1)begin
		$write("%02d ",i);
	end
	$display("");
	$write("++==");
	for(i = 0; i < 31; i = i+1)begin
		$write("===");
		
	end
	$display("==");

	for(i = 0; i < 32; i = i+1)begin
		$write("%02d||",i);

		for(j = 0; j < 32; j = j+1)begin
			if(glcm_gd[i][j] !== glcm_my[i][j])begin
				$write("\033[1;95m%02x\033[1;0m ",glcm_gd[i][j]);
			end
			else if(glcm_gd[i][j] !== 0)begin
				$write("\033[1;93m%02x\033[1;0m ",glcm_gd[i][j]);
			end else begin
				$write("%02x ",glcm_gd[i][j]);
			end
		end
		$display("");
	end
end endtask

task printGLCM_my; begin
	$display("\033[1;92mPrint GLCM MY answer:\033[1;0m");
	
	$write("++||");
	for(i = 0; i < 32; i = i+1)begin
		$write("%02d ",i);
	end
	$display("");
	$write("++==");
	for(i = 0; i < 31; i = i+1)begin
		$write("===");
		
	end
	$display("==");

	for(i = 0; i < 32; i = i+1)begin
		$write("%02d||",i);

		for(j = 0; j < 32; j = j+1)begin
			if(glcm_my[i][j] !== glcm_gd[i][j])begin
				$write("\033[1;91m%02x\033[1;0m ",glcm_my[i][j]);
			end else begin
				$write("%02x ",glcm_my[i][j]);
			end
		end
		$display("");
	end
end endtask

task write_glcm; begin
	
	@(negedge clk);
	p_awid_s_inf = 0;
	p_awaddr_s_inf = addrg_gd;
	p_awsize_s_inf = 3'b010;//4 bytes
	p_awburst_s_inf = 2'b01;//burst(inc)
	p_awlen_s_inf = 4'b0111; //burst write 8
	p_awvalid_s_inf = 1;
	@(p_awready_s_inf);
	@(posedge clk);
	@(negedge clk);
	p_awid_s_inf = 0;
	p_awaddr_s_inf = 0;
	p_awsize_s_inf = 3'b010;//4 bytes
	p_awburst_s_inf = 2'b01;//burst(inc)
	p_awlen_s_inf = 4'b0111; //burst write 8
	p_awvalid_s_inf = 0;

	p_bready_s_inf = 1'b1;
	
	@(negedge clk);
	p_wvalid_s_inf = 1;
	p_wlast_s_inf = 0;
	p_wdata_s_inf = {glcm_fake[0][ 3],glcm_fake[0][ 2],glcm_fake[0][ 1],glcm_fake[0][ 0]};
	
	@(p_wready_s_inf);
	@(negedge clk);
	p_wdata_s_inf = {glcm_fake[0][ 7],glcm_fake[0][ 6],glcm_fake[0][ 5],glcm_fake[0][ 4]};
	
	// @(p_wready_s_inf);
	@(negedge clk);
	p_wdata_s_inf = {glcm_fake[0][11],glcm_fake[0][10],glcm_fake[0][ 9],glcm_fake[0][ 8]};
	
	// @(p_wready_s_inf);
	@(negedge clk);
	p_wdata_s_inf = {glcm_fake[0][15],glcm_fake[0][14],glcm_fake[0][13],glcm_fake[0][12]};
	
	// @(p_wready_s_inf);
	@(negedge clk);
	p_wdata_s_inf = {glcm_fake[0][19],glcm_fake[0][18],glcm_fake[0][17],glcm_fake[0][16]};

	// @(p_wready_s_inf);
	@(negedge clk);
	p_wdata_s_inf = {glcm_fake[0][19],glcm_fake[0][18],glcm_fake[0][17],glcm_fake[0][16]};

	// @(p_wready_s_inf);
	@(negedge clk);
	p_wdata_s_inf = {glcm_fake[0][23],glcm_fake[0][22],glcm_fake[0][21],glcm_fake[0][20]};

	// @(p_wready_s_inf);
	@(negedge clk);
	p_wdata_s_inf = {glcm_fake[0][27],glcm_fake[0][26],glcm_fake[0][25],glcm_fake[0][24]};
	
	// @(p_wready_s_inf);
	@(negedge clk);
	p_wlast_s_inf = 1;
	p_wdata_s_inf = {glcm_fake[0][31],glcm_fake[0][30],glcm_fake[0][29],glcm_fake[0][28]};
	
	@(p_bvalid_s_inf)
	@(posedge clk);
	@(negedge clk);
	p_wvalid_s_inf = 0;
	p_wlast_s_inf = 0;
	p_wdata_s_inf = 0;
	p_bready_s_inf = 0;

	@(negedge clk);
	
end endtask
endmodule

