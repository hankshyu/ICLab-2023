module QS(
	//io
	clk,
	rst_n,
	in_valid,
	in_data,
	action,
	out_valid,
	out_data
);
//io
input	clk;
input	rst_n;
input	in_valid;
input	[7:0]in_data;
input	action;
output	reg out_valid;
output	reg[7:0] out_data;

//FSM settings
localparam	ST_IDLE	 	= 'd0;
localparam  ST_INPUT 	= 'd1;
localparam  ST_OUTPUT	= 'd2;
localparam  ST_WAITDONE = 'd3;

reg[1:0]	cs,ns;

//reg,wire
reg [7:0] in_buffer;
reg[3:0] count, len;
reg act;

reg[7:0] sram_d;
reg[3:0] sram_a;
wire[7:0] sram_q;
reg sram_wen; // 1 for read and 0 for write

//FSM
always@(posedge	clk or negedge rst_n)	begin
	if(!rst_n) cs <= ST_IDLE;
	else cs <= ns;
end
					
always@(*)	begin
	case(cs)
		ST_IDLE: ns = (in_valid)? ST_INPUT : ST_IDLE;
		ST_INPUT: ns = (!in_valid)? ST_OUTPUT: ST_INPUT;
		ST_OUTPUT: ns = (count == len)?ST_WAITDONE : ST_OUTPUT;
		ST_WAITDONE: ns = (count == len+1)? ST_IDLE: ST_WAITDONE;
		default: ns = ST_IDLE;
	endcase
end

always@(posedge clk or negedge rst_n)begin
	if(!rst_n) count <= 0;
	else begin
		case (cs)
			ST_IDLE: count <= 0;
			ST_INPUT:begin
				if(~in_valid)
					count <= 0;
				else 
					count <= count + 1;
			end
			ST_OUTPUT, ST_WAITDONE: count <= count + 1;
		endcase
	end
end
always@(posedge clk or negedge rst_n)begin
	if(!rst_n) len <= 0;
	else if(cs == ST_IDLE) len <= 0;
	else if(cs == ST_INPUT && in_valid) len <= len+1;
end
always@(posedge clk or negedge rst_n)begin
	if(!rst_n)
		act <= 0;
	else if(in_valid && cs == ST_IDLE)begin
		act <= action;
	end
end
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		in_buffer <= 0;
	else if(in_valid)
		in_buffer <= in_data;
end


always@(*)begin
	case (cs)
		ST_IDLE:begin
			sram_d = 0;
			sram_a = 0;
			sram_wen = 1; // default set to read is safer
		end 
		ST_INPUT:begin
			sram_d = in_buffer;
			sram_a = count;
			sram_wen = 0;
		end
		ST_OUTPUT:begin
			sram_d = 0;
			sram_a = (act)? len-count: count;
			sram_wen = 1;
		end
		ST_WAITDONE:begin
			sram_d = 0;
			sram_a = 0;
			sram_wen = 1;
		end
	endcase
end


RA1SH U_SRAM(.Q(sram_q),.CLK(clk),.CEN(1'b0),.WEN(sram_wen),.A(sram_a),.D(sram_d),.OEN(1'b0));/**/

//output logic
always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		out_valid <= 0;
		out_data <= 0;
	end else if(((cs == ST_OUTPUT ||cs == ST_WAITDONE))&& count >= 1) begin
		out_valid <= 1;
		out_data <= sram_q;
	end else begin
		out_valid <= 0;
		out_data <= 0;
	end
end


endmodule
