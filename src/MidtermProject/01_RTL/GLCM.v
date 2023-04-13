//////////////////////////////////////////////////////////////////////////////////
//  Engineer:        Tzu-Han Hsu
//  Create Date:     04/10/2023 10:03:27 AM
//  Module Name:     GLCM
//  Project Name:    Gray-level co-occurrence matrix (GLCM) [ICLAB2023 Spring Midterm Project]
//  HDL(Version):    Verilog-2001
//
//  Dependencies:    RA1SH_5.v, RA1SH_8.v
//
//////////////////////////////////////////////////////////////////////////////////
//  Description:     1. Reads 16 x 16 matrix through AXI from DRAM 0x1000 ~ 0x1FFF
//					 2. Calculate GLCM
//					 3. Write the 32 x 32 answer back to DRAM 0x2000 ~ 0x2FFF
//					 4. Raise output flag 
//
//////////////////////////////////////////////////////////////////////////////////
//  Revision:
//  04/10/2023 - Finish reading throught AXI, SRAM filled
//  09/11/2023 - Answer calculateion
//  09/13/2023 - AXI write done
//  04/14/2023 - AXI starting index error fixed
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

module GLCM(
				clk,	
			  rst_n,	
	
			in_addr_M,
			in_addr_G,
			in_dir,
			in_dis,
			in_valid,
			out_valid,
	

         awid_m_inf,
       awaddr_m_inf,
       awsize_m_inf,
      awburst_m_inf,
        awlen_m_inf,
      awvalid_m_inf,
      awready_m_inf,
                    
        wdata_m_inf,
        wlast_m_inf,
       wvalid_m_inf,
       wready_m_inf,
                    
          bid_m_inf,
        bresp_m_inf,
       bvalid_m_inf,
       bready_m_inf,
                    
         arid_m_inf,
       araddr_m_inf,
        arlen_m_inf,
       arsize_m_inf,
      arburst_m_inf,
      arvalid_m_inf,
                    
      arready_m_inf, 
          rid_m_inf,
        rdata_m_inf,
        rresp_m_inf,
        rlast_m_inf,
       rvalid_m_inf,
       rready_m_inf 
);
parameter ID_WIDTH = 4 , ADDR_WIDTH = 32, DATA_WIDTH = 32;
input			  clk,rst_n;



// AXI Interface wire connecttion for pseudo DRAM read/write
/* Hint:
       your AXI-4 interface could be designed as convertor in submodule(which used reg for output signal),
	   therefore I declared output of AXI as wire in Poly_Ring
*/
   
// -----------------------------
// IO port
input [ADDR_WIDTH-1:0]      in_addr_M;
input [ADDR_WIDTH-1:0]      in_addr_G;
input [1:0]  	  		in_dir;
input [3:0]	    		in_dis;
input 			    	in_valid;
output reg 	              out_valid;
// -----------------------------

// axi write address channel 
output  wire  [ID_WIDTH-1:0]     awid_m_inf;		//fixed to 0
output  reg  [ADDR_WIDTH-1:0] awaddr_m_inf;  	//usecase
output  wire [2:0]            awsize_m_inf;		//fixed to 3'b010 (4 Bytes)
output  wire [1:0]           awburst_m_inf;		//fixedto 2'b01 (INCR)
output  wire [3:0]             awlen_m_inf;		//fixed to 4'b1111 (max burst len, 16)
output  reg                  awvalid_m_inf;		//usecase
input   wire                 awready_m_inf;
// axi write data channel 
output  reg  [DATA_WIDTH-1:0]  wdata_m_inf;		//usecase
output  reg                    wlast_m_inf;		//usecase
output  reg                   wvalid_m_inf; 	//usecase
input   wire                  wready_m_inf;
// axi write response channel
input   wire [ID_WIDTH-1:0]      bid_m_inf;
input   wire [1:0]             bresp_m_inf;
input   wire              	  bvalid_m_inf;
output  reg                   bready_m_inf;		//usecase
// -----------------------------
// axi read address channel 
output  wire [ID_WIDTH-1:0]     arid_m_inf;		//fixed to 0
output  reg  [ADDR_WIDTH-1:0] araddr_m_inf;		//usecase
output  wire [3:0]             arlen_m_inf;		//fixed to 4'b1111 (max burst len, 16)
output  wire [2:0]            arsize_m_inf;		//fixed to 3'b010 (4 Bytes)
output  wire [1:0]           arburst_m_inf;		//fixed to 2'b01 (INCR)
output  reg                  arvalid_m_inf;		//usecase
input   wire                 arready_m_inf;
// -----------------------------
// axi read data channel 
input   wire [ID_WIDTH-1:0]      rid_m_inf;
input   wire [DATA_WIDTH-1:0]  rdata_m_inf;
input   wire [1:0]             rresp_m_inf;
input   wire                   rlast_m_inf;
input   wire                  rvalid_m_inf;
output  reg                   rready_m_inf;		//usecase
// -----------------------------

// Ports that have fixed value
// axi write address channel 
assign awid_m_inf 		= 0;
assign awsize_m_inf 	= 3'b010;
assign awburst_m_inf 	= 2'b01;
assign awlen_m_inf		= 4'b1111;
// axi read address channel 
assign arid_m_inf 		= 0;
assign arlen_m_inf 		= 4'b1111;
assign arsize_m_inf		= 3'b010;
assign arburst_m_inf	= 2'b01;


//---------------------------------------------------------------------
// SRAM Instantiation
//---------------------------------------------------------------------
//SRAM that stores the given matrix 16 x 16 5-bit 
wire sram5_wen;
reg  [4-1 : 0] sram5_i, sram5_j;
wire [8-1 : 0] sram5_a = {sram5_i, sram5_j};
wire [5-1 : 0] sram5_d;
wire [5-1 : 0] sram5_q;

RA1SH_5 SRAM_5(.Q(sram5_q),.CLK(clk),.CEN(1'b0),.WEN(sram5_wen),.A(sram5_a),.D(sram5_d),.OEN(1'b0));

//SRAM that stores the GLCM matrix 32 x 32 8-bit
reg sram8_wen;
reg  [ 5-1 : 0] sram8_i, sram8_j;
reg [10-1 : 0] sram8_a;
reg  [ 8-1 : 0] sram8_d;
wire [ 8-1 : 0] sram8_q;

RA1SH_8 SRAM_8(.Q(sram8_q),.CLK(clk),.CEN(1'b0),.WEN(sram8_wen),.A(sram8_a),.D(sram8_d),.OEN(1'b0));

//---------------------------------------------------------------------
// Registers and wire declarations
//---------------------------------------------------------------------
//registers that hold input data
reg [12-1 : 0] addrm, addrg;
reg [ 4-1 : 0] col_offset, row_offset;



// reg dram_haveread;
reg [DATA_WIDTH-1:0]  dram_outbuff;

reg [4-1 : 0] cbase_i, cbase_j;
reg [5-1 : 0] c1o, c1a;
reg [5-1 : 0] c1o_store;
reg [1:0] c1v;
reg [5-1 : 0] c2o, c2a;
reg [1:0] c2v;


wire [4-1 : 0] cbase_ioff = cbase_i + row_offset;
wire [4-1 : 0] cbase_joff = cbase_j + col_offset;

wire [8-1 : 0] cbase_a = {cbase_i, cbase_j};
wire [8-1 : 0] cbase_aoff = {cbase_ioff, cbase_joff};

reg twoc_equal;

// calculating the address for register read
wire [12-1 : 0] wcaladdr = addrg + {sram8_i, sram8_j};
reg [8-1 : 0] sram8_q_store;

//---------------------------------------------------------------------
// FSM declarations
//---------------------------------------------------------------------
//FSM that's related to memory operations (DRAM , SRAM R/W)
localparam SM_INIT	= 'd0;
localparam SM_RREQ	= 'd1;
localparam SM_RWAIT	= 'd2;
localparam SM_RGOT	= 'd3;
localparam SM_CALC = 'd4;
localparam SM_CALR = 'd5;
localparam SM_WREQ  = 'd6;
localparam SM_WSEND  = 'd7;
localparam SM_WDE = 'd8;
localparam SM_WCONFIRM  = 'd9;
localparam SM_OUTPUT = 'd10;
reg [3 : 0] sm_cs, sm_ns;
//reg [3 : 0] sm_cnt; // counter specifically aids sm rotations

//FSM that's related to calculations
localparam SC_INIT	= 'd0;
localparam SC_CALO	= 'd1;
localparam SC_STAL  = 'd2;
localparam SC_RRWW  = 'd3;
localparam SC_LRW	= 'd4;
localparam SC_DONE  = 'd5;
reg [2 : 0] sc_cs, sc_ns;
reg [1 : 0] sc_cnt;
reg sc_cnt_last;

always@(posedge clk or negedge rst_n) begin
	if(!rst_n)begin
		sm_cs <= SM_INIT;
		sc_cs <= SC_INIT;
	end else begin
		sm_cs <= sm_ns;
		sc_cs <= sc_ns;
	end
end

always@(*) begin
    case(sm_cs)
		SM_INIT: sm_ns = (in_valid)? SM_RREQ : SM_INIT;
		SM_RREQ: sm_ns = (arready_m_inf)? SM_RWAIT : SM_RREQ;
		SM_RWAIT: sm_ns = (rvalid_m_inf)? SM_RGOT : SM_RWAIT;

		SM_RGOT:begin
			if(sram5_a == 8'b1111_1111) sm_ns = SM_CALC;
			else if(sram5_a[5:0] == 6'b11_1111) sm_ns = SM_RREQ;
			else  sm_ns = SM_RGOT;
		end
		SM_CALC: sm_ns = (sc_cs == SC_RRWW && ~sc_cnt[0] && cbase_aoff == 8'b1111_1111)? SM_CALR : SM_CALC;
		SM_CALR: sm_ns = (sc_cs == SC_LRW && sc_cnt == 2'd3) ? SM_WREQ : SM_CALR;
		SM_WREQ: sm_ns = (awready_m_inf)? SM_WSEND : SM_WREQ;
		SM_WSEND: sm_ns = (sram8_i[0] && sram8_j == 5'b11111)? SM_WDE : SM_WSEND;
		SM_WDE: sm_ns = (sc_cnt == 2'd3 && wready_m_inf)? SM_WCONFIRM : SM_WDE;
		SM_WCONFIRM:begin
			if(bvalid_m_inf)begin // bresp_m_inf could only be 2'b00(OK)
				sm_ns = (sram8_i == 5'd0 && sram8_j == 5'd0)? SM_OUTPUT : SM_WREQ;
			end else begin
				sm_ns = SM_WCONFIRM;
			end
		end
		SM_OUTPUT: sm_ns = SM_INIT;
		default: sm_ns = SM_INIT;
    endcase
end
always @(*) begin
	case (sc_cs)
		SC_INIT: sc_ns = (in_valid)? SC_CALO : SC_INIT;
		SC_CALO:begin
			if(sram8_a == 10'b11_1111_1111)begin
				if(sm_cs == SM_CALC)begin
					sc_ns = SC_RRWW;
				end else begin
					sc_ns = SC_STAL;
				end
			end else begin
				sc_ns = SC_CALO;
			end 
		end
		SC_STAL: sc_ns = (sm_cs == SM_CALC)? SC_RRWW : SC_STAL;
		SC_RRWW: sc_ns = (sm_cs == SM_CALR && sc_cnt == 2'd3)? SC_LRW : SC_RRWW;
		SC_LRW : sc_ns = (sc_cnt == 2'd3)? SC_DONE : SC_LRW;
		SC_DONE: sc_ns = (sm_cs == SM_OUTPUT)? SC_INIT : SC_DONE;
		default: sc_ns = SC_INIT;
	endcase
end

always @(posedge clk or negedge rst_n) begin
	
	if(!rst_n) sc_cnt <= 0;
	else if(sc_cs == SC_INIT) sc_cnt <= 0;
	else if(sc_cs == SC_RRWW || sc_cs == SC_LRW) sc_cnt <= sc_cnt + 1;
	else if(sm_cs == SM_WREQ)begin
		if(awready_m_inf) sc_cnt <= 0;
		else sc_cnt <= (sc_cnt == 2)? sc_cnt  : sc_cnt + 1;
	end else if(sm_cs == SM_WSEND || sm_cs == SM_WDE) begin
		if(sc_cnt == 2'd3) sc_cnt <= (wready_m_inf)? sc_cnt+1 : sc_cnt;
		else sc_cnt <= sc_cnt + 1;
	end
		
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n) sc_cnt_last <= 0;
	else sc_cnt_last <= sc_cnt[0];
end

//store input data
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)begin
		addrm <= 0;
		addrg <= 0;
		col_offset <= 0;
		row_offset <= 0;
	end else if(sm_cs == SM_INIT && in_valid)begin
		addrm <= in_addr_M[11 : 0];
		addrg <= in_addr_G[11 : 0];
		row_offset <= (in_dir[0])? in_dis : 0;
		col_offset <= (in_dir[1])? in_dis : 0;
	end
end

//signals controling the AXI interface to DRAM

//AXI Write address channel
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)begin
		awaddr_m_inf <= 0;
		awvalid_m_inf <= 0;
	end else begin
		case (sm_cs)
			SM_CALR:begin
				if(sc_cs == SC_LRW && sc_cnt == 2'd3)begin
					awaddr_m_inf <= (sc_cnt == 0) ? {20'h0000_2, wcaladdr[11:6], addrg[5:0]} : awaddr_m_inf;
					awvalid_m_inf <= 1;
				end
			end
			SM_WREQ:begin
				if(~awready_m_inf)begin
					awaddr_m_inf <= (sc_cnt == 0) ? {20'h0000_2, wcaladdr[11:6], addrg[5:0]} : awaddr_m_inf;
					awvalid_m_inf <= 1;
				end else begin
					awaddr_m_inf <= 0;
					awvalid_m_inf <= 0;
				end
			end

		endcase
	end
end

//AXI Write data channel
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)begin
		wdata_m_inf <= 0;
		wlast_m_inf <= 0;
		wvalid_m_inf <= 0;
	end else begin
		case (sm_cs)
			SM_INIT:begin
				wdata_m_inf <= 0;
				wlast_m_inf <= 0;
				wvalid_m_inf <= 0;
			end
			SM_WREQ:begin
				if(sc_cnt != 2) wdata_m_inf <= {sram8_q, wdata_m_inf[31 : 8]};
			end
			SM_WSEND:begin
				case (sc_cnt)
					2'd0, 2'd1: begin
						wdata_m_inf <= {sram8_q, wdata_m_inf[31 : 8]};
					end

					2'd2:begin
						wvalid_m_inf <= 1;
						wdata_m_inf <= {sram8_q, wdata_m_inf[31 : 8]};
						
					end
					2'd3:begin

						if(sc_cnt_last == 1'b0) begin
							//first 2'd3 cycle
							if(wready_m_inf)begin
								wdata_m_inf <= {sram8_q, wdata_m_inf[31 : 8]};
								wvalid_m_inf <= 0;
							end
						end else if (wready_m_inf)begin
							//last stalling cycles
							wdata_m_inf <= {sram8_q, sram8_q_store, wdata_m_inf[31 : 8]};
							wvalid_m_inf <= 0;
						end
						
						
					end
				endcase
			end
			SM_WDE:begin
				case (sc_cnt)
					2'd0, 2'd1: begin
						wdata_m_inf <= {sram8_q, wdata_m_inf[31 : 8]};
					end

					2'd2:begin
						wvalid_m_inf <= 1;
						wdata_m_inf <= {sram8_q, wdata_m_inf[31 : 8]};
						wlast_m_inf <= 1;
					end
					2'd3:begin

						if(sc_cnt_last == 1'b0) begin
							//first 2'd3 cycle
							if(wready_m_inf)begin
								wdata_m_inf <= {sram8_q, wdata_m_inf[31 : 8]};
								wvalid_m_inf <= 0;
								wlast_m_inf <= 0;
							end
						end else if (wready_m_inf)begin
							//last stalling cycles
							wdata_m_inf <= {sram8_q, sram8_q_store, wdata_m_inf[31 : 8]};
							wvalid_m_inf <= 0;
							wlast_m_inf <= 0;
						end
						
						
					end
				endcase
			end
		endcase
	end
end

//AXI Write response channel
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)begin
		bready_m_inf <= 0;
	end else begin
		case(sm_cs)
			SM_WDE: bready_m_inf <= (sm_ns == SM_WCONFIRM)? 1 : 0;
			SM_WCONFIRM: bready_m_inf <= (bvalid_m_inf)? 0 : 1;
		endcase
	end
end

//AXI read address channel
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)begin
		araddr_m_inf <= 0;
		arvalid_m_inf <= 0;
	end else begin
		case (sm_cs)
			SM_RREQ:begin
				if(arready_m_inf)begin
					araddr_m_inf <= 0;
					arvalid_m_inf <= 0;
				end else begin
					araddr_m_inf <= {20'h0000_1,addrm} + sram5_a;
					arvalid_m_inf <= 1;
				end

			end
		endcase
	end
end

//AXI read data channel
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)begin
		rready_m_inf <= 0;
	end else begin
		case (sm_cs)
			SM_RGOT:begin
				rready_m_inf <= (sram5_a[1:0] == 2'b01)? 1 : 0;
			end
		endcase
	end
end

//Dram output buffer
always @(posedge clk or negedge rst_n) begin
	if(!rst_n) dram_outbuff <= 0;
	else if((sm_cs == SM_RWAIT && rvalid_m_inf) || (sm_cs == SM_RGOT && sram5_a[1:0]==2'b11)) dram_outbuff <= rdata_m_inf;
	else begin
		dram_outbuff[ 7: 0] <= dram_outbuff[15: 8];
		dram_outbuff[15: 8] <= dram_outbuff[23:16];
		dram_outbuff[23:16] <= dram_outbuff[31:24];
	end
end


//Signals controlling the SRAM_5 16*16 5-bit SRAM

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)begin
		sram5_i <= 0;
		sram5_j <= 0;
	end else begin
		if(sm_cs == SM_INIT)begin
			sram5_i <= 0;
			sram5_j <= 0;
		end else if(sm_cs == SM_RGOT)begin
			if((sram5_a == 8'b1111_1111))begin
				sram5_i <= 0;
				sram5_j <= 0;
			end else begin
				{sram5_i, sram5_j} <= sram5_a + 1;
			end 
		end else if(sc_cs == SC_RRWW)begin
			//this is the read matrix part:
			case (sc_cnt)
				2'd0: {sram5_i, sram5_j} <= cbase_aoff;
				2'd1: {sram5_i, sram5_j} <= cbase_a;
				2'd2: {sram5_i, sram5_j} <= cbase_aoff;
				2'd3: {sram5_i, sram5_j} <= cbase_a;
			endcase
		end
		
	end
end

assign sram5_wen = (sm_cs != SM_RGOT);
assign sram5_d = dram_outbuff[4:0];

//signals aiding the process in SC_RRWW
always @(posedge clk or negedge rst_n)begin
	if(!rst_n) {cbase_i, cbase_j} <= 0;
	else begin
		case(sc_cs)
			SC_CALO: {cbase_i, cbase_j} <= 0;
			SC_RRWW:begin
				case (sc_cnt)
					2'd0, 2'd2:begin
						if(cbase_aoff == 8'b1111_1111)begin
							// we have reached the end...
							cbase_i <= cbase_i;
							cbase_j <= cbase_j;
						end else if(cbase_joff == 4'b1111)begin
							// smack that newline real hard!
							cbase_i <= cbase_i + 1;
							cbase_j <= 0;
						end else begin
							cbase_j <= cbase_j + 1;
						end
					end
				endcase
			end
		endcase
	end
end

//Signals controlling the SRAM_8 32*32 8-bit SRAM
always @(*)begin
	case (sc_cs)
		SC_CALO: sram8_wen = 0;
		SC_RRWW, SC_LRW:begin
			case (sc_cnt)
				2'd0, 2'd1: sram8_wen = 1;
				2'd2: sram8_wen = (c1v[1])? 1'd0 : 1'd1;
				2'd3: sram8_wen = (c2v[1])? 1'd0 : 1'd1;
			endcase
		end
		default: sram8_wen = 1;
	endcase
end
always @(posedge clk or negedge rst_n) begin
	if(!rst_n) {sram8_i, sram8_j} <= 0;
	else begin
		if(sc_cs == SC_INIT) {sram8_i, sram8_j} <= 0;
		else if(sc_cs == SC_CALO) {sram8_i, sram8_j} <= {sram8_i, sram8_j} + 1;
		else if(sm_cs == SM_CALR) {sram8_i, sram8_j} <= 0;
		else if(sm_cs == SM_WREQ && (sc_cnt ==0 || awready_m_inf))begin
			{sram8_i, sram8_j} <= {sram8_i, sram8_j} + 1;
		end
		else if(sm_cs == SM_WSEND)begin
			if(sc_cnt == 2'd3)begin
				if(wready_m_inf) {sram8_i, sram8_j} <= {sram8_i, sram8_j} + 1;
			end else begin
				{sram8_i, sram8_j} <= {sram8_i, sram8_j} + 1;
			end
		end
	end
end
always @(posedge clk or negedge rst_n)begin
	if(!rst_n) sram8_d <= 0;
	else begin
		case (sc_cs)
			SC_INIT: sram8_d <= 0; 
			SC_RRWW, SC_LRW: begin
				case (sc_cnt)
					2'd1: sram8_d <= sram8_q + 1;
					2'd2: sram8_d <= (twoc_equal)? sram8_q+2 : sram8_q+1;
				endcase
			end
		endcase
	end
end
always @(*) begin
	if(sc_cs == SC_RRWW || sc_cs == SC_LRW)begin
		case (sc_cnt)
			2'd0: sram8_a = {c1o, c1a}; 
			2'd1: sram8_a = {c2o, c2a};
			2'd2: sram8_a = {c1o_store, c1a};
			2'd3: sram8_a = {c2o,c2a};
		endcase
	end else begin
		sram8_a = {sram8_i, sram8_j};
	end
end
always @(posedge clk or negedge rst_n)begin
	if(!rst_n) sram8_q_store <= 0;
	else if(sc_cnt == 3 && sc_cnt_last == 1'b0)begin
		sram8_q_store <= sram8_q;
	end
end


always @(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		{c1o, c1a} <= 0;
		c1o_store <= 0;
		c1v <= 0;
		{c2o, c2a} <= 0;
		c2v <= 0;
		twoc_equal <= 0;
	end else if (sc_cs == SC_CALO)begin
		{c1o, c1a} <= 0;
		c1o_store <= 0;
		c1v <= 0;
		{c2o, c2a} <= 0;
		c2v <= 0;
		twoc_equal <= 0;
	end else if(sc_cs == SC_RRWW || sc_cs == SC_LRW)begin
		case (sc_cnt)
			2'd0:begin
				c1v[0] <= (cbase_aoff == 8'b1111_1111 && sm_cs == SM_CALR)? 1'b0 : 1'b1;
				c2a <= sram5_q;
			end
			2'd1:begin
				c1o <= sram5_q;
				c1o_store <= c1o;
				twoc_equal <= (c1o == c2o && c1a == c2a)? 1'b1 : 1'b0;
			end
			2'd2:begin
				c2v[0] <= (cbase_aoff == 8'b1111_1111 && sm_cs == SM_CALR)? 1'b0 : 1'b1;
				c1a <= sram5_q;
			end
			2'd3:begin
				c2o <= sram5_q;
				c1v[1] <= c1v[0];
				c2v[1] <= c2v[0];
			end
		endcase
	end
end



// output logic
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) out_valid <= 0;
    else out_valid <= (sm_cs == SM_WCONFIRM && bvalid_m_inf && sram8_i == 5'd0 && sram8_j == 5'd0)? 1'b1 : 1'b0;
end

endmodule








