// synopsys translate_off 
`ifdef RTL
`include "GATED_OR.v"
`else
`include "Netlist/GATED_OR_SYN.v"
`endif
// synopsys translate_on
module IP(
	// Input signals
	clk,
	rst_n,
	in_valid_1,
	in_image,
	in_valid_2,
	in_mode,
	cg_en,
	// Output signals
	out_valid,
	out_number
);

//---------------------------------------------------------------------
//   INPUT AND OUTPUT DECLARATION                         
//---------------------------------------------------------------------
input clk, rst_n, in_valid_1, in_valid_2;
input [1:0] in_mode;
input cg_en;
input [7:0] in_image;
output reg out_valid;
output reg signed [11:0] out_number;

//---------------------------------------------------------------------
// PARAMETER DECLARATION
//---------------------------------------------------------------------
parameter S_IDLE 	= 3'd0;
parameter S_INIMG 	= 3'd1;
parameter S_INCMD 	= 3'd2;
parameter S_PAD		= 3'd3;
parameter S_PROC 	= 3'd4;
parameter S_OUT 	= 3'd5;

//---------------------------------------------------------------------
//   WIRE AND REG DECLARATION
//---------------------------------------------------------------------
reg [2:0]	curr_state, next_state;
reg [1:0]	mode;
reg [7:0]	img [7:0][7:0];
reg signed [11:0]	img_shar [9:0][9:0];
reg [7:0]	img_mean [9:0][9:0];
reg [7:0]	img_midp [9:0][9:0];
reg [11:0]	out [7:0][7:0];
reg [5:0]	cnt;
reg ctrl_shar, ctrl_mean, ctrl_midp;
wire [7:0]	max_lv1_12, max_lv1_34, max_lv1_56, max_lv1_78, max_lv1_9, min_lv1_12, min_lv1_34, min_lv1_56, min_lv1_78, min_lv1_9;
wire [7:0]	max_lv2_1234, max_lv2_5678, max_lv2_9, min_lv2_1234, min_lv2_5678, min_lv2_9;
wire [7:0]	max_lv3_12345678, max_lv3_9, min_lv3_12345678, min_lv3_9;
wire [7:0]	max, min;

//---------------------------------------------------------------------
//   Clock gating logic; you should fill in the following below.
//---------------------------------------------------------------------
wire G_clock_shar;
wire G_sleep_shar = (cg_en)? ctrl_shar : 1'b1;
// wire G_sleep_shar = 0;
GATED_OR GATED_shar (
	.CLOCK(clk),
	.SLEEP_CTRL(G_sleep_shar),	// gated clock
	.RST_N(rst_n),
	.CLOCK_GATED(G_clock_shar)
);

wire G_clock_mean;
wire G_sleep_mean = (cg_en)? ctrl_mean : 1'b1;
// wire G_sleep_mean = 0;
GATED_OR GATED_mean (
	.CLOCK(clk),
	.SLEEP_CTRL(G_sleep_mean),	// gated clock
	.RST_N(rst_n),
	.CLOCK_GATED(G_clock_mean)
);

wire G_clock_midp;
wire G_sleep_midp = (cg_en)? ctrl_midp : 1'b1;
// wire G_sleep_midp = 0;
GATED_OR GATED_midp (
	.CLOCK(clk),
	.SLEEP_CTRL(G_sleep_midp),	// gated clock
	.RST_N(rst_n),
	.CLOCK_GATED(G_clock_midp)
);

always @(*) begin

	// if(curr_state == S_PROC || curr_state == S_PAD || curr_state == S_INCMD)begin
		case (mode)
			2'd0:begin
			ctrl_shar = 0;
			ctrl_mean = 1;
			ctrl_midp = 1;
			end
			2'd1:begin
			ctrl_shar = 1;
			ctrl_mean = 0;
			ctrl_midp = 1;
			end
			2'd2:begin
			ctrl_shar = 1;
			ctrl_mean = 1;
			ctrl_midp = 0;
			end
			default: begin
			ctrl_shar = 1;
			ctrl_mean = 1;
			ctrl_midp = 1;
			end
		endcase
	// end else begin
	// 		ctrl_shar = 1;
	// 		ctrl_mean = 1;
	// 		ctrl_midp = 1;
	// end
end

//---------------------------------------------------------------------
//   Clock gating logic; you should fill in the blanks above.
//---------------------------------------------------------------------

always @(posedge clk or negedge rst_n) begin
	if (~rst_n)	curr_state <= S_IDLE;
	else		curr_state <= next_state;
end

always @(*) begin
	case (curr_state)
		S_IDLE: 	if (in_valid_1)			next_state = S_INIMG;
					else if (in_valid_2)	next_state = S_INCMD;
					else					next_state = S_IDLE;
		S_INIMG:	if (in_valid_1)			next_state = S_INIMG;
					else					next_state = S_INCMD;
		S_INCMD:	next_state = S_PAD;
		S_PAD:		next_state = S_PROC;
		S_PROC:		if (cnt == 'd0)			next_state = S_OUT;
                    else                    next_state = S_PROC;
		S_OUT:		if (cnt == 'd0)			next_state = S_IDLE;
                    else                    next_state = S_OUT;
		default: 	next_state = S_IDLE;
	endcase
end

always @(posedge clk or negedge rst_n) begin
	if (~rst_n)	mode <= 'd0;
	else begin
		if (next_state == S_INCMD)	mode <= in_mode;
		else						mode <= mode;
	end
end

always @(posedge clk or negedge rst_n) begin
	if (~rst_n)	cnt <= 'd0;
	else begin
		if ((next_state == S_PROC) || (next_state == S_OUT))	cnt <= cnt + 'd1;
		else													cnt <= 'd0;
	end
end

assign max_lv1_12 = (img_midp[0][0] > img_midp[0][1])? img_midp[0][0]:img_midp[0][1];
assign max_lv1_34 = (img_midp[0][2] > img_midp[1][0])? img_midp[0][2]:img_midp[1][0];
assign max_lv1_56 = (img_midp[1][1] > img_midp[1][2])? img_midp[1][1]:img_midp[1][2];
assign max_lv1_78 = (img_midp[2][0] > img_midp[2][1])? img_midp[2][0]:img_midp[2][1];
assign max_lv1_9  =  img_midp[2][2];
assign min_lv1_12 = (img_midp[0][0] > img_midp[0][1])? img_midp[0][1]:img_midp[0][0];
assign min_lv1_34 = (img_midp[0][2] > img_midp[1][0])? img_midp[1][0]:img_midp[0][2];
assign min_lv1_56 = (img_midp[1][1] > img_midp[1][2])? img_midp[1][2]:img_midp[1][1];
assign min_lv1_78 = (img_midp[2][0] > img_midp[2][1])? img_midp[2][1]:img_midp[2][0];
assign min_lv1_9  =  img_midp[2][2];
assign max_lv2_1234 = (max_lv1_12 > max_lv1_34)? max_lv1_12:max_lv1_34;
assign max_lv2_5678 = (max_lv1_56 > max_lv1_78)? max_lv1_56:max_lv1_78;
assign max_lv2_9    =  max_lv1_9;
assign min_lv2_1234 = (min_lv1_12 > min_lv1_34)? min_lv1_34:min_lv1_12;
assign min_lv2_5678 = (min_lv1_56 > min_lv1_78)? min_lv1_78:min_lv1_56;
assign min_lv2_9    =  min_lv1_9;
assign max_lv3_12345678 = (max_lv2_1234 > max_lv2_5678)? max_lv2_1234:max_lv2_5678;
assign max_lv3_9        =  max_lv2_9;
assign min_lv3_12345678 = (min_lv2_1234 > min_lv2_5678)? min_lv2_5678:min_lv2_1234;
assign min_lv3_9        =  min_lv2_9;
assign max = (max_lv3_12345678 > max_lv3_9)? max_lv3_12345678:max_lv3_9;
assign min = (min_lv3_12345678 > min_lv3_9)? min_lv3_9:min_lv3_12345678;

genvar i, j;
generate
for (i = 0; i < 8; i = i + 1) begin
	for (j = 0; j < 8; j = j + 1) begin
		if ((i == 7) && (j == 7)) begin
			always @(posedge clk or negedge rst_n) begin
				if (~rst_n)	img[i][j] <= 'd0;
				else begin
					if (next_state == S_INIMG)	img[i][j] <= in_image;
					else						img[i][j] <= img[i][j];
				end
			end
		end else begin
			always @(posedge clk or negedge rst_n) begin
				if (~rst_n)	img[i][j] <= 'd0;
				else begin
					if (next_state == S_INIMG)	img[i][j] <= img[i + (j == 7)][(j + 1) % 8];
					else						img[i][j] <= img[i][j];
				end
			end
		end
	end
end
for (i = 0; i < 10; i = i + 1) begin
	for (j = 0; j < 10; j = j + 1) begin
		if ((i == 0) || (i == 9) || (j == 0) || (j == 9)) begin
			always @(posedge G_clock_shar or negedge rst_n) begin
				if (~rst_n)	img_shar[i][j] <= 'd0;
				else begin
					case (next_state)
						S_PAD:		img_shar[i][j] <= 'd0;
						S_PROC:		if (cnt[2:0] == 3'd7)	img_shar[i][j] <= img_shar[(i + 1) % 10][j];
									else begin
										if (cnt[3])			img_shar[i][j] <= img_shar[i][(j + 9) % 10];
										else				img_shar[i][j] <= img_shar[i][(j + 1) % 10];
									end
						default:	img_shar[i][j] <= img_shar[i][j];
					endcase
				end
			end
			always @(posedge G_clock_mean or negedge rst_n) begin
				if (~rst_n)	img_mean[i][j] <= 'd0;
				else begin
					case (next_state)
						S_PAD:		img_mean[i][j] <= 'd0;
						S_PROC:		if (cnt[2:0] == 3'd7)	img_mean[i][j] <= img_mean[(i + 1) % 10][j];
									else begin
										if (cnt[3])			img_mean[i][j] <= img_mean[i][(j + 9) % 10];
										else				img_mean[i][j] <= img_mean[i][(j + 1) % 10];
									end
						default:	img_mean[i][j] <= img_mean[i][j];
					endcase
				end
			end
			always @(posedge G_clock_midp or negedge rst_n) begin
				if (~rst_n)	img_midp[i][j] <= 'd0;
				else begin
					case (next_state)
						S_PAD:		img_midp[i][j] <= 'd0;
						S_PROC:		if (cnt[2:0] == 3'd7)	img_midp[i][j] <= img_midp[(i + 1) % 10][j];
									else begin
										if (cnt[3])			img_midp[i][j] <= img_midp[i][(j + 9) % 10];
										else				img_midp[i][j] <= img_midp[i][(j + 1) % 10];
									end
						default:	img_midp[i][j] <= img_midp[i][j];
					endcase
				end
			end
		end else begin
			always @(posedge G_clock_shar or negedge rst_n) begin
				if (~rst_n)	img_shar[i][j] <= 'd0;
				else begin
					case (next_state)
						S_PAD:		img_shar[i][j] <= {4'd0, img[i - 1][j - 1]};
						S_PROC:		if (cnt[2:0] == 3'd7)	img_shar[i][j] <= img_shar[(i + 1) % 10][j];
									else begin
										if (cnt[3])			img_shar[i][j] <= img_shar[i][(j + 9) % 10];
										else				img_shar[i][j] <= img_shar[i][(j + 1) % 10];
									end
						default:	img_shar[i][j] <= img_shar[i][j];
					endcase
				end
			end
			always @(posedge G_clock_mean or negedge rst_n) begin
				if (~rst_n)	img_mean[i][j] <= 'd0;
				else begin
					case (next_state)
						S_PAD:		img_mean[i][j] <= img[i - 1][j - 1];
						S_PROC:		if (cnt[2:0] == 3'd7)	img_mean[i][j] <= img_mean[(i + 1) % 10][j];
									else begin
										if (cnt[3])			img_mean[i][j] <= img_mean[i][(j + 9) % 10];
										else				img_mean[i][j] <= img_mean[i][(j + 1) % 10];
									end
						default:	img_mean[i][j] <= img_mean[i][j];
					endcase
				end
			end
			always @(posedge G_clock_midp or negedge rst_n) begin
				if (~rst_n)	img_midp[i][j] <= 'd0;
				else begin
					case (next_state)
						S_PAD:		img_midp[i][j] <= img[i - 1][j - 1];
						S_PROC:		if (cnt[2:0] == 3'd7)	img_midp[i][j] <= img_midp[(i + 1) % 10][j];
									else begin
										if (cnt[3])			img_midp[i][j] <= img_midp[i][(j + 9) % 10];
										else				img_midp[i][j] <= img_midp[i][(j + 1) % 10];
									end
						default:	img_midp[i][j] <= img_midp[i][j];
					endcase
				end
			end
		end
	end
end
for (i = 0; i < 8; i = i + 1) begin
	for (j = 0; j < 8; j = j + 1) begin
		if ((i == 7) && (j == 7)) begin
			always @(posedge clk or negedge rst_n) begin
				if (~rst_n)	out[i][j] <= 'd0;
				else begin
					case (next_state)
						S_PROC: 	case (mode)
										2'd0:		out[i][j] <= 12'd5 * img_shar[1][1] - img_shar[0][1] - img_shar[1][0] - img_shar[1][2] - img_shar[2][1];
										2'd1:		out[i][j] <= (img_mean[0][0] + img_mean[0][1] + img_mean[0][2]
																+ img_mean[1][0] + img_mean[1][1] + img_mean[1][2]
																+ img_mean[2][0] + img_mean[2][1] + img_mean[2][2]) / 12'd9;
										default:	out[i][j] <= (max + min) >> 1;
									endcase
						S_OUT:		if (cnt == 'd0)			out[i][j] <= out[i][(j + 7) % 8];
									else					out[i][j] <= out[(i + (j == 7)) % 8][(j + 1) % 8];
						default: 	out[i][j] <= 'd0;
					endcase
				end
			end
		end else begin
			always @(posedge clk or negedge rst_n) begin
				if (~rst_n)	out[i][j] <= 'd0;
				else begin
					case (next_state)
						S_PROC: 	if (cnt[2:0] == 3'd0)	out[i][j] <= out[(i + 1) % 8][j];
									else begin
										if (cnt[3])			out[i][j] <= out[i][(j + 7) % 8];
										else				out[i][j] <= out[i][(j + 1) % 8];
									end
						S_OUT:		if (cnt == 'd0)			out[i][j] <= out[i][(j + 7) % 8];
									else					out[i][j] <= out[i + (j == 7)][(j + 1) % 8];
						default: 	out[i][j] <= 'd0;
					endcase
				end
			end
		end
	end
end
endgenerate

always @(*) begin
    if (curr_state == S_OUT) begin
        out_valid = 'd1;
        out_number = out[0][0];
    end else begin
        out_valid = 'd0;
		out_number = 'd0;
    end
end


endmodule
