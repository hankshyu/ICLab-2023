module VIP(
	// Input signals
	clk,
	rst_n,
	in_valid,
	vector_1,
	vector_2,
	// Output signals
	out_valid,
	out
);
//---------------------------------------------------------------------
//   PARAMETER
//---------------------------------------------------------------------

// IEEE floating point paramenters
parameter inst_sig_width = 23;
parameter inst_exp_width = 8;
parameter float_len = inst_sig_width + inst_exp_width + 1;
parameter inst_ieee_compliance = 0;
parameter inst_arch = 2;
//---------------------------------------------------------------------
//   INPUT AND OUTPUT DECLARATION
//---------------------------------------------------------------------
input  clk, rst_n, in_valid;
input [float_len-1 : 0] vector_1, vector_2;
output reg	out_valid;
output reg [float_len-1 : 0] out;

// FSM parameters

reg current_state;

reg [2:0] cnt;

always @(posedge clk or negedge rst_n) begin
	if(!rst_n) current_state <= 0;
	else if(!current_state && in_valid) current_state <= 1;
	else if(current_state && (cnt == 2)) current_state <= 0;
end

//---------------------------------------------------------------------
//   Instantiate designware IP:
//---------------------------------------------------------------------
//Floating-Point Multiplier
reg [32-1 : 0] mult_a, mult_b;
wire [32-1 : 0] mult_out;

DW_fp_mult #(.sig_width(inst_sig_width), .exp_width(inst_exp_width), .ieee_compliance(inst_ieee_compliance))
	mult1 ( .a(mult_a), .b(mult_b), .rnd(3'b000), .z(mult_out), .status() );
//Floating-Point Adder 
reg [32-1 : 0] add_a, add_b;
wire [32-1 : 0] add_out;

DW_fp_add #(.sig_width(inst_sig_width), .exp_width(inst_exp_width), .ieee_compliance(inst_ieee_compliance))
	add1 ( .a(add_a), .b(add_b), .rnd(3'b000), .z(add_out), .status() );


always @(posedge clk or negedge rst_n) begin
	if(!rst_n) cnt <= 0;
	else cnt <= (current_state)? cnt + 1 : 0;
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)begin
		mult_a <= 0;
		mult_b <= 0;
	end else if (in_valid)begin
		mult_a <= vector_1;
		mult_b <= vector_2;
	end
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)begin
		add_a <= 0;
		add_b <= 0;
	end else begin
		add_a <= mult_out;
		add_b <= add_a;
		
	end
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)begin
		out_valid <= 0;
		out <= 0;
	end else if(cnt == 2)begin
		out_valid <= 1;
		out <= add_out;
	end else begin
		out_valid <= 0;
		out <= 0;
	end
end






endmodule