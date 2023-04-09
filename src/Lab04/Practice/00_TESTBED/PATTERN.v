`ifdef RTL
	`timescale 1ns/10ps
	`include "VIP.v"  
	`define CYCLE_TIME 10.0
`endif
`ifdef GATE
	`timescale 1ns/1ps
	`include "VIP_SYN.v"
	`define CYCLE_TIME 10.0
`endif


//synopsys translate_off
`include "/RAID2/cad/synopsys/synthesis/2022.03/dw/sim_ver/DW_fp_add.v"
`include "/RAID2/cad/synopsys/synthesis/2022.03/dw/sim_ver/DW_fp_addsub.v"
`include "/RAID2/cad/synopsys/synthesis/2022.03/dw/sim_ver/DW_fp_mult.v"
//synopsys translate_on


module PATTERN(
	// Output signals
	clk,
	rst_n,
	in_valid,
	vector_1,
	vector_2,
	// Input signals
	out_valid,
	out
);
//---------------------------------------------------------------------
//   PARAMETER
//---------------------------------------------------------------------
parameter inst_sig_width = 23;
parameter inst_exp_width = 8;
parameter inst_ieee_compliance = 0;
parameter inst_arch = 2;
parameter PATNUM = 100;

//================================================================
//   INPUT AND OUTPUT DECLARATION                         
//================================================================
output reg clk, rst_n, in_valid;
output reg [inst_sig_width+inst_exp_width:0] vector_1, vector_2;
input	out_valid;
input	[inst_sig_width+inst_exp_width:0] out;

//================================================================
// parameters & integer
//================================================================
real CYCLE = `CYCLE_TIME;
real delay_time = 1;
integer i, j, patcount, wait_val_time, total_latency;
integer vector_1_store[1:0], vector_2_store[1:0], ans;
real sign, exp, mantissa, result;

//================================================================
// REG & WIRE
//================================================================
reg  [inst_sig_width+inst_exp_width:0] mult_a, mult_b, add_a, add_b;
wire  [inst_sig_width+inst_exp_width:0] mult_out, add_out;
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
DW_fp_mult #(inst_sig_width, inst_exp_width, inst_ieee_compliance) M0 (.a(mult_a), .b(mult_b), .rnd(3'b000), .z(mult_out));
DW_fp_add #(inst_sig_width, inst_exp_width, inst_ieee_compliance) A0 (.a(add_a), .b(add_b), .rnd(3'b000), .z(add_out));

initial 
begin
	
	rst_n = 1'b1;
	in_valid = 1'b0;
	
	force clk = 0;
	reset_signal_task;
	
	for(patcount=1; patcount<=PATNUM; patcount=patcount+1) 
	begin
		input_data_task;
		calculate_ans;
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
  #(0.5);	rst_n=0;
  #(CYCLE/2);
  if((out_valid !== 0)||(out !== 0)) 
  begin
    $display("**************************************************************");
    $display("*   Output signal should be 0 after initial RESET at %4t     *",$time);
    $display("**************************************************************");
    $finish;
  end
  #(10);	rst_n=1;
  #(3);		release clk;
end 
endtask

task input_data_task;
begin
	repeat(2)@(negedge clk);
	in_valid = 1'b1;
	
	for(i=0;i<2;i=i+1)
	begin
		vector_1 = $random();
		vector_1_store[i] = vector_1;
		vector_2 = $random();
		vector_2_store[i] = vector_2;
		@(negedge clk);
	end
	in_valid = 1'b0;
	vector_1 = 32'bx;
	vector_2 = 32'bx;
end
endtask

task calculate_ans;
begin
	add_a = 0;
	mult_a = vector_1_store[0];
	mult_b = vector_2_store[0];
	#delay_time;
	add_a = 0;
	add_b = mult_out;
	#delay_time
	ans = add_out;
	
	mult_a = vector_1_store[1];
	mult_b = vector_2_store[1];
	#delay_time
	add_a = ans;
	add_b = mult_out;
	#delay_time
	ans = add_out;
end
endtask


task wait_out_valid;
begin
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
end
endtask

task check_ans;
begin
	if(out!==ans) 
	begin
		$display ("--------------------------------------------------------------------");
		$display ("                     PATTERN #%d  FAILED!!!                         ",patcount);
		$display ("                      Ans: %h, Yours: %h                            ",ans, out);		
		$display ("--------------------------------------------------------------------");
		repeat(2) @(negedge clk);		
		$finish;
    end
	$display("\033[0;34mPASS PATTERN NO.%4d,\033[m \033[0;32mexecution cycle : %3d\033[m",patcount ,wait_val_time);
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
