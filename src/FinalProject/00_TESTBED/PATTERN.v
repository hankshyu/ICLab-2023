//////////////////////////////////////////////////////////////////////////////////
//  Engineer:        Tzu-Han Hsu
//  Create Date:     05/26/2023 10:42:52 PM
//  Module Name:     PATTERN
//  Project Name:    Customized ISA Processor [ICLAB2023 Spring Final Project]
//  HDL(Version):    Verilog-2001
//
//  Dependencies:    MEM_MAP_define.v, pseudo_DRAM_data.v, pseudo_DRAM_inst.v, TESTBED.v
//
//////////////////////////////////////////////////////////////////////////////////
//  Description:     1. Tests CPU.v
//
//////////////////////////////////////////////////////////////////////////////////
//  Revision:
//  05/26/2023 - Build gloden answers
//  05/27/2023 - Infrastructure finish, execute instrucitons ok.
//  05/27/2023 - Register file access ok.
//  05/28/2023 - Answer verify feature complete.
//  06/03/2023 - Fix negedge clock bug
//  06/04/2023 - Add CPI calculating feature
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
`define CYCLE_TIME 20.0
`elsif GATE
`define CYCLE_TIME 20.0
`elsif CHIP
`define CYCLE_TIME 20.0
`elsif POST
`define CYCLE_TIME 20.0
`endif

`define CYCLE_TIME_DATA 10

`ifdef FUNC
`define PAT_NUM 1
`endif
`ifdef PERF
`define PAT_NUM 1
`endif


`include "../00_TESTBED/MEM_MAP_define.v"
`include "../00_TESTBED/pseudo_DRAM_data.v"
`include "../00_TESTBED/pseudo_DRAM_inst.v"

module PATTERN(
    			clk,
			  rst_n,
		   IO_stall,


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

//---------------------------------------------------------------------
//   PORT DECLARATION          
//---------------------------------------------------------------------
parameter ID_WIDTH=4, DATA_WIDTH=16, ADDR_WIDTH=32, DRAM_NUMBER=2, WRIT_NUMBER=1;

output reg			  clk,rst_n;
input				IO_stall;

// axi write address channel 
input wire [WRIT_NUMBER * ID_WIDTH-1:0]        awid_s_inf;
input wire [WRIT_NUMBER * ADDR_WIDTH-1:0]    awaddr_s_inf;
input wire [WRIT_NUMBER * 3 -1:0]            awsize_s_inf;
input wire [WRIT_NUMBER * 2 -1:0]           awburst_s_inf;
input wire [WRIT_NUMBER * 7 -1:0]             awlen_s_inf;
input wire [WRIT_NUMBER-1:0]                awvalid_s_inf;
output wire [WRIT_NUMBER-1:0]               awready_s_inf;
// axi write data channel 
input wire [WRIT_NUMBER * DATA_WIDTH-1:0]     wdata_s_inf;
input wire [WRIT_NUMBER-1:0]                  wlast_s_inf;
input wire [WRIT_NUMBER-1:0]                 wvalid_s_inf;
output wire [WRIT_NUMBER-1:0]                wready_s_inf;
// axi write response channel
output wire [WRIT_NUMBER * ID_WIDTH-1:0]         bid_s_inf;
output wire [WRIT_NUMBER * 2 -1:0]             bresp_s_inf;
output wire [WRIT_NUMBER-1:0]             	  bvalid_s_inf;
input wire [WRIT_NUMBER-1:0]                  bready_s_inf;
// -----------------------------
// axi read address channel 
input wire [DRAM_NUMBER * ID_WIDTH-1:0]       arid_s_inf;
input wire [DRAM_NUMBER * ADDR_WIDTH-1:0]   araddr_s_inf;
input wire [DRAM_NUMBER * 7 -1:0]            arlen_s_inf;
input wire [DRAM_NUMBER * 3 -1:0]           arsize_s_inf;
input wire [DRAM_NUMBER * 2 -1:0]          arburst_s_inf;
input wire [DRAM_NUMBER-1:0]               arvalid_s_inf;
output wire [DRAM_NUMBER-1:0]              arready_s_inf;
// -----------------------------
// axi read data channel 
output wire [DRAM_NUMBER * ID_WIDTH-1:0]         rid_s_inf;
output wire [DRAM_NUMBER * DATA_WIDTH-1:0]     rdata_s_inf;
output wire [DRAM_NUMBER * 2 -1:0]             rresp_s_inf;
output wire [DRAM_NUMBER-1:0]                  rlast_s_inf;
output wire [DRAM_NUMBER-1:0]                 rvalid_s_inf;
input wire [DRAM_NUMBER-1:0]                  rready_s_inf;
// -----------------------------

////////////////////////////////////////////////
// Pigments
////////////////////////////////////////////////
reg[9*8:1]  reset_color  = "\033[1;0m";
reg[10*8:1] black_txtpf  = "\033[1;30m";
reg[10*8:1] red_txtpf    = "\033[1;31m";
reg[10*8:1] green_txtpf  = "\033[1;32m";
reg[10*8:1] yellow_txtpf = "\033[1;33m";
reg[10*8:1] blue_txtpf   = "\033[1;34m";
reg[10*8:1] purple_txtpf = "\033[1;35m";
reg[10*8:1] cyan_txtpf   = "\033[1;36m";
reg[10*8:1] gray_txtpf   = "\033[1;37m";
reg[10*8:1] white_txtpf  = "\033[1;38m";

////////////////////////////////////////////////
// PARAM declaraton (change here if not developer)
////////////////////////////////////////////////
parameter SEED 	= 17;
parameter PRINT_CAL = 1; // Turn this to 1 for detailed info, 0 for GATE-sim, POST-sim...

////////////////////////////////////////////////
// Integer declaraton
////////////////////////////////////////////////
integer data_file_ptr, instr_file_ptr; //file control

integer i, j, k, idx, jdx, kdx, ddx;
real	CYCLE = `CYCLE_TIME;


parameter DEV_PATTERN = 0; // Turn on developer mode
integer PATNUM 	= 265; // one PATNUNM includes 10 instructions
integer patcount;
integer instr10_count;
integer lat,total_latency, pat_latency;
integer lat_array [10-1 : 0];

`ifdef RTL
	`define CHECK_REG_MODE_1
`elsif GATE
	`define CHECK_REG_MODE_1
`elsif CHIP
	`define CHECK_REG_MODE_2
`elsif POST
	`define CHECK_REG_MODE_2
`endif

////////////////////////////////////////////////
// Reg & Wire declaraton
////////////////////////////////////////////////

reg signed [16-1 : 0] gdata_DRAM [0 : 2048-1];	// read the value 
reg  [16-1 : 0] ginstr_DRAM [0 : 2048-1];

reg [31: 0] buffer_addr; // trash addr reader
reg signed [5-1 : 0] pimm_value;

reg signed [16-1 : 0] gregfile [0 : 16-1];
reg signed [16-1 : 0] old_rs, old_rt, old_rd, old_ddram;
reg [16-1 : 0] last_dram_addr, fut_dram_addr;

reg [12-1 : 0] pc;
reg [16-1 : 0] instruction;
reg [4-1 : 0] rs, rt, rd;
reg signed [5-1 : 0] immediate;
reg [13-1 : 0] address; 

integer instruction_type;
integer ddram_error;

////////////////////////////////////////////////
// Instruction DRAM declaration
////////////////////////////////////////////////
pseudo_DRAM_inst pINST_DRAM(
  	.clk(clk),
  	.rst_n(rst_n),
	/* slave interface */
    // axi write address channel 
    // src master
    .awid_s_inf(),
    .awaddr_s_inf(),
    .awsize_s_inf(),
    .awburst_s_inf(),
    .awlen_s_inf(),
    .awvalid_s_inf(),
    // src slave
    .awready_s_inf(),
    
    // axi write data channel 
    // src master
    .wdata_s_inf(),
    .wlast_s_inf(),
    .wvalid_s_inf(),
    // src slave
    .wready_s_inf(),
   
    // axi write response channel 
    // src slave
    .bid_s_inf(),
    .bresp_s_inf(),
    .bvalid_s_inf(),
    // src master 
    .bready_s_inf(),
    // -----------------------------
   
    // axi read address channel 
    // src master
    .arid_s_inf(arid_s_inf[DRAM_NUMBER*ID_WIDTH -1 : ID_WIDTH]),
    .araddr_s_inf(araddr_s_inf[DRAM_NUMBER*ADDR_WIDTH -1 : ADDR_WIDTH]),
    .arlen_s_inf(arlen_s_inf[DRAM_NUMBER*7 -1 : 7]),
    .arsize_s_inf(arsize_s_inf[DRAM_NUMBER*3 -1 : 3]),
    .arburst_s_inf(arburst_s_inf[DRAM_NUMBER*2 -1 : 2]),
    .arvalid_s_inf(arvalid_s_inf[1]),
    // src slave
    .arready_s_inf(arready_s_inf[1]),
    // -----------------------------
   
    // axi read data channel 
    // slave
    .rid_s_inf(rid_s_inf[DRAM_NUMBER * ID_WIDTH-1 : ID_WIDTH]),
    .rdata_s_inf(rdata_s_inf[DRAM_NUMBER * DATA_WIDTH-1 : DATA_WIDTH]),
    .rresp_s_inf(rresp_s_inf[DRAM_NUMBER * 2 -1 : 2]),
    .rlast_s_inf(rlast_s_inf[1]),
    .rvalid_s_inf(rvalid_s_inf[1]),
    // master
    .rready_s_inf(rready_s_inf[1])
);

////////////////////////////////////////////////
// Data DRAM declaration
////////////////////////////////////////////////
pseudo_DRAM_data pDATA_DRAM(
  	.clk(clk),
  	.rst_n(rst_n),
	/* slave interface */
    // axi write address channel 
    // src master
    .awid_s_inf(awid_s_inf),
    .awaddr_s_inf(awaddr_s_inf),
    .awsize_s_inf(awsize_s_inf),
    .awburst_s_inf(awburst_s_inf),
    .awlen_s_inf(awlen_s_inf),
    .awvalid_s_inf(awvalid_s_inf),
    // src slave
    .awready_s_inf(awready_s_inf),
    
    // axi write data channel 
    // src master
    .wdata_s_inf(wdata_s_inf),
    .wlast_s_inf(wlast_s_inf),
    .wvalid_s_inf(wvalid_s_inf),
    // src slave
    .wready_s_inf(wready_s_inf),
   
    // axi write response channel 
    // src slave
    .bid_s_inf(bid_s_inf),
    .bresp_s_inf(bresp_s_inf),
    .bvalid_s_inf(bvalid_s_inf),
    // src master 
    .bready_s_inf(bready_s_inf),
    // -----------------------------
   
    // axi read address channel 
    // src master
    .arid_s_inf(arid_s_inf[ID_WIDTH-1 : 0]),
    .araddr_s_inf(araddr_s_inf[ADDR_WIDTH-1 : 0]),
    .arlen_s_inf(arlen_s_inf[7-1 : 0]),
    .arsize_s_inf(arsize_s_inf[3-1 : 0]),
    .arburst_s_inf(arburst_s_inf[2-1 : 0]),
    .arvalid_s_inf(arvalid_s_inf[0]),
    // src slave
    .arready_s_inf(arready_s_inf[0]),
    // -----------------------------
   
    // axi read data channel 
    // slave
    .rid_s_inf(rid_s_inf[ID_WIDTH-1 : 0]),
    .rdata_s_inf(rdata_s_inf[DATA_WIDTH-1 : 0]),
    .rresp_s_inf(rresp_s_inf[2-1 : 0]),
    .rlast_s_inf(rlast_s_inf[0]),
    .rvalid_s_inf(rvalid_s_inf[0]),
    // master
    .rready_s_inf(rready_s_inf[0])
);

//---------------------------------------------------------------------
//   CLOCK GENERATION
//---------------------------------------------------------------------
initial clk = 0;
always #(CYCLE/2.0) clk = ~clk;

////////////////////////////////////////////////
// Main Program
////////////////////////////////////////////////

initial begin
	read_data_DRAM;
	read_instr_DRAM;
	// print_all_data_DRAM;
	// print_all_instr_DRAM;
	
	rst_n = 1'b1;
	force clk = 0;

	reset_signal_task; //This would release clk
	total_latency = 0;
	for(i = 0; i < 16; i = i+1)begin
		gregfile[i] = 0;
	end
	pc = 0;
	last_dram_addr = 16'h1000;
	for(patcount = 1; patcount <= PATNUM; patcount = patcount + 1)begin
		pat_latency = 0;
		instr10_count = 0;

		for(instr10_count = 0; instr10_count < 10; instr10_count = instr10_count + 1)begin
			lat = 0;
			execute_instructon;
			while(IO_stall !== 0) begin
				lat = lat + 1;
				if(lat == 2000) begin//wait limit
					$display("***************************************************************");
					$display("*                       %0sCPU_FAIL%0s                              *",red_txtpf,reset_color);
					$display("*         The execution latency are over 2,000 cycles.        *");
					$display("***************************************************************");	
					repeat(2)@(negedge clk);
					$finish;
				end
				@(negedge clk);
			end
			if(DEV_PATTERN == 0) checkans_regfile;
			lat_array[instr10_count] = lat;
			pat_latency = pat_latency + lat;
			if(instr10_count < 9) @(negedge clk); // added to solve bug
		end
		if(DEV_PATTERN == 0) checkans_dram;
		
		if(PRINT_CAL == 1)begin
			$display("%0sPASS PATTERN #%4d, [%4d, %4d, %4d, %4d, %4d, %4d, %4d, %4d, %4d, %4d] %5d%0s",yellow_txtpf,patcount,
			lat_array[0], lat_array[1], lat_array[2], lat_array[3], lat_array[4],
			lat_array[5], lat_array[6], lat_array[7], lat_array[8], lat_array[9], pat_latency,reset_color);
			$display("");
		end else begin
			$display("%0sPASS PATTERN #%4d%0s\t%0sAVERAGE CYCLES %10.3f%0s",green_txtpf, patcount, reset_color, cyan_txtpf,pat_latency/10.0,reset_color);
		end
		total_latency = total_latency + pat_latency;
		@(negedge clk); // added to solve bug

	end
	
	# (20);
	YOU_PASS_task;
	$finish;
end

////////////////////////////////////////////////
// Tasks
////////////////////////////////////////////////

task read_data_DRAM; begin
	data_file_ptr = $fopen("../00_TESTBED/DRAM/DRAM_data.dat","r");
	for(i = 0; i < 2048; i = i+1)begin
		$fscanf(data_file_ptr, " @%x\n", buffer_addr);
		$fscanf(data_file_ptr, " %x %x\n", gdata_DRAM[i][7 : 0], gdata_DRAM[i][15 : 8]);
	end
	$fclose(data_file_ptr);
end endtask

task read_instr_DRAM; begin
	instr_file_ptr = $fopen("../00_TESTBED/DRAM/DRAM_inst.dat","r");
	for(i = 0; i < 2048; i = i+1)begin
		$fscanf(instr_file_ptr, " @%x\n", buffer_addr);
		$fscanf(instr_file_ptr, " %x %x\n", ginstr_DRAM[i][7 : 0], ginstr_DRAM[i][15 : 8]);
	end
	$fclose(instr_file_ptr);
end endtask


task print_data(input [12-1 : 0] addr ); 
	$display("@%4x[%04x]: %d(0x%x)", (16'h1000+addr*2), addr, gdata_DRAM[addr], gdata_DRAM[addr]);
endtask

task print_all_data_DRAM; begin
	for(i = 0; i < 2048; i = i+1)begin
		print_data(i);
	end
end endtask

task print_instr(input [12-1 : 0] addr ); begin 
	$write("@%4x%0s[%04x]%0s: %02x %02x \t", (16'h1000+addr*2),gray_txtpf,addr,reset_color, ginstr_DRAM[addr][15: 8], ginstr_DRAM[addr][ 7: 0]);
	
	if(ginstr_DRAM[addr][15:13] == 3'b000 || ginstr_DRAM[addr][15:13] == 3'b001)begin
		//R-type
		case({ginstr_DRAM[addr][15:13], ginstr_DRAM[addr][0]})
			4'b000_1: $write("add  ");
			4'b000_0: $write("sub  ");
			4'b001_1: $write("slt  ");
			4'b001_0: $write("mul  ");
		endcase
		$write("r%-2d ", ginstr_DRAM[addr][12: 9]);
		$write("r%-2d ", ginstr_DRAM[addr][ 8: 5]);
		$write("r%-2d",  ginstr_DRAM[addr][ 4: 1]);
	end else if(ginstr_DRAM[addr][15:13] == 3'b011 || ginstr_DRAM[addr][15:13] == 3'b010 || ginstr_DRAM[addr][15:13] == 3'b101)begin
		//I-type
		case(ginstr_DRAM[addr][15:13])
			3'b011: $write("lw   ");
			3'b010: $write("sw   ");
			3'b101: $write("beq  ");
		endcase
		$write("r%-2d ", ginstr_DRAM[addr][12: 9]);
		$write("r%-2d ", ginstr_DRAM[addr][ 8: 5]);
		pimm_value = ginstr_DRAM[addr][ 4: 0];
		$write("%0s%3d%0s", white_txtpf,pimm_value, reset_color);
	end else if(ginstr_DRAM[addr][15:13] == 3'b100)begin
		$write("j    ");
		$write("@%4x%0s[%04x]%0s",ginstr_DRAM[addr][12:0],gray_txtpf,ginstr_DRAM[addr][11:1],reset_color);
	end else begin // parsed incorrect istruction!
		$display("%0s[ERROR]%0s Incorrect instruction @ print_instr!!",red_txtpf, reset_color);
		$finish;
	end
	$display("");
end endtask

task print_all_instr_DRAM; begin
	for(i = 0; i < 50; i = i+1)begin
		print_instr(i);
	end
end endtask

task reset_signal_task; begin 
    #(0.5);  rst_n=0;
    #(CYCLE/2);
    if(IO_stall !== 1'b1) begin
		$display("*****************************************************************");
		$display("*                       %0sCPU_FAIL%0s                                *",red_txtpf,reset_color);
		$display("*   Output signal %0sIO_stall%0s should be 1 after initial RESET      *",cyan_txtpf, reset_color);
		$display("*****************************************************************");
		$finish;
    end
	
	if((awaddr_s_inf!==0)||(awsize_s_inf!==3'b001)||(awburst_s_inf!==2'b01)||(awvalid_s_inf!==0))begin
		$display("**********************************************************************************");
		$display("*                                    %0sCPU_FAIL%0s                                    *",red_txtpf,reset_color);
		$display("*   AXI Output signal group: %0sWrite Address%0s fails to RESET                        *",cyan_txtpf,reset_color);
		$display("**********************************************************************************");
		$finish;
	end else if((wdata_s_inf!==0)||(wlast_s_inf!==0)||(wvalid_s_inf!==0))begin
		$display("**********************************************************************************");
		$display("*                       %0sCPU_FAIL%0s                                        *",red_txtpf,reset_color);
		$display("*   AXI Output signal group: %0sWrite Data%0s fails to RESET                  *",cyan_txtpf,reset_color);
		$display("**********************************************************************************");
		$finish;
	end else if(bready_s_inf !== 0)begin
		$display("**********************************************************************************");
		$display("*                       %0sCPU_FAIL%0s                                *",red_txtpf,reset_color);
		$display("*   AXI Output signal group: %0sWrite Respnse%0s fails to RESET       *",cyan_txtpf,reset_color);
		$display("**********************************************************************************");
		$finish;
	end else if((arid_s_inf!==0)||(araddr_s_inf!==0)||(arsize_s_inf!==6'b001001)||(arburst_s_inf!==4'b0101)||(arvalid_s_inf!==0))begin
		$display("**********************************************************************************");
		$display("*                       %0sCPU_FAIL%0s                                *",red_txtpf,reset_color);
		$display("*   AXI Output signal group: %0sRead Address%0s fails to RESET        *",cyan_txtpf,reset_color);
		$display("**********************************************************************************");
		$finish;
	end else if((rdata_s_inf!==0)||(rresp_s_inf!==0)||(rlast_s_inf!==0)||(rvalid_s_inf!==0))begin
		$display("**********************************************************************************");
		$display("*                       %0sCPU_FAIL%0s                                *",red_txtpf,reset_color);
		$display("*   AXI Output signal group: %0sRead Data%0s fails to RESET           *",cyan_txtpf,reset_color);
		$display("**********************************************************************************");
		$finish;
	end
    #(10);  rst_n=1;
    #(3);  release clk;
end endtask

task execute_instructon;begin
	//decode
	instruction = ginstr_DRAM[pc];
	rs = instruction[12 : 9];
	rt = instruction[ 8 : 5];
	rd = instruction[ 4 : 1];
	immediate = instruction[4 : 0];
	address = instruction[12 : 0];
	
	old_rs = gregfile[rs];
	old_rt = gregfile[rt];
	old_rd = gregfile[rd];
	if(instruction[15:13] == 3'b000 || instruction[15:13] == 3'b001)begin
		instruction_type = 1;
		//R-type

		case({instruction[15:13], instruction[0]})
			4'b000_1:begin
				if((gregfile[rs]+gregfile[rt] > 32767) || (gregfile[rs]+gregfile[rt] < -32768))begin
					$display("Pattern overflowed!! PC: %d", pc);
					$display("Instruction: add r%d r%d r%d", rs, rt, rd);
					$display("r%d = %d", rs, gregfile[rs]);
					$display("r%d = %d", rt, gregfile[rt]);
					$display("Overflowed answer: (r%d) = %d", rd, gregfile[rs]+gregfile[rt]);
					# (2);
					$finish;
				end
				gregfile[rd] = gregfile[rs] + gregfile[rt];
				if(PRINT_CAL)begin
					$display("%0s[PC-%04x]%0s %0sadd\tr%d%0s(%d) %0sr%d%0s(%d) %0sr%d%0s(%d -> %d)",purple_txtpf,pc,reset_color,cyan_txtpf,rs,reset_color,old_rs,
					cyan_txtpf,rt,reset_color,old_rt,cyan_txtpf,rd,reset_color,old_rd, gregfile[rd]);
				end
				pc = pc + 1;
			end
			4'b000_0:begin
				if((gregfile[rs]+gregfile[rt] > 32767) || (gregfile[rs]+gregfile[rt] < -32768))begin
					$display("Pattern overflowed!! PC: %d", pc);
					$display("Instruction: sub r%d r%d r%d", rs, rt, rd);
					$display("r%d = %d", rs, gregfile[rs]);
					$display("r%d = %d", rt, gregfile[rt]);
					$display("Overflowed answer: (r%d) = %d", rd, gregfile[rs]-gregfile[rt]);
					# (2);
					$finish;
				end
				gregfile[rd] = gregfile[rs] - gregfile[rt];
				if(PRINT_CAL)begin
					$display("%0s[PC-%04x]%0s %0ssub\tr%d%0s(%d) %0sr%d%0s(%d) %0sr%d%0s(%d -> %d)",purple_txtpf,pc,reset_color,cyan_txtpf,rs,reset_color,old_rs,
					cyan_txtpf,rt,reset_color,old_rt,cyan_txtpf,rd,reset_color,old_rd, gregfile[rd]);
				end
				pc = pc + 1;
			end 
			4'b001_1:begin
				if(gregfile[rs] < gregfile[rt]) gregfile[rd] = 1;
				else gregfile[rd] = 0;
				
				if(PRINT_CAL)begin
					$display("%0s[PC-%04x]%0s %0sslt\tr%d%0s(%d) %0sr%d%0s(%d) %0sr%d%0s(%d -> %d)",purple_txtpf,pc,reset_color,cyan_txtpf,rs,reset_color,old_rs,
					cyan_txtpf,rt,reset_color,old_rt,cyan_txtpf,rd,reset_color,old_rd, gregfile[rd]);
				end

				pc = pc + 1;
			end
			4'b001_0:begin
				//check pattern would never overflow...
				if((gregfile[rs]*gregfile[rt] > 32767) || (gregfile[rs]*gregfile[rt] <-32768))begin
					$display("Pattern overflowed!! PC: %d", pc);
					$display("Instruction: mul r%d r%d r%d", rs, rt, rd);
					$display("r%d = %d", rs, gregfile[rs]);
					$display("r%d = %d", rt, gregfile[rt]);
					# (2);
					$finish;
				end
				gregfile[rd] = gregfile[rs]*gregfile[rt];
				if(PRINT_CAL)begin
					$display("%0s[PC-%04x]%0s %0smul\tr%d%0s(%d) %0sr%d%0s(%d) %0sr%d%0s(%d -> %d)",purple_txtpf,pc,reset_color,cyan_txtpf,rs,reset_color,old_rs,
					cyan_txtpf,rt,reset_color,old_rt,cyan_txtpf,rd,reset_color,old_rd, gregfile[rd]);
				end
				pc = pc + 1;
			end 
		endcase

	end else if(instruction[15:13] == 3'b011 || instruction[15:13] == 3'b010 || instruction[15:13] == 3'b101)begin
		//I-type
		case(instruction[15:13])
			3'b011:begin
				instruction_type = 2;
				fut_dram_addr =  (gregfile[rs]+immediate)*2 + 4096;
				if((gregfile[rs]+immediate > 2047) || (gregfile[rs]+immediate < 0))begin
					$display("Pattern overflowed!! PC: %d", pc);
					$display("Instruction: lw r%d r%d %d", rs, rt, immediate);
					$display("Invalid fetching: %d(@%04x)",gregfile[rs]+immediate, fut_dram_addr);
					# (2);
					$finish;
				end
				if(fut_dram_addr > last_dram_addr)begin
					if(fut_dram_addr - last_dram_addr > 64)begin
						$display("Pattern violate data dependency prediction!");
						$display("[PC-%04x] lw r%d r%d %d",pc, rs, rt, immediate);
						$display("Last    fetching: (@%04x)",last_dram_addr);
						$display("Invalid fetching: %d(@%04x)",gregfile[rs]+immediate, fut_dram_addr);
						# (2);
						$finish;
					end
				end else if(fut_dram_addr < last_dram_addr)begin
					if(last_dram_addr - fut_dram_addr > 62)begin
						$display("Pattern violate data dependency prediction!");
						$display("[PC-%04x] lw r%d r%d %d",pc, rs, rt, immediate);
						$display("Last    fetching: (@%04x)",last_dram_addr);
						$display("Invalid fetching: %d(@%04x)",gregfile[rs]+immediate, fut_dram_addr);
						# (2);
						$finish;
					end
				end
				gregfile[rt] = gdata_DRAM[gregfile[rs]+immediate];
				if(PRINT_CAL)begin
					$display("%0s[PC-%04x]%0s %0slw\tr%d%0s(%d) %0sr%d%0s(%d -> %d) %0s%d%0s(%d(@%04x))",purple_txtpf,pc,reset_color,cyan_txtpf,rs,reset_color,old_rs,
					cyan_txtpf,rt,reset_color,old_rt,gregfile[rt],cyan_txtpf,immediate,reset_color, gregfile[rs]+immediate, (gregfile[rs]+immediate)*2 + 4096);
				end
				last_dram_addr = fut_dram_addr;
				pc = pc + 1;
			end 
			3'b010:begin
				instruction_type = 2;
				fut_dram_addr =  (gregfile[rs]+immediate)*2 + 4096;
				if((gregfile[rs]+immediate > 2047) || (gregfile[rs]+immediate < 0))begin
					$display("Pattern overflowed!! PC: %d", pc);
					$display("Instruction: sw r%d r%d %d", rs, rt, immediate);
					$display("r%d = %d", rs, gregfile[rs]);
					$display("r%d = %d", rt, gregfile[rt]);
					$display("Invalid storing: %d(@%04x)",gregfile[rs]+immediate, fut_dram_addr);
					# (2);
					$finish;
				end
				if(fut_dram_addr > last_dram_addr)begin
					if(fut_dram_addr - last_dram_addr > 64)begin
						$display("Pattern violate data dependency prediction!");
						$display("[PC-%04x] sw r%d r%d %d",pc, rs, rt, immediate);
						$display("Last    storing: (@%04x)",last_dram_addr);
						$display("Invalid storing: %d(@%04x)",gregfile[rs]+immediate, fut_dram_addr);
						# (2);
						$finish;
					end
				end else if(fut_dram_addr < last_dram_addr)begin
					if(last_dram_addr - fut_dram_addr > 62)begin
						$display("Pattern violate data dependency prediction!");
						$display("[PC-%04x] sw r%d r%d %d",pc, rs, rt, immediate);
						$display("Last    storing: (@%04x)",last_dram_addr);
						$display("Invalid storing: %d(@%04x)",gregfile[rs]+immediate, fut_dram_addr);
						# (2);
						$finish;
					end
				end
				old_ddram = gdata_DRAM[gregfile[rs]+immediate];
				gdata_DRAM[gregfile[rs]+immediate] = gregfile[rt];
				if(PRINT_CAL)begin
					$display("%0s[PC-%04x]%0s %0ssw\tr%d%0s(%d) %0sr%d%0s(%d) %0s%d%0s(%d(@%04x), %d -> %d)",purple_txtpf,pc,reset_color,cyan_txtpf,rs,reset_color,old_rs,
					cyan_txtpf,rt,reset_color,old_rt,cyan_txtpf,immediate,reset_color, 
					gregfile[rs]+immediate, (gregfile[rs]+immediate)*2 + 4096, old_ddram, gdata_DRAM[gregfile[rs]+immediate]);
				end
				last_dram_addr = fut_dram_addr;
				pc = pc + 1;
			end 
			3'b101:begin
				instruction_type = 3;
				if(($signed(pc)+1+immediate) < 0 || ($signed(pc)+1+immediate) > 2048)begin
						$display("Branching to the outer-space!");
						$display("[PC-%04x] beq r%d r%d %d",pc, rs, rt, immediate);
						$display("Branching to: %d(@%04x)",($signed(pc)+1+immediate), ($signed(pc)+1+immediate)*2+16'h1000);
						# (2);
						$finish;
				end
				if(gregfile[rs] == gregfile[rt])begin
					if(PRINT_CAL)begin
						$display("%0s[PC-%04x]%0s %0sbeq\tr%d%0s(%d) %0sr%d%0s(%d) %0s%d%0s(PC: %04x(@%04x) -> %04x(@%04x))",purple_txtpf,pc,reset_color,cyan_txtpf,rs,reset_color,old_rs,
						cyan_txtpf,rt,reset_color,old_rt,cyan_txtpf,immediate,reset_color,
						pc, pc*2+16'h1000, ($signed(pc)+1+immediate), ($signed(pc)+1+immediate)*2+4096);
					end
					pc = ($signed(pc)+1+immediate);
				end else begin
					if(PRINT_CAL)begin
						$display("%0s[PC-%04x]%0s %0sbeq\tr%d%0s(%d) %0sr%d%0s(%d) %0s%d%0s(PC <- PC+1)",purple_txtpf,pc,reset_color,cyan_txtpf,rs,reset_color,old_rs,
						cyan_txtpf,rt,reset_color,old_rt,cyan_txtpf,immediate,reset_color);
					end
					pc = pc+1;
				end
				
			end
		endcase
	end else if(instruction[15:13] == 3'b100)begin
		instruction_type = 4;
		if(address > 16'h1FFF || address < 16'h1000 || (address[0]!==0))begin
			$display("Jump Instruction range invalid !");
			$display("%0s[PC-%04x]%0s j %d(@%04x)",purple_txtpf,pc,reset_color,(address-16'h1000)/2,address);
			# (2);
			$finish;
		end
		if(((address-16'h1000)/2) > pc)begin
			if((((address-16'h1000)/2) - pc) > 32)begin
				$display("Jump to the outer-space!");
				$display("[PC-%04x] j %x",pc, address);
				$display("Current PC: %d(@%04x)", pc, (pc*2 + 16'h1000));
				# (2);
				$finish;
			end
		end else if(((address-16'h1000)/2) < pc)begin
			if((pc - ((address-16'h1000)/2)) > 31)begin
				$display("Jump to the outer-space!");
				$display("[PC-%04x] j %x",pc, address);
				$display("Current PC: %d(@%04x)", pc, (pc*2 + 16'h1000));
				# (2);
				$finish;
			end
		end
		if(PRINT_CAL)begin
			$display("%0s[PC-%04x]%0s %0sj\t@%04x(%x)%0s",purple_txtpf,pc,reset_color, cyan_txtpf,address, (address-16'h1000)/2, reset_color);
		end
		pc = (address-16'h1000)/2;

	end else begin // parsed incorrect istruction!
		$display("%0s[ERROR]%0s Incorrect instruction @ print_instr!!",red_txtpf, reset_color);
		# (2);
		$finish;
	end
	if(PRINT_CAL) regfile_snapshot;
end endtask

task regfile_snapshot; begin

	for(i = 0; i < 4; i = i+1)begin
		for(j = 0; j < 4; j = j+1)begin
			idx = 4*i+j;
			if(instruction_type == 1)begin
				if(idx == rd)begin
					$write("%0sReg %2d: %d(%04x)%0s",green_txtpf,idx,gregfile[idx],gregfile[idx],reset_color);
				end else if(idx == rs || idx ==rt) begin
					$write("%0sReg %2d: %d(%04x)%0s",cyan_txtpf,idx,gregfile[idx],gregfile[idx],reset_color);
				end else begin
					$write("Reg %2d: %d(%04x)",idx,gregfile[idx],gregfile[idx]);
				end
			end else if(instruction_type == 2)begin
				if(idx == rs)begin
					$write("%0sReg %2d: %d(%04x)%0s",cyan_txtpf,idx,gregfile[idx],gregfile[idx],reset_color);
				end else if(idx == rt) begin
					$write("%0sReg %2d: %d(%04x)%0s",green_txtpf,idx,gregfile[idx],gregfile[idx],reset_color);
				end else begin
					$write("Reg %2d: %d(%04x)",idx,gregfile[idx],gregfile[idx]);
				end
			end else if(instruction_type == 3)begin
				if(idx == rs || idx == rt)begin
					$write("%0sReg %2d: %d(%04x)%0s",cyan_txtpf,idx,gregfile[idx],gregfile[idx],reset_color);
				end else begin
					$write("Reg %2d: %d(%04x)",idx,gregfile[idx],gregfile[idx]);
				end
			end else begin
				$write("Reg %2d: %d(%04x)",4*i+j,gregfile[4*i+j],gregfile[4*i+j]);
			end
			if(j!=3) $write("\t");
		end
		$display("");

	end
	$display("---------------------------------------------------------------------------------------------");
end endtask

task checkans_regfile; begin
	`ifdef CHECK_REG_MODE_1
		if( My_CPU.core_r0  !== gregfile[ 0] ||
			My_CPU.core_r1  !== gregfile[ 1] ||
			My_CPU.core_r2  !== gregfile[ 2] ||
			My_CPU.core_r3  !== gregfile[ 3] ||
			My_CPU.core_r4  !== gregfile[ 4] ||
			My_CPU.core_r5  !== gregfile[ 5] ||
			My_CPU.core_r6  !== gregfile[ 6] ||
			My_CPU.core_r7  !== gregfile[ 7] ||
			My_CPU.core_r8  !== gregfile[ 8] ||
			My_CPU.core_r9  !== gregfile[ 9] ||
			My_CPU.core_r10 !== gregfile[10] ||
			My_CPU.core_r11 !== gregfile[11] ||
			My_CPU.core_r12 !== gregfile[12] ||
			My_CPU.core_r13 !== gregfile[13] ||
			My_CPU.core_r14 !== gregfile[14] ||
			My_CPU.core_r15 !== gregfile[15]	)begin
			$display("*********************************************************************************************");
			$display("*                                      %0sCPU_FAIL%0s                                             *", red_txtpf, reset_color);
			$display("*                                %0sREGISTER FILES ERROR%0s                                       *", white_txtpf, reset_color);
			$display("*********************************************************************************************");

			if(My_CPU.core_r0  !== gregfile[ 0])begin
				$write("%0sReg %2d: %d(%04x)%0s",red_txtpf,0,My_CPU.core_r0,My_CPU.core_r0,reset_color);
			end else begin
				$write("Reg %2d: %d(%04x)",0,My_CPU.core_r0,My_CPU.core_r0);
			end
			$write("\t");
			if(My_CPU.core_r1  !== gregfile[ 1])begin
				$write("%0sReg %2d: %d(%04x)%0s",red_txtpf,1,My_CPU.core_r1,My_CPU.core_r1,reset_color);
			end else begin
				$write("Reg %2d: %d(%04x)",1,My_CPU.core_r1,My_CPU.core_r1);
			end
			$write("\t");
			if(My_CPU.core_r2  !== gregfile[ 2])begin
				$write("%0sReg %2d: %d(%04x)%0s",red_txtpf,2,My_CPU.core_r2,My_CPU.core_r2,reset_color);
			end else begin
				$write("Reg %2d: %d(%04x)",2,My_CPU.core_r2,My_CPU.core_r2);
			end
			$write("\t");
			if(My_CPU.core_r3  !== gregfile[ 3])begin
				$write("%0sReg %2d: %d(%04x)%0s",red_txtpf,3,My_CPU.core_r3,My_CPU.core_r3,reset_color);
			end else begin
				$write("Reg %2d: %d(%04x)",3,My_CPU.core_r3,My_CPU.core_r3);
			end
			$display("");

			if(My_CPU.core_r4  !== gregfile[ 4])begin
				$write("%0sReg %2d: %d(%04x)%0s",red_txtpf,4,My_CPU.core_r4,My_CPU.core_r4,reset_color);
			end else begin
				$write("Reg %2d: %d(%04x)",4,My_CPU.core_r4,My_CPU.core_r4);
			end
			$write("\t");
			if(My_CPU.core_r5  !== gregfile[ 5])begin
				$write("%0sReg %2d: %d(%04x)%0s",red_txtpf,5,My_CPU.core_r5,My_CPU.core_r5,reset_color);
			end else begin
				$write("Reg %2d: %d(%04x)",5,My_CPU.core_r5,My_CPU.core_r5);
			end
			$write("\t");
			if(My_CPU.core_r6  !== gregfile[ 6])begin
				$write("%0sReg %2d: %d(%04x)%0s",red_txtpf,6,My_CPU.core_r6,My_CPU.core_r6,reset_color);
			end else begin
				$write("Reg %2d: %d(%04x)",6,My_CPU.core_r6,My_CPU.core_r6);
			end
			$write("\t");
			if(My_CPU.core_r7  !== gregfile[ 7])begin
				$write("%0sReg %2d: %d(%04x)%0s",red_txtpf,7,My_CPU.core_r7,My_CPU.core_r7,reset_color);
			end else begin
				$write("Reg %2d: %d(%04x)",7,My_CPU.core_r7,My_CPU.core_r7);
			end
			$display("");

			if(My_CPU.core_r8  !== gregfile[ 8])begin
				$write("%0sReg %2d: %d(%04x)%0s",red_txtpf,8,My_CPU.core_r8,My_CPU.core_r8,reset_color);
			end else begin
				$write("Reg %2d: %d(%04x)",8,My_CPU.core_r8,My_CPU.core_r8);
			end
			$write("\t");
			if(My_CPU.core_r9  !== gregfile[ 9])begin
				$write("%0sReg %2d: %d(%04x)%0s",red_txtpf,9,My_CPU.core_r9,My_CPU.core_r9,reset_color);
			end else begin
				$write("Reg %2d: %d(%04x)",9,My_CPU.core_r9,My_CPU.core_r9);
			end
			$write("\t");
			if(My_CPU.core_r10  !== gregfile[10])begin
				$write("%0sReg %2d: %d(%04x)%0s",red_txtpf,10,My_CPU.core_r10,My_CPU.core_r10,reset_color);
			end else begin
				$write("Reg %2d: %d(%04x)",10,My_CPU.core_r10,My_CPU.core_r10);
			end
			$write("\t");
			if(My_CPU.core_r11  !== gregfile[11])begin
				$write("%0sReg %2d: %d(%04x)%0s",red_txtpf,11,My_CPU.core_r11,My_CPU.core_r11,reset_color);
			end else begin
				$write("Reg %2d: %d(%04x)",11,My_CPU.core_r11,My_CPU.core_r11);
			end
			$display("");

			if(My_CPU.core_r12  !== gregfile[12])begin
				$write("%0sReg %2d: %d(%04x)%0s",red_txtpf,12,My_CPU.core_r12,My_CPU.core_r12,reset_color);
			end else begin
				$write("Reg %2d: %d(%04x)",12,My_CPU.core_r12,My_CPU.core_r12);
			end
			$write("\t");
			if(My_CPU.core_r13  !== gregfile[13])begin
				$write("%0sReg %2d: %d(%04x)%0s",red_txtpf,13,My_CPU.core_r13,My_CPU.core_r13,reset_color);
			end else begin
				$write("Reg %2d: %d(%04x)",13,My_CPU.core_r13,My_CPU.core_r13);
			end
			$write("\t");
			if(My_CPU.core_r14  !== gregfile[14])begin
				$write("%0sReg %2d: %d(%04x)%0s",red_txtpf,14,My_CPU.core_r14,My_CPU.core_r14,reset_color);
			end else begin
				$write("Reg %2d: %d(%04x)",14,My_CPU.core_r14,My_CPU.core_r14);
			end
			$write("\t");
			if(My_CPU.core_r15  !== gregfile[15])begin
				$write("%0sReg %2d: %d(%04x)%0s",red_txtpf,15,My_CPU.core_r15,My_CPU.core_r15,reset_color);
			end else begin
				$write("Reg %2d: %d(%04x)",15,My_CPU.core_r15,My_CPU.core_r15);
			end
			$display("");

			#(2);
			$finish;
		end 
	`endif
	
	`ifdef CHECK_REG_MODE_2
		if( My_CHIP.core_r0  !== gregfile[ 0] ||
			My_CHIP.core_r1  !== gregfile[ 1] ||
			My_CHIP.core_r2  !== gregfile[ 2] ||
			My_CHIP.core_r3  !== gregfile[ 3] ||
			My_CHIP.core_r4  !== gregfile[ 4] ||
			My_CHIP.core_r5  !== gregfile[ 5] ||
			My_CHIP.core_r6  !== gregfile[ 6] ||
			My_CHIP.core_r7  !== gregfile[ 7] ||
			My_CHIP.core_r8  !== gregfile[ 8] ||
			My_CHIP.core_r9  !== gregfile[ 9] ||
			My_CHIP.core_r10 !== gregfile[10] ||
			My_CHIP.core_r11 !== gregfile[11] ||
			My_CHIP.core_r12 !== gregfile[12] ||
			My_CHIP.core_r13 !== gregfile[13] ||
			My_CHIP.core_r14 !== gregfile[14] ||
			My_CHIP.core_r15 !== gregfile[15]	)begin
			$display("*********************************************************************************************");
			$display("*                                      %0sCPU_FAIL%0s                                             *", red_txtpf, reset_color);
			$display("*                                %0sREGISTER FILES ERROR%0s                                       *", white_txtpf, reset_color);
			$display("*********************************************************************************************");

			if(My_CHIP.core_r0  !== gregfile[ 0])begin
				$write("%0sReg %2d: %d(%04x)%0s",red_txtpf,0,My_CHIP.core_r0,My_CHIP.core_r0,reset_color);
			end else begin
				$write("Reg %2d: %d(%04x)",0,My_CHIP.core_r0,My_CHIP.core_r0);
			end
			$write("\t");
			if(My_CHIP.core_r1  !== gregfile[ 1])begin
				$write("%0sReg %2d: %d(%04x)%0s",red_txtpf,1,My_CHIP.core_r1,My_CHIP.core_r1,reset_color);
			end else begin
				$write("Reg %2d: %d(%04x)",1,My_CHIP.core_r1,My_CHIP.core_r1);
			end
			$write("\t");
			if(My_CHIP.core_r2  !== gregfile[ 2])begin
				$write("%0sReg %2d: %d(%04x)%0s",red_txtpf,2,My_CHIP.core_r2,My_CHIP.core_r2,reset_color);
			end else begin
				$write("Reg %2d: %d(%04x)",2,My_CHIP.core_r2,My_CHIP.core_r2);
			end
			$write("\t");
			if(My_CHIP.core_r3  !== gregfile[ 3])begin
				$write("%0sReg %2d: %d(%04x)%0s",red_txtpf,3,My_CHIP.core_r3,My_CHIP.core_r3,reset_color);
			end else begin
				$write("Reg %2d: %d(%04x)",3,My_CHIP.core_r3,My_CHIP.core_r3);
			end
			$display("");

			if(My_CHIP.core_r4  !== gregfile[ 4])begin
				$write("%0sReg %2d: %d(%04x)%0s",red_txtpf,4,My_CHIP.core_r4,My_CHIP.core_r4,reset_color);
			end else begin
				$write("Reg %2d: %d(%04x)",4,My_CHIP.core_r4,My_CHIP.core_r4);
			end
			$write("\t");
			if(My_CHIP.core_r5  !== gregfile[ 5])begin
				$write("%0sReg %2d: %d(%04x)%0s",red_txtpf,5,My_CHIP.core_r5,My_CHIP.core_r5,reset_color);
			end else begin
				$write("Reg %2d: %d(%04x)",5,My_CHIP.core_r5,My_CHIP.core_r5);
			end
			$write("\t");
			if(My_CHIP.core_r6  !== gregfile[ 6])begin
				$write("%0sReg %2d: %d(%04x)%0s",red_txtpf,6,My_CHIP.core_r6,My_CHIP.core_r6,reset_color);
			end else begin
				$write("Reg %2d: %d(%04x)",6,My_CHIP.core_r6,My_CHIP.core_r6);
			end
			$write("\t");
			if(My_CHIP.core_r7  !== gregfile[ 7])begin
				$write("%0sReg %2d: %d(%04x)%0s",red_txtpf,7,My_CHIP.core_r7,My_CHIP.core_r7,reset_color);
			end else begin
				$write("Reg %2d: %d(%04x)",7,My_CHIP.core_r7,My_CHIP.core_r7);
			end
			$display("");

			if(My_CHIP.core_r8  !== gregfile[ 8])begin
				$write("%0sReg %2d: %d(%04x)%0s",red_txtpf,8,My_CHIP.core_r8,My_CHIP.core_r8,reset_color);
			end else begin
				$write("Reg %2d: %d(%04x)",8,My_CHIP.core_r8,My_CHIP.core_r8);
			end
			$write("\t");
			if(My_CHIP.core_r9  !== gregfile[ 9])begin
				$write("%0sReg %2d: %d(%04x)%0s",red_txtpf,9,My_CHIP.core_r9,My_CHIP.core_r9,reset_color);
			end else begin
				$write("Reg %2d: %d(%04x)",9,My_CHIP.core_r9,My_CHIP.core_r9);
			end
			$write("\t");
			if(My_CHIP.core_r10  !== gregfile[10])begin
				$write("%0sReg %2d: %d(%04x)%0s",red_txtpf,10,My_CHIP.core_r10,My_CHIP.core_r10,reset_color);
			end else begin
				$write("Reg %2d: %d(%04x)",10,My_CHIP.core_r10,My_CHIP.core_r10);
			end
			$write("\t");
			if(My_CHIP.core_r11  !== gregfile[11])begin
				$write("%0sReg %2d: %d(%04x)%0s",red_txtpf,11,My_CHIP.core_r11,My_CHIP.core_r11,reset_color);
			end else begin
				$write("Reg %2d: %d(%04x)",11,My_CHIP.core_r11,My_CHIP.core_r11);
			end
			$display("");

			if(My_CHIP.core_r12  !== gregfile[12])begin
				$write("%0sReg %2d: %d(%04x)%0s",red_txtpf,12,My_CHIP.core_r12,My_CHIP.core_r12,reset_color);
			end else begin
				$write("Reg %2d: %d(%04x)",12,My_CHIP.core_r12,My_CHIP.core_r12);
			end
			$write("\t");
			if(My_CHIP.core_r13  !== gregfile[13])begin
				$write("%0sReg %2d: %d(%04x)%0s",red_txtpf,13,My_CHIP.core_r13,My_CHIP.core_r13,reset_color);
			end else begin
				$write("Reg %2d: %d(%04x)",13,My_CHIP.core_r13,My_CHIP.core_r13);
			end
			$write("\t");
			if(My_CHIP.core_r14  !== gregfile[14])begin
				$write("%0sReg %2d: %d(%04x)%0s",red_txtpf,14,My_CHIP.core_r14,My_CHIP.core_r14,reset_color);
			end else begin
				$write("Reg %2d: %d(%04x)",14,My_CHIP.core_r14,My_CHIP.core_r14);
			end
			$write("\t");
			if(My_CHIP.core_r15  !== gregfile[15])begin
				$write("%0sReg %2d: %d(%04x)%0s",red_txtpf,15,My_CHIP.core_r15,My_CHIP.core_r15,reset_color);
			end else begin
				$write("Reg %2d: %d(%04x)",15,My_CHIP.core_r15,My_CHIP.core_r15);
			end
			$display("");

			#(2);
			$finish;
		end
	`endif
	
end endtask

task checkans_dram; begin
	ddram_error = 0;
	for(ddx = 0; ddx < 2048; ddx = ddx+1)begin
		if($signed({u_PATTERN.pDATA_DRAM.DRAM_r[ddx*2+1+4096], u_PATTERN.pDATA_DRAM.DRAM_r[ddx*2+4096]}) !== gdata_DRAM[ddx])begin
			ddram_error = ddram_error + 1;
			if(ddram_error == 1)begin
				$display("*********************************************************************************************");
				$display("*                                      %0sCPU_FAIL%0s                                             *", red_txtpf, reset_color);
				$display("*                                   %0sDATA DRAM ERROR%0s                                         *", white_txtpf, reset_color);
				$display("*********************************************************************************************");
			end
			$display("@%x(%04x)%0s %d(%04x) %0s\t %0s %d(%04x) %0s",(ddx*2 + 16'h1000), ddx,green_txtpf, gdata_DRAM[ddx], gdata_DRAM[ddx], reset_color
																	, red_txtpf, $signed({u_PATTERN.pDATA_DRAM.DRAM_r[ddx*2+1+4096], u_PATTERN.pDATA_DRAM.DRAM_r[ddx*2+4096]}),
																	$signed({u_PATTERN.pDATA_DRAM.DRAM_r[ddx*2+1+4096], u_PATTERN.pDATA_DRAM.DRAM_r[ddx*2+4096]}), reset_color);

		end
	end
	if(ddram_error != 0)begin
	#(2);
	$finish;
	end
end endtask

task YOU_PASS_task; begin
	$display ("--------------------------------------------------------------------------------");
    $display ("			               %0sCongratulations >< !!%0s",green_txtpf, reset_color);
    $display ("			           You have %0spassed%0s all patterns!         \n",green_txtpf, reset_color);
    $display ("			Latency Report:");
    $display ("			Clock period : %14.1f", CYCLE);
    $display ("			Cycle latency: %12d",total_latency);
    $display ("			Total latency: %14.1f",total_latency*CYCLE);
	$display ("");
    $display ("%0s			CPI          : %17.4f%0s",cyan_txtpf,(total_latency)/(PATNUM*10.0),reset_color);
    $display ("			LPI          : %17.4f",(total_latency*CYCLE)/(PATNUM*10.0));
	$display ("--------------------------------------------------------------------------------");    
    
    #(200);
    $finish;
end endtask


endmodule