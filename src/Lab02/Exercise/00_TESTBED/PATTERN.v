`define CYCLE_TIME 6 //cycle
`define PAT_NUM 200 

module PATTERN(
    //Input Port
    clk,
    rst_n,

	in_valid,
    col,
    row,

    in_valid_num,
    in_num,

    out_valid,
    out,
    );

/* Input to design */
output reg   clk, rst_n, in_valid,in_valid_num;
output reg   [3:0]   col,row;
output reg   [2:0]   in_num;


/* Output to pattern */
input         out_valid;
input [3:0]   out;

integer i,j,k,l,f,g,h,u;
//random_gen state
integer x_random;
integer y_random;
integer check;
integer check_n;
integer [3:0] x [11:0];
integer [3:0] y [11:0];
integer max_latency;
//random_gen_calculate state
integer min;
integer max;
integer [11:0] array_use;
integer [11:0] array [11:0];
integer [11:0] array_look_back [11:0];

//global
integer latency;
integer total_cycle;
integer total_latency;
integer i_pat;
integer patnum = `PAT_NUM;
integer random_number;

integer answer_count;
/* define clock cycle */
real CYCLE = `CYCLE_TIME;
always #(CYCLE/2.0) clk = ~clk;

integer correct;
integer fp_w;
integer fp_w1;
initial begin
  fp_w  = $fopen("input.txt" , "r");
  fp_w1 = $fopen("output.txt", "r");
  max_latency = 0;
  reset_task;//spec3 spec4
  total_cycle = 0;
  	for (i_pat = 0; i_pat < patnum; i_pat = i_pat + 1)begin
		input_task;
		// compute_ans_task;
        wait_out_valid_task;
		for (answer_count = 0; answer_count < 12; answer_count = answer_count + 1)begin        
	        if (out_valid === 1) begin
		        check_ans_task;
	        end
	        else if (out_valid !== 1) begin
	        	$display ("--------------------------------------------------------------------");
    			$display ("                  out_valid should be high for 12 cycle             ");
    			$display ("--------------------------------------------------------------------");  
	        	$finish;
	        end
	       	@(negedge clk);
	    end
	    if(out_valid !== 1'b0 || out !=='b0) begin //out!==0
	        $display("************************************************************");  
	        $display("                          FAIL!                             ");    
	        $display("*  out_valid should be high over 12 cycle                   ");
	        $display("************************************************************");
	        repeat(2) #CYCLE;
	        $finish;
	    end
    end
    $fclose(fp_w);
    $fclose(fp_w1);
  	YOU_PASS_task;
end

task reset_task; begin 
    rst_n = 'b1;
    in_valid = 'b0;
    in_valid_num = 'b0;
    col = 'bx;
    row = 'bx;
    total_latency = 0;
    force clk = 0;
    #CYCLE; rst_n = 0; 
    #CYCLE; rst_n = 1;
    if(out_valid !== 1'b0 || out !=='b0) begin //out!==0
        $display("************************************************************");  
        $display("                          FAIL!                              ");    
        $display("*  Output signal should be 0 after initial RESET  at %8t   *",$time);
        $display("************************************************************");
        repeat(2) #CYCLE;
        $finish;
    end
	#CYCLE; release clk;
end endtask

integer t;
task input_task; begin
    t = $urandom_range(1, 4);
    for(i = 0; i < t; i = i + 1)begin
    	if(out_valid !== 1'b0 || out !=='b0) begin //out!==0
    	    $display("************************************************************");  
    	    $display("                          FAIL!                              ");    
    	    $display("*  Output signal should be 0 after initial RESET  at %8t   *",$time);
    	    $display("************************************************************");
    	    repeat(2) #CYCLE;
    	    $finish;
    	end    	
		@(negedge clk);
	end
	$fscanf(fp_w, "%d\n",random_number);
	for(i = 0; i < random_number; i = i + 1)begin
		in_valid = 1'b1;
		if(i === 0)begin
			in_valid_num = 1'b1;
			in_num = random_number;
		end
		else begin
			in_valid_num = 1'b0;	
			in_num = 'bx;
		end
		$fscanf(fp_w, "%d %d\n",x[i],y[i]);
		col = x[i];
		row = y[i];
	    @(negedge clk);
	end

	in_valid_num = 1'b0;	
    in_valid = 1'b0;
	col = 'bx;
    row = 'bx;
end endtask 

task wait_out_valid_task; begin
    latency = 0;
    while(out_valid !== 1'b1) begin
	latency = latency + 1;
      if( latency == 100000) begin
          $display("********************************************************");     
          $display("                          FAIL!                              ");
          $display("*  The execution latency are over 100000 cycles  at %8t   *",$time);//over max
          $display("********************************************************");
		  $display("array: %b", array[0]);
		  $display("array: %b", array[1]);		
		  $display("array: %b", array[2]);		
		  $display("array: %b", array[3]);		
		  $display("array: %b", array[4]);		
		  $display("array: %b", array[5]);		
		  $display("array: %b", array[6]);		
		  $display("array: %b", array[7]);		
		  $display("array: %b", array[8]);		
		  $display("array: %b", array[9]);		
		  $display("array: %b", array[10]);	
		  $display("array: %b", array[11]);	
	    repeat(2)@(negedge clk);
	    $finish;
      end
     @(negedge clk);
   end
   total_latency = total_latency + latency;
end endtask
integer golden_out;
task check_ans_task; begin
	$fscanf(fp_w1, "%d\n", golden_out);
    if(out !== golden_out) begin
        $display ("------------------------------------------------------------------------------------------------------------------------------------------");
        $display ("                                                                      FAIL!                                                               ");
        $display ("                                                                 Your out :            %d                              ", out); //show output
        $display ("------------------------------------------------------------------------------------------------------------------------------------------");
        repeat(9) @(negedge clk);
        $finish;
    end
    else begin
		 // $display("out: %d", out);	    	
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

always @(*) begin
	if(latency > max_latency) begin
		max_latency = latency;
	end 
end


endmodule
