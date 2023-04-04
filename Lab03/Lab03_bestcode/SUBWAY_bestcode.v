module SUBWAY(
    //Input Port
    clk,
    rst_n,
    in_valid,
    init,
    in0,
    in1,
    in2,
    in3,
    //Output Port
    out_valid,
    out
);


input clk, rst_n;
input in_valid;
input [1:0] init;
input [1:0] in0, in1, in2, in3; 
output reg       out_valid;
output reg [1:0] out;


//==============================================//
//       parameter & integer declaration        //
//==============================================//
parameter IDLE = 3'd0, STORE_PROCESS = 3'd1, OUT_ST = 3'd2;
integer i,j;
//==============================================//
//           reg & wire declaration             //
//==============================================//
reg [5:0] output_counter;
reg [3:0] process_counter;
reg [2:0] curr_state, next_state;
reg [1:0] movement_array_roads [0:20];
reg       movement_array_obstacles [0:20];
reg       my_FIFO[0:3][0:2];
reg [1:0] curr_row_num;
reg in_valid_r;
reg [1:0] next_col [0:3];
reg [1:0] curr_input [0:3];
reg [1:0] end_row_num;
reg       process_start_flag;
wire      right_flag,left_flag;
wire [1:0] m1,m2,m3;
wire      process_counter_FIFO_flag;


//==============================================//
//                  design                      //
//==============================================//
//state machine
always @(posedge clk or negedge rst_n) curr_state <= (!rst_n)? 0: next_state;
always @(*) begin
    case (curr_state)
        IDLE   : next_state = (in_valid)? STORE_PROCESS: IDLE;
        STORE_PROCESS  : next_state = (!in_valid)? OUT_ST: STORE_PROCESS;
        OUT_ST : next_state = (output_counter==63)? IDLE: OUT_ST;
        default: next_state = IDLE;
    endcase
end


//output
always @(posedge clk or negedge rst_n) out_valid <= (!rst_n)? 0: (next_state==OUT_ST)? 1: 0;
always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        out <= 2'd0;
    else if (next_state==IDLE)
        out <= 2'd0;
    else if (next_state==OUT_ST) begin
        if (process_counter==4 | process_counter==6)    
            out <= movement_array_roads[0];
        else if (process_counter==7)
            out <= movement_array_roads[1];
        else if (process_counter[0]==1)
            out <= (movement_array_obstacles[0]==1)? 3: 0;
        else
            out <= 0;
    end
end


//counters
always @(posedge clk or negedge rst_n) output_counter <= (!rst_n)? 0: (next_state==OUT_ST)? output_counter+1: 0;
always @(posedge clk) process_counter <= (next_state==IDLE)? 0:(process_counter==8)? 1:(process_counter_FIFO_flag)? process_counter+1:0;
//design
always @(posedge clk) in_valid_r <= (next_state==IDLE)? 0: in_valid;
always @(posedge clk) begin
    if (next_state==IDLE)
        for (i=0; i<4; i=i+1)
            for (j=0; j<3; j=j+1)
                my_FIFO[i][j] <= 0;
    else if(process_counter_FIFO_flag==1 & (process_counter==2|process_counter==4|process_counter==6)) begin
        my_FIFO[0][0] <= in0[0];
        my_FIFO[1][0] <= in1[0];
        my_FIFO[2][0] <= in2[0];
        my_FIFO[3][0] <= in3[0];
        for (j=1; j<3; j=j+1) begin
            my_FIFO[0][j] <= my_FIFO[0][j-1];
            my_FIFO[1][j] <= my_FIFO[1][j-1];
            my_FIFO[2][j] <= my_FIFO[2][j-1];
            my_FIFO[3][j] <= my_FIFO[3][j-1];
        end  
    end
end
always @(*) begin
    for (i=0; i<4; i=i+1) begin
        next_col[i] = my_FIFO[i][2];
    end
end
always @(*) begin
    curr_input[0] = in0;
    curr_input[1] = in1;
    curr_input[2] = in2;
    curr_input[3] = in3;
end
assign m1 = curr_row_num-1;
assign m2 = curr_row_num-2;
assign m3 = curr_row_num-3;
always @(posedge clk) begin
    if (next_state==IDLE)
        end_row_num <= 0;
    else if (process_counter==8 &next_state==STORE_PROCESS) begin
        if(curr_input[curr_row_num]==0)
            end_row_num <= curr_row_num;
        else if(curr_input[m1]==0)
            end_row_num <= m1;    
        else if(curr_input[m3]==0)
            end_row_num <= m3;    
        else
            end_row_num <= m2;
    end 
end
always @(posedge clk) process_start_flag <= (next_state==IDLE)? 0: (process_counter==8)? 1: process_start_flag;
always @(posedge clk) begin
    if (next_state==IDLE) begin
        for (i=0;i<21;i=i+1)
            movement_array_obstacles[i] <=0;
        for (i=0;i<21;i=i+1)
            movement_array_roads[i] <=0;
    end
    else if (in_valid_r==0&in_valid==1)
        curr_row_num <= init;
    else if (process_start_flag) begin
        if (process_counter==5 | process_counter==7 | process_counter==8) begin
            for (i=0;i<20;i=i+1)
                movement_array_roads[i] <= movement_array_roads[i+1];
            if(right_flag) begin
                movement_array_roads[20] <= 2'd1;
                curr_row_num <= curr_row_num+1;
            end
            else if (left_flag) begin
                movement_array_roads[20] <= 2'd2;
                curr_row_num <= curr_row_num-1;
            end
            else
                movement_array_roads[20] <= 2'd0;
        end
        else if (process_counter[0]==0) begin
            for (i=0;i<20;i=i+1)
                movement_array_obstacles[i] <= movement_array_obstacles[i+1];
            if(next_col[curr_row_num]==1)
                movement_array_obstacles[20] <= 1;//jump
            else
                movement_array_obstacles[20] <= 0;
        end
    end
end
assign right_flag = curr_row_num < end_row_num;
assign left_flag = curr_row_num > end_row_num;
assign process_counter_FIFO_flag = (in_valid==1 | next_state==OUT_ST);

endmodule

