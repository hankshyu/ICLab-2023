//synopsys translate_off
`include "/RAID2/cad/synopsys/synthesis/2022.03/dw/sim_ver/DW_fp_mac.v"
`include "/RAID2/cad/synopsys/synthesis/2022.03/dw/sim_ver/DW_fp_recip.v"
`include "/RAID2/cad/synopsys/synthesis/2022.03/dw/sim_ver/DW_fp_exp.v"
//synopsys translate_on

module NN(
	// Input signals
	clk,
	rst_n,
	in_valid,
	weight_u,
	weight_w,
	weight_v,
	data_x,
	data_h,
	// Output signals
	out_valid,
	out
);

//---------------------------------------------------------------------
//   PARAMETER
//---------------------------------------------------------------------

parameter inst_sig_width = 23;
parameter inst_exp_width = 8;
parameter inst_ieee_compliance = 0;
parameter FLEN = inst_sig_width + inst_exp_width + 1;

parameter inst_rounding_mode = 3'b000; //RNE

parameter P_ZEROPOINTONE	= 32'h3dcc_cccd; //0.1 (actually 100000001490116119384765625)
parameter P_ZERO 			= 32'h0000_0000;
parameter P_ONE 			= 32'h3f80_0000;

//module instantiate parameters

parameter DW_fp_exp_inst_arch = 1; //0: aread optimized, 1: speed optimized
parameter DW_fp_recip_inst_arch = 1; 
//faithful_round
// Choose either a specific rounding mode (set by rnd) or a general rounding mode 
// that allows maximum 1 ulp error
// - 0: Rounding mode is specific, as set by the rnd port; this choice increases the 
// size of the resulting implementation.
// - 1: Rounding mode is general and, for sig_width ≤ 28, allows a maximum of 1 ulp 
// error; this choice decreases the size of the resulting implementationa.
// When faithful_round = 1, note the following:
// - The inexact status flag in the output is not meaningful.
// - The other status flags will match one of the possible outputs for the 
// calculation when faithful_round = 0.

//---------------------------------------------------------------------
//   INPUT AND OUTPUT DECLARATION
//---------------------------------------------------------------------
input  clk, rst_n, in_valid;
input [FLEN-1 : 0] weight_u, weight_w, weight_v, data_x, data_h;
output reg	out_valid;
output reg [FLEN-1 : 0] out;

//---------------------------------------------------------------------
//   REGISTERs & Integers DECLARATION
//---------------------------------------------------------------------
reg [7-1 : 0] cnt; //the universal counter

reg [FLEN-1 : 0] w_store [0 : 9-1];
reg [FLEN-1 : 0] u_store [0 : 9-1];
reg [FLEN-1 : 0] v_store [0 : 9-1];

reg [FLEN-1 : 0] x_store [0 : 6-1];
reg [FLEN-1 : 0] h_store;

reg [FLEN-1 : 0] Ux_tmp [0 : 3-1];
reg [FLEN-1 : 0] Wh_tmp [0 : 3-1];
reg [FLEN-1 : 0] h_tmp [0 : 3-1];
reg [FLEN-1 : 0] Vh_tmp [0 : 3-1];

reg [FLEN-1 : 0] answer [0 : 9-1];

integer i;
//---------------------------------------------------------------------
//   FSM DECLARATION
//---------------------------------------------------------------------
localparam S_INIT = 3'd0;
localparam S_INPUT = 3'd1;
localparam S_CAL = 3'd2;
localparam S_DONE = 3'd3;

reg [2:0] current_state, next_state;

localparam SMACU_IDLE 	= 3'd0;
localparam SMACU_DOT	= 3'd1;
localparam SMACU_DOT2	= 3'd2;
localparam SMACU_DOTV1	= 3'd3;
localparam SMACU_DOT3	= 3'd4;
localparam SMACU_DOTV2	= 3'd5;
localparam SMACU_WAIT	= 3'd6;
localparam SMACU_DOTV3  = 3'd7;

reg [4-1 : 0] macu_cnt;
reg [3-1 : 0] macu_cs, macu_ns;

localparam SMACW_IDLE 	= 4'd0;
localparam SMACW_DOT	= 4'd1;
localparam SMACW_ADDER	= 4'd2;
localparam SMACW_MULPO	= 4'd3;
localparam SMACW_DOT2	= 4'd4;
localparam SMACW_ADDER2	= 4'd5;
localparam SMACW_MULPO2	= 4'd6;
localparam SMACW_DOT3	= 4'd7;
localparam SMACW_ADDER3	= 4'd8;
localparam SMACW_MULPO3	= 4'd9;
reg [4-1 : 0] macw_cnt;
reg [4-1 : 0] macw_cs, macw_ns;

//---------------------------------------------------------------------
//   DesignWire IP DECLARATION
//---------------------------------------------------------------------
//MAC: Multiply-and-Accumulate z = a*b + c


reg [FLEN-1 : 0] MACU_A;
reg [FLEN-1 : 0] MACU_B [0 : 3-1];
reg [FLEN-1 : 0] MACU_C;
wire [FLEN-1 : 0] MACU_out;

DW_fp_mac #(inst_sig_width, inst_exp_width, inst_ieee_compliance) MACU (
.a(MACU_A), .b(MACU_B[0]), .c(MACU_C), .rnd(inst_rounding_mode),
.z(MACU_out), .status() );

reg [FLEN-1 : 0] MACW_A;
reg [FLEN-1 : 0] MACW_B [0 : 3-1];
reg [FLEN-1 : 0] MACW_C;
wire [FLEN-1 : 0] MACW_out;

DW_fp_mac #(inst_sig_width, inst_exp_width, inst_ieee_compliance) MACW (
.a(MACW_A), .b(MACW_B[0]), .c(MACW_C), .rnd(inst_rounding_mode),
.z(MACW_out), .status() );

//EXP0 computes z = e^a, where a is fp
//parameter = 1, optimized for speed, could be changed for later use...
reg [FLEN-1 : 0] EXP0_in;
wire [FLEN-1 :0] EXP0_out;
DW_fp_exp #(inst_sig_width, inst_exp_width, inst_ieee_compliance, DW_fp_exp_inst_arch) EXP0 (
.a(EXP0_in), .z(EXP0_out), .status() );

//REC0 computes z = 1/a, a is fp
reg [FLEN-1 : 0] REC0_in;
wire [FLEN-1 :0] REC0_out;
DW_fp_recip #(inst_sig_width, inst_exp_width, inst_ieee_compliance, DW_fp_recip_inst_arch) REC0 (
.a(REC0_in), .rnd(inst_rounding_mode), .z(REC0_out), .status() );

//---------------------------------------------------------------------
//   WIRE AND REG DECLARATION
//---------------------------------------------------------------------

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)begin 
		current_state <= S_INIT;
		macu_cs <= SMACU_IDLE;
		macw_cs <= SMACW_IDLE;
	end else begin
		current_state <= next_state;
		macu_cs <= macu_ns;
		macw_cs <= macw_ns;
	end
end

always @(*) begin
	case (current_state)
		S_INIT: next_state = (in_valid)? S_INPUT : S_INIT;
		S_INPUT: next_state = (in_valid)? S_INPUT : S_CAL;
		S_CAL: next_state = (cnt == 75)? S_DONE : S_CAL;
		S_DONE: next_state = (cnt == 8)? S_INIT : S_DONE;
		default: next_state = S_INIT;
	endcase
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n) cnt <= 0;
	else if(current_state == S_INIT) cnt <= 0;
	else if(current_state == S_CAL && cnt == 75) cnt <= 0;
	else cnt <= cnt + 1;
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n) macu_cnt <= 0;
	else begin
			case (macu_cs)
		SMACU_IDLE: macu_cnt <= 0;
		SMACU_DOT: macu_cnt <= (macu_cnt == 9)? 0 : macu_cnt + 1;
		SMACU_DOT2: macu_cnt <= (macu_cnt == 9)? 0 : macu_cnt + 1;
		SMACU_DOTV1: macu_cnt <= (macu_cnt == 9)? 0: macu_cnt + 1;
		SMACU_DOT3 : macu_cnt <= (macu_cnt == 9)? 0: macu_cnt + 1;
		SMACU_DOTV2: macu_cnt <= (macu_cnt == 9)? 0: macu_cnt + 1;
		SMACU_WAIT : macu_cnt <= (macu_cnt == 9)? 0 : macu_cnt + 1;
		SMACU_DOTV3: macu_cnt <= (macu_cnt == 9)? 0: macu_cnt + 1;
		default: macu_cnt <= 0;
	endcase
	end
end
always @(*) begin
	case (macu_cs)
		SMACU_IDLE: macu_ns = (in_valid)? SMACU_DOT : SMACU_IDLE;
		SMACU_DOT : macu_ns = (macu_cnt == 9)? SMACU_DOT2 : SMACU_DOT; 
		SMACU_DOT2: macu_ns = (macu_cnt == 9)? SMACU_DOTV1 : SMACU_DOT2;
		SMACU_DOTV1: macu_ns = (macu_cnt == 9)? SMACU_DOT3 : SMACU_DOTV1;
		SMACU_DOT3: macu_ns = (macu_cnt == 9)? SMACU_DOTV2 : SMACU_DOT3;
		SMACU_DOTV2: macu_ns = (macu_cnt == 9)? SMACU_WAIT : SMACU_DOTV2;
		SMACU_WAIT : macu_ns = (macu_cnt == 9)? SMACU_DOTV3 : SMACU_WAIT;
		SMACU_DOTV3: macu_ns = (macu_cnt == 9)? SMACU_IDLE : SMACU_DOTV3;
		default: macu_ns = SMACU_IDLE;
	endcase
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n) MACU_A <= 0;
	else begin
		case (macu_cs)
			SMACU_DOT, SMACU_DOT2, SMACU_DOT3: MACU_A <= u_store[0];
			SMACU_DOTV1, SMACU_DOTV2, SMACU_DOTV3: MACU_A <= v_store[0];
			SMACU_WAIT: begin
				if(macu_cnt<3)begin
					MACU_A <= answer[0];
				end else if(macu_cnt== 5 || macu_cnt==6 || macu_cnt==7)begin
					MACU_A <= EXP0_out;
				end
			
			end
			SMACU_IDLE: begin
				if (cnt >=71 && cnt <=73) MACU_A <= EXP0_out;
				else MACU_A <= 0;
			end
			default: MACU_A <= 0;
		endcase
	end

end
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)begin
		MACU_B[0] <= 0;
		MACU_B[1] <= 0;
		MACU_B[2] <= 0;
	end else if((macu_cs == SMACU_DOT || macu_cs == SMACU_DOT2 || macu_cs == SMACU_DOT3) && (macu_cnt < 3))begin
		MACU_B[0] <= x_store[0];
		MACU_B[1] <= MACU_B[0];
		MACU_B[2] <= MACU_B[1];
	end else if((macu_cs == SMACU_DOTV1 || macu_cs == SMACU_DOTV2 || macu_cs == SMACU_DOTV3) && (macu_cnt < 3))begin
		MACU_B[0] <= h_tmp[0];
		MACU_B[1] <= MACU_B[0];
		MACU_B[2] <= MACU_B[1];
	end else if(macu_cs == SMACU_DOT || ((macu_cs == SMACU_DOT2 || macu_cs == SMACU_DOTV1 || macu_cs == SMACU_DOT3 || macu_cs == SMACU_DOTV2 || macu_cs == SMACU_DOTV3) && macu_cnt!=9))begin
		//shifting mode
		MACU_B[0] <= MACU_B[2];
		MACU_B[1] <= MACU_B[0];
		MACU_B[2] <= MACU_B[1];
	end else if(macu_cs == SMACU_WAIT || (cnt >=71 && cnt <=73))begin
		MACU_B[0] <= P_ONE;
	end
end
always @(posedge clk or negedge rst_n) begin
	if(!rst_n) MACU_C <= 0;
	else if(macu_cs == SMACU_DOT || macu_cs == SMACU_DOT2 || macu_cs == SMACU_DOTV1 || macu_cs == SMACU_DOT3 || macu_cs == SMACU_DOTV2 || macu_cs == SMACU_DOTV3) begin
		if(macu_cnt == 0 || macu_cnt == 3 || macu_cnt == 6) MACU_C <=0;
		else MACU_C <= MACU_out;
	end else if(macu_cs == SMACU_WAIT || (cnt >=71 && cnt <=73))begin
		MACU_C <= P_ONE;
	end else MACU_C <= 0;
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n) macw_cnt <= 0;
	else begin
		case (macw_cs)
			SMACW_DOT, SMACW_DOT2, SMACW_DOT3: macw_cnt <= (macw_cnt == 9)? 0 : macw_cnt + 1;
			SMACW_ADDER, SMACW_ADDER2, SMACW_ADDER3: macw_cnt <= (macw_cnt == 3)? 0 : macw_cnt + 1;
			SMACW_MULPO, SMACW_MULPO2, SMACW_MULPO3: macw_cnt <= (macw_cnt == 5)? 0 : macw_cnt + 1;
			default: macw_cnt <= 0;
		endcase
	end
end
always @(*) begin
	case (macw_cs)
		SMACW_IDLE:		macw_ns = (in_valid)? SMACW_DOT : SMACW_IDLE;
		SMACW_DOT:		macw_ns = (macw_cnt == 9)? SMACW_ADDER : SMACW_DOT;
		SMACW_ADDER:	macw_ns = (macw_cnt == 3)? SMACW_MULPO : SMACW_ADDER;
		SMACW_MULPO:	macw_ns = (macw_cnt == 5)? SMACW_DOT2: SMACW_MULPO;
		SMACW_DOT2:		macw_ns = (macw_cnt == 9)? SMACW_ADDER2 : SMACW_DOT2;
		SMACW_ADDER2:	macw_ns = (macw_cnt == 3)? SMACW_MULPO2 : SMACW_ADDER2;
		SMACW_MULPO2: 	macw_ns = (macw_cnt == 5)? SMACW_DOT3 : SMACW_MULPO2;
		SMACW_DOT3: 	macw_ns = (macw_cnt == 9)? SMACW_ADDER3 : SMACW_DOT3;
		SMACW_ADDER3:	macw_ns = (macw_cnt == 3)? SMACW_MULPO3 : SMACW_ADDER3;
		SMACW_MULPO3:	macw_ns = (macw_cnt == 5)? SMACW_IDLE : SMACW_MULPO3;
		default: macw_ns = SMACW_IDLE;
	endcase
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n) MACW_A <= 0;
	else if(macw_cs == SMACW_DOT || macw_cs == SMACW_DOT2 || macw_cs == SMACW_DOT3) MACW_A <= w_store[0];
	else if(macw_cs == SMACW_ADDER || macw_cs == SMACW_ADDER2 || macw_cs == SMACW_ADDER3) MACW_A <= Ux_tmp[0];
	else if(macw_cs == SMACW_MULPO || macw_cs == SMACW_MULPO2 || macw_cs == SMACW_MULPO3) MACW_A <= h_tmp[0];
	else MACW_A <= 0;
end
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)begin
		MACW_B[0] <= 0;
		MACW_B[1] <= 0;
		MACW_B[2] <= 0;
	end else if(macw_cs == SMACW_DOT)begin
		MACW_B[0] <= (macw_cnt < 3)? h_store : MACW_B[2];
		MACW_B[1] <= MACW_B[0];
		MACW_B[2] <= MACW_B[1];
	end else if(macw_cs == SMACW_ADDER || macw_cs == SMACW_ADDER2 || macw_cs == SMACW_ADDER3)begin
		MACW_B[0] <= P_ONE;
	end else if(macw_cs == SMACW_MULPO || macw_cs == SMACW_MULPO2 || macw_cs == SMACW_MULPO3)begin
		MACW_B[0] <= P_ZEROPOINTONE;
	end else if(macw_cs == SMACW_DOT2 || macw_cs == SMACW_DOT3)begin
		MACW_B[0] <= (macw_cnt < 3)? h_tmp[0] : MACW_B[2];
		MACW_B[1] <= MACW_B[0];
		MACW_B[2] <= MACW_B[1];
	end
end
always @(posedge clk or negedge rst_n) begin
	if(!rst_n) MACW_C <= 0;
	else if(macw_cs == SMACW_DOT || macw_cs == SMACW_DOT2 || macw_cs == SMACW_DOT3) begin
		if(macw_cnt == 0 ||macw_cnt == 3 || macw_cnt == 6) MACW_C <=0;
		else MACW_C <= MACW_out;
	end else if(macw_cs == SMACW_ADDER || macw_cs == SMACW_ADDER2 || macw_cs == SMACW_ADDER3)begin
		MACW_C <= Wh_tmp[0];
	end
	else MACW_C <= 0;
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)begin
		Ux_tmp[2] <= 0;
		Ux_tmp[1] <= 0;
		Ux_tmp[0] <= 0;
	end else if(((macu_cs == SMACU_DOT || macu_cs == SMACU_DOT2 || macu_cs == SMACU_DOT3) && (macu_cnt==3 || macu_cnt==6 || macu_cnt==9)))begin
		Ux_tmp[2] <= MACU_out;
		Ux_tmp[1] <= Ux_tmp[2];
		Ux_tmp[0] <= Ux_tmp[1];
	end else if(macw_cs == SMACW_ADDER || macw_cs == SMACW_ADDER2 || macw_cs == SMACW_ADDER3)begin
		Ux_tmp[1] <= Ux_tmp[2];
		Ux_tmp[0] <= Ux_tmp[1];
	end
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)begin
		Wh_tmp[2] <= 0;
		Wh_tmp[1] <= 0;
		Wh_tmp[0] <= 0;
	end else if((macw_cs == SMACW_DOT || macw_cs == SMACW_DOT2 || macw_cs == SMACW_DOT3) && (macw_cnt==3 || macw_cnt==6 || macw_cnt==9))begin
		Wh_tmp[2] <= MACW_out;
		Wh_tmp[1] <= Wh_tmp[2];
		Wh_tmp[0] <= Wh_tmp[1];
	end else if(macw_cs == SMACW_ADDER || macw_cs == SMACW_ADDER2 || macw_cs == SMACW_ADDER3)begin
		Wh_tmp[2] <= Wh_tmp[0];
		Wh_tmp[1] <= Wh_tmp[2];
		Wh_tmp[0] <= Wh_tmp[1];
	end
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)begin
		h_tmp[2] <= 0;
		h_tmp[1] <= 0;
		h_tmp[0] <= 0;
	end else if(macw_cs == SMACW_ADDER || macw_cs == SMACW_ADDER2 || macw_cs == SMACW_ADDER3)begin
		h_tmp[2] <= MACW_out;
		h_tmp[1] <= h_tmp[2];
		h_tmp[0] <= h_tmp[1];
	end else if(macw_cs == SMACW_MULPO || macw_cs == SMACW_MULPO2 || macw_cs == SMACW_MULPO3)begin
		h_tmp[2] <= h_tmp[0];
		h_tmp[1] <= (h_tmp[2][FLEN-1] == 1'b1 && (macw_cnt==1 || macw_cnt==2 || macw_cnt==3))? MACW_out : h_tmp[2];
		h_tmp[0] <= h_tmp[1];
	end else if((macw_cs == SMACW_DOT2 || macw_cs == SMACW_DOT3) && macw_cnt < 3)begin
		h_tmp[2] <= h_tmp[0];
		h_tmp[1] <= h_tmp[2];
		h_tmp[0] <= h_tmp[1];
	end else if(macu_cs == SMACU_DOTV3 && (macu_cnt < 3|| macu_cnt==5 || macu_cnt==6 || macu_cnt==7))begin
		h_tmp[2] <= h_tmp[0];
		h_tmp[1] <= h_tmp[2];
		h_tmp[0] <= h_tmp[1];
	end
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)begin
		Vh_tmp[2] <= 0; 
		Vh_tmp[1] <= 0; 
		Vh_tmp[0] <= 0; 
	end else if((macu_cs == SMACU_DOTV1 || macu_cs == SMACU_DOTV2 || macu_cs == SMACU_DOTV3)&& (macu_cnt==3 || macu_cnt==6 || macu_cnt==9))begin
		Vh_tmp[2] <= MACU_out;
		Vh_tmp[1] <= Vh_tmp[2]; 
		Vh_tmp[0] <= Vh_tmp[1]; 
	end else if(cnt == 30 || cnt == 31 || cnt == 32 ||cnt ==50 || cnt == 51 || cnt == 52 ||cnt == 70 ||cnt==71 || cnt==72 || (macu_cs == SMACU_WAIT && (macu_cnt==4 || macu_cnt==5 || macu_cnt==6)))begin
		Vh_tmp[2] <= Vh_tmp[0];
		Vh_tmp[1] <= Vh_tmp[2]; 
		Vh_tmp[0] <= Vh_tmp[1]; 
	end
end

//Buffer the input for further use
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)begin
		for (i = 0; i < 9; i = i+1) begin
			w_store[i] <= 0;
		end
	end else if(in_valid) begin
		w_store[0] <= weight_w;
		for (i = 1; i < 9; i = i+1) begin
			w_store[i] <= w_store[i-1];
		end
	end else if(cnt == 8 || ((macw_cs==SMACW_DOT2 || macw_cs == SMACW_DOT3) && macw_cnt!=9))begin
		w_store[0] <= w_store[8];
		for (i = 1; i < 9; i = i+1) begin
			w_store[i] <= w_store[i-1];
		end
	end
end
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)begin
		for (i = 0; i < 9; i = i+1) begin
			u_store[i] <= 0;
		end
	end else if(in_valid) begin
		u_store[0] <= weight_u;
		for (i = 1; i < 9; i = i+1) begin
			u_store[i] <= u_store[i-1];
		end
	end else if(cnt == 8 || ((macu_cs==SMACU_DOT2 || macu_cs==SMACU_DOT3) && macu_cnt!=9))begin
		u_store[0] <= u_store[8];
		for (i = 1; i < 9; i = i+1) begin
			u_store[i] <= u_store[i-1];
		end
	end
end
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)begin
		for (i = 0; i < 9; i = i+1) begin
			v_store[i] <= 0;
		end
	end else if(in_valid) begin
		v_store[0] <= weight_v;
		for (i = 1; i < 9; i = i+1) begin
			v_store[i] <= v_store[i-1];
		end
	end else if(cnt == 8 || ((macu_cs == SMACU_DOTV1 || macu_cs == SMACU_DOTV2 || macu_cs == SMACU_DOTV3) && macu_cnt!=9)) begin
		v_store[0] <= v_store[8];
		for (i = 1; i < 9; i = i+1) begin
			v_store[i] <= v_store[i-1];
		end
	end
end
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)begin
		for (i = 0; i < 6; i = i+1 ) begin
			x_store[i] <= 0;
		end
	end else if(in_valid) begin
		x_store[0] <= data_x;
		for (i = 1; i < 6 ; i = i+1 ) begin
			x_store[i] <= x_store[i-1];
		end
	end else if(cnt == 8 || ((macu_cs==SMACU_DOT2 || macu_cs==SMACU_DOT3) && macu_cnt!=9)) begin
		//start shifting right
		x_store[0] <= x_store[5];
		for (i = 1; i < 6; i = i+1) begin
			x_store[i] <= x_store[i-1];
		end
	end 
end
always @(posedge clk or negedge rst_n) begin
	if(!rst_n) h_store <=0;
	else if (in_valid) h_store <= data_h;

end



//output logic

always @(posedge clk or negedge rst_n) begin
	if(!rst_n) EXP0_in <= 0;
	else EXP0_in <= {~Vh_tmp[0][31],Vh_tmp[0][30:0]}; //e^-x
end

always @(posedge clk or negedge rst_n)begin
	if(!rst_n) REC0_in <= 0;
	else if(cnt >= 62 && cnt <=67 )begin
		REC0_in <= answer[0];
	end else if(cnt >=72 && cnt <=74)begin
		REC0_in <= MACU_out;
	end
end

always @(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		for(i = 0; i < 9 ;i = i+1)begin
			answer[i] <= 0;
		end
	end else if(cnt==31 || cnt == 32 || cnt == 33)begin
		answer[8] <= EXP0_out;
		for(i = 7; i >= 0 ; i = i-1)begin
			answer[i] <= answer[i+1];
		end
	end else if((cnt >=34 && cnt <=39)|| (cnt>=59 && cnt<=62) ||current_state == S_DONE ||(macu_cs == SMACU_WAIT && macu_cnt ==0))begin
		answer[8] <= answer[0];
		for(i = 7; i >= 0 ; i = i-1)begin
			answer[i] <= answer[i+1];
		end
	end else if(macu_cs == SMACU_WAIT && (macu_cnt < 4 || macu_cnt==6 || macu_cnt==7 || macu_cnt==8))begin
		answer[8] <= MACU_out;
		for(i = 7; i >= 0 ; i = i-1)begin
			answer[i] <= answer[i+1];
		end
	end 
	else if((cnt >=63 && cnt <=68) || (cnt >=73 && cnt <=75))begin
		answer[8] <= REC0_out;
		for(i = 7; i >= 0 ; i = i-1)begin
			answer[i] <= answer[i+1];
		end
	end
end


always @(posedge clk or negedge rst_n) begin
	if(!rst_n) out_valid <= 0;
	else if(current_state == S_DONE) out_valid <= 1;
	else out_valid <= 0;
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n) out <= 0;
	else if(current_state == S_DONE) out <= answer[0];
	else out <= 0;
end

endmodule
