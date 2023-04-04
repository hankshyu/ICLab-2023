//############################################################################
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//    (C) Copyright Optimum Application-Specific Integrated System Laboratory
//    All Right Reserved
//		Date		: 2023/03
//		Version		: v1.0
//   	File Name   : PATTERN.v
//   	Module Name : PATTERN
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//############################################################################

`ifdef RTL_TOP
    `define CYCLE_TIME 18.9
`endif

`ifdef GATE_TOP
    `define CYCLE_TIME 18.9
`endif

module PATTERN (
    // Output signals
    clk, rst_n, in_valid,
    in_Px, in_Py, in_Qx, in_Qy, in_prime, in_a,
    // Input signals
    out_valid, out_Rx, out_Ry
);

    // ===============================================================
    // I/O Declaration
    // ===============================================================
    output reg clk, rst_n, in_valid;
    output reg [5:0] in_Px, in_Py, in_Qx, in_Qy, in_prime, in_a;
    input out_valid;
    input [5:0] out_Rx, out_Ry;
    // ===============================================================
    // Variables Declaration
    // ===============================================================
    real CYCLE = `CYCLE_TIME;
    integer x,i,lat,total_latency;
    integer fp_r;
    integer patcount;

    reg [6-1 : 0] px, py, qx, qy, prime, a, ans_x, ans_y;
    
    //---------------------------------------------------------------------
    //   CLOCK GENERATION
    //---------------------------------------------------------------------
    initial clk = 0;
    always #(CYCLE/2.0) clk = ~clk;

    //---------------------------------------------------------------------
    //   MAIN FLOW
    //---------------------------------------------------------------------
    initial begin
        patcount = 0;
        fp_r = $fopen("../00_TESTBED/input.txt", "r");
        rst_n = 1'b1;
        in_valid = 1'b0;
        
        in_Px = 'bx;
        in_Py = 'bx;
        in_Qx = 'bx;
        in_Qy = 'bx;
        in_prime = 'bx;
        in_a = 'bx;

        force clk = 0;

        total_latency = 0;
        reset_signal_task;

        while(!$feof(fp_r)) begin
            patcount = patcount + 1;
            input_task;
            wait_OUT_VALID;
            check_ans;
        end
        $fclose(fp_r);
        YOU_PASS_task;

    end
//================================================================
// TASKS implementation
//================================================================

task reset_signal_task; begin 
  #(0.5);  rst_n=0;
  #(CYCLE/2);
  if((out_valid !== 0)||(out_Rx !== 0)||(out_Ry !== 0)) begin
    $display("************************************************************");
    $display("*                       ICLAB06 FAIL                       *");
    $display("*   Output signal should be 0 after initial RESET at %t    *",$time);
    $display("************************************************************");
    $finish;
  end
  #(10);  rst_n=1;
  #(3);  release clk;
end endtask

task input_task; begin
	repeat(3)@(negedge clk);
	in_valid = 1;
    $fscanf(fp_r, "%d %d %d %d %d %d %d %d",px, py, qx, qy, prime, a, ans_x, ans_y);
    in_Px = px;
    in_Py = py;
    in_Qx = qx;
    in_Qy = qy;
    in_prime = prime;
    in_a = a;
    @(negedge clk);

	in_valid = 1'b0;
    in_Px = 'bx;
    in_Py = 'bx;
    in_Qx = 'bx;
    in_Qy = 'bx;
    in_prime = 'bx;
    in_a = 'bx;

end endtask

task wait_OUT_VALID; begin
  lat = -1;
  while(out_valid !== 1) begin
	lat = lat + 1;
	if(lat == 1001) begin//wait limit
		$display("***************************************************************");
		$display("*     		    ICLAB06 FAIL      							*");
		$display("*         The execution latency are over 1000 cycles.         *");
		$display("***************************************************************");
		repeat(2)@(negedge clk);
		$finish;
	end
	@(negedge clk);
  end
  total_latency = total_latency + lat;
end endtask

task check_ans;
begin
	if((ans_x !== out_Rx)||(ans_y !== out_Ry)) 
    begin
		$display ("--------------------------------------------------------------------");
		$display ("                     PATTERN #%d  FAILED!!!                         ",patcount);
		$display ("--------------------------------------------------------------------");
        $display ("P:(Px, Py), Q:(Qx, Qy) = (%d, %d), (%d, %d). Prime, a = (%d, %d)",px, py, qx, qy, prime, a);
		$display ("Ans: R:(Rx, Ry) = (%d, %d), Yours: (%d, %d)",ans_x, ans_y ,out_Rx, out_Ry);		
		$display ("--------------------------------------------------------------------");
		repeat(2) @(negedge clk);		
		$finish;
    end
	$display("\033[0;34mPASS PATTERN NO.%4d,\033[m \033[0;32mexecution cycle : %3d\033[m",patcount ,lat+1);
end endtask

task YOU_PASS_task;
begin
    $display ("--------------------------------------------------------------------");
    $display ("          ~(￣▽￣)~(＿△＿)~(￣▽￣)~(＿△＿)~(￣▽￣)~              ");
    $display ("                         Congratulations!                           ");
    $display ("                  You have passed all patterns!                     ");
    $display ("--------------------------------------------------------------------");        
    
    #(500);
    $finish;
end endtask


endmodule