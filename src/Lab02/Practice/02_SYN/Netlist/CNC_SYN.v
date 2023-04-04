/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : R-2020.09
// Date      : Mon Mar  6 18:38:32 2023
/////////////////////////////////////////////////////////////


module CNC ( clk, rst_n, IN_VALID, MODE, IN, OUT_VALID, OUT );
  input [1:0] MODE;
  input [7:0] IN;
  output [16:0] OUT;
  input clk, rst_n, IN_VALID;
  output OUT_VALID;
  wire   n160, n161, n162, n163, n164, n165, n166, n167, n168, n169, n170,
         n171, n172, n173, n174, n175, n176, n177, n178, n179, n180, n181,
         n182, n183, n184, n185, n186, n187, n188, n189, n190, n191, n192,
         n193, n194, n195, n196, n197, n198, n199, n200, n201, n202, n203,
         n204, n205, n206, n207, n208, n209, n210, n211, n212, n213, n214,
         n215, n216, n217, n218, n219, n220, n221, n222, n223, n224, n225,
         n226, n227, n228, n229, n230, n231, n232, DP_OP_63J1_122_404_n232,
         DP_OP_63J1_122_404_n231, DP_OP_63J1_122_404_n230,
         DP_OP_63J1_122_404_n229, DP_OP_63J1_122_404_n225,
         DP_OP_63J1_122_404_n218, DP_OP_63J1_122_404_n217,
         DP_OP_63J1_122_404_n216, DP_OP_63J1_122_404_n212,
         DP_OP_63J1_122_404_n211, DP_OP_63J1_122_404_n210,
         DP_OP_63J1_122_404_n206, DP_OP_63J1_122_404_n205,
         DP_OP_63J1_122_404_n204, DP_OP_63J1_122_404_n203,
         DP_OP_63J1_122_404_n198, DP_OP_63J1_122_404_n187,
         DP_OP_63J1_122_404_n184, DP_OP_63J1_122_404_n183,
         DP_OP_63J1_122_404_n182, DP_OP_63J1_122_404_n181,
         DP_OP_63J1_122_404_n180, DP_OP_63J1_122_404_n179,
         DP_OP_63J1_122_404_n178, DP_OP_63J1_122_404_n177,
         DP_OP_63J1_122_404_n176, DP_OP_63J1_122_404_n175,
         DP_OP_63J1_122_404_n174, DP_OP_63J1_122_404_n173,
         DP_OP_63J1_122_404_n172, DP_OP_63J1_122_404_n171,
         DP_OP_63J1_122_404_n170, DP_OP_63J1_122_404_n169,
         DP_OP_63J1_122_404_n168, DP_OP_63J1_122_404_n167,
         DP_OP_63J1_122_404_n166, DP_OP_63J1_122_404_n165,
         DP_OP_63J1_122_404_n164, DP_OP_63J1_122_404_n163,
         DP_OP_63J1_122_404_n162, DP_OP_63J1_122_404_n161,
         DP_OP_63J1_122_404_n160, DP_OP_63J1_122_404_n159,
         DP_OP_63J1_122_404_n158, DP_OP_63J1_122_404_n155,
         DP_OP_63J1_122_404_n154, DP_OP_63J1_122_404_n153,
         DP_OP_63J1_122_404_n152, DP_OP_63J1_122_404_n151,
         DP_OP_63J1_122_404_n150, DP_OP_63J1_122_404_n149,
         DP_OP_63J1_122_404_n148, DP_OP_63J1_122_404_n147,
         DP_OP_63J1_122_404_n146, DP_OP_63J1_122_404_n145,
         DP_OP_63J1_122_404_n143, DP_OP_63J1_122_404_n142,
         DP_OP_63J1_122_404_n141, DP_OP_63J1_122_404_n140,
         DP_OP_63J1_122_404_n139, DP_OP_63J1_122_404_n138, n235, n236, n237,
         n238, n239, n240, n241, n242, n243, n244, n245, n246, n247, n248,
         n249, n250, n251, n252, n253, n254, n255, n256, n257, n258, n259,
         n260, n261, n262, n263, n264, n265, n266, n267, n268, n269, n270,
         n271, n272, n273, n274, n275, n276, n277, n278, n279, n280, n281,
         n282, n283, n284, n285, n286, n287, n288, n289, n290, n291, n292,
         n293, n294, n295, n296, n297, n298, n299, n300, n301, n302, n303,
         n304, n305, n306, n307, n308, n309, n310, n311, n312, n313, n314,
         n315, n316, n317, n318, n319, n320, n321, n322, n323, n324, n325,
         n326, n327, n328, n329, n330, n331, n332, n333, n334, n335, n336,
         n337, n338, n339, n340, n341, n342, n343, n344, n345, n346, n347,
         n348, n349, n350, n351, n352, n353, n354, n355, n356, n357, n358,
         n359, n360, n361, n362, n363, n364, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n374, n375, n376, n377, n378, n379, n380,
         n381, n382, n383, n384, n385, n386, n387, n388, n389, n390, n391,
         n392, n393, n394, n395, n396, n397, n398, n399, n400, n401, n402,
         n403, n404, n405, n406, n407, n408, n409, n410, n411, n412, n413,
         n414, n415, n416, n417, n418, n419, n420, n421, n422, n423, n424,
         n425, n426, n427, n428, n429, n430, n431, n432, n433, n434, n435,
         n436, n437, n438, n439, n440, n441, n442, n443, n444, n445, n446,
         n447, n448, n449, n450, n451, n452, n453, n454, n455, n456, n457,
         n458, n459, n460, n461, n462, n463, n464, n465, n466, n467, n468,
         n469, n470, n471, n472, n473, n474, n475, n476, n477, n478, n479,
         n480, n481, n482, n483, n484, n485, n486, n487, n488, n489, n490,
         n491, n492, n493, n494, n495, n496, n497, n498, n499, n500, n501,
         n502, n503, n504, n505, n506, n507, n508, n509, n510, n511, n512,
         n513, n514, n515, n516, n517, n518, n519, n520, n521, n522, n523,
         n524, n525, n526, n527, n528, n529, n530, n531, n532, n533, n534,
         n535, n536, n537, n538, n539, n540, n541, n542, n543, n544, n545,
         n546, n547, n548, n549, n550, n551, n552, n553, n554, n555, n556,
         n557, n558, n559, n560, n561, n562, n563, n564, n565, n566, n567,
         n568, n569, n570, n571, n572, n573, n574, n575, n576, n577, n578,
         n579, n580, n581, n582, n583, n584, n585, n586, n587, n588, n589,
         n590, n591, n592, n593, n594, n595, n596, n597, n598, n599, n600,
         n601, n602, n603, n604, n605, n606, n607, n608, n609, n610, n611,
         n612, n613, n614, n615, n616, n617, n618, n619, n620, n621, n622,
         n623, n624, n625, n626, n627, n628, n629, n630, n631, n632, n633,
         n634, n635, n636, n637, n638, n639, n640, n641, n642, n643, n644,
         n645, n646, n647, n648, n649, n650, n651, n652, n653, n654, n655,
         n656, n657, n658, n659, n660, n661, n662, n663, n664, n665, n666,
         n667, n668, n669, n670, n671, n672, n673;
  wire   [2:0] current_state;
  wire   [1:0] cnt;
  wire   [1:0] MODE_r;
  wire   [7:0] A;
  wire   [7:0] B;
  wire   [7:0] C;
  wire   [7:0] D;
  wire   [12:4] ACC_C;
  wire   [16:0] E;
  wire   [16:0] F;

  DFFTRX1 MODE_r_reg_0_ ( .D(n232), .RN(rst_n), .CK(clk), .Q(MODE_r[0]), .QN(
        n673) );
  DFFTRX4 current_state_reg_0_ ( .D(n230), .RN(rst_n), .CK(clk), .Q(
        current_state[0]), .QN(n664) );
  DFFTRX4 current_state_reg_2_ ( .D(n231), .RN(rst_n), .CK(clk), .Q(
        current_state[2]), .QN(n672) );
  DFFTRX1 MODE_r_reg_1_ ( .D(n226), .RN(rst_n), .CK(clk), .Q(MODE_r[1]) );
  DFFTRX4 cnt_reg_0_ ( .D(n228), .RN(rst_n), .CK(clk), .Q(cnt[0]), .QN(n662)
         );
  DFFTRX1 A_reg_7_ ( .D(n225), .RN(rst_n), .CK(clk), .Q(A[7]) );
  DFFTRX1 A_reg_6_ ( .D(n224), .RN(rst_n), .CK(clk), .Q(A[6]) );
  DFFTRX1 A_reg_5_ ( .D(n223), .RN(rst_n), .CK(clk), .Q(A[5]) );
  DFFTRX1 A_reg_4_ ( .D(n222), .RN(rst_n), .CK(clk), .Q(A[4]) );
  DFFTRX1 A_reg_3_ ( .D(n221), .RN(rst_n), .CK(clk), .Q(A[3]) );
  DFFTRX1 A_reg_2_ ( .D(n220), .RN(rst_n), .CK(clk), .Q(A[2]) );
  DFFTRX1 A_reg_1_ ( .D(n219), .RN(rst_n), .CK(clk), .Q(A[1]) );
  DFFTRX1 A_reg_0_ ( .D(n218), .RN(rst_n), .CK(clk), .Q(A[0]) );
  DFFTRX1 D_reg_7_ ( .D(n217), .RN(rst_n), .CK(clk), .Q(D[7]) );
  DFFTRX1 D_reg_6_ ( .D(n216), .RN(rst_n), .CK(clk), .Q(D[6]) );
  DFFTRX1 D_reg_5_ ( .D(n215), .RN(rst_n), .CK(clk), .Q(D[5]) );
  DFFTRX1 D_reg_4_ ( .D(n214), .RN(rst_n), .CK(clk), .Q(D[4]) );
  DFFTRX1 D_reg_3_ ( .D(n213), .RN(rst_n), .CK(clk), .Q(D[3]) );
  DFFTRX1 D_reg_2_ ( .D(n212), .RN(rst_n), .CK(clk), .Q(D[2]) );
  DFFTRX1 D_reg_1_ ( .D(n211), .RN(rst_n), .CK(clk), .Q(D[1]) );
  DFFTRX1 D_reg_0_ ( .D(n210), .RN(rst_n), .CK(clk), .Q(D[0]) );
  DFFTRX1 B_reg_7_ ( .D(n209), .RN(rst_n), .CK(clk), .Q(B[7]) );
  DFFTRX1 B_reg_6_ ( .D(n208), .RN(rst_n), .CK(clk), .Q(B[6]), .QN(n243) );
  DFFTRX1 B_reg_5_ ( .D(n207), .RN(rst_n), .CK(clk), .Q(B[5]), .QN(n236) );
  DFFTRX1 B_reg_4_ ( .D(n206), .RN(rst_n), .CK(clk), .Q(B[4]), .QN(n240) );
  DFFTRX1 B_reg_3_ ( .D(n205), .RN(rst_n), .CK(clk), .Q(B[3]), .QN(n242) );
  DFFTRX1 B_reg_2_ ( .D(n204), .RN(rst_n), .CK(clk), .Q(B[2]), .QN(n241) );
  DFFTRX1 B_reg_1_ ( .D(n203), .RN(rst_n), .CK(clk), .Q(B[1]), .QN(n237) );
  DFFTRX1 B_reg_0_ ( .D(n202), .RN(rst_n), .CK(clk), .Q(B[0]), .QN(n239) );
  DFFTRX1 C_reg_7_ ( .D(n201), .RN(rst_n), .CK(clk), .Q(C[7]) );
  DFFTRX1 C_reg_6_ ( .D(n200), .RN(rst_n), .CK(clk), .Q(C[6]) );
  DFFTRX1 C_reg_5_ ( .D(n199), .RN(rst_n), .CK(clk), .Q(C[5]) );
  DFFTRX1 C_reg_4_ ( .D(n198), .RN(rst_n), .CK(clk), .Q(C[4]) );
  DFFTRX1 C_reg_3_ ( .D(n197), .RN(rst_n), .CK(clk), .Q(C[3]) );
  DFFTRX1 C_reg_2_ ( .D(n196), .RN(rst_n), .CK(clk), .Q(C[2]) );
  DFFTRX1 C_reg_1_ ( .D(n195), .RN(rst_n), .CK(clk), .Q(C[1]) );
  DFFTRX1 C_reg_0_ ( .D(n194), .RN(rst_n), .CK(clk), .Q(C[0]) );
  DFFTRX1 E_reg_16_ ( .D(n161), .RN(rst_n), .CK(clk), .Q(E[16]) );
  DFFTRX1 E_reg_12_ ( .D(n169), .RN(rst_n), .CK(clk), .Q(E[12]) );
  DFFTRX1 E_reg_11_ ( .D(n171), .RN(rst_n), .CK(clk), .Q(E[11]) );
  DFFTRX1 E_reg_10_ ( .D(n173), .RN(rst_n), .CK(clk), .Q(E[10]) );
  DFFTRX1 E_reg_9_ ( .D(n175), .RN(rst_n), .CK(clk), .Q(E[9]) );
  DFFTRX1 E_reg_8_ ( .D(n177), .RN(rst_n), .CK(clk), .Q(E[8]) );
  DFFTRX1 E_reg_7_ ( .D(n179), .RN(rst_n), .CK(clk), .Q(E[7]) );
  DFFTRX1 E_reg_6_ ( .D(n181), .RN(rst_n), .CK(clk), .Q(E[6]), .QN(n665) );
  DFFTRX1 E_reg_5_ ( .D(n183), .RN(rst_n), .CK(clk), .Q(E[5]), .QN(n670) );
  DFFTRX1 E_reg_4_ ( .D(n185), .RN(rst_n), .CK(clk), .Q(E[4]), .QN(n667) );
  DFFTRX1 E_reg_3_ ( .D(n187), .RN(rst_n), .CK(clk), .Q(E[3]), .QN(n668) );
  DFFTRX1 E_reg_2_ ( .D(n189), .RN(rst_n), .CK(clk), .Q(E[2]), .QN(n666) );
  DFFTRX1 E_reg_1_ ( .D(n191), .RN(rst_n), .CK(clk), .Q(E[1]), .QN(n669) );
  DFFTRX1 E_reg_0_ ( .D(n192), .RN(rst_n), .CK(clk), .Q(E[0]), .QN(n671) );
  DFFTRX1 F_reg_16_ ( .D(n160), .RN(rst_n), .CK(clk), .Q(F[16]) );
  DFFTRX1 F_reg_12_ ( .D(n168), .RN(rst_n), .CK(clk), .Q(F[12]) );
  DFFTRX1 F_reg_11_ ( .D(n170), .RN(rst_n), .CK(clk), .Q(F[11]) );
  DFFTRX1 F_reg_10_ ( .D(n172), .RN(rst_n), .CK(clk), .Q(F[10]) );
  DFFTRX1 F_reg_9_ ( .D(n174), .RN(rst_n), .CK(clk), .Q(F[9]) );
  DFFTRX1 F_reg_8_ ( .D(n176), .RN(rst_n), .CK(clk), .Q(F[8]) );
  DFFTRX1 F_reg_7_ ( .D(n178), .RN(rst_n), .CK(clk), .Q(F[7]) );
  DFFTRX1 F_reg_6_ ( .D(n180), .RN(rst_n), .CK(clk), .Q(F[6]) );
  DFFTRX1 F_reg_5_ ( .D(n182), .RN(rst_n), .CK(clk), .Q(F[5]) );
  DFFTRX1 F_reg_4_ ( .D(n184), .RN(rst_n), .CK(clk), .Q(F[4]) );
  DFFTRX1 F_reg_3_ ( .D(n186), .RN(rst_n), .CK(clk), .Q(F[3]) );
  DFFTRX1 F_reg_2_ ( .D(n188), .RN(rst_n), .CK(clk), .Q(F[2]) );
  DFFTRX1 F_reg_1_ ( .D(n190), .RN(rst_n), .CK(clk), .Q(F[1]) );
  DFFTRX1 F_reg_0_ ( .D(n193), .RN(rst_n), .CK(clk), .Q(F[0]) );
  CMPR42X1 DP_OP_63J1_122_404_U170 ( .A(ACC_C[4]), .B(DP_OP_63J1_122_404_n218), 
        .C(DP_OP_63J1_122_404_n225), .D(DP_OP_63J1_122_404_n232), .ICI(
        DP_OP_63J1_122_404_n187), .S(DP_OP_63J1_122_404_n184), .ICO(
        DP_OP_63J1_122_404_n182), .CO(DP_OP_63J1_122_404_n183) );
  CMPR42X1 DP_OP_63J1_122_404_U168 ( .A(DP_OP_63J1_122_404_n198), .B(
        DP_OP_63J1_122_404_n217), .C(DP_OP_63J1_122_404_n231), .D(
        DP_OP_63J1_122_404_n181), .ICI(DP_OP_63J1_122_404_n182), .S(
        DP_OP_63J1_122_404_n179), .ICO(DP_OP_63J1_122_404_n177), .CO(
        DP_OP_63J1_122_404_n178) );
  CMPR42X1 DP_OP_63J1_122_404_U166 ( .A(DP_OP_63J1_122_404_n230), .B(
        DP_OP_63J1_122_404_n216), .C(DP_OP_63J1_122_404_n180), .D(
        DP_OP_63J1_122_404_n177), .ICI(DP_OP_63J1_122_404_n176), .S(
        DP_OP_63J1_122_404_n174), .ICO(DP_OP_63J1_122_404_n172), .CO(
        DP_OP_63J1_122_404_n173) );
  CMPR42X1 DP_OP_63J1_122_404_U163 ( .A(DP_OP_63J1_122_404_n229), .B(
        DP_OP_63J1_122_404_n171), .C(DP_OP_63J1_122_404_n175), .D(
        DP_OP_63J1_122_404_n172), .ICI(DP_OP_63J1_122_404_n169), .S(
        DP_OP_63J1_122_404_n167), .ICO(DP_OP_63J1_122_404_n165), .CO(
        DP_OP_63J1_122_404_n166) );
  CMPR42X1 DP_OP_63J1_122_404_U159 ( .A(DP_OP_63J1_122_404_n170), .B(
        DP_OP_63J1_122_404_n164), .C(DP_OP_63J1_122_404_n168), .D(
        DP_OP_63J1_122_404_n162), .ICI(DP_OP_63J1_122_404_n165), .S(
        DP_OP_63J1_122_404_n160), .ICO(DP_OP_63J1_122_404_n158), .CO(
        DP_OP_63J1_122_404_n159) );
  CMPR42X1 DP_OP_63J1_122_404_U154 ( .A(DP_OP_63J1_122_404_n212), .B(
        DP_OP_63J1_122_404_n205), .C(DP_OP_63J1_122_404_n150), .D(
        DP_OP_63J1_122_404_n154), .ICI(DP_OP_63J1_122_404_n151), .S(
        DP_OP_63J1_122_404_n148), .ICO(DP_OP_63J1_122_404_n146), .CO(
        DP_OP_63J1_122_404_n147) );
  CMPR42X1 DP_OP_63J1_122_404_U151 ( .A(ACC_C[12]), .B(ACC_C[11]), .C(
        DP_OP_63J1_122_404_n203), .D(DP_OP_63J1_122_404_n210), .ICI(
        DP_OP_63J1_122_404_n141), .S(DP_OP_63J1_122_404_n140), .ICO(
        DP_OP_63J1_122_404_n138), .CO(DP_OP_63J1_122_404_n139) );
  DFFTRX2 cnt_reg_1_ ( .D(n227), .RN(rst_n), .CK(clk), .Q(cnt[1]), .QN(n661)
         );
  DFFTRX1 E_reg_14_ ( .D(n165), .RN(rst_n), .CK(clk), .Q(E[14]) );
  DFFTRX1 E_reg_13_ ( .D(n167), .RN(rst_n), .CK(clk), .Q(E[13]) );
  DFFTRX1 F_reg_14_ ( .D(n164), .RN(rst_n), .CK(clk), .Q(F[14]) );
  DFFTRX1 E_reg_15_ ( .D(n163), .RN(rst_n), .CK(clk), .Q(E[15]) );
  DFFTRX1 F_reg_13_ ( .D(n166), .RN(rst_n), .CK(clk), .Q(F[13]) );
  DFFTRX1 F_reg_15_ ( .D(n162), .RN(rst_n), .CK(clk), .Q(F[15]) );
  DFFTRX2 current_state_reg_1_ ( .D(n229), .RN(rst_n), .CK(clk), .Q(
        current_state[1]), .QN(n663) );
  NOR2X1 U287 ( .A(n360), .B(n400), .Y(n396) );
  NOR2X1 U288 ( .A(n372), .B(n663), .Y(OUT_VALID) );
  NOR2X1 U289 ( .A(n532), .B(n533), .Y(n521) );
  NOR2X1 U290 ( .A(n519), .B(n518), .Y(n533) );
  NOR2X1 U291 ( .A(n575), .B(n577), .Y(n558) );
  NOR2X1 U292 ( .A(n593), .B(n601), .Y(n501) );
  NOR2X1 U293 ( .A(DP_OP_63J1_122_404_n142), .B(DP_OP_63J1_122_404_n140), .Y(
        n541) );
  NOR2X1 U294 ( .A(n497), .B(n496), .Y(n624) );
  XNOR2XL U295 ( .A(n333), .B(n454), .Y(n302) );
  XNOR2XL U296 ( .A(n467), .B(n466), .Y(n482) );
  XOR2XL U297 ( .A(n552), .B(n551), .Y(n554) );
  INVXL U298 ( .A(n658), .Y(n527) );
  NOR2XL U299 ( .A(n249), .B(n382), .Y(n380) );
  NAND2X1 U300 ( .A(n481), .B(n316), .Y(n483) );
  MX2X1 U301 ( .A(n287), .B(B[7]), .S0(n235), .Y(n292) );
  AOI22XL U302 ( .A0(n235), .A1(E[15]), .B0(n249), .B1(F[15]), .Y(n453) );
  AOI22X1 U303 ( .A0(n474), .A1(B[7]), .B0(n473), .B1(A[7]), .Y(n452) );
  OAI21X1 U304 ( .A0(n526), .A1(cnt[1]), .B0(n525), .Y(n658) );
  AND2X1 U305 ( .A(n401), .B(n392), .Y(n439) );
  INVXL U306 ( .A(n655), .Y(n659) );
  INVXL U307 ( .A(n522), .Y(n653) );
  AOI21XL U308 ( .A0(n530), .A1(n521), .B0(n520), .Y(n522) );
  OAI21XL U309 ( .A0(n577), .A1(n585), .B0(n578), .Y(n557) );
  NOR2X1 U310 ( .A(n567), .B(n559), .Y(n503) );
  NOR2X1 U311 ( .A(DP_OP_63J1_122_404_n159), .B(DP_OP_63J1_122_404_n153), .Y(
        n577) );
  NOR2X1 U312 ( .A(DP_OP_63J1_122_404_n148), .B(DP_OP_63J1_122_404_n152), .Y(
        n567) );
  OR2XL U313 ( .A(DP_OP_63J1_122_404_n139), .B(n515), .Y(n543) );
  NOR2X1 U314 ( .A(DP_OP_63J1_122_404_n167), .B(DP_OP_63J1_122_404_n173), .Y(
        n593) );
  NOR2X1 U315 ( .A(DP_OP_63J1_122_404_n147), .B(DP_OP_63J1_122_404_n143), .Y(
        n559) );
  NOR2X1 U316 ( .A(DP_OP_63J1_122_404_n160), .B(DP_OP_63J1_122_404_n166), .Y(
        n575) );
  NOR2X1 U317 ( .A(DP_OP_63J1_122_404_n174), .B(DP_OP_63J1_122_404_n178), .Y(
        n601) );
  NOR2X1 U318 ( .A(DP_OP_63J1_122_404_n179), .B(DP_OP_63J1_122_404_n183), .Y(
        n609) );
  ADDFX1 U319 ( .A(n301), .B(n300), .CI(n299), .CO(DP_OP_63J1_122_404_n168), 
        .S(DP_OP_63J1_122_404_n169) );
  NOR2X1 U320 ( .A(n472), .B(n471), .Y(n639) );
  NOR2X1 U321 ( .A(n488), .B(n487), .Y(n486) );
  OAI22XL U322 ( .A0(n509), .A1(n334), .B0(n508), .B1(n506), .Y(
        DP_OP_63J1_122_404_n203) );
  ADDFX1 U323 ( .A(n495), .B(n494), .CI(n493), .CO(n496), .S(n488) );
  ADDFX1 U324 ( .A(n492), .B(n491), .CI(n490), .CO(n498), .S(n497) );
  ADDHXL U325 ( .A(n359), .B(n358), .CO(DP_OP_63J1_122_404_n180), .S(
        DP_OP_63J1_122_404_n181) );
  ADDFX1 U326 ( .A(n280), .B(n279), .CI(n278), .CO(DP_OP_63J1_122_404_n154), 
        .S(DP_OP_63J1_122_404_n155) );
  OAI2BB1XL U327 ( .A0N(n342), .A1N(n345), .B0(n310), .Y(
        DP_OP_63J1_122_404_n210) );
  XNOR2XL U328 ( .A(n450), .B(n467), .Y(n347) );
  XNOR2X2 U329 ( .A(n274), .B(n454), .Y(n342) );
  BUFX2 U330 ( .A(n314), .Y(n466) );
  XNOR2X1 U331 ( .A(n314), .B(n259), .Y(n478) );
  NAND2XL U332 ( .A(n393), .B(n452), .Y(ACC_C[12]) );
  AND2XL U333 ( .A(n453), .B(n452), .Y(n238) );
  NAND2XL U334 ( .A(n254), .B(n253), .Y(n255) );
  NOR2X1 U335 ( .A(n381), .B(n439), .Y(n385) );
  INVX1 U336 ( .A(n397), .Y(n371) );
  INVX4 U337 ( .A(n477), .Y(n235) );
  INVX1 U338 ( .A(n656), .Y(n523) );
  INVX1 U339 ( .A(n438), .Y(n436) );
  NAND2X1 U340 ( .A(IN_VALID), .B(n387), .Y(n438) );
  NAND2X1 U341 ( .A(OUT_VALID), .B(n400), .Y(n397) );
  OAI21X1 U342 ( .A0(n526), .A1(n661), .B0(n446), .Y(n656) );
  NOR2X1 U343 ( .A(n526), .B(cnt[0]), .Y(n248) );
  AND2XL U344 ( .A(n386), .B(n672), .Y(n387) );
  NOR2X1 U345 ( .A(n661), .B(cnt[0]), .Y(n388) );
  NOR2X2 U346 ( .A(n526), .B(n245), .Y(n249) );
  MX2X2 U347 ( .A(n258), .B(n242), .S0(n235), .Y(n454) );
  OAI2BB1XL U348 ( .A0N(D[2]), .A1N(n381), .B0(n293), .Y(n458) );
  OAI2BB1XL U349 ( .A0N(D[3]), .A1N(n381), .B0(n294), .Y(n337) );
  OAI2BB1XL U350 ( .A0N(D[5]), .A1N(n381), .B0(n277), .Y(n331) );
  AOI21XL U351 ( .A0(n296), .A1(C[5]), .B0(n295), .Y(n277) );
  OAI2BB1XL U352 ( .A0N(D[6]), .A1N(n381), .B0(n266), .Y(n333) );
  AOI21XL U353 ( .A0(n296), .A1(C[6]), .B0(n295), .Y(n266) );
  INVX2 U354 ( .A(n292), .Y(n450) );
  OAI2BB1XL U355 ( .A0N(D[1]), .A1N(n381), .B0(n297), .Y(n467) );
  AOI21XL U356 ( .A0(n296), .A1(C[1]), .B0(n295), .Y(n297) );
  MX2XL U357 ( .A(n313), .B(n239), .S0(n235), .Y(n315) );
  OAI211XL U358 ( .A0(n477), .A1(n670), .B0(n355), .C0(n354), .Y(n359) );
  OAI22XL U359 ( .A0(n457), .A1(n357), .B0(n356), .B1(n478), .Y(n358) );
  AOI22XL U360 ( .A0(n474), .A1(B[5]), .B0(n473), .B1(A[5]), .Y(n355) );
  OAI2BB1XL U361 ( .A0N(D[0]), .A1N(n381), .B0(n290), .Y(n479) );
  AOI21XL U362 ( .A0(n296), .A1(C[0]), .B0(n382), .Y(n290) );
  OAI22XL U363 ( .A0(n345), .A1(n326), .B0(n328), .B1(n342), .Y(
        DP_OP_63J1_122_404_n212) );
  OAI22XL U364 ( .A0(n509), .A1(n330), .B0(n332), .B1(n506), .Y(
        DP_OP_63J1_122_404_n205) );
  OAI211XL U365 ( .A0(n477), .A1(n665), .B0(n336), .C0(n335), .Y(n341) );
  OAI22XL U366 ( .A0(n457), .A1(n356), .B0(n338), .B1(n478), .Y(n339) );
  OAI22XL U367 ( .A0(n509), .A1(n298), .B0(n347), .B1(n506), .Y(n299) );
  NAND2XL U368 ( .A(n306), .B(n452), .Y(n309) );
  AOI22XL U369 ( .A0(n235), .A1(E[7]), .B0(n249), .B1(F[7]), .Y(n306) );
  NOR2X2 U370 ( .A(n373), .B(n400), .Y(n474) );
  INVX2 U371 ( .A(n525), .Y(n473) );
  OAI22XL U372 ( .A0(n483), .A1(n319), .B0(n481), .B1(n318), .Y(
        DP_OP_63J1_122_404_n231) );
  OAI22XL U373 ( .A0(n345), .A1(n322), .B0(n324), .B1(n342), .Y(
        DP_OP_63J1_122_404_n217) );
  OAI22XL U374 ( .A0(n345), .A1(n321), .B0(n342), .B1(n320), .Y(
        DP_OP_63J1_122_404_n198) );
  INVXL U375 ( .A(ACC_C[11]), .Y(DP_OP_63J1_122_404_n145) );
  OAI22XL U376 ( .A0(n509), .A1(n332), .B0(n334), .B1(n506), .Y(
        DP_OP_63J1_122_404_n204) );
  OAI22XL U377 ( .A0(n345), .A1(n328), .B0(n327), .B1(n342), .Y(
        DP_OP_63J1_122_404_n211) );
  NAND2XL U378 ( .A(DP_OP_63J1_122_404_n139), .B(n515), .Y(n542) );
  XNOR2XL U379 ( .A(n458), .B(n454), .Y(n357) );
  XNOR2XL U380 ( .A(n449), .B(n454), .Y(n267) );
  XNOR2XL U381 ( .A(n329), .B(n325), .Y(n343) );
  OAI2BB1XL U382 ( .A0N(D[7]), .A1N(n381), .B0(n261), .Y(n449) );
  AOI21XL U383 ( .A0(n296), .A1(C[7]), .B0(n295), .Y(n261) );
  OAI2BB1XL U384 ( .A0N(D[4]), .A1N(n381), .B0(n276), .Y(n329) );
  AOI21XL U385 ( .A0(n296), .A1(C[4]), .B0(n295), .Y(n276) );
  NAND2XL U386 ( .A(n247), .B(n452), .Y(n265) );
  AOI22XL U387 ( .A0(n235), .A1(E[9]), .B0(n249), .B1(F[9]), .Y(n247) );
  NAND2XL U388 ( .A(n249), .B(F[2]), .Y(n475) );
  AOI22XL U389 ( .A0(n474), .A1(B[2]), .B0(n473), .B1(A[2]), .Y(n476) );
  XNOR2XL U390 ( .A(n458), .B(n466), .Y(n480) );
  XNOR2XL U391 ( .A(n467), .B(n454), .Y(n455) );
  OAI211XL U392 ( .A0(n477), .A1(n668), .B0(n443), .C0(n442), .Y(n461) );
  OAI22XL U393 ( .A0(n457), .A1(n445), .B0(n478), .B1(n444), .Y(n460) );
  XNOR2XL U394 ( .A(n337), .B(n466), .Y(n459) );
  AOI22XL U395 ( .A0(n474), .A1(B[4]), .B0(n473), .B1(A[4]), .Y(n395) );
  NAND2XL U396 ( .A(n249), .B(F[4]), .Y(n394) );
  OAI22XL U397 ( .A0(n457), .A1(n455), .B0(n357), .B1(n478), .Y(
        DP_OP_63J1_122_404_n225) );
  XNOR2XL U398 ( .A(n329), .B(n466), .Y(n319) );
  XNOR2XL U399 ( .A(n449), .B(n466), .Y(n348) );
  OAI21XL U400 ( .A0(n568), .A1(n559), .B0(n560), .Y(n502) );
  NAND2XL U401 ( .A(n448), .B(n452), .Y(n513) );
  AOI22XL U402 ( .A0(n235), .A1(E[13]), .B0(n249), .B1(F[13]), .Y(n448) );
  INVXL U403 ( .A(n507), .Y(n451) );
  OAI22XL U404 ( .A0(n483), .A1(n468), .B0(n481), .B1(n482), .Y(n471) );
  OAI211XL U405 ( .A0(n477), .A1(n669), .B0(n463), .C0(n462), .Y(n485) );
  OAI22XL U406 ( .A0(n483), .A1(n465), .B0(n481), .B1(n464), .Y(n484) );
  AOI22XL U407 ( .A0(n474), .A1(B[1]), .B0(n473), .B1(A[1]), .Y(n463) );
  OAI22XL U408 ( .A0(n345), .A1(n324), .B0(n323), .B1(n342), .Y(
        DP_OP_63J1_122_404_n216) );
  OAI22XL U409 ( .A0(n483), .A1(n318), .B0(n481), .B1(n317), .Y(
        DP_OP_63J1_122_404_n230) );
  OAI21XL U410 ( .A0(n609), .A1(n612), .B0(n610), .Y(n592) );
  OR2XL U411 ( .A(n305), .B(n304), .Y(DP_OP_63J1_122_404_n163) );
  OAI22XL U412 ( .A0(n509), .A1(n346), .B0(n330), .B1(n506), .Y(
        DP_OP_63J1_122_404_n206) );
  OAI21XL U413 ( .A0(n531), .A1(n533), .B0(n534), .Y(n520) );
  NOR2BXL U414 ( .AN(n479), .B(n481), .Y(n647) );
  OAI211XL U415 ( .A0(n477), .A1(n671), .B0(n470), .C0(n469), .Y(n646) );
  AOI22XL U416 ( .A0(n474), .A1(B[0]), .B0(n473), .B1(A[0]), .Y(n470) );
  NAND2XL U417 ( .A(n472), .B(n471), .Y(n640) );
  NAND2XL U418 ( .A(n647), .B(n646), .Y(n648) );
  INVXL U419 ( .A(n486), .Y(n633) );
  OAI21XL U420 ( .A0(n639), .A1(n648), .B0(n640), .Y(n634) );
  OAI21XL U421 ( .A0(n627), .A1(n624), .B0(n625), .Y(n619) );
  OR2XL U422 ( .A(DP_OP_63J1_122_404_n184), .B(n498), .Y(n618) );
  NAND2XL U423 ( .A(DP_OP_63J1_122_404_n179), .B(DP_OP_63J1_122_404_n183), .Y(
        n610) );
  NAND2XL U424 ( .A(DP_OP_63J1_122_404_n174), .B(DP_OP_63J1_122_404_n178), .Y(
        n602) );
  INVXL U425 ( .A(n592), .Y(n605) );
  INVXL U426 ( .A(n575), .Y(n586) );
  NAND2X1 U427 ( .A(n382), .B(n400), .Y(n525) );
  NAND2X1 U428 ( .A(n244), .B(n392), .Y(n477) );
  INVXL U429 ( .A(n526), .Y(n244) );
  NAND2XL U430 ( .A(n543), .B(n542), .Y(n544) );
  NAND2XL U431 ( .A(n535), .B(n534), .Y(n536) );
  AND2XL U432 ( .A(n649), .B(n648), .Y(n651) );
  OR2XL U433 ( .A(n647), .B(n646), .Y(n649) );
  NAND2XL U434 ( .A(n561), .B(n560), .Y(n562) );
  NAND2XL U435 ( .A(n550), .B(n549), .Y(n551) );
  INVXL U436 ( .A(n382), .Y(n373) );
  NOR2X1 U437 ( .A(cnt[0]), .B(cnt[1]), .Y(n400) );
  NAND2XL U438 ( .A(n664), .B(current_state[2]), .Y(n372) );
  INVXL U439 ( .A(n433), .Y(n435) );
  NAND2XL U440 ( .A(n382), .B(current_state[0]), .Y(n391) );
  NOR2X1 U441 ( .A(n662), .B(cnt[1]), .Y(n392) );
  NOR3BXL U442 ( .AN(current_state[0]), .B(current_state[2]), .C(
        current_state[1]), .Y(n401) );
  OAI2BB1XL U443 ( .A0N(MODE_r[1]), .A1N(n438), .B0(n398), .Y(n226) );
  NAND2XL U444 ( .A(n436), .B(MODE[1]), .Y(n398) );
  NAND2BXL U445 ( .AN(n479), .B(n454), .Y(n444) );
  AOI22XL U446 ( .A0(n474), .A1(B[3]), .B0(n473), .B1(A[3]), .Y(n443) );
  NAND2XL U447 ( .A(n249), .B(F[5]), .Y(n354) );
  XNOR2XL U448 ( .A(n337), .B(n454), .Y(n356) );
  AOI22XL U449 ( .A0(n474), .A1(B[6]), .B0(n473), .B1(A[6]), .Y(n336) );
  NAND2XL U450 ( .A(n249), .B(F[6]), .Y(n335) );
  INVXL U451 ( .A(n286), .Y(n287) );
  AOI22XL U452 ( .A0(n474), .A1(D[7]), .B0(n473), .B1(C[7]), .Y(n284) );
  NAND2BXL U453 ( .AN(n479), .B(n450), .Y(n291) );
  XNOR2XL U454 ( .A(n450), .B(n479), .Y(n298) );
  XNOR2XL U455 ( .A(n329), .B(n454), .Y(n338) );
  NOR3XL U456 ( .A(n526), .B(n392), .C(n388), .Y(n296) );
  NAND2BXL U457 ( .AN(n479), .B(n466), .Y(n464) );
  NAND2BXL U458 ( .AN(n479), .B(n325), .Y(n320) );
  XNOR2XL U459 ( .A(n331), .B(n466), .Y(n318) );
  NAND2XL U460 ( .A(n303), .B(n452), .Y(n304) );
  AOI22XL U461 ( .A0(n235), .A1(E[8]), .B0(n249), .B1(F[8]), .Y(n303) );
  OAI2BB1XL U462 ( .A0N(n481), .A1N(n483), .B0(n349), .Y(n350) );
  OAI22XL U463 ( .A0(n345), .A1(n344), .B0(n343), .B1(n342), .Y(n352) );
  OAI22XL U464 ( .A0(n509), .A1(n347), .B0(n346), .B1(n506), .Y(n351) );
  INVXL U465 ( .A(n265), .Y(n280) );
  OAI22XL U466 ( .A0(n345), .A1(n343), .B0(n326), .B1(n342), .Y(n278) );
  XNOR2XL U467 ( .A(n450), .B(n333), .Y(n508) );
  AOI22XL U468 ( .A0(n235), .A1(E[12]), .B0(n249), .B1(F[12]), .Y(n393) );
  NAND2X1 U469 ( .A(n342), .B(n275), .Y(n345) );
  XOR2XL U470 ( .A(n274), .B(n325), .Y(n275) );
  XNOR2XL U471 ( .A(n450), .B(n331), .Y(n334) );
  NAND2XL U472 ( .A(n353), .B(n452), .Y(ACC_C[11]) );
  AOI22XL U473 ( .A0(n235), .A1(E[11]), .B0(n249), .B1(F[11]), .Y(n353) );
  XNOR2XL U474 ( .A(n450), .B(n329), .Y(n332) );
  ADDFXL U475 ( .A(n264), .B(n265), .CI(n263), .CO(DP_OP_63J1_122_404_n149), 
        .S(DP_OP_63J1_122_404_n150) );
  NAND2XL U476 ( .A(n246), .B(n452), .Y(n264) );
  OAI2BB1XL U477 ( .A0N(n478), .A1N(n457), .B0(n262), .Y(n263) );
  AOI22XL U478 ( .A0(n235), .A1(E[10]), .B0(n249), .B1(F[10]), .Y(n246) );
  ADDFXL U479 ( .A(n511), .B(n510), .CI(DP_OP_63J1_122_404_n138), .CO(n519), 
        .S(n515) );
  INVXL U480 ( .A(n513), .Y(n511) );
  OAI22XL U481 ( .A0(n509), .A1(n508), .B0(n507), .B1(n506), .Y(n510) );
  OAI211XL U482 ( .A0(n477), .A1(n666), .B0(n476), .C0(n475), .Y(n495) );
  NOR2BXL U483 ( .AN(n479), .B(n478), .Y(n494) );
  OAI22XL U484 ( .A0(n457), .A1(n456), .B0(n455), .B1(n478), .Y(n492) );
  OAI211XL U485 ( .A0(n477), .A1(n667), .B0(n395), .C0(n394), .Y(ACC_C[4]) );
  NOR2BXL U486 ( .AN(n479), .B(n342), .Y(DP_OP_63J1_122_404_n218) );
  OAI22XL U487 ( .A0(n483), .A1(n459), .B0(n481), .B1(n319), .Y(
        DP_OP_63J1_122_404_n232) );
  OAI22XL U488 ( .A0(n483), .A1(n317), .B0(n481), .B1(n348), .Y(
        DP_OP_63J1_122_404_n229) );
  AOI21XL U489 ( .A0(n557), .A1(n503), .B0(n502), .Y(n504) );
  NAND2XL U490 ( .A(n447), .B(n452), .Y(n514) );
  OAI2BB1XL U491 ( .A0N(n506), .A1N(n509), .B0(n451), .Y(n512) );
  AOI22XL U492 ( .A0(n235), .A1(E[14]), .B0(n249), .B1(F[14]), .Y(n447) );
  AOI21XL U493 ( .A0(n517), .A1(n543), .B0(n516), .Y(n531) );
  INVXL U494 ( .A(n549), .Y(n517) );
  NAND2XL U495 ( .A(n550), .B(n543), .Y(n532) );
  NAND2XL U496 ( .A(n519), .B(n518), .Y(n534) );
  NAND2XL U497 ( .A(n497), .B(n496), .Y(n625) );
  INVXL U498 ( .A(n632), .Y(n489) );
  NAND2XL U499 ( .A(DP_OP_63J1_122_404_n184), .B(n498), .Y(n617) );
  NAND2XL U500 ( .A(DP_OP_63J1_122_404_n167), .B(DP_OP_63J1_122_404_n173), .Y(
        n594) );
  NAND2XL U501 ( .A(DP_OP_63J1_122_404_n148), .B(DP_OP_63J1_122_404_n152), .Y(
        n568) );
  NAND2XL U502 ( .A(DP_OP_63J1_122_404_n147), .B(DP_OP_63J1_122_404_n143), .Y(
        n560) );
  NAND2XL U503 ( .A(DP_OP_63J1_122_404_n142), .B(DP_OP_63J1_122_404_n140), .Y(
        n549) );
  INVXL U504 ( .A(n541), .Y(n550) );
  NOR2X1 U505 ( .A(current_state[1]), .B(current_state[0]), .Y(n386) );
  XOR2XL U506 ( .A(n642), .B(n648), .Y(n644) );
  NAND2XL U507 ( .A(n641), .B(n640), .Y(n642) );
  NAND2XL U508 ( .A(n633), .B(n632), .Y(n635) );
  XOR2XL U509 ( .A(n628), .B(n627), .Y(n630) );
  NAND2XL U510 ( .A(n626), .B(n625), .Y(n628) );
  INVXL U511 ( .A(n624), .Y(n626) );
  XNOR2XL U512 ( .A(n620), .B(n619), .Y(n622) );
  NAND2XL U513 ( .A(n618), .B(n617), .Y(n620) );
  XOR2XL U514 ( .A(n613), .B(n612), .Y(n615) );
  NAND2XL U515 ( .A(n611), .B(n610), .Y(n613) );
  XOR2XL U516 ( .A(n605), .B(n604), .Y(n607) );
  NAND2XL U517 ( .A(n603), .B(n602), .Y(n604) );
  XNOR2XL U518 ( .A(n597), .B(n596), .Y(n599) );
  NAND2XL U519 ( .A(n595), .B(n594), .Y(n596) );
  OAI21XL U520 ( .A0(n605), .A1(n601), .B0(n602), .Y(n597) );
  INVXL U521 ( .A(n593), .Y(n595) );
  XNOR2XL U522 ( .A(n588), .B(n587), .Y(n590) );
  NAND2XL U523 ( .A(n586), .B(n585), .Y(n587) );
  NAND2XL U524 ( .A(n579), .B(n578), .Y(n580) );
  AOI21XL U525 ( .A0(n588), .A1(n586), .B0(n576), .Y(n581) );
  INVXL U526 ( .A(n577), .Y(n579) );
  XOR2XL U527 ( .A(n571), .B(n570), .Y(n573) );
  NAND2XL U528 ( .A(n569), .B(n568), .Y(n570) );
  INVXL U529 ( .A(n567), .Y(n569) );
  INVXL U530 ( .A(n439), .Y(n441) );
  AND2XL U531 ( .A(n401), .B(n400), .Y(n409) );
  INVXL U532 ( .A(n409), .Y(n411) );
  AND2XL U533 ( .A(n401), .B(n388), .Y(n433) );
  NAND2XL U534 ( .A(n382), .B(n392), .Y(n446) );
  OAI2BB2XL U535 ( .B0(n671), .B1(n397), .A0N(F[0]), .A1N(n396), .Y(OUT[0]) );
  OAI2BB2XL U536 ( .B0(n669), .B1(n397), .A0N(F[1]), .A1N(n396), .Y(OUT[1]) );
  OAI2BB2XL U537 ( .B0(n666), .B1(n397), .A0N(F[2]), .A1N(n396), .Y(OUT[2]) );
  OAI2BB2XL U538 ( .B0(n668), .B1(n397), .A0N(F[3]), .A1N(n396), .Y(OUT[3]) );
  OAI2BB2XL U539 ( .B0(n667), .B1(n397), .A0N(F[4]), .A1N(n396), .Y(OUT[4]) );
  OAI2BB2XL U540 ( .B0(n670), .B1(n397), .A0N(F[5]), .A1N(n396), .Y(OUT[5]) );
  OAI2BB2XL U541 ( .B0(n665), .B1(n397), .A0N(F[6]), .A1N(n396), .Y(OUT[6]) );
  OAI2BB1XL U542 ( .A0N(n371), .A1N(E[7]), .B0(n369), .Y(OUT[7]) );
  NAND2XL U543 ( .A(n396), .B(F[7]), .Y(n369) );
  OAI2BB1XL U544 ( .A0N(n371), .A1N(E[8]), .B0(n370), .Y(OUT[8]) );
  NAND2XL U545 ( .A(n396), .B(F[8]), .Y(n370) );
  OAI2BB1XL U546 ( .A0N(n371), .A1N(E[9]), .B0(n368), .Y(OUT[9]) );
  NAND2XL U547 ( .A(n396), .B(F[9]), .Y(n368) );
  OAI2BB1XL U548 ( .A0N(n371), .A1N(E[10]), .B0(n364), .Y(OUT[10]) );
  NAND2XL U549 ( .A(n396), .B(F[10]), .Y(n364) );
  OAI2BB1XL U550 ( .A0N(n371), .A1N(E[11]), .B0(n361), .Y(OUT[11]) );
  NAND2XL U551 ( .A(n396), .B(F[11]), .Y(n361) );
  OAI2BB1XL U552 ( .A0N(n371), .A1N(E[12]), .B0(n363), .Y(OUT[12]) );
  NAND2XL U553 ( .A(n396), .B(F[12]), .Y(n363) );
  OAI2BB1XL U554 ( .A0N(n371), .A1N(E[13]), .B0(n366), .Y(OUT[13]) );
  NAND2XL U555 ( .A(n396), .B(F[13]), .Y(n366) );
  OAI2BB1XL U556 ( .A0N(n371), .A1N(E[14]), .B0(n362), .Y(OUT[14]) );
  NAND2XL U557 ( .A(n396), .B(F[14]), .Y(n362) );
  OAI2BB1XL U558 ( .A0N(n371), .A1N(E[15]), .B0(n365), .Y(OUT[15]) );
  NAND2XL U559 ( .A(n396), .B(F[15]), .Y(n365) );
  OAI2BB1XL U560 ( .A0N(n371), .A1N(E[16]), .B0(n367), .Y(OUT[16]) );
  NAND2XL U561 ( .A(n396), .B(F[16]), .Y(n367) );
  OAI2BB1XL U562 ( .A0N(n656), .A1N(n529), .B0(n524), .Y(n162) );
  NAND2XL U563 ( .A(n523), .B(F[15]), .Y(n524) );
  OAI2BB1XL U564 ( .A0N(n523), .A1N(F[13]), .B0(n546), .Y(n166) );
  OAI2BB1XL U565 ( .A0N(n658), .A1N(n529), .B0(n528), .Y(n163) );
  NAND2XL U566 ( .A(n527), .B(E[15]), .Y(n528) );
  OAI2BB1XL U567 ( .A0N(n523), .A1N(F[14]), .B0(n538), .Y(n164) );
  OAI2BB1XL U568 ( .A0N(n527), .A1N(E[13]), .B0(n548), .Y(n167) );
  OAI2BB1XL U569 ( .A0N(n527), .A1N(E[14]), .B0(n540), .Y(n165) );
  OAI2BB1XL U570 ( .A0N(n523), .A1N(F[0]), .B0(n652), .Y(n193) );
  OAI2BB1XL U571 ( .A0N(n523), .A1N(F[1]), .B0(n643), .Y(n190) );
  NAND2XL U572 ( .A(n644), .B(n656), .Y(n643) );
  OAI2BB1XL U573 ( .A0N(n523), .A1N(F[2]), .B0(n636), .Y(n188) );
  NAND2XL U574 ( .A(n637), .B(n656), .Y(n636) );
  OAI2BB1XL U575 ( .A0N(n523), .A1N(F[3]), .B0(n629), .Y(n186) );
  NAND2XL U576 ( .A(n630), .B(n656), .Y(n629) );
  OAI2BB1XL U577 ( .A0N(n523), .A1N(F[4]), .B0(n621), .Y(n184) );
  NAND2XL U578 ( .A(n622), .B(n656), .Y(n621) );
  OAI2BB1XL U579 ( .A0N(n523), .A1N(F[5]), .B0(n614), .Y(n182) );
  NAND2XL U580 ( .A(n615), .B(n656), .Y(n614) );
  OAI2BB1XL U581 ( .A0N(n523), .A1N(F[6]), .B0(n606), .Y(n180) );
  NAND2XL U582 ( .A(n607), .B(n656), .Y(n606) );
  OAI2BB1XL U583 ( .A0N(n523), .A1N(F[7]), .B0(n598), .Y(n178) );
  NAND2XL U584 ( .A(n599), .B(n656), .Y(n598) );
  OAI2BB1XL U585 ( .A0N(n523), .A1N(F[8]), .B0(n589), .Y(n176) );
  NAND2XL U586 ( .A(n590), .B(n656), .Y(n589) );
  OAI2BB1XL U587 ( .A0N(n523), .A1N(F[9]), .B0(n582), .Y(n174) );
  NAND2XL U588 ( .A(n583), .B(n656), .Y(n582) );
  OAI2BB1XL U589 ( .A0N(n523), .A1N(F[10]), .B0(n572), .Y(n172) );
  NAND2XL U590 ( .A(n573), .B(n656), .Y(n572) );
  OAI2BB1XL U591 ( .A0N(n523), .A1N(F[11]), .B0(n564), .Y(n170) );
  OAI2BB1XL U592 ( .A0N(n523), .A1N(F[12]), .B0(n553), .Y(n168) );
  OAI2BB1XL U593 ( .A0N(n523), .A1N(F[16]), .B0(n657), .Y(n160) );
  OAI2BB1XL U594 ( .A0N(n527), .A1N(E[0]), .B0(n650), .Y(n192) );
  OAI2BB1XL U595 ( .A0N(n527), .A1N(E[1]), .B0(n645), .Y(n191) );
  NAND2XL U596 ( .A(n644), .B(n658), .Y(n645) );
  OAI2BB1XL U597 ( .A0N(n527), .A1N(E[2]), .B0(n638), .Y(n189) );
  NAND2XL U598 ( .A(n637), .B(n658), .Y(n638) );
  OAI2BB1XL U599 ( .A0N(n527), .A1N(E[3]), .B0(n631), .Y(n187) );
  NAND2XL U600 ( .A(n630), .B(n658), .Y(n631) );
  OAI2BB1XL U601 ( .A0N(n527), .A1N(E[4]), .B0(n623), .Y(n185) );
  NAND2XL U602 ( .A(n622), .B(n658), .Y(n623) );
  OAI2BB1XL U603 ( .A0N(n527), .A1N(E[5]), .B0(n616), .Y(n183) );
  NAND2XL U604 ( .A(n615), .B(n658), .Y(n616) );
  OAI2BB1XL U605 ( .A0N(n527), .A1N(E[6]), .B0(n608), .Y(n181) );
  NAND2XL U606 ( .A(n607), .B(n658), .Y(n608) );
  OAI2BB1XL U607 ( .A0N(n527), .A1N(E[7]), .B0(n600), .Y(n179) );
  NAND2XL U608 ( .A(n599), .B(n658), .Y(n600) );
  OAI2BB1XL U609 ( .A0N(n527), .A1N(E[8]), .B0(n591), .Y(n177) );
  NAND2XL U610 ( .A(n590), .B(n658), .Y(n591) );
  OAI2BB1XL U611 ( .A0N(n527), .A1N(E[9]), .B0(n584), .Y(n175) );
  NAND2XL U612 ( .A(n583), .B(n658), .Y(n584) );
  OAI2BB1XL U613 ( .A0N(n527), .A1N(E[10]), .B0(n574), .Y(n173) );
  NAND2XL U614 ( .A(n573), .B(n658), .Y(n574) );
  OAI2BB1XL U615 ( .A0N(n527), .A1N(E[11]), .B0(n566), .Y(n171) );
  OAI2BB1XL U616 ( .A0N(n527), .A1N(E[12]), .B0(n555), .Y(n169) );
  OAI2BB1XL U617 ( .A0N(n527), .A1N(E[16]), .B0(n660), .Y(n161) );
  OAI2BB1XL U618 ( .A0N(C[0]), .A1N(n441), .B0(n440), .Y(n194) );
  NAND2XL U619 ( .A(IN[0]), .B(n439), .Y(n440) );
  OAI2BB1XL U620 ( .A0N(C[1]), .A1N(n441), .B0(n432), .Y(n195) );
  NAND2XL U621 ( .A(IN[1]), .B(n439), .Y(n432) );
  OAI2BB1XL U622 ( .A0N(C[2]), .A1N(n441), .B0(n429), .Y(n196) );
  NAND2XL U623 ( .A(IN[2]), .B(n439), .Y(n429) );
  OAI2BB1XL U624 ( .A0N(C[3]), .A1N(n441), .B0(n426), .Y(n197) );
  NAND2XL U625 ( .A(IN[3]), .B(n439), .Y(n426) );
  OAI2BB1XL U626 ( .A0N(C[4]), .A1N(n441), .B0(n423), .Y(n198) );
  NAND2XL U627 ( .A(IN[4]), .B(n439), .Y(n423) );
  OAI2BB1XL U628 ( .A0N(C[5]), .A1N(n441), .B0(n420), .Y(n199) );
  NAND2XL U629 ( .A(IN[5]), .B(n439), .Y(n420) );
  OAI2BB1XL U630 ( .A0N(C[6]), .A1N(n441), .B0(n417), .Y(n200) );
  NAND2XL U631 ( .A(IN[6]), .B(n439), .Y(n417) );
  OAI2BB1XL U632 ( .A0N(C[7]), .A1N(n441), .B0(n414), .Y(n201) );
  NAND2XL U633 ( .A(IN[7]), .B(n439), .Y(n414) );
  OAI2BB1XL U634 ( .A0N(B[0]), .A1N(n411), .B0(n410), .Y(n202) );
  NAND2XL U635 ( .A(IN[0]), .B(n409), .Y(n410) );
  OAI2BB1XL U636 ( .A0N(B[1]), .A1N(n411), .B0(n408), .Y(n203) );
  NAND2XL U637 ( .A(IN[1]), .B(n409), .Y(n408) );
  OAI2BB1XL U638 ( .A0N(B[2]), .A1N(n411), .B0(n407), .Y(n204) );
  NAND2XL U639 ( .A(IN[2]), .B(n409), .Y(n407) );
  OAI2BB1XL U640 ( .A0N(B[3]), .A1N(n411), .B0(n406), .Y(n205) );
  NAND2XL U641 ( .A(IN[3]), .B(n409), .Y(n406) );
  OAI2BB1XL U642 ( .A0N(B[4]), .A1N(n411), .B0(n405), .Y(n206) );
  NAND2XL U643 ( .A(IN[4]), .B(n409), .Y(n405) );
  OAI2BB1XL U644 ( .A0N(B[5]), .A1N(n411), .B0(n404), .Y(n207) );
  NAND2XL U645 ( .A(IN[5]), .B(n409), .Y(n404) );
  OAI2BB1XL U646 ( .A0N(B[6]), .A1N(n411), .B0(n403), .Y(n208) );
  NAND2XL U647 ( .A(IN[6]), .B(n409), .Y(n403) );
  OAI2BB1XL U648 ( .A0N(B[7]), .A1N(n411), .B0(n402), .Y(n209) );
  NAND2XL U649 ( .A(IN[7]), .B(n409), .Y(n402) );
  OAI2BB1XL U650 ( .A0N(D[0]), .A1N(n435), .B0(n434), .Y(n210) );
  NAND2XL U651 ( .A(IN[0]), .B(n433), .Y(n434) );
  OAI2BB1XL U652 ( .A0N(D[1]), .A1N(n435), .B0(n430), .Y(n211) );
  NAND2XL U653 ( .A(IN[1]), .B(n433), .Y(n430) );
  OAI2BB1XL U654 ( .A0N(D[2]), .A1N(n435), .B0(n427), .Y(n212) );
  NAND2XL U655 ( .A(IN[2]), .B(n433), .Y(n427) );
  OAI2BB1XL U656 ( .A0N(D[3]), .A1N(n435), .B0(n424), .Y(n213) );
  NAND2XL U657 ( .A(IN[3]), .B(n433), .Y(n424) );
  OAI2BB1XL U658 ( .A0N(D[4]), .A1N(n435), .B0(n421), .Y(n214) );
  NAND2XL U659 ( .A(IN[4]), .B(n433), .Y(n421) );
  OAI2BB1XL U660 ( .A0N(D[5]), .A1N(n435), .B0(n418), .Y(n215) );
  NAND2XL U661 ( .A(IN[5]), .B(n433), .Y(n418) );
  OAI2BB1XL U662 ( .A0N(D[6]), .A1N(n435), .B0(n415), .Y(n216) );
  NAND2XL U663 ( .A(IN[6]), .B(n433), .Y(n415) );
  OAI2BB1XL U664 ( .A0N(D[7]), .A1N(n435), .B0(n412), .Y(n217) );
  NAND2XL U665 ( .A(IN[7]), .B(n433), .Y(n412) );
  OAI2BB1XL U666 ( .A0N(A[0]), .A1N(n438), .B0(n437), .Y(n218) );
  NAND2XL U667 ( .A(n436), .B(IN[0]), .Y(n437) );
  OAI2BB1XL U668 ( .A0N(A[1]), .A1N(n438), .B0(n431), .Y(n219) );
  NAND2XL U669 ( .A(n436), .B(IN[1]), .Y(n431) );
  OAI2BB1XL U670 ( .A0N(A[2]), .A1N(n438), .B0(n428), .Y(n220) );
  NAND2XL U671 ( .A(n436), .B(IN[2]), .Y(n428) );
  OAI2BB1XL U672 ( .A0N(A[3]), .A1N(n438), .B0(n425), .Y(n221) );
  NAND2XL U673 ( .A(n436), .B(IN[3]), .Y(n425) );
  OAI2BB1XL U674 ( .A0N(A[4]), .A1N(n438), .B0(n422), .Y(n222) );
  NAND2XL U675 ( .A(n436), .B(IN[4]), .Y(n422) );
  OAI2BB1XL U676 ( .A0N(A[5]), .A1N(n438), .B0(n419), .Y(n223) );
  NAND2XL U677 ( .A(n436), .B(IN[5]), .Y(n419) );
  OAI2BB1XL U678 ( .A0N(A[6]), .A1N(n438), .B0(n416), .Y(n224) );
  NAND2XL U679 ( .A(n436), .B(IN[6]), .Y(n416) );
  OAI2BB1XL U680 ( .A0N(A[7]), .A1N(n438), .B0(n413), .Y(n225) );
  NAND2XL U681 ( .A(n436), .B(IN[7]), .Y(n413) );
  MXI2XL U682 ( .A(n400), .B(cnt[0]), .S0(current_state[2]), .Y(n374) );
  AND2XL U683 ( .A(n373), .B(n372), .Y(n375) );
  OAI211XL U684 ( .A0(n392), .A1(n391), .B0(n438), .C0(n390), .Y(n230) );
  OAI2BB1XL U685 ( .A0N(MODE_r[0]), .A1N(n438), .B0(n399), .Y(n232) );
  NAND2XL U686 ( .A(n436), .B(MODE[0]), .Y(n399) );
  INVXL U687 ( .A(n391), .Y(n295) );
  XOR2XL U688 ( .A(n454), .B(n259), .Y(n260) );
  XNOR2XL U689 ( .A(n331), .B(n454), .Y(n307) );
  XNOR2XL U690 ( .A(n333), .B(n466), .Y(n317) );
  XNOR2XL U691 ( .A(n331), .B(n325), .Y(n326) );
  INVXL U692 ( .A(n542), .Y(n516) );
  INVXL U693 ( .A(n585), .Y(n576) );
  ADDFXL U694 ( .A(n514), .B(n513), .CI(n512), .CO(n654), .S(n518) );
  XOR2XL U695 ( .A(n581), .B(n580), .Y(n583) );
  INVXL U696 ( .A(OUT_VALID), .Y(n360) );
  NAND2X2 U697 ( .A(n386), .B(current_state[2]), .Y(n526) );
  NAND2XL U698 ( .A(cnt[0]), .B(cnt[1]), .Y(n245) );
  NOR2X2 U699 ( .A(n663), .B(current_state[2]), .Y(n382) );
  AOI22XL U700 ( .A0(n248), .A1(A[1]), .B0(n249), .B1(B[1]), .Y(n251) );
  AOI22XL U701 ( .A0(n474), .A1(D[1]), .B0(n473), .B1(C[1]), .Y(n250) );
  NAND2XL U702 ( .A(n251), .B(n250), .Y(n252) );
  MX2X1 U703 ( .A(n252), .B(n237), .S0(n235), .Y(n314) );
  AOI22XL U704 ( .A0(n248), .A1(A[2]), .B0(n249), .B1(B[2]), .Y(n254) );
  AOI22XL U705 ( .A0(n474), .A1(D[2]), .B0(n473), .B1(C[2]), .Y(n253) );
  MX2X1 U706 ( .A(n255), .B(n241), .S0(n235), .Y(n259) );
  AOI22XL U707 ( .A0(n248), .A1(A[3]), .B0(n249), .B1(B[3]), .Y(n257) );
  AOI22XL U708 ( .A0(n474), .A1(D[3]), .B0(n473), .B1(C[3]), .Y(n256) );
  NAND2XL U709 ( .A(n257), .B(n256), .Y(n258) );
  NAND2X2 U710 ( .A(n478), .B(n260), .Y(n457) );
  OAI2BB1X1 U711 ( .A0N(cnt[1]), .A1N(n248), .B0(n477), .Y(n381) );
  INVXL U712 ( .A(n267), .Y(n262) );
  OAI22XL U713 ( .A0(n457), .A1(n302), .B0(n267), .B1(n478), .Y(n279) );
  AOI22XL U714 ( .A0(n248), .A1(A[4]), .B0(n249), .B1(B[4]), .Y(n269) );
  AOI22XL U715 ( .A0(n474), .A1(D[4]), .B0(n473), .B1(C[4]), .Y(n268) );
  NAND2XL U716 ( .A(n269), .B(n268), .Y(n270) );
  MX2X1 U717 ( .A(n270), .B(n240), .S0(n235), .Y(n274) );
  AOI22XL U718 ( .A0(n248), .A1(A[5]), .B0(n249), .B1(B[5]), .Y(n272) );
  AOI22XL U719 ( .A0(n474), .A1(D[5]), .B0(n473), .B1(C[5]), .Y(n271) );
  NAND2XL U720 ( .A(n272), .B(n271), .Y(n273) );
  MX2X2 U721 ( .A(n273), .B(n236), .S0(n235), .Y(n325) );
  AOI22XL U722 ( .A0(n248), .A1(A[6]), .B0(n249), .B1(B[6]), .Y(n282) );
  AOI22XL U723 ( .A0(n474), .A1(D[6]), .B0(n473), .B1(C[6]), .Y(n281) );
  NAND2XL U724 ( .A(n282), .B(n281), .Y(n283) );
  MX2X1 U725 ( .A(n283), .B(n243), .S0(n235), .Y(n288) );
  XNOR2X2 U726 ( .A(n288), .B(n325), .Y(n506) );
  AOI22XL U727 ( .A0(n248), .A1(A[7]), .B0(n249), .B1(B[7]), .Y(n285) );
  NAND2XL U728 ( .A(n285), .B(n284), .Y(n286) );
  XOR2X1 U729 ( .A(n450), .B(n288), .Y(n289) );
  NAND2X2 U730 ( .A(n506), .B(n289), .Y(n509) );
  OAI22XL U731 ( .A0(n509), .A1(n292), .B0(n506), .B1(n291), .Y(n301) );
  AOI21XL U732 ( .A0(n296), .A1(C[2]), .B0(n295), .Y(n293) );
  XNOR2XL U733 ( .A(n458), .B(n325), .Y(n323) );
  AOI21XL U734 ( .A0(n296), .A1(C[3]), .B0(n295), .Y(n294) );
  XNOR2XL U735 ( .A(n337), .B(n325), .Y(n344) );
  OAI22X1 U736 ( .A0(n345), .A1(n323), .B0(n344), .B1(n342), .Y(n300) );
  OAI22XL U737 ( .A0(n457), .A1(n307), .B0(n302), .B1(n478), .Y(n305) );
  XNOR2XL U738 ( .A(n305), .B(n304), .Y(DP_OP_63J1_122_404_n164) );
  OAI22XL U739 ( .A0(n457), .A1(n338), .B0(n307), .B1(n478), .Y(n308) );
  ADDHXL U740 ( .A(n309), .B(n308), .CO(DP_OP_63J1_122_404_n170), .S(
        DP_OP_63J1_122_404_n171) );
  XNOR2XL U741 ( .A(n449), .B(n325), .Y(n327) );
  INVXL U742 ( .A(n327), .Y(n310) );
  AOI22XL U743 ( .A0(n248), .A1(A[0]), .B0(n249), .B1(B[0]), .Y(n312) );
  AOI22XL U744 ( .A0(n474), .A1(D[0]), .B0(n473), .B1(C[0]), .Y(n311) );
  NAND2XL U745 ( .A(n312), .B(n311), .Y(n313) );
  XNOR2X1 U746 ( .A(n315), .B(n235), .Y(n481) );
  XOR2X1 U747 ( .A(n315), .B(n466), .Y(n316) );
  INVXL U748 ( .A(n325), .Y(n321) );
  XNOR2XL U749 ( .A(n479), .B(n325), .Y(n322) );
  XNOR2XL U750 ( .A(n467), .B(n325), .Y(n324) );
  XNOR2XL U751 ( .A(n450), .B(n458), .Y(n346) );
  XNOR2XL U752 ( .A(n450), .B(n337), .Y(n330) );
  XNOR2XL U753 ( .A(n333), .B(n325), .Y(n328) );
  NOR2BX1 U754 ( .AN(n479), .B(n506), .Y(n340) );
  ADDFX1 U755 ( .A(n341), .B(n340), .CI(n339), .CO(DP_OP_63J1_122_404_n175), 
        .S(DP_OP_63J1_122_404_n176) );
  INVXL U756 ( .A(n348), .Y(n349) );
  ADDFX1 U757 ( .A(n352), .B(n351), .CI(n350), .CO(DP_OP_63J1_122_404_n161), 
        .S(DP_OP_63J1_122_404_n162) );
  OAI22XL U758 ( .A0(n375), .A1(cnt[0]), .B0(n374), .B1(n664), .Y(n228) );
  NAND2XL U759 ( .A(n673), .B(MODE_r[1]), .Y(n377) );
  NAND2XL U760 ( .A(n392), .B(n664), .Y(n378) );
  OAI21XL U761 ( .A0(n378), .A1(n663), .B0(current_state[2]), .Y(n376) );
  OAI211XL U762 ( .A0(n435), .A1(n377), .B0(n446), .C0(n376), .Y(n231) );
  NAND2XL U763 ( .A(n378), .B(current_state[1]), .Y(n379) );
  OAI211XL U764 ( .A0(n435), .A1(MODE_r[1]), .B0(n380), .C0(n379), .Y(n229) );
  NAND2XL U765 ( .A(n382), .B(n388), .Y(n384) );
  OAI211XL U766 ( .A0(n662), .A1(current_state[0]), .B0(cnt[1]), .C0(
        current_state[2]), .Y(n383) );
  OAI211XL U767 ( .A0(n385), .A1(cnt[1]), .B0(n384), .C0(n383), .Y(n227) );
  NAND2XL U768 ( .A(n388), .B(n673), .Y(n389) );
  AOI22XL U769 ( .A0(n401), .A1(n389), .B0(current_state[2]), .B1(
        current_state[0]), .Y(n390) );
  NAND2XL U770 ( .A(n249), .B(F[3]), .Y(n442) );
  INVXL U771 ( .A(n454), .Y(n445) );
  XNOR2XL U772 ( .A(n450), .B(n449), .Y(n507) );
  NAND2XL U773 ( .A(n558), .B(n503), .Y(n505) );
  XNOR2XL U774 ( .A(n479), .B(n454), .Y(n456) );
  OAI22XL U775 ( .A0(n483), .A1(n480), .B0(n481), .B1(n459), .Y(n491) );
  ADDHXL U776 ( .A(n461), .B(n460), .CO(DP_OP_63J1_122_404_n187), .S(n490) );
  NAND2XL U777 ( .A(n249), .B(F[1]), .Y(n462) );
  INVXL U778 ( .A(n466), .Y(n465) );
  XNOR2XL U779 ( .A(n479), .B(n466), .Y(n468) );
  NAND2XL U780 ( .A(n249), .B(F[0]), .Y(n469) );
  OAI22XL U781 ( .A0(n483), .A1(n482), .B0(n481), .B1(n480), .Y(n493) );
  ADDHXL U782 ( .A(n485), .B(n484), .CO(n487), .S(n472) );
  NAND2XL U783 ( .A(n488), .B(n487), .Y(n632) );
  AOI21XL U784 ( .A0(n634), .A1(n633), .B0(n489), .Y(n627) );
  INVXL U785 ( .A(n617), .Y(n499) );
  AOI21XL U786 ( .A0(n618), .A1(n619), .B0(n499), .Y(n612) );
  OAI21XL U787 ( .A0(n593), .A1(n602), .B0(n594), .Y(n500) );
  AOI21XL U788 ( .A0(n501), .A1(n592), .B0(n500), .Y(n556) );
  NAND2XL U789 ( .A(DP_OP_63J1_122_404_n160), .B(DP_OP_63J1_122_404_n166), .Y(
        n585) );
  NAND2XL U790 ( .A(DP_OP_63J1_122_404_n159), .B(DP_OP_63J1_122_404_n153), .Y(
        n578) );
  OAI21XL U791 ( .A0(n505), .A1(n556), .B0(n504), .Y(n530) );
  INVX1 U792 ( .A(n530), .Y(n552) );
  OAI21XL U793 ( .A0(n552), .A1(n532), .B0(n531), .Y(n537) );
  INVXL U794 ( .A(n533), .Y(n535) );
  XNOR2X1 U795 ( .A(n537), .B(n536), .Y(n539) );
  NAND2XL U796 ( .A(n539), .B(n656), .Y(n538) );
  NAND2XL U797 ( .A(n539), .B(n658), .Y(n540) );
  OAI21XL U798 ( .A0(n552), .A1(n541), .B0(n549), .Y(n545) );
  XNOR2X1 U799 ( .A(n545), .B(n544), .Y(n547) );
  NAND2XL U800 ( .A(n547), .B(n656), .Y(n546) );
  NAND2XL U801 ( .A(n547), .B(n658), .Y(n548) );
  NAND2XL U802 ( .A(n554), .B(n656), .Y(n553) );
  NAND2XL U803 ( .A(n554), .B(n658), .Y(n555) );
  INVX1 U804 ( .A(n556), .Y(n588) );
  AOI21XL U805 ( .A0(n588), .A1(n558), .B0(n557), .Y(n571) );
  OAI21XL U806 ( .A0(n571), .A1(n567), .B0(n568), .Y(n563) );
  INVXL U807 ( .A(n559), .Y(n561) );
  XNOR2XL U808 ( .A(n563), .B(n562), .Y(n565) );
  NAND2XL U809 ( .A(n565), .B(n656), .Y(n564) );
  NAND2XL U810 ( .A(n565), .B(n658), .Y(n566) );
  INVXL U811 ( .A(n601), .Y(n603) );
  INVXL U812 ( .A(n609), .Y(n611) );
  XNOR2XL U813 ( .A(n635), .B(n634), .Y(n637) );
  INVXL U814 ( .A(n639), .Y(n641) );
  NAND2XL U815 ( .A(n651), .B(n658), .Y(n650) );
  NAND2XL U816 ( .A(n651), .B(n656), .Y(n652) );
  ADDFX1 U817 ( .A(n654), .B(n238), .CI(n653), .CO(n655), .S(n529) );
  NAND2XL U818 ( .A(n659), .B(n656), .Y(n657) );
  NAND2XL U819 ( .A(n659), .B(n658), .Y(n660) );
  CMPR42X1 U820 ( .A(DP_OP_63J1_122_404_n206), .B(DP_OP_63J1_122_404_n163), 
        .C(DP_OP_63J1_122_404_n155), .D(DP_OP_63J1_122_404_n161), .ICI(
        DP_OP_63J1_122_404_n158), .S(DP_OP_63J1_122_404_n153), .ICO(
        DP_OP_63J1_122_404_n151), .CO(DP_OP_63J1_122_404_n152) );
  CMPR42X1 U821 ( .A(DP_OP_63J1_122_404_n145), .B(DP_OP_63J1_122_404_n211), 
        .C(DP_OP_63J1_122_404_n204), .D(DP_OP_63J1_122_404_n149), .ICI(
        DP_OP_63J1_122_404_n146), .S(DP_OP_63J1_122_404_n143), .ICO(
        DP_OP_63J1_122_404_n141), .CO(DP_OP_63J1_122_404_n142) );
endmodule

