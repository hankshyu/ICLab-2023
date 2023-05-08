`include "synchronizer.v"
`include "syn_XOR.v"
module CONV(
	//io
	clk_1,
	clk_2,
	rst_n,
	in_valid,
	in_data1,
	in_data2,
	out_valid,
	out_data
);
//io
input clk_1,clk_2;
input rst_n;
input in_valid;
input [2:0] in_data1;
input [2:0] in_data2;

output reg out_valid;
output reg[7:0] out_data;
//FSM setting
reg [1:0]	count_1; // this is for input purpose

//reg,wire
wire [7:0] y [6:0] ;
reg[2:0] x[0:3],h[0:3],x_exe[0:3],h_exe[0:3];
wire inready;
//multi_cycle_path setting

localparam  S_INIT = 'd0;
localparam  S_CALC = 'd1;
localparam  S_OUTPUT = 'd2;
reg [2:0] current_state, next_state;
reg [2:0]	count_2; // this is for output purpose

always @(posedge clk_2 or negedge rst_n) begin
	if(!rst_n) current_state <= S_INIT;
	else current_state <= next_state;
end

always @(*) begin
	case(current_state)
		S_INIT: next_state = (inready && (~in_valid))? S_CALC : S_INIT;
		S_CALC: next_state = S_OUTPUT;
		S_OUTPUT: next_state = (count_2 == 6)? S_INIT : S_OUTPUT;
	endcase
end

//in
always@(posedge clk_1)begin
	if(in_valid)begin
		h[0]<=h[1];
		h[1]<=h[2];
		h[2]<=h[3];
		h[3]<=in_data1;
		x[0]<=x[1];
		x[1]<=x[2];
		x[2]<=x[3];
		x[3]<=in_data2;
	end 
	else begin
		h[0]<=h[0];
		h[1]<=h[1];
		h[2]<=h[2];
		h[3]<=h[3];
		x[0]<=x[0];
		x[1]<=x[1];
		x[2]<=x[2];
		x[3]<=x[3];
	end
end

//exe
always@(posedge clk_2)
	if(inready)begin
		h_exe[0]<= h[0];  
		h_exe[1]<= h[1]; 
		h_exe[2]<= h[2]; 
		h_exe[3]<= h[3]; 
	end 

always@(posedge clk_2)
	if(inready) begin
		x_exe[0]<= x[0];  
		x_exe[1]<= x[1];  
		x_exe[2]<= x[2];  
		x_exe[3]<= x[3];  

	end


assign y[0]=x_exe[0]*h_exe[0];
assign y[1]=x_exe[1]*h_exe[0] + x_exe[0]*h_exe[1];
assign y[2]=x_exe[2]*h_exe[0] + x_exe[1]*h_exe[1] + x_exe[0]*h_exe[2];
assign y[3]=x_exe[3]*h_exe[0] + x_exe[2]*h_exe[1] + x_exe[1]*h_exe[2] + x_exe[0]*h_exe[3];
assign y[4]=x_exe[3]*h_exe[1] + x_exe[2]*h_exe[2] + x_exe[1]*h_exe[3];
assign y[5]=x_exe[3]*h_exe[2] + x_exe[2]*h_exe[3];
assign y[6]=x_exe[3]*h_exe[3];
//out
always@(posedge clk_2 or negedge rst_n)
	if(!rst_n)begin
		out_valid<=0;
		out_data<=0;
	end else if(current_state == S_OUTPUT || current_state == S_CALC)begin
		out_valid<=1;
		out_data<=y[count_2];
	end else begin
		out_valid<=0;
		out_data<=0;
	end
//FSM
always@(posedge clk_1 or negedge rst_n)
	if(!rst_n)
		count_1 <= 3;
	else if(count_1!=3)
		count_1 <= count_1+1;
	else if(in_valid)
		count_1 <= 0;
	else
		count_1 <= count_1;

always@(posedge clk_2 or negedge rst_n)
	if(!rst_n)
		count_2 <= 0;
	else if(current_state == S_OUTPUT)
		count_2 <= count_2+1;
	else if(current_state == S_CALC)
		count_2 <= 1;
	else 
		count_2 <= 0;

syn_XOR in_exe(
	.IN(in_valid),/*fill in the blank*/
	.OUT(inready),/*fill in the blank*/
	.TX_CLK(clk_1),/*fill in the blank*/
	.RX_CLK(clk_2),/*fill in the blank*/
	.RST_N(rst_n)/*fill in the blank*/
	);



endmodule

