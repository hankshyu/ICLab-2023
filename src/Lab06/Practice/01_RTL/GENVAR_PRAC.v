module GENVAR_PRAC
#( parameter WIDTH = 32, parameter N_LEVEL = 3)
(
input [WIDTH-1:0] operand1, operand2,
output [2*WIDTH+1:0] result
);

localparam HALF_W = WIDTH/2;


wire signed [WIDTH:0] r_part, im_part;

genvar level_idx, node_idx;
generate 
    // divide
         for(level_idx = 1 ; level_idx <= N_LEVEL  ; level_idx= level_idx+1)begin:gen_level
             if(level_idx == 1 )begin:if_lv_1
                    //TA's Note:  instance could be instantiated in condition,
                    //however to access this specific instance , you must give
                    //this condition a certain hierarchy name
                    wire signed [HALF_W-1:0] op1[0:1];
                    assign op1[0] = operand1[WIDTH-1:HALF_W];
                    assign op1[1] = operand1[HALF_W-1:0];

                    wire signed [HALF_W-1:0] op2[0:1];
                    assign op2[0] = operand2[WIDTH-1:HALF_W];
                    assign op2[1] = operand2[HALF_W-1:0];
             end
             //TA's Note:  This for loop just demonstrate that loop condition could use "2**level_idx" to represent power of 2
             if(level_idx == 2 )begin:if_lv_2
                for(node_idx = 0 ; node_idx < 2**level_idx ; node_idx = node_idx + 1)begin:gen_node
                // TA's Note: Bit-Width could be flexible by parameter settings
                //            There are 2**level_idx mult_result instance in this loop
                       wire signed [2*HALF_W-1:0] mult_result;
                       assign mult_result = ( gen_level[level_idx-1].if_lv_1.op1[node_idx/2] *  gen_level[level_idx-1].if_lv_1.op2[node_idx%2]);
                end
             end
             if(level_idx ==N_LEVEL )begin:if_last_lv
                // to access previous for gen_level iteration instance, 
                // gen_level[idx].if_lv_1.instance_name 
		assign r_part = (gen_level[level_idx-1].if_lv_2.gen_node[0].mult_result) - (gen_level[level_idx-1].if_lv_2.gen_node[3].mult_result);
		assign im_part = (gen_level[level_idx-1].if_lv_2.gen_node[1].mult_result) + (gen_level[level_idx-1].if_lv_2.gen_node[2].mult_result);
             end            
         end

endgenerate
assign  result  = {r_part,im_part};

endmodule



