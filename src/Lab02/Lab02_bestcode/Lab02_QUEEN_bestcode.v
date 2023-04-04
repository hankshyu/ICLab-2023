//have diagonal recorded, to save the effort of comparing every time
module QUEEN(
    //Input Port
    clk,
    rst_n,

    in_valid,
    col,
    row,

    in_valid_num,
    in_num,

    out_valid,
    out,

    );

input               clk, rst_n, in_valid,in_valid_num;
input       [3:0]   col,row;
input       [2:0]   in_num;

output reg          out_valid;
output reg  [3:0]   out;

//==============================================//
//             Parameter and Integer            //
//==============================================//
parameter IDLE   = 'b000;
parameter STAT_1 = 'b001;
parameter STAT_2 = 'b011;
parameter STAT_3 = 'b010;
parameter STAT_4 = 'b100;

parameter NON_OCCUPIED = 'd15;
//==============================================//
//                 reg declaration              //
//==============================================//
reg [2:0] current_state, next_state; //state
reg [3:0] col_count; //count down for input, count up for output

reg [4:0] col_queen [0:11]; //record queen position in each col, the MSB 1 bit for temporary
wire [3:0] col_queen_1 [0:11]; //queen position plus 1

reg [3:0] q_row, q_col; //for input row, column

reg hori [0:11]; //record horizotal state
reg [0:22] diag[0:1]; //record two directions diagonal state
wire [0:11] grid[0:11]; //the grid

reg [3:0] unoccupied_col; //next unoccupied column
reg [3:0] last_occupied_col; //last occupied column
reg [3:0] unoccupied [0:11]; //unoccupied vector

wire [0:11] violate_vec; //record each column's violate situation
wire violate; //the total violate situation

wire [3:0] replace_row; //take replace row action in back track state, record which row to replace
wire back_last_col; //take back to last column action in back track state
reg back_track; //continue back track

//==============================================//
//            FSM State Declaration             //
//==============================================//
//current_state
always @(posedge clk or negedge rst_n) begin
	if(!rst_n) current_state <= IDLE;
	else current_state <= next_state;
end

//next_state
always @* begin
	case(current_state)
		IDLE: begin
			if(in_valid) next_state = STAT_1;
			else next_state = IDLE;
		end
		STAT_1: begin 
			if(!in_valid) next_state = STAT_2;
			else next_state = STAT_1;
		end
		STAT_2: begin
			if(violate) next_state = STAT_3;
			else if(unoccupied_col == NON_OCCUPIED) next_state = STAT_4;
			else next_state = STAT_2;
		end
		STAT_3: begin
			if(violate || back_track) next_state = STAT_3;
			else next_state = STAT_2;
		end
		STAT_4: begin
			if(col_count >= 'd12) next_state = IDLE;
			else next_state = STAT_4;
		end
		default: next_state = IDLE;
	endcase
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n) col_count <= NON_OCCUPIED; 
	else begin
		case(next_state)
			IDLE: col_count <= NON_OCCUPIED;
			STAT_1: col_count <= (in_valid_num)? in_num - 'b1 : col_count - 'b1;
			STAT_4: if(col_count < 'd12) col_count <= col_count + 'b1;
			default: col_count <= col_count;
		endcase
	end
end

//==============================================//
//                  Input Block                 //
//==============================================//

always @* begin
	case(next_state[1:0])
		STAT_1: q_col = col;
		STAT_2: q_col = unoccupied_col;
		STAT_3: q_col = last_occupied_col;
		default: q_col = NON_OCCUPIED;
	endcase
end

always @* begin
	case(next_state[1:0])
		STAT_1: q_row = row;
		STAT_2: q_row = unoccupied[unoccupied_col];
		STAT_3: q_row = col_queen[last_occupied_col][3:0];
		default: q_row = NON_OCCUPIED;
	endcase
end

generate
genvar col_q_c;
for(col_q_c = 0; col_q_c < 12; col_q_c = col_q_c + 1) begin: col_q
	always @(posedge clk or negedge rst_n) begin
		if(!rst_n) col_queen[col_q_c] <= NON_OCCUPIED;
		else begin
			case(next_state)
				IDLE: col_queen[col_q_c] <= NON_OCCUPIED;
				STAT_1: if(col_q_c == q_col) col_queen[col_q_c] <= {1'b0, q_row};
				STAT_2: if(col_q_c == q_col) col_queen[col_q_c] <= {1'b1, q_row};
				STAT_3: begin
					if(col_q_c == q_col) begin
						if(back_last_col) col_queen[col_q_c] <= NON_OCCUPIED;
						else col_queen[col_q_c] <= {1'b1, replace_row};
					end
				end
				default: col_queen[col_q_c] <= col_queen[col_q_c];
			endcase
		end
	end
end
endgenerate

generate
genvar col_q_1_c;
for(col_q_1_c = 0; col_q_1_c < 12; col_q_1_c = col_q_1_c + 1) begin: col_q_1
	assign col_queen_1[col_q_1_c] = col_queen[col_q_1_c][3:0] + 'd1; 
end
endgenerate


always @* begin
	if     (col_queen[0]  == NON_OCCUPIED) unoccupied_col = 'd0;
	else if(col_queen[1]  == NON_OCCUPIED) unoccupied_col = 'd1;
	else if(col_queen[2]  == NON_OCCUPIED) unoccupied_col = 'd2;
	else if(col_queen[3]  == NON_OCCUPIED) unoccupied_col = 'd3;
	else if(col_queen[4]  == NON_OCCUPIED) unoccupied_col = 'd4;
	else if(col_queen[5]  == NON_OCCUPIED) unoccupied_col = 'd5;
	else if(col_queen[6]  == NON_OCCUPIED) unoccupied_col = 'd6;
	else if(col_queen[7]  == NON_OCCUPIED) unoccupied_col = 'd7;
	else if(col_queen[8]  == NON_OCCUPIED) unoccupied_col = 'd8;
	else if(col_queen[9]  == NON_OCCUPIED) unoccupied_col = 'd9;
	else if(col_queen[10] == NON_OCCUPIED) unoccupied_col = 'd10;
	else if(col_queen[11] == NON_OCCUPIED) unoccupied_col = 'd11;
	else unoccupied_col = NON_OCCUPIED;
end

always @* begin
	if     (col_queen[11][4]) last_occupied_col = 'd11;
	else if(col_queen[10][4]) last_occupied_col = 'd10;
	else if(col_queen[9][4])  last_occupied_col = 'd9;
	else if(col_queen[8][4])  last_occupied_col = 'd8;
	else if(col_queen[7][4])  last_occupied_col = 'd7;
	else if(col_queen[6][4])  last_occupied_col = 'd6;
	else if(col_queen[5][4])  last_occupied_col = 'd5;
	else if(col_queen[4][4])  last_occupied_col = 'd4;
	else if(col_queen[3][4])  last_occupied_col = 'd3;
	else if(col_queen[2][4])  last_occupied_col = 'd2;
	else if(col_queen[1][4])  last_occupied_col = 'd1;
	else if(col_queen[0][4])  last_occupied_col = 'd0;
	else last_occupied_col = NON_OCCUPIED;
end

assign replace_row = unoccupied[last_occupied_col];
assign back_last_col = (replace_row == NON_OCCUPIED);

always @(posedge clk or negedge rst_n) begin
	if(!rst_n) back_track <= 'b0;
	else begin
		case(next_state[1:0])
			IDLE: back_track <= 'b0;
			STAT_3: back_track <= back_last_col;
			default: back_track <= back_track;
		endcase
	end
end

generate
genvar unoccupied_i;
for(unoccupied_i = 0; unoccupied_i < 12; unoccupied_i = unoccupied_i + 1) begin: unoccupiedLoop
	always @* begin
		if     (!grid[unoccupied_i][0] && 'd0 >= col_queen_1[unoccupied_i])   unoccupied[unoccupied_i] = 'd0;
		else if(!grid[unoccupied_i][1] && 'd1 >= col_queen_1[unoccupied_i])   unoccupied[unoccupied_i] = 'd1;
		else if(!grid[unoccupied_i][2] && 'd2 >= col_queen_1[unoccupied_i])   unoccupied[unoccupied_i] = 'd2;
		else if(!grid[unoccupied_i][3] && 'd3 >= col_queen_1[unoccupied_i])   unoccupied[unoccupied_i] = 'd3;
		else if(!grid[unoccupied_i][4] && 'd4 >= col_queen_1[unoccupied_i])   unoccupied[unoccupied_i] = 'd4;
		else if(!grid[unoccupied_i][5] && 'd5 >= col_queen_1[unoccupied_i])   unoccupied[unoccupied_i] = 'd5;
		else if(!grid[unoccupied_i][6] && 'd6 >= col_queen_1[unoccupied_i])   unoccupied[unoccupied_i] = 'd6;
		else if(!grid[unoccupied_i][7] && 'd7 >= col_queen_1[unoccupied_i])   unoccupied[unoccupied_i] = 'd7;
		else if(!grid[unoccupied_i][8] && 'd8 >= col_queen_1[unoccupied_i])   unoccupied[unoccupied_i] = 'd8;
		else if(!grid[unoccupied_i][9] && 'd9 >= col_queen_1[unoccupied_i])   unoccupied[unoccupied_i] = 'd9;
		else if(!grid[unoccupied_i][10] && 'd10 >= col_queen_1[unoccupied_i]) unoccupied[unoccupied_i] = 'd10;
		else if(!grid[unoccupied_i][11] && 'd11 >= col_queen_1[unoccupied_i]) unoccupied[unoccupied_i] = 'd11;
		else unoccupied[unoccupied_i] = NON_OCCUPIED;
	end
end
endgenerate

generate
genvar hori_i;
for(hori_i = 0; hori_i < 12; hori_i = hori_i + 1) begin
	always @(posedge clk or negedge rst_n) begin
		if(!rst_n) hori[hori_i] <= 'b0;
		else begin
			case(next_state[1:0])
				IDLE: hori[hori_i] <= 'b0;
				STAT_1, STAT_2: hori[hori_i] <= hori[hori_i] | (q_row == hori_i);
				STAT_3: begin 
					if(q_row == hori_i) hori[hori_i] <= 'b0;
					else if(!back_last_col) hori[hori_i] <= hori[hori_i] | (replace_row == hori_i);
				end
				default: hori[hori_i] <= hori[hori_i];
			endcase
		end
	end
end
endgenerate

generate
genvar diag_type, diag_i;
for(diag_type = 0; diag_type < 2; diag_type = diag_type + 1) begin: diagLoop
	for(diag_i = 0; diag_i < 23; diag_i = diag_i + 1) begin: diagCount
		always @(posedge clk or negedge rst_n) begin
			if(!rst_n) diag[diag_type][diag_i] <= 'b0;
			else begin
				case(next_state[1:0])
					IDLE: diag[diag_type][diag_i] <= 'b0;
					STAT_1, STAT_2: begin
						if(!diag_type) diag[diag_type][diag_i] <= diag[diag_type][diag_i] | (diag_i == q_row + q_col);
						else diag[diag_type][diag_i] <= diag[diag_type][diag_i] | (diag_i == q_row + 'd11 - q_col);
					end
					STAT_3: begin
						if(!diag_type) begin
							if(diag_i == q_row + q_col) diag[diag_type][diag_i] <= 'b0;
							else if(!back_last_col && diag_i == replace_row + q_col) diag[diag_type][diag_i] <= 'b1;
						end else begin
							if(diag_i == q_row + 'd11 - q_col) diag[diag_type][diag_i] <= 'b0;
							else if(!back_last_col && diag_i == replace_row + 'd11 - q_col) diag[diag_type][diag_i] <= 'b1;
						end
					end
					default: diag[diag_type][diag_i] <= diag[diag_type][diag_i];
				endcase
			end
		end
	end
end
endgenerate

generate
genvar grid_c, grid_r;
for(grid_r = 0; grid_r < 12; grid_r = grid_r + 1) begin: gridRow
	for(grid_c = 0; grid_c < 12; grid_c = grid_c + 1) begin: gridCol
		assign grid[grid_c][grid_r] = diag[0][grid_r + grid_c] || diag[1][grid_r + 'd11 - grid_c] || hori[grid_r];
	end
end
endgenerate


generate
genvar v_i;
for(v_i = 0; v_i < 12; v_i = v_i + 1) begin: violateLoop
	assign violate_vec[v_i] = &grid[v_i] && (col_queen[v_i] == NON_OCCUPIED);
end
endgenerate
assign violate = |violate_vec;

//==============================================//
//                 Output Block                 //
//==============================================//

always @(posedge clk or negedge rst_n) begin
	if(!rst_n) out_valid <= 'b0;
	else out_valid <= next_state[2];
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n) out <= 'b0;
	else out <= (next_state[2])? col_queen[col_count][3:0] : 'b0;
end

//GOOD LUCKY

endmodule 
