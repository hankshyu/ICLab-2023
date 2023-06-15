module PATTERN(
	// Output signals
	clk,
	rst_n,
	cg_en,
	in_valid,
	img,
	ker,
	weight,

	// Input signals
	out_valid,
	out_data
);

output reg clk;
output reg rst_n;
output reg cg_en;
output reg in_valid;
output reg [7:0] img;
output reg [7:0] ker;
output reg [7:0] weight;

input out_valid;
input  [9:0] out_data;

//================================================================
// parameters & integer
//================================================================
parameter TESTNUM = 100;
parameter PRE_SHOWDATA = 0; // turned on to show the input info WHETHER the answer is o/x
integer SEED = 1709;

integer x;
integer i,j,k, idx, jdx, kdx;

integer testcase_latency;
integer total_latency;
integer patcount;

// Colouring strings, apply with %0s parameter

reg[9*8:1]  reset_color  = "\033[1;0m";
reg[10*8:1] black_txtpf  = "\033[1;30m";
reg[10*8:1] red_txtpf    = "\033[1;31m";
reg[10*8:1] green_txtpf  = "\033[1;32m";
reg[10*8:1] yellow_txtpf = "\033[1;33m";
reg[10*8:1] blue_txtpf   = "\033[1;34m";
reg[10*8:1] purple_txtpf = "\033[1;35m";
reg[10*8:1] cyan_txtpf   = "\033[1;36m";
reg[10*8:1] gray_txtpf   = "\033[1;37m";
reg[10*8:1] white_txtpf   = "\033[1;38m";


//================================================================
// Wire & Reg Declaration
//================================================================
//Stores the input parameters
reg [8-1 : 0] simage1 [0 : 6-1] [0 : 6-1];
reg [8-1 : 0] simage2 [0 : 6-1] [0 : 6-1];
reg [8-1 : 0] skernel [0 : 3-1] [0 : 3-1];
reg [8-1 : 0] sweight [0 : 2-1] [0 : 2-1];

//Calculate 
reg [20-1 : 0] conv1 [0 : 4-1] [0 : 4-1];
reg [ 8-1 : 0] quantconv1 [0 : 4-1] [0 : 4-1];
reg [ 8-1 : 0] maxpool1 [0 : 2-1] [0 : 2-1];
reg [17-1 : 0] fulcon1 [0 : 4-1];
reg [ 8-1 : 0] quantfulcon1 [0 : 4-1];

reg [20-1 : 0] conv2 [0 : 4-1] [0 : 4-1];
reg [ 8-1 : 0] quantconv2 [0 : 4-1] [0 : 4-1];
reg [ 8-1 : 0] maxpool2 [0 : 2-1] [0 : 2-1];
reg [17-1 : 0] fulcon2 [0 : 4-1];
reg [ 8-1 : 0] quantfulcon2 [0 : 4-1];

reg [10-1 : 0] l1_distantce;
reg [10-1 : 0] gold_answer;

//================================================================
// Clock Generation
//================================================================
real CYCLE = 15.0; //This lab has a fixed 15ns clock
initial clk = 0;
always #(CYCLE/2) clk = ~clk;

//================================================================
// MAIN Flow
//================================================================
initial begin
	patcount = 0;
	
	rst_n = 1'b1;
	in_valid = 1'b0;
	
	cg_en = 'bx;
	img = 'bx;
	ker = 'bx;
	weight = 'bx;

	force clk = 0;

	total_latency = 0;
	reset_signal_task;
	repeat(4) @(negedge clk);
	for(patcount = 0; patcount < TESTNUM; patcount = patcount+1)begin
		gen_data;
		input_task;
		calculate_ans;
		if(PRE_SHOWDATA) print_data;
		wait_OUT_VALID;
		check_ans;
		repeat(($random(SEED)%3)+2) @(negedge clk);
		
	end
	YOU_PASS_task;

end

task reset_signal_task; begin 
  #(0.5);  rst_n=0;
  #(CYCLE/2);
  if((out_valid !== 0)||(out_data !== 0)) begin
    $display("========================================================================");
    $display("                       ICLAB 07 %0sFAIL%0s                  ",red_txtpf, reset_color);
    $display("   Output signal should be 0 after initial RESET at %t    ",$time);
    $display("========================================================================");
    $finish;
  end
  #(10);  rst_n=1;
  #(3);  release clk;
end endtask

task gen_data; begin
	if(patcount == 0)begin
		{simage1[0][0],simage1[0][1],simage1[0][2],simage1[0][3],simage1[0][4],simage1[0][5]} = {  8'd1,  8'd2,  8'd8,  8'd8,  8'd6,  8'd4};
		{simage1[1][0],simage1[1][1],simage1[1][2],simage1[1][3],simage1[1][4],simage1[1][5]} = {  8'd7,8'd128,8'd240,8'd255,8'd120, 8'd22};
		{simage1[2][0],simage1[2][1],simage1[2][2],simage1[2][3],simage1[2][4],simage1[2][5]} = {  8'd8,8'd255,8'd100,  8'd3,8'd255, 8'd34};
		{simage1[3][0],simage1[3][1],simage1[3][2],simage1[3][3],simage1[3][4],simage1[3][5]} = { 8'd12,8'd253, 8'd11, 8'd18,8'd255, 8'd16};
		{simage1[4][0],simage1[4][1],simage1[4][2],simage1[4][3],simage1[4][4],simage1[4][5]} = { 8'd18,8'd255,8'd255,8'd254,  8'd7, 8'd30};
		{simage1[5][0],simage1[5][1],simage1[5][2],simage1[5][3],simage1[5][4],simage1[5][5]} = {  8'd4, 8'd10,8'd110,  8'd9, 8'd14, 8'd15};
		
		for(idx = 0; idx < 6; idx = idx+1)begin
			for(jdx = 0; jdx < 6; jdx = jdx+1)begin
				simage2[idx][jdx] = $random(SEED) % 'd256;
			end
		end

		skernel[0][0] = 1;
		skernel[0][1] = 2;
		skernel[0][2] = 8;
		skernel[1][0] = 2;
		skernel[1][1] = 4;
		skernel[1][2] = 3;
		skernel[2][0] = 5;
		skernel[2][1] = 15;
		skernel[2][2] = 7;



		sweight[0][0] = 8'd125;
		sweight[0][1] = 8'd224;
		sweight[1][0] = 8'd30;
		sweight[1][1] = 8'd15;

		//Extreme test
		// for(idx = 0; idx < 6; idx = idx+1)begin
		// 	for(jdx = 0; jdx < 6; jdx = jdx+1)begin
		// 		simage1[idx][jdx] = 255;
		// 		simage2[idx][jdx] = 0;
		// 	end
		// end
		// for(idx = 0; idx < 3; idx = idx+1)begin
		// 	for(jdx = 0; jdx < 3; jdx = jdx+1)begin
		// 		skernel[idx][jdx] = 255;
		// 	end
		// end
		// for(idx = 0; idx < 2; idx = idx+1)begin
		// 	for(jdx = 0; jdx < 2; jdx = jdx+1)begin
		// 		sweight[idx][jdx] = 255;
		// 	end
		// end
		

	end else begin
		for(idx = 0; idx < 6; idx = idx+1)begin
			for(jdx = 0; jdx < 6; jdx = jdx+1)begin
				simage1[idx][jdx] = $random(SEED) % 'd256;
				simage2[idx][jdx] = $random(SEED) % 'd256;
			end
		end
		for(idx = 0; idx < 3; idx = idx+1)begin
			for(jdx = 0; jdx < 3; jdx = jdx+1)begin
				skernel[idx][jdx] = $random(SEED) % 'd256;
			end
		end
		for(idx = 0; idx < 2; idx = idx+1)begin
			for(jdx = 0; jdx < 2; jdx = jdx+1)begin
				sweight[idx][jdx] = $random(SEED) % 'd256;
			end
		end

	end
end endtask

task print_data; begin
	$display("");
	$display("%0s************************************************************************%0s",blue_txtpf,reset_color);
	$display("%0sInput variables%0s",blue_txtpf,reset_color);
	$display("%0s************************************************************************%0s",blue_txtpf,reset_color);
	$display("Image 1 (6 x 6):                      Image 2 (6 x 6):");
	$display("++||--0---1---2---3---4---5---        ++||--0---1---2---3---4---5---");
	for(idx = 0; idx < 6; idx = idx+1)begin
		$write("%1d || ",idx);
		for(jdx = 0; jdx < 6; jdx = jdx+1)begin
			$write("%03d ", simage1[idx][jdx]);
		end
		$write("         %1d || ",idx);
		for(jdx = 0; jdx < 6; jdx = jdx+1)begin
			$write("%03d ", simage2[idx][jdx]);
		end
		$display("");
	end
	$display("");
	
	$display("kernel 3 x 3:    weight 2 x 2:");
	for(idx = 0; idx < 3; idx = idx+1)begin
		for(jdx = 0; jdx < 3; jdx = jdx+1)begin
			$write("%03d ", skernel[idx][jdx]);
		end
		if(idx < 2)begin
			$write("     ");
			for(jdx = 0; jdx < 2; jdx = jdx+1)begin
				$write("%03d ", sweight[idx][jdx]);
			end
		end
		$display("");
	end
	$display("%0s************************************************************************%0s",cyan_txtpf,reset_color);
	$display("%0sCalculation variables%0s",cyan_txtpf,reset_color);
	$display("%0s************************************************************************%0s",cyan_txtpf,reset_color);
	$display("Conv 1 (4 x 4):                       Conv 2 (4 x 4):");
	$display("++||----0------1------2------3---     ++||----0------1------2------3---");
	for(idx = 0; idx < 4; idx = idx+1)begin
		$write("%1d || ",idx);
		for(jdx = 0; jdx < 4; jdx = jdx+1)begin
			$write("%6d ", conv1[idx][jdx]);
		end
		$write("     %1d || ",idx);
		for(jdx = 0; jdx < 4; jdx = jdx+1)begin
			$write("%6d ", conv2[idx][jdx]);
		end
		$display("");
	end
	$display("");
	
	$display("Quant-Conv 1 (4 x 4):                 Quant-Conv 2 (4 x 4):");
	$display("++||----0------1------2------3---     ++||----0------1------2------3---");
	for(idx = 0; idx < 4; idx = idx+1)begin
		$write("%1d || ",idx);
		for(jdx = 0; jdx < 4; jdx = jdx+1)begin
			$write("%6d ", quantconv1[idx][jdx]);
		end
		$write("     %1d || ",idx);
		for(jdx = 0; jdx < 4; jdx = jdx+1)begin
			$write("%6d ", quantconv2[idx][jdx]);
		end
		$display("");
	end
	$display("");

	$display("Max-Pooling 1 (2 x 2):                Max-Pooling 2 (2 x 2)");
	$display("++||----0-----1---                    ++||----0------1---");
	for(idx = 0; idx < 2; idx = idx+1)begin
		$write("%1d || ",idx);
		for(jdx = 0; jdx < 2; jdx = jdx+1)begin
			$write("%5d ", maxpool1[idx][jdx]);
		end
		$write("                     %1d || ",idx);
		for(jdx = 0; jdx < 2; jdx = jdx+1)begin
			$write("%5d ", maxpool2[idx][jdx]);
		end
		$display("");
	end
	$display("");
	$display("%0sFully Connected 1 (4 x 1)             Fully Connected 2 (4 x 1)%0s:",white_txtpf,reset_color);
	$display("[%6d, %6d, %6d ,%6d]      [%6d, %6d, %6d, %6d]",fulcon1[0],fulcon1[1],fulcon1[2],fulcon1[3],fulcon2[0],fulcon2[1],fulcon2[2],fulcon2[3]);
	$display("");
	$display("%0sQuant-Fully Connected 1 (4 x 1)       Quant-Fully Connected 2 (4 x 1)%0s:",white_txtpf,reset_color);
	$display("[%6d, %6d, %6d ,%6d]      [%6d, %6d, %6d, %6d]",quantfulcon1[0],quantfulcon1[1],quantfulcon1[2],quantfulcon1[3],quantfulcon2[0],quantfulcon2[1],quantfulcon2[2],quantfulcon2[3]);
	$display("");
	$display("L1 distance: %4d",l1_distantce);
	$display("");
	$display("%0sGOLD%0s Answer: %0s%4d%0s",yellow_txtpf,reset_color,yellow_txtpf,gold_answer,reset_color);
	$display("%0sMY%0s Answer:   %0s%4d%0s",green_txtpf,reset_color,green_txtpf,out_data,reset_color);
	$display("%0s************************************************************************%0s",cyan_txtpf,reset_color);
end endtask

task input_task; begin
	in_valid = 1;
	cg_en = 1; // this will continue for ever
	for(i = 0; i < 36; i = i+1)begin
		img = simage1[i/6][i%6];
		ker = (i < 9)? skernel[i/3][i%3] : 'bx;
		weight = (i < 4)? sweight[i/2][i%2] : 'bx;

		@(negedge clk);
	end
	for(i = 0; i < 36; i = i+1)begin
		img = simage2[i/6][i%6];
		@(negedge clk);
	end


	in_valid = 1'b0;
	img = 'bx;
	ker = 'bx;
	weight = 'bx;
end endtask

task calculate_ans; begin
	//calculate conv1 & conv2
	for(i = 0; i < 4; i = i+1)begin
		for(j = 0; j < 4; j = j+1)begin
			conv1[i][j] = 0;
			conv2[i][j] = 0;
			for(idx = 0; idx < 3; idx = idx+1)begin
				for(jdx = 0; jdx < 3; jdx = jdx+1)begin
					conv1[i][j] = conv1[i][j] + skernel[idx][jdx] * simage1[i+idx][j+jdx];
					conv2[i][j] = conv2[i][j] + skernel[idx][jdx] * simage2[i+idx][j+jdx];
				end
			end

		end
	end

	//quantize conv1, conv2 -> quantconv1, quantconv2
	for(i = 0; i < 4; i = i+1)begin
		for(j = 0; j < 4; j = j+1)begin
			quantconv1[i][j] = conv1[i][j] / 2295;
			quantconv2[i][j] = conv2[i][j] / 2295;
		end
	end

	//maxpooling
	maxpool1[0][0] = quantconv1[0][0];
	if(quantconv1[0][1] > maxpool1[0][0]) maxpool1[0][0] = quantconv1[0][1];
	if(quantconv1[1][0] > maxpool1[0][0]) maxpool1[0][0] = quantconv1[1][0];
	if(quantconv1[1][1] > maxpool1[0][0]) maxpool1[0][0] = quantconv1[1][1];
	maxpool1[0][1] = quantconv1[0][2];
	if(quantconv1[0][3] > maxpool1[0][1]) maxpool1[0][1] = quantconv1[0][3];
	if(quantconv1[1][2] > maxpool1[0][1]) maxpool1[0][1] = quantconv1[1][2];
	if(quantconv1[1][3] > maxpool1[0][1]) maxpool1[0][1] = quantconv1[1][3];
	maxpool1[1][0] = quantconv1[2][0];
	if(quantconv1[2][1] > maxpool1[1][0]) maxpool1[1][0] = quantconv1[2][1];
	if(quantconv1[3][0] > maxpool1[1][0]) maxpool1[1][0] = quantconv1[3][0];
	if(quantconv1[3][1] > maxpool1[1][0]) maxpool1[1][0] = quantconv1[3][1];
	maxpool1[1][1] = quantconv1[2][2];
	if(quantconv1[2][3] > maxpool1[1][1]) maxpool1[1][1] = quantconv1[2][3];
	if(quantconv1[3][2] > maxpool1[1][1]) maxpool1[1][1] = quantconv1[3][2];
	if(quantconv1[3][3] > maxpool1[1][1]) maxpool1[1][1] = quantconv1[3][3];

	maxpool2[0][0] = quantconv2[0][0];
	if(quantconv2[0][1] > maxpool2[0][0]) maxpool2[0][0] = quantconv2[0][1];
	if(quantconv2[1][0] > maxpool2[0][0]) maxpool2[0][0] = quantconv2[1][0];
	if(quantconv2[1][1] > maxpool2[0][0]) maxpool2[0][0] = quantconv2[1][1];
	maxpool2[0][1] = quantconv2[0][2];
	if(quantconv2[0][3] > maxpool2[0][1]) maxpool2[0][1] = quantconv2[0][3];
	if(quantconv2[1][2] > maxpool2[0][1]) maxpool2[0][1] = quantconv2[1][2];
	if(quantconv2[1][3] > maxpool2[0][1]) maxpool2[0][1] = quantconv2[1][3];
	maxpool2[1][0] = quantconv2[2][0];
	if(quantconv2[2][1] > maxpool2[1][0]) maxpool2[1][0] = quantconv2[2][1];
	if(quantconv2[3][0] > maxpool2[1][0]) maxpool2[1][0] = quantconv2[3][0];
	if(quantconv2[3][1] > maxpool2[1][0]) maxpool2[1][0] = quantconv2[3][1];
	maxpool2[1][1] = quantconv2[2][2];
	if(quantconv2[2][3] > maxpool2[1][1]) maxpool2[1][1] = quantconv2[2][3];
	if(quantconv2[3][2] > maxpool2[1][1]) maxpool2[1][1] = quantconv2[3][2];
	if(quantconv2[3][3] > maxpool2[1][1]) maxpool2[1][1] = quantconv2[3][3];
	
	//calculate fully connected layers
	fulcon1[0] = (maxpool1[0][0] * sweight[0][0]) + (maxpool1[0][1] * sweight[1][0]);
	fulcon1[1] = (maxpool1[0][0] * sweight[0][1]) + (maxpool1[0][1] * sweight[1][1]);
	fulcon1[2] = (maxpool1[1][0] * sweight[0][0]) + (maxpool1[1][1] * sweight[1][0]);
	fulcon1[3] = (maxpool1[1][0] * sweight[0][1]) + (maxpool1[1][1] * sweight[1][1]);

	fulcon2[0] = (maxpool2[0][0] * sweight[0][0]) + (maxpool2[0][1] * sweight[1][0]);
	fulcon2[1] = (maxpool2[0][0] * sweight[0][1]) + (maxpool2[0][1] * sweight[1][1]);
	fulcon2[2] = (maxpool2[1][0] * sweight[0][0]) + (maxpool2[1][1] * sweight[1][0]);
	fulcon2[3] = (maxpool2[1][0] * sweight[0][1]) + (maxpool2[1][1] * sweight[1][1]);
	
	//quantize fulcon1, fulcon2 -> quantfulcon1, quantfulcon2
	for(i = 0; i < 4; i = i+1)begin
		quantfulcon1[i] = fulcon1[i]/510;
		quantfulcon2[i] = fulcon2[i]/510;
	end

	//calculate l1distance
	l1_distantce = 0;
	for(i = 0; i < 4; i = i+1)begin
		l1_distantce = (quantfulcon1[i]>quantfulcon2[i])? (l1_distantce+(quantfulcon1[i]-quantfulcon2[i])):(l1_distantce+(quantfulcon2[i]-quantfulcon1[i]));
	end
	//pass through activation
	gold_answer = (l1_distantce >= 16)? l1_distantce : 0;
end endtask

task wait_OUT_VALID; begin
  testcase_latency = -1;
  while(out_valid !== 1) begin
	testcase_latency = testcase_latency + 1;
	if(testcase_latency == 1001) begin//wait limit
    	$display ("========================================================================");
    	$display("                       ICLAB 07 %0sFAIL%0s                  ",red_txtpf, reset_color);
		$display("         The execution latency are over 1001 cycles.         ");
    	$display ("========================================================================");
		repeat(5)@(negedge clk);
		$finish;
	end
	@(negedge clk);
  end
  total_latency = total_latency + testcase_latency + 1;
end endtask

task check_ans; begin
	if(gold_answer !== out_data) begin
    	$display ("========================================================================");
		$display ("                     TESTCASE #%6d  %0sFAIL%0s                         ",patcount,red_txtpf,reset_color);
		$display ("                     Incorrect Answer output!                         ");
    	$display ("========================================================================");
		print_data;

		repeat(5) @(negedge clk);		
		$finish;
	end else begin
		@(negedge clk);
		if((out_valid !== 0) && (out_data !== 0))begin
			$display ("========================================================================");
			$display ("                     TESTCASE #%6d  %0sFAIL%0s                         ",patcount,red_txtpf,reset_color);
			$display ("                Outvalid shouldn't raise over 1 cycle                         ");
			$display ("========================================================================");
		end else begin
			$display("\033[0;34mPASS PATTERN NO.%4d,\033[m \033[0;32mexecution cycle : %3d\033[m",patcount ,testcase_latency+1);
			
		end

	end
end endtask

task YOU_PASS_task; begin
    $display ("========================================================================");
    $display ("                           %0sCongratulations!%0s                           ",green_txtpf, reset_color);
    $display ("                    You have %0sPASSED%0s all %8d patterns!                     ",green_txtpf, reset_color, TESTNUM);
    $display ("========================================================================");
    $display ("                           %0sTiming Reports%0s                           ",blue_txtpf, reset_color);
	$display ("                    %0sTotal Cycles:%0s      %0s%15d%0s",cyan_txtpf, reset_color, yellow_txtpf, total_latency, reset_color);
	$display ("                    %0sClock period:%0s                  %5.1f",cyan_txtpf, reset_color, CYCLE);
	$display ("                    %0sTotal Time:%0s                    %5.3f",cyan_txtpf, reset_color, total_latency*CYCLE);
	$display ("                    %0sAverage testcase cycles:%0s      %0s%8.3f%0s",cyan_txtpf, reset_color, yellow_txtpf ,total_latency/TESTNUM,reset_color);
	$display ("                    %0sAverage testcase time:%0s        %8.3f",cyan_txtpf, reset_color, total_latency*CYCLE/TESTNUM);
    $display ("========================================================================");      
    
    #(500);
    $finish;
end endtask

endmodule