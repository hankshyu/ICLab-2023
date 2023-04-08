`ifdef RTL
    `define CYCLE_TIME 10.0
`endif
`ifdef GATE
    `define CYCLE_TIME 10.0
`endif

module PATTERN(
    // Output Signals
    clk,
    rst_n,
    in_valid,
    init,
    in0,
    in1,
    in2,
    in3,
    // Input Signals
    out_valid,
    out
);

//================================================================
//   INPUT AND OUTPUT DECLARATION                         
//================================================================
/* Input for design */
output reg       clk, rst_n;
output reg       in_valid;
output reg [1:0] init;
output reg [1:0] in0, in1, in2, in3; 

/* Output for pattern */
input            out_valid;
input      [1:0] out; 

//================================================================
// integer
//================================================================
real CYCLE = `CYCLE_TIME;
parameter PATNUM = 300;
integer SEED = 82; 
integer total_latency;
integer patcount;
reg [1 : 0] map [64-1 : 0][4-1 : 0];
reg [1:0]init_in;
integer wait_val_time;
integer i;
integer cac; //check answer cycle

integer bonus_point;
integer sum_bonus;

reg [1:0] spotA, spotB, move;
reg [1:0] current_line;

integer resetted;

//================================================================
// parameter
//================================================================

parameter M_FORWARD = 2'd0;
parameter M_RIGHT   = 2'd1;
parameter M_LEFT    = 2'd2;
parameter M_JUMP    = 2'd3;

parameter S_ROAD    = 2'd0;
parameter S_LO      = 2'd1;
parameter S_HO      = 2'd2;
parameter S_TRAINS  = 2'd3;

parameter PRINT_MSG = 1; //set to 0 to hand in the exercise


//================================================================
// clock
//================================================================
initial clk = 0;

always #(CYCLE/2.0) clk = ~clk;

//================================================================
// initial
//================================================================
initial begin
    resetted = 0;
    @(posedge rst_n)
    resetted = 1;
end

always begin

    if(resetted)begin
        // The out should be reset when your out_valid is low.
        if(out_valid == 1'b0 && (out != 2'b00))begin
            $display("SPEC 4 IS FAIL!");
            $finish;
        end else if((in_valid === 1) && (out_valid !==0))begin
            // The out_valid should not be high when in_valid is high.
            $display("SPEC 5 IS FAIL!");
            $finish;
        end
    end
    #(CYCLE/10.0);
end


initial begin

	rst_n = 1'b1;
	in_valid = 1'b0;
	init = 'bx;
    in0 = 'bx;
    in1 = 'bx;
    in2 = 'bx;
    in3 = 'bx;
    sum_bonus = 0;
	force clk = 0;
 	total_latency = 0;
 	genmap;//this is to avoid starting out_valid...
	reset_signal_task;
	check_ans;
	for(patcount=1; patcount<=PATNUM; patcount=patcount+1) begin
        if(PRINT_MSG) $display("PATTERN:%05d",patcount);
		input_task;
		wait_out_valid;
		check_ans;
        
        @(negedge clk);
		check_ans;
        @(negedge clk);
		check_ans;
        @(negedge clk);

	end
    if(PRINT_MSG) $display("Total BONUS: %d running %d cycles!!",sum_bonus,PATNUM);
  	YOU_PASS_task;
end

//================================================================
// task
//================================================================

task reset_signal_task; 
    begin 
    #(0.5);  rst_n=0;
    #(2.0);
    if((out_valid !== 0)||(out !== 0)) begin
        $display("SPEC 3 IS FAIL!");
        // The reset signal (rst_n) would be given only once at the beginning of simulation. All output 
        // signals should be reset after the reset signal is asserted.
        $finish;
    end
    #(10);  rst_n=1;
    #(3);  release clk;
    end 
endtask


task input_task; 
begin
	// Inputs start from second negtive edge after the begining of clock
	if(patcount=='d1)begin 
        repeat(2)@(negedge clk);
    end

    genmap;
    if(PRINT_MSG) printmap;

    in_valid = 1'b1;
    for (i = 0; i < 64; i = i+1) begin
        init = (i == 0)? init_in : 2'bxx;

        in0 = map[i][0];
        in1 = map[i][1];
        in2 = map[i][2];
        in3 = map[i][3];

        if(out_valid !== 0)begin
            $display("SPEC 5 IS FAIL!");
            // The out_valid should not be high when in_valid is high.
            $finish;
        end

        @(negedge clk);
        //disable input

    end

    in_valid = 1'b0;
    init = 2'bx;
    in0 = 2'bx;
    in1 = 2'bx;
    in2 = 2'bx;
    in3 = 2'bx;
end
endtask

task wait_out_valid; begin
  wait_val_time = -1;
  while(out_valid !== 1) begin
	wait_val_time = wait_val_time + 1;
	if(wait_val_time == 3000)begin
		$display("SPEC 6 IS FAIL!");
        // The execution latency is limited in 3000 cycles. The latency is the time of the clock cycles 
        // between the falling edge of the in_valid and the rising edge of the out_valid.
		$finish;
	end
    if(out !== 2'b00)begin
        $display("SPEC 4 IS FAIL!");
        // The out should be reset when your out_valid is low.
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
  cac = 0;
  bonus_point = 0;
  
  
  while(out_valid)begin
        	
		if((cac > 62) || !((out === 2'd0)|| (out !== 2'd1)|| (out !== 2'd2)|| (out !== 2'd3)))begin
            $display("SPEC 7 IS FAIL!");
            // The out_valid and out must be asserted successively in 63 cycles.
			$finish;
        end 
        else begin
            //check for incorrect answers
            
            if(cac == 0)begin
                current_line = init_in;
            end
            
            if((current_line == 0 && out == M_LEFT) || (current_line == 3 && out == M_RIGHT))begin
                $display("SPEC 8-1 IS FAIL!");
                // - SPEC 8-1 (5%): The character cannot run outside the map.
                $finish;
            end else if(    ((out == M_FORWARD) && (map[cac+1][current_line] == S_LO)) ||
                            ((out == M_RIGHT) && (map[cac+1][current_line+1] == S_LO)) ||
                            ((out == M_LEFT) && (map[cac+1][current_line-1] == S_LO)) )begin
                $display("SPEC 8-2 IS FAIL!");
                // - SPEC 8-2 (5%): The character must avoid hitting lower obstacles.
                $finish;
            
            end else if(    ((out == M_JUMP) && (map[cac+1][current_line] == S_HO)) ||
                            ((out == M_RIGHT) && (map[cac+1][current_line+1] == S_HO)) ||
                            ((out == M_LEFT) && (map[cac+1][current_line-1] == S_HO)) )begin
                $display("SPEC 8-3 IS FAIL!");
                // - SPEC 8-3 (5%): The character must avoid hitting higher obstacles.
                $finish;
            end else if(    ((out == M_FORWARD) && (map[cac+1][current_line] == S_TRAINS)) ||
                            ((out == M_JUMP) && (map[cac+1][current_line] == S_TRAINS)) ||
                            ((out == M_RIGHT) && (map[cac+1][current_line+1] == S_TRAINS)) ||
                            ((out == M_LEFT) && (map[cac+1][current_line-1] == S_TRAINS)) )begin
                $display("SPEC 8-4 IS FAIL!");
                // - SPEC 8-4 (5%): The character must avoid hitting trains.
                $finish;                 
            end else if((out == M_JUMP) && (map[cac][current_line] == S_LO))begin
                $display("SPEC 8-5 IS FAIL!");
                // - SPEC 8-5 (5%): If you are on a lower obstacle (2’b01), you cannot use jump.
                $finish;
            end
            
            if(PRINT_MSG)begin

                if(cac % 8 == 0)$write("Block %02d: ",cac/8);

                if(out == M_FORWARD)begin
                    $write("%dF ",current_line);
                    bonus_point = bonus_point + 1;
                    
                end else if(out == M_JUMP)begin
                    $write("%dJ ",current_line);
                    bonus_point = bonus_point + 4;
                    
                end else if(out == M_LEFT)begin
                    $write("%dL ",current_line);
                    current_line = current_line - 1;
                    bonus_point = bonus_point + 2;
                end else if(out == M_RIGHT)begin
                    $write("%dR ",current_line);
                    current_line = current_line + 1;
                    bonus_point = bonus_point + 2;
                    
                end
                if(cac % 8 == 7)$display();
            end else begin
                if(out == M_LEFT)begin
                    current_line = current_line - 1;
                end else if(out == M_RIGHT)begin
                    current_line = current_line + 1;
                    
                end
            end
            
        end
        @(negedge clk);
        
		cac = cac + 1;
	
    end	
  //+++++++++++++++++++++++++++++++++++++++++++++++
  	if((cac < 62) && (cac != 0)) begin
            $display("SPEC 7 IS FAIL!");
            // The out_valid and out must be asserted successively in 63 cycles.
			$finish;
    end
    if(PRINT_MSG)begin
        $display();
        $display("Bonus is : %d",bonus_point);
        sum_bonus = sum_bonus + bonus_point;
        $display("\033[0;34mPASS PATTERN NO.%4d,\033[m \033[0;32mexecution cycle : %3d\033[m",patcount ,wait_val_time);
    end
    
end 
endtask

task YOU_PASS_task; 
    begin
        if(PRINT_MSG)begin
            $display("\n");
            $display("\n");
            $display("        ----------------------------               ");
            $display("        --                        --       |\__||  ");
            $display("        --  Congratulations !!    --      / O.O  | ");
            $display("        --                        --    /_____   | ");
            $display("        --  Simulation out!!     --   /^ ^ ^ \\  |");
            $display("        --                        --  |^ ^ ^ ^ |w| ");
            $display("        ----------------------------   \\m___m__|_|");
            $display("\n");
        end

        #(500);
        $finish;
    end
endtask

task genmap;
    integer idx, jdx, kdx, ldx;
    integer grow_obstacles, grow_trainnum, grow_trainpos;
    begin
        for (idx = 0; idx < 64; idx = idx+1) begin
            for(jdx = 0; jdx < 4; jdx = jdx + 1)begin
                //the map is covered with road
                map[idx][jdx] = 2'b00;
                //grow high and low obstacles
                if((idx % 'd2 == 0) && (idx % 'd8 != 0))begin
                    grow_obstacles = $random(SEED) % 'd3;
                    if(grow_obstacles == 1) map[idx][jdx] = 2'b01; //low obstacles (LO)
                    else if(grow_obstacles == 2) map[idx][jdx] = 2'b10; //high obstacles (HO)
                end
            end
        end
        // put on the trains
        for (jdx = 0; jdx < 8; jdx = jdx+1) begin
            grow_trainnum = ($random(SEED) %'d3)+1;
            for(ldx = 0; ldx < grow_trainnum; ldx = ldx+1)begin
                grow_trainpos = $random(SEED) %'d4;
                while(map[jdx*8][grow_trainpos] == 2'b11)begin
                    grow_trainpos = $random(SEED) %'d4; //regenerate position
                end
                map[jdx*8 + 0][grow_trainpos] = 2'b11;
                map[jdx*8 + 1][grow_trainpos] = 2'b11;
                map[jdx*8 + 2][grow_trainpos] = 2'b11;
                map[jdx*8 + 3][grow_trainpos] = 2'b11;
            end
        end
        //generate the input position
        init_in = $random(SEED) % 'd4;
        while(map[0][init_in] == 2'b11)begin
            init_in = $random(SEED) % 'd4;
        end

    end

endtask

task printmap;
    integer idx, jdx;
    begin
        $display("\t >< ||0***+*** 1***+*** 2***+*** 3***+*** 4***+*** 5***+*** 6***+*** 7***+*** (%d)",init_in);
        for (jdx = 0; jdx < 4; jdx = jdx+1) begin
            $write("%d ||",jdx);
            for (idx = 0; idx < 64; idx = idx+1) begin
                $write("%d",map[idx][jdx]);
                if(idx % 'd8 == 7) $write(" ");
            end
            $display();
        end
    end
endtask

endmodule


// fail.txt
// SPEC 3 IS FAIL!
// The reset signal (rst_n) would be given only once at the beginning of simulation. All output 
// signals should be reset after the reset signal is asserted.

// SPEC 4 IS FAIL!
// The out should be reset when your out_valid is low.

// SPEC 5 IS FAIL!
// The out_valid should not be high when in_valid is high.

// SPEC 6 IS FAIL!
// The execution latency is limited in 3000 cycles. The latency is the time of the clock cycles 
// between the falling edge of the in_valid and the rising edge of the out_valid.

// SPEC 7 IS FAIL!
// The out_valid and out must be asserted successively in 63 cycles.


// SPEC 8-1 IS FAIL!
// - SPEC 8-1 (5%): The character cannot run outside the map.

// SPEC 8-2 IS FAIL!
// - SPEC 8-2 (5%): The character must avoid hitting lower obstacles.

// SPEC 8-3 IS FAIL!
// - SPEC 8-3 (5%): The character must avoid hitting higher obstacles.

// SPEC 8-4 IS FAIL!
// - SPEC 8-4 (5%): The character must avoid hitting trains.

// SPEC 8-5 IS FAIL!
// - SPEC 8-5 (5%): If you are on a lower obstacle (2’b01), you cannot use jump.
