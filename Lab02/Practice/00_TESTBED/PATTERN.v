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
//   File Name   : PATTERN.v
//   Module Name : PATTERN
//   Release version : V1.0 (Release Date: 2018-09)
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//############################################################################

`define CYCLE_TIME      6.0
`define SEED_NUMBER     321
`define PATTERN_NUMBER 1000

module PATTERN(
    //Output Port
    clk,
    rst_n,
    IN_VALID,
    MODE,
    IN,

    //Input Port
    OUT_VALID,
    OUT
    );

//---------------------------------------------------------------------
//   PORT DECLARATION          
//---------------------------------------------------------------------
output          clk, rst_n, IN_VALID;
output  [ 1:0]  MODE;
output  [ 7:0]  IN;
input           OUT_VALID;
input   [16:0]  OUT;

//---------------------------------------------------------------------
//   PARAMETER & INTEGER DECLARATION
//---------------------------------------------------------------------
integer SEED = `SEED_NUMBER;
real    CYCLE = `CYCLE_TIME;
integer i, p, x, lat;

//---------------------------------------------------------------------
//   WIRE & REGISTER DECLARATION
//---------------------------------------------------------------------
reg          clk, rst_n, IN_VALID;
reg  [ 1:0]  MODE;
reg  [ 7:0]  IN;

reg [1:0] t;
reg signed  [7:0] a, b, c, d;
reg signed [16:0] e, f;
reg [1:0] m;

reg signed [16:0] Y_OUT, C_OUT, your_e, your_f;

//---------------------------------------------------------------------
//   CLOCK
//---------------------------------------------------------------------
initial clk = 0;
always #(CYCLE/2.0) clk = ~clk;

//---------------------------------------------------------------------
//   TEST PATTERN                                         
//---------------------------------------------------------------------
initial
begin
    rst_n=1'b1;
    clk=0;
    IN_VALID = 1'b0;
    MODE = 2'bxx;
    IN = 8'hXX;

    reset_signal_task;
	
    for (p=0; p<`PATTERN_NUMBER; p=p+1)
    begin
        input_task;
        wait_OUT_VALID;
        check_ans;
    end
    YOU_PASS_task;
end

task reset_signal_task; begin 
    @(negedge clk); rst_n = 0; 
    @(negedge clk); rst_n = 1;
    if(OUT_VALID!==1'b0) begin
        $display("*****************************************************");
        $display("*     OUT_VALID should be 0 after initial RESET     *");
        $display("*****************************************************");
	repeat(2) @(negedge clk);
	$finish;
    end
end endtask

task input_task; begin

    // random delay between patterns
    t=$random(SEED)%2'd3+1; // 1~3 cycles
    repeat(t)
        @(negedge clk);

    // generating input
    a=$random(SEED);
    b=$random(SEED);
    c=$random(SEED);
    d=$random(SEED);

    if(p<3)
        m=p;
    else
        m=$random(SEED)%2'd3;

    // calculate correct answer
    case(m)
    2'd0: begin e=a+c; f=b+d; end
    2'd1: begin e=a-c; f=b-d; end
    2'd2: begin e=a*c-b*d; f=a*d+b*c; end
    endcase
    
    // sending out input
    IN_VALID = 1'b1;
    IN = a;
    MODE = m;
    @(negedge clk);
    IN = b;
    MODE = 2'bxx;   
    @(negedge clk);
    IN = c; 
    @(negedge clk);
    IN = d;
    @(negedge clk);
    IN_VALID = 1'b0;
    IN = 8'hXX;
  
end endtask

task check_ans; begin
    x=1;
    while(OUT_VALID===1'b1) begin
        if(x==1) begin
            C_OUT = e; Y_OUT = OUT; your_e = OUT;
        end
        else if(x==2) begin
            C_OUT = f; Y_OUT = OUT; your_f = OUT;
        end
        else if(x>=3) begin
            $display ("---------------------------------------------------");
            $display ("          Outvalid is more than 2 cycles.          ");
            $display ("---------------------------------------------------");
            repeat(2) @(negedge clk);
            $finish;
        end
        @(negedge clk);	
        x=x+1;
    end

    if(x<3) begin
        $display ("---------------------------------------------------");
        $display ("          Outvalid is less than 2 cycles.          ");
        $display ("---------------------------------------------------");
        repeat(2) @(negedge clk);
        $finish;
    end
    else if(your_e!==e || your_f!==f) begin
        $display ("---------------------------------------------------");
        $display ("                  Output Error.                    ");
        $display ("          Correct answer = %5d + %5di            ",e,f);
        $display ("             Your answer = %5d + %5di            ",your_e,your_f);
        $display ("---------------------------------------------------");
        repeat(2) @(negedge clk);
        $finish;    
    end

    $display("\033[0;34mPASS PATTERN NO.%4d,\033[m \033[0;32m Latency: %3d\033[m",p ,lat);
end endtask

task wait_OUT_VALID; begin
    lat=-1;
    while(OUT_VALID!==1) begin
	lat=lat+1;
	if(lat==101)begin
            $display ("---------------------------------------------------");
            $display ("    The execution latency are over 100 cycles.     ");
            $display ("---------------------------------------------------");
	    repeat(2)@(negedge clk);
	    $finish;
	end
	@(negedge clk);
    end
end endtask

task YOU_PASS_task; begin
    $display ("--------------------------------------------------------------------");
    $display ("                         Congratulations!                           ");
    $display ("                  You have passed all patterns!                     ");
    $display ("--------------------------------------------------------------------");        
    repeat(2)@(negedge clk);
    $finish;
end endtask

endmodule


