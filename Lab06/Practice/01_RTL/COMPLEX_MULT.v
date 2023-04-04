//synopsys translate_off
`include "GENVAR_PRAC.v"
//synopsys translate_on
module COMPLEX_MULT(
    operand1,
    operand2,
    result
);
parameter DEMO_WIDTH = 64;
localparam IP_WIDTH = 64, IP_LEVEL = 3;


input  [DEMO_WIDTH-1:0]   operand1,operand2;
output [DEMO_WIDTH*2+1:0]   result;

GENVAR_PRAC #(.WIDTH(IP_WIDTH),.N_LEVEL(IP_LEVEL)) I_GENVAR_PRAC (.operand1(operand1[IP_WIDTH-1:0]),.operand2(operand2[IP_WIDTH-1:0]),.result(result[2*IP_WIDTH+1:0]));


endmodule

