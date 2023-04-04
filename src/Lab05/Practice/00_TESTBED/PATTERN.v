`ifdef RTL
	`define CYCLE_TIME 5.0  
`endif
`ifdef GATE
	`define CYCLE_TIME 5.0
`endif

module PATTERN(
//io
		clk,
		rst_n,
		in_valid,
		in_data,
		action,
		out_valid,
		out_data
);
//io
output	reg	clk,rst_n,in_valid;
output	reg	[7:0]in_data;
output	reg	action;

input	out_valid;
input	[7:0]out_data;
//varible
real	CYCLE = `CYCLE_TIME;
parameter PATNUM = 1000;                 
integer SEED = 123;
integer patcount;
integer pat_delay;
integer x,i,lat,total_latency;
integer len,d[0:9],act;

//---------------------------------------------------------------------
//   CLOCK GENERATION
//---------------------------------------------------------------------
initial begin
        clk = 0;
end
always #(CYCLE/2.0) clk = ~clk;


//---------------------------------------------------------------------
//   MAin FLOW
//---------------------------------------------------------------------

initial begin
	rst_n = 1'b1;
	in_valid = 1'b0;
	in_data = 'bx;
	action = 'bx;
	force clk = 0;

 	total_latency = 0;
 	reset_signal_task;

	for(patcount=1; patcount<=PATNUM; patcount=patcount+1) begin
		input_task;
		wait_OUT_VALID;
		check_ans;
	end
  	YOU_PASS_task;


end

//================================================================
// task
//================================================================
task reset_signal_task; begin 
  #(0.5);  rst_n=0;
  #(CYCLE/2);
  if((out_valid !== 0)||(out_data !== 0)) begin
    $display("************************************************************");
    $display("*                       ICLAB_FAIL                         *");
    $display("*   Output signal should be 0 after initial RESET at %t    *",$time);
    $display("************************************************************");
    $finish;
  end
  #(10);  rst_n=1;
  #(3);  release clk;
end endtask

task input_task; begin
	repeat(2)@(negedge clk);
	in_valid = 1;
	len = $urandom(SEED)%10+1;

	action = $random(SEED) %2;
	act = action;
	for(i=0;i<len;i=i+1)begin
		in_data = $random(SEED) %256;
		d[i] = in_data;
		@(negedge clk);
		action = 'bx;
	end

	in_valid = 1'b0;
	in_data = 'bx;
end endtask

task wait_OUT_VALID; begin
  lat = -1;
  while(out_valid !== 1) begin
	lat = lat + 1;
	if(lat == 6) begin//wait limit
		$display("***************************************************************");
		$display("*     		    ICLAB_FAIL      							*");
		$display("*         The execution latency are over 5 cycles.          *");
		$display("***************************************************************");
		repeat(2)@(negedge clk);
		$finish;
	end
	@(negedge clk);
  end
  total_latency = total_latency + lat;
end endtask

task check_ans; begin
  x = 0;
  while(out_valid) begin
    if(x>=len) begin//out length
      $display ("--------------------------------------------------------------------------------------------------------------------------------------------");
      $display ("                                                                  ICLAB_FAIL!                                                               ");
      $display ("                                                           Outvalid is more than out cycles                                                 ");
      $display ("--------------------------------------------------------------------------------------------------------------------------------------------");
      repeat(2) @(negedge clk);
      $finish;
    end
    if(act===0&&d[x]!==out_data||act===1&&d[len-1-x]!==out_data)begin//ans check
      $display ("--------------------------------------------------------------------");
      $display ("                     PATTERN #%d  FAILED!!!                         ",patcount);
      $display ("                      ANS: %d, Yours: %d                            ",act==0 ? d[x] : d[len-1-x], out_data);		
      $display ("            Error !!                                                ");
      $display ("--------------------------------------------------------------------");
      repeat(2) @(negedge clk);		
      $finish;
    end
    @(negedge clk);	
    x=x+1;
  end
  if(x<len) begin//out length
    $display ("--------------------------------------------------------------------------------------------------------------------------------------------");
    $display ("                                                                  ICLAB_FAIL!                                                               ");
    $display ("                                                           Outvalid is less than out cycles                                                   ");
    $display ("--------------------------------------------------------------------------------------------------------------------------------------------");
    repeat(2) @(negedge clk);
    $finish;
  end
  $display("\033[0;34mPASS PATTERN NO.%4d,\033[m \033[0;32mexecution cycle : %3d\033[m",patcount ,lat);
  pat_delay=($random(SEED)%'d5)+1; //(1~5)
  repeat(pat_delay)@(negedge clk);

end endtask

task YOU_PASS_task; begin
  $display ("--------------------------------------------------------------------");
  $display ("          ~(￣▽￣)~(＿△＿)~(￣▽￣)~(＿△＿)~(￣▽￣)~           			 ");
  $display ("                         Congratulations!                           ");
  $display ("                  You have passed all patterns!                     ");
  $display ("--------------------------------------------------------------------");        
     
#(500);
$finish;



end endtask

endmodule

