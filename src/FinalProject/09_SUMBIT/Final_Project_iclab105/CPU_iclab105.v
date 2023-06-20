//////////////////////////////////////////////////////////////////////////////////
//  Engineer:        Tzu-Han Hsu
//  Create Date:     05/28/2023 3:02:38 PM
//  Module Name:     CPU
//  Project Name:    Customized ISA Processor [ICLAB2023 Spring Final Project]
//  HDL(Version):    Verilog-2001
//
//  Dependencies:    RA1SH1.v
//
//////////////////////////////////////////////////////////////////////////////////
//  Description:     1. This is a CPU
//
//////////////////////////////////////////////////////////////////////////////////
//  Revision:
//  05/28/2023 - Insert 128x 16-bit SRAM, used for I$ and D$
//  05/28/2023 - Mux AXI ports
//  05/29/2023 - Instruction Cache built
//  06/01/2023 - Instruction Memory construction
//  06/02/2023 - Data Memory construction
//  06/03/2023 - Data Memory burst write mode complete
//  06/04/2023 - CPU BackEND FrontEND Arch
//   
//////////////////////////////////////////////////////////////////////////////////
module CPU(
				clk,
			  rst_n,
  
		   IO_stall,

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
// Input port
input  wire clk, rst_n;
// Output port
output reg  IO_stall;

parameter ID_WIDTH = 4 , ADDR_WIDTH = 32, DATA_WIDTH = 16, DRAM_NUMBER=2, WRIT_NUMBER=1;

// AXI Interface wire connecttion for pseudo DRAM read/write

// axi write address channel 
output  wire [WRIT_NUMBER * ID_WIDTH-1:0]        awid_m_inf;
output  wire [WRIT_NUMBER * ADDR_WIDTH-1:0]    awaddr_m_inf;
output  wire [WRIT_NUMBER * 3 -1:0]            awsize_m_inf;
output  wire [WRIT_NUMBER * 2 -1:0]           awburst_m_inf;
output  wire [WRIT_NUMBER * 7 -1:0]             awlen_m_inf;
output  wire [WRIT_NUMBER-1:0]                awvalid_m_inf;
input   wire [WRIT_NUMBER-1:0]                awready_m_inf;
// axi write data channel 
output  wire [WRIT_NUMBER * DATA_WIDTH-1:0]     wdata_m_inf;
output  wire [WRIT_NUMBER-1:0]                  wlast_m_inf;
output  wire [WRIT_NUMBER-1:0]                 wvalid_m_inf;
input   wire [WRIT_NUMBER-1:0]                 wready_m_inf;
// axi write response channel
input   wire [WRIT_NUMBER * ID_WIDTH-1:0]         bid_m_inf;
input   wire [WRIT_NUMBER * 2 -1:0]             bresp_m_inf;
input   wire [WRIT_NUMBER-1:0]             	   bvalid_m_inf;
output  wire [WRIT_NUMBER-1:0]                 bready_m_inf;
// -----------------------------
// axi read address channel 
output  wire [DRAM_NUMBER * ID_WIDTH-1:0]       arid_m_inf;
output  wire [DRAM_NUMBER * ADDR_WIDTH-1:0]   araddr_m_inf;
output  wire [DRAM_NUMBER * 7 -1:0]            arlen_m_inf;
output  wire [DRAM_NUMBER * 3 -1:0]           arsize_m_inf;
output  wire [DRAM_NUMBER * 2 -1:0]          arburst_m_inf;
output  wire [DRAM_NUMBER-1:0]               arvalid_m_inf;
input   wire [DRAM_NUMBER-1:0]               arready_m_inf;
// -----------------------------
// axi read data channel 
input   wire [DRAM_NUMBER * ID_WIDTH-1:0]         rid_m_inf;
input   wire [DRAM_NUMBER * DATA_WIDTH-1:0]     rdata_m_inf;
input   wire [DRAM_NUMBER * 2 -1:0]             rresp_m_inf;
input   wire [DRAM_NUMBER-1:0]                  rlast_m_inf;
input   wire [DRAM_NUMBER-1:0]                 rvalid_m_inf;
output  wire [DRAM_NUMBER-1:0]                 rready_m_inf;
// -----------------------------

/*-----------------------------------------------------------------
	MUX AXI ports to Instruction & Data departments
-----------------------------------------------------------------*/

// ----------------------------------------
// Data Cache AXI ports
// ----------------------------------------
// axi write address channel
wire [ID_WIDTH-1 : 0]	d_awid_m_inf;
wire [ADDR_WIDTH-1 : 0]	d_awaddr_m_inf;
wire [3-1 : 0]			d_awsize_m_inf;
wire [2-1 : 0]			d_awburst_m_inf;
wire [7-1 : 0]			d_awlen_m_inf;
wire					d_awvalid_m_inf;
wire					d_awready_m_inf;
// axi write data channel 
wire [DATA_WIDTH-1 : 0]	d_wdata_m_inf;
wire					d_wlast_m_inf;
wire					d_wvalid_m_inf;
wire					d_wready_m_inf;
// axi write response channel
wire [ID_WIDTH-1 : 0]	d_bid_m_inf;
wire [2-1 : 0]			d_bresp_m_inf;
wire					d_bvalid_m_inf;
wire					d_bready_m_inf;
// ----------------------------------------
// axi read address channel 
wire [ID_WIDTH-1 : 0]	d_arid_m_inf;
wire [ADDR_WIDTH-1 : 0]	d_araddr_m_inf;
wire [7-1 : 0]			d_arlen_m_inf;
wire [3-1 : 0]			d_arsize_m_inf;
wire [2-1 : 0]			d_arburst_m_inf;
wire					d_arvalid_m_inf;
wire					d_arready_m_inf;
// axi read data channel 
wire [ID_WIDTH-1 : 0]	d_rid_m_inf;
wire [DATA_WIDTH-1 : 0]	d_rdata_m_inf;
wire [2-1 : 0]			d_rresp_m_inf;
wire					d_rlast_m_inf;
wire					d_rvalid_m_inf;
wire					d_rready_m_inf;
// ----------------------------------------


// ----------------------------------------
// Instruction Cache AXI ports
// ----------------------------------------
// axi read address channel 
wire [ID_WIDTH-1 : 0]	i_arid_m_inf;
wire [ADDR_WIDTH-1 : 0]	i_araddr_m_inf;
wire [7-1 : 0]			i_arlen_m_inf;
wire [3-1 : 0]			i_arsize_m_inf;
wire [2-1 : 0]			i_arburst_m_inf;
wire					i_arvalid_m_inf;
wire					i_arready_m_inf;
// axi read data channel 
wire [ID_WIDTH-1 : 0]	i_rid_m_inf;
wire [DATA_WIDTH-1 : 0]	i_rdata_m_inf;
wire [2-1 : 0]			i_rresp_m_inf;
wire					i_rlast_m_inf;
wire					i_rvalid_m_inf;
wire					i_rready_m_inf;
// ----------------------------------------


// MUX the AXI Connections
// ----------------------------------------
// axi write address channel
assign awid_m_inf 		= d_awid_m_inf;
assign awaddr_m_inf 	= d_awaddr_m_inf;
assign awsize_m_inf 	= d_awsize_m_inf;
assign awburst_m_inf 	= d_awburst_m_inf;
assign awlen_m_inf 		= d_awlen_m_inf;
assign awvalid_m_inf 	= d_awvalid_m_inf;
assign d_awready_m_inf 	= awready_m_inf;
// axi write data channel
assign wdata_m_inf		= d_wdata_m_inf;
assign wlast_m_inf		= d_wlast_m_inf;
assign wvalid_m_inf		= d_wvalid_m_inf;
assign d_wready_m_inf	= wready_m_inf;
// axi write response channel
assign d_bid_m_inf		= bid_m_inf;
assign d_bresp_m_inf	= bresp_m_inf;
assign d_bvalid_m_inf	= bvalid_m_inf;
assign bready_m_inf		= d_bready_m_inf;
// ----------------------------------------
// axi read address channel
assign arid_m_inf		= {i_arid_m_inf,	d_arid_m_inf};
assign araddr_m_inf		= {i_araddr_m_inf,	d_araddr_m_inf};
assign arlen_m_inf		= {i_arlen_m_inf,	d_arlen_m_inf};
assign arsize_m_inf		= {i_arsize_m_inf,	d_arsize_m_inf};
assign arburst_m_inf	= {i_arburst_m_inf,	d_arburst_m_inf};
assign arvalid_m_inf	= {i_arvalid_m_inf,	d_arvalid_m_inf};
assign {i_arready_m_inf, d_arready_m_inf}	= arready_m_inf;
// axi read data channel
assign {i_rid_m_inf,	d_rid_m_inf}		=  rid_m_inf;
assign {i_rdata_m_inf,	d_rdata_m_inf}		=  rdata_m_inf;
assign {i_rresp_m_inf,	d_rresp_m_inf}		=  rresp_m_inf;
assign {i_rlast_m_inf,	d_rlast_m_inf}		=  rlast_m_inf;
assign {i_rvalid_m_inf,	d_rvalid_m_inf}		=  rvalid_m_inf;
assign rready_m_inf		= {i_rready_m_inf,	d_rready_m_inf};
// ----------------------------------------

/*-----------------------------------------------------------------
	CPU Pipeline Registers
-----------------------------------------------------------------*/

/********* FrontEND registers *********/

reg [11-1 : 0] IF_PC;

/* 
	Instruction Memory 
						*/

reg [11-1 : 0] IF_DEC_PC;
reg [16-1 : 0] IF_DEC_instr;

/* 
	Instruction Decoder 
						*/

wire [11-1 : 0] 			DEC_EXE_PC;
// hotcode instruction encodeing
// bit-0: R-type, ADD
// bit-1: R-type, SUB
// bit-2: R-type, SLT
// bit-3: R-type, MLT

// bit-4: I-type, LW
// bit-5: I-type, SW

// bit-6: I-type, BEQ
// bit-7: J-type, J
wire 		[ 8-1 : 0] 		DEC_EXE_instcode;

wire 		[ 4-1 : 0] 		DEC_EXE_rs;
wire 		[ 4-1 : 0] 		DEC_EXE_rt;
wire 		[ 4-1 : 0] 		DEC_EXE_rd;
wire signed [ 5-1 : 0] 		DEC_EXE_imm;
wire 		[13-1 : 0] 		DEC_EXE_addr;


localparam CPUF_STUP = 'd0;
localparam CPUF_WORK = 'd1;
localparam CPUF_DONE = 'd2;
reg [1:0] cpufe_cs, cpufe_ns;

/********* BackEND registers *********/

//Register Files
reg signed [15:0] core_r0 , core_r1 , core_r2 , core_r3 ;
reg signed [15:0] core_r4 , core_r5 , core_r6 , core_r7 ;
reg signed [15:0] core_r8 , core_r9 , core_r10, core_r11;
reg signed [15:0] core_r12, core_r13, core_r14, core_r15;

reg signed [16-1 : 0] EXE_rs_reg;
reg signed [16-1 : 0] EXE_rt_reg;

always @(*) begin
	case(DEC_EXE_rs)
		4'd0:	EXE_rs_reg = core_r0;
		4'd1:	EXE_rs_reg = core_r1;
		4'd2:	EXE_rs_reg = core_r2;
		4'd3:	EXE_rs_reg = core_r3;
		4'd4:	EXE_rs_reg = core_r4;
		4'd5:	EXE_rs_reg = core_r5;
		4'd6:	EXE_rs_reg = core_r6;
		4'd7:	EXE_rs_reg = core_r7;
		4'd8:	EXE_rs_reg = core_r8;
		4'd9:	EXE_rs_reg = core_r9;
		4'd10:	EXE_rs_reg = core_r10;
		4'd11:	EXE_rs_reg = core_r11;
		4'd12:	EXE_rs_reg = core_r12;
		4'd13:	EXE_rs_reg = core_r13;
		4'd14:	EXE_rs_reg = core_r14;
		4'd15:	EXE_rs_reg = core_r15;
	endcase
end
always @(*) begin
	case(DEC_EXE_rt)
		4'd0:	EXE_rt_reg = core_r0;
		4'd1:	EXE_rt_reg = core_r1;
		4'd2:	EXE_rt_reg = core_r2;
		4'd3:	EXE_rt_reg = core_r3;
		4'd4:	EXE_rt_reg = core_r4;
		4'd5:	EXE_rt_reg = core_r5;
		4'd6:	EXE_rt_reg = core_r6;
		4'd7:	EXE_rt_reg = core_r7;
		4'd8:	EXE_rt_reg = core_r8;
		4'd9:	EXE_rt_reg = core_r9;
		4'd10:	EXE_rt_reg = core_r10;
		4'd11:	EXE_rt_reg = core_r11;
		4'd12:	EXE_rt_reg = core_r12;
		4'd13:	EXE_rt_reg = core_r13;
		4'd14:	EXE_rt_reg = core_r14;
		4'd15:	EXE_rt_reg = core_r15;
	endcase
end
/* 
	Arithmetic Logical Unit 
							*/

// Adder_subtractor
reg  signed [16-1 : 0] ALU_add_sub_in0;
reg  signed [16-1 : 0] ALU_add_sub_in1;
reg  				   ALU_add_sub_ctrl;

wire signed [16-1 : 0] ALU_add_sub_in1_cmp = (ALU_add_sub_ctrl)? (~ALU_add_sub_in1) : ALU_add_sub_in1;
wire signed [16-1 : 0] ALU_add_sub_out;
assign ALU_add_sub_out = ALU_add_sub_in0 + ALU_add_sub_in1_cmp + ALU_add_sub_ctrl;

//Multiplier
reg  signed [16-1 : 0] ALU_mul_in0;
reg  signed [16-1 : 0] ALU_mul_in1;

wire signed [16-1 : 0] ALU_mul_result = ALU_mul_in0 * ALU_mul_in1;

// Comparators
reg signed [16 -1 : 0] ALU_cmp_in0;
reg signed [16 -1 : 0] ALU_cmp_in1;

wire ALU_cmp_less_out 	= (ALU_cmp_in0 < ALU_cmp_in1);
wire ALU_cmp_equal_out	= (ALU_cmp_in0 == ALU_cmp_in1);

reg signed 	[16-1 : 0] 	EXE_MEM_result;
reg signed 	[16-1 : 0] 	EXE_MEM_storedata;
reg 		[ 8-1 : 0]	EXE_MEM_instcode;
reg 		[ 4-1 : 0] 	EXE_MEM_target;
reg 		[11-1 : 0] 	EXE_MEM_PCnxt;

/* 
	Data Memory 
					*/
reg signed [16-1 : 0] MEM_WB_memout;


reg [4-1 : 0] patcal;



localparam CPUB_PEND	= 'd0;
localparam CPUB_EXE		= 'd1;
localparam CPUB_WMEM	= 'd2;
localparam CPUB_MEM		= 'd3;
localparam CPUB_WB		= 'd4;
localparam CPUB_WFLUSH	= 'd5;
localparam CPUB_FLUSH	= 'd6;
localparam CPUB_JBPEND	= 'd7;
reg [3-1 : 0] cpube_cs, cpube_ns, cpube_ls;



/*-----------------------------------------------------------------
	Instruction Memory instantiation
-----------------------------------------------------------------*/
// reg [11-1 : 0]	IM_in;
reg 			IM_invalid;
wire [16-1 : 0]	IM_out;
wire 			IM_outvalid;

Instruction_Memory # (
	.ID_WIDTH(ID_WIDTH),
	.ADDR_WIDTH(ADDR_WIDTH),
	.DATA_WIDTH(DATA_WIDTH)
) instruction_memory (
	.clk(clk),
	.rst_n(rst_n),

	.IM_in(IF_PC),
	.IM_invalid(IM_invalid),
	.IM_out(IM_out),
	.IM_outvalid(IM_outvalid),

	// axi read address channel 
	.i_arid_m_inf(i_arid_m_inf),
	.i_araddr_m_inf(i_araddr_m_inf),
	.i_arlen_m_inf(i_arlen_m_inf),
	.i_arsize_m_inf(i_arsize_m_inf),
	.i_arburst_m_inf(i_arburst_m_inf),
	.i_arvalid_m_inf(i_arvalid_m_inf),
	.i_arready_m_inf(i_arready_m_inf),
	// axi read data channel 
	.i_rid_m_inf(i_rid_m_inf),
	.i_rdata_m_inf(i_rdata_m_inf),
	.i_rresp_m_inf(i_rresp_m_inf),
	.i_rlast_m_inf(i_rlast_m_inf),
	.i_rvalid_m_inf(i_rvalid_m_inf),
	.i_rready_m_inf(i_rready_m_inf) 
);

/*-----------------------------------------------------------------
	Data Memory instantiation
-----------------------------------------------------------------*/
reg 			DM_invalid;
reg				DM_flush;
reg [11-1 : 0]	DM_idx;
reg				DM_wen;		//0 for write, 1 for read
reg [16-1 : 0]	DM_data;
wire			DM_busy;
wire			DM_outvalid;
wire [16-1 : 0]	DM_out;

Data_Memory  #(
	.ID_WIDTH(ID_WIDTH),
	.ADDR_WIDTH(ADDR_WIDTH),
	.DATA_WIDTH(DATA_WIDTH)
) data_memory (
	.clk(clk),
	.rst_n(rst_n),

	.DM_invalid(DM_invalid),
	.DM_flush(DM_flush),
	.DM_idx(DM_idx),
	.DM_wen(DM_wen),
	.DM_data(DM_data),
	
	.DM_busy(DM_busy),
	.DM_outvalid(DM_outvalid),
	.DM_out(DM_out),

	// axi write address channel
	.d_awid_m_inf(d_awid_m_inf),
	.d_awaddr_m_inf(d_awaddr_m_inf),
	.d_awsize_m_inf(d_awsize_m_inf),
	.d_awburst_m_inf(d_awburst_m_inf),
	.d_awlen_m_inf(d_awlen_m_inf),
	.d_awvalid_m_inf(d_awvalid_m_inf),
	.d_awready_m_inf(d_awready_m_inf),
	// axi write data channel 
	.d_wdata_m_inf(d_wdata_m_inf),
	.d_wlast_m_inf(d_wlast_m_inf),
	.d_wvalid_m_inf(d_wvalid_m_inf),
	.d_wready_m_inf(d_wready_m_inf),
	// axi write response channel
	.d_bid_m_inf(d_bid_m_inf),
	.d_bresp_m_inf(d_bresp_m_inf),
	.d_bvalid_m_inf(d_bvalid_m_inf),
	.d_bready_m_inf(d_bready_m_inf),
	// ----------------------------------------
	// axi read address channel 
	.d_arid_m_inf(d_arid_m_inf),
	.d_araddr_m_inf(d_araddr_m_inf),
	.d_arlen_m_inf(d_arlen_m_inf),
	.d_arsize_m_inf(d_arsize_m_inf),
	.d_arburst_m_inf(d_arburst_m_inf),
	.d_arvalid_m_inf(d_arvalid_m_inf),
	.d_arready_m_inf(d_arready_m_inf),
	// axi read data channel 
	.d_rid_m_inf(d_rid_m_inf),
	.d_rdata_m_inf(d_rdata_m_inf),
	.d_rresp_m_inf(d_rresp_m_inf),
	.d_rlast_m_inf(d_rlast_m_inf),
	.d_rvalid_m_inf(d_rvalid_m_inf),
	.d_rready_m_inf(d_rready_m_inf)
);

/*-----------------------------------------------------------------
	Main CPU logic
-----------------------------------------------------------------*/

/********* FrontEND Logics *********/

// CPU FrontEND FSM and controllers
always @(posedge clk or negedge rst_n) begin
	if(!rst_n) cpufe_cs <= CPUF_STUP;
	else cpufe_cs <= cpufe_ns;
end
always @(*) begin
	case (cpufe_cs)
		CPUF_STUP:	cpufe_ns = CPUF_WORK;
		CPUF_WORK:begin
			if(IM_outvalid)begin
				if(cpube_cs==CPUB_PEND || (cpube_cs==CPUB_EXE && cpube_ls != CPUB_EXE) || (cpube_cs==CPUB_JBPEND && ((EXE_MEM_PCnxt != DEC_EXE_PC) || cpube_ns == CPUB_EXE)))begin
					cpufe_ns = CPUF_WORK; // directly continue the next cycle
				end else begin
					cpufe_ns = CPUF_DONE;
				end
			end else begin
				cpufe_ns = CPUF_WORK;
			end
		end
		CPUF_DONE:begin
			if(cpube_cs==CPUB_PEND || (cpube_cs==CPUB_EXE && cpube_ls != CPUB_EXE) || (cpube_cs==CPUB_JBPEND && ((EXE_MEM_PCnxt != DEC_EXE_PC) || cpube_ns == CPUB_EXE)))begin
				cpufe_ns = CPUF_WORK;
			end else begin
				cpufe_ns = CPUF_DONE;
			end
		end	
		default:	cpufe_ns = CPUF_STUP;
	endcase
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n) IF_PC <= 0;
	else begin
		case (cpufe_cs)
			CPUF_STUP:	IF_PC <= 0;
			CPUF_WORK:begin
				if(IM_outvalid)begin
					if((cpube_cs==CPUB_JBPEND && (EXE_MEM_PCnxt != DEC_EXE_PC)))begin
						IF_PC <= EXE_MEM_PCnxt;
					end else if(cpube_cs == CPUB_PEND ||(cpube_cs==CPUB_EXE && cpube_ls != CPUB_EXE))begin
						IF_PC <= IF_PC + 1;
					end
				end
			end
			CPUF_DONE:begin
				if(cpube_cs==CPUB_JBPEND && ((EXE_MEM_PCnxt!=DEC_EXE_PC)))begin
					IF_PC <= EXE_MEM_PCnxt;
				end else if(cpube_cs==CPUB_PEND || (cpube_cs==CPUB_WB && cpube_ns == CPUB_EXE) || cpube_cs==CPUB_JBPEND)begin
					IF_PC <= IF_PC + 1;
				end else begin
					IF_PC <= IF_PC;
				end
			end
		endcase
		
	end
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n) IM_invalid <= 0;
	else begin
		case(cpufe_cs) 
			CPUF_STUP: IM_invalid <= 1;
			CPUF_WORK:begin
				if(IM_outvalid)begin
					if(cpube_cs==CPUB_PEND || (cpube_cs==CPUB_EXE && cpube_ls != CPUB_EXE) || (cpube_cs==CPUB_JBPEND && ((EXE_MEM_PCnxt!=DEC_EXE_PC)||cpube_ns == CPUB_EXE)))begin
						IM_invalid <= 1;
					end else begin
						IM_invalid <= 0;
					end
				end else begin
					IM_invalid <= 0;
				end
			end 
			CPUF_DONE:begin
				if(cpube_cs==CPUB_PEND || (cpube_cs==CPUB_WB && cpube_ns == CPUB_EXE)||(cpube_cs==CPUB_JBPEND && ((EXE_MEM_PCnxt!=DEC_EXE_PC)||cpube_ns == CPUB_EXE)))begin
					IM_invalid <= 1;
				end else begin
					IM_invalid <= 0;
				end
				
			end
		endcase
	end
end
// here goes the Instruction Memory
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)begin
		IF_DEC_PC <= 0;
		IF_DEC_instr <= 0;
	end else begin
		if(cpufe_cs == CPUF_WORK && IM_outvalid)begin
			IF_DEC_PC <= IF_PC;
			IF_DEC_instr <= IM_out;
		end
	end
end

// here goesthe Decoder (IF -> DEC)

assign DEC_EXE_PC			= IF_DEC_PC;
assign DEC_EXE_instcode[0]	= (IF_DEC_instr[15:13] == 3'b000) && (IF_DEC_instr[0] == 1'b1);		// bit-0: R-type, ADD
assign DEC_EXE_instcode[1]	= (IF_DEC_instr[15:13] == 3'b000) && (IF_DEC_instr[0] == 1'b0);		// bit-1: R-type, SUB
assign DEC_EXE_instcode[2]	= (IF_DEC_instr[15:13] == 3'b001) && (IF_DEC_instr[0] == 1'b1);		// bit-2: R-type, SLT
assign DEC_EXE_instcode[3]	= (IF_DEC_instr[15:13] == 3'b001) && (IF_DEC_instr[0] == 1'b0);		// bit-3: R-type, MLT

assign DEC_EXE_instcode[4]	= (IF_DEC_instr[15:13] == 3'b011);		// bit-4: I-type, LW
assign DEC_EXE_instcode[5]	= (IF_DEC_instr[15:13] == 3'b010);		// bit-5: I-type, SW

assign DEC_EXE_instcode[6]	= (IF_DEC_instr[15:13] == 3'b101);		// bit-5: I-type, BEQ
assign DEC_EXE_instcode[7]	= (IF_DEC_instr[15:13] == 3'b100);		// bit-5: I-type, J

assign DEC_EXE_rs			= IF_DEC_instr [12 : 9];
assign DEC_EXE_rt			= IF_DEC_instr [ 8 : 5];
assign DEC_EXE_rd			= IF_DEC_instr [ 4 : 1];
assign DEC_EXE_imm			= IF_DEC_instr [ 4 : 0];
assign DEC_EXE_addr			= IF_DEC_instr [12 : 0];

/********* BackEND Logics *********/

// CPU BackEnd FSM and controllers
always @(posedge clk or negedge rst_n)begin
	if(!rst_n) cpube_cs <= CPUB_PEND;
	else cpube_cs <= cpube_ns;
end
always @(posedge clk or negedge rst_n)begin
	if(!rst_n) cpube_ls <= CPUB_PEND;
	else cpube_ls <= cpube_cs;
end
always @(*) begin
	case (cpube_cs)
		CPUB_PEND:begin
			if(((cpufe_cs == CPUF_WORK) && IM_outvalid) || cpufe_cs == CPUF_DONE)begin
				cpube_ns = CPUB_EXE;
			end else begin
				cpube_ns = CPUB_PEND;
			end
		end
		CPUB_JBPEND:begin
			if(((cpufe_cs == CPUF_WORK) && IM_outvalid) || cpufe_cs == CPUF_DONE)begin
				cpube_ns = (EXE_MEM_PCnxt == DEC_EXE_PC)? CPUB_EXE : CPUB_PEND;
			end else begin
				cpube_ns = CPUB_JBPEND;
			end
		end
		CPUB_EXE:begin
			if(DEC_EXE_instcode[6] || DEC_EXE_instcode[7])begin // J or BEQ
				if(patcal == 9 || patcal == 8) cpube_ns = (DM_busy)? CPUB_WFLUSH : CPUB_FLUSH;
				else cpube_ns = CPUB_JBPEND;
			end
			else if(DEC_EXE_instcode[5] || DEC_EXE_instcode[4])begin // Lw or SW
				cpube_ns = (DM_busy)? CPUB_WMEM : CPUB_MEM;
			end else begin
				cpube_ns = CPUB_WB;
			end
		end
		CPUB_WMEM: cpube_ns = (!DM_busy || (DM_busy && DM_outvalid))? CPUB_MEM : CPUB_WMEM;
		CPUB_MEM: cpube_ns = (DM_outvalid)? CPUB_WB : CPUB_MEM;
		CPUB_WB:begin
			if(patcal == 9) cpube_ns = (DM_busy)? CPUB_WFLUSH : CPUB_FLUSH;
			else cpube_ns =(((cpufe_cs == CPUF_WORK) && IM_outvalid) || cpufe_cs == CPUF_DONE)? CPUB_EXE : CPUB_PEND;
		end
		CPUB_WFLUSH: cpube_ns = (!DM_busy || (DM_busy && DM_outvalid))? CPUB_FLUSH : CPUB_WFLUSH;
		CPUB_FLUSH:begin
			if(DM_outvalid)begin
				cpube_ns = (EXE_MEM_instcode[6] || EXE_MEM_instcode[7])? CPUB_JBPEND: CPUB_PEND;
			end else begin
				cpube_ns = CPUB_FLUSH;
			end
			
		end 
		default: cpube_ns = CPUB_PEND;
	endcase
end



// Execute Stage
// Adder_subtractor controls
always @(*) begin
	if(DEC_EXE_instcode[4] || DEC_EXE_instcode[5])begin
		ALU_add_sub_in0 = EXE_rs_reg;
		ALU_add_sub_in1 = DEC_EXE_imm;
	end else if(DEC_EXE_instcode[6])begin
		ALU_add_sub_in0 = DEC_EXE_PC;
		ALU_add_sub_in1 = DEC_EXE_imm;
	end else begin // include ADD, SUB and default
		ALU_add_sub_in0 = EXE_rs_reg;
		ALU_add_sub_in1 = EXE_rt_reg;
	end
end
always @(*)begin
	ALU_add_sub_ctrl = DEC_EXE_instcode[1];
end

// Multiplier Control
always @(*) begin
	ALU_mul_in0 = EXE_rs_reg;
	ALU_mul_in1 = EXE_rt_reg;
end

// Comparator Contorls
always @(*) begin
	ALU_cmp_in0 = EXE_rs_reg;
	ALU_cmp_in1 = EXE_rt_reg;
end

always @(posedge clk or negedge rst_n)begin
	if(!rst_n) EXE_MEM_result <= 0;
	else begin
		if(cpube_cs == CPUB_EXE)begin
			if(DEC_EXE_instcode[2])begin // slt
				EXE_MEM_result <= (ALU_cmp_less_out)? 16'd1 : 16'd0;
			end else if(DEC_EXE_instcode[3])begin // mem
				EXE_MEM_result <= ALU_mul_result;
			end else begin
				EXE_MEM_result <= ALU_add_sub_out;
			end
		end
	end
end
always @(posedge clk or negedge rst_n)begin
	if(!rst_n) EXE_MEM_storedata <= 0;
	else begin
		if(cpube_cs == CPUB_EXE)begin
			EXE_MEM_storedata <= EXE_rt_reg;
		end
	end
end
always @(posedge clk or negedge rst_n)begin
	if(!rst_n) EXE_MEM_target <= 0;
	else begin
		if(cpube_cs == CPUB_EXE)begin
			if(DEC_EXE_instcode[4] || DEC_EXE_instcode[5])begin
				EXE_MEM_target <= DEC_EXE_rt;
			end else begin
				EXE_MEM_target <= DEC_EXE_rd;
			end
		end
	end
end
always @(posedge clk or negedge rst_n)begin
	if(!rst_n) EXE_MEM_PCnxt <= 0;
	else begin
		if(cpube_cs == CPUB_EXE)begin
			if(DEC_EXE_instcode[7])begin
				EXE_MEM_PCnxt <= DEC_EXE_addr[11 : 1];
			end else if(DEC_EXE_instcode[6])begin
				EXE_MEM_PCnxt <= (ALU_cmp_equal_out)? (ALU_add_sub_out+1): (DEC_EXE_PC+1);
			end else begin
				EXE_MEM_PCnxt <= DEC_EXE_PC+1;
			end
		end
	end
end
always @(posedge clk or negedge rst_n)begin
	if(!rst_n) EXE_MEM_instcode <= 0;
	else begin
		if(cpube_cs == CPUB_EXE)begin
			EXE_MEM_instcode <= DEC_EXE_instcode;
		end
	end
end

// MEM stage (& for flushes)
always @(posedge clk or negedge rst_n)begin
	if(!rst_n) begin
		DM_invalid <= 0;
		DM_flush <= 0;
		DM_idx <= 0;
		DM_wen <= 1;	//0 for write, 1 for read
		DM_data <= 0;
	end else begin
		if(cpube_cs == CPUB_MEM && cpube_ls != CPUB_MEM)begin
			if(EXE_MEM_instcode[4])begin // it's a load
				DM_invalid <= 1;
				DM_flush <= 0;
				DM_idx <= EXE_MEM_result[10 : 0];
				DM_wen <= 1;	//0 for write, 1 for read
				DM_data <= 0;
			end else begin // it's a store
				DM_invalid <= 1;
				DM_flush <= 0;
				DM_idx <= EXE_MEM_result[10 : 0];
				DM_wen <= 0;	//0 for write, 1 for read
				DM_data <= EXE_MEM_storedata;
			end
		end else if(cpube_cs == CPUB_FLUSH && cpube_ls != CPUB_FLUSH)begin
			DM_invalid <= 1;
			DM_flush <= 1;
		end else begin
			DM_invalid <= 0;
			DM_flush <= 0;
			DM_idx <= 0;
			DM_wen <= 1;
			DM_data <= 0;
		end
	end
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n) MEM_WB_memout <= 0;
	else begin
		if(cpube_cs == CPUB_MEM && DM_outvalid)begin
			MEM_WB_memout <= DM_out;
		end
	end
end

// WB stage

always @(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		core_r0  <= 0;
		core_r1  <= 0;
		core_r2  <= 0;
		core_r3  <= 0;
		core_r4  <= 0;
		core_r5  <= 0;
		core_r6  <= 0;
		core_r7  <= 0;
		core_r8  <= 0;
		core_r9  <= 0;
		core_r10 <= 0;
		core_r11 <= 0;
		core_r12 <= 0;
		core_r13 <= 0;
		core_r14 <= 0;
		core_r15 <= 0;
	end else begin
		if(cpube_cs == CPUB_WB)begin
			if(EXE_MEM_instcode[0] || EXE_MEM_instcode[1] || EXE_MEM_instcode[2] ||EXE_MEM_instcode[3])begin
				case (EXE_MEM_target)
					4'd0:	core_r0		<= EXE_MEM_result;
					4'd1:	core_r1		<= EXE_MEM_result;
					4'd2:	core_r2		<= EXE_MEM_result;
					4'd3:	core_r3		<= EXE_MEM_result;
					4'd4:	core_r4		<= EXE_MEM_result;
					4'd5:	core_r5		<= EXE_MEM_result;
					4'd6:	core_r6		<= EXE_MEM_result;
					4'd7:	core_r7		<= EXE_MEM_result;
					4'd8:	core_r8		<= EXE_MEM_result;
					4'd9:	core_r9		<= EXE_MEM_result;
					4'd10:	core_r10	<= EXE_MEM_result;	
					4'd11:	core_r11	<= EXE_MEM_result;
					4'd12:	core_r12	<= EXE_MEM_result;
					4'd13:	core_r13	<= EXE_MEM_result;
					4'd14:	core_r14	<= EXE_MEM_result;
					4'd15:	core_r15	<= EXE_MEM_result;
				endcase
			end else if(EXE_MEM_instcode[4])begin
				case (EXE_MEM_target)
					4'd0:	core_r0		<= MEM_WB_memout;
					4'd1:	core_r1		<= MEM_WB_memout;
					4'd2:	core_r2		<= MEM_WB_memout;
					4'd3:	core_r3		<= MEM_WB_memout;
					4'd4:	core_r4		<= MEM_WB_memout;
					4'd5:	core_r5		<= MEM_WB_memout;
					4'd6:	core_r6		<= MEM_WB_memout;
					4'd7:	core_r7		<= MEM_WB_memout;
					4'd8:	core_r8		<= MEM_WB_memout;
					4'd9:	core_r9		<= MEM_WB_memout;
					4'd10:	core_r10	<= MEM_WB_memout;	
					4'd11:	core_r11	<= MEM_WB_memout;
					4'd12:	core_r12	<= MEM_WB_memout;
					4'd13:	core_r13	<= MEM_WB_memout;
					4'd14:	core_r14	<= MEM_WB_memout;
					4'd15:	core_r15	<= MEM_WB_memout;
				endcase
			end
		end
	end
end


// output logic

always @(posedge clk or negedge rst_n) begin
	if(!rst_n) patcal <= 9;
	else begin
		if(IO_stall == 0) patcal <= (patcal == 9)? 0 : patcal + 1; 
	end
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n) IO_stall <= 1;
	else begin
		case(cpube_cs)
			CPUB_WB: IO_stall <= (patcal == 9)? 1 : 0;
			CPUB_FLUSH: IO_stall <= (cpube_ns != CPUB_FLUSH)? 0 : 1;
			CPUB_JBPEND: IO_stall<= (cpube_ls == CPUB_EXE)? 0 : 1;
			default: IO_stall <= 1;
		endcase
	end
end

endmodule

/*-----------------------------------------------------------------
	* Instruction Memory (with ICache) & it's controls *
	Instruction Cache holds 128x 16-bit instructions. 
	SRAM Area: 52315.497
-----------------------------------------------------------------*/
module Instruction_Memory #(
	parameter ID_WIDTH 		= 4, 
	parameter ADDR_WIDTH 	= 32, 
	parameter DATA_WIDTH 	= 16
) (
	input clk,
	input rst_n,

	input [11-1 : 0] IM_in,
	input IM_invalid,
	output reg [16-1 : 0] IM_out,
	output reg IM_outvalid,

	// axi read address channel 
	output [ID_WIDTH-1 : 0]			i_arid_m_inf,
	output reg [ADDR_WIDTH-1 : 0]	i_araddr_m_inf,
	output [7-1 : 0]				i_arlen_m_inf,
	output [3-1 : 0]				i_arsize_m_inf,
	output [2-1 : 0]				i_arburst_m_inf,
	output reg						i_arvalid_m_inf,
	input 							i_arready_m_inf,
	// axi read data channel 
	input [ID_WIDTH-1 : 0]			i_rid_m_inf,
	input [DATA_WIDTH-1 : 0]		i_rdata_m_inf,
	input [2-1 : 0]					i_rresp_m_inf,
	input							i_rlast_m_inf,
	input							i_rvalid_m_inf,
	output reg						i_rready_m_inf 
);
		
	//FSM for Istruction Memory
	localparam INSTMEM_IDLE = 'd0;
	localparam INSTMEM_LKUP = 'd1;
	localparam INSTMEM_WTME	= 'd2;
	localparam INSTMEM_WAOT	= 'd3;
	localparam INSTMEM_DONE	= 'd4;
	reg [2:0] instmem_cs, instmem_ns;

	//stores the intended lookup pc from IM_in to lookup_pc
	reg [11-1 : 0] lookup_pc;

	reg [11-1 : 0] icache_headpc;		//Instructon Cache stores icache_pc ~ (icache_pc + 127)
	reg	[ 7-1 : 0] icache_ready_idx;	// 0 ~ 127 which index is renewed and available

	reg [11-1 : 0] icache_nxt_range_base_pc;
	always @(*) begin
		if(lookup_pc < 31) icache_nxt_range_base_pc = 0;
		else if(lookup_pc > 1951) icache_nxt_range_base_pc = 1920;
		else icache_nxt_range_base_pc = lookup_pc - 31;
	end

	reg  icache_wen;
	reg  [ 7-1 : 0] icache_a;
	reg  [16-1 : 0] icache_d;
	wire [16-1 : 0] icache_q;
	RA1SH1 Icache(.Q(icache_q),.CLK(clk),.CEN(1'b0),.WEN(icache_wen),.A(icache_a),.D(icache_d),.OEN(1'b0));

	//FSM for ICache manipulation
	localparam ICACHE_SERV = 'd0;
	localparam ICACHE_WRES = 'd1;
	localparam ICACHE_WDAT = 'd2;
	localparam ICACHE_STOR = 'd3;
	localparam ICACHE_CLUP = 'd4;
	reg [2:0] icache_cs, icache_ns;

	// FSM for Instruction Memory manipulation
	always @(posedge clk or negedge rst_n) begin
		if(!rst_n) instmem_cs <= INSTMEM_IDLE;
		else instmem_cs <= instmem_ns;
	end
	always @(*) begin
		case (instmem_cs)
			INSTMEM_IDLE:begin
				if(IM_invalid)begin
					if(icache_cs == ICACHE_SERV && icache_ns != ICACHE_WRES) instmem_ns = INSTMEM_LKUP; 		// cached, at ICache at SERV state
					else if(icache_cs == ICACHE_SERV && icache_ns == ICACHE_WRES) instmem_ns = INSTMEM_WTME;	// Waiting a new read
					else instmem_ns = INSTMEM_WAOT;																// Waiting other's read
				end else begin
					instmem_ns = INSTMEM_IDLE;
				end
			end
			INSTMEM_LKUP: instmem_ns = INSTMEM_DONE; 
			INSTMEM_WTME:begin
				if(icache_cs == ICACHE_STOR && ((lookup_pc - icache_headpc) == icache_ready_idx)) begin
					instmem_ns = INSTMEM_DONE;
				end else begin
					instmem_ns = INSTMEM_WTME;
				end
			end
			INSTMEM_WAOT: instmem_ns = (icache_cs == ICACHE_SERV)? INSTMEM_DONE : INSTMEM_WAOT;
			INSTMEM_DONE: instmem_ns = INSTMEM_IDLE;
			default: instmem_ns = INSTMEM_IDLE;
		endcase
	end

	// FSM for ICache manipulation
	always @(posedge clk or negedge rst_n) begin
		if(!rst_n) icache_cs <= ICACHE_SERV;
		else icache_cs <= icache_ns;
	end
	always @(*) begin
		case (icache_cs)
			ICACHE_SERV:begin
				//when pc not in cache range (icache_pc ~ (icache_pc+127)), or startup, start reading
				if(IM_invalid)begin
					if(((icache_headpc+128) <= IM_in) || (icache_headpc > IM_in) || (icache_ready_idx == 0))begin
						icache_ns = ICACHE_WRES;
					end else begin
						icache_ns = ICACHE_SERV;
					end
				end else begin
					icache_ns = ICACHE_SERV;
				end
			end
			ICACHE_WRES: icache_ns = (i_arready_m_inf)? ICACHE_WDAT : ICACHE_WRES;
			ICACHE_WDAT: icache_ns = (i_rvalid_m_inf)? ICACHE_STOR : ICACHE_WDAT;
			ICACHE_STOR: icache_ns = (i_rlast_m_inf)? ICACHE_SERV : ICACHE_STOR;
			ICACHE_CLUP: icache_ns = ICACHE_SERV;
			default: icache_ns = ICACHE_SERV;
		endcase
	end

	//store input
	always @(posedge clk or negedge rst_n) begin
		if(!rst_n) lookup_pc <= 0;
		else begin
			if(IM_invalid) lookup_pc <= IM_in;
		end
	end

	always @(posedge clk or negedge rst_n) begin
		if(!rst_n) icache_headpc <= 0;
		else begin
			if(icache_cs == ICACHE_SERV && icache_ns == ICACHE_WRES)begin
				icache_headpc <= icache_nxt_range_base_pc;
			end
		end
	end
	always @(posedge clk or negedge rst_n) begin
		if(!rst_n) icache_ready_idx <= 0;
		else begin
			case (icache_cs)
				ICACHE_SERV: icache_ready_idx <= (icache_ns == ICACHE_WRES)? 0 : icache_ready_idx;
				ICACHE_STOR: icache_ready_idx <= (icache_ready_idx == 127)? 127 : icache_ready_idx + 1;
			endcase
		end
	end

	//ICache SRAM controls
	// ------------------------------------------------------------------------------
	always @(*) begin
		icache_wen = (icache_cs == ICACHE_STOR)? 0 : 1; // 0 for write, 1 for read
	end
	always @(*) begin
		case (icache_cs)
			ICACHE_SERV: icache_a = (lookup_pc - icache_headpc);
			ICACHE_STOR: icache_a = icache_ready_idx;
			default: icache_a = 0; 
		endcase
	end
	always @(*) begin
		icache_d = (icache_cs == ICACHE_STOR)? i_rdata_m_inf : 0;
	end

	// ICache AXI read address channel
	// ------------------------------------------------------------------------------
	assign i_arid_m_inf 	= 4'd0;		// fixed to 0
	assign i_arlen_m_inf 	= 7'h7F; 	// burst length = 127+1 = 128 
	assign i_arsize_m_inf 	= 3'b001;	// fixed to 3'b001, 2 bytes
	assign i_arburst_m_inf 	= 2'b01;	// fixed to 2'b01, INCR
	always @(posedge clk or negedge rst_n)begin
		if(!rst_n)begin
			i_araddr_m_inf <= 0;
			i_arvalid_m_inf <= 0;
		end else begin
			case (icache_cs)
				ICACHE_SERV:begin
					if(icache_ns == ICACHE_WRES)begin
						i_araddr_m_inf <= {32'd0, 4'b0001, icache_nxt_range_base_pc, 1'b0};		
						i_arvalid_m_inf <= 1;
					end
				end
				ICACHE_WRES:begin
					if(i_arready_m_inf)begin
						i_araddr_m_inf <= 0;
						i_arvalid_m_inf <= 0;
					end
				end
			endcase
		end
	end

	// ICache AXI read data channel
	// ----------------------------------------
	always @(posedge clk or negedge rst_n)begin
		if(!rst_n)begin
			i_rready_m_inf <= 0;
		end else begin
			if(icache_cs == ICACHE_WDAT && i_rvalid_m_inf) i_rready_m_inf <= 1;
			else if(icache_cs == ICACHE_STOR) i_rready_m_inf <= (i_rlast_m_inf)? 0 : 1;
			else i_rready_m_inf <= 0;
		end
	end
	// ------------------------------------------------------------------------------
	
	// Istruction Memory output logic
	always @(*) begin
		if(instmem_cs == INSTMEM_DONE)begin
			IM_out = icache_q;
		end else begin
			IM_out = 0;
		end
	end
	always @(*)begin
		IM_outvalid = (instmem_cs == INSTMEM_DONE);
	end

endmodule


/*-----------------------------------------------------------------
	* Data Memory (with DCache) & it's controls *
	Data Cache holds 128x 16-bit Data. 
	SRAM Area: 52315.497
-----------------------------------------------------------------*/
module Data_Memory #(
	parameter ID_WIDTH 		= 4, 
	parameter ADDR_WIDTH 	= 32, 
	parameter DATA_WIDTH 	= 16
) (
	input clk,
	input rst_n,

	input 					DM_invalid,
	input 					DM_flush,
	input [11-1 : 0]		DM_idx,
	input					DM_wen,	// 0 for write, 1 for read
	input [16-1 : 0]		DM_data,
	output reg				DM_busy,
	output reg				DM_outvalid,
	output reg [16-1 : 0]	DM_out,

	// axi write address channel
	output [ID_WIDTH-1 : 0]			d_awid_m_inf,
	output reg [ADDR_WIDTH-1 : 0]	d_awaddr_m_inf,
	output [3-1 : 0]				d_awsize_m_inf,
	output [2-1 : 0]				d_awburst_m_inf,
	output reg [7-1 : 0]			d_awlen_m_inf,
	output reg						d_awvalid_m_inf,
	input							d_awready_m_inf,
	// axi write data channel 
	output reg [DATA_WIDTH-1 : 0]	d_wdata_m_inf,
	output reg						d_wlast_m_inf,
	output reg						d_wvalid_m_inf,
	input							d_wready_m_inf,
	// axi write response channel
	input [ID_WIDTH-1 : 0]			d_bid_m_inf,
	input [2-1 : 0]					d_bresp_m_inf,
	input							d_bvalid_m_inf,
	output reg						d_bready_m_inf,
	// ----------------------------------------
	// axi read address channel 
	output [ID_WIDTH-1 : 0]			d_arid_m_inf,
	output reg [ADDR_WIDTH-1 : 0]	d_araddr_m_inf,
	output [7-1 : 0]				d_arlen_m_inf,
	output [3-1 : 0]				d_arsize_m_inf,
	output [2-1 : 0]				d_arburst_m_inf,
	output reg						d_arvalid_m_inf,
	input							d_arready_m_inf,
	// axi read data channel 
	input [ID_WIDTH-1 : 0]			d_rid_m_inf,
	input [DATA_WIDTH-1 : 0]		d_rdata_m_inf,
	input [2-1 : 0]					d_rresp_m_inf,
	input							d_rlast_m_inf,
	input							d_rvalid_m_inf,
	output reg						d_rready_m_inf
);

	//FSM for Data Memory
	localparam DATAMEM_IDLE			= 'd0;
	localparam DATAMEM_HIT			= 'd1;	//Cache hit for read
	
	localparam DATAMEM_RREQ			= 'd2;
	localparam DATAMEM_RWRES		= 'd3;
	localparam DATAMEM_RWDAT		= 'd4;
	localparam DATAMEM_RSTOR		= 'd5;
	localparam DATAMEM_CLUP			= 'd6;

	localparam DATAMEM_WBREQ		= 'd7;
	localparam DATAMEM_WBPREP		= 'd8;
	localparam DATAMEM_WBTRANS		= 'd9;
	localparam DATAMEM_WBWAITTRANS	= 'd10;
	localparam DATAMEM_WBCLEANUP	= 'd11;

	localparam DATAMEM_DONE			= 'd15;
	reg [5-1 : 0] datamem_cs, datamem_ns, datamem_js;

	reg [11-1 : 0] lookup_pc; //stores the intended operation pc from DM_idx to lookup_pc
	reg lookup_wen;
	reg [16-1 : 0] lookup_data;

	reg [ 4-1 : 0] dcache_dirty; // whether the dcache is written; 0, 1, 2, 3 indexes 32 data each

	reg dmem_write_ok;
	
	parameter WBTYPE_ALL	= 'd0;
	parameter WBTYPE_01		= 'd1;
	parameter WBTYPE_12		= 'd2;
	parameter WBTYPE_23		= 'd3;
	parameter WBTYPE_0		= 'd4;
	parameter WBTYPE_1		= 'd5;
	parameter WBTYPE_2		= 'd6;
	parameter WBTYPE_3		= 'd7;

	reg [ 3-1 : 0] writeback_type;
	reg [11-1 : 0] writeback_headpc;
	reg [ 7-1 : 0] writeback_count;
	reg [16-1 : 0] writeback_storeq, writeback_storeq2;

	
	reg [11-1 : 0] dcache_headpc; 	//Data Cache stores dcache_pc ~ (dcache_pc + 127)
	reg [ 7-1 : 0] dcache_ready_idx;
	
	reg [11-1 : 0] dcache_nxt_range_base_pc;
	always @(*) begin
		if(lookup_pc < 63) dcache_nxt_range_base_pc = 0;
		else if(lookup_pc > 1983) dcache_nxt_range_base_pc = 1920;
		else dcache_nxt_range_base_pc = lookup_pc - 63;
	end

	reg  dcache_wen;
	reg  [ 7-1 : 0] dcache_a;
	reg  [16-1 : 0] dcache_d;
	wire [16-1 : 0] dcache_q;
	RA1SH1 Dcache(.Q(dcache_q),.CLK(clk),.CEN(1'b0),.WEN(dcache_wen),.A(dcache_a),.D(dcache_d),.OEN(1'b0));

	always @(posedge clk or negedge rst_n) begin
		if(!rst_n) datamem_cs <= DATAMEM_IDLE;
		else datamem_cs <= datamem_ns;
	end
	always @(posedge clk or negedge rst_n) begin
		 if(!rst_n) datamem_js <= DATAMEM_IDLE;
		 else begin
			if(datamem_cs == DATAMEM_IDLE && DM_invalid)begin
				if(DM_flush) datamem_js <= DATAMEM_DONE;
				else datamem_js <= DATAMEM_RREQ;
			end
		 end 
	end
	always @(*) begin
		case (datamem_cs)
			DATAMEM_IDLE:begin
				if(DM_invalid)begin
					if(DM_flush)begin
						datamem_ns = (dcache_dirty == 4'b0000)? DATAMEM_DONE : DATAMEM_WBREQ;
					end else begin
						if(((dcache_headpc + 128) <= DM_idx) || (dcache_headpc > DM_idx) || (dcache_ready_idx == 0))begin // DCache miss
							datamem_ns = (dcache_dirty == 4'b0000)? DATAMEM_RREQ : DATAMEM_WBREQ;
						end else begin // DCache hit
							datamem_ns = DATAMEM_HIT;
						end
					end
				end else begin
					datamem_ns = DATAMEM_IDLE;
				end
			end

			DATAMEM_HIT:	datamem_ns = DATAMEM_IDLE;
			DATAMEM_RREQ:	datamem_ns = DATAMEM_RWRES;
			DATAMEM_RWRES:	datamem_ns = (d_arready_m_inf)? DATAMEM_RWDAT : DATAMEM_RWRES;
			DATAMEM_RWDAT:	datamem_ns = (d_rvalid_m_inf)? DATAMEM_RSTOR : DATAMEM_RWDAT;
			DATAMEM_RSTOR:	datamem_ns = (d_rlast_m_inf)? DATAMEM_IDLE : DATAMEM_RSTOR;

			DATAMEM_WBREQ: datamem_ns = (d_awready_m_inf)? DATAMEM_WBPREP : DATAMEM_WBREQ;
			DATAMEM_WBPREP: datamem_ns = DATAMEM_WBTRANS;
			DATAMEM_WBTRANS:begin
				if(d_wready_m_inf) datamem_ns = (writeback_count == 0)? DATAMEM_WBCLEANUP : DATAMEM_WBTRANS;
				else datamem_ns = DATAMEM_WBWAITTRANS;
			end
			DATAMEM_WBWAITTRANS:begin
				if(d_wready_m_inf) datamem_ns = (writeback_count == 0)? DATAMEM_WBCLEANUP : DATAMEM_WBTRANS;
				else datamem_ns = DATAMEM_WBWAITTRANS;
			end
			DATAMEM_WBCLEANUP: datamem_ns = (d_bvalid_m_inf && d_bready_m_inf)? datamem_js : DATAMEM_WBCLEANUP;

			DATAMEM_DONE: datamem_ns = DATAMEM_IDLE;
			default: datamem_ns = DATAMEM_IDLE;
		endcase
	end

	always @(posedge clk or negedge rst_n) begin
		if(!rst_n) dcache_dirty <= 4'b0000;
		else begin
			case(datamem_cs)
				DATAMEM_IDLE:begin
					if(DM_invalid && (!DM_wen) && (datamem_ns == DATAMEM_HIT))begin
						if((dcache_headpc+31) >= DM_idx) dcache_dirty[0] <= 1;
						else if((dcache_headpc+63) >= DM_idx) dcache_dirty[1] <= 1;
						else if((dcache_headpc+95) >= DM_idx) dcache_dirty[2] <= 1;
						else dcache_dirty[3] <= 1;
					end
				end
				DATAMEM_RWRES:begin
					if(!lookup_wen) dcache_dirty[1] <= 1; // this is a new load to write, always at [63]	
				end
				DATAMEM_WBCLEANUP: dcache_dirty <= 0; // all flushed
			endcase
		end 
	end
	always @(posedge clk or negedge rst_n) begin
		if(!rst_n) writeback_type <= WBTYPE_ALL;
		else begin
			if(datamem_cs == DATAMEM_IDLE && datamem_ns == DATAMEM_WBREQ)begin
				case (dcache_dirty)
					4'b0001: writeback_type <= WBTYPE_0;
					4'b0010: writeback_type <= WBTYPE_1;
					4'b0100: writeback_type <= WBTYPE_2;
					4'b1000: writeback_type <= WBTYPE_3;
					4'b0011: writeback_type <= WBTYPE_01;
					4'b0110: writeback_type <= WBTYPE_12;
					4'b1100: writeback_type <= WBTYPE_23;
					default: writeback_type <= WBTYPE_ALL;
				endcase
			end
		end
	end
	always @(posedge clk or negedge rst_n) begin
		if(!rst_n) writeback_headpc <= 0;
		else begin
			if(datamem_cs == DATAMEM_IDLE && datamem_ns == DATAMEM_WBREQ)begin
				case (dcache_dirty)
					4'b0001: writeback_headpc <= dcache_headpc + 0;
					4'b0010: writeback_headpc <= dcache_headpc + 32;
					4'b0100: writeback_headpc <= dcache_headpc + 64;
					4'b1000: writeback_headpc <= dcache_headpc + 96;
					4'b0011: writeback_headpc <= dcache_headpc + 0;
					4'b0110: writeback_headpc <= dcache_headpc + 32;
					4'b1100: writeback_headpc <= dcache_headpc + 64;
					default: writeback_headpc <= dcache_headpc + 0;
				endcase
			end
		end
	end
	always @(posedge clk or negedge rst_n) begin
		if(!rst_n) writeback_count <= 128;
		else begin
			case (datamem_cs)
				DATAMEM_IDLE:begin
					if(datamem_ns == DATAMEM_WBREQ)begin
						case (dcache_dirty)
							4'b0001, 4'b0010, 4'b0100, 4'b1000:	writeback_count <= 31;
							4'b0011, 4'b0110, 4'b1100: 			writeback_count <= 63;
							default: 							writeback_count <= 127;
						endcase
					end
				end
				DATAMEM_WBTRANS, DATAMEM_WBWAITTRANS: writeback_count <= (d_wready_m_inf)? writeback_count -1 : writeback_count;
			endcase
		end
	end

	always @(posedge clk  or negedge rst_n) begin
		if(!rst_n) dcache_headpc <=0;
		else begin
			if(datamem_cs == DATAMEM_RREQ) dcache_headpc <= dcache_nxt_range_base_pc;
		end
	end
	
	always@(posedge clk or negedge rst_n) begin
		if(!rst_n) dmem_write_ok <= 0;
		else if(datamem_cs == DATAMEM_IDLE && (!DM_flush) && (!DM_wen)) dmem_write_ok <= 1;
		else dmem_write_ok <= 0;
	end


	//stores the input here
	always @(posedge clk or negedge rst_n) begin
		if(!rst_n)begin
			lookup_pc <= 0;
			lookup_wen <= 1;
			lookup_data <= 0;
		end else begin
			if(DM_invalid)begin
				lookup_pc <= DM_idx;
				lookup_wen <= (DM_flush)? 1 : DM_wen;
				lookup_data <= (DM_wen)? lookup_data : DM_data;
			end
		end
	end

	always @(posedge clk or negedge rst_n) begin
		if(!rst_n) dcache_ready_idx <=0;
		else begin
			case (datamem_cs)
				DATAMEM_RREQ:	dcache_ready_idx <= 0;
				DATAMEM_WBREQ:begin
					if(datamem_ns != DATAMEM_WBREQ)begin
						dcache_ready_idx <= dcache_ready_idx + 1;
					end else begin
						case (writeback_type)
							WBTYPE_0:		dcache_ready_idx <=  0; 	//  0 ~  31
							WBTYPE_1:		dcache_ready_idx <= 32; 	// 32 ~  63
							WBTYPE_2:		dcache_ready_idx <= 64; 	// 64 ~  95
							WBTYPE_3:		dcache_ready_idx <= 96; 	// 96 ~ 127
							WBTYPE_01:		dcache_ready_idx <=  0; 	//  0 ~ 63
							WBTYPE_12:		dcache_ready_idx <= 32; 	// 32 ~ 95
							WBTYPE_23: 		dcache_ready_idx <= 64; 	// 64 ~ 127
							WBTYPE_ALL: 	dcache_ready_idx <=  0;		//  0 ~ 127
						endcase
					end
				end
				DATAMEM_WBPREP:begin
					dcache_ready_idx <= dcache_ready_idx + 1;
				end
				DATAMEM_WBTRANS:begin
					dcache_ready_idx <= (datamem_ns == DATAMEM_WBTRANS)? dcache_ready_idx + 1 : dcache_ready_idx;
				end
				DATAMEM_WBWAITTRANS: dcache_ready_idx <= (datamem_ns == DATAMEM_WBTRANS)? dcache_ready_idx + 1 : dcache_ready_idx;
				DATAMEM_WBCLEANUP: dcache_ready_idx <= 127;

				DATAMEM_RSTOR: 	dcache_ready_idx <= (dcache_ready_idx == 127)? 127 : dcache_ready_idx + 1;
			endcase
		end
	end

	always @(posedge clk  or negedge rst_n) begin
		if(!rst_n)begin
			writeback_storeq <= 0;
			writeback_storeq2 <= 0;
		end else begin
			if(datamem_cs == DATAMEM_WBPREP ||datamem_cs == DATAMEM_WBTRANS)begin
				writeback_storeq <= dcache_q;
				writeback_storeq2 <= writeback_storeq;
			end
		end
	end


	//DCache SRAM controls
	// ------------------------------------------------------------------------------
	always @(*)begin
		// 0 for write, 1 for read
		case (datamem_cs)
			DATAMEM_IDLE:begin
				if(DM_invalid && (!DM_wen) && (datamem_ns == DATAMEM_HIT))begin
					dcache_wen = 0;
				end else begin
					dcache_wen = 1;
				end
			end
			// DATAMEM_HIT: dcache_d = lookup_wen;
			DATAMEM_RSTOR: dcache_wen = 0;
			default: dcache_wen = 1;
		endcase
	end
	always @(*)begin
		case(datamem_cs)
			DATAMEM_IDLE: dcache_a = (DM_invalid && (datamem_ns == DATAMEM_HIT))? (DM_idx-dcache_headpc) : 0;
			DATAMEM_RSTOR: dcache_a = dcache_ready_idx;
			DATAMEM_WBREQ, DATAMEM_WBPREP, DATAMEM_WBTRANS, DATAMEM_WBWAITTRANS: dcache_a = dcache_ready_idx;
			default dcache_a = 0;
		endcase	
	end
	always @(*)begin
		case(datamem_cs)
			DATAMEM_IDLE: dcache_d = (DM_invalid && (datamem_ns == DATAMEM_HIT) && (!DM_wen))? DM_data : 0;
			DATAMEM_RSTOR: dcache_d = ((!lookup_wen) && ((lookup_pc - dcache_headpc) == dcache_ready_idx))? lookup_data : d_rdata_m_inf;
			default: dcache_d = 0;
		endcase
	end

	// DCache AXI write address channel
	// ------------------------------------------------------------------------------
	assign d_awid_m_inf 	= 4'd0;		// Write address ID, fixed to 0
	assign d_awsize_m_inf 	= 3'b001;	// burst size, fixed to 3'b001, 2 bytes
	assign d_awburst_m_inf = 2'b01;		// burst type, fixed to 2'b01, INCR
	always @(posedge clk or negedge rst_n)begin
		if(!rst_n)begin
			d_awaddr_m_inf <= 0;
			d_awlen_m_inf 	<= 7'h7F;	// burst length = 127 + 1
			d_awvalid_m_inf <= 0;
		end else begin
			if((datamem_cs == DATAMEM_WBREQ) && (datamem_ns == DATAMEM_WBREQ))begin
				d_awaddr_m_inf <= {32'd0, 4'b0001, writeback_headpc, 1'b0};
				case (writeback_type)
					WBTYPE_0, WBTYPE_1, WBTYPE_2, WBTYPE_3:	d_awlen_m_inf	<= 7'h1F; // burst length =  31+1
					WBTYPE_01, WBTYPE_12, WBTYPE_23:		d_awlen_m_inf 	<= 7'h3F; // burst length =  63+1
					WBTYPE_ALL: 							d_awlen_m_inf 	<= 7'h7F; // burst length = 127+1
				endcase
				d_awvalid_m_inf <= 1;
				
			end else begin
				d_awaddr_m_inf <= 0;
				d_awlen_m_inf 	<= 7'h7F;	// burst length = 127 + 1
				d_awvalid_m_inf <= 0;
			end
		end
	end
	// DCache AXI write data channel
	// ----------------------------------------
	always @(posedge clk or negedge rst_n) begin
		if(!rst_n)begin
			// d_wdata_m_inf <= 0;
			d_wlast_m_inf <= 0;
			d_wvalid_m_inf <= 0;
		end else begin
			case (datamem_cs)

				DATAMEM_WBPREP:begin
					if(datamem_ns == DATAMEM_WBTRANS)begin
						// d_wdata_m_inf <= dcache_q;
						d_wlast_m_inf <= 0;
						d_wvalid_m_inf <= 1;
					end
				end
				DATAMEM_WBTRANS:begin
					if(datamem_ns == DATAMEM_WBCLEANUP)begin
						// d_wdata_m_inf <= 0;
						d_wlast_m_inf <= 0;
						d_wvalid_m_inf <= 0;
					end else begin
						// d_wdata_m_inf <= dcache_q;
						d_wlast_m_inf <= (writeback_count == 1 && d_wready_m_inf)? 1 : 0;
						d_wvalid_m_inf <= 1;	
					end
				end
				DATAMEM_WBWAITTRANS:begin
					if(datamem_ns == DATAMEM_WBCLEANUP)begin
						// d_wdata_m_inf <= 0;
						d_wlast_m_inf <= 0;
						d_wvalid_m_inf <= 0;
					end else begin
						// d_wdata_m_inf <= (datamem_ns == DATAMEM_WBTRANS)? dcache_q : writeback_storeq;
						d_wlast_m_inf <= (writeback_count == 1 && d_wready_m_inf)? 1 : 0;
						d_wvalid_m_inf <= 1;
					end
				end
				default:begin
					// d_wdata_m_inf <= 0;
					d_wlast_m_inf <= 0;
					d_wvalid_m_inf <= 0;	
				end
			endcase

		end
	end
	always @(*) begin
		case(datamem_cs)
			DATAMEM_WBTRANS: d_wdata_m_inf = writeback_storeq;
			DATAMEM_WBWAITTRANS: d_wdata_m_inf = writeback_storeq2;
			default: d_wdata_m_inf = 0;
		endcase
	end
	// DCache AXI write response channel
	// ----------------------------------------
	always @(posedge clk or negedge rst_n) begin
		if(!rst_n)begin
			d_bready_m_inf <= 0;
		end else begin
			if((datamem_cs == DATAMEM_WBCLEANUP) && (datamem_ns == DATAMEM_WBCLEANUP) && d_bvalid_m_inf) d_bready_m_inf <= 1;
			else d_bready_m_inf <= 0;
		end
	end

	// DCache AXI read address channel
	// ------------------------------------------------------------------------------
	assign d_arid_m_inf 	= 4'd0;		// fixed to 0
	assign d_arlen_m_inf 	= 7'h7F;	// burst length = 127+1 = 128 
	assign d_arsize_m_inf 	= 3'b001;	// fixed to 3'b001, 2 bytes
	assign d_arburst_m_inf 	= 2'b01;	// fixed to 2'b01, INCR
	always @(posedge clk or negedge rst_n) begin
		if(!rst_n)begin
			d_araddr_m_inf <= 0;
			d_arvalid_m_inf <= 0;
		end else begin
			case(datamem_cs)
				DATAMEM_RREQ, DATAMEM_RWRES:begin

					d_araddr_m_inf <= (d_arready_m_inf)? 0 : {32'd0, 4'b0001, dcache_nxt_range_base_pc, 1'b0};
					d_arvalid_m_inf <=(d_arready_m_inf)? 0 : 1;
				end
				default:begin
					d_araddr_m_inf <= 0;
					d_arvalid_m_inf <= 0;
				end
			endcase
		end
	end
	// DCache AXI read data channel 
	// ----------------------------------------
	always @(posedge clk or negedge rst_n) begin
		if(!rst_n)begin
			d_rready_m_inf <= 0;
		end else begin
			if(datamem_cs == DATAMEM_RWDAT && d_rvalid_m_inf) d_rready_m_inf <= 1;
			else if(datamem_cs == DATAMEM_RSTOR) d_rready_m_inf <= (d_rlast_m_inf)? 0 : 1;
			else d_rready_m_inf <= 0;
		end
	end
	
	// ------------------------------------------------------------------------------

	// Data Memory output logic
	always @(*)begin
		if(dmem_write_ok)begin
			DM_outvalid = 1;
		end else begin
			case (datamem_cs)
				DATAMEM_HIT:	DM_outvalid = 1;
				DATAMEM_RSTOR:	DM_outvalid = ((lookup_wen) && ((lookup_pc - dcache_headpc) == dcache_ready_idx))? 1 : 0;
				DATAMEM_DONE:	DM_outvalid = 1;
				default: DM_outvalid = 0; 
			endcase
		end
		// case (datamem_cs)
		// 	DATAMEM_HIT:	DM_outvalid = 1;
		// 	DATAMEM_RSTOR:	DM_outvalid = ( ((lookup_pc - dcache_headpc) == dcache_ready_idx))? 1 : 0;
		// 	DATAMEM_DONE:	DM_outvalid = 1;
		// 	default: DM_outvalid = 0; 
		// endcase
	end
	always @(*)begin
		case(datamem_cs)
			DATAMEM_HIT:	DM_out = dcache_q;
			DATAMEM_RSTOR:	DM_out = ((lookup_wen) && ((lookup_pc - dcache_headpc) == dcache_ready_idx))?  d_rdata_m_inf: 0; 
			default: DM_out = 0;
		endcase
	end
	always @(*)begin
		DM_busy = (datamem_cs != DATAMEM_IDLE);
	end

endmodule
