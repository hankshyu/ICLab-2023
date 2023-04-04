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

input [3:0] in_s0;
input [3:0] in_s1;
input [3:0] in_s2;
input [3:0] in_s3;
input [3:0] in_s4;
input [3:0] in_s5;
input [3:0] in_s6;
input [2:0] opt;
input [1:0] a;
input [2:0] b;
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

// score
wire [3:0] in_lv0_s0;
wire [3:0] in_lv0_s1;
wire [3:0] in_lv0_s2;
wire [3:0] in_lv0_s3;
wire [3:0] in_lv0_s4;
wire [3:0] in_lv0_s5;
wire [3:0] in_lv0_s6;

wire [6:0] lv0_s0;
wire [6:0] lv0_s1;
wire [6:0] lv0_s2;
wire [6:0] lv0_s3;
wire [6:0] lv0_s4;
wire [6:0] lv0_s5;
wire [6:0] lv0_s6;

wire [6:0] lv1_s0;
wire [6:0] lv1_s1;
wire [6:0] lv1_s2;
wire [6:0] lv1_s3;
wire [6:0] lv1_s4;
wire [6:0] lv1_s5;
wire [6:0] lv1_s6;

wire [6:0] lv2_s0;
wire [6:0] lv2_s1;
wire [6:0] lv2_s2;
wire [6:0] lv2_s3;
wire [6:0] lv2_s4;
wire [6:0] lv2_s5;
wire [6:0] lv2_s6;

wire [6:0] lv3_s0;
wire [6:0] lv3_s1;
wire [6:0] lv3_s2;
wire [6:0] lv3_s3;
wire [6:0] lv3_s4;
wire [6:0] lv3_s5;
wire [6:0] lv3_s6;

wire [6:0] lv4_s0;
wire [6:0] lv4_s1;
wire [6:0] lv4_s2;
wire [6:0] lv4_s3;
wire [6:0] lv4_s4;
wire [6:0] lv4_s5;
wire [6:0] lv4_s6;

wire [6:0] lv5_s0;
wire [6:0] lv5_s1;
wire [6:0] lv5_s2;
wire [6:0] lv5_s3;
wire [6:0] lv5_s4;
wire [6:0] lv5_s5;
wire [6:0] lv5_s6;

wire [6:0] lv6_s0;
wire [6:0] lv6_s1;
wire [6:0] lv6_s2;
wire [6:0] lv6_s3;
wire [6:0] lv6_s4;
wire [6:0] lv6_s5;
wire [6:0] lv6_s6;

// students' score
wire signed [4:0] s0_s;
wire signed [4:0] s1_s;
wire signed [4:0] s2_s;
wire signed [4:0] s3_s;
wire signed [4:0] s4_s;
wire signed [4:0] s5_s;
wire signed [4:0] s6_s;

wire signed [7:0] s0_score;
wire signed [7:0] s1_score;
wire signed [7:0] s2_score;
wire signed [7:0] s3_score;
wire signed [7:0] s4_score;
wire signed [7:0] s5_score;
wire signed [7:0] s6_score;

// sum & avg
wire signed [7:0] sum;
wire signed [4:0] avg;
wire signed [7:0] pos_passing_score;
wire signed [7:0] neg_passing_score;
wire signed [4:0] a_plus_b;
wire signed [3:0] a_0;

// pass flag
wire s0_pass;
wire s1_pass;
wire s2_pass;
wire s3_pass;
wire s4_pass;
wire s5_pass;
wire s6_pass;
wire [2:0] sum_of_pass;

//==================================================================
// design
//==================================================================

// initial score and id
assign in_lv0_s0 = opt[1] ? ~in_s0 : in_s0;
assign in_lv0_s1 = opt[1] ? ~in_s1 : in_s1;
assign in_lv0_s2 = opt[1] ? ~in_s2 : in_s2;
assign in_lv0_s3 = opt[1] ? ~in_s3 : in_s3;
assign in_lv0_s4 = opt[1] ? ~in_s4 : in_s4;
assign in_lv0_s5 = opt[1] ? ~in_s5 : in_s5;
assign in_lv0_s6 = opt[1] ? ~in_s6 : in_s6;

assign lv0_s0[6:3] = opt[0] ? {~in_lv0_s0[3], in_lv0_s0[2:0]} : in_lv0_s0;
assign lv0_s1[6:3] = opt[0] ? {~in_lv0_s1[3], in_lv0_s1[2:0]} : in_lv0_s1;
assign lv0_s2[6:3] = opt[0] ? {~in_lv0_s2[3], in_lv0_s2[2:0]} : in_lv0_s2;
assign lv0_s3[6:3] = opt[0] ? {~in_lv0_s3[3], in_lv0_s3[2:0]} : in_lv0_s3;
assign lv0_s4[6:3] = opt[0] ? {~in_lv0_s4[3], in_lv0_s4[2:0]} : in_lv0_s4;
assign lv0_s5[6:3] = opt[0] ? {~in_lv0_s5[3], in_lv0_s5[2:0]} : in_lv0_s5;
assign lv0_s6[6:3] = opt[0] ? {~in_lv0_s6[3], in_lv0_s6[2:0]} : in_lv0_s6;

assign lv0_s0[2:0] = 3'd0;
assign lv0_s1[2:0] = 3'd1;
assign lv0_s2[2:0] = 3'd2;
assign lv0_s3[2:0] = 3'd3;
assign lv0_s4[2:0] = 3'd4;
assign lv0_s5[2:0] = 3'd5;
assign lv0_s6[2:0] = 3'd6;

// sort score (descending)
assign lv1_s0 = lv0_s0 < lv0_s6 ? lv0_s0 : lv0_s6;
assign lv1_s6 = lv0_s0 < lv0_s6 ? lv0_s6 : lv0_s0;
assign lv1_s2 = lv0_s2 < lv0_s3 ? lv0_s2 : lv0_s3;
assign lv1_s3 = lv0_s2 < lv0_s3 ? lv0_s3 : lv0_s2;
assign lv1_s4 = lv0_s4 < lv0_s5 ? lv0_s4 : lv0_s5;
assign lv1_s5 = lv0_s4 < lv0_s5 ? lv0_s5 : lv0_s4;
assign lv1_s1 = lv0_s1;

assign lv2_s0 = lv1_s0 < lv1_s2 ? lv1_s0 : lv1_s2;
assign lv2_s2 = lv1_s0 < lv1_s2 ? lv1_s2 : lv1_s0;
assign lv2_s1 = lv1_s1 < lv1_s4 ? lv1_s1 : lv1_s4;
assign lv2_s4 = lv1_s1 < lv1_s4 ? lv1_s4 : lv1_s1;
assign lv2_s3 = lv1_s3 < lv1_s6 ? lv1_s3 : lv1_s6;
assign lv2_s6 = lv1_s3 < lv1_s6 ? lv1_s6 : lv1_s3;
assign lv2_s5 = lv1_s5;

assign lv3_s0 = lv2_s0 < lv2_s1 ? lv2_s0 : lv2_s1;
assign lv3_s1 = lv2_s0 < lv2_s1 ? lv2_s1 : lv2_s0;
assign lv3_s2 = lv2_s2 < lv2_s5 ? lv2_s2 : lv2_s5;
assign lv3_s5 = lv2_s2 < lv2_s5 ? lv2_s5 : lv2_s2;
assign lv3_s3 = lv2_s3 < lv2_s4 ? lv2_s3 : lv2_s4;
assign lv3_s4 = lv2_s3 < lv2_s4 ? lv2_s4 : lv2_s3;
assign lv3_s6 = lv2_s6;

assign lv4_s1 = lv3_s1 < lv3_s2 ? lv3_s1 : lv3_s2;
assign lv4_s2 = lv3_s1 < lv3_s2 ? lv3_s2 : lv3_s1;
assign lv4_s4 = lv3_s4 < lv3_s6 ? lv3_s4 : lv3_s6;
assign lv4_s6 = lv3_s4 < lv3_s6 ? lv3_s6 : lv3_s4;
assign lv4_s0 = lv3_s0;
assign lv4_s3 = lv3_s3;
assign lv4_s5 = lv3_s5;

assign lv5_s2 = lv4_s2 < lv4_s3 ? lv4_s2 : lv4_s3;
assign lv5_s3 = lv4_s2 < lv4_s3 ? lv4_s3 : lv4_s2;
assign lv5_s4 = lv4_s4 < lv4_s5 ? lv4_s4 : lv4_s5;
assign lv5_s5 = lv4_s4 < lv4_s5 ? lv4_s5 : lv4_s4;
assign lv5_s0 = lv4_s0;
assign lv5_s1 = lv4_s1;
assign lv5_s6 = lv4_s6;

assign lv6_s1 = lv5_s1 < lv5_s2 ? lv5_s1 : lv5_s2;
assign lv6_s2 = lv5_s1 < lv5_s2 ? lv5_s2 : lv5_s1;
assign lv6_s3 = lv5_s3 < lv5_s4 ? lv5_s3 : lv5_s4;
assign lv6_s4 = lv5_s3 < lv5_s4 ? lv5_s4 : lv5_s3;
assign lv6_s5 = lv5_s5 < lv5_s6 ? lv5_s5 : lv5_s6;
assign lv6_s6 = lv5_s5 < lv5_s6 ? lv5_s6 : lv5_s5;
assign lv6_s0 = lv5_s0;

assign s_id0 = lv6_s0[2:0]; 
assign s_id1 = lv6_s1[2:0]; 
assign s_id2 = lv6_s2[2:0]; 
assign s_id3 = lv6_s3[2:0]; 
assign s_id4 = lv6_s4[2:0]; 
assign s_id5 = lv6_s5[2:0]; 
assign s_id6 = lv6_s6[2:0]; 

// compute passing score
assign s0_s = {(opt[0] & in_s0[3]), in_s0};
assign s1_s = {(opt[0] & in_s1[3]), in_s1};
assign s2_s = {(opt[0] & in_s2[3]), in_s2};
assign s3_s = {(opt[0] & in_s3[3]), in_s3};
assign s4_s = {(opt[0] & in_s4[3]), in_s4};
assign s5_s = {(opt[0] & in_s5[3]), in_s5};
assign s6_s = {(opt[0] & in_s6[3]), in_s6};

assign s0_score = s0_s;
assign s1_score = s1_s;
assign s2_score = s2_s;
assign s3_score = s3_s;
assign s4_score = s4_s;
assign s5_score = s5_s;
assign s6_score = s6_s;

assign sum = s0_s + s1_s + s2_s + s3_s + s4_s + s5_s + s6_s;
assign avg = sum / 7;
assign a_0 = a;
assign a_plus_b = a + b;

assign pos_passing_score = (avg - a_plus_b + a_0) / (a_0 + 1);
assign neg_passing_score = (avg - a_plus_b) * (a_0 + 1) - a_0;

assign s0_pass = (s0_score >= 0) ? (s0_score >= pos_passing_score) : (s0_score >= neg_passing_score);
assign s1_pass = (s1_score >= 0) ? (s1_score >= pos_passing_score) : (s1_score >= neg_passing_score);
assign s2_pass = (s2_score >= 0) ? (s2_score >= pos_passing_score) : (s2_score >= neg_passing_score);
assign s3_pass = (s3_score >= 0) ? (s3_score >= pos_passing_score) : (s3_score >= neg_passing_score);
assign s4_pass = (s4_score >= 0) ? (s4_score >= pos_passing_score) : (s4_score >= neg_passing_score);
assign s5_pass = (s5_score >= 0) ? (s5_score >= pos_passing_score) : (s5_score >= neg_passing_score);
assign s6_pass = (s6_score >= 0) ? (s6_score >= pos_passing_score) : (s6_score >= neg_passing_score);

assign sum_of_pass = s0_pass + s1_pass + s2_pass + s3_pass + s4_pass + s5_pass + s6_pass;
assign out = (opt[2]) ? (~sum_of_pass) : (sum_of_pass);

endmodule