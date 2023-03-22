//############################################################################
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//   (C) Copyright Laboratory System Integration and Silicon Implementation
//   All Right Reserved
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   2018 ICLAB fall Course
//   Lab03	    : Vector Reverse Ordering
//   Author         : Yi Syuan Chen
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   File Name   : VRO.v
//   Module Name : VRO
//   Release version : v1.0
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//############################################################################


module VRO(
    //Input Port
    clk,
    rst_n,
    in_valid,
    in,

    //Output Port
    out_valid,
    out
    );

//---------------------------------------------------------------------
//   PORT DECLARATION
//---------------------------------------------------------------------
input	clk, rst_n, in_valid;
input	[2:0]	in;
output	reg out_valid;
output	reg [2:0]  out;

//---------------------------------------------------------------------
//   PARAMETER DECLARATION
//---------------------------------------------------------------------
parameter	ST_IDLE		=	'd0,
			ST_INPUT	=	'd1,
			ST_SWITCH 	= 	'd2,
			ST_OUTPUT	=	'd3;
//---------------------------------------------------------------------
//   WIRE AND REG DECLARATION
//---------------------------------------------------------------------
reg [2:0] in_vector [5:0];
reg [2:0] counter; 
reg [1:0] cs, ns;

//---------------------------------------------------------------------
//   Input Logic
//---------------------------------------------------------------------
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n) 
	begin
		in_vector[0] <= 'd0;
		in_vector[1] <= 'd0;
		in_vector[2] <= 'd0;
		in_vector[3] <= 'd0;
		in_vector[4] <= 'd0;
		in_vector[5] <= 'd0;
	end
	else if(in_valid=='d1)
	begin
		in_vector[0] <= in;
		in_vector[1] <= in_vector[0];
		in_vector[2] <= in_vector[1];
		in_vector[3] <= in_vector[2];
		in_vector[4] <= in_vector[3];
		in_vector[5] <= in_vector[4];
	end
	else if(cs == ST_SWITCH)
	begin
		in_vector[0] <= in_vector[5];
		in_vector[5] <= in_vector[0];
		in_vector[1] <= in_vector[4];
		in_vector[4] <= in_vector[1];
		in_vector[2] <= in_vector[3];
		in_vector[3] <= in_vector[2];
	end
end

//---------------------------------------------------------------------
//	Counter
//---------------------------------------------------------------------
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n) 
		counter <= 'd0;
	else if(cs == ST_OUTPUT)
		counter <= counter + 'd1;
	else
		counter <= 'd0;
end

//---------------------------------------------------------------------
//   Output Logic
//---------------------------------------------------------------------
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n) 
		out_valid <= 'd0;
	else if(cs == ST_OUTPUT)
		out_valid <= 'd1;
	else 
		out_valid <= 'd0;
end

always@(posedge clk or negedge rst_n)
begin
	if(!rst_n) 
		out <= 'd0;
	else if(cs==ST_OUTPUT)
	begin
		case(counter)
			'd0: out <= in_vector[5];
			'd1: out <= in_vector[4];
			'd2: out <= in_vector[3];
			'd3: out <= in_vector[2];
			'd4: out <= in_vector[1];
			'd5: out <= in_vector[0];
		endcase
	end
	else
		out <= 'd0;
end

//---------------------------------------------------------------------
//   Finite-State Mechine                                          
//---------------------------------------------------------------------
always@(posedge	clk or negedge rst_n)	begin
	if(!rst_n) 
		cs <= ST_IDLE;
	else 
		cs <= ns;
end

always@(*)	
begin
	case(cs)
		ST_IDLE:	
		begin
			if(in_valid) ns = ST_INPUT;
			else ns	= ST_IDLE;
		end
		
		ST_INPUT:	
		begin
			if(!in_valid) ns = ST_SWITCH;
			else ns	= ST_INPUT;
		end
		
		ST_SWITCH:	
		begin
			ns	= ST_OUTPUT;
		end

		ST_OUTPUT: 
		begin
			if(counter == 'd5) ns = ST_IDLE;
			else ns = ST_OUTPUT;
		end
		
		default:	
		begin
			ns = ST_IDLE;
		end
	endcase
end

endmodule
