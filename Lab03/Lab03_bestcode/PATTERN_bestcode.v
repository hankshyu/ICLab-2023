`define CYCLE_TIME 10.0
`define PAT_NUM 250

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


/* Input for design */
output reg       clk, rst_n;
output reg       in_valid;
output reg [1:0] init;
output reg [1:0] in0, in1, in2, in3; 


/* Output for pattern */
input            out_valid;
input      [1:0] out; 


/* parameters & integer*/
integer patnum = `PAT_NUM;
integer seed;
integer toal_latency;
integer max_latency;
integer max_cycles;
integer patcount;
integer cycles;
integer latency;
integer total_cycles;
integer total_latency;
integer i,j;
integer rail_num;
integer temp;
integer rail_sum;
integer obstacles_num;
integer obstacles_sum;
integer t;
integer curr_col_num;

/* wire & registers*/
reg [1:0] array0 [0:63];
reg [1:0] array1 [0:63];
reg [1:0] array2 [0:63];
reg [1:0] array3 [0:63];
reg [3:0] rail_pos;
reg [3:0] obstacles_pos;
reg [1:0] curr_col [0:3];
reg [1:0] next_col [0:3];
reg [2:0] curr_row;
reg [2:0] next_row;
reg [1:0] init_t;

/* clock*/
real	CYCLE = `CYCLE_TIME;
always	#(CYCLE/2.0) clk = ~clk;


/* initial*/
initial begin
    max_latency = 0;
    max_cycles = 0;
    reset_task;
    total_cycles = 0;
    seed = 1;
    
    for (patcount = 0; patcount < patnum; patcount = patcount + 1) begin
        input_task;
        wait_out_valid_task;
        for (i=0; i<63; i=i+1) begin
            if (out_valid === 1) begin
                curr_col_num = i;
                check_ans_task;
            end
            else if (out_valid !== 1) begin
                if (out!==0) begin
                    $display ("SPEC 4 IS FAIL!");
                    $finish;
                end
                else begin
                    $display ("SPEC 7 IS FAIL!");
                    $finish;
                end
            end
            @(negedge clk);
        end
        if(out_valid === 1'b1) begin
            $display("SPEC 7 IS FAIL!");
            $finish;
        end          
        if(out_valid === 1'b0 & out !== 1'b0) begin
            $display("SPEC 4 IS FAIL!");
            $finish;
        end                  
//        $display("\033[0;34mPASS PATTERN NO.%4d,\033[m \033[0;32m Cycles: %5d\033[m", patcount ,cycles);
    end
    YOU_PASS_task;
end


/* task*/
task reset_task; begin
    rst_n = 'b1;
    in_valid = 'b0;
    init = 'bx;
    in0 = 'bx;
    in1 = 'bx;
    in2 = 'bx;
    in3 = 'bx;
    toal_latency = 0;
    force clk = 0;
    #CYCLE; rst_n = 0; 
    #CYCLE; rst_n = 1;
    if(out_valid !== 1'b0 || out !=='b0) begin //out!==0
        $display("SPEC 3 IS FAIL!");
        $finish;
    end
    #CYCLE; release clk;
end endtask


task input_task; begin
    //reset check
    t = $urandom_range(1, 3);
    for(i = 0; i < t; i = i + 1)begin
        @(negedge clk);
        if(out_valid === 1'b0 & out !=='b0) begin 
            $display("SPEC 4 IS FAIL!");  
            $finish;
        end     
    end
    //road
    for (i=0; i<64; i=i+1) begin
        array0 [i] = 2'b00;
        array1 [i] = 2'b00;
        array2 [i] = 2'b00;
        array3 [i] = 2'b00;
    end
    for (i=0; i<64; i=i+8) begin
        //obstacles
        for (j=2;j<8;j=j+2) begin
            obstacles_sum = 0;
            obstacles_pos = 4'd0;
            obstacles_num = $random(seed)%'d5;
            while (obstacles_sum!=obstacles_num) begin
                obstacles_pos[$random(seed)%'d4] = 1;
                obstacles_sum = obstacles_pos[0]+obstacles_pos[1]+obstacles_pos[2]+obstacles_pos[3];
            end        
            if (obstacles_pos[0]==1)
                array0 [j+i] = ($random(seed)%'d2)+1;
            if (obstacles_pos[1]==1)
                array1 [j+i] = ($random(seed)%'d2)+1;         
            if (obstacles_pos[2]==1)
                array2 [j+i] = ($random(seed)%'d2)+1;
            if (obstacles_pos[3]==1)
                array3 [j+i] = ($random(seed)%'d2)+1;       
        end
        
        
        
        //rail
        rail_sum = 0;
        rail_pos = 4'd0;
        rail_num = ($random(seed)%'d3)+1;//1~3
        while (rail_sum!=rail_num) begin
            rail_pos[$random(seed)%'d4] = 1;
            rail_sum = rail_pos[0]+rail_pos[1]+rail_pos[2]+rail_pos[3];
        end
        if (rail_pos[0]==1)
            for (j=i;j<i+4;j=j+1)
                array0 [j] = 2'b11;
        if (rail_pos[1]==1)
            for (j=i;j<i+4;j=j+1)
                array1 [j] = 2'b11;          
        if (rail_pos[2]==1)
            for (j=i;j<i+4;j=j+1)
                array2 [j] = 2'b11;
        if (rail_pos[3]==1)
            for (j=i;j<i+4;j=j+1)
                array3 [j] = 2'b11;
        
    end
    //init
    temp = 4;
    while (temp!=0) begin
        init_t = $random(seed)%'d4;
        if (init_t == 0)
            temp = array0[0];
        if (init_t == 1)
            temp = array1[0];  
        if (init_t == 2)
            temp = array2[0];  
        if (init_t == 3)
            temp = array3[0];  
    end
    curr_row[2:0] = {1'b0,init_t[1:0]};
    
    //input
    @(negedge clk);
    for (i=0; i<64; i=i+1) begin
        in_valid = 1'b1;
        if (i===0) 
            init = init_t;
        else
            init = 'bx;
        in0 = array0[i];
        in1 = array1[i];
        in2 = array2[i];
        in3 = array3[i];
        if(out !=='b0) begin 
            $display("SPEC 4 IS FAIL! ");    
            $finish;
        end
        if(out_valid ==='b1) begin 
            $display("SPEC 5 IS FAIL! ");    
            $finish;
        end
        @(negedge clk);
    end
    if(out_valid ==='b1) begin 
        $display("SPEC 5 IS FAIL! ");    
        $finish;
    end    
    in_valid = 1'b0;
    in0 = 'bx;
    in1 = 'bx;
    in2 = 'bx;
    in3 = 'bx;
end endtask


task wait_out_valid_task; begin
    cycles = 0;
    while(out_valid !== 1'b1) begin
        if(out !=='b0) begin 
            $display("SPEC 4 IS FAIL!");  
            $finish;
        end
        cycles = cycles + 1;
        if( cycles == 3000) begin
            $display("SPEC 6 IS FAIL!");
            $finish;
        end
        @(negedge clk);
    end
    total_cycles = total_cycles +cycles;
end endtask


task check_ans_task; begin
    if (curr_col_num!=62) begin
        curr_col[0] = array0[curr_col_num];
        curr_col[1] = array1[curr_col_num];
        curr_col[2] = array2[curr_col_num];
        curr_col[3] = array3[curr_col_num];
        next_col[0] = array0[curr_col_num+1];
        next_col[1] = array1[curr_col_num+1];
        next_col[2] = array2[curr_col_num+1];
        next_col[3] = array3[curr_col_num+1];
        if (out[0]===1'dz | out[1]===1'dz | out[0]===1'dx | out[1]===1'dx) begin
            $display("SPEC 7 IS FAIL!");
            $finish;
        end
        case (out)
        2'b00: next_row = curr_row;
        2'b01: next_row = curr_row+1;
        2'b10: next_row = curr_row-1;
        2'b11: next_row = curr_row;
        endcase    
        if(next_row >3) begin
            $display("SPEC 8-1 IS FAIL!");
            $finish;
        end
        if(next_col[next_row]===1) begin
            if (out!==3) begin
                $display("SPEC 8-2 IS FAIL!");
                $finish;
            end
        end
        if(next_col[next_row]===2) begin
            if (out!==0) begin
                $display("SPEC 8-3 IS FAIL!");
                $finish;
            end
        end
        if(next_col[next_row]===3) begin
            $display("SPEC 8-4 IS FAIL!");
            $finish;
        end
        if(curr_col[curr_row]===1) begin
            if (out===3) begin
                $display("SPEC 8-5 IS FAIL!");
                $finish;
            end
        end
        curr_row = next_row;
    end
end endtask


task YOU_PASS_task; begin
    $display("\n");
    $display("\n");
    $display("        ----------------------------               ");
    $display("        --                        --       |\__||  ");
    $display("        --  Congratulations !!    --      / O.O  | ");
    $display("        --                        --    /_____   | ");
    $display("        --  Simulation out!!     --   /^ ^ ^ \\  |");
    $display("        --                        --  |^ ^ ^ ^ |w| ");
    $display("        ----------------------------   \\m___m__|_|");
    $display ("----------------------------------------------------------------------------------------------------------------------");       
    repeat(2)@(negedge clk);
    $finish;
end endtask


endmodule