module MMT(
// input signals
    clk,
    rst_n,
    in_valid,
	in_valid2,
    matrix,
	matrix_size,
    matrix_idx,
    mode,
	
// output signals
    out_valid,
    out_value
);
//---------------------------------------------------------------------
//   INPUT AND OUTPUT DECLARATION
//---------------------------------------------------------------------
input clk, rst_n;
input in_valid;
input signed [7:0] matrix;
input [1:0]  matrix_size;

input in_valid2;
input [4:0]  matrix_idx;
input [1:0]  mode;

output reg       	     out_valid;
output reg signed [49:0] out_value;
//---------------------------------------------------------------------
//   PARAMETER, WIRE AND REG DECLARATION
//---------------------------------------------------------------------
reg [6-1 : 0] cnt; //universal counter
reg [3:0] pool_size; // records the upper index limit of certain matrix size

reg signed [7 : 0] matrix_buffer; // input buffer of the matrix_buffer

reg [1:0] mode_store;
reg [5-1 : 0] mxidx_store [0 : 3-1];

reg [4-1 : 0] sp_arr, sp_row, sp_col; // this assists the S_CALCSP stage
wire [12 -1 : 0] sp_a = {sp_arr, sp_row, sp_col};
reg signed [8-1 :0] sp_storeq;

reg [4-1 : 0] quest_count;

// Designware MAC System
parameter inst_A_width = 20;
parameter inst_B_width = 8;
parameter inst_SUM_width = 34;

reg signed [inst_A_width-1 : 0] mac_a;
reg signed [inst_B_width-1 : 0] mac_b;
reg signed [inst_SUM_width-1 : 0] mac_c;
wire signed [inst_SUM_width-1 : 0] mac_out;
reg signed [inst_SUM_width-1 : 0] mac_ost;

// Instance of DW02_prod_sum1
DW02_prod_sum1 #(inst_A_width, inst_B_width, inst_SUM_width)
MAC0 ( .A(mac_a), .B(mac_b), .C(mac_c), .TC(1'b1), .SUM(mac_out) );




//---------------------------------------------------------------------
// SRAM Instantiation
//---------------------------------------------------------------------

reg sram0_wen;
reg signed [8-1 : 0] sram0_d;
reg [4-1 : 0] sram0_arr, sram0_row, sram0_col;
wire [12-1: 0] sram0_a = {sram0_arr, sram0_row, sram0_col};
reg [12-1: 0] sram0_a_wr;

wire signed [8-1 : 0] sram0_q;
RA1SH_16 SRAM0(.Q(sram0_q),.CLK(clk),.CEN(1'b0),.WEN(sram0_wen),.A(sram0_a_wr),.D(sram0_d),.OEN(1'b0));

reg sram1_wen;
reg signed [8-1 : 0] sram1_d;
reg [4-1 : 0] sram1_arr, sram1_row, sram1_col;
wire [12-1 : 0] sram1_a = {sram1_arr, sram1_row, sram1_col};
reg [12-1 : 0] sram1_a_wr;

wire signed [8-1 : 0] sram1_q;
RA1SH_16 SRAM1(.Q(sram1_q),.CLK(clk),.CEN(1'b0),.WEN(sram1_wen),.A(sram1_a_wr),.D(sram1_d),.OEN(1'b0));

reg sramt_wen;
reg signed [20-1 : 0] sramt_d;
reg [4-1 : 0] sramt_row, sramt_col;
wire [8-1 : 0]sramt_a = {sramt_row, sramt_col}; 

wire signed [20-1 : 0] sramt_q;
RA1SH_1  SRAMt(.Q(sramt_q),.CLK(clk),.CEN(1'b0),.WEN(sramt_wen),.A(sramt_a),.D(sramt_d),.OEN(1'b0));

//---------------------------------------------------------------------
// FSM declaration
//---------------------------------------------------------------------

localparam S_IDLE = 'd0;
localparam S_INPUT0 = 'd1;
localparam S_INPUT1 = 'd2;

localparam S_WAIT = 'd3;
localparam S_QUEST = 'd4;
localparam S_ADJUST = 'd5;

localparam S_PRECALC = 'd6; //when A,B are in different sram
localparam S_CALC = 'd7;
localparam S_POSTCALC = 'd8;
localparam S_POSTCALC2 = 'd9;

localparam S_PRECALCSP = 'd10; // when A,B are in the same sram
localparam S_CALCSP = 'd11;
localparam S_POSTCALSP = 'd12;
localparam S_POSTCALSP2 = 'd13;
localparam S_POSTCALSP3 = 'd14;

localparam S_FCALC = 'd15;
localparam S_POSTFCALC = 'd16;
localparam S_OUTPUT = 'd17;

reg [4 : 0] current_state, next_state;

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) current_state <= S_IDLE;
    else current_state <= next_state;
end
always @(*) begin
    case (current_state)
        S_IDLE: next_state = (in_valid)? S_INPUT0: S_IDLE;
        S_INPUT0: next_state = (sram0_a == {4'b1111,pool_size,pool_size})? S_INPUT1: S_INPUT0;
        S_INPUT1: next_state = (sram1_a == {4'b1111,pool_size,pool_size})? S_WAIT: S_INPUT1;
        S_WAIT: next_state = (in_valid2)? S_QUEST: S_WAIT;
        S_QUEST: next_state = (cnt == 2)? S_ADJUST: S_QUEST;
        S_ADJUST: next_state = ((mxidx_store[0][4] == mxidx_store[1][4])&&(mxidx_store[1][4] == mxidx_store[2][4]))? S_PRECALCSP:S_PRECALC;
        
        S_PRECALC: next_state = S_CALC;
        S_CALC:begin
            if(mxidx_store[0][4])begin
                if(mode_store == 2'b01)begin
                    next_state = (sram1_col == pool_size && sram0_col == pool_size && sram0_row == pool_size)? S_POSTCALC : S_CALC;
                end else begin
                    next_state = (sram1_row == pool_size && sram0_col == pool_size && sram0_row == pool_size)? S_POSTCALC : S_CALC;
                end
            end else begin
                if(mode_store == 2'b01)begin
                    next_state = (sram0_col == pool_size && sram1_col == pool_size && sram1_row == pool_size)? S_POSTCALC : S_CALC;
                end else begin
                    next_state = (sram0_row == pool_size && sram1_col == pool_size && sram1_row == pool_size)? S_POSTCALC : S_CALC;
                end
            end
        end
        S_POSTCALC: next_state = S_POSTCALC2;
        S_POSTCALC2: next_state = S_FCALC;
        
        S_PRECALCSP: next_state = S_CALCSP;
        S_CALCSP:begin
            if(mode_store == 2'b01)begin
                next_state = (sram0_col == pool_size && sp_row == pool_size && sp_col == pool_size)? S_POSTCALSP : S_CALCSP;
            end else begin
                next_state = (sram0_row == pool_size && sp_row == pool_size && sp_col == pool_size)? S_POSTCALSP : S_CALCSP;
            end
        end 
        S_POSTCALSP: next_state = S_POSTCALSP2;
        S_POSTCALSP2: next_state = S_POSTCALSP3;
        S_POSTCALSP3: next_state = S_FCALC;

        S_FCALC: next_state = (sram0_row == pool_size && sram0_col == pool_size)? S_POSTFCALC: S_FCALC;
        S_POSTFCALC: next_state = S_OUTPUT;
        S_OUTPUT: next_state = (quest_count == 10)? S_IDLE : S_WAIT;

        default: next_state = S_IDLE;
    endcase
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) cnt <= 0;
    else begin
            case (current_state)
            S_WAIT: cnt <= (in_valid2)? 1 : cnt+1;
            S_PRECALC, S_PRECALCSP: cnt <= 6'b111110;
            S_CALC: cnt <= (cnt == pool_size)? 0 : cnt + 1;
            S_CALCSP: cnt <= (cnt[4:1] == pool_size && cnt[0])?0 : cnt + 1;
            S_POSTCALC2,S_POSTCALSP3: cnt <= 0;
            S_FCALC,S_POSTFCALC: cnt <= (cnt == 1)? 1: cnt + 1;
            
            default: cnt <= cnt + 1;
        endcase
    end
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) quest_count <= 0;
    else begin
        case (current_state)
            S_IDLE: quest_count <= 0; 
            S_ADJUST: quest_count <= quest_count + 1;
        endcase
    end
end

//store signals about the first stage(write to sram)
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) matrix_buffer <= 0;
    else if(in_valid) matrix_buffer <= matrix;
end
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) pool_size <= 0;
    else if(current_state == S_IDLE && in_valid)begin
        case (matrix_size)
            2'b00: pool_size <= 4'b0001;
            2'b01: pool_size <= 4'b0011;
            2'b10: pool_size <= 4'b0111;
            2'b11: pool_size <= 4'b1111;
        endcase
    end
end

//store signals about the second stage(calculate dot product)
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) mode_store <= 0;
    else begin
        case (current_state)
            S_WAIT: mode_store <= (in_valid2)? mode : mode_store;
            S_ADJUST:begin
                if((mxidx_store[0][4] == mxidx_store[1][4]) && (mxidx_store[1][4] != mxidx_store[2][4]))begin
                    case (mode_store)
                        //2'b00 would not be affected
                        2'b01: mode_store <= 2'b11;
                        2'b10: mode_store <= 2'b01;
                        2'b11: mode_store <= 2'b10;
                    endcase
                end
            end
        endcase
    end
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) {mxidx_store[0],mxidx_store[1],mxidx_store[2]} <= 0;
    else begin
        case (current_state)
            S_WAIT: mxidx_store[2] <= (in_valid2)? matrix_idx : mxidx_store[2];
            S_QUEST:begin
                mxidx_store[2] <= matrix_idx;
                mxidx_store[1] <= mxidx_store[2];
                mxidx_store[0] <= mxidx_store[1];
            end
            S_ADJUST:begin
                if((mxidx_store[0][4] == mxidx_store[1][4]) && (mxidx_store[1][4] != mxidx_store[2][4]))begin
                    // e.g 110 --leftshift-->101
                mxidx_store[2] <= mxidx_store[0];
                mxidx_store[1] <= mxidx_store[2];
                mxidx_store[0] <= mxidx_store[1];
                end
                
            end
        endcase
    end
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        sp_arr <= 0;
        sp_row <= 0;
        sp_col <= 0;
    end else begin
        case (current_state)
            S_PRECALCSP:begin
                sp_arr <= mxidx_store[1][3:0];
                sp_row <= 0;
                sp_col <= 0;
            end
            S_CALCSP:begin
                if(cnt[0])begin
                    if(mode_store == 2'b10)begin //AB^TC
                        sp_col <= (sp_col == pool_size)? 0 : sp_col + 1;

                        if(sp_row == pool_size && sp_col == pool_size) sp_row <= 0;
                        else if(sp_col == pool_size) sp_row <= sp_row + 1;

                    end else begin
                        // working on B[idx++][j]
                        sp_row <= (sp_row == pool_size)? 0 : sp_row + 1;
                        
                        if(sp_col == pool_size && sp_row == pool_size) sp_col <= 0;
                        else if(sp_row == pool_size) sp_col <= sp_col + 1;
                    end
                end
            end
        endcase
    end
end



always @(posedge clk or negedge rst_n) begin
    if(!rst_n) sram0_wen <= 1;// 1 for read and 0 for write
    else begin
        case (current_state)
            S_IDLE: sram0_wen <= (in_valid)? 1'b0 : 1'b1;
            S_INPUT0: sram0_wen <= (sram0_a == {4'b1111,pool_size,pool_size})? 1'b1: 1'b0;
            S_INPUT1: sram0_wen <= 1'b1; 
        endcase
    end
end
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        sram0_arr <= 0;
        sram0_row <= 0;
        sram0_col <= 0;
    end else begin
        case (current_state)
            S_IDLE: {sram0_arr, sram0_row, sram0_col} <= 12'd0;
            S_INPUT0:begin
                sram0_col <= (sram0_col == pool_size)? 0 : sram0_col + 1;
                
                if(sram0_row == pool_size && sram0_col == pool_size) sram0_row <= 0;
                else if(sram0_col == pool_size) sram0_row <= sram0_row + 1;

                if(sram0_row == pool_size && sram0_col == pool_size) sram0_arr <= sram0_arr + 1;
            end
            S_PRECALC:begin
                sram0_arr <= (mxidx_store[0][4])? mxidx_store[1][3:0] : mxidx_store[0][3:0];
                sram0_row <= 0;
                sram0_col <= 0;
            end
            S_CALC:begin
                if((mxidx_store[0][4]))begin
                    //this means we are dealing with array B
                    if(mode_store == 2'b10)begin
                        //dealing with AB^T
                        sram0_col <= (sram0_col == pool_size)? 0 : sram0_col+1;

                        if(sram0_row == pool_size && sram0_col == pool_size) sram0_row <= 0;
                        else if(sram0_col == pool_size) sram0_row <= sram0_row + 1;
                        
                    end else begin
                        //dealing with AB..
                        sram0_row <= (sram0_row == pool_size)? 0 : sram0_row+1;
                        
                        if(sram0_col == pool_size && sram0_row == pool_size) sram0_col <= 0;
                        else if(sram0_row == pool_size) sram0_col <= sram0_col + 1;
                    end
                end else begin
                    //This means we are dealing with array A
                    if(mode_store == 2'b01)begin
                        //dealing with A^TB
                        sram0_row <= (sram0_row == pool_size)? 0 : sram0_row+1;
    
                        if(sram0_col == pool_size && sram1_col == pool_size && sram1_row == pool_size) sram0_col <= 0;
                        else if(sram1_col == pool_size && sram1_row == pool_size) sram0_col <= sram0_col + 1;
                    end else begin
                        //dealing with AB..
                        sram0_col <= (sram0_col == pool_size)? 0 : sram0_col+1;

                        if(sram0_row == pool_size && sram1_col == pool_size && sram1_row == pool_size) sram0_row <= 0;
                        else if(sram1_col == pool_size && sram1_row == pool_size) sram0_row <= sram0_row + 1;
                    end
                end
            end
            S_POSTCALC2, S_POSTCALSP3:begin
                sram0_arr <= mxidx_store[2][3:0];
                sram0_row <= 0;
                sram0_col <= 0;
            end
            S_PRECALCSP:begin
                sram0_arr <= mxidx_store[0][3:0];
                sram0_row <= 0;
                sram0_col <= 0;
            end
            S_CALCSP:begin
                if(cnt[0])begin
                    if(mode_store == 2'b01)begin // working on A^TBC, A[i][idx++]
                        
                        sram0_row <= (sram0_row == pool_size)? 0 : sram0_row + 1;

                        if(sram0_col == pool_size && sp_col == pool_size && sp_row == pool_size) sram0_col <= 0;
                        else if(sp_col == pool_size && sp_row == pool_size) sram0_col <= sram0_col + 1;

                    end else begin

                        sram0_col <= (sram0_col == pool_size)? 0 : sram0_col + 1;

                        if(sram0_row == pool_size && sp_col == pool_size && sp_row == pool_size) sram0_row <= 0;
                        else if(sp_col == pool_size && sp_row == pool_size) sram0_row <= sram0_row + 1;
                    end
                end
            end
            S_FCALC:begin
                if(mode_store == 2'b11)begin
                    //ABc^T
                    sram0_col <= (sram0_col == pool_size)? 0 : sram0_col + 1;
                    sram0_row <= (sram0_col == pool_size)? sram0_row + 1 : sram0_row;
                end else begin
                    sram0_row <= (sram0_row == pool_size)? 0 : sram0_row + 1;
                    sram0_col <= (sram0_row == pool_size)? sram0_col + 1 : sram0_col;
                end
            end
        endcase
    end
end
always @(*) begin
    case (current_state)
        S_IDLE: sram0_d  = 0;
        S_INPUT0: sram0_d  = matrix_buffer; 
        default: sram0_d = 0;
    endcase
end
always @(*) begin
    case(current_state)
        S_CALCSP,S_POSTCALSP,S_POSTCALSP2,S_POSTCALSP3: sram0_a_wr = (cnt[0])? sp_a : sram0_a;
        default: sram0_a_wr = sram0_a;
    endcase
end



always @(posedge clk or negedge rst_n) begin
    if(!rst_n) sram1_wen <= 1;
    else begin 
        case (current_state)
            S_IDLE: sram1_wen <= 1'b1;
            S_INPUT0: sram1_wen <= (sram0_a == {4'b1111,pool_size,pool_size})? 1'b0: 1'b1;
            S_INPUT1: sram1_wen <= (sram1_a == {4'b1111,pool_size,pool_size})? 1'b1: 1'b0;
            S_WAIT: sram1_wen <= 1'b1;
            
        endcase 
    end
end
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        sram1_arr <= 0;
        sram1_row <= 0;
        sram1_col <= 0;
    end else begin
        case (current_state)
            S_IDLE:begin
                sram1_arr <= 0;
                sram1_row <= 0;
                sram1_col <= 0;
            end
            S_INPUT1:begin
                sram1_col <= (sram1_col == pool_size)? 0: sram1_col + 1;
                
                if(sram1_row == pool_size && sram1_col == pool_size) sram1_row <= 0;
                else if(sram1_col == pool_size) sram1_row <= sram1_row + 1;

                if(sram1_row == pool_size && sram1_col == pool_size) sram1_arr <= sram1_arr + 1;
            end
            S_PRECALC:begin
                sram1_arr <= (mxidx_store[0][4])? mxidx_store[0][3:0] : mxidx_store[1][3:0];
                sram1_row <= 0;
                sram1_col <= 0;
            end
            S_CALC:begin
                if(mxidx_store[0][4])begin
                    //this means we are dealing with array A
                    if(mode_store == 2'b01)begin
                        //dealing with A^TB
                        sram1_row <= (sram1_row == pool_size)? 0 : sram1_row+1;
    
                        if(sram1_col == pool_size && sram0_col == pool_size && sram0_row == pool_size) sram1_col <= 0;
                        else if(sram0_col == pool_size && sram0_row == pool_size) sram1_col <= sram1_col + 1;
                    end else begin
                        //dealing with AB..
                        sram1_col <= (sram1_col == pool_size)? 0 : sram1_col+1;

                        if(sram1_row == pool_size && sram0_col == pool_size && sram0_row == pool_size) sram1_row <= 0;
                        else if(sram0_col == pool_size && sram0_row == pool_size) sram1_row <= sram1_row + 1;
                    end
                end else begin
                    //dealing with array B
                    if(mode_store == 2'b10)begin
                        //dealing with AB^T
                        sram1_col <= (sram1_col == pool_size)? 0 : sram1_col+1;

                        if(sram1_row == pool_size && sram1_col == pool_size) sram1_row <= 0;
                        else if(sram1_col == pool_size) sram1_row <= sram1_row + 1;

                    end else begin
                        //dealing wihth AB..
                        sram1_row <= (sram1_row == pool_size)? 0 : sram1_row+1;
                        
                        if(sram1_col == pool_size && sram1_row == pool_size) sram1_col <= 0;
                        else if(sram1_row == pool_size) sram1_col <= sram1_col + 1;
                    end
                end
            end
            S_POSTCALC2, S_POSTCALSP3:begin
                sram1_arr <= mxidx_store[2][3:0];
                sram1_row <= 0;
                sram1_col <= 0;
            end
            S_PRECALCSP:begin
                sram1_arr <= mxidx_store[0][3:0];
                sram1_row <= 0;
                sram1_col <= 0;
            end
            S_CALCSP:begin
                if(cnt[0])begin
                    if(mode_store == 2'b01)begin // working on A^TBC, A[i][idx++]
                        
                        sram1_row <= (sram1_row == pool_size)? 0 : sram1_row + 1;

                        if(sram1_col == pool_size && sp_col == pool_size && sp_row == pool_size) sram1_col <= 0;
                        else if(sp_col == pool_size && sp_row == pool_size) sram1_col <= sram1_col + 1;

                    end else begin

                        sram1_col <= (sram1_col == pool_size)? 0 : sram1_col + 1;

                        if(sram1_row == pool_size && sp_col == pool_size && sp_row == pool_size) sram1_row <= 0;
                        else if(sp_col == pool_size && sp_row == pool_size) sram1_row <= sram1_row + 1;
                    end
                end
            end
            S_FCALC:begin
                if(mode_store == 2'b11)begin
                    //ABc^T
                    sram1_col <= (sram1_col == pool_size)? 0 : sram1_col + 1;
                    sram1_row <= (sram1_col == pool_size)? sram1_row + 1 : sram1_row;
                end else begin
                    sram1_row <= (sram1_row == pool_size)? 0 : sram1_row + 1;
                    sram1_col <= (sram1_row == pool_size)? sram1_col + 1 : sram1_col;
                end
            end

        endcase
    end
end
always @(*) begin
    case(current_state)
        S_IDLE, S_INPUT0: sram1_d = 0;
        S_INPUT1: sram1_d = matrix_buffer;
        default: sram1_d = 0;
    endcase
end
always @(*) begin
    case(current_state)
        S_CALCSP, S_POSTCALSP, S_POSTCALSP2, S_POSTCALSP3: sram1_a_wr = (cnt[0])? sp_a : sram1_a;
        default: sram1_a_wr = sram1_a;
    endcase
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) sp_storeq <= 0;
    else if ((current_state == S_CALCSP && cnt != 6'b111110) || current_state == S_POSTCALSP || current_state == S_POSTCALSP2)begin
        if(mxidx_store[0][4]) sp_storeq <= sram1_q;
        else sp_storeq <= sram0_q;
    end
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) sramt_wen <= 1;
    else begin
        case(current_state)
            S_IDLE: sramt_wen <= 1;
            S_PRECALC, S_PRECALCSP: sramt_wen <= 0;
            S_POSTCALC2,S_POSTCALSP3: sramt_wen <= 1;
        endcase
    end
end
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        sramt_row <= 0;
        sramt_col <= 0;
    end
    else begin
        case(current_state)
            S_WAIT:begin
                sramt_row <= 0;
                sramt_col <= 0;
            end
            S_CALC, S_POSTCALC:begin
                
                if(sramt_col == pool_size && cnt == pool_size) sramt_col <= 0;
                else if(cnt == pool_size) sramt_col <= sramt_col + 1;

                if(sramt_row == pool_size && sramt_col == pool_size && cnt == pool_size) sramt_row <= 0;
                else if(sramt_col == pool_size && cnt == pool_size) sramt_row <= sramt_row + 1;
            end
            S_POSTCALC2, S_POSTCALSP3:begin
                sramt_row <= 0;
                sramt_col <= 0;
            end
            S_CALCSP,S_POSTCALSP, S_POSTCALSP2:begin
                if(sramt_col == pool_size && cnt[5:1] == pool_size && cnt[0]) sramt_col <= 0;
                else if(cnt[5:1] == pool_size && cnt[0]) sramt_col <= sramt_col + 1;

                if(sramt_row == pool_size && sramt_col == pool_size && cnt[5:1] == pool_size && cnt[0]) sramt_row <= 0;
                else if(sramt_col == pool_size && cnt[5:1] == pool_size && cnt[0])sramt_row <= sramt_row + 1;
            end
            S_FCALC:begin
                
                sramt_col <= (sramt_col == pool_size)? 0 : sramt_col + 1;

                sramt_row <= (sramt_col == pool_size)? sramt_row+1 :  sramt_row;
            end
            
        endcase
    end
end
always @(*) begin
    sramt_d = mac_ost;
end

//mac system
always @(*) begin
    case (current_state)
        S_CALC,S_POSTCALC:begin
            mac_a = sram0_q;
            mac_b = sram1_q;
        end
        S_FCALC,S_POSTFCALC:begin
            mac_a = sramt_q;
            mac_b = (mxidx_store[2][4])? sram1_q : sram0_q;
        end
        S_CALCSP,S_POSTCALSP,S_POSTCALSP2:begin
            if(~cnt[0])begin
                mac_a = (mxidx_store[0][4])? sram1_q : sram0_q;
                mac_b = sp_storeq;
            end else begin
                mac_a = 0;
                mac_b = 0;
            end
        end
        default: {mac_a, mac_b} = 0;
    endcase
end
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) mac_c <= 0;
    else begin
        case (current_state)
            S_CALC, S_POSTCALC: mac_c <= (cnt == 6'b111110 || cnt == (pool_size-1))? 0: mac_out;
            S_POSTCALC2, S_POSTCALSP3: mac_c <= 0;
            S_FCALC,S_POSTCALC: mac_c <= (cnt == 0)? 0 : mac_out;
            S_CALCSP, S_POSTCALSP, S_POSTCALSP2: mac_c <= (cnt == 6'b111110 || cnt[4:1]== pool_size && cnt[0])? 0 : mac_out;
        endcase
    end
end
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) mac_ost <= 0;
    else mac_ost <= mac_out;
end


always @(posedge clk or negedge rst_n) begin
    if(!rst_n) out_valid <= 0;
    else out_valid <= (current_state == S_POSTFCALC)? 1'b1 : 1'b0;
end
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) out_value <= 0;
    else out_value <= (current_state == S_POSTFCALC)? mac_out : 0;
end



endmodule
