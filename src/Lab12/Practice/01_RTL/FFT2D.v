module FFT2D(
             clk,
             rst_n,
             IN_VALID,
             MODE,
             FFT2D_IN_R,
             FFT2D_IN_I,
             OUT_VALID,
             FFT2D_OUT_R,
             FFT2D_OUT_I
);

//---------------------------------------------------------------------
//   PORT DECLARATION
//---------------------------------------------------------------------
input         clk, rst_n, IN_VALID, MODE;
input  signed[18:0] FFT2D_IN_R, FFT2D_IN_I;

output reg       OUT_VALID;
output reg signed[18:0] FFT2D_OUT_R, FFT2D_OUT_I;

// ======================================================
//      parameter declaration
// ======================================================
// ----- finite state machine ----- //
parameter ST_IDLE = 4'd0;
parameter ST_IN = 4'd1;
parameter ST_DFT_1D = 4'd2;
parameter ST_LAY0 = 4'd3;
parameter ST_LAY1 = 4'd4;
parameter ST_LAY2 = 4'd5;
parameter ST_LAY3 = 4'd6;
parameter ST_LAY4 = 4'd7;
parameter ST_DFT_2D = 4'd8;
parameter ST_OUT = 4'd9;

// ======================================================
//      reg & wire declaration
// ======================================================
// ----- finite state machine ----- //
reg [3:0] cs, ns;
// ----- SRAM ----- //
reg signed[18:0] D_real, D_imag;
// SRAM input
reg [10:0] A; // 0 ~ 1055
reg WEN;
wire signed[37:0] D; // real: [37:19], imag: [18:0]
// SRAM output
wire signed[37:0] Q; // real: [37:19], imag: [18:0]
// ----- calc. ----- //
reg mode_val;
reg signed[18:0] butt_a_real, butt_a_imag, butt_b_real, butt_b_imag;
wire signed[20:0] minus_a_b_real, minus_a_b_imag;
reg signed[18:0] new_butt_a_real, new_butt_a_imag, new_butt_b_real, new_butt_b_imag;
wire signed[31:0] new_butt_b_real_org, new_butt_b_imag_org;
wire signed[22:0] new_butt_a_real_org, new_butt_a_imag_org;
reg [3:0] n;
reg signed[9:0] cos_n, sin_n;
// ----- counter and flag----- //
reg [5:0] lay_cnt;
reg is_row;
reg [4:0] sequence_cnt;
reg [10:0] in_out_cnt;


wire signed[18:0] Q_real, Q_imag;
wire signed[18:0] Q_real_inrange, Q_imag_inrange;


RA1SH1 SRAM_mem(.Q(Q),.CLK(clk),.CEN(1'b0),.WEN(WEN),.A(A),.D(D),.OEN(1'b0));

///////////////////////////////////
//                               //
//     finite state machine      //
//                               //
///////////////////////////////////
always @(posedge clk or negedge rst_n) begin 
	if(!rst_n)
		cs <= ST_IDLE;
	else 
		cs <= ns;
end

always @(*) begin 
	if(!rst_n)
		ns = ST_IDLE;
	else begin 
		case(cs)
			ST_IDLE: begin 
				if(IN_VALID == 1'b1)
					ns = ST_IN;
				else
					ns = cs;
			end
			ST_IN: begin 
				if(IN_VALID == 1'b0)
					ns = ST_DFT_1D;
				else 
					ns = cs;
			end
			ST_DFT_1D: ns = ST_LAY0;
			ST_LAY0: begin 
				if(lay_cnt == 6'd63)
					ns = ST_LAY1;
				else
					ns = cs;
			end
			ST_LAY1: begin 
				if(lay_cnt == 6'd63)
					ns = ST_LAY2;
				else
					ns = cs;
			end
			ST_LAY2: begin 
				if(lay_cnt == 6'd63)
					ns = ST_LAY3;
				else 
					ns = cs;
			end
			ST_LAY3: begin 
				if(lay_cnt == 6'd63)
					ns = ST_LAY4;
				else
					ns = cs;
			end
			ST_LAY4: begin 
				if(lay_cnt < 6'd63)
					ns = cs;
				else if(is_row == 1'b1) begin // execution of row
					if(sequence_cnt < 5'd31)
						ns = ST_DFT_1D;
					else 
						ns = ST_DFT_2D;
				end
				else begin // execution of column
					if(sequence_cnt < 5'd31)
						ns = ST_DFT_2D;
					else
						ns = ST_OUT;
				end
			end
			ST_DFT_2D: ns = ST_LAY0;
			ST_OUT: begin 
				if(in_out_cnt == 11'd1023)
					ns = ST_IDLE;
				else
					ns = cs;
			end
			default: ns = cs;
		endcase
	end
end

always @(posedge clk or negedge rst_n) begin 
	if(!rst_n)
		mode_val <= 1'b0;
	else if((IN_VALID == 1'b1) && (in_out_cnt == 11'd0))
		mode_val <= MODE;
	else
		mode_val <= mode_val;
end

////////////////////
//                //
//     memory     //
//                //
////////////////////
always @(*) begin 
	if(IN_VALID == 1'b1)
		A = in_out_cnt; // A: 11bits
	else begin 
		case(cs)
			ST_LAY0: A = (is_row == 1'b1) ? {1'b0, sequence_cnt, lay_cnt[0], lay_cnt[5:2]} // row
										  : {1'b0, lay_cnt[0], lay_cnt[5:2], sequence_cnt}; // col
			ST_LAY1: A = (is_row == 1'b1) ? {1'b0, sequence_cnt, lay_cnt[5], lay_cnt[0], lay_cnt[4:2]} // row
										  : {1'b0, lay_cnt[5], lay_cnt[0], lay_cnt[4:2], sequence_cnt}; // col
			ST_LAY2: A = (is_row == 1'b1) ? {1'b0, sequence_cnt, lay_cnt[5:4], lay_cnt[0], lay_cnt[3:2]} // row
										  : {1'b0, lay_cnt[5:4], lay_cnt[0], lay_cnt[3:2], sequence_cnt}; // col
			ST_LAY3: begin
				if(lay_cnt[1] == 1'b0) // SRAM write
					A = (is_row == 1'b1) ? {1'b0, sequence_cnt, lay_cnt[5:3], lay_cnt[0], lay_cnt[2]} // row
										 : {1'b0, lay_cnt[5:3], lay_cnt[0], lay_cnt[2], sequence_cnt}; // col
				else 
					A = {1'b1, 5'd0, lay_cnt[5:3], lay_cnt[0], lay_cnt[2]}; // temp. address
			end
			ST_LAY4: begin 
				if(lay_cnt[1] == 1'b0) 
					A = {1'b1, 5'd0, lay_cnt[5:2], lay_cnt[0]}; // temp. address
				else 
					A = (is_row == 1'b1) ? {1'b0, sequence_cnt, lay_cnt[0], lay_cnt[2], lay_cnt[3], lay_cnt[4], lay_cnt[5]} // row
										 : {1'b0, lay_cnt[0], lay_cnt[2], lay_cnt[3], lay_cnt[4], lay_cnt[5], sequence_cnt}; // col
			end
			ST_OUT: A = in_out_cnt;
			default: A = 11'b0;
		endcase 
	end
end

always @(*) begin 
	if(IN_VALID == 1'b1)
		WEN = 1'b0; // read
	else begin 
		case(cs)
			ST_LAY0, ST_LAY1, ST_LAY2, ST_LAY3, ST_LAY4: begin 
				if(lay_cnt[1] == 1'b0) 
					WEN = 1'b1;
				else 
					WEN = 1'b0;
			end
			default: WEN = 1'b1;
		endcase
	end
end

always @(*) begin 
	if(IN_VALID == 1'b1) begin
		if(in_out_cnt == 11'd0) begin
			if(MODE == 1'b0) begin
				D_real = FFT2D_IN_R; 
				D_imag = FFT2D_IN_I;
			end
			else begin 
				D_real = FFT2D_IN_I; 
				D_imag = FFT2D_IN_R;
			end
		end
		else begin 
			if(mode_val == 1'b0) begin
				D_real = FFT2D_IN_R; 
				D_imag = FFT2D_IN_I;
			end
			else begin 
				D_real = FFT2D_IN_I; 
				D_imag = FFT2D_IN_R;
			end
		end
	end
	// butt_a + butt_b
	else if(lay_cnt[1:0] == 2'b10) begin 
		D_real = new_butt_a_real;
		D_imag = new_butt_a_imag;
	end
	else if(lay_cnt[1:0] == 2'b11) begin 
		D_real = new_butt_b_real;
		D_imag = new_butt_b_imag;
	end
	else begin 
		D_real = 19'd0;
		D_imag = 19'd0;
	end
end

assign D = {D_real, D_imag};

assign Q_real = Q[37:19]; 
assign Q_imag = Q[18:0]; 

///////////////////
//               //
//     calc.     //
//               //
///////////////////
always @(posedge clk or negedge rst_n) begin 
	if(!rst_n) begin
		butt_a_real <= 19'd0;
		butt_a_imag <= 19'd0;
	end
	else if(lay_cnt[1:0] == 2'b01) begin 
		butt_a_real <= Q[37:19];
		butt_a_imag <= Q[18:0];
	end
	else begin 
		butt_a_real <= butt_a_real;
		butt_a_imag <= butt_a_imag;
	end
end

always @(posedge clk or negedge rst_n) begin 
	if(!rst_n) begin 
		butt_b_real <= 19'd0;
		butt_b_imag <= 19'd0;
	end
	else if(lay_cnt[1:0] == 2'b10) begin 
		butt_b_real <= Q[37:19];
		butt_b_imag <= Q[18:0];
	end
	else begin 
		butt_b_real <= butt_b_real;
		butt_b_imag <= butt_b_imag;
	end
end

always @(*) begin 
	case(cs) 
		ST_LAY0: begin
			if(mode_val == 1'b0) begin
				if(is_row == 1'b1) begin 
					new_butt_a_real = new_butt_a_real_org <<< 4; 
					new_butt_a_imag = new_butt_a_imag_org <<< 4;
				end
				else begin 
					new_butt_a_real = new_butt_a_real_org; 
					new_butt_a_imag = new_butt_a_imag_org;
				end
			end
			else begin 
				new_butt_a_real = new_butt_a_real_org >>> 1; 
				new_butt_a_imag = new_butt_a_imag_org >>> 1;
			end
		end
		ST_LAY1, ST_LAY2, ST_LAY4: begin 
			if(mode_val == 1'b0) begin
				new_butt_a_real = new_butt_a_real_org; 
				new_butt_a_imag = new_butt_a_imag_org;
			end
			else begin
				new_butt_a_real = new_butt_a_real_org >>> 1; 
				new_butt_a_imag = new_butt_a_imag_org >>> 1;
			end
		end
		ST_LAY3: begin 
			if(mode_val == 1'b0) begin
				new_butt_a_real = new_butt_a_real_org >>> 2; 
				new_butt_a_imag = new_butt_a_imag_org >>> 2;
			end
			else begin 
				new_butt_a_real = new_butt_a_real_org >>> 1; 
				new_butt_a_imag = new_butt_a_imag_org >>> 1;
			end
		end
		default: begin 
			new_butt_a_real = 19'd0;
			new_butt_a_imag = 19'd0;
		end
	endcase
end

assign new_butt_a_real_org = butt_a_real + Q_real;
assign new_butt_a_imag_org = butt_a_imag + Q_imag;


always @(*) begin 
	case(cs)
		ST_LAY0: begin 
			if(mode_val == 1'b0) begin
				if(is_row == 1'b1) begin 
					new_butt_b_real = (new_butt_b_real_org >>> 5); 
					new_butt_b_imag = (new_butt_b_imag_org >>> 5);
				end
				else begin // (row,lay4 --> col,lay0)
					new_butt_b_real = (new_butt_b_real_org >>> 9);  
					new_butt_b_imag = (new_butt_b_imag_org >>> 9);
				end
			end
			else begin 
				new_butt_b_real = (new_butt_b_real_org >>> 10); 
				new_butt_b_imag = (new_butt_b_imag_org >>> 10);
			end
		end
		ST_LAY1, ST_LAY2, ST_LAY4: begin 
			if(mode_val == 1'b0) begin
				new_butt_b_real = (new_butt_b_real_org >>> 9); 
				new_butt_b_imag = (new_butt_b_imag_org >>> 9);
			end
			else begin 
				new_butt_b_real = (new_butt_b_real_org >>> 10); 
				new_butt_b_imag = (new_butt_b_imag_org >>> 10);
			end
		end
		ST_LAY3: begin 
			if(mode_val == 1'b0) begin
				new_butt_b_real = (new_butt_b_real_org >>> 11); 
				new_butt_b_imag = (new_butt_b_imag_org >>> 11);
			end
			else begin 
				new_butt_b_real = (new_butt_b_real_org >>> 10); 
				new_butt_b_imag = (new_butt_b_imag_org >>> 10);
			end
		end
		default: begin 
			new_butt_b_real = 19'd0;
			new_butt_b_imag = 19'd0;
		end
	endcase 
end

assign minus_a_b_real = butt_a_real - butt_b_real;
assign minus_a_b_imag = butt_a_imag - butt_b_imag;

assign new_butt_b_real_org = minus_a_b_real*cos_n + minus_a_b_imag*sin_n; 
assign new_butt_b_imag_org = -minus_a_b_real*sin_n + minus_a_b_imag*cos_n;


always @(*) begin 
	case(n)
    	4'd0: cos_n = 10'b0111111111;
    	4'd1: cos_n = 10'b0111110110;
    	4'd2: cos_n = 10'b0111011001;
    	4'd3: cos_n = 10'b0110101010;
    	4'd4: cos_n = 10'b0101101010;
    	4'd5: cos_n = 10'b0100011100;
    	4'd6: cos_n = 10'b0011000100;
    	4'd7: cos_n = 10'b0001100100;
    	4'd8: cos_n = 10'b0000000000;
    	4'd9: cos_n = 10'b1110011100;
    	4'd10: cos_n = 10'b1100111100;
    	4'd11: cos_n = 10'b1011100100;
    	4'd12: cos_n = 10'b1010010110;
    	4'd13: cos_n = 10'b1001010110;
    	4'd14: cos_n = 10'b1000100111;
    	4'd15: cos_n = 10'b1000001010;
		default: cos_n = 10'd0;
	endcase
end

always @(*) begin 
	case(n)
	    4'd0: sin_n = 10'b0000000000;
	    4'd1: sin_n = 10'b0001100100;
	    4'd2: sin_n = 10'b0011000100;
	    4'd3: sin_n = 10'b0100011100;
	    4'd4: sin_n = 10'b0101101010;
	    4'd5: sin_n = 10'b0110101010;
	    4'd6: sin_n = 10'b0111011001;
	    4'd7: sin_n = 10'b0111110110;
	    4'd8: sin_n = 10'b0111111111;
	    4'd9: sin_n = 10'b0111110110;
	    4'd10: sin_n = 10'b0111011001;
	    4'd11: sin_n = 10'b0110101010;
	    4'd12: sin_n = 10'b0101101010;
	    4'd13: sin_n = 10'b0100011100;
	    4'd14: sin_n = 10'b0011000100;
	    4'd15: sin_n = 10'b0001100100;
		default: sin_n = 10'd0;
	endcase
end

always @(*) begin 
	case(cs)
		ST_LAY0: n = lay_cnt[5:2]; 
		ST_LAY1: n = {lay_cnt[4:2], 1'b0}; 
		ST_LAY2: n = {lay_cnt[3:2], 2'b00};  
		ST_LAY3: n = {lay_cnt[2], 3'b000};  
		ST_LAY4: n = 4'd0;  
		default: n = 4'd0;
	endcase
end


////////////////////
//                //
//     output     //
//                //
////////////////////
always @(posedge clk or negedge rst_n) begin 
	if(!rst_n)
		OUT_VALID <= 1'b0;
	else if(cs == ST_OUT)
		OUT_VALID <= 1'b1;
	else
		OUT_VALID <= 1'b0;
end

always @(*) begin 
	if(!rst_n) begin 
		FFT2D_OUT_R = 19'd0;
		FFT2D_OUT_I = 19'd0;
	end
	else if(OUT_VALID == 1'b1) begin 
		if(mode_val == 0) begin
			FFT2D_OUT_R = Q_real;
			FFT2D_OUT_I = Q_imag;
		end
		else begin 
			FFT2D_OUT_R = Q_imag_inrange;
			FFT2D_OUT_I = Q_real_inrange;
		end
	end
	else begin 
		FFT2D_OUT_R = 19'd0;
		FFT2D_OUT_I = 19'd0;
	end
end

assign Q_real_inrange = (Q_real[18] == 1'b1) ? 19'd0 : Q_real;
assign Q_imag_inrange = (Q_imag[18] == 1'b1) ? 19'd0 : Q_imag;

/////////////////////////////
//                         //
//     counter & flag      //
//                         //
/////////////////////////////
always @(posedge clk or negedge rst_n) begin 
	if(!rst_n)
		in_out_cnt <= 11'd0;
	else if((IN_VALID == 1'b1) || (cs == ST_OUT))
		in_out_cnt <= in_out_cnt + 11'd1;
	else 
		in_out_cnt <= 11'd0;
end

always @(posedge clk or negedge rst_n) begin 	
	if(!rst_n)
		is_row <= 1'b0;
	else begin 
		case(cs)
			ST_DFT_1D: is_row <= 1'b1;
			ST_DFT_2D: is_row <= 1'b0;
			default: is_row <= is_row;
		endcase
	end
end

always @(posedge clk or negedge rst_n) begin 
	if(!rst_n)
		sequence_cnt <= 5'd31;
	else begin 
		case(cs)
			ST_IDLE: sequence_cnt <= 5'd31;
			ST_DFT_1D, ST_DFT_2D: begin 
				if(sequence_cnt < 5'd31)
					sequence_cnt <= sequence_cnt + 5'd1;
				else
					sequence_cnt <= 5'd0;
			end
			default: sequence_cnt <= sequence_cnt;
		endcase
	end
end

always @(posedge clk or negedge rst_n) begin 
	if(!rst_n)
		lay_cnt <= 6'd0;	
	else begin 
		case(cs)
			ST_LAY0, ST_LAY1, ST_LAY2, ST_LAY3, ST_LAY4: begin 
				if(lay_cnt < 6'd63)
					lay_cnt <= lay_cnt + 6'd1;
				else
					lay_cnt <= 6'd0;
			end
			default: lay_cnt <= 6'd0;
		endcase
	end
end


endmodule

