//############################################################################
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//   (C) Copyright Laboratory System Integration and Silicon Implementation
//   All Right Reserved
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   2018 ICLAB fall Course
//   Lab03	    : Vector Reverse Ordering
//   Author         : Yi Syuan Chen
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   File Name   : TESTBED.v
//   Module Name : TESTBED
//   Release version : v1.0
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//############################################################################


`ifdef RTL
	`timescale 1ns/10ps
	`include "VRO.v"  
	`define CYCLE_TIME 5.0  
`endif
`ifdef GATE
	`timescale 1ns/1ps
	`include "VRO_SYN.v"
	`define CYCLE_TIME 5.0
`endif

module PATTERN(
  // Output signals
  clk, 
  rst_n, 
  in_valid, 
  in, 
  // input signals
  out_valid,
  out
);

//================================================================
//   INPUT AND OUTPUT DECLARATION                         
//================================================================
output reg clk, rst_n, in_valid;
output reg [2:0] in;
input out_valid;
input [2:0] out;

//================================================================
// parameters & integer
//================================================================
real CYCLE = `CYCLE_TIME;
parameter PATNUM = 100;
parameter LEN = 6;
integer SEED = 123;
integer patcount = 1, total_latency, wait_val_time, col, walk_num, walker;
integer i, out_val_clk_times, x;
integer in_read,in_hold,out_read,out_hold;

//================================================================
// wire & registers 
//================================================================
reg [2:0] ans [LEN-1:0];

//================================================================
// clock
//================================================================
initial 
begin
	clk = 0;
end
always #(CYCLE/2.0) clk = ~clk;

//================================================================
// initial
//================================================================
initial 
begin

	//+++++++++++++++++++++++++++++++++++++++++++++++++++
	// Read file here (two statements)
	in_read = $fopen("../00_TESTBED/in.txt", "r");
	out_read = $fopen("../00_TESTBED/out.txt", "r");
	//+++++++++++++++++++++++++++++++++++++++++++++++++++

	rst_n = 1'b1;
	in_valid = 1'b0;
	in = 3'bx;
	force clk = 0;
 	total_latency = 0;
 	
	reset_signal_task;
	
	for(patcount=1; patcount<=PATNUM; patcount=patcount+1) 
	begin
		input_task;
		wait_out_valid;
		check_ans;
	end	
  	YOU_PASS_task;
end

//================================================================
// task
//================================================================
task reset_signal_task; 
begin 
  #(0.5);  rst_n=0;
  #(2.0);
  if((out_valid !== 0)||(out !== 0)) 
  begin
    $display("**************************************************************");
    $display("*   Output signal should be 0 after initial RESET at %4t     *",$time);
    $display("**************************************************************");
    $finish;
  end
  #(10);  rst_n=1;
  #(3);  release clk;
end 
endtask

task input_task; 
begin

	// Inputs start from second negtive edge after the begining of clock
	if(patcount=='d1)
		repeat(2)@(negedge clk);

	// Set in_valid and input the data
	in_valid = 1'b1;
	for(i=0; i<LEN; i=i+1)
	begin
		//+++++++++++++++++++++++++++++++++++++++++++++++++++
		// Read input(in) and answer(ans) here (two statement)
		in_hold = $fscanf(in_read,"%d",in);
		out_hold = $fscanf(out_read,"%d",ans[i]);
		//+++++++++++++++++++++++++++++++++++++++++++++++++++ 
		@(negedge clk);
	end

	// Disable input
	in_valid = 1'b0;
	in = 3'bx;
end
endtask

task wait_out_valid; begin
  wait_val_time = -1;
  while(out_valid !== 1) begin
	wait_val_time = wait_val_time + 1;
	if(wait_val_time == 30)
	begin
		$display("***************************************************************");
		$display("*         The execution latency are over 30 cycles.           *");
		$display("***************************************************************");
		repeat(2)@(negedge clk);
		$finish;
	end
	@(negedge clk);
  end
  total_latency = total_latency + wait_val_time;
end endtask



task check_ans; 
begin
  
  //++++++++++++++++++++++++++++++++++++++++++++++++
  // Check the answer here
  x=0;
  while(out_valid)
	begin
		if(x>5)//x>max-1
			begin
				$display ("--------------------------------");
				$display (" Outvalid is more than 1 cycles ");//than max
				$display ("--------------------------------");
				repeat(9) @(negedge clk);
				$finish;
			end		
		if(ans[x]!==out)//complete the if statement here
				begin
					$display ("------------------------------------");
					$display ("          ANWSER IS WRONG!          ");
					$display ("          Ans:%d                                                   ",ans[x]);//show ans
					$display (" Your output : %d  at %8t                          		      ",out,$time);//show output
					$display ("------------------------------------");
					repeat(9) @(negedge clk);
					$finish;
				end
		@(negedge clk);	
		x=x+1;
	end	
  //+++++++++++++++++++++++++++++++++++++++++++++++

  
  $display("\033[0;34mPASS PATTERN NO.%4d,\033[m \033[0;32mexecution cycle : %3d\033[m",patcount ,wait_val_time);
  repeat(3)@(negedge clk);
end 
endtask


task YOU_PASS_task; 
begin
  $display ("--------------------------------------------------------------------");
  $display ("          ~(￣▽￣)~(＿△＿)~(￣▽￣)~(＿△＿)~(￣▽￣)~            ");
  $display ("                         Congratulations!                           ");
  $display ("                  You have passed all patterns!                     ");
  $display ("--------------------------------------------------------------------");        
     
#(500);
$finish;
end
endtask

endmodule
