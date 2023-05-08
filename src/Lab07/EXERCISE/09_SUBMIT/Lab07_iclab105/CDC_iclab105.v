`include "AFIFO.v"

module CDC #(parameter DSIZE = 8,
			   parameter ASIZE = 4)(
	//Input Port
	rst_n,
	clk1,
    clk2,
	in_valid,
    doraemon_id,
    size,
    iq_score,
    eq_score,
    size_weight,
    iq_weight,
    eq_weight,
    //Output Port
	ready,
    out_valid,
	out
    
); 
//---------------------------------------------------------------------
//   INPUT AND OUTPUT DECLARATION
//---------------------------------------------------------------------
output reg  [7:0] out;
output reg	out_valid,ready;

input rst_n, clk1, clk2, in_valid;
input  [4:0]doraemon_id;
input  [7:0]size;
input  [7:0]iq_score;
input  [7:0]eq_score;
input [2:0]size_weight,iq_weight,eq_weight;

//---------------------------------------------------------------------
//   WIRE AND REG DECLARATION
//---------------------------------------------------------------------

reg [5-1 : 0] dora_id   [0 : 4];
reg [8-1 : 0] dora_size [0 : 4];
reg [8-1 : 0] dora_iq   [0 : 4];
reg [8-1 : 0] dora_eq   [0 : 4];

reg [2 : 0] w_size, w_iq, w_eq;

reg [13-1 : 0] dora_score2, dora_score3;

reg [3-1 : 0] cmp_rst1;
reg [2-1 : 0] cmp_rst2;

reg [3-1 : 0] ans1_door;
reg [5-1 : 0] ans1_idx;

reg [13-1 : 0] stopmachine;
//---------------------------------------------------------------------
//   Common operation unit
//---------------------------------------------------------------------
// reg [8-1 : 0] m1_op [0 : 2];

wire [11-1 : 0] ws_size = dora_size[0] * w_size;
wire [11-1 : 0] ws_iq = dora_iq[0] * w_iq;
wire [11-1 : 0] ws_eq = dora_eq[0] * w_eq;
reg [13-1 : 0] m1_out;

reg [13-1 : 0] cmp1_op [0 : 1];
wire cmp1_out = (cmp1_op[0] >= cmp1_op[1]);

reg [13-1 : 0] cmp2_op [0 : 1];
wire cmp2_out = (cmp2_op[0] >= cmp2_op[1]);

wire doraat0 = cmp_rst1[0] && cmp_rst1[1] && cmp_rst1[2] && cmp1_out;
wire doraat1 = cmp_rst2[0] && cmp_rst2[1] && cmp2_out;

//---------------------------------------------------------------------
//   Asynchronous FIFO
//---------------------------------------------------------------------

//write side
reg af_winc;
wire [8-1 : 0]af_wdata = {ans1_door, ans1_idx};
wire af_wfull;

//read side
reg af_rinc;
wire af_rempty;
wire [8-1 : 0] af_rdata;



AFIFO #( .DSIZE(DSIZE), .ASIZE(ASIZE)) afifo (
	//Input Port
	.rst_n(rst_n),
    //Input Port (read)
    .rclk(clk2),
    .rinc(af_rinc),
	//Input Port (write)
    .wclk(clk1),
    .winc(af_winc),
	.wdata(af_wdata),

    //Output Port (read)
    .rempty(af_rempty),
	.rdata(af_rdata),
    //Output Port (write)
    .wfull(af_wfull)

);


//---------------------------------------------------------------------
//  FSM declaration
//---------------------------------------------------------------------
localparam S_INIT = 'd0;
localparam S_STUP = 'd1;
localparam S_WAITIN = 'd2;
localparam S_CALC = 'd3;
localparam S_FIDX = 'd4;
localparam S_XTRN = 'd5;
localparam S_OUTPUT = 'd6;
localparam S_FIX = 'd7;

reg [2 : 0] current_state, next_state;
reg [3 : 0] cnt; //universal counter

always @(posedge clk1 or negedge rst_n) begin
    if(!rst_n) current_state <= S_INIT;
    else current_state <= next_state;
end
always @(*) begin
    case (current_state)
        S_INIT: next_state = (in_valid)? S_STUP : S_INIT;
        S_STUP: next_state = (cnt == 2)? S_WAITIN : S_STUP;
        S_WAITIN:begin
            if(in_valid)begin
                if(ans1_door == 3'd6 || ans1_door == 3'd4)begin
                    next_state = S_CALC;
                end else begin
                    next_state = S_FIX;
                end
                
            end else begin
                next_state = S_WAITIN;
            end
        end
        S_CALC:begin
            case (cnt)
                4'd6: next_state = ((cmp_rst1[0] && cmp_rst1[1] && cmp_rst1[2] && cmp1_out) || (cmp_rst2[0] && cmp_rst2[1] && cmp2_out))? S_FIDX : S_CALC;
                4'd7: next_state = (cmp1_out && cmp2_out)? S_FIDX : S_CALC;
                4'd8: next_state = S_FIDX;
                default: next_state = S_CALC;
            endcase
        end
        S_FIDX: next_state = (ans1_door == 3'd4)? S_XTRN : S_OUTPUT;
        S_XTRN: next_state = S_OUTPUT;
        S_OUTPUT: next_state = (stopmachine == 5995)? S_INIT : S_WAITIN;
        S_FIX: next_state = (cnt == 1)? S_CALC : S_FIX;
        default: next_state = S_INIT;
    endcase
end
always @(posedge clk1 or negedge rst_n) begin
    if(!rst_n) cnt <= 0;
    else begin
        case (current_state)
            S_INIT, S_OUTPUT: cnt <= 0;
            S_STUP: cnt <= (cnt == 2)? 0 : cnt + 1;
            S_CALC: cnt <= cnt + 1; 
            S_FIDX, S_XTRN: cnt <= 0;
            S_WAITIN:begin
                if(in_valid)begin
                    if(ans1_door == 3'd6 || ans1_door == 3'd4) cnt <= 0;
                    else cnt <= (3'd4 - ans1_door);
                end
            end
            S_FIX: cnt <= cnt - 1;

        endcase
    end
end

always @(posedge clk1 or negedge rst_n)begin
    if(!rst_n) stopmachine <= 0;
    else begin
        if(current_state == S_STUP) stopmachine <= 0;
        else if(current_state == S_OUTPUT) stopmachine <= stopmachine + 1; 
    end
end

always @(posedge clk1)begin
    if((current_state == S_INIT && in_valid) || (current_state == S_STUP) || (current_state == S_WAITIN && in_valid))begin

        dora_id[4] <= doraemon_id;
        dora_size[4] <= size;
        dora_iq[4] <= iq_score;
        dora_eq[4] <= eq_score;
        if(ans1_door[2:1]==2'b11)begin
            dora_id[3] <= dora_id[4];
            dora_id[2] <= dora_id[3];
            dora_id[1] <= dora_id[2];
            dora_id[0] <= dora_id[1];

            dora_size[3] <= dora_size[4];
            dora_size[2] <= dora_size[3];
            dora_size[1] <= dora_size[2];
            dora_size[0] <= dora_size[1];
            
            dora_iq[3] <= dora_iq[4];
            dora_iq[2] <= dora_iq[3];
            dora_iq[1] <= dora_iq[2];
            dora_iq[0] <= dora_iq[1];

            dora_eq[3] <= dora_eq[4];
            dora_eq[2] <= dora_eq[3];
            dora_eq[1] <= dora_eq[2];
            dora_eq[0] <= dora_eq[1];
        end

    end else if((current_state==S_CALC && (cnt < 5 || (cnt==6 && (~doraat0)) || (cnt==7) || (cnt==8))) || (current_state==S_FIDX) || (current_state==S_XTRN) || (current_state==S_FIX))begin

        dora_id[4] <= dora_id[0];
        dora_id[3] <= dora_id[4];
        dora_id[2] <= dora_id[3];
        dora_id[1] <= dora_id[2];
        dora_id[0] <= dora_id[1];
        
        dora_size[4] <= dora_size[0];
        dora_size[3] <= dora_size[4];
        dora_size[2] <= dora_size[3];
        dora_size[1] <= dora_size[2];
        dora_size[0] <= dora_size[1];
        
        dora_iq[4] <= dora_iq[0];
        dora_iq[3] <= dora_iq[4];
        dora_iq[2] <= dora_iq[3];
        dora_iq[1] <= dora_iq[2];
        dora_iq[0] <= dora_iq[1];

        dora_eq[4] <= dora_eq[0];
        dora_eq[3] <= dora_eq[4];
        dora_eq[2] <= dora_eq[3];
        dora_eq[1] <= dora_eq[2];
        dora_eq[0] <= dora_eq[1];
    end
end


always@(posedge clk1)begin
    if(current_state == S_WAITIN && in_valid)begin
        w_size <= size_weight;
        w_iq <= iq_weight;
        w_eq <= eq_weight;
    end
end


//we have to remember some sums
always@(posedge clk1)begin
    if(current_state == S_CALC && cnt == 3)begin
        dora_score2 <= m1_out;
    end
end
always@(posedge clk1)begin
    if(current_state == S_CALC && cnt == 4)begin
        dora_score3 <= m1_out;
    end
end

//set up the multiplier
always @(posedge clk1)begin
    m1_out <= ws_size + ws_iq + ws_eq;
end

//controling the comparator
always@(posedge clk1)begin
    case (cnt)
        4'd1:begin
            cmp1_op[0] <= m1_out;
        end
        4'd2:begin
            cmp1_op[1] <= m1_out;
            cmp2_op[0] <= m1_out;
        end
        4'd3, 4'd4, 4'd5:begin
            cmp1_op[1] <= m1_out;
            cmp2_op[1] <= m1_out;
            
        end
        4'd6:begin
            cmp1_op[0] <= dora_score2;
            cmp1_op[1] <= dora_score3;
            cmp2_op[0] <= dora_score2;
        end
        4'd7:begin
            cmp2_op[0] <= dora_score3;
        end
    endcase
end

//store compared results
always@(posedge clk1)begin
    cmp_rst1[0] <= cmp1_out;
    cmp_rst1[1] <= cmp_rst1[0];
    cmp_rst1[2] <= cmp_rst1[1];

    cmp_rst2[0] <= cmp2_out;
    cmp_rst2[1] <= cmp_rst2[0];
end

always@(posedge clk1 or negedge rst_n)begin
    if(!rst_n)begin
        ans1_door <= 3'b110;
    end else begin
        if (current_state == S_CALC)begin
            case(cnt)
                4'd6:begin
                    if(doraat0)begin
                        ans1_door <= 3'd0;
                    end else if(doraat1)begin
                        ans1_door <= 3'd1;
                    end
                end
                4'd7:begin
                    if(cmp1_out && cmp2_out)begin
                        ans1_door <= 3'd2;
                    end 
                end
                4'd8:begin
                    ans1_door <= (cmp2_out == 1)? 3'd3 : 3'd4;
                end
            endcase
        end
    end
end
always @(posedge clk1 or negedge rst_n)begin
    if(!rst_n)begin
        ans1_idx <= 5'd0;
    end else begin
        if(current_state == S_FIDX || current_state == S_XTRN)begin
            ans1_idx <= dora_id[0];
        end
    end
end

//control fifos
always @(posedge clk1 or negedge rst_n)begin
    if(!rst_n)begin
        af_winc <= 0;
    end else begin
        if((current_state == S_FIDX && ans1_door != 3'd4) || current_state == S_XTRN)begin
            af_winc <= 1;
        end else begin
            af_winc <= 0;
        end
    end
end

always @(posedge clk2 or negedge rst_n)begin
    if(!rst_n) af_rinc <= 0;
    else begin
        if(!af_rempty) af_rinc <= 1;
        else af_rinc <= 0;
    end
end

//output locic of clock domain 1
always @(posedge clk1 or negedge rst_n) begin
    if(!rst_n) ready <= 0;
    else begin
        case(current_state)
            S_STUP: ready <= (cnt == 2)? 1'b1 : 1'b0;
            S_WAITIN: ready <= (in_valid)? 1'b0 : 1'b1;
            S_OUTPUT: ready <= (stopmachine == 5995)? 1'b0 : 1'b1;
            default: ready <= 0;
        endcase
    end
end

//output logic of clock domain 2
always @(posedge clk2 or negedge rst_n)begin
    if(!rst_n) out_valid <= 0;
    else begin
        if(!af_rempty && !out_valid) out_valid <= 1;
        else out_valid <= 0; 
    end
end
always @(posedge clk2 or negedge rst_n)begin
    if(!rst_n) out <= 0;
    else begin
        if(!af_rempty && !out_valid) out <= af_rdata;
        else out <= 0;
    end
end
    


endmodule