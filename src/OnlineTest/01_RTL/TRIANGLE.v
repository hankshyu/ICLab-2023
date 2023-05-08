//synopsys translate_off
`include "DW_div.v"
`include "DW_div_seq.v"
`include "DW_div_pipe.v"
//synopsys translate_on

module TRIANGLE(
    clk,
    rst_n,
    in_valid,
    in_length,
    out_cos,
    out_valid,
    out_tri
);
input wire clk, rst_n, in_valid;
input wire [7:0] in_length;

output reg out_valid;
output reg [15:0] out_cos;
output reg [1:0] out_tri;
//registers declrations
reg [8-1 : 0] a, b, c;
reg [16-1 : 0] as, bs, cs; // the square of abc(us)

reg asign, bsign, csign;
wire signed [18-1 : 0] ast, bst, cst;
assign ast = $signed({1'b0,bs}) + $signed({1'b0,cs}) - $signed({1'b0,as});
assign bst = $signed({1'b0,as}) + $signed({1'b0,cs}) - $signed({1'b0,bs});
assign cst = $signed({1'b0,as}) + $signed({1'b0,bs}) - $signed({1'b0,cs});
reg [17-1 : 0] at, bt, ct; // the dividend b^2 + c^2 - a^2
reg [17-1 : 0] ab, bb, cb; // the bottom 2*b*c(must be +)

reg [30-1 : 0] aq, bq, cq; // 17+13
//this contains the fraction part of the division


//Designware param & reg declarations for division
parameter inst_a_width = 30;
parameter inst_b_width = 17;
parameter inst_tc_mode = 0;
parameter inst_rem_mode = 1;
parameter inst_num_stages = 15;
parameter inst_stall_mode = 0;
parameter inst_rst_mode = 1;
parameter inst_op_iso_mode = 0; 

reg [30-1 : 0] div_a;
reg [17-1 : 0] div_b;
wire signed [30-1 : 0] div_quotient;
wire signed [17-1 : 0] div_rem;
wire div_dz;
//Instantiate DesignWare IP
DW_div_pipe #(
inst_a_width,
inst_b_width,
inst_tc_mode,
inst_rem_mode,
inst_num_stages,
inst_stall_mode,
inst_rst_mode,
inst_op_iso_mode)
U1 (.clk(clk),
.rst_n(rst_n),
.en(1'b0),
.a(div_a),
.b(div_b),
.quotient(div_quotient),
.remainder(div_rem),
.divide_by_0(div_dz) 
);

// FSM declaration
localparam S_INIT = 'd0;   
localparam S_INPUT1 = 'd1; 
localparam S_INPUT2 = 'd2;
localparam S_CALS = 'd3; 
localparam S_CALM = 'd4;
localparam S_D1 = 'd5;
localparam S_D2 = 'd6;
localparam S_D3 = 'd7;
localparam S_DDONE = 'd8;//do division
localparam S_OUTPUT1 = 'd9;   
localparam S_OUTPUT2 = 'd10;   
localparam S_OUTPUT3 = 'd11;   
reg [3:0] current_state, next_state;
reg [5:0] cnt; //the universal counter

always@(posedge clk or negedge rst_n) begin
	if(!rst_n) current_state <= S_INIT;
	else current_state <= next_state;
end
always@(*)begin
	case(current_state)
		S_INIT: next_state = (in_valid)? S_INPUT1 : S_INIT;
		S_INPUT1: next_state = S_INPUT2;
		S_INPUT2: next_state = S_CALS;
		S_CALS: next_state = S_CALM;
		S_CALM: next_state = S_D1;
		S_D1: next_state = S_D2;
		S_D2: next_state = S_D3;
		S_D3: next_state = (cnt == 16)? S_DDONE : S_D3;
		S_DDONE: next_state = S_OUTPUT1;
		S_OUTPUT1: next_state = S_OUTPUT2;
		S_OUTPUT2: next_state = S_OUTPUT3;
		S_OUTPUT3: next_state = S_INIT;
		default: next_state = S_INIT;
	endcase
end
always@(posedge clk or negedge rst_n) begin
	if(!rst_n) cnt <= 0;
	else begin
		case(current_state)
			S_INIT: cnt <= 0;
			S_D1: cnt <= 0;
			S_OUTPUT1: cnt <= 0;
			S_DDONE: cnt <= 0;
			default: cnt <= cnt + 1;
		endcase
	end
end

//input abc
always @(posedge clk or negedge rst_n)begin
	if(!rst_n) a <= 0;
	else if(current_state == S_INIT && in_valid) a <= in_length;
end
always @(posedge clk or negedge rst_n)begin
	if(!rst_n) b <= 0;
	else if(current_state == S_INPUT1) b <= in_length;
end
always @(posedge clk or negedge rst_n)begin
	if(!rst_n) c <= 0;
	else if(current_state == S_INPUT2) c <= in_length;
end

//calculate squares
always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		as <= 0;
		bs <= 0;
		cs <= 0;
	end else if(current_state == S_CALS)begin
		as <= a*a;
		bs <= b*b;
		cs <= c*c;
	end
end

//calculate up and bottom
always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		at <= 0;
		bt <= 0;
		ct <= 0;
		ab <= 0;
		bb <= 0;
		cb <= 0;
		asign <= 0;
		bsign <= 0;
		csign <= 0;
	end else if(current_state == S_CALM)begin
		at <= (ast >= 0) ? ast : (-ast); 
		bt <= (bst >= 0) ? bst : (-bst);
		ct <= (cst >= 0) ? cst : (-cst);
		asign <= (ast >= 0) ? 1'b0 : 1'b1;
		bsign <= (bst >= 0) ? 1'b0 : 1'b1;
		csign <= (cst >= 0) ? 1'b0 : 1'b1;

		ab <= 2 * b * c;
		bb <= 2 * a * c;
		cb <= 2 * a * b;

	end
end
//send data to the divider

always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		div_a <= 0;
		div_b <= 0;
	end else begin
		case(current_state)
			S_INIT:	begin
						div_a <= 0;
						div_b <= 0;
					end
			S_D1:	begin
						div_a <= {at,13'd0};
						div_b <= ab;
					end
			S_D2:	begin
						div_a <= {bt,13'd0};
						div_b <= bb;
					end
			S_D3:	begin
						div_a <= {ct, 13'd0};
						div_b <= cb;
					end

		endcase
	end
end
//save the outputs
always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		aq <= 0;
		bq <= 0;
		cq <= 0;

	end else if(current_state == S_D3)begin
		if(cnt == 14)begin
			aq <= div_quotient;
		end else if(cnt == 15)begin
			bq <= div_quotient;
		end else if(cnt == 16)begin
			cq <= div_quotient;
		end
	end
end




//output logic
always@(posedge clk or negedge rst_n)begin
	if(!rst_n) out_valid <= 0;
	else if (current_state == S_DDONE || current_state == S_OUTPUT1 || current_state == S_OUTPUT2)begin
		out_valid <= 1;
	end else out_valid <= 0;
end
always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		out_cos <= 0;
		out_tri <= 0;
	end else if (current_state == S_DDONE)begin
		if(asign) out_cos <= (~aq[15:0]+1);
		else out_cos <= aq[15:0];
		//output logic of out_tri
		if(a > b && a > c)begin // a is the largest angle
			if(asign == 1'b1) out_tri <= 2'b01;
			else if(at == 0) out_tri <= 2'b11;
			else out_tri <= 2'b00;
		end else if(b > c) begin// b is the largest angle
			if(bsign == 1'b1) out_tri <= 2'b01;
			else if(bt == 0) out_tri <= 2'b11;
			else out_tri <= 2'b00;
		end else begin // c is the largest angle
			if(csign == 1'b1) out_tri <= 2'b01;
			else if(ct == 0) out_tri <= 2'b11;
			else out_tri <= 2'b00;
		end

	end else if(current_state == S_OUTPUT1)begin
		if(bsign) out_cos <= (~bq[15:0]+1);
		else out_cos <= bq[15:0];
		
		out_tri <= 0;

	end else if(current_state == S_OUTPUT2)begin
		if(csign) out_cos <= (~cq[15:0]+1);
		else out_cos <= cq[15:0];
		out_tri <= 0;
	end else begin
		out_cos <= 0;
		out_tri <= 0;
	end
end


endmodule
