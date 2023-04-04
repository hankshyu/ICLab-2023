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
    out

    );

input               clk, rst_n, in_valid,in_valid_num;
input       [3:0]   col,row;
input       [2:0]   in_num;

output reg          out_valid;
output reg  [3:0]   out;

//==============================================//
//             Parameter and Integer            //
//==============================================//

//==============================================//
//                 reg declaration              //
//==============================================//
reg [3-1 : 0] fix_num; 

wire [4-1 : 0] read_lim = fix_num - 1;
wire [4-1 : 0] sear_lim = 12 - fix_num - 1;

reg [4- 1 : 0] col_cache [6-1 : 0];
reg [4- 1 : 0] row_cache [6-1 : 0];

reg [4-1 : 0] answer [12-1 : 0]; //array contains the answer, row # of each column;
reg [4-1 : 0] decide_col [11-1 : 0];// the columns that should be searched
reg [4-1 : 0] dc_idx; //decide column index

wire [12 - 1 : 0] row_ok;

wire [11 : 1] turnback_cond;

reg [4-1 : 0] cnt; //universal counter

//==============================================//
//            FSM State Declaration             //
//==============================================//


localparam S_INIT       = 3'd0;
localparam S_READ       = 3'd1;
localparam S_SETUP      = 3'd2;

localparam S_FORWARD    = 3'd3;
localparam S_BACKWARD   = 3'd4;

localparam S_DONE       = 3'd5;

reg [3-1 : 0] current_state, next_state;

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) current_state <= S_INIT;
    else current_state <= next_state;
end

always @(*) begin
    case (current_state)
        S_INIT :begin
            if(in_valid_num) next_state = (in_num == 1)? S_SETUP : S_READ;
            else next_state = S_INIT;
        end
        S_READ : next_state = (cnt == read_lim)? S_SETUP : S_READ;
        S_SETUP: next_state = (cnt == 11)? S_FORWARD : S_SETUP;
        S_FORWARD:begin
            if (dc_idx == sear_lim && row_ok!=0) next_state = S_DONE;
            else next_state = (row_ok == 0)? S_BACKWARD : S_FORWARD;
        end
        S_BACKWARD: next_state = (turnback_cond == 0)? S_BACKWARD : S_FORWARD;
        S_DONE   : next_state = (cnt == 11)? S_INIT : S_DONE;
        default: next_state = S_INIT;
    endcase
end

//==============================================//
//                  Input Block                 //
//==============================================//

//logic of the universal counter
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) cnt <= 0;
    else begin
        case (current_state)
            S_INIT: cnt <= (in_valid_num && in_num!=1)? 1 : 0;
            S_READ: cnt <= (cnt == read_lim)? 0 : (cnt + 1);
            S_SETUP: cnt <= (cnt == 11)? 0 : (cnt + 1);
            S_FORWARD: cnt <= 0;
            S_BACKWARD: cnt <= 0;
            S_DONE: cnt <= cnt + 1;
        endcase
    end
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) fix_num <= 0;
    else if(current_state == S_INIT) fix_num <= in_num;
end

integer idx;
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        for (idx = 0; idx < 6; idx = idx + 1) begin
            row_cache[idx] <= 4'd12;
            col_cache[idx] <= 4'd12;
        end
    end else begin
        case (current_state)
            S_INIT:begin
                row_cache[0] <= row;
                col_cache[0] <= col;
            end 
            S_READ:begin
                row_cache[cnt] <= row;
                col_cache[cnt] <= col;
            end
            S_DONE:begin
                for (idx = 0; idx < 6; idx = idx + 1) begin
                    row_cache[idx] <= 4'd12;
                    col_cache[idx] <= 4'd12;
                end
            end
        endcase
    end
end

genvar genidx;
generate
    for (genidx = 1; genidx < 12; genidx = genidx + 1) begin
         assign turnback_cond[genidx] = row_ok[genidx] && (answer[decide_col[dc_idx]] < genidx);
    end
endgenerate

integer jdx;
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        for (jdx = 0; jdx < 12; jdx = jdx + 1) begin
            answer[jdx] <= 4'd12;
        end
    end else begin
        case (current_state)
            S_SETUP:begin
                if(col_cache[0] == cnt) answer[cnt] <= row_cache[0];
                else if(col_cache[1] == cnt) answer[cnt] <= row_cache[1];
                else if(col_cache[2] == cnt) answer[cnt] <= row_cache[2];
                else if(col_cache[3] == cnt) answer[cnt] <= row_cache[3];
                else if(col_cache[4] == cnt) answer[cnt] <= row_cache[4];
                else if(col_cache[5] == cnt) answer[cnt] <= row_cache[5];
            end
            S_FORWARD:begin
                if(row_ok[0]) answer[decide_col[dc_idx]] <= 0;
                else if(row_ok[ 1]) answer[decide_col[dc_idx]] <=  1;
                else if(row_ok[ 2]) answer[decide_col[dc_idx]] <=  2;
                else if(row_ok[ 3]) answer[decide_col[dc_idx]] <=  3;
                else if(row_ok[ 4]) answer[decide_col[dc_idx]] <=  4;
                else if(row_ok[ 5]) answer[decide_col[dc_idx]] <=  5;
                else if(row_ok[ 6]) answer[decide_col[dc_idx]] <=  6;
                else if(row_ok[ 7]) answer[decide_col[dc_idx]] <=  7;
                else if(row_ok[ 8]) answer[decide_col[dc_idx]] <=  8;
                else if(row_ok[ 9]) answer[decide_col[dc_idx]] <=  9;
                else if(row_ok[10]) answer[decide_col[dc_idx]] <= 10;
                else if(row_ok[11]) answer[decide_col[dc_idx]] <= 11;
                else answer[decide_col[dc_idx]] <= 12; //no answer, shall turn back
            end
            S_BACKWARD:begin
                if(turnback_cond[1]) answer[decide_col[dc_idx]] <=  1;
                else if(turnback_cond[ 2]) answer[decide_col[dc_idx]] <=  2;
                else if(turnback_cond[ 3]) answer[decide_col[dc_idx]] <=  3;
                else if(turnback_cond[ 4]) answer[decide_col[dc_idx]] <=  4;
                else if(turnback_cond[ 5]) answer[decide_col[dc_idx]] <=  5;
                else if(turnback_cond[ 6]) answer[decide_col[dc_idx]] <=  6;
                else if(turnback_cond[ 7]) answer[decide_col[dc_idx]] <=  7;
                else if(turnback_cond[ 8]) answer[decide_col[dc_idx]] <=  8;
                else if(turnback_cond[ 9]) answer[decide_col[dc_idx]] <=  9;
                else if(turnback_cond[10]) answer[decide_col[dc_idx]] <= 10;
                else if(turnback_cond[11]) answer[decide_col[dc_idx]] <= 11;
                else answer[decide_col[dc_idx]] <= 12; //no answer, shall turn back
            end
            S_DONE:begin
                if(cnt == 11)begin
                    for (jdx = 0; jdx < 12; jdx = jdx + 1) begin
                        answer[jdx] <= 4'd12;
                    end
                end
            end
        endcase
    end
end
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)dc_idx <= 0;
    else begin
        case (current_state)
            S_INIT  : dc_idx <= 0;
            S_SETUP :begin
                if(cnt == 11) dc_idx <= 0;
                else if(col_cache[0]!=cnt && col_cache[1]!=cnt && col_cache[2]!=cnt && col_cache[3]!=cnt
                    && col_cache[4]!=cnt && col_cache[5]!=cnt)dc_idx <= dc_idx + 1;
            end
            S_FORWARD: dc_idx <= (row_ok == 0)? dc_idx-1: dc_idx + 1;
            S_BACKWARD:dc_idx <= (turnback_cond == 0)? dc_idx-1 : dc_idx+1;
        endcase
    end
end

integer kdx;
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        for (kdx = 0; kdx < 11; kdx = kdx + 1) begin
            decide_col[kdx] <= 4'd12;
        end
    end else begin
        case (current_state)  
            S_SETUP:begin
                if(col_cache[0]!=cnt && col_cache[1]!=cnt && col_cache[2]!=cnt && col_cache[3]!=cnt
                    && col_cache[4]!=cnt && col_cache[5]!=cnt) decide_col[dc_idx] <= cnt;
            end
            S_DONE:begin
                for (kdx = 0; kdx < 11; kdx = kdx + 1) begin
                    decide_col[kdx] <= 4'd12;
                end
            end
        endcase
    end
end

genvar genjdx;
generate
    for(genjdx = 0; genjdx < 12; genjdx = genjdx + 1)begin: gen_rowok
        // it's safe to place at row idx. slope: (0,decide_col[dc_idx]) (answer[i],i), i from 0 to 11
        assign row_ok[genjdx] =
            (answer[ 0] == 4'd12 || ((answer[ 0] != genjdx) && ((answer[ 0]- genjdx) != ( 0 - decide_col[dc_idx])) && ((answer[ 0]- genjdx) != (decide_col[dc_idx] -  0)) )) && 
            (answer[ 1] == 4'd12 || ((answer[ 1] != genjdx) && ((answer[ 1]- genjdx) != ( 1 - decide_col[dc_idx])) && ((answer[ 1]- genjdx) != (decide_col[dc_idx] -  1)) )) && 
            (answer[ 2] == 4'd12 || ((answer[ 2] != genjdx) && ((answer[ 2]- genjdx) != ( 2 - decide_col[dc_idx])) && ((answer[ 2]- genjdx) != (decide_col[dc_idx] -  2)) )) && 
            (answer[ 3] == 4'd12 || ((answer[ 3] != genjdx) && ((answer[ 3]- genjdx) != ( 3 - decide_col[dc_idx])) && ((answer[ 3]- genjdx) != (decide_col[dc_idx] -  3)) )) && 
            (answer[ 4] == 4'd12 || ((answer[ 4] != genjdx) && ((answer[ 4]- genjdx) != ( 4 - decide_col[dc_idx])) && ((answer[ 4]- genjdx) != (decide_col[dc_idx] -  4)) )) && 
            (answer[ 5] == 4'd12 || ((answer[ 5] != genjdx) && ((answer[ 5]- genjdx) != ( 5 - decide_col[dc_idx])) && ((answer[ 5]- genjdx) != (decide_col[dc_idx] -  5)) )) && 
            (answer[ 6] == 4'd12 || ((answer[ 6] != genjdx) && ((answer[ 6]- genjdx) != ( 6 - decide_col[dc_idx])) && ((answer[ 6]- genjdx) != (decide_col[dc_idx] -  6)) )) && 
            (answer[ 7] == 4'd12 || ((answer[ 7] != genjdx) && ((answer[ 7]- genjdx) != ( 7 - decide_col[dc_idx])) && ((answer[ 7]- genjdx) != (decide_col[dc_idx] -  7)) )) && 
            (answer[ 8] == 4'd12 || ((answer[ 8] != genjdx) && ((answer[ 8]- genjdx) != ( 8 - decide_col[dc_idx])) && ((answer[ 8]- genjdx) != (decide_col[dc_idx] -  8)) )) && 
            (answer[ 9] == 4'd12 || ((answer[ 9] != genjdx) && ((answer[ 9]- genjdx) != ( 9 - decide_col[dc_idx])) && ((answer[ 9]- genjdx) != (decide_col[dc_idx] -  9)) )) && 
            (answer[10] == 4'd12 || ((answer[10] != genjdx) && ((answer[10]- genjdx) != (10 - decide_col[dc_idx])) && ((answer[10]- genjdx) != (decide_col[dc_idx] - 10)) )) && 
            (answer[11] == 4'd12 || ((answer[11] != genjdx) && ((answer[11]- genjdx) != (11 - decide_col[dc_idx])) && ((answer[11]- genjdx) != (decide_col[dc_idx] - 11)) ));
    end
endgenerate

// output logic

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) out_valid <= 0;
    else begin
        case (current_state)    
            S_INIT: out_valid <= 0;
            S_DONE: out_valid <= 1; 
        endcase
    end
end
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) out <= 0;
    else begin
        case(current_state)
        S_INIT: out <= 0;
        S_DONE: out <= answer[cnt];
        endcase
    end
end

endmodule 

