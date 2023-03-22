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
//       parameter & register declaration       //
//==============================================//
parameter  BUFF_LEN  = 4;
parameter  ANS_LEN  = 56;

parameter M_FORWARD = 2'd0;
parameter M_RIGHT   = 2'd1;
parameter M_LEFT    = 2'd2;
parameter M_JUMP    = 2'd3;

parameter S_ROAD    = 2'd0;
parameter S_LO      = 2'd1;
parameter S_HO      = 2'd2;
parameter S_TRAINS  = 2'd3;

parameter E_NULL    = 2'd0;
parameter E_RIGHT   = 2'd1;
parameter E_LEFT    = 2'd2;
parameter E_STRAIGHT= 2'd3;

//==============================================//
//       parameter & register declaration       //
//==============================================//
//FSM design

localparam S_INIT       = 2'd0;
localparam S_PUREIN     = 2'd1;
localparam S_COMP       = 2'd2; 
localparam S_OUT        = 2'd3;
reg [1:0] current_state, next_state;

reg [1:0] map [0 : BUFF_LEN-1][0:3]; // we only have to buffer the map of BUFF_LEN
reg [1:0] lane;
reg [7-1 : 0] cnt;

reg [1:0] answer [0 : ANS_LEN - 1];
reg [6-1 : 0] ans_idx;
//integers for loop
integer idx, jdx;

//==============================================//
//                  design                      //
//==============================================//
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) current_state <= S_INIT;
    else current_state <= next_state;
end

always @(*) begin
    case (current_state)
        S_INIT: next_state = (in_valid)? S_PUREIN : S_INIT;
        S_PUREIN: next_state = (cnt == (BUFF_LEN*2 - 1))? S_COMP : S_PUREIN;
        // S_COMP: next_state = (ans_idx==62)? S_OUT : S_COMP;
        S_COMP: next_state = (cnt == 63)? S_OUT : S_COMP;
        S_OUT: next_state = (cnt == 126)? S_INIT: S_OUT;
    endcase
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) cnt <= 0;
    else if(current_state == S_INIT) cnt <= 1;
    else cnt <= cnt + 1;

end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        //reset the map
        for (idx = 0; idx < BUFF_LEN; idx = idx+1) begin
            for (jdx = 0; jdx < 4; jdx = jdx+1) begin
                map[idx][jdx] <= 2'b00;
            end
        end
    end
    else if(in_valid && (((cnt < 63) && (cnt[0] == 0)) || ((current_state == S_INIT))))begin
        map[BUFF_LEN-1][0] <= in0;
        map[BUFF_LEN-1][1] <= in1;
        map[BUFF_LEN-1][2] <= in2;
        map[BUFF_LEN-1][3] <= in3;

        for(idx = 0; idx < BUFF_LEN-1; idx = idx+1)begin
            for(jdx = 0; jdx  < 4; jdx = jdx+1)begin
                map[idx][jdx] <= map [idx+1][jdx];
            end
        end
    end else if((cnt >= 63) && (cnt[0] == 0))begin
        map[BUFF_LEN-1][0] <= 2'b00;
        map[BUFF_LEN-1][1] <= 2'b00;
        map[BUFF_LEN-1][2] <= 2'b00;
        map[BUFF_LEN-1][3] <= 2'b00;

        for(idx = 0; idx < BUFF_LEN-1; idx = idx+1)begin
            for(jdx = 0; jdx  < 4; jdx = jdx+1)begin
                map[idx][jdx] <= map [idx+1][jdx];
            end
        end
    end
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        for (idx = 0; idx < ANS_LEN; idx = idx+1) begin
            answer[idx] <= 2'd0;
        end
        lane <= 0;
    end 
    else begin
        case (current_state)
            S_INIT:begin
                if(in_valid) lane <= init;
            end 
            S_COMP:begin
                case (ans_idx[2:0])
                    3'd0:begin
                        if(map[1][lane] == S_LO)begin
                            //there might be a better way to go
                            if((lane!=3) && (map[1][lane+1] != S_LO) && (map[1][lane+1] != S_TRAINS))begin
                                //switch to right, better lane
                                answer[ans_idx] <= M_RIGHT;
                                lane <= lane + 1;
                            end else if((lane!=0) && (map[1][lane-1] != S_LO) && (map[1][lane-1] != S_TRAINS))begin
                                //switch to left, better lane
                                answer[ans_idx] <= M_LEFT;
                                lane <= lane - 1;
                            end else begin
                                //just jump over it, cost of this is 4
                                answer[ans_idx] <= M_FORWARD;
                            end
                            
                        end else begin
                            //just go straight up, no obstacles
                            answer[ans_idx] <= M_FORWARD;
                        end

                    end
                    3'd1:begin
                        answer[ans_idx] <= (map[0][lane] == S_LO)? M_JUMP : M_FORWARD;
                    end
                    3'd2:
                        answer[ans_idx] <= M_FORWARD;
                    3'd3: begin
                        if(map[0][lane] == S_LO)begin
                            //there might possibly be a better way
                            if((lane != 3) && (map[0][lane+1] == S_ROAD))begin
                                //switch to right, better lane
                                answer[ans_idx] <= M_RIGHT;
                                lane <= lane + 1;
                            end else if((lane != 0) && (map[0][lane-1] == S_ROAD))begin
                                answer[ans_idx] <= M_LEFT;
                                lane <= lane -1;
                            end else begin
                                answer[ans_idx] <= M_JUMP;
                            end
                        end else begin
                            answer[ans_idx] <= M_FORWARD;
                        end   
                    end
                    3'd4:begin
                        if((map[2][0][0] + map[2][1][0] + map[2][2][0] + map[2][3][0]) == 3)begin
                            //may have to rush to target lane
                            if((lane == 0) && (map[2][3] == S_ROAD))begin
                                answer[ans_idx] <= M_RIGHT;
                                lane <= lane + 1;
                            end 
                            else if((lane == 3) && (map[2][0] == S_ROAD))begin
                                answer[ans_idx] <= M_LEFT;
                                lane <= lane - 1;
                            end else begin
                                answer[ans_idx] <= M_FORWARD;
                            end
                        end else begin
                            answer[ans_idx] <= M_FORWARD;
                        end
                    end
                    3'd5:begin
                        if(map[0][lane] == S_LO)begin
                            if((lane != 3) && (map[0][lane+1] == S_ROAD) && ((map[1][1] == S_ROAD) || (map[1][2] == S_ROAD) || (map[1][3] == S_ROAD)))begin
                                //available to move right, the border we are reaching is safe to go
                                answer[ans_idx] <= M_RIGHT;
                                lane <= lane + 1;
                            end else if((lane != 0) && (map[0][lane-1] == S_ROAD) && ((map[1][0] == S_ROAD) || (map[1][1] == S_ROAD) || (map[1][2] == S_ROAD)))begin
                                //available to move left, the border we are reaching is safe to go
                                answer[ans_idx] <= M_LEFT;
                                lane <= lane - 1;
                            end else begin
                                answer[ans_idx] <= (map[0][lane] == S_LO)? M_JUMP : M_FORWARD;
                            end
                        end else begin
                            answer[ans_idx] <= (map[0][lane] == S_LO)? M_JUMP : M_FORWARD;
                        end
                    end
                    3'd6:begin
                        if(((lane==0)&&(map[1][0]!=S_ROAD)&&(map[1][1]!=S_ROAD)) || ((lane==1)&&(map[1][0]!=S_ROAD)&&(map[1][1]!=S_ROAD)&&(map[1][2]!=S_ROAD)))begin
                            //forced to go right
                            answer[ans_idx] <= M_RIGHT;
                            lane <= lane + 1;
                        end else if(((lane==3)&&(map[1][3]!=S_ROAD)&&(map[1][2]!=S_ROAD)) || ((lane==2)&&(map[1][3]!=S_ROAD)&&(map[1][2]!=S_ROAD)&&(map[1][1]!=S_ROAD)))begin
                            //forced to go left
                            answer[ans_idx] <= M_LEFT;
                            lane <= lane - 1;
                        end else begin
                            answer[ans_idx] <= M_FORWARD;
                        end
                    end
                    3'd7:begin
                        case (lane)
                            2'd0:begin
                                if(map[1][0]==S_TRAINS || (map[1][0]==S_LO && map[1][1]!=S_LO && map[1][1]!=S_TRAINS))begin
                                    //go right is better
                                    answer[ans_idx] <= M_RIGHT;
                                    lane <= lane + 1;
                                end else begin
                                    answer[ans_idx] <= M_FORWARD;
                                end
                            end
                            2'd1, 2'd2:begin
                                if( (map[1][lane-1]==S_TRAINS && map[1][lane]==S_TRAINS) ||
                                    (((map[1][lane-1]==S_LO && map[1][lane]==S_TRAINS)||(map[1][lane-1]==S_TRAINS && map[1][lane]==S_LO))&&(map[1][lane+1]!=S_LO && map[1][lane+1]!=S_TRAINS)) )begin
                                    //right turn is far superior
                                    answer[ans_idx] <= M_RIGHT;
                                    lane <= lane + 1;
                                end else if( (map[1][lane+1]==S_TRAINS && map[1][lane]==S_TRAINS) || 
                                             ((map[1][lane] == S_TRAINS || map[1][lane] == S_LO)&&(map[1][lane-1]!=S_TRAINS)) )begin
                                    //left turn is better than forward
                                    answer[ans_idx] <= M_LEFT;
                                    lane <= lane - 1;
                                end else begin
                                    answer[ans_idx] <= M_FORWARD;
                                end 
                            end
                            2'd3:begin
                                if(map[1][3]==S_TRAINS || (map[1][3]==S_LO && map[1][2]!=S_LO&&map[1][2]!=S_TRAINS))begin
                                    //go left is better
                                    answer[ans_idx] <= M_LEFT;
                                    lane <= lane - 1;
                                end else begin
                                    answer[ans_idx] <= M_FORWARD;
                                end
                            end
                        endcase
                    end
                    
                endcase
            end
            S_OUT:begin
                for(idx = 1; idx < ANS_LEN; idx = idx+1)begin
                    answer[idx-1] <= answer[idx];
                end

                case (ans_idx[2:0])
                    3'd0:begin
                        if(map[1][lane] == S_LO)begin
                            //there might be a better way to go
                            if((lane!=3) && (map[1][lane+1] != S_LO) && (map[1][lane+1] != S_TRAINS))begin
                                //switch to right, better lane
                                answer[55] <= M_RIGHT;
                                lane <= lane + 1;
                            end else if((lane!=0) && (map[1][lane-1] != S_LO) && (map[1][lane-1] != S_TRAINS))begin
                                //switch to left, better lane
                                answer[55] <= M_LEFT;
                                lane <= lane - 1;
                            end else begin
                                //just jump over it, cost of this is 4
                                answer[55] <= M_FORWARD;
                            end
                            
                        end else begin
                            //just go straight up, no obstacles
                            answer[55] <= M_FORWARD;
                        end


                    end
                    3'd1:begin
                        answer[55] <= (map[0][lane] == S_LO)? M_JUMP : M_FORWARD;
                    end
                    3'd2:
                        answer[55] <= M_FORWARD;
                    3'd3: begin
                        if(map[0][lane] == S_LO)begin
                            //there might possibly be a better way
                            if((lane != 3) && (map[0][lane+1] == S_ROAD))begin
                                //switch to right, better lane
                                answer[55] <= M_RIGHT;
                                lane <= lane + 1;
                            end else if((lane != 0) && (map[0][lane-1] == S_ROAD))begin
                                answer[55] <= M_LEFT;
                                lane <= lane -1;
                            end else begin
                                answer[55] <= M_JUMP;
                            end
                        end else begin
                            answer[55] <= M_FORWARD;
                        end   
                    end
                    3'd4:begin
                        if((map[2][0][0] + map[2][1][0] + map[2][2][0] + map[2][3][0]) == 3)begin
                            //may have to rush to target lane
                            if((lane == 0) && (map[2][3] == S_ROAD))begin
                                answer[55] <= M_RIGHT;
                                lane <= lane + 1;
                            end 
                            else if((lane == 3) && (map[2][0] == S_ROAD))begin
                                answer[55] <= M_LEFT;
                                lane <= lane - 1;
                            end else begin
                                answer[55] <= M_FORWARD;
                            end
                        end else begin
                            answer[55] <= M_FORWARD;
                        end
                    end
                    3'd5:begin
                        if(map[0][lane] == S_LO)begin
                            if((lane != 3) && (map[0][lane+1] == S_ROAD) && ((map[1][1] == S_ROAD) || (map[1][2] == S_ROAD) || (map[1][3] == S_ROAD)))begin
                                //available to move right, the border we are reaching is safe to go
                                answer[55] <= M_RIGHT;
                                lane <= lane + 1;
                            end else if((lane != 0) && (map[0][lane-1] == S_ROAD) && ((map[1][0] == S_ROAD) || (map[1][1] == S_ROAD) || (map[1][2] == S_ROAD)))begin
                                //available to move left, the border we are reaching is safe to go
                                answer[55] <= M_LEFT;
                                lane <= lane - 1;
                            end else begin
                                answer[55] <= (map[0][lane] == S_LO)? M_JUMP : M_FORWARD;
                            end
                        end else begin
                            answer[55] <= (map[0][lane] == S_LO)? M_JUMP : M_FORWARD;
                        end
                    end
                    3'd6:begin
                        if(((lane==0)&&(map[1][0]!=S_ROAD)&&(map[1][1]!=S_ROAD)) || ((lane==1)&&(map[1][0]!=S_ROAD)&&(map[1][1]!=S_ROAD)&&(map[1][2]!=S_ROAD)))begin
                            //forced to go right
                            answer[55] <= M_RIGHT;
                            lane <= lane + 1;
                        end else if(((lane==3)&&(map[1][3]!=S_ROAD)&&(map[1][2]!=S_ROAD)) || ((lane==2)&&(map[1][3]!=S_ROAD)&&(map[1][2]!=S_ROAD)&&(map[1][1]!=S_ROAD)))begin
                            //forced to go left
                            answer[55] <= M_LEFT;
                            lane <= lane - 1;
                        end else begin
                            answer[55] <= M_FORWARD;
                        end
                    end
                    3'd7:begin
                        case (lane)
                            2'd0:begin
                                if(map[1][0]==S_TRAINS || (map[1][0]==S_LO && map[1][1]!=S_LO && map[1][1]!=S_TRAINS))begin
                                    //go right is better
                                    answer[55] <= M_RIGHT;
                                    lane <= lane + 1;
                                end else begin
                                    answer[55] <= M_FORWARD;
                                end
                            end
                            2'd1, 2'd2:begin
                                if( (map[1][lane-1]==S_TRAINS && map[1][lane]==S_TRAINS) ||
                                    (((map[1][lane-1]==S_LO && map[1][lane]==S_TRAINS)||(map[1][lane-1]==S_TRAINS && map[1][lane]==S_LO))&&(map[1][lane+1]!=S_LO && map[1][lane+1]!=S_TRAINS)) )begin
                                    //right turn is far superior
                                    answer[55] <= M_RIGHT;
                                    lane <= lane + 1;
                                end else if( (map[1][lane+1]==S_TRAINS && map[1][lane]==S_TRAINS) || 
                                             ((map[1][lane] == S_TRAINS || map[1][lane] == S_LO)&&(map[1][lane-1]!=S_TRAINS)) )begin
                                    //left turn is better than forward
                                    answer[55] <= M_LEFT;
                                    lane <= lane - 1;
                                end else begin
                                    answer[55] <= M_FORWARD;
                                end 
                            end
                            2'd3:begin
                                if(map[1][3]==S_TRAINS || (map[1][3]==S_LO && map[1][2]!=S_LO&&map[1][2]!=S_TRAINS))begin
                                    //go left is better
                                    answer[55] <= M_LEFT;
                                    lane <= lane - 1;
                                end else begin
                                    answer[55] <= M_FORWARD;
                                end
                            end
                        endcase
                    end
                    
                endcase
            end

        endcase
    end
    
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        ans_idx <= 0;
    end else if(current_state == S_COMP || current_state == S_OUT)begin
        ans_idx <= ans_idx + 1;
    end else begin
        ans_idx <= 0;
    end
end


//output logic

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) 
        out_valid = 1'b0;
    else if(current_state ==  S_OUT) 
        out_valid = 1'b1;
    else 
        out_valid = 1'b0;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        out = 2'd0;
    else if(current_state ==  S_OUT) 
        out = answer[0];
    else
        out = 2'd0;
end

endmodule

