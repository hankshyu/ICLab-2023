//++++++++++++++ Include DesignWare++++++++++++++++++


//+++++++++++++++++++++++++++++++++++++++++++++++++

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
parameter inst_ieee_compliance = 0;
parameter inst_arch = 2;

// FSM parameters
parameter	ST_IDLE		=	'd0,
			ST_INPUT	=	'd1,
			ST_CALCULATE =  'd2,
			ST_OUTPUT	=	'd3;
			
//---------------------------------------------------------------------
//   INPUT AND OUTPUT DECLARATION
//---------------------------------------------------------------------
input  clk, rst_n, in_valid;
input [inst_sig_width+inst_exp_width:0] vector_1, vector_2;
output reg	out_valid;
output reg [inst_sig_width+inst_exp_width:0] out;

//---------------------------------------------------------------------
//   WIRE AND REG DECLARATION
//---------------------------------------------------------------------
integer i;
reg [inst_sig_width+inst_exp_width:0] vector_1_store[1:0], vector_2_store[1:0],result; 
reg [9:0] count;
reg	[2:0] cs,ns;

// Use for designware
reg [inst_sig_width+inst_exp_width:0] mult_a, mult_b, add_a, add_b;
wire [inst_sig_width+inst_exp_width:0] mult_out, add_out;

//---------------------------------------------------------------------
//   DesignWare
//---------------------------------------------------------------------
DW_fp_mult #(inst_sig_width, inst_exp_width, inst_ieee_compliance) M0 (.a(mult_a), .b(mult_b), .rnd(3'b000), .z(mult_out));
DW_fp_add #(inst_sig_width, inst_exp_width, inst_ieee_compliance) A0 (.a(add_a), .b(add_b), .rnd(3'b000), .z(add_out));

//---------------------------------------------------------------------
//   ALGORITHM
//---------------------------------------------------------------------
always@(posedge clk or negedge rst_n)	
begin
	if(!rst_n)
	begin
		vector_1_store[0] <= 0;
		vector_1_store[1] <= 0;
	end
	else if(in_valid)
	begin
		vector_1_store[0] <= vector_1_store[1];
		vector_1_store[1] <= vector_1;
	end
end

always@(posedge clk or negedge rst_n)	
begin
	if(!rst_n)
	begin
		vector_2_store[0] <= 0;
		vector_2_store[1] <= 0;
	end
	else if(in_valid)
	begin
		vector_2_store[0] <= vector_2_store[1];
		vector_2_store[1] <= vector_2;
	end
end

always@(posedge clk or negedge rst_n)	
begin
	if(!rst_n)
	begin
		mult_a <= 0;
		mult_b <= 0;
	end
	else if(cs==ST_CALCULATE&&count==0)
	begin
		mult_a <= vector_1_store[0];
		mult_b <= vector_2_store[0];
	end
	else if(cs==ST_CALCULATE&&count==1)
	begin
		mult_a <= vector_1_store[1];
		mult_b <= vector_2_store[1];
	end
end

always@(posedge clk or negedge rst_n)	
begin
	if(!rst_n)
	begin
		add_a <= 0;
		add_b <= 0;
	end
	else if(cs==ST_CALCULATE&&(count>0))
	begin
		add_a <= result;
		add_b <= mult_out;
	end
end

always@(posedge clk or negedge rst_n)	
begin
	if(!rst_n)
	begin
		result <= 0;
	end
	else if(cs==ST_CALCULATE&&(count>0))
	begin
		result <= add_out;
	end
	else
		result <= 0;
end
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


//---------------------------------------------------------------------
//   COUNTER
//---------------------------------------------------------------------

always@(posedge clk or negedge rst_n)	
begin
	if(!rst_n)
		count <= 0;
	else if(cs == ST_CALCULATE)
		count <= count + 1;
	else
		count <= 0;
end

//---------------------------------------------------------------------
//   OUTPUT
//---------------------------------------------------------------------
always@(posedge clk or negedge rst_n)	
begin
	if(!rst_n)
		out_valid <= 0;
	else if(cs==ST_OUTPUT)
		out_valid <= 1;
	else
		out_valid <= 0;
end

always@(posedge clk or negedge rst_n)	
begin
	if(!rst_n)
		out <= 0;
	else if(cs == ST_OUTPUT)
		out <= result;
	else
		out <= 0;
end

//---------------------------------------------------------------------
//   Finite-State Mechine                                          
//---------------------------------------------------------------------
always@(posedge	clk or negedge rst_n)	begin
	if(!rst_n) 
		cs	<=	ST_IDLE;
	else 
		cs	<=	ns;
end

always@(*)	begin
	case(cs)
		ST_IDLE:	
		begin
			if(in_valid) ns =	ST_INPUT;
			else ns	=	ST_IDLE;
		end
		
		ST_INPUT:	
		begin
			if(!in_valid) ns = ST_CALCULATE;
			else ns	= ST_INPUT;
		end
		
		ST_CALCULATE:
		begin
			if(count==4) ns = ST_OUTPUT;
			else ns = ST_CALCULATE;
		end
		
		ST_OUTPUT:
		begin
			ns	= ST_IDLE;
		end
		
		default:	
		begin
			ns	=	ST_IDLE;
		end
	endcase
end
endmodule
