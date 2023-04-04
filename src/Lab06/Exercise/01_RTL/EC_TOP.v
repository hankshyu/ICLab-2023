//############################################################################
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//    (C) Copyright Optimum Application-Specific Integrated System Laboratory
//    All Right Reserved
//		Date		: 2023/03
//		Version		: v1.0
//   	File Name   : EC_TOP.v
//   	Module Name : EC_TOP
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//############################################################################

//synopsys translate_off
`include "INV_IP.v"
//synopsys translate_on

module EC_TOP(
    // Input signals
    clk, rst_n, in_valid,
    in_Px, in_Py, in_Qx, in_Qy, in_prime, in_a,
    // Output signals
    out_valid, out_Rx, out_Ry
);

// ===============================================================
// Input & Output Declaration
// ===============================================================
	input clk, rst_n, in_valid;
	input [6-1:0] in_Px, in_Py, in_Qx, in_Qy, in_prime, in_a;
	output reg out_valid;
	output reg [6-1:0] out_Rx, out_Ry;
// ===============================================================
// parameters declaration
// ===============================================================
	
// ===============================================================
// registers and wire delcaration
// ===============================================================
	reg [6-1 : 0] px, py;	
	reg [6-1 : 0] qx, qy;	
	reg [6-1 : 0] prime, a;	

	reg [6-1 : 0] s_down;
	reg [8-1 : 0] s_up;// we have to hold 3*px a while...
// ===============================================================
// Instntiate IP
// ===============================================================
	wire [6-1 : 0] inv0_out;
	INV_IP #(.IP_WIDTH(6)) inv0 (.IN_1(s_down), .IN_2(prime), .OUT_INV(inv0_out));
// ===============================================================
// Shared Arithmetic Unit
// ===============================================================
	reg [8-1 : 0] Cmult_0;
	reg [6-1 : 0] Cmult_1;
	wire [14-1 : 0] Cmult_out;
	
	assign Cmult_out = Cmult_0 * Cmult_1;

	reg [14-1 : 0] Cas_add0; //Takes at most 61*61*3
	reg [7-1 : 0] Cas_add1;
	reg [6-1 : 0] Cas_sub0;
	reg [6-1 : 0] Cas_sub1;
	wire [6-1 : 0] C_out;

	assign C_out = (Cas_add0 + Cas_add1 - Cas_sub0 - Cas_sub1) % prime;

// ===============================================================
// FSM declaration
// ===============================================================
	localparam S_INIT = 'd0;
	localparam S_DOWN = 'd1;
	localparam S_EEA  = 'd2;
	localparam S_ADJ  = 'd3;
	localparam S_P1   = 'd4;
	localparam S_P2   = 'd5;
	localparam S_OUTPUT = 'd6;

	reg [2 : 0] current_state, next_state;

	always@(posedge clk or negedge rst_n)begin
		if(!rst_n) current_state <= S_INIT;
		else current_state <= next_state;
	end
	always@(*)begin
		case(current_state)
			S_INIT: next_state = (in_valid)? S_DOWN : S_INIT;
			S_DOWN: next_state = S_EEA;
			S_EEA:  next_state = S_ADJ; 
			S_ADJ:  next_state = S_P1; 
			S_P1: next_state = S_P2;
			S_P2: next_state = S_OUTPUT;
			S_OUTPUT: next_state = S_INIT;
			default: next_state = S_INIT;
		endcase	
	end

	//store input to registers
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)begin
			px <= 0;
			py <= 0;
			qx <= 0;
			qy <= 0;
			prime <= 0;
			a <= 0;
		end else if(current_state == S_INIT && in_valid)begin
			px <= in_Px;
			py <= in_Py;
			qx <= in_Qx;
			qy <= in_Qy;
			prime <= in_prime;
			a <= in_a;
		end
	end
	
	//manipulate the shared AU
	
	always@(*)begin
		case(current_state)
			S_DOWN: begin
					Cmult_0 = px;
					Cmult_1 = 3;
				end
			S_EEA:  begin
					Cmult_0 = s_up;
					Cmult_1 = px;
				end
			S_ADJ:  begin
					Cmult_0 = s_up;
					Cmult_1 = s_down;
				end
			S_P1 :  begin
					Cmult_0 = s_down;
					Cmult_1 = s_down;
				end
			S_P2 :  begin
					Cmult_0 = (px > s_up[5:0])? (px - s_up[5:0]) : ((px + prime) - s_up[5:0]);
					Cmult_1 = s_down;
				end
			default:begin
					Cmult_0 = 0;
					Cmult_1 = 0;
				end
		endcase
	end

	always@(*)begin
		case(current_state)
		S_DOWN: begin
					if((px == qx) && (py == qy))begin
						Cas_add0 = {7'd0, py, 1'd0};
						Cas_add1 = 0;
						Cas_sub0 = 0;
						Cas_sub1 = 0;
					end else begin
						Cas_add0 = qx;
						Cas_add1 = prime;
						Cas_sub0 = px;
						Cas_sub1 = 0;
					end
				end
		S_EEA:  begin
					if((px == qx) && (py == qy))begin
						Cas_add0 = Cmult_out;
						Cas_add1 = a;
						Cas_sub0 = 0;
						Cas_sub1 = 0;
					end else begin
						Cas_add0 = qy;
						Cas_add1 = prime;
						Cas_sub0 = py;
						Cas_sub1 = 0;
					end
				end
		S_ADJ:  begin
					Cas_add0 = Cmult_out;
					Cas_add1 = 0; // this may not be necessary, change to 0
					Cas_sub0 = 0;
					Cas_sub1 = 0;
				end
		S_P1 :  begin
					Cas_add0 = Cmult_out;
					Cas_add1 = {prime,1'd0};
					Cas_sub0 = px;
					Cas_sub1 = qx;
				end
		S_P2 :  begin
					Cas_add0 = Cmult_out;
					Cas_add1 = prime;
					Cas_sub0 = py;
					Cas_sub1 = 0;
				end
		default:begin
				Cas_add0 = 0;
				Cas_add1 = 0;
				Cas_sub0 = 0;
				Cas_sub1 = 0;
			end
		endcase
	end	

	
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n) s_up <= 0;
		else begin
			case (current_state)
				S_DOWN: s_up <= Cmult_out;
				S_EEA:  s_up <= C_out;
				S_P1:	s_up <= C_out;
			endcase
		end
	end
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n) s_down <= 0;
		else begin
			case(current_state)
				S_DOWN: s_down <= C_out;
				S_EEA: s_down <= inv0_out;
				S_ADJ: s_down <= C_out;
			endcase
		end
	end


	//output logic
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)begin
			out_valid <= 0;
			out_Rx <= 0;
			out_Ry <= 0;
		end else if(current_state == S_P2)begin
			out_valid <= 1;
			out_Rx <= s_up[5:0];
			out_Ry <= C_out;

		end else begin
			out_valid <= 0;
			out_Rx <= 0;
			out_Ry <= 0;
		end
	end

endmodule

