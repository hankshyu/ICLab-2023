// synopsys translate_off
`ifdef RTL
	`include "GATED_OR.v"
`else
	`include "Netlist/GATED_OR_SYN.v"
`endif
// synopsys translate_on

module SNN(
	// Input signals
	clk,
	rst_n,
	cg_en,
	in_valid,
	img,
	ker,
	weight,

	// Output signals
	out_valid,
	out_data
);

input clk;
input rst_n;
input in_valid;
input cg_en;
input [7:0] img;
input [7:0] ker;
input [7:0] weight;

output reg out_valid;
output reg [9:0] out_data;

/*==============================================
		Parameter & integer declaration        
==============================================*/
integer idx;
genvar gen_idx;

/*==============================================
		reg & wire declaration          
==============================================*/
reg [8-1 : 0] imgshreg  [0 : 15-1]; // gated, ex
reg [8-1 : 0] kernelreg [0 : 9-1];  // gated
reg [8-1 : 0] weightreg [0 : 4-1];  // gated

reg [20-1 : 0] conv1_result;
reg [ 8-1 : 0] quant_conv1;

reg [8-1 : 0] maxpool_l; // gated, ex
reg [8-1 : 0] maxpool_r;
reg [4-1 : 0] pool_cnt;



reg [8-1 : 0] pooled_arr [0 : 4-1];

reg [8-1 : 0] flatten_arr1 [0 : 4-1]; //gated, ex
reg [8-1 : 0] flatten_arr2 [0 : 4-1]; // gated, ex

reg [10-1 : 0] L1_sum;
reg [10-1 : 0] out_data_buffer;// gated, ex

reg started;
reg [10-1 : 0] ex_mem [0 : 12-1]; 

/*==============================================
		Shared ALU          
==============================================*/
//instantiate Unsigned Multiplier 8 x 8 = 16 ---- 9x
reg [8-1 : 0] smult_a [0 : 9-1];
reg [8-1 : 0] smult_b [0 : 9-1];
wire [16-1 : 0] smult_out [0 : 9-1];
generate
	for(gen_idx = 0; gen_idx < 9; gen_idx = gen_idx+1)begin
		assign smult_out[gen_idx] = smult_a[gen_idx] * smult_b[gen_idx];
	end
endgenerate

wire [17-1 : 0] ssum2_out [0 : 4-1];
assign ssum2_out[0] = smult_out[0] + smult_out[1];
assign ssum2_out[1] = smult_out[2] + smult_out[3];
assign ssum2_out[2] = smult_out[4] + smult_out[5];
assign ssum2_out[3] = smult_out[6] + smult_out[7];

//instatiate Unsigned Adders to add 
wire [20-1 : 0] sum9_out = ssum2_out[0] + ssum2_out[1] + ssum2_out[2] + ssum2_out[3] + smult_out[8];

//instantiate a 20-bit / 12-bit divider to perform quantization
reg [20-1 : 0] sdiv_dend;
reg [12-1 : 0] sdiv_dor;
wire[ 8-1 : 0] sdiv_result;

assign sdiv_result = sdiv_dend / sdiv_dor;

reg [8-1 : 0] scmp_a;
reg [8-1 : 0] scmp_b;
wire scmp_result;

assign scmp_result = scmp_a > scmp_b;

reg [8-1 : 0] smin_a;
reg [8-1 : 0] smin_b;
wire [8-1 : 0] smin_out;
assign smin_out = smin_a - smin_b;

/*==============================================
		FSM related declaration          
==============================================*/
localparam S_INIT = 'd0;
localparam S_PUREIN  = 'd1;
localparam S_SDOT  = 'd2;
localparam S_SQUZ  = 'd3;
localparam S_DQUANT  = 'd4;
localparam S_FLAT2 = 'd5;
localparam S_CALC = 'd6;
localparam S_OUTPUT = 'd7;
localparam S_TRAP = 'd8;
reg [3:0] cs, ns;
reg [6 : 0] cnt;

always @(posedge clk or negedge rst_n) begin
	if(!rst_n) cs <= S_INIT;
	else cs <= ns;
end
always @(*) begin
	case(cs)
		S_INIT: ns = (in_valid)? S_PUREIN: S_INIT;
		S_PUREIN :begin
			if(~in_valid) ns = S_TRAP;
			else ns = (cnt == 14)? S_SDOT : S_PUREIN;
		end 
		S_SDOT :begin
			if(~in_valid) ns = S_TRAP;
			ns = (cnt == 71)? S_SQUZ : S_SDOT;
		end 
		S_SQUZ : ns = (cnt == 73)? S_DQUANT : S_SQUZ;
		S_DQUANT: ns = (cnt == 75)? S_FLAT2 : S_DQUANT;
		S_FLAT2: ns = (cnt ==78)? S_CALC : S_FLAT2;
		S_CALC: ns = S_OUTPUT;
		S_OUTPUT: ns = S_INIT;
		S_TRAP: ns = S_TRAP;
		default: ns = S_INIT;
	endcase
end
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)cnt <= 0;
	else begin
		case (cs)
			S_INIT: cnt <= 1;
			S_PUREIN, S_SDOT: cnt <= cnt + 1;
			S_SQUZ: cnt <= cnt + 1;
			S_DQUANT: cnt <= cnt + 1;
			S_FLAT2: cnt <= cnt + 1;
			S_CALC:  cnt <= 0;
		endcase
	end
end

/*==============================================
		Clock gating section          
		Toggle SLEEP_CTRL to 1 if sleeping occurs
==============================================*/
// Gating signals for input: imgshreg
wire ctrl_imgshreg = (cs == S_DQUANT || cs == S_FLAT2 || cs == S_CALC || cs == S_OUTPUT) ? 1'b1 : 1'b0;
wire G_sleep_imgshreg = (cg_en && started)? ctrl_imgshreg : 1'b0;
wire G_clock_imgshreg;
GATED_OR GATED_imgshreg( .CLOCK(clk), .SLEEP_CTRL(G_sleep_imgshreg), .RST_N(rst_n), .CLOCK_GATED(G_clock_imgshreg) );


//Gating signals for input: kernelreg
reg ctrl_kernelreg0;
wire G_sleep_kernelreg0 = (cg_en && started)? ctrl_kernelreg0 : 1'b0;
wire G_clock_kernelreg0;
GATED_OR instgor0( .CLOCK(clk), .SLEEP_CTRL(G_sleep_kernelreg0), .RST_N(rst_n), .CLOCK_GATED(G_clock_kernelreg0) );
always @(*) begin
	case (cs)
		S_INIT: ctrl_kernelreg0 = 1'b0;
		S_PUREIN: ctrl_kernelreg0 = (cnt <= 8)? 1'b0 : 1'b1;
		default: ctrl_kernelreg0 = 1'b1;
	endcase
end

//Gating signals for input: weightreg
reg ctrl_weightreg0;
wire G_sleep_weightreg0 = (cg_en && started)? ctrl_weightreg0 : 1'b0;
wire G_clock_weightreg0;
GATED_OR instgor2( .CLOCK(clk), .SLEEP_CTRL(G_sleep_weightreg0), .RST_N(rst_n), .CLOCK_GATED(G_clock_weightreg0) );
always @(*) begin
	case (cs)
		S_INIT: ctrl_weightreg0 = 1'b0;
		S_PUREIN: ctrl_weightreg0 = (cnt <= 3)? 1'b0 : 1'b1;
		default: ctrl_weightreg0 = 1'b1;
	endcase
end

reg ctrl_weightreg1;
wire G_sleep_weightreg1 = (cg_en && started)? ctrl_weightreg1 : 1'b0;
wire G_clock_weightreg1;
GATED_OR instgor3( .CLOCK(clk), .SLEEP_CTRL(G_sleep_weightreg1), .RST_N(rst_n), .CLOCK_GATED(G_clock_weightreg1) );
always @(*) begin
	case (cs)
			S_INIT: ctrl_weightreg1 = (in_valid)? 1'b0 : 1'b1;
			S_PUREIN: ctrl_weightreg1 = (cnt <= 3)? 1'b0 : 1'b1;
		default: ctrl_weightreg1 = 1'b1;
	endcase
end

wire ctrl_start = started;
wire G_sleep_start = (cg_en && started)? ctrl_start : 1'b0;
wire G_clock_start;
GATED_OR instgor4( .CLOCK(clk), .SLEEP_CTRL(G_sleep_start), .RST_N(rst_n), .CLOCK_GATED(G_clock_start) );

reg ctrl_flatarr1;
wire G_sleep_flatarr1 = (cg_en && started)? ctrl_flatarr1 : 1'b0;
wire G_clock_flatarr1;
GATED_OR instgor5( .CLOCK(clk), .SLEEP_CTRL(G_sleep_flatarr1), .RST_N(rst_n), .CLOCK_GATED(G_clock_flatarr1) );
always @(*) begin
	case (cs)
			S_SDOT: ctrl_flatarr1 = (cnt >= 40)? 1'b0 : 1'b1;
			S_DQUANT, S_FLAT2, S_CALC: ctrl_flatarr1 = 1'b0;
		default: ctrl_flatarr1 = 1'b1;
	endcase
end

reg ctrl_flatarr2;
wire G_sleep_flatarr2 = (cg_en && started)? ctrl_flatarr2 : 1'b0;
wire G_clock_flatarr2;
GATED_OR instgor6( .CLOCK(clk), .SLEEP_CTRL(G_sleep_flatarr2), .RST_N(rst_n), .CLOCK_GATED(G_clock_flatarr2) );
always @(*) begin
	case (cs)
			S_SDOT: ctrl_flatarr2 = (cnt >= 67)? 1'b0 : 1'b1;
			S_DQUANT, S_FLAT2, S_CALC: ctrl_flatarr2 = 1'b0;
		default: ctrl_flatarr2 = 1'b1;
	endcase
end

reg ctrl_odb;
wire G_sleep_odb = (cg_en && started)? ctrl_odb : 1'b0;
wire G_clock_odb;
GATED_OR instgor7( .CLOCK(clk), .SLEEP_CTRL(G_sleep_odb), .RST_N(rst_n), .CLOCK_GATED(G_clock_odb) );
always @(*) begin
	case (cs)
			S_SDOT: ctrl_odb = (cnt == 78)? 1'b0 : 1'b1;
			S_CALC: ctrl_odb = 1'b0;
		default: ctrl_odb = 1'b1;
	endcase
end

reg ctrl_l1sum;
wire G_sleep_l1sum = (cg_en && started)? ctrl_l1sum : 1'b0;
wire G_clock_l1sum;
GATED_OR instgor8( .CLOCK(clk), .SLEEP_CTRL(G_sleep_l1sum), .RST_N(rst_n), .CLOCK_GATED(G_clock_l1sum) );
always @(*) begin
	case (cs)
			S_DQUANT: ctrl_l1sum = (cnt >= 74)? 1'b0 : 1'b1;
			S_FLAT2, S_CALC: ctrl_l1sum = 1'b0;
		default: ctrl_l1sum = 1'b1;
	endcase
end

reg ctrl_mxpool;
wire G_sleep_mxpool = (cg_en && started)? ctrl_mxpool : 1'b0;
wire G_clock_mxpool;
GATED_OR instgor9( .CLOCK(clk), .SLEEP_CTRL(G_sleep_mxpool), .RST_N(rst_n), .CLOCK_GATED(G_clock_mxpool) );
always @(*) begin
	case (cs)
		S_SDOT, S_SQUZ, S_DQUANT: ctrl_mxpool = 1'b0;
		default: ctrl_mxpool = 1'b1;
	endcase
end


/*==============================================
		Design         
==============================================*/
always @(posedge G_clock_start or negedge rst_n) begin
	if(!rst_n) started <= 0;
	else begin
		if(in_valid) started <= 1;	
	end
end


// Store the input image into imgshreg
always@(posedge G_clock_imgshreg or negedge rst_n) begin
	if(!rst_n) imgshreg[14] <= 0;
	else begin
		case(cs)
			S_INIT, S_PUREIN, S_SDOT: imgshreg[14] <= img;
			S_DQUANT, S_FLAT2, S_CALC, S_OUTPUT: imgshreg[14] <= ~imgshreg[14];
		endcase
	end
end
always@(posedge G_clock_imgshreg or negedge rst_n) begin
	if(!rst_n)begin
		for(idx = 0; idx <= 13; idx = idx+1)begin
			imgshreg[idx] <=0;
		end
	end else begin
		case (cs)
			S_PUREIN, S_SDOT, S_SQUZ:begin
				for(idx = 0; idx <= 13; idx = idx+1)begin
					imgshreg[idx] <= imgshreg[idx+1];
				end
			end
			S_DQUANT, S_FLAT2, S_CALC, S_OUTPUT:begin
				for(idx = 0; idx <= 13; idx = idx+1)begin
					imgshreg[idx] <= ~imgshreg[idx+1];
				end
			end
		endcase
	end
end
//Store the input kernel into kernelreg
always@(posedge G_clock_kernelreg0 or negedge rst_n) begin
	if(!rst_n) kernelreg[8] <= 0;
	else begin
		if((cs == S_INIT) || (cs == S_PUREIN && cnt < 9))begin
			kernelreg[8] <= ker;
		end
	end
end
always@(posedge G_clock_kernelreg0 or negedge rst_n) begin
	if(!rst_n)begin
		for(idx = 0; idx <= 7; idx = idx+1)begin
			kernelreg[idx] <= 0;			
		end
	end else begin
		if(cs == S_PUREIN && cnt < 9)begin
			for(idx = 0; idx <= 7; idx = idx+1)begin
				kernelreg[idx] <= kernelreg[idx + 1];			
			end
		end
	end
end
//Store the input weight into weightreg
always@(posedge G_clock_weightreg0 or negedge rst_n) begin
	if(!rst_n) weightreg[3] <= 0;
	else begin
		if((cs == S_INIT) || (cs == S_PUREIN && cnt < 4))begin
			weightreg[3] <= weight;
		end
	end
end
always@(posedge G_clock_weightreg1 or negedge rst_n) begin
	if(!rst_n)begin
		for(idx = 0; idx <= 2; idx = idx+1)begin
			weightreg[idx] <= 0;			
		end
	end else begin
		if(cs == S_PUREIN && cnt < 4)begin
			for(idx = 0; idx <= 2; idx = idx+1)begin
				weightreg[idx] <= weightreg[idx + 1];			
			end
		end
	end
end

//Alter the input of shared ALU

//the multiplier control
always @(*) begin
	case (cs)
		S_SDOT:begin
			case (cnt)
				7'd40:begin
					smult_a[0] = pooled_arr[0];
					smult_a[1] = pooled_arr[1];
					smult_b[0] = weightreg[0];
					smult_b[1] = weightreg[2];
					for(idx = 2; idx < 9; idx = idx+1)begin
						smult_a[idx] = 0;
						smult_b[idx] = 0;
					end
				end
				7'd41:begin
					smult_a[0] = pooled_arr[0];
					smult_a[1] = pooled_arr[1];
					smult_b[0] = weightreg[1];
					smult_b[1] = weightreg[3];
					for(idx = 2; idx < 9; idx = idx+1)begin
						smult_a[idx] = 0;
						smult_b[idx] = 0;
					end
				end
				7'd42:begin
					smult_a[0] = pooled_arr[2];
					smult_a[1] = pooled_arr[3];
					smult_b[0] = weightreg[0];
					smult_b[1] = weightreg[2];
					for(idx = 2; idx < 9; idx = idx+1)begin
						smult_a[idx] = 0;
						smult_b[idx] = 0;
					end
				end
				7'd43:begin
					smult_a[0] = pooled_arr[2];
					smult_a[1] = pooled_arr[3];
					smult_b[0] = weightreg[1];
					smult_b[1] = weightreg[3];
					for(idx = 2; idx < 9; idx = idx+1)begin
						smult_a[idx] = 0;
						smult_b[idx] = 0;
					end
				end
				7'd67:begin
					smult_a[0] = pooled_arr[2];
					smult_a[1] = pooled_arr[3];
					smult_b[0] = weightreg[0];
					smult_b[1] = weightreg[2];
					for(idx = 2; idx < 9; idx = idx+1)begin
						smult_a[idx] = 0;
						smult_b[idx] = 0;
					end
				end
				default:begin
					smult_a[0] = imgshreg[ 0];
					smult_a[1] = imgshreg[ 1];
					smult_a[2] = imgshreg[ 2];
					smult_a[3] = imgshreg[ 6];
					smult_a[4] = imgshreg[ 7];
					smult_a[5] = imgshreg[ 8];
					smult_a[6] = imgshreg[12];
					smult_a[7] = imgshreg[13];
					smult_a[8] = imgshreg[14];
					for(idx = 0; idx < 9; idx = idx+1)begin			
						smult_b[idx] = kernelreg[idx];
					end
				end 
			endcase
		end
		S_SQUZ:begin
			smult_a[0] = imgshreg[ 0];
			smult_a[1] = imgshreg[ 1];
			smult_a[2] = imgshreg[ 2];
			smult_a[3] = imgshreg[ 6];
			smult_a[4] = imgshreg[ 7];
			smult_a[5] = imgshreg[ 8];
			smult_a[6] = imgshreg[12];
			smult_a[7] = imgshreg[13];
			smult_a[8] = imgshreg[14];
			for(idx = 0; idx < 9; idx = idx+1)begin			
				smult_b[idx] = kernelreg[idx];
			end
		end
		S_DQUANT:begin
				smult_a[0] = pooled_arr[1];
				smult_a[1] = pooled_arr[2];
				smult_b[0] = weightreg[1];
				smult_b[1] = weightreg[3];
				for(idx = 2; idx < 9; idx = idx+1)begin
					smult_a[idx] = 0;
					smult_b[idx] = 0;
				end
		end
		S_FLAT2:begin
			case(cnt)
				7'd76:begin
					smult_a[0] = pooled_arr[2];
					smult_a[1] = pooled_arr[3];
					smult_b[0] = weightreg[0];
					smult_b[1] = weightreg[2];
					for(idx = 2; idx < 9; idx = idx+1)begin
						smult_a[idx] = 0;
						smult_b[idx] = 0;
					end
				end
				7'd77:begin
					smult_a[0] = pooled_arr[2];
					smult_a[1] = pooled_arr[3];
					smult_b[0] = weightreg[1];
					smult_b[1] = weightreg[3];
					for(idx = 2; idx < 9; idx = idx+1)begin
						smult_a[idx] = 0;
						smult_b[idx] = 0;
					end
				end
				default:begin
					for(idx = 0; idx < 9; idx = idx+1)begin
						smult_a[idx] = 0;
						smult_b[idx] = 0;
					end
				end
				
			endcase
		end
		default:begin
			for(idx = 0; idx < 9; idx = idx+1)begin
				smult_a[idx] = 0;
				smult_b[idx] = 0;
			end
		end
	endcase
end

//the dividor control
always @(*) begin
	case (cs)
		S_SDOT,S_SQUZ:begin
			sdiv_dend = conv1_result;
			sdiv_dor = (cnt == 41 || cnt == 42 || cnt == 43 || cnt ==44 || cnt == 68)? 510 : 2295;
		end
		S_SQUZ:begin
			sdiv_dend = conv1_result;
			sdiv_dor = 2295;
			
		end
		S_DQUANT:begin
			sdiv_dend = conv1_result;
			sdiv_dor = 510;
		end
		S_FLAT2:begin
			sdiv_dend = conv1_result;
			sdiv_dor = 510;
		end
		default:begin
			sdiv_dend = 0;
			sdiv_dor = 1;
		end
	endcase
end


//conv1_result is usually the output of the dot product,
//however, it is also used to store the dividend
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)begin
		conv1_result <= 0;
	end else begin
		case (cs)
			S_SDOT:begin
				case (cnt)
					7'd40, 7'd41, 7'd42, 7'd43, 7'd67: conv1_result <= ssum2_out[0];
					default: conv1_result <= sum9_out;
				endcase
			end 
			S_SQUZ: conv1_result <= sum9_out;
			S_DQUANT: conv1_result <= ssum2_out[0];
			S_FLAT2: conv1_result <= ssum2_out[0];
		endcase
	end
end

always @(posedge clk or negedge rst_n)begin
	if(!rst_n) quant_conv1 <= 0;
	else if(cs == S_SDOT || cs == S_SQUZ || cs == S_DQUANT)begin
		quant_conv1 <= sdiv_result;
	end
end
//the comparator control

always @(posedge clk or negedge rst_n) begin
	if(!rst_n) pool_cnt <= 0;
	else begin
		case (cs)
			S_INIT: pool_cnt <= 14; 
			S_SDOT:begin
				if(cnt >= 40 && cnt <= 51) pool_cnt <= 4'hc;
				else if(cnt == 52) pool_cnt <= 0;
				else pool_cnt <= (pool_cnt == 11)? 0 : pool_cnt + 1;
			end
			S_SQUZ, S_DQUANT: pool_cnt <= (pool_cnt == 11)? 0 : pool_cnt + 1;
			
		endcase
	end
end

always @(posedge G_clock_mxpool or negedge rst_n) begin
	if(!rst_n)begin
		maxpool_l <= 0;
		maxpool_r <= 0;
	end else if(cs == S_SDOT || cs == S_SQUZ || cs == S_DQUANT)begin
		case (pool_cnt)
			4'h0: maxpool_l <= quant_conv1; 
			4'h1, 4'h6, 4'h7: maxpool_l <= (scmp_result)? quant_conv1 : maxpool_l;
			4'h2: maxpool_r <= quant_conv1;
			4'h3, 4'h8, 4'h9: maxpool_r <= (scmp_result)? quant_conv1 : maxpool_r;

		endcase
	end else begin
		maxpool_l <= ~maxpool_l;
		maxpool_r <= ~maxpool_r;
	end
end


always @(*) begin
	if(cs == S_SDOT || cs == S_SQUZ || cs == S_DQUANT)begin
		case (pool_cnt)
			4'h1, 4'h6, 4'h7:begin
				scmp_a = quant_conv1;
				scmp_b = maxpool_l;
			end
			4'h3, 4'h8, 4'h9:begin
				scmp_a = quant_conv1;
				scmp_b = maxpool_r;
			end
			default:begin
				scmp_a = quant_conv1;
				scmp_b = maxpool_l;
			end
		endcase
	end else begin
		scmp_a = quant_conv1;
		scmp_b = maxpool_l;
	end
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)begin
		pooled_arr[3] <= 0;
		pooled_arr[2] <= 0;
		pooled_arr[1] <= 0;
		pooled_arr[0] <= 0;
	end else begin
		if(cs == S_SDOT || cs == S_SQUZ || cs == S_DQUANT)begin
			if(pool_cnt == 8)begin
				pooled_arr[3] <= maxpool_l;
				pooled_arr[2] <= pooled_arr[3];
				pooled_arr[1] <= pooled_arr[2];
				pooled_arr[0] <= pooled_arr[1];
			end else if(pool_cnt == 10)begin
				pooled_arr[3] <= maxpool_r;
				pooled_arr[2] <= pooled_arr[3];
				pooled_arr[1] <= pooled_arr[2];
				pooled_arr[0] <= pooled_arr[1];
			end 
		end
	end
end

always @(posedge G_clock_flatarr1 or negedge rst_n) begin
	if(!rst_n)begin
		flatten_arr1[3] <= 0;
		flatten_arr1[2] <= 0;
		flatten_arr1[1] <= 0;
		flatten_arr1[0] <= 0;
	end else begin
		case(cs)
			S_INIT, S_PUREIN, S_OUTPUT :begin
				flatten_arr1[3] <= cnt;
				flatten_arr1[2] <= ~flatten_arr1[3];
				flatten_arr1[1] <= ~flatten_arr1[2];
				flatten_arr1[0] <= ~flatten_arr1[1];
			end
			S_SDOT:begin
				if(cnt < 7'd41)begin
					flatten_arr1[3] <= cnt;
					flatten_arr1[2] <= ~flatten_arr1[3];
					flatten_arr1[1] <= ~flatten_arr1[2];
					flatten_arr1[0] <= ~flatten_arr1[1];
				end else if(cnt == 7'd41 || cnt == 7'd42 || cnt == 7'd43 || cnt ==7'd44)begin
					flatten_arr1[3] <= sdiv_result;
					flatten_arr1[2] <= flatten_arr1[3];
					flatten_arr1[1] <= flatten_arr1[2];
					flatten_arr1[0] <= flatten_arr1[1];
				end
			end
		endcase
	end 		
end

always @(posedge G_clock_flatarr2 or negedge rst_n) begin
	if(!rst_n)begin
		flatten_arr2[3] <= 0;
		flatten_arr2[2] <= 0;
		flatten_arr2[1] <= 0;
		flatten_arr2[0] <= 0;
	end else begin
		case(cs)
			S_INIT, S_PUREIN, S_OUTPUT:begin
				flatten_arr2[3] <= cnt;
				flatten_arr2[2] <= ~flatten_arr2[3];
				flatten_arr2[1] <= ~flatten_arr2[2];
				flatten_arr2[0] <= ~flatten_arr2[1];
			end
			S_SDOT:begin
				if(cnt < 7'd68)begin
					flatten_arr2[3] <= cnt;
					flatten_arr2[2] <= ~flatten_arr2[3];
					flatten_arr2[1] <= ~flatten_arr2[2];
					flatten_arr2[0] <= ~flatten_arr2[1];
				end else if(cnt == 7'd68)begin
					flatten_arr2[3] <= sdiv_result;
				end
			end
			S_DQUANT:begin
				if(cnt == 7'd75)begin
					flatten_arr2[3] <= sdiv_result;
					flatten_arr2[2] <= flatten_arr2[3];
				end
			end
			S_FLAT2:begin
				if(cnt == 7'd77 || cnt == 7'd78)begin
					flatten_arr2[3] <= sdiv_result;
					flatten_arr2[2] <= flatten_arr2[3];
					flatten_arr2[1] <= flatten_arr2[2];
					flatten_arr2[0] <= flatten_arr2[1];
				end
			end
			
		endcase
	end
end

always @(*) begin
	case (cs)
		S_DQUANT:begin
			if(cnt == 75)begin
				smin_a = (flatten_arr1[0] > flatten_arr2[3])? flatten_arr1[0] : flatten_arr2[3];
				smin_b = (flatten_arr1[0] > flatten_arr2[3])? flatten_arr2[3] : flatten_arr1[0];
			end else begin
				smin_a = 0;
				smin_b = 0;
			end
		end
		S_FLAT2:begin
			case (cnt)
				7'd77:begin
					smin_a = (flatten_arr1[1] > flatten_arr2[3])? flatten_arr1[1] : flatten_arr2[3];
					smin_b = (flatten_arr1[1] > flatten_arr2[3])? flatten_arr2[3] : flatten_arr1[1];
				end
				7'd78:begin
					smin_a = (flatten_arr1[2] > flatten_arr2[3])? flatten_arr1[2] : flatten_arr2[3];
					smin_b = (flatten_arr1[2] > flatten_arr2[3])? flatten_arr2[3] : flatten_arr1[2];
				end
				default:begin
					smin_a = 0;
					smin_b = 0;
				end 
			endcase

		end
		S_CALC:begin
			smin_a = (flatten_arr1[3] > flatten_arr2[3])? flatten_arr1[3] : flatten_arr2[3];
			smin_b = (flatten_arr1[3] > flatten_arr2[3])? flatten_arr2[3] : flatten_arr1[3];
		end
		default:begin
			smin_a = 0;
			smin_b = 0;
		end
	endcase
end

always @(posedge G_clock_l1sum or negedge rst_n) begin
	if(!rst_n) L1_sum <= 0;
	else begin
		case (cs)
			S_INIT, S_PUREIN, S_SDOT, S_SQUZ: L1_sum <= ~L1_sum;
			S_DQUANT: if(cnt == 75) L1_sum <= smin_out;
			S_FLAT2:  if(cnt == 7'd77 || cnt == 7'd78) L1_sum <= L1_sum + smin_out;
		endcase
	end
end

//added, excessive
always @(posedge G_clock_start or negedge rst_n) begin
	if(!rst_n)begin
		for(idx = 0; idx < 12; idx = idx+1)begin
			ex_mem[idx] <= 0;
		end
	end else if(cs == S_INIT && in_valid)begin
		ex_mem[ 0] <= {ker[4:0], weight[4:0]};
		ex_mem[ 1] <= ex_mem[ 0];
		ex_mem[ 2] <= ex_mem[ 1];
		ex_mem[ 3] <= ex_mem[ 2];
		ex_mem[ 4] <= ex_mem[ 3];
		ex_mem[ 5] <= ex_mem[ 4];
		ex_mem[ 6] <= ex_mem[ 5];
		ex_mem[ 7] <= ex_mem[ 6];
		ex_mem[ 8] <= ex_mem[ 7];
		ex_mem[ 9] <= ex_mem[ 8];
		ex_mem[10] <= ex_mem[ 9];
		ex_mem[11] <= ex_mem[10];
	end else begin
		ex_mem[ 0] <= ex_mem[11];
		ex_mem[ 1] <= ex_mem[ 0];
		ex_mem[ 2] <= ex_mem[ 1];
		ex_mem[ 3] <= ex_mem[ 2];
		ex_mem[ 4] <= ex_mem[ 3];
		ex_mem[ 5] <= ex_mem[ 4];
		ex_mem[ 6] <= ex_mem[ 5];
		ex_mem[ 7] <= ex_mem[ 6];
		ex_mem[ 8] <= ex_mem[ 7];
		ex_mem[ 9] <= ex_mem[ 8];
		ex_mem[10] <= ex_mem[ 9];
		ex_mem[11] <= ex_mem[10];
	end
end


// output logic

always @(posedge G_clock_odb or negedge rst_n) begin
	if(!rst_n)begin
		out_data_buffer <= 0;
	end else begin
		if(cs == S_CALC)begin
			out_data_buffer <= ((L1_sum + smin_out) >= 16)? L1_sum + smin_out : 0;
		end else if(cs == S_SQUZ)begin
			out_data_buffer <= {ex_mem[1][4:0], ex_mem[5][9:5]};
		end else if(cs == S_DQUANT)begin
			out_data_buffer <= {ex_mem[3][4:0], ex_mem[10][9:5]};
		end else begin
			out_data_buffer <= ~out_data_buffer;
		end
	end
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)begin
		out_valid <= 0;
	end else begin
		if(cs == S_CALC)begin
			out_valid <= 1;
		end else begin
			out_valid <= 0;
		end
	end
end

always @(*) begin
	out_data = (out_valid)? out_data_buffer : 0;
end


endmodule