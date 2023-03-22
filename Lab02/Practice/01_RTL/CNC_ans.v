//############################################################################
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//   (C) Copyright Laboratory System Integration and Silicon Implementation
//   All Right Reserved
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   ICLAB 2018 Fall
//   Lab02 Practice		: Complex Number Calculater
//   Author     		: Ping-Yuan Tsai (bubblegame@si2lab.org)
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   File Name   : CNC.v
//   Module Name : CNC
//   Release version : V1.0 (Release Date: 2018-09)
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//############################################################################

module CNC(
    //Input Port
    clk,
    rst_n,
    IN_VALID,
    MODE,
    IN,

    //Output Port
    OUT_VALID,
    OUT
    );

//---------------------------------------------------------------------
//   PORT DECLARATION
//---------------------------------------------------------------------
input           clk, rst_n, IN_VALID;
input   [ 1:0]  MODE;
input   [ 7:0]  IN;
output          OUT_VALID;
output  [16:0]  OUT;

//---------------------------------------------------------------------
//   PARAMETER DECLARATION
//---------------------------------------------------------------------
parameter s_idle = 3'd0; 
parameter s_input = 3'd1;
parameter s_add = 3'd2;
parameter s_sub = 3'd3;
parameter s_mul = 3'd4;
parameter s_output = 3'd6; 

//---------------------------------------------------------------------
//   WIRE AND REG DECLARATION
//---------------------------------------------------------------------
reg        OUT_VALID;
reg [16:0] OUT;

reg [2:0] current_state, next_state;
reg [1:0] cnt;

reg [1:0] MODE_r;
reg signed  [7:0] A, B, C, D;
reg signed [16:0] E, F;

wire       [16:0] ACC_OUT;
reg signed  [8:0] ACC_A, ACC_B;
reg signed [15:0] ACC_C;

//---------------------------------------------------------------------
//   RTL CODE
//---------------------------------------------------------------------

// FSM
always @(posedge clk) begin
    if(!rst_n)
        current_state <= s_idle;
    else
        current_state <= next_state;
end

always @(*) begin
    case(current_state)
    s_idle: if(IN_VALID) next_state = s_input;
            else         next_state = s_idle;
    s_input: if(cnt==2'd2)
                 case(MODE_r)
                 2'd0: next_state = s_add;
                 2'd1: next_state = s_sub;
                 2'd2: next_state = s_mul;
                 default: next_state = s_input;
                 endcase
             else
                 next_state = s_input;
    s_add:   if(cnt==2'd1) next_state = s_output;
             else next_state = s_add;
    s_sub:   if(cnt==2'd1) next_state = s_output;
             else next_state = s_sub;
    s_mul:   if(cnt==2'd3) next_state = s_output;
             else next_state = s_mul;
    s_output: if(cnt==2'd1) next_state = s_idle;
             else next_state = s_output; 
    default: next_state = current_state;
    endcase
end

always @(posedge clk) begin
    if(!rst_n)
        cnt <= 2'b0;
    else
    case(current_state)
    s_idle: cnt <= 2'b0;
    s_input: if(cnt==2'd2) cnt <= 2'b0;
             else cnt <= cnt+1'b1;
    s_add:   if(cnt==2'd1) cnt <= 2'b0;
             else cnt <= cnt+1'b1;
    s_sub:   if(cnt==2'd1) cnt <= 2'b0;
             else cnt <= cnt+1'b1;
    s_mul:   if(cnt==2'd3) cnt <= 2'b0;
             else cnt <= cnt+1'b1;
    s_output: if(cnt==2'd1) cnt <= 2'b0;
             else cnt <= cnt+1'b1;
    default: cnt <= cnt;
    endcase
end

// STORE INPUT
always @(posedge clk) begin
    if(!rst_n)
        MODE_r <= 2'b0;
    else
    case(current_state)
    s_idle: if(IN_VALID) MODE_r <= MODE;
    default: MODE_r <= MODE_r;
    endcase
end
always @(posedge clk) begin
    if(!rst_n)begin
        A <= 8'b0;
        B <= 8'b0;
        C <= 8'b0;
        D <= 8'b0; 
    end   
    else
    case(current_state)
    s_idle: if(IN_VALID)begin
                D <= IN;
                C <= D;
                B <= C;
                A <= B;
            end
    s_input:if(IN_VALID)begin
                D <= IN;
                C <= D;
                B <= C;
                A <= B;
            end
    default: A <= A;
    endcase
end
/////////// First Part: Store B, C, D ///////////
//Store values into registers B, C, and D
//You can use counter to help or use shift register


// ACCUMULATOR
assign ACC_OUT = ACC_C + ACC_A * ACC_B;

/////////// Second Part: Control Accumulator ///////////
//Finish subtraction and multiplication part
//E and F can store template or final value

always @(*) begin
    case(current_state)
    s_add: if(cnt==2'b0) ACC_C = A; else ACC_C = B;
    s_sub: if(cnt==2'b0) ACC_C = A; else ACC_C = B;
    s_mul: ACC_C = 0;
    default: ACC_C = 8'b0;
    endcase
end
always @(*) begin
    case(current_state)
    s_add: if(cnt==2'b0) ACC_A = C; else ACC_A = D;
    s_sub: if(cnt==2'b0) ACC_A = -C; else ACC_A = -D;
    s_mul: if(cnt==2'b0) ACC_A = A; else if(cnt==2'b1) ACC_A = B; else if(cnt==2'd2) ACC_A = A; else if(cnt==2'd3) ACC_A = B;
    default: ACC_A = 8'b0;
    endcase
end
always @(*) begin
    case(current_state)
    s_add: ACC_B = 8'b1;
    s_sub: ACC_B = 8'b1;
    s_mul: if(cnt==2'b0) ACC_B = C; else if(cnt==2'b1) ACC_B = -D; else if(cnt==2'd2) ACC_B = D; else if(cnt==2'd3) ACC_B = C;
    default: ACC_B = 8'b0;
    endcase
end


always @(posedge clk) begin
    if(!rst_n)
        E <= 17'b0;
    else
    case(current_state)
    s_add: if(cnt==2'b0) E <= ACC_OUT; else E <= E;
    s_sub: if(cnt==2'b0) E <= ACC_OUT; else E <= E;
    s_mul: if(cnt==2'b0) E <= ACC_OUT; else if(cnt==2'b1) E <= E + ACC_OUT;
    default: E <= E;
    endcase
end
always @(posedge clk) begin
    if(!rst_n)
        F <= 17'b0;
    else
    case(current_state)
    s_add: if(cnt==2'b1) F <= ACC_OUT; else F <= F;
    s_sub: if(cnt==2'b1) F <= ACC_OUT; else F <= F;
    s_mul: if(cnt==2'd2) F <= ACC_OUT; else if(cnt==2'd3) F <= F + ACC_OUT;
    default: F <= F;
    endcase
end

// OUTPUT
always @(posedge clk) begin
    if(!rst_n)
        OUT_VALID <= 1'b0;
    else
    case(current_state)
    s_output: OUT_VALID <= 1'b1;
    default: OUT_VALID <= 1'b0;
    endcase
end
always @(posedge clk) begin
    if(!rst_n)
        OUT <= 17'b0;
    else
    case(current_state)
    s_output: if(cnt==2'b00) OUT <= E; else OUT <= F;
    default: OUT <= 17'b0;
    endcase
end

endmodule
