`ifdef RTL
	`timescale 1ns/10ps
	`include "MMT.v"
	`define CYCLE_TIME 6.1
`endif
`ifdef GATE
	`timescale 1ns/10ps
	`include "MMT_SYN.v"
	`define CYCLE_TIME 6.1
`endif

//synopsys translate_off
`include "/RAID2/cad/synopsys/synthesis/2022.03/dw/sim_ver/DW02_prod_sum1.v"
//synopsys translate_on

module PATTERN(
// output signals
    clk,
    rst_n,
    in_valid,
	in_valid2,
    matrix,
	matrix_size,
    matrix_idx,
    mode,
// input signals
    out_valid,
    out_value
);
//================================================================
//   INPUT AND OUTPUT DECLARATION                         
//================================================================
output reg clk, rst_n;

output reg in_valid;
output reg [7:0] matrix;
output reg [1:0]  matrix_size;

output reg in_valid2;
output reg [4:0]  matrix_idx;
output reg [1:0]  mode;

input 				out_valid;
input signed [49:0] out_value;

//================================================================
//   parameters & integers
//================================================================
real	CYCLE = `CYCLE_TIME;
parameter PATNUM = 50;                 
integer SEED = 170917;
integer patcount;
integer questcnt;
integer pat_delay;

integer i,j,k,m,n;
integer idx,jdx,kdx;
integer x,lat,total_latency;

integer  lat_array [10-1 : 0];

parameter PRINT_MSG = 1;

reg [1 : 0] pool_size;
integer true_pool_size;
reg signed [8-1 : 0] pool [0 : 32-1][0 : 16-1][0 : 16-1];

reg signed [20-1 : 0] tmp_arr[0 : 16-1][0 : 16-1]; //8+8+4 bits

reg [4 : 0] mx_idx [0 : 10-1][0 : 3-1];
reg [1 : 0] mx_mode [0 : 10-1];
reg signed [49 : 0] golden_answer [0 : 10-1];


//---------------------------------------------------------------------
//   CLOCK GENERATION
//---------------------------------------------------------------------
initial clk = 0;
always #(CYCLE/2.0) clk = ~clk;

//---------------------------------------------------------------------
//   Main Program
//---------------------------------------------------------------------

initial begin
	rst_n = 1'b1;
	in_valid = 1'b0;
    matrix = 'bx;
    matrix_size = 'bx;
	
    in_valid2 = 1'b0;
    matrix_idx = 'bx;
    mode = 'bx;
	
    force clk = 0;

 	reset_signal_task; //This would release clk

	for(patcount=1; patcount<=PATNUM; patcount=patcount+1) begin
        total_latency =  0;
        calculate_answer;
        // $display("Executing Pattern(patcount) = %d",patcount);
        @(negedge clk);
        input_pool_task;
        
        // invalid2 would be triggered 1~3 cycles after
        pat_delay=($random(SEED) % 'd3)+1; //(1 ~ 3)
        repeat(pat_delay)@(negedge clk);
        
        for(questcnt = 0; questcnt < 10; questcnt = questcnt+1)begin
		    input_quest_task;
            // display_ans;
            
		    wait_OUT_VALID;
            check_ans; // there is a default clk delay
            

            $write("Pass quest %d\n",questcnt);
            pat_delay=($random(SEED) % 'd2)+1; //(1 ~ 2)
            repeat(pat_delay)@(negedge clk);

            @(negedge clk); // invalid would be triggered 1~3 cycles after
        end

        $display("\033[0;34mPASS PATTERN NO.%4d,\033[m \033[0;32mexecution cycles : %3d\033[m",patcount ,total_latency);
        $display("matrix size: %d", true_pool_size, true_pool_size);
        $write("\033[0;34m Latency detail: [ \033[m");
        for(i = 0; i < 9; i = i+1)begin
            $write("%3d, ",lat_array[i]);
        end
        $display("%3d \033[0;34m ] \033[m",lat_array[i]);

	end
  	YOU_PASS_task;
end

//---------------------------------------------------------------------
//   Tasks
//---------------------------------------------------------------------
task reset_signal_task; begin 
    #(0.5);  rst_n=0;
    #(CYCLE/2);
    if((out_valid !== 0)||(out_value!== 0)) begin
      $display("************************************************************");
      $display("*                       LAB05_FAIL                         *");
      $display("*   Output signal should be 0 after initial RESET at %t    *",$time);
      $display("************************************************************");
      $finish;
    end
    #(10);  rst_n=1;
    #(3);  release clk;
end endtask

task calculate_answer; begin
    pool_size = $random(SEED) % 'd4;
    case (pool_size)
        2'b00: true_pool_size = 2;
        2'b01: true_pool_size = 4; 
        2'b10: true_pool_size = 8; 
        2'b11: true_pool_size = 16;
    endcase

    for (i = 0; i < 32; i=i+1) begin
        for(j = 0; j < 16; j = j+1)begin
            for(k = 0; k < 16; k = k+1)begin
                pool[i][j][k] = $random(SEED);
            end
        end
    end
    for (i = 0; i < 10; i = i+1) begin
        mx_mode[i]  = $random(SEED) % 'd4;
        
        mx_idx[i][0] = $random(SEED) % 'd32;
        mx_idx[i][1] = $random(SEED) % 'd32;
        mx_idx[i][2] = $random(SEED) % 'd32;

        while(mx_idx[i][0]===mx_idx[i][1] || mx_idx[i][1]===mx_idx[i][2] || mx_idx[i][2]===mx_idx[i][0])begin
            mx_idx[i][1] = $random(SEED) % 'd32;
            mx_idx[i][2] = $random(SEED) % 'd32;
        end
    
    end


    for(idx = 0; idx < 10; idx = idx+1)begin
         // calculate A*B, A: mx_idx[idx][0], B: mx_idx[idx][1] ...
        for(i = 0; i < true_pool_size; i = i+1)begin
            for(j = 0; j < true_pool_size; j = j+1)begin
                tmp_arr[i][j] = 0;
                for(m = 0; m < true_pool_size; m = m+1)begin
                    if(mx_mode[idx] == 2'b00 || mx_mode[idx] === 2'b11)begin
                        // A * B
                        tmp_arr[i][j] = tmp_arr[i][j] + pool[mx_idx[idx][0]][i][m] * pool[mx_idx[idx][1]][m][j];
                    end else if(mx_mode[idx] == 2'b01)begin
                        // A^T * B
                        tmp_arr[i][j] = tmp_arr[i][j] + pool[mx_idx[idx][0]][m][i] * pool[mx_idx[idx][1]][m][j];
                    end else if(mx_mode[idx] == 2'b10)begin
                        // A * B^T
                        tmp_arr[i][j] = tmp_arr[i][j] + pool[mx_idx[idx][0]][i][m] * pool[mx_idx[idx][1]][j][m];
                    end
                end
                
            end
        end

        // if(idx < 2)begin
        //     #1;
        //     $display("This is in calculate answer loop, idx = %d:",idx);
        //     $display("mx_mode = %b, matrix_size = %b", mx_mode[idx], pool_size);
        //     $display("A pool[%d]:",mx_idx[idx][0]);
        //     for(i = 0; i < true_pool_size; i = i+1)begin
        //         for(j = 0; j <true_pool_size; j = j+1)begin
        //             if(j == true_pool_size-1) $display("%d",pool[mx_idx[idx][0]][i][j]);
        //             else  $write("%d",pool[mx_idx[idx][0]][i][j]);
        //         end
        //     end
        //     $display("B pool[%d]:",mx_idx[idx][1]);
        //     for(i = 0; i < true_pool_size; i = i+1)begin
        //         for(j = 0; j <true_pool_size; j = j+1)begin
        //             if(j == true_pool_size-1) $display("%d",pool[mx_idx[idx][1]][i][j]);
        //             else  $write("%d",pool[mx_idx[idx][1]][i][j]);
        //         end
        //     end
        //     $display("C pool[%d]:",mx_idx[idx][2]);
        //     for(i = 0; i < true_pool_size; i = i+1)begin
        //         for(j = 0; j <true_pool_size; j = j+1)begin
        //             if(j == true_pool_size-1) $display("%d",pool[mx_idx[idx][2]][i][j]);
        //             else  $write("%d",pool[mx_idx[idx][2]][i][j]);
        //         end
        //     end
        //     $display("TMP pool:");
        //     for(i = 0; i < true_pool_size; i = i+1)begin
        //         for(j = 0; j <true_pool_size; j = j+1)begin
        //             if(j == true_pool_size-1) $display("%d",tmp_arr[i][j]);
        //             else  $write("%d",tmp_arr[i][j]);
        //         end
        //     end
        // end
        // A*B matrix is filled, calculate TR(AB*C)
        golden_answer[idx] = 0;
        for(i = 0; i < true_pool_size; i = i+1)begin
            for(j = 0; j <true_pool_size; j = j+1)begin

                if(mx_mode[idx] == 2'b00 || mx_mode[idx] === 2'b01 || mx_mode[idx] == 2'b10)begin
                    // ABC, A^TBC, AB^TC
                    golden_answer[idx] = golden_answer[idx] + tmp_arr[i][j] * pool[mx_idx[idx][2]][j][i];
                end else if(mx_mode[idx] == 2'b11)begin
                    // ABC^T
                    golden_answer[idx] = golden_answer[idx] + tmp_arr[i][j] * pool[mx_idx[idx][2]][i][j];
                end
            end
        end
        // if(idx < 2) $display("After TMP pool, golden_answer: %d",golden_answer[idx]);
    end

end endtask

task input_pool_task; begin
	
    in_valid = 1;

    for(idx = 0; idx < 32; idx = idx+1)begin
        for(jdx = 0; jdx < true_pool_size; jdx = jdx+1)begin
            for(kdx = 0; kdx < true_pool_size; kdx = kdx+1)begin
                
                if(idx == 0 && jdx == 0 && kdx ==0) matrix_size = pool_size;
                else matrix_size = 'bx;

                matrix = pool[idx][jdx][kdx];
                @(negedge clk);

            end
        end
    end
	
	in_valid = 1'b0;
	matrix = 'bx;
    matrix_size = 'bx;

end endtask

task input_quest_task; begin
    in_valid2  = 1;
    
    for(idx = 0; idx < 3; idx = idx+1)begin
        if(idx == 0) mode = mx_mode[questcnt];
        else mode = 'bx;

        matrix_idx = mx_idx[questcnt][idx];
        @(negedge clk);
        
    end

    in_valid2 = 0;
    matrix_idx = 'bx;
    mode = 'bx;


end endtask

task display_ans; begin
    
    $display("This is quest_count == %d, mx_mode set to: %b",questcnt, mx_mode[questcnt]);
    $display("Array A, pool[%d]:", mx_idx[questcnt][0]);
    for(i = 0; i < true_pool_size; i = i+1)begin
        for (j = 0; j < true_pool_size; j = j+1)begin
            if(j == true_pool_size-1) $display("%d",pool[mx_idx[questcnt][0]][i][j]);
            else  $write("%d",pool[mx_idx[questcnt][0]][i][j]);
        end
    end
    $display("Array B, pool[%d]:", mx_idx[questcnt][1]);
    for(i = 0; i < true_pool_size; i = i+1)begin
        for (j = 0; j < true_pool_size; j = j+1)begin
            if(j == true_pool_size-1) $display("%d",pool[mx_idx[questcnt][1]][i][j]);
            else  $write("%d",pool[mx_idx[questcnt][1]][i][j]);
        end
    end
    $display("Array C, pool[%d]:", mx_idx[questcnt][2]);
    for(i = 0; i < true_pool_size; i = i+1)begin
        for (j = 0; j < true_pool_size; j = j+1)begin
            if(j == true_pool_size-1) $display("%d",pool[mx_idx[questcnt][2]][i][j]);
            else  $write("%d",pool[mx_idx[questcnt][2]][i][j]);
        end
    end
    $display("Golden Answer of the trace of ABC is: %d",golden_answer[questcnt]);
    
end endtask



task wait_OUT_VALID; begin
  lat = -1;
  while(out_valid !== 1) begin
	lat = lat + 1;
	if(lat == 10001) begin//wait limit
		$display("***************************************************************");
		$display("*     		    ICLAB05_FAIL      							*");
		$display("*         The execution latency are over 10,000 cycles.       *");
		$display("***************************************************************");
        $display("mx_mode = %b, matrix_size = %b(%d)", mx_mode[questcnt], pool_size,true_pool_size);
        $display("A pool[%d]:",mx_idx[questcnt][0]);
        for(i = 0; i < true_pool_size; i = i+1)begin
            for(j = 0; j <true_pool_size; j = j+1)begin
                if(j == true_pool_size-1) $display("%d",pool[mx_idx[questcnt][0]][i][j]);
                else  $write("%d",pool[mx_idx[questcnt][0]][i][j]);
            end
        end
        $display("B pool[%d]:",mx_idx[questcnt][1]);
        for(i = 0; i < true_pool_size; i = i+1)begin
            for(j = 0; j <true_pool_size; j = j+1)begin
                if(j == true_pool_size-1) $display("%d",pool[mx_idx[questcnt][1]][i][j]);
                else  $write("%d",pool[mx_idx[questcnt][1]][i][j]);
            end
        end
        $display("C pool[%d]:",mx_idx[questcnt][2]);
        for(i = 0; i < true_pool_size; i = i+1)begin
            for(j = 0; j <true_pool_size; j = j+1)begin
                if(j == true_pool_size-1) $display("%d",pool[mx_idx[questcnt][2]][i][j]);
                else  $write("%d",pool[mx_idx[questcnt][2]][i][j]);
            end
        end
		repeat(2)@(negedge clk);
		$finish;
	end
	@(negedge clk);
  end
  lat_array[questcnt] = lat;
  total_latency = total_latency + lat;
  
end endtask

task check_ans; begin
x = 0;
  while(out_valid) begin
    if(x >= 1) begin//out length
      	$display("***************************************************************");
		$display("*     		    ICLAB05_FAIL      							*");
		$display("*         The out_valid is more than 1 cycle!                 *");
		$display("***************************************************************");
        repeat(2) @(negedge clk);
        $finish;
    end
    if(golden_answer[questcnt] !== out_value)begin//ans check
        
        $display ("--------------------------------------------------------------------");
        $display ("                     PATTERN #%d  Quest #%d FAILED !!   ",patcount, questcnt);

        $display("mx_mode = %b, matrix_size = %b(%d)", mx_mode[questcnt], pool_size,true_pool_size);
        $display("A pool[%d]:",mx_idx[questcnt][0]);
        for(i = 0; i < true_pool_size; i = i+1)begin
            for(j = 0; j <true_pool_size; j = j+1)begin
                if(j == true_pool_size-1) $display("%d",pool[mx_idx[questcnt][0]][i][j]);
                else  $write("%d",pool[mx_idx[questcnt][0]][i][j]);
            end
        end
        $display("B pool[%d]:",mx_idx[questcnt][1]);
        for(i = 0; i < true_pool_size; i = i+1)begin
            for(j = 0; j <true_pool_size; j = j+1)begin
                if(j == true_pool_size-1) $display("%d",pool[mx_idx[questcnt][1]][i][j]);
                else  $write("%d",pool[mx_idx[questcnt][1]][i][j]);
            end
        end
        $display("C pool[%d]:",mx_idx[questcnt][2]);
        for(i = 0; i < true_pool_size; i = i+1)begin
            for(j = 0; j <true_pool_size; j = j+1)begin
                if(j == true_pool_size-1) $display("%d",pool[mx_idx[questcnt][2]][i][j]);
                else  $write("%d",pool[mx_idx[questcnt][2]][i][j]);
            end
        end

      $display ("            Golden ANS: %d, Yours: %d(%h)    ",golden_answer[questcnt], out_value, out_value);		
      $display ("            Error !!                                                ");
      $display ("--------------------------------------------------------------------");
      repeat(2) @(negedge clk);		
      $finish;
    end
    @(negedge clk);	
    x=x+1;
  end

end endtask

task YOU_PASS_task; begin
  $display ("--------------------------------------------------------------------");
  $display ("          ~(￣▽￣)~(＿△＿)~(￣▽￣)~(＿△＿)~(￣▽￣)~           			 ");
  $display ("                         Congratulations!                           ");
  $display ("                  You have passed all patterns for Lab05!!                    ");
  $display ("--------------------------------------------------------------------");       
    
    #(500);
    $finish;
end endtask


endmodule