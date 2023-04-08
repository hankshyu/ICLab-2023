/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03
// Date      : Sun Apr  9 02:23:57 2023
/////////////////////////////////////////////////////////////


module SUBWAY ( clk, rst_n, in_valid, init, in0, in1, in2, in3, out_valid, out
 );
  input [1:0] init;
  input [1:0] in0;
  input [1:0] in1;
  input [1:0] in2;
  input [1:0] in3;
  output [1:0] out;
  input clk, rst_n, in_valid;
  output out_valid;
  wire   next_state_1_, N378, N379, N380, N381, N382, N383, N384, N5382, N5383,
         N5384, N5385, N5386, N5387, N5389, N5390, N5391, n446, n447, n448,
         n449, n450, n451, n452, n453, n454, n455, n456, n457, n458, n459,
         n460, n461, n462, n463, n464, n465, n466, n467, n468, n469, n470,
         n471, n472, n473, n474, n475, n476, n477, n478, n479, n480, n481,
         n482, n483, n484, n485, n486, n487, n488, n489, n490, n491, n492,
         n493, n494, n495, n496, n497, n498, n499, n500, n501, n502, n503,
         n504, n505, n506, n507, n508, n509, n510, n511, n512, n513, n514,
         n515, n516, n517, n518, n519, n520, n521, n522, n523, n524, n525,
         n526, n527, n528, n529, n530, n531, n532, n533, n534, n535, n536,
         n537, n538, n539, n540, n541, n542, n543, n544, n545, n546, n547,
         n548, n549, n550, n551, n552, n553, n554, n555, n556, n557, n558,
         n559, n560, n561, n562, n563, n564, n565, n566, n567, n568, n569,
         n570, n571, n572, n573, n574, n575, n576, n577, n578, n579, n580,
         n581, n582, n583, n584, n585, n586, n587, n588, n589, n590, n591,
         n592, n593, n594, n595, n596, n597, n598, n599, n600, n601, n602,
         n603, n604, n605, n606, n607, n608, n609, n610, n611, n612, n613,
         n614, n615, n616, n617, n618, n619, n620, n621, n622, n623, n624,
         n625, n626, n627, n628, n629, n630, n631, n632, n633, n634, n635,
         n636, n637, n638, n639, n640, n641, n642, n643, n644, n645, n646,
         n647, n648, n649, n650, n651, n652, n653, n654, n655, n656, n657,
         n658, n659, n660, n661, n662, n663, n664, n665, n666, n667, n668,
         n669, n670, n671, n672, n673, n674, n675, n676, n677, n678, n679,
         n680, n681, n682, n683, n684, n685, n686, n687, n688, n689, n690,
         n691, n692, n693, n694, n695, n696, n697, n698, n699, n700, n701,
         n702, n703, n704, n705, n706, n707, n708, n709, n710, n711, n712,
         n713, n714, n715, n716, n717, n718, n719, n720, n721, n722, n723,
         n724, n725, n726, n727, n728, n729, n730, n731, n732, n733, n734,
         n735, n736, n737, n738, n739, n740, n741, n742, n743, n744, n745,
         n746, n747, n748, n749, n750, n751, n752, n753, n754, n755, n756,
         n757, n758, n759, n760, n761, n762, n763, n764, n765, n766, n767,
         n768, n769, n770, n771, n772, n773, n774, n775, n776, n777, n778,
         n779, n780, n781, n782, n783, n784, n785, n786, n787, n788, n789,
         n790, n791, n792, n793, n794, n795, n796, n797, n798, n799, n800,
         n801, n802, n803, n804, n805, n806, n807, n808, n809, n810, n811,
         n812, n813, n814, n815, n816, n817, n818, n819, n820, n821, n822,
         n823, n824, n825, n826, n827, n828, n829, n830, n831, n832, n833,
         n834, n835, n836, n837, n838, n839, n840, n841, n842, n843, n844,
         n845, n846, n847, n848, n849, n850, n851, n852, n853, n854, n855,
         n856, n857, n858, n859, n860, n861, n862, n863, n864, n865, n866,
         n867, n868, n869, n870, n871, n872, n873, n874, n875, n876, n877,
         n878, n879, n880, n881, n882, n883, n884, n885, n886, n887, n888,
         n889, n890, n891, n892, n893, n894, n895, n896, n897, n898, n899,
         n900, n901, n902, n903, n904, n905, n906, n907, n908, n909, n910,
         n911, n912, n913, n914, n915, n916, n917, n918, n919, n920, n921,
         n922, n923, n924, n925, n926, n927, n928, n929, n930, n931, n932,
         n933, n934, n935, n936, n937, n938, n939, n940, n941, n942, n943,
         n944, n945, n946, n947, n948, n949, n950, n951, n952, n953, n954,
         n955, n956, n957, n958, n959, n960, n961, n962, n963, n964, n965,
         n966, n967, n968, n969, n970, n971, n972, n973, n974, n975, n976,
         n977, n978, n979, n980, n981, n982, n983, n984, n985, n986, n987,
         n988, n989, n990, n991, n992, n993, n994, n995, n996, n997, n998,
         n999, n1000, n1001, n1002, n1003, n1004, n1005, n1006, n1007, n1008,
         n1009, n1010, n1011, n1012, n1013, n1014, n1015, n1016, n1017, n1018,
         n1019, n1020, n1021, n1022, n1023, n1024, n1025, n1026, n1027, n1028,
         n1029, n1030, n1031, n1032, n1033, n1034, n1035, n1036, n1037, n1038,
         n1039, n1040, n1041, n1042, n1043, n1044, n1045, n1046, n1047, n1048,
         n1049, n1050, n1051, n1052, n1053, n1054, n1055, n1056, n1057, n1058,
         n1059, n1060, n1061, n1062, n1063, n1064, n1065, n1066, n1067, n1068,
         n1069, n1070, n1071, n1072, n1073, n1074, n1075, n1076, n1077, n1078,
         n1079, n1080, n1081, n1082, n1083, n1084, n1085, n1086, n1087, n1088,
         n1089, n1090, n1091, n1092, n1093, n1094, n1095, n1096, n1097, n1098,
         n1099, n1100, n1101, n1102, n1103;
  wire   [1:0] current_state;
  wire   [6:0] cnt;
  wire   [30:0] map;
  wire   [95:0] answer;
  wire   [1:0] lane;
  wire   [5:0] ans_idx;

  DFFRX1 ans_idx_reg_0_ ( .D(N5382), .CK(clk), .RN(rst_n), .Q(ans_idx[0]), 
        .QN(n1009) );
  DFFRX1 ans_idx_reg_3_ ( .D(N5385), .CK(clk), .RN(rst_n), .Q(ans_idx[3]), 
        .QN(n1017) );
  DFFRX1 ans_idx_reg_1_ ( .D(N5383), .CK(clk), .RN(rst_n), .Q(ans_idx[1]), 
        .QN(n1001) );
  DFFRX1 ans_idx_reg_2_ ( .D(N5384), .CK(clk), .RN(rst_n), .Q(ans_idx[2]), 
        .QN(n1008) );
  DFFRX1 ans_idx_reg_4_ ( .D(N5386), .CK(clk), .RN(rst_n), .Q(ans_idx[4]), 
        .QN(n1076) );
  DFFRX1 ans_idx_reg_5_ ( .D(N5387), .CK(clk), .RN(rst_n), .Q(ans_idx[5]), 
        .QN(n1032) );
  DFFRX1 cnt_reg_0_ ( .D(N378), .CK(clk), .RN(rst_n), .Q(cnt[0]) );
  DFFRX1 answer_reg_50__1_ ( .D(n545), .CK(clk), .RN(rst_n), .Q(answer[9]) );
  DFFRX1 answer_reg_50__0_ ( .D(n546), .CK(clk), .RN(rst_n), .Q(answer[8]) );
  DFFRX1 answer_reg_42__1_ ( .D(n529), .CK(clk), .RN(rst_n), .Q(answer[23]) );
  DFFRX1 answer_reg_42__0_ ( .D(n530), .CK(clk), .RN(rst_n), .Q(answer[22]) );
  DFFRX1 answer_reg_34__1_ ( .D(n513), .CK(clk), .RN(rst_n), .Q(answer[37]) );
  DFFRX1 answer_reg_34__0_ ( .D(n514), .CK(clk), .RN(rst_n), .Q(answer[36]) );
  DFFRX1 answer_reg_26__1_ ( .D(n497), .CK(clk), .RN(rst_n), .Q(answer[51]) );
  DFFRX1 answer_reg_26__0_ ( .D(n498), .CK(clk), .RN(rst_n), .Q(answer[50]) );
  DFFRX1 answer_reg_18__1_ ( .D(n481), .CK(clk), .RN(rst_n), .Q(answer[65]) );
  DFFRX1 answer_reg_18__0_ ( .D(n482), .CK(clk), .RN(rst_n), .Q(answer[64]) );
  DFFRX1 answer_reg_10__1_ ( .D(n465), .CK(clk), .RN(rst_n), .Q(answer[79]) );
  DFFRX1 answer_reg_10__0_ ( .D(n466), .CK(clk), .RN(rst_n), .Q(answer[78]) );
  DFFRX1 answer_reg_2__1_ ( .D(n449), .CK(clk), .RN(rst_n), .Q(answer[93]) );
  DFFRX1 answer_reg_2__0_ ( .D(n450), .CK(clk), .RN(rst_n), .Q(answer[92]) );
  DFFRX1 cnt_reg_1_ ( .D(N379), .CK(clk), .RN(rst_n), .Q(cnt[1]) );
  DFFRX1 cnt_reg_2_ ( .D(N380), .CK(clk), .RN(rst_n), .Q(cnt[2]), .QN(n984) );
  DFFRX1 cnt_reg_3_ ( .D(N381), .CK(clk), .RN(rst_n), .Q(cnt[3]) );
  DFFRX1 cnt_reg_4_ ( .D(N382), .CK(clk), .RN(rst_n), .Q(cnt[4]), .QN(n983) );
  DFFRX1 cnt_reg_5_ ( .D(N383), .CK(clk), .RN(rst_n), .Q(cnt[5]) );
  DFFRX1 cnt_reg_6_ ( .D(N384), .CK(clk), .RN(rst_n), .Q(cnt[6]), .QN(n985) );
  DFFRX1 current_state_reg_1_ ( .D(next_state_1_), .CK(clk), .RN(rst_n), .Q(
        current_state[1]), .QN(n1010) );
  DFFRX1 answer_reg_55__1_ ( .D(n555), .CK(clk), .RN(rst_n), .Q(answer[1]) );
  DFFRX1 answer_reg_55__0_ ( .D(n556), .CK(clk), .RN(rst_n), .Q(answer[0]) );
  DFFRX1 current_state_reg_0_ ( .D(n592), .CK(clk), .RN(rst_n), .Q(
        current_state[0]), .QN(n1075) );
  DFFRX1 answer_reg_35__1_ ( .D(n515), .CK(clk), .RN(rst_n), .QN(n1042) );
  DFFRX1 answer_reg_33__1_ ( .D(n511), .CK(clk), .RN(rst_n), .Q(answer[39]), 
        .QN(n1044) );
  DFFRX1 answer_reg_32__1_ ( .D(n509), .CK(clk), .RN(rst_n), .Q(answer[41]), 
        .QN(n1046) );
  DFFRX1 answer_reg_31__1_ ( .D(n507), .CK(clk), .RN(rst_n), .Q(answer[43]), 
        .QN(n1048) );
  DFFRX1 answer_reg_30__1_ ( .D(n505), .CK(clk), .RN(rst_n), .Q(answer[45]), 
        .QN(n1050) );
  DFFRX1 answer_reg_29__1_ ( .D(n503), .CK(clk), .RN(rst_n), .Q(answer[47]), 
        .QN(n1052) );
  DFFRX1 answer_reg_25__1_ ( .D(n495), .CK(clk), .RN(rst_n), .Q(answer[53]), 
        .QN(n1058) );
  DFFRX1 answer_reg_24__1_ ( .D(n493), .CK(clk), .RN(rst_n), .Q(answer[55]), 
        .QN(n1060) );
  DFFRX1 answer_reg_23__1_ ( .D(n491), .CK(clk), .RN(rst_n), .Q(answer[57]), 
        .QN(n1062) );
  DFFRX1 answer_reg_22__1_ ( .D(n489), .CK(clk), .RN(rst_n), .Q(answer[59]), 
        .QN(n1064) );
  DFFRX1 answer_reg_21__1_ ( .D(n487), .CK(clk), .RN(rst_n), .Q(answer[61]), 
        .QN(n1066) );
  DFFRX1 answer_reg_20__1_ ( .D(n485), .CK(clk), .RN(rst_n), .Q(answer[63]), 
        .QN(n1068) );
  DFFRX1 answer_reg_19__1_ ( .D(n483), .CK(clk), .RN(rst_n), .QN(n1070) );
  DFFRX1 answer_reg_17__1_ ( .D(n479), .CK(clk), .RN(rst_n), .Q(answer[67]), 
        .QN(n1072) );
  DFFRX1 answer_reg_16__1_ ( .D(n477), .CK(clk), .RN(rst_n), .Q(answer[69]), 
        .QN(n1074) );
  DFFRX1 answer_reg_15__1_ ( .D(n475), .CK(clk), .RN(rst_n), .Q(answer[71]), 
        .QN(n1078) );
  DFFRX1 answer_reg_14__1_ ( .D(n473), .CK(clk), .RN(rst_n), .Q(answer[73]), 
        .QN(n1080) );
  DFFRX1 answer_reg_13__1_ ( .D(n471), .CK(clk), .RN(rst_n), .Q(answer[75]), 
        .QN(n1082) );
  DFFRX1 answer_reg_12__1_ ( .D(n469), .CK(clk), .RN(rst_n), .Q(answer[77]), 
        .QN(n1084) );
  DFFRX1 answer_reg_11__1_ ( .D(n467), .CK(clk), .RN(rst_n), .QN(n1086) );
  DFFRX1 answer_reg_9__1_ ( .D(n463), .CK(clk), .RN(rst_n), .Q(answer[81]), 
        .QN(n1088) );
  DFFRX1 answer_reg_8__1_ ( .D(n461), .CK(clk), .RN(rst_n), .Q(answer[83]), 
        .QN(n1090) );
  DFFRX1 answer_reg_7__1_ ( .D(n459), .CK(clk), .RN(rst_n), .Q(answer[85]), 
        .QN(n1092) );
  DFFRX1 answer_reg_6__1_ ( .D(n457), .CK(clk), .RN(rst_n), .Q(answer[87]), 
        .QN(n1094) );
  DFFRX1 answer_reg_5__1_ ( .D(n455), .CK(clk), .RN(rst_n), .Q(answer[89]), 
        .QN(n1096) );
  DFFRX1 answer_reg_4__1_ ( .D(n453), .CK(clk), .RN(rst_n), .Q(answer[91]), 
        .QN(n1098) );
  DFFRX1 answer_reg_3__1_ ( .D(n451), .CK(clk), .RN(rst_n), .QN(n1100) );
  DFFRX1 answer_reg_0__1_ ( .D(n446), .CK(clk), .RN(rst_n), .QN(n1103) );
  DFFRX1 lane_reg_1_ ( .D(n559), .CK(clk), .RN(rst_n), .Q(lane[1]), .QN(n998)
         );
  DFFRX1 lane_reg_0_ ( .D(n558), .CK(clk), .RN(rst_n), .Q(lane[0]), .QN(n999)
         );
  DFFRX1 answer_reg_54__1_ ( .D(n553), .CK(clk), .RN(rst_n), .Q(answer[3]), 
        .QN(n1003) );
  DFFRX1 answer_reg_53__1_ ( .D(n551), .CK(clk), .RN(rst_n), .Q(answer[5]), 
        .QN(n1005) );
  DFFRX1 answer_reg_52__1_ ( .D(n549), .CK(clk), .RN(rst_n), .Q(answer[7]), 
        .QN(n1007) );
  DFFRX1 answer_reg_51__1_ ( .D(n547), .CK(clk), .RN(rst_n), .QN(n1012) );
  DFFRX1 answer_reg_49__1_ ( .D(n543), .CK(clk), .RN(rst_n), .Q(answer[11]), 
        .QN(n1014) );
  DFFRX1 answer_reg_48__1_ ( .D(n541), .CK(clk), .RN(rst_n), .Q(answer[13]), 
        .QN(n1016) );
  DFFRX1 answer_reg_47__1_ ( .D(n539), .CK(clk), .RN(rst_n), .Q(answer[15]), 
        .QN(n1019) );
  DFFRX1 answer_reg_46__1_ ( .D(n537), .CK(clk), .RN(rst_n), .Q(answer[17]), 
        .QN(n1021) );
  DFFRX1 answer_reg_45__1_ ( .D(n535), .CK(clk), .RN(rst_n), .Q(answer[19]), 
        .QN(n1023) );
  DFFRX1 answer_reg_44__1_ ( .D(n533), .CK(clk), .RN(rst_n), .Q(answer[21]), 
        .QN(n1025) );
  DFFRX1 answer_reg_43__1_ ( .D(n531), .CK(clk), .RN(rst_n), .QN(n1027) );
  DFFRX1 answer_reg_41__1_ ( .D(n527), .CK(clk), .RN(rst_n), .Q(answer[25]), 
        .QN(n1029) );
  DFFRX1 answer_reg_40__1_ ( .D(n525), .CK(clk), .RN(rst_n), .Q(answer[27]), 
        .QN(n1031) );
  DFFRX1 answer_reg_39__1_ ( .D(n523), .CK(clk), .RN(rst_n), .Q(answer[29]), 
        .QN(n1034) );
  DFFRX1 answer_reg_38__1_ ( .D(n521), .CK(clk), .RN(rst_n), .Q(answer[31]), 
        .QN(n1036) );
  DFFRX1 answer_reg_37__1_ ( .D(n519), .CK(clk), .RN(rst_n), .Q(answer[33]), 
        .QN(n1038) );
  DFFRX1 answer_reg_36__1_ ( .D(n517), .CK(clk), .RN(rst_n), .Q(answer[35]), 
        .QN(n1040) );
  DFFRX1 answer_reg_28__1_ ( .D(n501), .CK(clk), .RN(rst_n), .Q(answer[49]), 
        .QN(n1054) );
  DFFRX1 answer_reg_27__1_ ( .D(n499), .CK(clk), .RN(rst_n), .QN(n1056) );
  DFFRX1 answer_reg_1__1_ ( .D(n557), .CK(clk), .RN(rst_n), .Q(answer[95]), 
        .QN(n1000) );
  DFFRX1 answer_reg_33__0_ ( .D(n512), .CK(clk), .RN(rst_n), .Q(answer[38]), 
        .QN(n1043) );
  DFFRX1 answer_reg_32__0_ ( .D(n510), .CK(clk), .RN(rst_n), .Q(answer[40]), 
        .QN(n1045) );
  DFFRX1 answer_reg_31__0_ ( .D(n508), .CK(clk), .RN(rst_n), .Q(answer[42]), 
        .QN(n1047) );
  DFFRX1 answer_reg_30__0_ ( .D(n506), .CK(clk), .RN(rst_n), .Q(answer[44]), 
        .QN(n1049) );
  DFFRX1 answer_reg_29__0_ ( .D(n504), .CK(clk), .RN(rst_n), .Q(answer[46]), 
        .QN(n1051) );
  DFFRX1 answer_reg_28__0_ ( .D(n502), .CK(clk), .RN(rst_n), .Q(answer[48]), 
        .QN(n1053) );
  DFFRX1 answer_reg_24__0_ ( .D(n494), .CK(clk), .RN(rst_n), .Q(answer[54]), 
        .QN(n1059) );
  DFFRX1 answer_reg_23__0_ ( .D(n492), .CK(clk), .RN(rst_n), .Q(answer[56]), 
        .QN(n1061) );
  DFFRX1 answer_reg_22__0_ ( .D(n490), .CK(clk), .RN(rst_n), .Q(answer[58]), 
        .QN(n1063) );
  DFFRX1 answer_reg_21__0_ ( .D(n488), .CK(clk), .RN(rst_n), .Q(answer[60]), 
        .QN(n1065) );
  DFFRX1 answer_reg_20__0_ ( .D(n486), .CK(clk), .RN(rst_n), .Q(answer[62]), 
        .QN(n1067) );
  DFFRX1 answer_reg_19__0_ ( .D(n484), .CK(clk), .RN(rst_n), .QN(n1069) );
  DFFRX1 answer_reg_17__0_ ( .D(n480), .CK(clk), .RN(rst_n), .Q(answer[66]), 
        .QN(n1071) );
  DFFRX1 answer_reg_16__0_ ( .D(n478), .CK(clk), .RN(rst_n), .Q(answer[68]), 
        .QN(n1073) );
  DFFRX1 answer_reg_15__0_ ( .D(n476), .CK(clk), .RN(rst_n), .Q(answer[70]), 
        .QN(n1077) );
  DFFRX1 answer_reg_14__0_ ( .D(n474), .CK(clk), .RN(rst_n), .Q(answer[72]), 
        .QN(n1079) );
  DFFRX1 answer_reg_13__0_ ( .D(n472), .CK(clk), .RN(rst_n), .Q(answer[74]), 
        .QN(n1081) );
  DFFRX1 answer_reg_12__0_ ( .D(n470), .CK(clk), .RN(rst_n), .Q(answer[76]), 
        .QN(n1083) );
  DFFRX1 answer_reg_11__0_ ( .D(n468), .CK(clk), .RN(rst_n), .QN(n1085) );
  DFFRX1 answer_reg_9__0_ ( .D(n464), .CK(clk), .RN(rst_n), .Q(answer[80]), 
        .QN(n1087) );
  DFFRX1 answer_reg_8__0_ ( .D(n462), .CK(clk), .RN(rst_n), .Q(answer[82]), 
        .QN(n1089) );
  DFFRX1 answer_reg_7__0_ ( .D(n460), .CK(clk), .RN(rst_n), .Q(answer[84]), 
        .QN(n1091) );
  DFFRX1 answer_reg_6__0_ ( .D(n458), .CK(clk), .RN(rst_n), .Q(answer[86]), 
        .QN(n1093) );
  DFFRX1 answer_reg_5__0_ ( .D(n456), .CK(clk), .RN(rst_n), .Q(answer[88]), 
        .QN(n1095) );
  DFFRX1 answer_reg_4__0_ ( .D(n454), .CK(clk), .RN(rst_n), .Q(answer[90]), 
        .QN(n1097) );
  DFFRX1 answer_reg_3__0_ ( .D(n452), .CK(clk), .RN(rst_n), .QN(n1099) );
  DFFRX1 answer_reg_1__0_ ( .D(n448), .CK(clk), .RN(rst_n), .Q(answer[94]), 
        .QN(n1101) );
  DFFRX1 answer_reg_0__0_ ( .D(n447), .CK(clk), .RN(rst_n), .QN(n1102) );
  DFFRX1 map_reg_3__0__1_ ( .D(n591), .CK(clk), .RN(rst_n), .Q(map[7]) );
  DFFRX1 map_reg_3__3__1_ ( .D(n567), .CK(clk), .RN(rst_n), .Q(map[1]) );
  DFFRX1 map_reg_3__3__0_ ( .D(n563), .CK(clk), .RN(rst_n), .Q(map[0]) );
  DFFRX1 map_reg_3__2__1_ ( .D(n575), .CK(clk), .RN(rst_n), .Q(map[3]) );
  DFFRX1 map_reg_3__2__0_ ( .D(n571), .CK(clk), .RN(rst_n), .Q(map[2]) );
  DFFRX1 map_reg_3__1__1_ ( .D(n583), .CK(clk), .RN(rst_n), .Q(map[5]) );
  DFFRX1 map_reg_3__1__0_ ( .D(n579), .CK(clk), .RN(rst_n), .Q(map[4]) );
  DFFRX1 map_reg_3__0__0_ ( .D(n587), .CK(clk), .RN(rst_n), .Q(map[6]) );
  DFFRX1 map_reg_1__3__1_ ( .D(n565), .CK(clk), .RN(rst_n), .Q(map[17]), .QN(
        n986) );
  DFFRX1 map_reg_1__3__0_ ( .D(n561), .CK(clk), .RN(rst_n), .Q(map[16]), .QN(
        n994) );
  DFFRX1 map_reg_1__2__0_ ( .D(n569), .CK(clk), .RN(rst_n), .Q(map[18]), .QN(
        n997) );
  DFFRX1 map_reg_1__1__0_ ( .D(n577), .CK(clk), .RN(rst_n), .Q(map[20]), .QN(
        n996) );
  DFFRX1 map_reg_1__0__1_ ( .D(n589), .CK(clk), .RN(rst_n), .Q(map[23]), .QN(
        n988) );
  DFFRX1 map_reg_1__0__0_ ( .D(n585), .CK(clk), .RN(rst_n), .Q(map[22]), .QN(
        n987) );
  DFFRX1 map_reg_0__2__1_ ( .D(n572), .CK(clk), .RN(rst_n), .Q(map[26]), .QN(
        n990) );
  DFFRX1 map_reg_0__1__1_ ( .D(n580), .CK(clk), .RN(rst_n), .Q(map[28]), .QN(
        n992) );
  DFFRX1 answer_reg_54__0_ ( .D(n554), .CK(clk), .RN(rst_n), .Q(answer[2]), 
        .QN(n1002) );
  DFFRX1 answer_reg_53__0_ ( .D(n552), .CK(clk), .RN(rst_n), .Q(answer[4]), 
        .QN(n1004) );
  DFFRX1 answer_reg_52__0_ ( .D(n550), .CK(clk), .RN(rst_n), .Q(answer[6]), 
        .QN(n1006) );
  DFFRX1 answer_reg_51__0_ ( .D(n548), .CK(clk), .RN(rst_n), .QN(n1011) );
  DFFRX1 answer_reg_49__0_ ( .D(n544), .CK(clk), .RN(rst_n), .Q(answer[10]), 
        .QN(n1013) );
  DFFRX1 answer_reg_48__0_ ( .D(n542), .CK(clk), .RN(rst_n), .Q(answer[12]), 
        .QN(n1015) );
  DFFRX1 answer_reg_47__0_ ( .D(n540), .CK(clk), .RN(rst_n), .Q(answer[14]), 
        .QN(n1018) );
  DFFRX1 answer_reg_46__0_ ( .D(n538), .CK(clk), .RN(rst_n), .Q(answer[16]), 
        .QN(n1020) );
  DFFRX1 answer_reg_45__0_ ( .D(n536), .CK(clk), .RN(rst_n), .Q(answer[18]), 
        .QN(n1022) );
  DFFRX1 answer_reg_44__0_ ( .D(n534), .CK(clk), .RN(rst_n), .Q(answer[20]), 
        .QN(n1024) );
  DFFRX1 answer_reg_43__0_ ( .D(n532), .CK(clk), .RN(rst_n), .QN(n1026) );
  DFFRX1 answer_reg_41__0_ ( .D(n528), .CK(clk), .RN(rst_n), .Q(answer[24]), 
        .QN(n1028) );
  DFFRX1 answer_reg_40__0_ ( .D(n526), .CK(clk), .RN(rst_n), .Q(answer[26]), 
        .QN(n1030) );
  DFFRX1 answer_reg_39__0_ ( .D(n524), .CK(clk), .RN(rst_n), .Q(answer[28]), 
        .QN(n1033) );
  DFFRX1 answer_reg_38__0_ ( .D(n522), .CK(clk), .RN(rst_n), .Q(answer[30]), 
        .QN(n1035) );
  DFFRX1 answer_reg_37__0_ ( .D(n520), .CK(clk), .RN(rst_n), .Q(answer[32]), 
        .QN(n1037) );
  DFFRX1 answer_reg_36__0_ ( .D(n518), .CK(clk), .RN(rst_n), .Q(answer[34]), 
        .QN(n1039) );
  DFFRX1 answer_reg_35__0_ ( .D(n516), .CK(clk), .RN(rst_n), .QN(n1041) );
  DFFRX1 answer_reg_27__0_ ( .D(n500), .CK(clk), .RN(rst_n), .QN(n1055) );
  DFFRX1 answer_reg_25__0_ ( .D(n496), .CK(clk), .RN(rst_n), .Q(answer[52]), 
        .QN(n1057) );
  DFFRX1 map_reg_0__3__1_ ( .D(n564), .CK(clk), .RN(rst_n), .QN(n995) );
  DFFRX1 map_reg_0__3__0_ ( .D(n560), .CK(clk), .RN(rst_n), .Q(map[24]), .QN(
        n989) );
  DFFRX1 map_reg_0__2__0_ ( .D(n568), .CK(clk), .RN(rst_n), .Q(map[25]), .QN(
        n991) );
  DFFRX1 map_reg_0__1__0_ ( .D(n576), .CK(clk), .RN(rst_n), .Q(map[27]), .QN(
        n993) );
  DFFRX1 map_reg_2__3__1_ ( .D(n566), .CK(clk), .RN(rst_n), .Q(map[9]) );
  DFFRX1 map_reg_2__3__0_ ( .D(n562), .CK(clk), .RN(rst_n), .Q(map[8]) );
  DFFRX1 map_reg_2__2__0_ ( .D(n570), .CK(clk), .RN(rst_n), .Q(map[10]) );
  DFFRX1 map_reg_2__1__0_ ( .D(n578), .CK(clk), .RN(rst_n), .Q(map[12]) );
  DFFRX1 map_reg_2__0__1_ ( .D(n590), .CK(clk), .RN(rst_n), .Q(map[15]) );
  DFFRX1 map_reg_2__0__0_ ( .D(n586), .CK(clk), .RN(rst_n), .Q(map[14]) );
  DFFRX1 map_reg_1__2__1_ ( .D(n573), .CK(clk), .RN(rst_n), .Q(map[19]) );
  DFFRX1 map_reg_1__1__1_ ( .D(n581), .CK(clk), .RN(rst_n), .Q(map[21]) );
  DFFRX1 map_reg_2__2__1_ ( .D(n574), .CK(clk), .RN(rst_n), .Q(map[11]) );
  DFFRX1 map_reg_2__1__1_ ( .D(n582), .CK(clk), .RN(rst_n), .Q(map[13]) );
  DFFRX1 map_reg_0__0__1_ ( .D(n588), .CK(clk), .RN(rst_n), .Q(map[30]) );
  DFFRX1 map_reg_0__0__0_ ( .D(n584), .CK(clk), .RN(rst_n), .Q(map[29]) );
  DFFRHQXL out_reg_0_ ( .D(N5389), .CK(clk), .RN(rst_n), .Q(out[0]) );
  DFFRHQXL out_valid_reg ( .D(N5391), .CK(clk), .RN(rst_n), .Q(out_valid) );
  DFFRHQXL out_reg_1_ ( .D(N5390), .CK(clk), .RN(rst_n), .Q(out[1]) );
  NOR2XL U605 ( .A(map[23]), .B(n996), .Y(n620) );
  NOR2XL U606 ( .A(map[18]), .B(map[19]), .Y(n629) );
  NOR2XL U607 ( .A(map[8]), .B(map[9]), .Y(n627) );
  NOR2XL U608 ( .A(n943), .B(n994), .Y(n650) );
  NOR2XL U609 ( .A(ans_idx[0]), .B(n625), .Y(n687) );
  NOR2XL U610 ( .A(ans_idx[5]), .B(n1017), .Y(n685) );
  NOR2XL U611 ( .A(cnt[0]), .B(n985), .Y(n907) );
  NOR2XL U612 ( .A(current_state[0]), .B(n651), .Y(n752) );
  NOR2XL U613 ( .A(n755), .B(n639), .Y(n945) );
  NOR2XL U614 ( .A(n907), .B(n928), .Y(n932) );
  NOR2XL U615 ( .A(n737), .B(n736), .Y(n899) );
  NOR2XL U616 ( .A(n752), .B(n747), .Y(n863) );
  NOR2XL U617 ( .A(n743), .B(n751), .Y(n881) );
  NOR2XL U618 ( .A(n737), .B(n732), .Y(n896) );
  NOR2XL U619 ( .A(n734), .B(n739), .Y(n763) );
  NOR2XL U620 ( .A(n752), .B(n739), .Y(n841) );
  NOR2XL U621 ( .A(n743), .B(n710), .Y(n832) );
  NOR2XL U622 ( .A(n737), .B(n719), .Y(n817) );
  NOR2XL U623 ( .A(n734), .B(n736), .Y(n835) );
  NOR2XL U624 ( .A(n734), .B(n747), .Y(n769) );
  NOR2XL U625 ( .A(n983), .B(n668), .Y(n674) );
  NOR2XL U626 ( .A(n1001), .B(n1009), .Y(n908) );
  NOR2XL U627 ( .A(n982), .B(n1103), .Y(N5390) );
  NOR2XL U628 ( .A(n593), .B(n1010), .Y(N5387) );
  OAI21X2 U629 ( .A0(n945), .A1(n683), .B0(n758), .Y(n721) );
  NOR2X1 U630 ( .A(n752), .B(n751), .Y(n869) );
  NOR2X1 U631 ( .A(n737), .B(n751), .Y(n890) );
  NOR2X1 U632 ( .A(n737), .B(n739), .Y(n778) );
  NOR2X1 U633 ( .A(n737), .B(n747), .Y(n872) );
  NOR2X1 U634 ( .A(n752), .B(n732), .Y(n654) );
  NOR2X1 U635 ( .A(n752), .B(n710), .Y(n826) );
  NOR2X1 U636 ( .A(n752), .B(n719), .Y(n805) );
  NOR2X1 U637 ( .A(n752), .B(n736), .Y(n772) );
  NOR2X1 U638 ( .A(n743), .B(n736), .Y(n781) );
  NOR2X1 U639 ( .A(n737), .B(n710), .Y(n799) );
  NOR2X1 U640 ( .A(n745), .B(n736), .Y(n775) );
  NOR2X1 U641 ( .A(n743), .B(n747), .Y(n857) );
  NOR2X1 U642 ( .A(n743), .B(n739), .Y(n790) );
  NOR2X1 U643 ( .A(current_state[0]), .B(n691), .Y(n737) );
  NOR2X1 U644 ( .A(n745), .B(n747), .Y(n854) );
  OAI31XL U645 ( .A0(cnt[0]), .A1(cnt[6]), .A2(n906), .B0(n960), .Y(n928) );
  NOR2X1 U646 ( .A(n641), .B(n613), .Y(n646) );
  NOR2X1 U647 ( .A(n745), .B(n710), .Y(n829) );
  NOR2X1 U648 ( .A(n743), .B(n732), .Y(n887) );
  NOR2X1 U649 ( .A(n745), .B(n751), .Y(n878) );
  NOR2X1 U650 ( .A(n743), .B(n719), .Y(n811) );
  NOR2X1 U651 ( .A(n745), .B(n732), .Y(n875) );
  NOR2X1 U652 ( .A(n983), .B(n963), .Y(n669) );
  NOR2X1 U653 ( .A(n1017), .B(n936), .Y(n911) );
  NOR2X1 U654 ( .A(current_state[0]), .B(n699), .Y(n745) );
  NOR2X1 U655 ( .A(current_state[0]), .B(n687), .Y(n741) );
  NOR2X1 U656 ( .A(n984), .B(n963), .Y(n663) );
  NOR2X1 U657 ( .A(current_state[0]), .B(n695), .Y(n743) );
  NOR2X1 U658 ( .A(n966), .B(n1010), .Y(n980) );
  NOR2X1 U659 ( .A(n1009), .B(n625), .Y(n695) );
  NOR2X1 U660 ( .A(n612), .B(n611), .Y(n937) );
  NOR2X1 U661 ( .A(n982), .B(n1102), .Y(N5389) );
  OAI31XL U662 ( .A0(ans_idx[4]), .A1(ans_idx[3]), .A2(n1032), .B0(n1075), .Y(
        n971) );
  NOR2X1 U663 ( .A(lane[1]), .B(lane[0]), .Y(n642) );
  NOR2X1 U664 ( .A(lane[1]), .B(n999), .Y(n611) );
  OAI31XL U665 ( .A0(ans_idx[5]), .A1(ans_idx[3]), .A2(n1076), .B0(n1075), .Y(
        n975) );
  NOR2X1 U666 ( .A(ans_idx[0]), .B(n1010), .Y(N5382) );
  NOR2X1 U667 ( .A(ans_idx[1]), .B(ans_idx[2]), .Y(n622) );
  OAI31XL U668 ( .A0(ans_idx[4]), .A1(ans_idx[5]), .A2(ans_idx[3]), .B0(n1075), 
        .Y(n979) );
  NOR2X1 U669 ( .A(lane[0]), .B(n998), .Y(n612) );
  NOR2X1 U670 ( .A(map[20]), .B(map[21]), .Y(n636) );
  NOR2X1 U671 ( .A(ans_idx[0]), .B(n1008), .Y(n633) );
  NOR2X1 U672 ( .A(current_state[0]), .B(n1010), .Y(n758) );
  AOI22XL U673 ( .A0(map[21]), .A1(n612), .B0(map[23]), .B1(n611), .Y(n613) );
  AOI32XL U674 ( .A0(n646), .A1(n618), .A2(n617), .B0(n616), .B1(n618), .Y(
        n935) );
  INVXL U675 ( .A(n647), .Y(n618) );
  OAI2BB1XL U676 ( .A0N(current_state[1]), .A1N(n961), .B0(n960), .Y(n964) );
  NAND4XL U677 ( .A(n959), .B(n958), .C(n957), .D(n956), .Y(n961) );
  AOI211XL U678 ( .A0(n955), .A1(n954), .B0(n953), .C0(n952), .Y(n956) );
  NAND2XL U679 ( .A(n963), .B(in_valid), .Y(n960) );
  AOI32XL U680 ( .A0(n624), .A1(n959), .A2(n684), .B0(n623), .B1(n959), .Y(
        n759) );
  INVXL U681 ( .A(n955), .Y(n623) );
  AOI22XL U682 ( .A0(n695), .A1(n948), .B0(n691), .B1(n947), .Y(n624) );
  NAND2XL U683 ( .A(n993), .B(n992), .Y(n598) );
  NAND2XL U684 ( .A(n991), .B(n990), .Y(n599) );
  INVXL U685 ( .A(n943), .Y(n608) );
  OR2XL U686 ( .A(n998), .B(n598), .Y(n596) );
  OAI2BB1XL U687 ( .A0N(map[30]), .A1N(n998), .B0(lane[0]), .Y(n595) );
  AOI21XL U688 ( .A0(n988), .A1(n987), .B0(n636), .Y(n594) );
  NAND2XL U689 ( .A(map[22]), .B(n642), .Y(n619) );
  NAND2XL U690 ( .A(n610), .B(n609), .Y(n617) );
  AOI22XL U691 ( .A0(map[23]), .A1(n642), .B0(n608), .B1(map[17]), .Y(n609) );
  AOI22XL U692 ( .A0(map[21]), .A1(n611), .B0(map[19]), .B1(n612), .Y(n610) );
  NOR3XL U693 ( .A(n647), .B(n617), .C(n933), .Y(n640) );
  INVXL U694 ( .A(n936), .Y(n651) );
  NAND2XL U695 ( .A(n995), .B(n989), .Y(n600) );
  NAND2XL U696 ( .A(ans_idx[2]), .B(n1001), .Y(n625) );
  AOI211XL U697 ( .A0(n611), .A1(map[20]), .B0(n650), .C0(n607), .Y(n647) );
  OAI2BB1XL U698 ( .A0N(n612), .A1N(map[18]), .B0(n619), .Y(n607) );
  AOI22XL U699 ( .A0(n642), .A1(map[29]), .B0(map[27]), .B1(n611), .Y(n603) );
  AOI22XL U700 ( .A0(n608), .A1(map[24]), .B0(n612), .B1(map[25]), .Y(n602) );
  NAND2XL U701 ( .A(current_state[1]), .B(n969), .Y(n751) );
  NAND2XL U702 ( .A(n622), .B(n1009), .Y(n933) );
  NAND2XL U703 ( .A(n614), .B(n943), .Y(n934) );
  INVXL U704 ( .A(n695), .Y(n949) );
  AOI211XL U705 ( .A0(n629), .A1(lane[0]), .B0(n628), .C0(lane[1]), .Y(n754)
         );
  AND2XL U706 ( .A(ans_idx[1]), .B(n633), .Y(n699) );
  NAND2XL U707 ( .A(current_state[1]), .B(n979), .Y(n739) );
  NAND2XL U708 ( .A(current_state[1]), .B(n977), .Y(n710) );
  NAND2XL U709 ( .A(current_state[1]), .B(n975), .Y(n719) );
  NAND2XL U710 ( .A(current_state[1]), .B(n973), .Y(n736) );
  AND2XL U711 ( .A(n1075), .B(n933), .Y(n734) );
  AND2XL U712 ( .A(n1075), .B(n684), .Y(n749) );
  NAND2XL U713 ( .A(current_state[1]), .B(n971), .Y(n747) );
  OAI211XL U714 ( .A0(map[14]), .A1(map[8]), .B0(map[10]), .C0(map[12]), .Y(
        n634) );
  NAND2XL U715 ( .A(n642), .B(n627), .Y(n756) );
  OAI21XL U716 ( .A0(n629), .A1(n628), .B0(n597), .Y(n948) );
  OAI22XL U717 ( .A0(n937), .A1(n935), .B0(n620), .B1(n619), .Y(n621) );
  NAND2XL U718 ( .A(current_state[1]), .B(n967), .Y(n732) );
  OAI211XL U719 ( .A0(n617), .A1(n646), .B0(n615), .C0(n614), .Y(n648) );
  NAND3BXL U720 ( .AN(n642), .B(n641), .C(n640), .Y(n951) );
  OAI211XL U721 ( .A0(map[17]), .A1(n997), .B0(n651), .C0(n650), .Y(n950) );
  OAI21XL U722 ( .A0(n636), .A1(n635), .B0(n601), .Y(n644) );
  INVXL U723 ( .A(n601), .Y(n643) );
  NAND2XL U724 ( .A(ans_idx[0]), .B(n622), .Y(n684) );
  INVXL U725 ( .A(n946), .Y(n691) );
  INVXL U726 ( .A(n934), .Y(n653) );
  NOR4XL U727 ( .A(n937), .B(n647), .C(n646), .D(n936), .Y(n953) );
  AOI2BB1XL U728 ( .A0N(n995), .A1N(n943), .B0(n606), .Y(n955) );
  NAND2XL U729 ( .A(n605), .B(n604), .Y(n606) );
  AOI22XL U730 ( .A0(n612), .A1(map[26]), .B0(n611), .B1(map[28]), .Y(n605) );
  AOI22XL U731 ( .A0(n642), .A1(map[30]), .B0(n603), .B1(n602), .Y(n604) );
  OAI22XL U732 ( .A0(map[18]), .A1(map[19]), .B0(map[16]), .B1(map[17]), .Y(
        n635) );
  OAI2BB1XL U733 ( .A0N(n1001), .A1N(n634), .B0(n633), .Y(n755) );
  OAI2BB1XL U734 ( .A0N(n685), .A1N(n1076), .B0(n1075), .Y(n977) );
  NAND2XL U735 ( .A(n1075), .B(n693), .Y(n973) );
  OAI31XL U736 ( .A0(ans_idx[4]), .A1(n1032), .A2(n1017), .B0(n1075), .Y(n969)
         );
  OAI31XL U737 ( .A0(ans_idx[3]), .A1(n1076), .A2(n1032), .B0(n1075), .Y(n967)
         );
  AOI31XL U738 ( .A0(ans_idx[1]), .A1(n1009), .A2(n1008), .B0(current_state[0]), .Y(n966) );
  INVXL U739 ( .A(n932), .Y(n930) );
  INVXL U740 ( .A(n754), .Y(n757) );
  NOR2X1 U741 ( .A(n749), .B(n739), .Y(n796) );
  INVXL U742 ( .A(n899), .Y(n897) );
  NOR2X1 U743 ( .A(n741), .B(n736), .Y(n784) );
  NOR2X1 U744 ( .A(n741), .B(n747), .Y(n902) );
  INVXL U745 ( .A(n854), .Y(n852) );
  INVXL U746 ( .A(n863), .Y(n861) );
  NOR2X1 U747 ( .A(n734), .B(n751), .Y(n860) );
  NOR2X1 U748 ( .A(n749), .B(n751), .Y(n848) );
  INVXL U749 ( .A(n890), .Y(n888) );
  NOR2X1 U750 ( .A(n741), .B(n751), .Y(n851) );
  INVXL U751 ( .A(n869), .Y(n867) );
  NOR2X1 U752 ( .A(n734), .B(n732), .Y(n905) );
  NOR2X1 U753 ( .A(n749), .B(n732), .Y(n893) );
  INVXL U754 ( .A(n896), .Y(n894) );
  NOR2X1 U755 ( .A(n741), .B(n732), .Y(n884) );
  OAI22XL U756 ( .A0(n949), .A1(n644), .B0(n946), .B1(n643), .Y(n940) );
  AND2XL U757 ( .A(n699), .B(n754), .Y(n941) );
  NAND2XL U758 ( .A(lane[1]), .B(lane[0]), .Y(n943) );
  NOR2X1 U759 ( .A(n741), .B(n739), .Y(n793) );
  NOR2X1 U760 ( .A(n745), .B(n739), .Y(n787) );
  NOR2X1 U761 ( .A(n734), .B(n710), .Y(n820) );
  NOR2X1 U762 ( .A(n749), .B(n710), .Y(n838) );
  NOR2X1 U763 ( .A(n741), .B(n710), .Y(n844) );
  NOR2X1 U764 ( .A(n734), .B(n719), .Y(n823) );
  NOR2X1 U765 ( .A(n749), .B(n719), .Y(n802) );
  NOR2X1 U766 ( .A(n741), .B(n719), .Y(n814) );
  NOR2X1 U767 ( .A(n745), .B(n719), .Y(n808) );
  NOR2X1 U768 ( .A(n749), .B(n736), .Y(n866) );
  NOR2X1 U769 ( .A(n749), .B(n747), .Y(n766) );
  AOI2BB1XL U770 ( .A0N(n630), .A1N(n756), .B0(n941), .Y(n957) );
  OAI211XL U771 ( .A0(n653), .A1(n951), .B0(n652), .C0(n950), .Y(n683) );
  AOI22XL U772 ( .A0(n955), .A1(n649), .B0(n953), .B1(n648), .Y(n652) );
  NAND2XL U773 ( .A(n645), .B(n684), .Y(n649) );
  AOI22XL U774 ( .A0(n695), .A1(n644), .B0(n691), .B1(n643), .Y(n645) );
  AOI22XL U775 ( .A0(ans_idx[1]), .A1(n638), .B0(n637), .B1(n1001), .Y(n639)
         );
  AOI211XL U776 ( .A0(n636), .A1(n999), .B0(n998), .C0(n635), .Y(n638) );
  NOR3XL U777 ( .A(map[14]), .B(map[15]), .C(n943), .Y(n637) );
  NOR2X1 U778 ( .A(n984), .B(n662), .Y(n665) );
  INVXL U779 ( .A(n672), .Y(n963) );
  NAND2XL U780 ( .A(n1075), .B(n1010), .Y(n672) );
  NAND2XL U781 ( .A(n1008), .B(n908), .Y(n946) );
  NAND2XL U782 ( .A(ans_idx[2]), .B(n908), .Y(n936) );
  NAND2XL U783 ( .A(current_state[0]), .B(current_state[1]), .Y(n982) );
  AOI2BB2XL U784 ( .B0(n987), .B1(n930), .A0N(n930), .A1N(map[29]), .Y(n584)
         );
  AOI2BB2XL U785 ( .B0(n988), .B1(n930), .A0N(n930), .A1N(map[30]), .Y(n588)
         );
  OAI2BB1XL U786 ( .A0N(map[5]), .A1N(n930), .B0(n917), .Y(n582) );
  NAND2XL U787 ( .A(n932), .B(map[13]), .Y(n917) );
  OAI2BB1XL U788 ( .A0N(map[3]), .A1N(n930), .B0(n922), .Y(n574) );
  NAND2XL U789 ( .A(n932), .B(map[11]), .Y(n922) );
  OAI2BB1XL U790 ( .A0N(n932), .A1N(map[21]), .B0(n918), .Y(n581) );
  NAND2XL U791 ( .A(map[13]), .B(n930), .Y(n918) );
  OAI2BB1XL U792 ( .A0N(n932), .A1N(map[19]), .B0(n923), .Y(n573) );
  NAND2XL U793 ( .A(map[11]), .B(n930), .Y(n923) );
  OAI2BB1XL U794 ( .A0N(n932), .A1N(map[14]), .B0(n915), .Y(n586) );
  NAND2XL U795 ( .A(map[6]), .B(n930), .Y(n915) );
  OAI2BB1XL U796 ( .A0N(n932), .A1N(map[15]), .B0(n913), .Y(n590) );
  NAND2XL U797 ( .A(map[7]), .B(n930), .Y(n913) );
  OAI2BB1XL U798 ( .A0N(n932), .A1N(map[12]), .B0(n920), .Y(n578) );
  NAND2XL U799 ( .A(map[4]), .B(n930), .Y(n920) );
  OAI2BB1XL U800 ( .A0N(n932), .A1N(map[10]), .B0(n925), .Y(n570) );
  NAND2XL U801 ( .A(map[2]), .B(n930), .Y(n925) );
  OAI2BB1XL U802 ( .A0N(n932), .A1N(map[8]), .B0(n931), .Y(n562) );
  NAND2XL U803 ( .A(map[0]), .B(n930), .Y(n931) );
  OAI2BB1XL U804 ( .A0N(n932), .A1N(map[9]), .B0(n927), .Y(n566) );
  NAND2XL U805 ( .A(map[1]), .B(n930), .Y(n927) );
  AOI22XL U806 ( .A0(n932), .A1(n993), .B0(n996), .B1(n930), .Y(n576) );
  AOI22XL U807 ( .A0(n932), .A1(n991), .B0(n997), .B1(n930), .Y(n568) );
  AOI22XL U808 ( .A0(n932), .A1(n989), .B0(n994), .B1(n930), .Y(n560) );
  AOI22XL U809 ( .A0(n932), .A1(n995), .B0(n986), .B1(n930), .Y(n564) );
  AOI32XL U810 ( .A0(n845), .A1(n866), .A2(n865), .B0(n1057), .B1(n864), .Y(
        n496) );
  AOI32XL U811 ( .A0(n845), .A1(n899), .A2(n898), .B0(n1055), .B1(n897), .Y(
        n500) );
  AOI32XL U812 ( .A0(n845), .A1(n872), .A2(n871), .B0(n1041), .B1(n870), .Y(
        n516) );
  AOI32XL U813 ( .A0(n845), .A1(n902), .A2(n901), .B0(n1039), .B1(n900), .Y(
        n518) );
  AOI32XL U814 ( .A0(n845), .A1(n857), .A2(n856), .B0(n1037), .B1(n855), .Y(
        n520) );
  AOI32XL U815 ( .A0(n845), .A1(n854), .A2(n853), .B0(n1035), .B1(n852), .Y(
        n522) );
  AOI32XL U816 ( .A0(n845), .A1(n863), .A2(n862), .B0(n1033), .B1(n861), .Y(
        n524) );
  AOI32XL U817 ( .A0(n845), .A1(n860), .A2(n859), .B0(n1030), .B1(n858), .Y(
        n526) );
  AOI32XL U818 ( .A0(n845), .A1(n848), .A2(n847), .B0(n1028), .B1(n846), .Y(
        n528) );
  AOI32XL U819 ( .A0(n845), .A1(n890), .A2(n889), .B0(n1026), .B1(n888), .Y(
        n532) );
  AOI32XL U820 ( .A0(n845), .A1(n851), .A2(n850), .B0(n1024), .B1(n849), .Y(
        n534) );
  AOI32XL U821 ( .A0(n845), .A1(n881), .A2(n880), .B0(n1022), .B1(n879), .Y(
        n536) );
  AOI32XL U822 ( .A0(n845), .A1(n878), .A2(n877), .B0(n1020), .B1(n876), .Y(
        n538) );
  AOI32XL U823 ( .A0(n845), .A1(n869), .A2(n868), .B0(n1018), .B1(n867), .Y(
        n540) );
  AOI32XL U824 ( .A0(n845), .A1(n905), .A2(n904), .B0(n1015), .B1(n903), .Y(
        n542) );
  AOI32XL U825 ( .A0(n845), .A1(n893), .A2(n892), .B0(n1013), .B1(n891), .Y(
        n544) );
  AOI32XL U826 ( .A0(n845), .A1(n896), .A2(n895), .B0(n1011), .B1(n894), .Y(
        n548) );
  AOI32XL U827 ( .A0(n845), .A1(n884), .A2(n883), .B0(n1006), .B1(n882), .Y(
        n550) );
  AOI32XL U828 ( .A0(n845), .A1(n887), .A2(n886), .B0(n1004), .B1(n885), .Y(
        n552) );
  AOI32XL U829 ( .A0(n845), .A1(n875), .A2(n874), .B0(n1002), .B1(n873), .Y(
        n554) );
  AOI2BB2XL U830 ( .B0(n932), .B1(n992), .A0N(map[21]), .A1N(n932), .Y(n580)
         );
  AOI2BB2XL U831 ( .B0(n932), .B1(n990), .A0N(map[19]), .A1N(n932), .Y(n572)
         );
  AOI2BB2XL U832 ( .B0(n932), .B1(n987), .A0N(map[14]), .A1N(n932), .Y(n585)
         );
  AOI2BB2XL U833 ( .B0(n932), .B1(n988), .A0N(map[15]), .A1N(n932), .Y(n589)
         );
  AOI2BB2XL U834 ( .B0(n932), .B1(n996), .A0N(map[12]), .A1N(n932), .Y(n577)
         );
  AOI2BB2XL U835 ( .B0(n932), .B1(n997), .A0N(map[10]), .A1N(n932), .Y(n569)
         );
  AOI2BB2XL U836 ( .B0(n932), .B1(n994), .A0N(map[8]), .A1N(n932), .Y(n561) );
  AOI2BB2XL U837 ( .B0(n932), .B1(n986), .A0N(map[9]), .A1N(n932), .Y(n565) );
  OAI2BB1XL U838 ( .A0N(n932), .A1N(map[6]), .B0(n914), .Y(n587) );
  NAND2XL U839 ( .A(in0[0]), .B(n928), .Y(n914) );
  OAI2BB1XL U840 ( .A0N(n932), .A1N(map[4]), .B0(n919), .Y(n579) );
  NAND2XL U841 ( .A(in1[0]), .B(n928), .Y(n919) );
  OAI2BB1XL U842 ( .A0N(n932), .A1N(map[5]), .B0(n916), .Y(n583) );
  NAND2XL U843 ( .A(in1[1]), .B(n928), .Y(n916) );
  OAI2BB1XL U844 ( .A0N(n932), .A1N(map[2]), .B0(n924), .Y(n571) );
  NAND2XL U845 ( .A(in2[0]), .B(n928), .Y(n924) );
  OAI2BB1XL U846 ( .A0N(n932), .A1N(map[3]), .B0(n921), .Y(n575) );
  NAND2XL U847 ( .A(in2[1]), .B(n928), .Y(n921) );
  OAI2BB1XL U848 ( .A0N(n932), .A1N(map[0]), .B0(n929), .Y(n563) );
  NAND2XL U849 ( .A(in3[0]), .B(n928), .Y(n929) );
  OAI2BB1XL U850 ( .A0N(n932), .A1N(map[1]), .B0(n926), .Y(n567) );
  NAND2XL U851 ( .A(in3[1]), .B(n928), .Y(n926) );
  OAI2BB1XL U852 ( .A0N(in0[1]), .A1N(n928), .B0(n912), .Y(n591) );
  NAND2XL U853 ( .A(n932), .B(map[7]), .Y(n912) );
  AOI32XL U854 ( .A0(n845), .A1(n763), .A2(n762), .B0(n1102), .B1(n761), .Y(
        n447) );
  AOI32XL U855 ( .A0(n845), .A1(n796), .A2(n795), .B0(n1101), .B1(n794), .Y(
        n448) );
  AOI32XL U856 ( .A0(n845), .A1(n778), .A2(n777), .B0(n1099), .B1(n776), .Y(
        n452) );
  AOI32XL U857 ( .A0(n845), .A1(n793), .A2(n792), .B0(n1097), .B1(n791), .Y(
        n454) );
  AOI32XL U858 ( .A0(n845), .A1(n790), .A2(n789), .B0(n1095), .B1(n788), .Y(
        n456) );
  AOI32XL U859 ( .A0(n845), .A1(n787), .A2(n786), .B0(n1093), .B1(n785), .Y(
        n458) );
  AOI32XL U860 ( .A0(n845), .A1(n841), .A2(n840), .B0(n1091), .B1(n839), .Y(
        n460) );
  AOI32XL U861 ( .A0(n845), .A1(n820), .A2(n819), .B0(n1089), .B1(n818), .Y(
        n462) );
  AOI32XL U862 ( .A0(n845), .A1(n838), .A2(n837), .B0(n1087), .B1(n836), .Y(
        n464) );
  AOI32XL U863 ( .A0(n845), .A1(n799), .A2(n798), .B0(n1085), .B1(n797), .Y(
        n468) );
  AOI32XL U864 ( .A0(n845), .A1(n844), .A2(n843), .B0(n1083), .B1(n842), .Y(
        n470) );
  AOI32XL U865 ( .A0(n845), .A1(n832), .A2(n831), .B0(n1081), .B1(n830), .Y(
        n472) );
  AOI32XL U866 ( .A0(n845), .A1(n829), .A2(n828), .B0(n1079), .B1(n827), .Y(
        n474) );
  AOI32XL U867 ( .A0(n845), .A1(n826), .A2(n825), .B0(n1077), .B1(n824), .Y(
        n476) );
  AOI32XL U868 ( .A0(n845), .A1(n823), .A2(n822), .B0(n1073), .B1(n821), .Y(
        n478) );
  AOI32XL U869 ( .A0(n845), .A1(n802), .A2(n801), .B0(n1071), .B1(n800), .Y(
        n480) );
  AOI32XL U870 ( .A0(n845), .A1(n817), .A2(n816), .B0(n1069), .B1(n815), .Y(
        n484) );
  AOI32XL U871 ( .A0(n845), .A1(n814), .A2(n813), .B0(n1067), .B1(n812), .Y(
        n486) );
  AOI32XL U872 ( .A0(n845), .A1(n811), .A2(n810), .B0(n1065), .B1(n809), .Y(
        n488) );
  AOI32XL U873 ( .A0(n845), .A1(n808), .A2(n807), .B0(n1063), .B1(n806), .Y(
        n490) );
  AOI32XL U874 ( .A0(n845), .A1(n805), .A2(n804), .B0(n1061), .B1(n803), .Y(
        n492) );
  AOI32XL U875 ( .A0(n845), .A1(n835), .A2(n834), .B0(n1059), .B1(n833), .Y(
        n494) );
  AOI32XL U876 ( .A0(n845), .A1(n784), .A2(n783), .B0(n1053), .B1(n782), .Y(
        n502) );
  AOI32XL U877 ( .A0(n845), .A1(n781), .A2(n780), .B0(n1051), .B1(n779), .Y(
        n504) );
  AOI32XL U878 ( .A0(n845), .A1(n775), .A2(n774), .B0(n1049), .B1(n773), .Y(
        n506) );
  AOI32XL U879 ( .A0(n845), .A1(n772), .A2(n771), .B0(n1047), .B1(n770), .Y(
        n508) );
  AOI32XL U880 ( .A0(n845), .A1(n769), .A2(n768), .B0(n1045), .B1(n767), .Y(
        n510) );
  AOI32XL U881 ( .A0(n845), .A1(n766), .A2(n765), .B0(n1043), .B1(n764), .Y(
        n512) );
  AOI32XL U882 ( .A0(n721), .A1(n796), .A2(n740), .B0(n1000), .B1(n794), .Y(
        n557) );
  AOI32XL U883 ( .A0(n721), .A1(n899), .A2(n738), .B0(n1056), .B1(n897), .Y(
        n499) );
  AOI32XL U884 ( .A0(n721), .A1(n784), .A2(n728), .B0(n1054), .B1(n782), .Y(
        n501) );
  AOI32XL U885 ( .A0(n721), .A1(n902), .A2(n742), .B0(n1040), .B1(n900), .Y(
        n517) );
  AOI32XL U886 ( .A0(n721), .A1(n857), .A2(n744), .B0(n1038), .B1(n855), .Y(
        n519) );
  AOI32XL U887 ( .A0(n721), .A1(n854), .A2(n746), .B0(n1036), .B1(n852), .Y(
        n521) );
  AOI32XL U888 ( .A0(n721), .A1(n863), .A2(n748), .B0(n1034), .B1(n861), .Y(
        n523) );
  AOI32XL U889 ( .A0(n721), .A1(n860), .A2(n735), .B0(n1031), .B1(n858), .Y(
        n525) );
  AOI32XL U890 ( .A0(n721), .A1(n848), .A2(n750), .B0(n1029), .B1(n846), .Y(
        n527) );
  AOI32XL U891 ( .A0(n721), .A1(n890), .A2(n724), .B0(n1027), .B1(n888), .Y(
        n531) );
  AOI32XL U892 ( .A0(n721), .A1(n851), .A2(n725), .B0(n1025), .B1(n849), .Y(
        n533) );
  AOI32XL U893 ( .A0(n721), .A1(n881), .A2(n723), .B0(n1023), .B1(n879), .Y(
        n535) );
  AOI32XL U894 ( .A0(n721), .A1(n878), .A2(n727), .B0(n1021), .B1(n876), .Y(
        n537) );
  AOI32XL U895 ( .A0(n721), .A1(n869), .A2(n753), .B0(n1019), .B1(n867), .Y(
        n539) );
  AOI32XL U896 ( .A0(n721), .A1(n905), .A2(n726), .B0(n1016), .B1(n903), .Y(
        n541) );
  AOI32XL U897 ( .A0(n721), .A1(n893), .A2(n722), .B0(n1014), .B1(n891), .Y(
        n543) );
  AOI32XL U898 ( .A0(n721), .A1(n896), .A2(n729), .B0(n1012), .B1(n894), .Y(
        n547) );
  AOI32XL U899 ( .A0(n721), .A1(n884), .A2(n730), .B0(n1007), .B1(n882), .Y(
        n549) );
  AOI32XL U900 ( .A0(n721), .A1(n887), .A2(n731), .B0(n1005), .B1(n885), .Y(
        n551) );
  AOI32XL U901 ( .A0(n721), .A1(n875), .A2(n733), .B0(n1003), .B1(n873), .Y(
        n553) );
  AOI2BB2XL U902 ( .B0(n965), .B1(n964), .A0N(n964), .A1N(lane[0]), .Y(n558)
         );
  AOI22XL U903 ( .A0(current_state[1]), .A1(n999), .B0(n963), .B1(init[0]), 
        .Y(n965) );
  MXI2XL U904 ( .A(n998), .B(n962), .S0(n964), .Y(n559) );
  AOI22XL U905 ( .A0(current_state[1]), .A1(n944), .B0(n963), .B1(init[1]), 
        .Y(n962) );
  AOI32XL U906 ( .A0(n721), .A1(n763), .A2(n709), .B0(n1103), .B1(n761), .Y(
        n446) );
  AOI32XL U907 ( .A0(n721), .A1(n778), .A2(n717), .B0(n1100), .B1(n776), .Y(
        n451) );
  AOI32XL U908 ( .A0(n721), .A1(n793), .A2(n697), .B0(n1098), .B1(n791), .Y(
        n453) );
  AOI32XL U909 ( .A0(n721), .A1(n790), .A2(n698), .B0(n1096), .B1(n788), .Y(
        n455) );
  AOI32XL U910 ( .A0(n721), .A1(n787), .A2(n700), .B0(n1094), .B1(n785), .Y(
        n457) );
  AOI32XL U911 ( .A0(n721), .A1(n841), .A2(n701), .B0(n1092), .B1(n839), .Y(
        n459) );
  AOI32XL U912 ( .A0(n721), .A1(n820), .A2(n702), .B0(n1090), .B1(n818), .Y(
        n461) );
  AOI32XL U913 ( .A0(n721), .A1(n838), .A2(n686), .B0(n1088), .B1(n836), .Y(
        n463) );
  AOI32XL U914 ( .A0(n721), .A1(n799), .A2(n711), .B0(n1086), .B1(n797), .Y(
        n467) );
  AOI32XL U915 ( .A0(n721), .A1(n844), .A2(n688), .B0(n1084), .B1(n842), .Y(
        n469) );
  AOI32XL U916 ( .A0(n721), .A1(n832), .A2(n696), .B0(n1082), .B1(n830), .Y(
        n471) );
  AOI32XL U917 ( .A0(n721), .A1(n829), .A2(n708), .B0(n1080), .B1(n827), .Y(
        n473) );
  AOI32XL U918 ( .A0(n721), .A1(n826), .A2(n689), .B0(n1078), .B1(n824), .Y(
        n475) );
  AOI32XL U919 ( .A0(n721), .A1(n823), .A2(n690), .B0(n1074), .B1(n821), .Y(
        n477) );
  AOI32XL U920 ( .A0(n721), .A1(n802), .A2(n720), .B0(n1072), .B1(n800), .Y(
        n479) );
  AOI32XL U921 ( .A0(n721), .A1(n817), .A2(n718), .B0(n1070), .B1(n815), .Y(
        n483) );
  AOI32XL U922 ( .A0(n721), .A1(n814), .A2(n714), .B0(n1068), .B1(n812), .Y(
        n485) );
  AOI32XL U923 ( .A0(n721), .A1(n811), .A2(n703), .B0(n1066), .B1(n809), .Y(
        n487) );
  AOI32XL U924 ( .A0(n721), .A1(n808), .A2(n704), .B0(n1064), .B1(n806), .Y(
        n489) );
  AOI32XL U925 ( .A0(n721), .A1(n805), .A2(n705), .B0(n1062), .B1(n803), .Y(
        n491) );
  AOI32XL U926 ( .A0(n721), .A1(n835), .A2(n706), .B0(n1060), .B1(n833), .Y(
        n493) );
  AOI32XL U927 ( .A0(n721), .A1(n866), .A2(n707), .B0(n1058), .B1(n864), .Y(
        n495) );
  AOI32XL U928 ( .A0(n721), .A1(n781), .A2(n712), .B0(n1052), .B1(n779), .Y(
        n503) );
  AOI32XL U929 ( .A0(n721), .A1(n775), .A2(n713), .B0(n1050), .B1(n773), .Y(
        n505) );
  AOI32XL U930 ( .A0(n721), .A1(n772), .A2(n694), .B0(n1048), .B1(n770), .Y(
        n507) );
  AOI32XL U931 ( .A0(n721), .A1(n769), .A2(n715), .B0(n1046), .B1(n767), .Y(
        n509) );
  AOI32XL U932 ( .A0(n721), .A1(n766), .A2(n716), .B0(n1044), .B1(n764), .Y(
        n511) );
  AOI32XL U933 ( .A0(n721), .A1(n872), .A2(n692), .B0(n1042), .B1(n870), .Y(
        n515) );
  NAND2XL U934 ( .A(n682), .B(n960), .Y(n592) );
  NOR2X1 U935 ( .A(n677), .B(n676), .Y(n681) );
  INVXL U936 ( .A(n632), .Y(n556) );
  OAI32XL U937 ( .A0(n759), .A1(n655), .A2(n631), .B0(answer[0]), .B1(n654), 
        .Y(n632) );
  OAI32XL U938 ( .A0(n945), .A1(n655), .A2(n683), .B0(answer[1]), .B1(n654), 
        .Y(n656) );
  AOI2BB2XL U939 ( .B0(ans_idx[5]), .B1(n909), .A0N(n936), .A1N(n693), .Y(n593) );
  INVXL U940 ( .A(n648), .Y(n616) );
  INVXL U941 ( .A(n594), .Y(n628) );
  INVXL U942 ( .A(n597), .Y(n947) );
  INVXL U943 ( .A(in_valid), .Y(n906) );
  INVX2 U944 ( .A(n982), .Y(N5391) );
  NAND2XL U945 ( .A(ans_idx[4]), .B(n911), .Y(n909) );
  NAND2XL U946 ( .A(ans_idx[4]), .B(n685), .Y(n693) );
  AOI222XL U947 ( .A0(n596), .A1(n595), .B0(map[29]), .B1(n611), .C0(n599), 
        .C1(n937), .Y(n597) );
  AOI222XL U948 ( .A0(n600), .A1(lane[1]), .B0(n599), .B1(lane[0]), .C0(n598), 
        .C1(n937), .Y(n601) );
  AOI222XL U949 ( .A0(map[20]), .A1(n937), .B0(map[18]), .B1(n611), .C0(n612), 
        .C1(map[16]), .Y(n614) );
  AOI222XL U950 ( .A0(map[20]), .A1(n612), .B0(map[22]), .B1(n611), .C0(
        map[18]), .C1(n937), .Y(n641) );
  INVXL U951 ( .A(n641), .Y(n615) );
  AOI222XL U952 ( .A0(n940), .A1(n955), .B0(n653), .B1(n640), .C0(n621), .C1(
        n651), .Y(n959) );
  INVXL U953 ( .A(n654), .Y(n655) );
  NOR2BXL U954 ( .AN(n687), .B(n634), .Y(n626) );
  INVXL U955 ( .A(n626), .Y(n630) );
  INVXL U956 ( .A(n957), .Y(n631) );
  INVXL U957 ( .A(n656), .Y(n555) );
  NAND2XL U958 ( .A(cnt[0]), .B(n672), .Y(N378) );
  NAND2XL U959 ( .A(cnt[1]), .B(n672), .Y(n657) );
  NAND3XL U960 ( .A(cnt[0]), .B(cnt[1]), .C(n672), .Y(n662) );
  OAI2BB1XL U961 ( .A0N(N378), .A1N(n657), .B0(n662), .Y(n658) );
  INVXL U962 ( .A(n658), .Y(N379) );
  NAND2XL U963 ( .A(n672), .B(cnt[6]), .Y(n660) );
  NAND2XL U964 ( .A(cnt[3]), .B(n665), .Y(n668) );
  NAND2XL U965 ( .A(cnt[5]), .B(n674), .Y(n659) );
  XOR2XL U966 ( .A(n660), .B(n659), .Y(N384) );
  AOI211XL U967 ( .A0(n1001), .A1(n1009), .B0(n908), .C0(n1010), .Y(N5383) );
  AOI211XL U968 ( .A0(n1017), .A1(n936), .B0(n911), .C0(n1010), .Y(N5385) );
  NAND2XL U969 ( .A(n663), .B(n662), .Y(n661) );
  OAI21XL U970 ( .A0(n663), .A1(n662), .B0(n661), .Y(N380) );
  NAND2XL U971 ( .A(n672), .B(cnt[3]), .Y(n666) );
  NAND2XL U972 ( .A(n666), .B(n665), .Y(n664) );
  OAI21XL U973 ( .A0(n666), .A1(n665), .B0(n664), .Y(N381) );
  NAND2XL U974 ( .A(n669), .B(n668), .Y(n667) );
  OAI21XL U975 ( .A0(n669), .A1(n668), .B0(n667), .Y(N382) );
  NAND4XL U976 ( .A(cnt[5]), .B(cnt[4]), .C(cnt[3]), .D(cnt[2]), .Y(n677) );
  NOR4BXL U977 ( .AN(cnt[1]), .B(cnt[0]), .C(n985), .D(n677), .Y(n679) );
  NAND4BXL U978 ( .AN(cnt[3]), .B(cnt[0]), .C(cnt[1]), .D(n983), .Y(n670) );
  NOR4XL U979 ( .A(cnt[5]), .B(cnt[6]), .C(n984), .D(n670), .Y(n678) );
  NAND2XL U980 ( .A(current_state[0]), .B(n678), .Y(n671) );
  AOI22XL U981 ( .A0(n679), .A1(N5391), .B0(n1010), .B1(n671), .Y(
        next_state_1_) );
  NAND2XL U982 ( .A(n672), .B(cnt[5]), .Y(n675) );
  NAND2XL U983 ( .A(n675), .B(n674), .Y(n673) );
  OAI21XL U984 ( .A0(n675), .A1(n674), .B0(n673), .Y(N383) );
  NAND2XL U985 ( .A(cnt[0]), .B(cnt[1]), .Y(n676) );
  AOI221XL U986 ( .A0(current_state[1]), .A1(n679), .B0(n1010), .B1(n678), 
        .C0(n1075), .Y(n680) );
  AOI31XL U987 ( .A0(n758), .A1(n681), .A2(n985), .B0(n680), .Y(n682) );
  NAND2XL U988 ( .A(N5391), .B(answer[79]), .Y(n686) );
  INVXL U989 ( .A(n838), .Y(n836) );
  NAND2XL U990 ( .A(N5391), .B(answer[75]), .Y(n688) );
  INVXL U991 ( .A(n844), .Y(n842) );
  NAND2XL U992 ( .A(N5391), .B(answer[69]), .Y(n689) );
  INVXL U993 ( .A(n826), .Y(n824) );
  NAND2XL U994 ( .A(N5391), .B(answer[67]), .Y(n690) );
  INVXL U995 ( .A(n823), .Y(n821) );
  NAND2XL U996 ( .A(N5391), .B(answer[35]), .Y(n692) );
  INVXL U997 ( .A(n872), .Y(n870) );
  NAND2XL U998 ( .A(N5391), .B(answer[41]), .Y(n694) );
  INVXL U999 ( .A(n772), .Y(n770) );
  NAND2XL U1000 ( .A(N5391), .B(answer[73]), .Y(n696) );
  INVXL U1001 ( .A(n832), .Y(n830) );
  NAND2XL U1002 ( .A(N5391), .B(answer[89]), .Y(n697) );
  INVXL U1003 ( .A(n793), .Y(n791) );
  NAND2XL U1004 ( .A(N5391), .B(answer[87]), .Y(n698) );
  INVXL U1005 ( .A(n790), .Y(n788) );
  NAND2XL U1006 ( .A(N5391), .B(answer[85]), .Y(n700) );
  INVXL U1007 ( .A(n787), .Y(n785) );
  NAND2XL U1008 ( .A(N5391), .B(answer[83]), .Y(n701) );
  INVXL U1009 ( .A(n841), .Y(n839) );
  NAND2XL U1010 ( .A(N5391), .B(answer[81]), .Y(n702) );
  INVXL U1011 ( .A(n820), .Y(n818) );
  NAND2XL U1012 ( .A(N5391), .B(answer[59]), .Y(n703) );
  INVXL U1013 ( .A(n811), .Y(n809) );
  NAND2XL U1014 ( .A(N5391), .B(answer[57]), .Y(n704) );
  INVXL U1015 ( .A(n808), .Y(n806) );
  NAND2XL U1016 ( .A(N5391), .B(answer[55]), .Y(n705) );
  INVXL U1017 ( .A(n805), .Y(n803) );
  NAND2XL U1018 ( .A(N5391), .B(answer[53]), .Y(n706) );
  INVXL U1019 ( .A(n835), .Y(n833) );
  NAND2XL U1020 ( .A(N5391), .B(answer[51]), .Y(n707) );
  INVXL U1021 ( .A(n866), .Y(n864) );
  NAND2XL U1022 ( .A(N5391), .B(answer[71]), .Y(n708) );
  INVXL U1023 ( .A(n829), .Y(n827) );
  NAND2XL U1024 ( .A(N5391), .B(answer[95]), .Y(n709) );
  INVXL U1025 ( .A(n763), .Y(n761) );
  NAND2XL U1026 ( .A(N5391), .B(answer[77]), .Y(n711) );
  INVXL U1027 ( .A(n799), .Y(n797) );
  NAND2XL U1028 ( .A(N5391), .B(answer[45]), .Y(n712) );
  INVXL U1029 ( .A(n781), .Y(n779) );
  NAND2XL U1030 ( .A(N5391), .B(answer[43]), .Y(n713) );
  INVXL U1031 ( .A(n775), .Y(n773) );
  NAND2XL U1032 ( .A(N5391), .B(answer[61]), .Y(n714) );
  INVXL U1033 ( .A(n814), .Y(n812) );
  NAND2XL U1034 ( .A(N5391), .B(answer[39]), .Y(n715) );
  INVXL U1035 ( .A(n769), .Y(n767) );
  NAND2XL U1036 ( .A(N5391), .B(answer[37]), .Y(n716) );
  INVXL U1037 ( .A(n766), .Y(n764) );
  NAND2XL U1038 ( .A(N5391), .B(answer[91]), .Y(n717) );
  INVXL U1039 ( .A(n778), .Y(n776) );
  NAND2XL U1040 ( .A(N5391), .B(answer[63]), .Y(n718) );
  INVXL U1041 ( .A(n817), .Y(n815) );
  NAND2XL U1042 ( .A(N5391), .B(answer[65]), .Y(n720) );
  INVXL U1043 ( .A(n802), .Y(n800) );
  NAND2XL U1044 ( .A(N5391), .B(answer[9]), .Y(n722) );
  INVXL U1045 ( .A(n893), .Y(n891) );
  NAND2XL U1046 ( .A(N5391), .B(answer[17]), .Y(n723) );
  INVXL U1047 ( .A(n881), .Y(n879) );
  NAND2XL U1048 ( .A(N5391), .B(answer[21]), .Y(n724) );
  NAND2XL U1049 ( .A(N5391), .B(answer[19]), .Y(n725) );
  INVXL U1050 ( .A(n851), .Y(n849) );
  NAND2XL U1051 ( .A(N5391), .B(answer[11]), .Y(n726) );
  INVXL U1052 ( .A(n905), .Y(n903) );
  NAND2XL U1053 ( .A(N5391), .B(answer[15]), .Y(n727) );
  INVXL U1054 ( .A(n878), .Y(n876) );
  NAND2XL U1055 ( .A(N5391), .B(answer[47]), .Y(n728) );
  INVXL U1056 ( .A(n784), .Y(n782) );
  NAND2XL U1057 ( .A(N5391), .B(answer[7]), .Y(n729) );
  NAND2XL U1058 ( .A(N5391), .B(answer[5]), .Y(n730) );
  INVXL U1059 ( .A(n884), .Y(n882) );
  NAND2XL U1060 ( .A(N5391), .B(answer[3]), .Y(n731) );
  INVXL U1061 ( .A(n887), .Y(n885) );
  NAND2XL U1062 ( .A(N5391), .B(answer[1]), .Y(n733) );
  INVXL U1063 ( .A(n875), .Y(n873) );
  NAND2XL U1064 ( .A(N5391), .B(answer[25]), .Y(n735) );
  INVXL U1065 ( .A(n860), .Y(n858) );
  NAND2XL U1066 ( .A(N5391), .B(answer[49]), .Y(n738) );
  NAND2XL U1067 ( .A(N5391), .B(answer[93]), .Y(n740) );
  INVXL U1068 ( .A(n796), .Y(n794) );
  NAND2XL U1069 ( .A(N5391), .B(answer[33]), .Y(n742) );
  INVXL U1070 ( .A(n902), .Y(n900) );
  NAND2XL U1071 ( .A(N5391), .B(answer[31]), .Y(n744) );
  INVXL U1072 ( .A(n857), .Y(n855) );
  NAND2XL U1073 ( .A(N5391), .B(answer[29]), .Y(n746) );
  NAND2XL U1074 ( .A(N5391), .B(answer[27]), .Y(n748) );
  NAND2XL U1075 ( .A(N5391), .B(answer[23]), .Y(n750) );
  INVXL U1076 ( .A(n848), .Y(n846) );
  NAND2XL U1077 ( .A(N5391), .B(answer[13]), .Y(n753) );
  AOI221XL U1078 ( .A0(ans_idx[1]), .A1(n757), .B0(n1001), .B1(n756), .C0(n755), .Y(n760) );
  OAI21X2 U1079 ( .A0(n760), .A1(n759), .B0(n758), .Y(n845) );
  NAND2XL U1080 ( .A(N5391), .B(answer[94]), .Y(n762) );
  NAND2XL U1081 ( .A(N5391), .B(answer[36]), .Y(n765) );
  NAND2XL U1082 ( .A(N5391), .B(answer[38]), .Y(n768) );
  NAND2XL U1083 ( .A(N5391), .B(answer[40]), .Y(n771) );
  NAND2XL U1084 ( .A(N5391), .B(answer[42]), .Y(n774) );
  NAND2XL U1085 ( .A(N5391), .B(answer[90]), .Y(n777) );
  NAND2XL U1086 ( .A(N5391), .B(answer[44]), .Y(n780) );
  NAND2XL U1087 ( .A(N5391), .B(answer[46]), .Y(n783) );
  NAND2XL U1088 ( .A(N5391), .B(answer[84]), .Y(n786) );
  NAND2XL U1089 ( .A(N5391), .B(answer[86]), .Y(n789) );
  NAND2XL U1090 ( .A(N5391), .B(answer[88]), .Y(n792) );
  NAND2XL U1091 ( .A(N5391), .B(answer[92]), .Y(n795) );
  NAND2XL U1092 ( .A(N5391), .B(answer[76]), .Y(n798) );
  NAND2XL U1093 ( .A(N5391), .B(answer[64]), .Y(n801) );
  NAND2XL U1094 ( .A(N5391), .B(answer[54]), .Y(n804) );
  NAND2XL U1095 ( .A(N5391), .B(answer[56]), .Y(n807) );
  NAND2XL U1096 ( .A(N5391), .B(answer[58]), .Y(n810) );
  NAND2XL U1097 ( .A(N5391), .B(answer[60]), .Y(n813) );
  NAND2XL U1098 ( .A(N5391), .B(answer[62]), .Y(n816) );
  NAND2XL U1099 ( .A(N5391), .B(answer[80]), .Y(n819) );
  NAND2XL U1100 ( .A(N5391), .B(answer[66]), .Y(n822) );
  NAND2XL U1101 ( .A(N5391), .B(answer[68]), .Y(n825) );
  NAND2XL U1102 ( .A(N5391), .B(answer[70]), .Y(n828) );
  NAND2XL U1103 ( .A(N5391), .B(answer[72]), .Y(n831) );
  NAND2XL U1104 ( .A(N5391), .B(answer[52]), .Y(n834) );
  NAND2XL U1105 ( .A(N5391), .B(answer[78]), .Y(n837) );
  NAND2XL U1106 ( .A(N5391), .B(answer[82]), .Y(n840) );
  NAND2XL U1107 ( .A(N5391), .B(answer[74]), .Y(n843) );
  NAND2XL U1108 ( .A(N5391), .B(answer[22]), .Y(n847) );
  NAND2XL U1109 ( .A(N5391), .B(answer[18]), .Y(n850) );
  NAND2XL U1110 ( .A(N5391), .B(answer[28]), .Y(n853) );
  NAND2XL U1111 ( .A(N5391), .B(answer[30]), .Y(n856) );
  NAND2XL U1112 ( .A(N5391), .B(answer[24]), .Y(n859) );
  NAND2XL U1113 ( .A(N5391), .B(answer[26]), .Y(n862) );
  NAND2XL U1114 ( .A(N5391), .B(answer[50]), .Y(n865) );
  NAND2XL U1115 ( .A(N5391), .B(answer[12]), .Y(n868) );
  NAND2XL U1116 ( .A(N5391), .B(answer[34]), .Y(n871) );
  NAND2XL U1117 ( .A(N5391), .B(answer[0]), .Y(n874) );
  NAND2XL U1118 ( .A(N5391), .B(answer[14]), .Y(n877) );
  NAND2XL U1119 ( .A(N5391), .B(answer[16]), .Y(n880) );
  NAND2XL U1120 ( .A(N5391), .B(answer[4]), .Y(n883) );
  NAND2XL U1121 ( .A(answer[2]), .B(N5391), .Y(n886) );
  NAND2XL U1122 ( .A(N5391), .B(answer[20]), .Y(n889) );
  NAND2XL U1123 ( .A(N5391), .B(answer[8]), .Y(n892) );
  NAND2XL U1124 ( .A(N5391), .B(answer[6]), .Y(n895) );
  NAND2XL U1125 ( .A(N5391), .B(answer[48]), .Y(n898) );
  NAND2XL U1126 ( .A(N5391), .B(answer[32]), .Y(n901) );
  NAND2XL U1127 ( .A(N5391), .B(answer[10]), .Y(n904) );
  AOI221XL U1128 ( .A0(n908), .A1(n946), .B0(n1008), .B1(n946), .C0(n1010), 
        .Y(N5384) );
  NAND2XL U1129 ( .A(n909), .B(current_state[1]), .Y(n910) );
  AOI2BB1XL U1130 ( .A0N(ans_idx[4]), .A1N(n911), .B0(n910), .Y(N5386) );
  OAI22XL U1131 ( .A0(n936), .A1(n935), .B0(n934), .B1(n933), .Y(n939) );
  INVXL U1132 ( .A(n937), .Y(n938) );
  OAI31XL U1133 ( .A0(n941), .A1(n940), .A2(n939), .B0(n938), .Y(n942) );
  NAND2XL U1134 ( .A(n943), .B(n942), .Y(n944) );
  INVXL U1135 ( .A(n945), .Y(n958) );
  OAI22XL U1136 ( .A0(n949), .A1(n948), .B0(n947), .B1(n946), .Y(n954) );
  NAND2XL U1137 ( .A(n951), .B(n950), .Y(n952) );
  NAND2XL U1138 ( .A(n980), .B(n967), .Y(n968) );
  OAI2BB2XL U1139 ( .B0(n982), .B1(n1011), .A0N(answer[8]), .A1N(n968), .Y(
        n546) );
  OAI2BB2XL U1140 ( .B0(n982), .B1(n1012), .A0N(answer[9]), .A1N(n968), .Y(
        n545) );
  NAND2XL U1141 ( .A(n980), .B(n969), .Y(n970) );
  OAI2BB2XL U1142 ( .B0(n982), .B1(n1026), .A0N(answer[22]), .A1N(n970), .Y(
        n530) );
  OAI2BB2XL U1143 ( .B0(n982), .B1(n1027), .A0N(answer[23]), .A1N(n970), .Y(
        n529) );
  NAND2XL U1144 ( .A(n980), .B(n971), .Y(n972) );
  OAI2BB2XL U1145 ( .B0(n982), .B1(n1041), .A0N(answer[36]), .A1N(n972), .Y(
        n514) );
  OAI2BB2XL U1146 ( .B0(n982), .B1(n1042), .A0N(answer[37]), .A1N(n972), .Y(
        n513) );
  NAND2XL U1147 ( .A(n980), .B(n973), .Y(n974) );
  OAI2BB2XL U1148 ( .B0(n982), .B1(n1055), .A0N(answer[50]), .A1N(n974), .Y(
        n498) );
  OAI2BB2XL U1149 ( .B0(n982), .B1(n1056), .A0N(answer[51]), .A1N(n974), .Y(
        n497) );
  NAND2XL U1150 ( .A(n980), .B(n975), .Y(n976) );
  OAI2BB2XL U1151 ( .B0(n982), .B1(n1069), .A0N(answer[64]), .A1N(n976), .Y(
        n482) );
  OAI2BB2XL U1152 ( .B0(n982), .B1(n1070), .A0N(answer[65]), .A1N(n976), .Y(
        n481) );
  NAND2XL U1153 ( .A(n980), .B(n977), .Y(n978) );
  OAI2BB2XL U1154 ( .B0(n982), .B1(n1085), .A0N(answer[78]), .A1N(n978), .Y(
        n466) );
  OAI2BB2XL U1155 ( .B0(n982), .B1(n1086), .A0N(answer[79]), .A1N(n978), .Y(
        n465) );
  NAND2XL U1156 ( .A(n980), .B(n979), .Y(n981) );
  OAI2BB2XL U1157 ( .B0(n982), .B1(n1099), .A0N(answer[92]), .A1N(n981), .Y(
        n450) );
  OAI2BB2XL U1158 ( .B0(n982), .B1(n1100), .A0N(answer[93]), .A1N(n981), .Y(
        n449) );
endmodule

