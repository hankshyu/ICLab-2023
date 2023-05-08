`ifdef RTL
`define CYCLE_TIME 20
`endif
`ifdef GATE
`define CYCLE_TIME 20
`endif

module PATTERN(
   /* clk,
    rst_n,
    in_valid,
    coord_x,
    coord_y,
    mode,
    out_valid,
    result*/
	clk,
    rst_n,
    in_valid,
    in_length,
    out_cos,
    out_valid,
    out_tri
	
);

output reg clk, rst_n, in_valid;
output reg [7:0] in_length;
input wire out_valid;
input wire signed [15:0] out_cos;
input wire [1:0] out_tri;

parameter PAT_NUM = 1000;
//parameter A_LENGTH = 1'b0;
//parameter A_COSINE = 1'b1;

integer SEED = 777;
integer p, i, l, c, f_in, f_out;

reg [7:0] pre_length [2:0];
//reg [4:0] point_x [2:0];
//reg [4:0] point_y [2:0];
//reg action;


real gold_length [2:0];
reg [1:0] gold_tri;
real gold_cosine [2:0];
real gold_result, gold_ans, err;

real max, mid, min, check;

real CYCLE = `CYCLE_TIME;
initial clk = 0;
always #(CYCLE / 2.0) clk = ~clk;

initial begin
	in_length = 'bx;
	in_valid = 'b0;
	rst_n = 'b1;
	gold_tri = 'd0;
	force clk = 0;

	reset_signal_task;
    repeat(10) @(negedge clk);	

	f_in = $fopen("../00_TESTBED/input.txt", "r");
	f_out = $fopen("../00_TESTBED/output.txt", "r");
   
    for (p = 0; p < PAT_NUM ; p = p + 1) begin
		load_pattern_task;
		input_task;

		wait_out_task;
		check_ans_task;
		repeat(1) @(negedge clk);
	end

	$fclose(f_in);
	$fclose(f_out);
	you_pass_task;
end

task reset_signal_task; begin 
    repeat(3) #(CYCLE);   
	rst_n = 'b0;
	repeat(3) #(CYCLE);  
	if ((out_valid !== 'b0) || (out_cos !== 'b0) || (out_tri !== 'b0)) begin
		$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
		$display ("                                                                        FAIL!                                                               ");
		$display ("                                                  Output signals should be 0 after initial RESET at %8t                                     ",$time);
		$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
		$finish;
	end
	repeat(10) #(CYCLE);
    rst_n = 'b1;
	repeat(3) #(CYCLE);
    release clk;
end endtask


task load_pattern_task; begin
	
	$fscanf(f_in, "%d %d %d \n",  pre_length[0], pre_length[1], pre_length[2]);
	$fscanf(f_out, "%f %f %f %d\n", gold_cosine[0], gold_cosine[1], gold_cosine[2] , gold_tri);




end endtask


task input_task; begin
    in_valid = 'b1;
	//action = $random(SEED);
	for (i = 0; i < 3; i = i + 1) begin
		in_length = pre_length[i];
		check_overlap_task;
		@(negedge clk);
	end
	in_valid = 'b0;
	in_length = 'bx;
	
end endtask

task check_overlap_task; begin
	if (out_valid == 'd1) begin
		$display ("----------------------------------------------------------------------------------------------------------------------");
		$display ("                                                  FAIL!                                                               ");
		$display ("                                           Out_valid overlaps with in_valid!                                          ");
		$display ("----------------------------------------------------------------------------------------------------------------------");
		$finish;
	end
end endtask

task wait_out_task; begin
	l = 0;
	while (out_valid == 'b0) begin
		if (l > 1000) begin
		    $display ("----------------------------------------------------------------------------------------------------------------------");
			$display ("                                                  FAIL!                                                               ");
			$display ("                                           latency over 1000 cycles!                                                  ");
			$display ("----------------------------------------------------------------------------------------------------------------------");
			$finish;
		end else begin
			l = l + 1;
			@(negedge clk);
		end
	end
end endtask

task check_ans_task; begin
	c = 0;
	while (out_valid == 'b1) begin
		if (c >= 3) begin
		    $display ("----------------------------------------------------------------------------------------------------------------------");
			$display ("                                                  FAIL!                                                               ");
			$display ("                                           Out_valid raised over 3 cycles!                                            ");
			$display ("----------------------------------------------------------------------------------------------------------------------");
			$finish;
		end else begin
			
			
			if (c==0)begin
				if (out_tri !== gold_tri) begin
					$display ("----------------------------------------------------------------------------------------------------------------------");
					$display ("                                                  FAIL!                                                               ");
					$display ("                                           Triangle type incorrect                                                     ");
					$display ("                                         Answer: %d, output %d                                                        ", gold_tri, out_tri);
					$display ("----------------------------------------------------------------------------------------------------------------------");
					$finish;
				end
			end
			
				gold_ans = gold_cosine[c];
				gold_result = out_cos / 8192.0;
				err = gold_ans - gold_result;
				//if ((err > 0.03125) || (err < -0.03125)) begin
				if ((err > 0.0048828) || (err < -0.0048828)) begin
					$display ("----------------------------------------------------------------------------------------------------------------------");
					$display ("                                                  FAIL!                                                               ");
					$display ("                                           Error is over 0.0048828!                                                     ");
					$display ("                                         Answer: %f, output %f                                                        ", gold_ans, gold_result);
					$display ("----------------------------------------------------------------------------------------------------------------------");
					$finish;
				end
			//end
			$display("err %f", err);
			c = c + 1;
			@(negedge clk);
		end
	end
	if (c < 3) begin
		$display ("----------------------------------------------------------------------------------------------------------------------");
		$display ("                                                  FAIL!                                                               ");
		$display ("                                           Out_valid raised under 3 cycles!                                           ");
		$display ("----------------------------------------------------------------------------------------------------------------------");
		$finish;
	end
	$display("\033[0;38;5;111mPASS PATTERN \033[4m NO.%3d \033[m, Triangle type: %2b ", p,gold_tri);
end endtask

task you_pass_task; begin
	$display ("*********************************");
	$display ("         Congratulation!         ");
	$display ("      You pass all patterns!     ");
	$display ("*********************************");
	$finish;
end endtask
    
endmodule
