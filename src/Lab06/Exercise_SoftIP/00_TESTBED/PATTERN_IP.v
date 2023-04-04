//############################################################################
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//      (C) Copyright Optimum Application-Specific Integrated System Laboratory
//      All Right Reserved
//		Date		: 2023/03
//		Version		: v1.0
//   	File Name   : PATTERN_IP.v
//   	Module Name : PATTERN_IP
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//############################################################################
`ifdef RTL
    `define CYCLE_TIME 60.0
`endif

`ifdef GATE
    `define CYCLE_TIME 60.0
`endif

module PATTERN_IP #(parameter IP_WIDTH = 6) (
    // Output signals
    IN_1, IN_2,
    // Input signals
    OUT_INV
);



// ===============================================================
// Input & Output Declaration
// ===============================================================
output reg[IP_WIDTH-1:0] IN_1, IN_2;
input  [IP_WIDTH-1:0] OUT_INV;

integer i;
integer fp_r;
integer case_counter;
real	CYCLE = `CYCLE_TIME;

reg [IP_WIDTH-1 : 0] tin0, tin1, tans;

//---------------------------------------------------------------------
//   CLOCK GENERATION
//---------------------------------------------------------------------
reg clk;
initial clk = 0;
always #(CYCLE/2.0) clk = ~clk;

//---------------------------------------------------------------------
//   Main Program
//---------------------------------------------------------------------
initial begin
    case_counter = 0;
    $display("Start Testbench of PATTERN_IP with IP_WIDTH = %d",IP_WIDTH);
    if(IP_WIDTH==5)begin
        fp_r = $fopen("../00_TESTBED/test5.txt","r");
    end else if(IP_WIDTH == 6)begin
        fp_r = $fopen("../00_TESTBED/test6.txt","r");
    end else if(IP_WIDTH == 7)begin
        fp_r = $fopen("../00_TESTBED/test7.txt","r");
    end else begin
        $display("ERROR! IP_WIDTH should be 5, 6 or 7!");
        #20;
        $finish;
    end
    @(negedge clk);
    while(!$feof(fp_r))begin
        $fscanf(fp_r, "%d %d %d",tin0, tin1, tans);
        IN_1 = tin0;
        IN_2 = tin1;
        @(negedge clk);
        
        if(OUT_INV !== tans)begin
            $display("************************************************************");
            $display("*                       LAB06_FAIL                         *");
            $display("*                    Test Case incorrect!                  *");
            $display("************************************************************");
            $display("%d(%b), %d(%b) = %d(%b)",tin0,tin0,tin1,tin1,tans,tans);
            $display("Your wrong answer: %d(%b)",OUT_INV, OUT_INV);
            #1;
            $finish;
            
        end else begin
            $display("Pass testcase %04d: (%03d, %03d)",case_counter, tin0, tin1);
        end
        case_counter = case_counter + 1;
        #1;
    end

    $fclose(fp_r);
    YOU_PASS_task;
end

task YOU_PASS_task; begin
  $display ("--------------------------------------------------------------------");
  $display ("          ~(￣▽￣)~(＿△＿)~(￣▽￣)~(＿△＿)~(￣▽￣)~           			 ");
  $display ("                         Congratulations!                           ");
  $display ("                  You have passed all patterns for IP_WIDTH = %d   ",IP_WIDTH);
  $display ("--------------------------------------------------------------------");       
    
    #(200);
    $finish;
end endtask

endmodule