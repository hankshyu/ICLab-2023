`define CYCLE_TIME 20

module PATTERN(
	// Output signals
	clk,
	rst_n,
	in_valid_1,
	in_image,
	in_valid_2,
	in_mode,
	cg_en,
	// Input signals
	out_valid,
	out_number
);


output reg clk;
output reg rst_n;
output reg in_valid_1, in_valid_2;
output reg [7:0] in_image;
output reg [1:0] in_mode;
output reg cg_en;

input out_valid;
input signed [11:0] out_number;

//================================================================
// parameters & integer
//================================================================
real CYCLE = `CYCLE_TIME;
integer SEED=125, x, lat, t, p, m, i, j, mode;
integer f_in, f_ans;
integer in;
integer action_number;
parameter patnumber = 50;


//================================================================
// wire & registers 
//================================================================
reg signed [11:0] out_golden;


//================================================================
// clock
//================================================================
always	#(CYCLE/2.0) clk = ~clk;
initial	clk = 0;


//================================================================
// task
//================================================================
initial begin
	f_in = $fopen("../00_TESTBED/in.txt", "r");
	f_ans = $fopen("../00_TESTBED/ans.txt", "r");

	rst_n = 1'b1;
	in_valid_1 = 1'b0;
	in_valid_2 = 1'b0;
	cg_en    = 1'b1;//  clock gated
	
	in_image = 'bx;
	in_mode = 'bx;

	force clk = 0;
	reset_signal_task;
	in = $fscanf(f_in, "%d", mode);
	for(p = 0; p < patnumber; p = p + 1) begin
		m = 0;
		input_img;
		in = $fscanf(f_in, "%d", mode);
		while(mode !== 3) begin
			input_mode;
			wait_out_valid;
			check_ans;
			m = m + 1;
			in = $fscanf(f_in, "%d", mode);
		end
	end
	YOU_PASS_task;
end

task reset_signal_task; begin 
    #CYCLE; rst_n = 0; 
	#CYCLE; rst_n = 1;
    if(out_valid !== 1'b0 || out_number !== 'd0) begin
        $display("************************************************************");
        $display("*  Output signal should be 0 after initial RESET  at %8t   *", $time);
        $display("************************************************************");
        repeat(2) #CYCLE;
        $finish;
    end
	#CYCLE; release clk;
end endtask

task input_img; begin
	repeat(2) @(negedge clk);
	in_valid_1 = 1'd1;
	in_valid_2 = 1'd0;
	for(i = 0; i < 64; i = i + 1) begin
		in = $fscanf(f_in, "%d", in_image);
		@(negedge clk);
	end
	in_valid_1 = 1'd0;
	in_valid_2 = 1'd0;
	in_image = 'bx;
end endtask

task input_mode; begin
	in_valid_1 = 1'd0;
	in_valid_2 = 1'd1;
	in_mode = mode;
	@(negedge clk);
	in_valid_1 = 1'd0;
	in_valid_2 = 1'd0;
	in_mode = 'bx;
end endtask

task wait_out_valid; begin
    lat = -1;
    while(out_valid !== 1) begin
		lat = lat + 1;
      	if(lat == 1500) begin
          	$display("************************************************************");
          	$display("*    The execution latency are over 1500 cycles  at %8t    *", $time);//over max
          	$display("************************************************************");
	    	repeat(2)@(negedge clk);
	    	$finish;
      	end
     	@(negedge clk);
   	end
end endtask

task check_ans; begin
	x=1;
	while(out_valid) begin
		if(x > 64) begin
			$display ("************************************************************");
			$display ("*          Outvalid is more than 64 cycles at %8t          *", $time);
			$display ("************************************************************");
			repeat(9) @(negedge clk);
			$finish;
		end		
		in = $fscanf(f_ans, "%d", out_golden);
		if(out_number !== out_golden) begin
			$display ("************************************************************");
			$display ("*                          Ans: %d                         *", out_golden);
			$display ("*                  Your output: %d at %8t                  *", out_number, $time);
			$display ("************************************************************");
			repeat(9) @(negedge clk);
			$finish;
		end
		@(negedge clk);	
		x=x+1;
	end		
	$display("\033[0;34mPASS PATTERN NO.%4d, COMMAND NO.%4d\033[m \033[0;32mexecution cycle : %3d\033[m", p + 1, m + 1, lat);
	@(negedge clk);
end endtask


task YOU_PASS_task; begin      
    $display ("--------------------------------------------------------------------");
    $display ("                         Congratulations!                           ");
    $display ("                You have passed all \033[0;32m%3d\33[0;37m patterns!                   ", patnumber);
    $display ("--------------------------------------------------------------------");        
    repeat(2)@(negedge clk);
    $finish;
end endtask

endmodule
