`define CYCLE_TIME 20.0
module PATTERN(
// Output signals
  in_s0,
  in_s1,
  in_s2,
  in_s3,
  in_s4,
  in_s5,
  in_s6,
  opt,
  a,
  b,
  s_id0,
  s_id1,
  s_id2,
  s_id3,
  s_id4,
  s_id5,
  s_id6,
  out
);
//================================================================
//   INPUT AND OUTPUT DECLARATION                         
//================================================================
output reg [3:0] in_s0, in_s1, in_s2, in_s3, in_s4, in_s5, in_s6;
output reg [2:0] opt;
output reg [1:0] a; 
output reg [2:0] b; 

input [2:0] s_id0;
input [2:0] s_id1;
input [2:0] s_id2;
input [2:0] s_id3;
input [2:0] s_id4;
input [2:0] s_id5;
input [2:0] s_id6;
input [2:0] out;
//================================================================
// parameters & integer
//================================================================
integer PATNUM = 100;
integer seed;
integer total_latency;
integer patcount;
integer lat,i,j;
//================================================================
// wire & registers 
//================================================================
reg signed [4:0] n [0:6];
reg signed [8:0] temp;
reg [4:0] golden_idx [0:6];
reg [4:0] golden_pass;
reg signed [6:0] mean, pass_score;
reg [4:0]s_id[0:6];

//================================================================
// clock
//================================================================
reg clk;
real	CYCLE = `CYCLE_TIME;
always	#(CYCLE/2.0) clk = ~clk;
initial	clk = 0;

//================================================================
// initial
//================================================================
initial begin

    in_s0 = 4'dx;
	in_s1 = 4'dx;
	in_s2 = 4'dx;
	in_s3 = 4'dx;
    in_s4 = 4'dx;
	in_s5 = 4'dx;
	in_s6 = 4'dx;
	opt = 3'dx;
    a=2'dx;
    b=3'dx;
	total_latency = 0;
	seed = 32;

	for(patcount = 0; patcount < PATNUM; patcount = patcount + 1)
	begin		
		gen_data;
		gen_golden;
        repeat(1) @(negedge clk);
		check_ans;
		repeat(3) @(negedge clk);
	end
	display_pass;
    repeat(3) @(negedge clk);
    $finish;
end

//================================================================
// task
//================================================================
task gen_data; begin
	//generate operation and inputs 
    in_s0 = $random(seed)%'d16;
    in_s1 = $random(seed)%'d16;
    in_s2 = $random(seed)%'d16;
    in_s3 = $random(seed)%'d16;
    in_s4 = $random(seed)%'d16;
    in_s5 = $random(seed)%'d16;
    in_s6 = $random(seed)%'d16;
    opt = $random(seed)%'d8;
    a = $random(seed)%'d4;
    b = $random(seed)%'d8;
    // $display("a = %d b = %d ",a,b);
end endtask

task gen_golden; begin
    
	n[0]=(opt[0])? {in_s0[3],in_s0}:{1'b0,in_s0};
    n[1]=(opt[0])? {in_s1[3],in_s1}:{1'b0,in_s1};
    n[2]=(opt[0])? {in_s2[3],in_s2}:{1'b0,in_s2};
    n[3]=(opt[0])? {in_s3[3],in_s3}:{1'b0,in_s3};
    n[4]=(opt[0])? {in_s4[3],in_s4}:{1'b0,in_s4};
    n[5]=(opt[0])? {in_s5[3],in_s5}:{1'b0,in_s5};
    n[6]=(opt[0])? {in_s6[3],in_s6}:{1'b0,in_s6};

    for (i=0;i<7;i=i+1)begin
        golden_idx[i]=i;
    end 

    if(opt[1]) //sort L->S
        begin
            for(i=0;i<6;i=i+1)
            begin
                for(j=0;j<6-i;j=j+1)
                begin
                    if(n[j]<n[j+1])
                    begin
                        temp=n[j];
                        n[j]=n[j+1];
                        n[j+1]=temp;

                        temp=golden_idx[j];
                        golden_idx[j]=golden_idx[j+1];
                        golden_idx[j+1]=temp;
                    end
                end
            end
        end
	else //sort S->L
    begin
        for(i=0;i<6;i=i+1)
        begin
            for(j=0;j<6-i;j=j+1)
            begin
                if(n[j]>n[j+1])
                begin
                    temp=n[j];
                    n[j]=n[j+1];
                    n[j+1]=temp;

                    temp=golden_idx[j];
                    golden_idx[j]=golden_idx[j+1];
                    golden_idx[j+1]=temp;
                end
            end
        end
    end
    
   
    mean=(n[0]+n[1]+n[2]+n[3]+n[4]+n[5]+n[6])/7;
    pass_score=mean-a;
    golden_pass=0;
    
    for (i=0;i<7;i=i+1)begin
        if(n[i]<0) begin
            temp=(n[i]/$signed({1'b0,a+1})+$signed({1'b0,b}));
           
            if(temp>=pass_score) golden_pass=golden_pass+1;
        end
        else begin 
            temp=(n[i]*$signed({1'b0,a+1})+$signed({1'b0,b}));
            if(temp>=pass_score) golden_pass=golden_pass+1;
            
        end
    end
    if(opt[2]==1)begin
        golden_pass=7-golden_pass;
    end
    
end endtask

task check_ans; 
begin
    s_id[0]=s_id0;
    s_id[1]=s_id1;
    s_id[2]=s_id2;
    s_id[3]=s_id3;
    s_id[4]=s_id4;
    s_id[5]=s_id5;
    s_id[6]=s_id6;

    if(out!==golden_pass)begin
            display_fail;
            $display ("-------------------------------------------------------------------");
            $display ("*                            PATTERN NO.%4d 	                ",patcount);
            $display ("*                             wrong 	out                         ");
            $display ("             answer should be : %d , your answer is : %d           ", golden_pass, out);
            $display ("-------------------------------------------------------------------");
            #(100);
            $finish ;
    end
    for (i=0;i<7;i=i+1)begin
        if(s_id[i]!==golden_idx[i])
            begin
                display_fail;
                $display ("-------------------------------------------------------------------");
                $display ("*                            PATTERN NO.%4d 	                ",patcount);
                 $display ("*                        wrong 	    idx = %d            ",i);
                $display ("             answer should be : %d , your answer is : %d           ", golden_idx[i], s_id[i]);
                $display ("-------------------------------------------------------------------");
                #(100);
                $finish ;
            end
    end
        $display ("             out Pattern NO. %d          ", patcount);
end
endtask

task display_fail;
begin
        $display("\n");
        $display("\n");
        $display("        ----------------------------               ");
        $display("        --                        --       |\__||  ");
        $display("        --  OOPS!!                --      / X,X  | ");
        $display("        --                        --    /_____   | ");
        $display("        --  Simulation Failed!!   --   /^ ^ ^ \\  |");
        $display("        --                        --  |^ ^ ^ ^ |w| ");
        $display("        ----------------------------   \\m___m__|_|");
        $display("\n");
end
endtask

task display_pass;
begin
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
endtask
endmodule
