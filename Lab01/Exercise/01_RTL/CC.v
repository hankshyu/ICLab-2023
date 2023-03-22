module CC(
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
input [3:0]in_s0;
input [3:0]in_s1;
input [3:0]in_s2;
input [3:0]in_s3;
input [3:0]in_s4;
input [3:0]in_s5;
input [3:0]in_s6;
input [2:0]opt;
input [1:0]a;
input [2:0]b;
output [2:0] s_id0;
output [2:0] s_id1;
output [2:0] s_id2;
output [2:0] s_id3;
output [2:0] s_id4;
output [2:0] s_id5;
output [2:0] s_id6;
output [2:0] out;
//==================================================================
// reg & wire
//==================================================================

// struct for the input data

// signed extension of the input
reg signed [5-1 : 0] se_arr[7-1 : 0]; //sign extended array
wire signed [3-1 : 0] se_a; // sign extended a
wire signed [4-1 : 0] se_b; // sign extended b

//==================================================================
// design
//==================================================================

/* 
 * Task1: Convert signed/unsigned input to signed payload
 */

always @(*) begin
    if(!opt[0])begin
        //all numbers are viewed as unsigned
        se_arr[0] = {1'b0, in_s0};
        se_arr[1] = {1'b0, in_s1};
        se_arr[2] = {1'b0, in_s2};
        se_arr[3] = {1'b0, in_s3};
        se_arr[4] = {1'b0, in_s4};
        se_arr[5] = {1'b0, in_s5};
        se_arr[6] = {1'b0, in_s6};
        
    end else begin
        //all numbers are viewed as signed
        se_arr[0] = {in_s0[3], in_s0};
        se_arr[1] = {in_s1[3], in_s1};
        se_arr[2] = {in_s2[3], in_s2};
        se_arr[3] = {in_s3[3], in_s3};
        se_arr[4] = {in_s4[3], in_s4};
        se_arr[5] = {in_s5[3], in_s5};
        se_arr[6] = {in_s6[3], in_s6};
    end
end

assign se_a = {1'b0, a};
assign se_b = {1'b0, b};

/* 
 * Task2: Stable sort 
 */
 
wire [3-1 : 0] sorted_idx [7-1 : 0];

SORT_NETWORK sort_network(
    .inv_i(opt[1]),
    .data0_i(se_arr[0]),
    .data1_i(se_arr[1]),
    .data2_i(se_arr[2]),
    .data3_i(se_arr[3]),
    .data4_i(se_arr[4]),
    .data5_i(se_arr[5]),
    .data6_i(se_arr[6]),

    .idx0_o(sorted_idx[0]),
    .idx1_o(sorted_idx[1]),
    .idx2_o(sorted_idx[2]),
    .idx3_o(sorted_idx[3]),
    .idx4_o(sorted_idx[4]),
    .idx5_o(sorted_idx[5]),
    .idx6_o(sorted_idx[6])
);

// output index of sort
// if opt[1] = 0 min ... max
// if opt[1] = 1 max ... min 
assign s_id0 = (opt[1])? sorted_idx[6] : sorted_idx[0];
assign s_id1 = (opt[1])? sorted_idx[5] : sorted_idx[1];
assign s_id2 = (opt[1])? sorted_idx[4] : sorted_idx[2];
assign s_id3 = (opt[1])? sorted_idx[3] : sorted_idx[3];
assign s_id4 = (opt[1])? sorted_idx[2] : sorted_idx[4];
assign s_id5 = (opt[1])? sorted_idx[1] : sorted_idx[5];
assign s_id6 = (opt[1])? sorted_idx[0] : sorted_idx[6];

/* 
 * Task3: Calculate the passing score 
 */

wire signed [8-1 : 0] sum;
wire signed [5-1 : 0] avg;
wire signed [5-1 : 0] pass_score;

//sums the signed scores
assign sum = se_arr[0] + se_arr[1] + se_arr[2] + se_arr[3] + se_arr[4] + se_arr[5] + se_arr[6];

//calculates the average of the score, rounded down
assign avg = sum / 7;

//a is a 2-bit input
assign pass_score = avg - se_a;

/* 
 * Task4: Linear transformation
 */

reg signed [8-1 : 0] transformed [7 : 0];

integer index;
always @(*) begin
    for(index = 0; index <= 6; index = index + 1)begin
        if(se_arr[index] < 0)begin
            //raw score is negative, adjust by (score/(a+1))+b
            transformed[index] = (se_arr[index]/(se_a+1))+se_b;
        end else begin
            //raw score transformed to (a+1)*score + b
            transformed[index] = (se_a+1)*se_arr[index] + se_b;
        end
    end
end

/* 
 * Task4:  Count student pass/fail
 */

wire [3-1 : 0] pass_count, fail_count;

assign fail_count = (transformed[0] < pass_score) + (transformed[1] < pass_score) + (transformed[2] < pass_score)
                    + (transformed[3] < pass_score) + (transformed[4] < pass_score) + (transformed[5] < pass_score)
                    + (transformed[6] < pass_score);

assign pass_count = 7 - fail_count;

// if opt[2] is 0 count the number of students who passed
// if opt[2] is 1 count the number of students who failed
assign out = (opt[2])? fail_count : pass_count;


endmodule

module SORT_NETWORK(
    input inv_i,
    input signed [5-1 : 0] data0_i,
    input signed [5-1 : 0] data1_i,
    input signed [5-1 : 0] data2_i,
    input signed [5-1 : 0] data3_i,
    input signed [5-1 : 0] data4_i,
    input signed [5-1 : 0] data5_i,
    input signed [5-1 : 0] data6_i,

    output [3-1 : 0] idx0_o,
    output [3-1 : 0] idx1_o,
    output [3-1 : 0] idx2_o,
    output [3-1 : 0] idx3_o,
    output [3-1 : 0] idx4_o,
    output [3-1 : 0] idx5_o,
    output [3-1 : 0] idx6_o
);
    // Sorting network for 7 inputs, 16 CEs, 6 layers
    
    wire [8-1 : 0] init_pl [7-1 : 0];
    assign init_pl[0] = {3'd0, data0_i};
    assign init_pl[1] = {3'd1, data1_i};
    assign init_pl[2] = {3'd2, data2_i};
    assign init_pl[3] = {3'd3, data3_i};
    assign init_pl[4] = {3'd4, data4_i};
    assign init_pl[5] = {3'd5, data5_i};
    assign init_pl[6] = {3'd6, data6_i};

    wire [8-1 : 0] payload [5-1 : 0][7-1 : 0]; //output of each sorting network layers

    // Layer 0
    // (0,6) (2,3) (4,5)
    FIRST_SORT_CELL l0_0(.inv_i(inv_i), .up_i(init_pl[0]), .down_i(init_pl[6]), .up_o(payload[0][0]), .down_o(payload[0][6]));
    FIRST_SORT_CELL l0_1(.inv_i(inv_i), .up_i(init_pl[2]), .down_i(init_pl[3]), .up_o(payload[0][2]), .down_o(payload[0][3]));
    FIRST_SORT_CELL l0_2(.inv_i(inv_i), .up_i(init_pl[4]), .down_i(init_pl[5]), .up_o(payload[0][4]), .down_o(payload[0][5]));
    assign payload[0][1] = init_pl[1];

    // Layer 1
    // (0,2) (1,4) (3,6)
    SORT_CELL l1_0(.inv_i(inv_i), .up_i(payload[0][0]), .down_i(payload[0][2]), .up_o(payload[1][0]), .down_o(payload[1][2]));
    SORT_CELL l1_1(.inv_i(inv_i), .up_i(payload[0][1]), .down_i(payload[0][4]), .up_o(payload[1][1]), .down_o(payload[1][4]));
    SORT_CELL l1_2(.inv_i(inv_i), .up_i(payload[0][3]), .down_i(payload[0][6]), .up_o(payload[1][3]), .down_o(payload[1][6]));
    assign payload[1][5] = payload[0][5];

    // Layer 2
    // (0,1) (2,5) (3,4)
    SORT_CELL l2_0(.inv_i(inv_i), .up_i(payload[1][0]), .down_i(payload[1][1]), .up_o(payload[2][0]), .down_o(payload[2][1]));
    SORT_CELL l2_1(.inv_i(inv_i), .up_i(payload[1][2]), .down_i(payload[1][5]), .up_o(payload[2][2]), .down_o(payload[2][5]));
    SORT_CELL l2_2(.inv_i(inv_i), .up_i(payload[1][3]), .down_i(payload[1][4]), .up_o(payload[2][3]), .down_o(payload[2][4]));
    assign payload[2][6] = payload[1][6];

    // Layer 3
    // (1,2) (4,6)
    SORT_CELL l3_0(.inv_i(inv_i), .up_i(payload[2][1]), .down_i(payload[2][2]), .up_o(payload[3][1]), .down_o(payload[3][2]));
    SORT_CELL l3_1(.inv_i(inv_i), .up_i(payload[2][4]), .down_i(payload[2][6]), .up_o(payload[3][4]), .down_o(payload[3][6]));
    assign payload[3][0] = payload[2][0];
    assign payload[3][3] = payload[2][3];
    assign payload[3][5] = payload[2][5];

    // Layer 4
    // (2,3) (4,5)
    SORT_CELL l4_0(.inv_i(inv_i), .up_i(payload[3][2]), .down_i(payload[3][3]), .up_o(payload[4][2]), .down_o(payload[4][3]));
    SORT_CELL l4_1(.inv_i(inv_i), .up_i(payload[3][4]), .down_i(payload[3][5]), .up_o(payload[4][4]), .down_o(payload[4][5]));
    assign payload[4][0] = payload[3][0];
    assign payload[4][1] = payload[3][1];
    assign payload[4][6] = payload[3][6];

    // Layer 5 (output layer)
    // (1,2) (3,4) (5,6)
    LAST_SORT_CELL l5_0(.inv_i(inv_i), .up_i(payload[4][1]), .down_i(payload[4][2]), .up_idx_o(idx1_o), .down_idx_o(idx2_o));
    LAST_SORT_CELL l5_1(.inv_i(inv_i), .up_i(payload[4][3]), .down_i(payload[4][4]), .up_idx_o(idx3_o), .down_idx_o(idx4_o));
    LAST_SORT_CELL l5_2(.inv_i(inv_i), .up_i(payload[4][5]), .down_i(payload[4][6]), .up_idx_o(idx5_o), .down_idx_o(idx6_o));
    assign idx0_o = payload[4][0][7:5];


endmodule

module FIRST_SORT_CELL(
    input inv_i,
    input [8-1 : 0] up_i,
    input [8-1 : 0] down_i,
    output reg [8-1 : 0] up_o,
    output reg [8-1 : 0] down_o
);
    always @(*) begin
        if(($signed(up_i[4:0]) > $signed(down_i[4:0])) || (($signed(up_i[4:0]) == $signed(down_i[4:0])) && (inv_i)))begin
            //swap
            up_o = down_i;
            down_o = up_i;
            
        end else begin
            //do not change
            up_o = up_i;
            down_o = down_i;
        end
        
    end
endmodule

module SORT_CELL(
    input inv_i,
    input [8-1 : 0] up_i,
    input [8-1 : 0] down_i,
    output reg [8-1 : 0] up_o,
    output reg [8-1 : 0] down_o
);
    always @(*) begin
        if(($signed(up_i[4:0]) > $signed(down_i[4:0])) || (($signed(up_i[4:0]) == $signed(down_i[4:0])) && (((down_i[7:5] > up_i[7:5]) ^ (~inv_i)))))begin
            //swap
            up_o = down_i;
            down_o = up_i;
            
        end else begin
            //do not change
            up_o = up_i;
            down_o = down_i;
        end
        
    end
endmodule

module LAST_SORT_CELL(
    input inv_i,
    input [8-1 : 0] up_i,
    input [8-1 : 0] down_i,
    output reg [3-1 : 0] up_idx_o,
    output reg [3-1 : 0] down_idx_o
);
    always @(*) begin
        if(($signed(up_i[4:0]) > $signed(down_i[4:0])) || (($signed(up_i[4:0]) == $signed(down_i[4:0])) && (((down_i[7:5] > up_i[7:5]) ^ (~inv_i)))))begin
            //swap
            up_idx_o = down_i[7:5];
            down_idx_o = up_i[7:5];
            
        end else begin
            //do not change
            up_idx_o = up_i[7:5];
            down_idx_o = down_i[7:5];
        end
        
    end
endmodule

