/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : R-2020.09
// Date      : Mon Mar 13 11:09:51 2023
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
  wire   next_state_1_, N378, N379, N380, N381, N382, N383, N384, N3612, N3613,
         N3614, N3615, N3616, N3617, N3619, N3620, n397, n398, n399, n400,
         n401, n402, n403, n404, n405, n406, n407, n408, n409, n410, n411,
         n412, n413, n414, n415, n416, n417, n418, n419, n420, n421, n422,
         n423, n424, n425, n426, n427, n428, n429, n430, n431, n432, n433,
         n434, n435, n436, n437, n438, n439, n440, n441, n442, n443, n444,
         n445, n446, n447, n448, n449, n450, n451, n452, n453, n454, n455,
         n456, n457, n458, n459, n460, n461, n462, n463, n464, n465, n466,
         n467, n468, n469, n470, n471, n472, n473, n474, n475, n476, n477,
         n478, n479, n480, n481, n482, n483, n484, n485, n486, n487, n488,
         n489, n490, n491, n492, n493, n494, n495, n496, n497, n498, n499,
         n500, n501, n502, n503, n504, n505, n506, n507, n508, n509, n510,
         n511, n512, n513, n514, n515, n516, n517, n518, n519, n520, n521,
         n522, n523, n524, n525, n526, n527, n528, n529, n530, n531, n532,
         n533, n534, n535, n536, n537, n538, n539, n540, n541, n542, n543,
         n544, n545, n546, n547, n548, n549, n550, n551, n552, n553, n554,
         n555, n556, n557, n558, n559, n560, n561, n562, n563, n564, n565,
         n566, n567, n568, n569, n570, n571, n572, n573, n574, n575, n576,
         n577, n578, n579, n580, n581, n582, n583, n584, n585, n586, n587,
         n588, n589, n590, n591, n592, n593, n594, n595, n596, n597, n598,
         n599, n600, n601, n602, n603, n604, n605, n606, n607, n608, n609,
         n610, n611, n612, n613, n614, n615, n616, n617, n618, n619, n620,
         n621, n622, n623, n624, n625, n626, n627, n628, n629, n630, n631,
         n632, n633, n634, n635, n636, n637, n638, n639, n640, n641, n642,
         n643, n644, n645, n646, n647, n648, n649, n650, n651, n652, n653,
         n654, n655, n656, n657, n658, n659, n660, n661, n662, n663, n664,
         n665, n666, n667, n668, n669, n670, n671, n672, n673, n674, n675,
         n676, n677, n678, n679, n680, n681, n682, n683, n684, n685, n686,
         n687, n688, n689, n690, n691, n692, n693, n694, n695, n696, n697,
         n698, n699, n700, n701, n702, n703, n704, n705, n706, n707, n708,
         n709, n710, n711, n712, n713, n714, n715, n716, n717, n718, n719,
         n720, n721, n722, n723, n724, n725, n726, n727, n728, n729, n730,
         n731, n732, n733, n734, n735, n736, n737, n738, n739, n740, n741,
         n742, n743, n744, n745, n746, n747, n748, n749, n750, n751, n752,
         n753, n754, n755, n756, n757, n758, n759, n760, n761, n762, n763,
         n764, n765, n766, n767, n768, n769, n770, n771, n772, n773, n774,
         n775, n776, n777, n778, n779, n780, n781, n782, n783, n784, n785,
         n786, n787, n788, n789, n790, n791, n792, n793, n794, n795, n796,
         n797, n798, n799, n800, n801, n802, n803, n804, n805, n806, n807,
         n808, n809, n810, n811, n812, n813, n814, n815, n816, n817, n818,
         n819, n820, n821, n822, n823, n824, n825, n826, n827, n828, n829,
         n830, n831, n832, n833, n834, n835, n836, n837, n838, n839, n840,
         n841, n842, n843, n844, n845, n846, n847, n848, n849, n850, n851,
         n852, n853, n854, n855, n856, n857, n858, n859, n860, n861, n862,
         n863, n864, n865, n866, n867, n868, n869, n870, n871, n872, n873,
         n874, n875, n876, n877, n878, n879, n880, n881, n882, n883, n884,
         n885, n886, n887, n888, n889, n890, n891, n892, n893, n894, n895,
         n896, n897, n898, n899, n900, n901, n902, n903, n904, n905, n906,
         n907, n908, n909, n910, n911, n912, n913, n914, n915, n916, n917,
         n918, n919, n920, n921, n922, n923, n924, n925, n926, n927, n928,
         n929, n930, n931, n932, n933, n934, n935, n936, n937, n938, n939,
         n940, n941, n942, n943, n944, n945, n946, n947, n948, n949, n950,
         n951, n952, n953, n954, n955, n956, n957, n958, n959, n960, n961,
         n962, n963, n964, n965, n966, n967, n968, n969, n970, n971, n972,
         n973, n974, n975, n976, n977, n978, n979, n980, n981, n982, n983,
         n984, n985, n986, n987, n988, n989, n990, n991, n992, n993, n994,
         n995, n996, n997, n998, n999, n1000, n1001, n1002, n1003, n1004,
         n1005, n1006, n1007, n1008, n1009, n1010, n1011, n1012, n1013, n1014,
         n1015, n1016, n1017, n1018, n1019, n1020, n1021, n1022, n1023, n1024,
         n1025, n1026, n1027, n1028, n1029, n1030, n1031, n1032, n1033, n1034,
         n1035, n1036, n1037, n1038;
  wire   [1:0] current_state;
  wire   [6:0] cnt;
  wire   [31:0] map;
  wire   [95:0] answer;
  wire   [1:0] lane;
  wire   [5:0] ans_idx;

  DFFRX1 ans_idx_reg_0_ ( .D(N3612), .CK(clk), .RN(rst_n), .Q(ans_idx[0]), 
        .QN(n927) );
  DFFRX1 ans_idx_reg_3_ ( .D(N3615), .CK(clk), .RN(rst_n), .Q(ans_idx[3]), 
        .QN(n996) );
  DFFRX1 ans_idx_reg_2_ ( .D(N3614), .CK(clk), .RN(rst_n), .Q(ans_idx[2]), 
        .QN(n936) );
  DFFRX1 cnt_reg_0_ ( .D(N378), .CK(clk), .RN(rst_n), .Q(cnt[0]) );
  DFFRX1 ans_idx_reg_4_ ( .D(N3616), .CK(clk), .RN(rst_n), .Q(ans_idx[4]), 
        .QN(n967) );
  DFFRX1 ans_idx_reg_1_ ( .D(N3613), .CK(clk), .RN(rst_n), .Q(ans_idx[1]), 
        .QN(n942) );
  DFFRX1 ans_idx_reg_5_ ( .D(N3617), .CK(clk), .RN(rst_n), .Q(ans_idx[5]), 
        .QN(n1011) );
  DFFRX1 cnt_reg_1_ ( .D(N379), .CK(clk), .RN(rst_n), .Q(cnt[1]) );
  DFFRX1 cnt_reg_2_ ( .D(N380), .CK(clk), .RN(rst_n), .Q(cnt[2]), .QN(n919) );
  DFFRX1 cnt_reg_3_ ( .D(N381), .CK(clk), .RN(rst_n), .Q(cnt[3]) );
  DFFRX1 cnt_reg_4_ ( .D(N382), .CK(clk), .RN(rst_n), .Q(cnt[4]), .QN(n918) );
  DFFRX1 cnt_reg_5_ ( .D(N383), .CK(clk), .RN(rst_n), .Q(cnt[5]) );
  DFFRX1 cnt_reg_6_ ( .D(N384), .CK(clk), .RN(rst_n), .Q(cnt[6]), .QN(n920) );
  DFFRX1 current_state_reg_1_ ( .D(next_state_1_), .CK(clk), .RN(rst_n), .Q(
        current_state[1]), .QN(n945) );
  DFFRX1 answer_reg_55__1_ ( .D(n506), .CK(clk), .RN(rst_n), .Q(answer[1]) );
  DFFRX1 answer_reg_26__1_ ( .D(n448), .CK(clk), .RN(rst_n), .Q(answer[51]) );
  DFFRX1 answer_reg_26__0_ ( .D(n449), .CK(clk), .RN(rst_n), .Q(answer[50]) );
  DFFRX1 answer_reg_10__1_ ( .D(n416), .CK(clk), .RN(rst_n), .Q(answer[79]) );
  DFFRX1 answer_reg_10__0_ ( .D(n417), .CK(clk), .RN(rst_n), .Q(answer[78]) );
  DFFRX1 answer_reg_42__1_ ( .D(n480), .CK(clk), .RN(rst_n), .Q(answer[23]) );
  DFFRX1 answer_reg_42__0_ ( .D(n481), .CK(clk), .RN(rst_n), .Q(answer[22]) );
  DFFRX1 answer_reg_50__1_ ( .D(n496), .CK(clk), .RN(rst_n), .Q(answer[9]) );
  DFFRX1 answer_reg_50__0_ ( .D(n497), .CK(clk), .RN(rst_n), .Q(answer[8]) );
  DFFRX1 answer_reg_18__1_ ( .D(n432), .CK(clk), .RN(rst_n), .Q(answer[65]) );
  DFFRX1 answer_reg_18__0_ ( .D(n433), .CK(clk), .RN(rst_n), .Q(answer[64]) );
  DFFRX1 answer_reg_2__1_ ( .D(n400), .CK(clk), .RN(rst_n), .Q(answer[93]) );
  DFFRX1 answer_reg_2__0_ ( .D(n401), .CK(clk), .RN(rst_n), .Q(answer[92]) );
  DFFRX1 answer_reg_34__1_ ( .D(n464), .CK(clk), .RN(rst_n), .Q(answer[37]) );
  DFFRX1 answer_reg_34__0_ ( .D(n465), .CK(clk), .RN(rst_n), .Q(answer[36]) );
  DFFRX1 answer_reg_55__0_ ( .D(n507), .CK(clk), .RN(rst_n), .Q(answer[0]) );
  DFFRX1 current_state_reg_0_ ( .D(n543), .CK(clk), .RN(rst_n), .Q(
        current_state[0]), .QN(n950) );
  DFFRX1 answer_reg_54__1_ ( .D(n504), .CK(clk), .RN(rst_n), .Q(answer[3]), 
        .QN(n939) );
  DFFRX1 answer_reg_53__1_ ( .D(n502), .CK(clk), .RN(rst_n), .Q(answer[5]), 
        .QN(n941) );
  DFFRX1 answer_reg_52__1_ ( .D(n500), .CK(clk), .RN(rst_n), .Q(answer[7]), 
        .QN(n944) );
  DFFRX1 answer_reg_51__1_ ( .D(n498), .CK(clk), .RN(rst_n), .QN(n947) );
  DFFRX1 answer_reg_49__1_ ( .D(n494), .CK(clk), .RN(rst_n), .Q(answer[11]), 
        .QN(n949) );
  DFFRX1 answer_reg_48__1_ ( .D(n492), .CK(clk), .RN(rst_n), .Q(answer[13]), 
        .QN(n952) );
  DFFRX1 answer_reg_47__1_ ( .D(n490), .CK(clk), .RN(rst_n), .Q(answer[15]), 
        .QN(n954) );
  DFFRX1 answer_reg_46__1_ ( .D(n488), .CK(clk), .RN(rst_n), .Q(answer[17]), 
        .QN(n956) );
  DFFRX1 answer_reg_45__1_ ( .D(n486), .CK(clk), .RN(rst_n), .Q(answer[19]), 
        .QN(n958) );
  DFFRX1 answer_reg_44__1_ ( .D(n484), .CK(clk), .RN(rst_n), .Q(answer[21]), 
        .QN(n960) );
  DFFRX1 answer_reg_43__1_ ( .D(n482), .CK(clk), .RN(rst_n), .QN(n962) );
  DFFRX1 answer_reg_41__1_ ( .D(n478), .CK(clk), .RN(rst_n), .Q(answer[25]), 
        .QN(n964) );
  DFFRX1 answer_reg_40__1_ ( .D(n476), .CK(clk), .RN(rst_n), .Q(answer[27]), 
        .QN(n966) );
  DFFRX1 answer_reg_39__1_ ( .D(n474), .CK(clk), .RN(rst_n), .Q(answer[29]), 
        .QN(n969) );
  DFFRX1 answer_reg_38__1_ ( .D(n472), .CK(clk), .RN(rst_n), .Q(answer[31]), 
        .QN(n971) );
  DFFRX1 answer_reg_37__1_ ( .D(n470), .CK(clk), .RN(rst_n), .Q(answer[33]), 
        .QN(n973) );
  DFFRX1 answer_reg_36__1_ ( .D(n468), .CK(clk), .RN(rst_n), .Q(answer[35]), 
        .QN(n975) );
  DFFRX1 answer_reg_35__1_ ( .D(n466), .CK(clk), .RN(rst_n), .QN(n977) );
  DFFRX1 answer_reg_33__1_ ( .D(n462), .CK(clk), .RN(rst_n), .Q(answer[39]), 
        .QN(n979) );
  DFFRX1 answer_reg_32__1_ ( .D(n460), .CK(clk), .RN(rst_n), .Q(answer[41]), 
        .QN(n981) );
  DFFRX1 answer_reg_31__1_ ( .D(n458), .CK(clk), .RN(rst_n), .Q(answer[43]), 
        .QN(n983) );
  DFFRX1 answer_reg_30__1_ ( .D(n456), .CK(clk), .RN(rst_n), .Q(answer[45]), 
        .QN(n985) );
  DFFRX1 answer_reg_29__1_ ( .D(n454), .CK(clk), .RN(rst_n), .Q(answer[47]), 
        .QN(n987) );
  DFFRX1 answer_reg_28__1_ ( .D(n452), .CK(clk), .RN(rst_n), .Q(answer[49]), 
        .QN(n989) );
  DFFRX1 answer_reg_27__1_ ( .D(n450), .CK(clk), .RN(rst_n), .QN(n991) );
  DFFRX1 answer_reg_25__1_ ( .D(n446), .CK(clk), .RN(rst_n), .Q(answer[53]), 
        .QN(n993) );
  DFFRX1 answer_reg_24__1_ ( .D(n444), .CK(clk), .RN(rst_n), .Q(answer[55]), 
        .QN(n995) );
  DFFRX1 answer_reg_23__1_ ( .D(n442), .CK(clk), .RN(rst_n), .Q(answer[57]), 
        .QN(n998) );
  DFFRX1 answer_reg_22__1_ ( .D(n440), .CK(clk), .RN(rst_n), .Q(answer[59]), 
        .QN(n1000) );
  DFFRX1 answer_reg_21__1_ ( .D(n438), .CK(clk), .RN(rst_n), .Q(answer[61]), 
        .QN(n1002) );
  DFFRX1 answer_reg_20__1_ ( .D(n436), .CK(clk), .RN(rst_n), .Q(answer[63]), 
        .QN(n1004) );
  DFFRX1 answer_reg_19__1_ ( .D(n434), .CK(clk), .RN(rst_n), .QN(n1006) );
  DFFRX1 answer_reg_17__1_ ( .D(n430), .CK(clk), .RN(rst_n), .Q(answer[67]), 
        .QN(n1008) );
  DFFRX1 answer_reg_16__1_ ( .D(n428), .CK(clk), .RN(rst_n), .Q(answer[69]), 
        .QN(n1010) );
  DFFRX1 answer_reg_15__1_ ( .D(n426), .CK(clk), .RN(rst_n), .Q(answer[71]), 
        .QN(n1013) );
  DFFRX1 answer_reg_14__1_ ( .D(n424), .CK(clk), .RN(rst_n), .Q(answer[73]), 
        .QN(n1015) );
  DFFRX1 answer_reg_13__1_ ( .D(n422), .CK(clk), .RN(rst_n), .Q(answer[75]), 
        .QN(n1017) );
  DFFRX1 answer_reg_12__1_ ( .D(n420), .CK(clk), .RN(rst_n), .Q(answer[77]), 
        .QN(n1019) );
  DFFRX1 answer_reg_11__1_ ( .D(n418), .CK(clk), .RN(rst_n), .QN(n1021) );
  DFFRX1 answer_reg_9__1_ ( .D(n414), .CK(clk), .RN(rst_n), .Q(answer[81]), 
        .QN(n1023) );
  DFFRX1 answer_reg_8__1_ ( .D(n412), .CK(clk), .RN(rst_n), .Q(answer[83]), 
        .QN(n1025) );
  DFFRX1 answer_reg_7__1_ ( .D(n410), .CK(clk), .RN(rst_n), .Q(answer[85]), 
        .QN(n1027) );
  DFFRX1 answer_reg_6__1_ ( .D(n408), .CK(clk), .RN(rst_n), .Q(answer[87]), 
        .QN(n1029) );
  DFFRX1 answer_reg_5__1_ ( .D(n406), .CK(clk), .RN(rst_n), .Q(answer[89]), 
        .QN(n1031) );
  DFFRX1 answer_reg_4__1_ ( .D(n404), .CK(clk), .RN(rst_n), .Q(answer[91]), 
        .QN(n1033) );
  DFFRX1 answer_reg_3__1_ ( .D(n402), .CK(clk), .RN(rst_n), .QN(n1035) );
  DFFRX1 answer_reg_1__1_ ( .D(n508), .CK(clk), .RN(rst_n), .Q(answer[95]), 
        .QN(n937) );
  DFFRX1 answer_reg_0__1_ ( .D(n397), .CK(clk), .RN(rst_n), .QN(n1038) );
  DFFRX1 lane_reg_1_ ( .D(n510), .CK(clk), .RN(rst_n), .Q(lane[1]), .QN(n934)
         );
  DFFRX1 lane_reg_0_ ( .D(n509), .CK(clk), .RN(rst_n), .Q(lane[0]), .QN(n935)
         );
  DFFRX1 answer_reg_54__0_ ( .D(n505), .CK(clk), .RN(rst_n), .Q(answer[2]), 
        .QN(n938) );
  DFFRX1 answer_reg_53__0_ ( .D(n503), .CK(clk), .RN(rst_n), .Q(answer[4]), 
        .QN(n940) );
  DFFRX1 answer_reg_52__0_ ( .D(n501), .CK(clk), .RN(rst_n), .Q(answer[6]), 
        .QN(n943) );
  DFFRX1 answer_reg_51__0_ ( .D(n499), .CK(clk), .RN(rst_n), .QN(n946) );
  DFFRX1 answer_reg_49__0_ ( .D(n495), .CK(clk), .RN(rst_n), .Q(answer[10]), 
        .QN(n948) );
  DFFRX1 answer_reg_48__0_ ( .D(n493), .CK(clk), .RN(rst_n), .Q(answer[12]), 
        .QN(n951) );
  DFFRX1 answer_reg_47__0_ ( .D(n491), .CK(clk), .RN(rst_n), .Q(answer[14]), 
        .QN(n953) );
  DFFRX1 answer_reg_46__0_ ( .D(n489), .CK(clk), .RN(rst_n), .Q(answer[16]), 
        .QN(n955) );
  DFFRX1 answer_reg_45__0_ ( .D(n487), .CK(clk), .RN(rst_n), .Q(answer[18]), 
        .QN(n957) );
  DFFRX1 answer_reg_44__0_ ( .D(n485), .CK(clk), .RN(rst_n), .Q(answer[20]), 
        .QN(n959) );
  DFFRX1 answer_reg_43__0_ ( .D(n483), .CK(clk), .RN(rst_n), .QN(n961) );
  DFFRX1 answer_reg_41__0_ ( .D(n479), .CK(clk), .RN(rst_n), .Q(answer[24]), 
        .QN(n963) );
  DFFRX1 answer_reg_40__0_ ( .D(n477), .CK(clk), .RN(rst_n), .Q(answer[26]), 
        .QN(n965) );
  DFFRX1 answer_reg_39__0_ ( .D(n475), .CK(clk), .RN(rst_n), .Q(answer[28]), 
        .QN(n968) );
  DFFRX1 answer_reg_38__0_ ( .D(n473), .CK(clk), .RN(rst_n), .Q(answer[30]), 
        .QN(n970) );
  DFFRX1 answer_reg_37__0_ ( .D(n471), .CK(clk), .RN(rst_n), .Q(answer[32]), 
        .QN(n972) );
  DFFRX1 answer_reg_36__0_ ( .D(n469), .CK(clk), .RN(rst_n), .Q(answer[34]), 
        .QN(n974) );
  DFFRX1 answer_reg_35__0_ ( .D(n467), .CK(clk), .RN(rst_n), .QN(n976) );
  DFFRX1 answer_reg_33__0_ ( .D(n463), .CK(clk), .RN(rst_n), .Q(answer[38]), 
        .QN(n978) );
  DFFRX1 answer_reg_32__0_ ( .D(n461), .CK(clk), .RN(rst_n), .Q(answer[40]), 
        .QN(n980) );
  DFFRX1 answer_reg_31__0_ ( .D(n459), .CK(clk), .RN(rst_n), .Q(answer[42]), 
        .QN(n982) );
  DFFRX1 answer_reg_30__0_ ( .D(n457), .CK(clk), .RN(rst_n), .Q(answer[44]), 
        .QN(n984) );
  DFFRX1 answer_reg_29__0_ ( .D(n455), .CK(clk), .RN(rst_n), .Q(answer[46]), 
        .QN(n986) );
  DFFRX1 answer_reg_28__0_ ( .D(n453), .CK(clk), .RN(rst_n), .Q(answer[48]), 
        .QN(n988) );
  DFFRX1 answer_reg_27__0_ ( .D(n451), .CK(clk), .RN(rst_n), .QN(n990) );
  DFFRX1 answer_reg_25__0_ ( .D(n447), .CK(clk), .RN(rst_n), .Q(answer[52]), 
        .QN(n992) );
  DFFRX1 answer_reg_24__0_ ( .D(n445), .CK(clk), .RN(rst_n), .Q(answer[54]), 
        .QN(n994) );
  DFFRX1 answer_reg_23__0_ ( .D(n443), .CK(clk), .RN(rst_n), .Q(answer[56]), 
        .QN(n997) );
  DFFRX1 answer_reg_22__0_ ( .D(n441), .CK(clk), .RN(rst_n), .Q(answer[58]), 
        .QN(n999) );
  DFFRX1 answer_reg_21__0_ ( .D(n439), .CK(clk), .RN(rst_n), .Q(answer[60]), 
        .QN(n1001) );
  DFFRX1 answer_reg_20__0_ ( .D(n437), .CK(clk), .RN(rst_n), .Q(answer[62]), 
        .QN(n1003) );
  DFFRX1 answer_reg_19__0_ ( .D(n435), .CK(clk), .RN(rst_n), .QN(n1005) );
  DFFRX1 answer_reg_17__0_ ( .D(n431), .CK(clk), .RN(rst_n), .Q(answer[66]), 
        .QN(n1007) );
  DFFRX1 answer_reg_16__0_ ( .D(n429), .CK(clk), .RN(rst_n), .Q(answer[68]), 
        .QN(n1009) );
  DFFRX1 answer_reg_15__0_ ( .D(n427), .CK(clk), .RN(rst_n), .Q(answer[70]), 
        .QN(n1012) );
  DFFRX1 answer_reg_14__0_ ( .D(n425), .CK(clk), .RN(rst_n), .Q(answer[72]), 
        .QN(n1014) );
  DFFRX1 answer_reg_13__0_ ( .D(n423), .CK(clk), .RN(rst_n), .Q(answer[74]), 
        .QN(n1016) );
  DFFRX1 answer_reg_12__0_ ( .D(n421), .CK(clk), .RN(rst_n), .Q(answer[76]), 
        .QN(n1018) );
  DFFRX1 answer_reg_11__0_ ( .D(n419), .CK(clk), .RN(rst_n), .QN(n1020) );
  DFFRX1 answer_reg_9__0_ ( .D(n415), .CK(clk), .RN(rst_n), .Q(answer[80]), 
        .QN(n1022) );
  DFFRX1 answer_reg_8__0_ ( .D(n413), .CK(clk), .RN(rst_n), .Q(answer[82]), 
        .QN(n1024) );
  DFFRX1 answer_reg_7__0_ ( .D(n411), .CK(clk), .RN(rst_n), .Q(answer[84]), 
        .QN(n1026) );
  DFFRX1 answer_reg_6__0_ ( .D(n409), .CK(clk), .RN(rst_n), .Q(answer[86]), 
        .QN(n1028) );
  DFFRX1 answer_reg_5__0_ ( .D(n407), .CK(clk), .RN(rst_n), .Q(answer[88]), 
        .QN(n1030) );
  DFFRX1 answer_reg_4__0_ ( .D(n405), .CK(clk), .RN(rst_n), .Q(answer[90]), 
        .QN(n1032) );
  DFFRX1 answer_reg_3__0_ ( .D(n403), .CK(clk), .RN(rst_n), .QN(n1034) );
  DFFRX1 answer_reg_1__0_ ( .D(n399), .CK(clk), .RN(rst_n), .Q(answer[94]), 
        .QN(n1036) );
  DFFRX1 answer_reg_0__0_ ( .D(n398), .CK(clk), .RN(rst_n), .QN(n1037) );
  DFFRX1 map_reg_3__3__1_ ( .D(n518), .CK(clk), .RN(rst_n), .Q(map[1]) );
  DFFRX1 map_reg_3__3__0_ ( .D(n514), .CK(clk), .RN(rst_n), .Q(map[0]) );
  DFFRX1 map_reg_3__2__1_ ( .D(n526), .CK(clk), .RN(rst_n), .Q(map[3]) );
  DFFRX1 map_reg_3__2__0_ ( .D(n522), .CK(clk), .RN(rst_n), .Q(map[2]) );
  DFFRX1 map_reg_3__1__1_ ( .D(n534), .CK(clk), .RN(rst_n), .Q(map[5]) );
  DFFRX1 map_reg_3__1__0_ ( .D(n530), .CK(clk), .RN(rst_n), .Q(map[4]) );
  DFFRX1 map_reg_3__0__0_ ( .D(n538), .CK(clk), .RN(rst_n), .Q(map[6]) );
  DFFRX1 map_reg_1__1__0_ ( .D(n528), .CK(clk), .RN(rst_n), .Q(map[20]), .QN(
        n926) );
  DFFRX1 map_reg_1__3__0_ ( .D(n512), .CK(clk), .RN(rst_n), .Q(map[16]), .QN(
        n929) );
  DFFRX1 map_reg_1__0__1_ ( .D(n540), .CK(clk), .RN(rst_n), .Q(map[23]), .QN(
        n932) );
  DFFRX1 map_reg_1__0__0_ ( .D(n536), .CK(clk), .RN(rst_n), .Q(map[22]), .QN(
        n923) );
  DFFRX1 map_reg_0__2__1_ ( .D(n523), .CK(clk), .RN(rst_n), .Q(map[27]), .QN(
        n931) );
  DFFRX1 map_reg_3__0__1_ ( .D(n542), .CK(clk), .RN(rst_n), .Q(map[7]) );
  DFFRX1 map_reg_2__3__1_ ( .D(n517), .CK(clk), .RN(rst_n), .Q(map[9]) );
  DFFRX1 map_reg_2__3__0_ ( .D(n513), .CK(clk), .RN(rst_n), .Q(map[8]), .QN(
        n924) );
  DFFRX1 map_reg_2__2__0_ ( .D(n521), .CK(clk), .RN(rst_n), .Q(map[10]) );
  DFFRX1 map_reg_2__1__0_ ( .D(n529), .CK(clk), .RN(rst_n), .Q(map[12]) );
  DFFRX1 map_reg_2__0__1_ ( .D(n541), .CK(clk), .RN(rst_n), .Q(map[15]), .QN(
        n921) );
  DFFRX1 map_reg_2__0__0_ ( .D(n537), .CK(clk), .RN(rst_n), .Q(map[14]), .QN(
        n922) );
  DFFRX1 map_reg_1__2__1_ ( .D(n524), .CK(clk), .RN(rst_n), .Q(map[19]), .QN(
        n930) );
  DFFRX1 map_reg_1__1__1_ ( .D(n532), .CK(clk), .RN(rst_n), .Q(map[21]), .QN(
        n925) );
  DFFRX1 map_reg_1__3__1_ ( .D(n516), .CK(clk), .RN(rst_n), .Q(map[17]), .QN(
        n928) );
  DFFRX1 map_reg_1__2__0_ ( .D(n520), .CK(clk), .RN(rst_n), .Q(map[18]), .QN(
        n933) );
  DFFRX1 map_reg_2__2__1_ ( .D(n525), .CK(clk), .RN(rst_n), .Q(map[11]) );
  DFFRX1 map_reg_2__1__1_ ( .D(n533), .CK(clk), .RN(rst_n), .Q(map[13]) );
  DFFRX1 map_reg_0__3__1_ ( .D(n515), .CK(clk), .RN(rst_n), .Q(map[25]) );
  DFFRX1 map_reg_0__3__0_ ( .D(n511), .CK(clk), .RN(rst_n), .Q(map[24]) );
  DFFRX1 map_reg_0__2__0_ ( .D(n519), .CK(clk), .RN(rst_n), .Q(map[26]) );
  DFFRX1 map_reg_0__1__1_ ( .D(n531), .CK(clk), .RN(rst_n), .Q(map[29]) );
  DFFRX1 map_reg_0__1__0_ ( .D(n527), .CK(clk), .RN(rst_n), .Q(map[28]) );
  DFFRX1 map_reg_0__0__1_ ( .D(n539), .CK(clk), .RN(rst_n), .Q(map[31]) );
  DFFRX1 map_reg_0__0__0_ ( .D(n535), .CK(clk), .RN(rst_n), .Q(map[30]) );
  DFFRHQXL out_reg_0_ ( .D(N3619), .CK(clk), .RN(rst_n), .Q(out[0]) );
  DFFRHQXL out_valid_reg ( .D(n544), .CK(clk), .RN(rst_n), .Q(out_valid) );
  DFFRHQXL out_reg_1_ ( .D(N3620), .CK(clk), .RN(rst_n), .Q(out[1]) );
  NOR2XL U556 ( .A(n586), .B(n929), .Y(n588) );
  NOR2XL U557 ( .A(map[18]), .B(map[19]), .Y(n677) );
  NOR2XL U558 ( .A(n579), .B(n578), .Y(n659) );
  NOR2XL U559 ( .A(lane[1]), .B(lane[0]), .Y(n872) );
  NOR2XL U560 ( .A(n582), .B(n863), .Y(n876) );
  NOR2XL U561 ( .A(cnt[0]), .B(n920), .Y(n834) );
  NOR2XL U562 ( .A(n544), .B(n595), .Y(n648) );
  NOR2XL U563 ( .A(n544), .B(n841), .Y(n908) );
  NOR2XL U564 ( .A(n834), .B(n858), .Y(n861) );
  NOR2XL U565 ( .A(n637), .B(n915), .Y(n787) );
  NOR2XL U566 ( .A(n646), .B(n912), .Y(n811) );
  NOR2XL U567 ( .A(n894), .B(n912), .Y(n793) );
  NOR2XL U568 ( .A(n639), .B(n910), .Y(n772) );
  NOR2XL U569 ( .A(n648), .B(n908), .Y(n757) );
  NOR2XL U570 ( .A(n632), .B(n906), .Y(n742) );
  NOR2XL U571 ( .A(n641), .B(n906), .Y(n730) );
  NOR2XL U572 ( .A(n637), .B(n904), .Y(n685) );
  NOR2XL U573 ( .A(n902), .B(n646), .Y(n715) );
  NOR2XL U574 ( .A(n902), .B(n894), .Y(n900) );
  NOR2XL U575 ( .A(n919), .B(n891), .Y(n552) );
  NOR2XL U576 ( .A(n917), .B(n1038), .Y(N3620) );
  INVX2 U577 ( .A(n917), .Y(n544) );
  NOR2XL U578 ( .A(ans_idx[0]), .B(n945), .Y(N3612) );
  OAI31XL U579 ( .A0(cnt[0]), .A1(cnt[6]), .A2(n833), .B0(n888), .Y(n858) );
  NOR2X1 U580 ( .A(n582), .B(n865), .Y(n877) );
  NOR2X1 U581 ( .A(n648), .B(n906), .Y(n736) );
  NOR2X1 U582 ( .A(n894), .B(n906), .Y(n727) );
  NOR2X1 U583 ( .A(n902), .B(n648), .Y(n709) );
  NOR2X1 U584 ( .A(n894), .B(n904), .Y(n694) );
  NOR2X1 U585 ( .A(n648), .B(n904), .Y(n712) );
  NOR2X1 U586 ( .A(n894), .B(n908), .Y(n745) );
  NOR2X1 U587 ( .A(n648), .B(n912), .Y(n805) );
  NOR2X1 U588 ( .A(n648), .B(n915), .Y(n808) );
  NOR2X1 U589 ( .A(n648), .B(n910), .Y(n778) );
  NOR2X1 U590 ( .A(n894), .B(n910), .Y(n766) );
  NOR2X1 U591 ( .A(n894), .B(n915), .Y(n814) );
  NOR2X1 U592 ( .A(n632), .B(n904), .Y(n724) );
  NOR2X1 U593 ( .A(n632), .B(n915), .Y(n682) );
  NOR2X1 U594 ( .A(n902), .B(n639), .Y(n703) );
  NOR2X1 U595 ( .A(n646), .B(n904), .Y(n718) );
  NOR2X1 U596 ( .A(n646), .B(n915), .Y(n823) );
  NOR2X1 U597 ( .A(n641), .B(n902), .Y(n697) );
  NOR2X1 U598 ( .A(n646), .B(n906), .Y(n739) );
  NOR2X1 U599 ( .A(n632), .B(n912), .Y(n817) );
  NOR2X1 U600 ( .A(n637), .B(n912), .Y(n802) );
  NOR2X1 U601 ( .A(n902), .B(n637), .Y(n706) );
  NOR2X1 U602 ( .A(n639), .B(n906), .Y(n721) );
  NOR2X1 U603 ( .A(n639), .B(n915), .Y(n784) );
  NOR2X1 U604 ( .A(n637), .B(n906), .Y(n733) );
  NOR2X1 U605 ( .A(n641), .B(n908), .Y(n748) );
  NOR2X1 U606 ( .A(n641), .B(n915), .Y(n820) );
  NOR2X1 U607 ( .A(n639), .B(n912), .Y(n799) );
  NOR2X1 U608 ( .A(n544), .B(n840), .Y(n894) );
  NOR2X1 U609 ( .A(n646), .B(n908), .Y(n760) );
  NOR2X1 U610 ( .A(n902), .B(n632), .Y(n691) );
  NOR2X1 U611 ( .A(n639), .B(n908), .Y(n751) );
  NOR2X1 U612 ( .A(n639), .B(n904), .Y(n688) );
  NOR2X1 U613 ( .A(n641), .B(n910), .Y(n769) );
  NOR2X1 U614 ( .A(n637), .B(n910), .Y(n775) );
  NOR2X1 U615 ( .A(n641), .B(n912), .Y(n796) );
  NOR2X1 U616 ( .A(n637), .B(n908), .Y(n754) );
  NOR2X1 U617 ( .A(n632), .B(n908), .Y(n763) );
  NOR2X1 U618 ( .A(n641), .B(n904), .Y(n700) );
  NOR2X1 U619 ( .A(n646), .B(n910), .Y(n781) );
  NOR2X1 U620 ( .A(n632), .B(n910), .Y(n790) );
  AOI31XL U621 ( .A0(current_state[1]), .A1(n616), .A2(n936), .B0(n544), .Y(
        n646) );
  NOR2X1 U622 ( .A(n945), .B(n863), .Y(n595) );
  AOI31XL U623 ( .A0(ans_idx[5]), .A1(ans_idx[4]), .A2(n996), .B0(n544), .Y(
        n902) );
  NOR2X1 U624 ( .A(n945), .B(n669), .Y(n840) );
  NOR2X1 U625 ( .A(n918), .B(n891), .Y(n558) );
  NOR2X1 U626 ( .A(n577), .B(n576), .Y(n869) );
  NOR2X1 U627 ( .A(n917), .B(n1037), .Y(N3619) );
  NOR2X1 U628 ( .A(current_state[1]), .B(current_state[0]), .Y(n891) );
  NOR2X1 U629 ( .A(map[26]), .B(map[27]), .Y(n654) );
  NOR2X1 U630 ( .A(ans_idx[4]), .B(n996), .Y(n836) );
  NOR2X1 U631 ( .A(n942), .B(n927), .Y(n835) );
  NOR2X1 U632 ( .A(lane[1]), .B(n935), .Y(n577) );
  NOR2X1 U633 ( .A(lane[0]), .B(n934), .Y(n576) );
  NOR2X1 U634 ( .A(map[28]), .B(map[29]), .Y(n652) );
  NOR2X1 U635 ( .A(ans_idx[1]), .B(n927), .Y(n616) );
  NOR2X1 U636 ( .A(current_state[0]), .B(n945), .Y(n831) );
  OAI21XL U637 ( .A0(n889), .A1(n945), .B0(n888), .Y(n892) );
  NOR4XL U638 ( .A(n887), .B(n886), .C(n885), .D(n884), .Y(n889) );
  NAND2XL U639 ( .A(n891), .B(in_valid), .Y(n888) );
  AOI22XL U640 ( .A0(map[28]), .A1(n577), .B0(n872), .B1(map[30]), .Y(n569) );
  AOI22XL U641 ( .A0(n576), .A1(map[26]), .B0(map[24]), .B1(n568), .Y(n570) );
  INVXL U642 ( .A(n586), .Y(n568) );
  AOI211XL U643 ( .A0(map[18]), .A1(n576), .B0(n588), .C0(n567), .Y(n575) );
  OAI2BB1XL U644 ( .A0N(map[20]), .A1N(n577), .B0(n670), .Y(n567) );
  AOI211XL U645 ( .A0(map[20]), .A1(n932), .B0(n670), .C0(n669), .Y(n671) );
  INVXL U646 ( .A(n872), .Y(n668) );
  NOR3XL U647 ( .A(n658), .B(n866), .C(n575), .Y(n656) );
  INVXL U648 ( .A(n869), .Y(n655) );
  AOI21XL U649 ( .A0(n660), .A1(n583), .B0(n666), .Y(n879) );
  OAI211XL U650 ( .A0(n573), .A1(n931), .B0(n572), .C0(n571), .Y(n582) );
  AOI22XL U651 ( .A0(map[29]), .A1(n577), .B0(map[25]), .B1(n568), .Y(n572) );
  INVXL U652 ( .A(n576), .Y(n573) );
  AOI22XL U653 ( .A0(n872), .A1(map[31]), .B0(n570), .B1(n569), .Y(n571) );
  NAND2XL U654 ( .A(lane[1]), .B(lane[0]), .Y(n586) );
  NAND2XL U655 ( .A(n926), .B(n925), .Y(n660) );
  AOI22XL U656 ( .A0(n933), .A1(n930), .B0(n929), .B1(n928), .Y(n583) );
  OR2XL U657 ( .A(n584), .B(ans_idx[2]), .Y(n866) );
  NAND2XL U658 ( .A(ans_idx[2]), .B(n616), .Y(n865) );
  NAND2XL U659 ( .A(n566), .B(n565), .Y(n658) );
  AOI22XL U660 ( .A0(n577), .A1(map[21]), .B0(n568), .B1(map[17]), .Y(n566) );
  AOI22XL U661 ( .A0(n576), .A1(map[19]), .B0(n872), .B1(map[23]), .Y(n565) );
  OAI21XL U662 ( .A0(map[23]), .A1(map[22]), .B0(n660), .Y(n676) );
  AOI22XL U663 ( .A0(n577), .A1(map[23]), .B0(n576), .B1(map[21]), .Y(n578) );
  NOR3XL U664 ( .A(n869), .B(n575), .C(n669), .Y(n665) );
  NAND3XL U665 ( .A(ans_idx[1]), .B(ans_idx[2]), .C(n927), .Y(n661) );
  OAI2BB1XL U666 ( .A0N(n866), .A1N(n950), .B0(current_state[1]), .Y(n632) );
  AOI31XL U667 ( .A0(ans_idx[2]), .A1(N3612), .A2(n942), .B0(n544), .Y(n637)
         );
  OAI2BB1XL U668 ( .A0N(n865), .A1N(n950), .B0(current_state[1]), .Y(n639) );
  OAI2BB1XL U669 ( .A0N(n661), .A1N(n950), .B0(current_state[1]), .Y(n641) );
  AOI2BB1XL U670 ( .A0N(n677), .A1N(n676), .B0(n883), .Y(n878) );
  OAI211XL U671 ( .A0(n867), .A1(n674), .B0(n874), .C0(n673), .Y(n886) );
  INVXL U672 ( .A(n656), .Y(n674) );
  AOI211XL U673 ( .A0(n876), .A1(n871), .B0(n672), .C0(n671), .Y(n673) );
  NOR4XL U674 ( .A(map[8]), .B(map[9]), .C(n668), .D(n667), .Y(n672) );
  OAI222XL U675 ( .A0(n655), .A1(n654), .B0(lane[1]), .B1(n653), .C0(lane[0]), 
        .C1(n652), .Y(n883) );
  NOR2X1 U676 ( .A(map[31]), .B(map[30]), .Y(n653) );
  AOI31XL U677 ( .A0(ans_idx[5]), .A1(n996), .A2(n967), .B0(n544), .Y(n906) );
  AOI31XL U678 ( .A0(n1011), .A1(n996), .A2(n967), .B0(n544), .Y(n915) );
  AOI31XL U679 ( .A0(ans_idx[4]), .A1(n1011), .A2(n996), .B0(n544), .Y(n910)
         );
  AOI21XL U680 ( .A0(ans_idx[5]), .A1(n836), .B0(n544), .Y(n904) );
  AOI21XL U681 ( .A0(n836), .A1(n1011), .B0(n544), .Y(n912) );
  OAI21XL U682 ( .A0(ans_idx[2]), .A1(n901), .B0(n917), .Y(n914) );
  NAND3XL U683 ( .A(n656), .B(n579), .C(n668), .Y(n881) );
  AOI32XL U684 ( .A0(n581), .A1(n580), .A2(n658), .B0(n659), .B1(n580), .Y(
        n657) );
  INVXL U685 ( .A(n579), .Y(n581) );
  NOR3BXL U686 ( .AN(n616), .B(ans_idx[2]), .C(n582), .Y(n675) );
  NAND2XL U687 ( .A(n580), .B(n586), .Y(n867) );
  OAI222XL U688 ( .A0(n654), .A1(n935), .B0(n574), .B1(n934), .C0(n652), .C1(
        n655), .Y(n666) );
  NOR2X1 U689 ( .A(map[25]), .B(map[24]), .Y(n574) );
  INVXL U690 ( .A(n879), .Y(n864) );
  NOR2BXL U691 ( .AN(n665), .B(n659), .Y(n887) );
  OAI211XL U692 ( .A0(n661), .A1(n591), .B0(n590), .C0(n589), .Y(n885) );
  OR4XL U693 ( .A(n667), .B(map[14]), .C(map[15]), .D(n586), .Y(n590) );
  INVXL U694 ( .A(n666), .Y(n871) );
  AOI22XL U695 ( .A0(n665), .A1(n664), .B0(n663), .B1(n662), .Y(n874) );
  INVXL U696 ( .A(n676), .Y(n663) );
  AOI211XL U697 ( .A0(lane[0]), .A1(n677), .B0(lane[1]), .C0(n661), .Y(n662)
         );
  OAI2BB1XL U698 ( .A0N(n659), .A1N(n658), .B0(n657), .Y(n664) );
  INVXL U699 ( .A(n682), .Y(n680) );
  INVXL U700 ( .A(n823), .Y(n821) );
  INVXL U701 ( .A(n808), .Y(n806) );
  INVXL U702 ( .A(n784), .Y(n782) );
  INVXL U703 ( .A(n820), .Y(n818) );
  INVXL U704 ( .A(n814), .Y(n812) );
  INVXL U705 ( .A(n817), .Y(n815) );
  INVXL U706 ( .A(n805), .Y(n803) );
  INVXL U707 ( .A(n802), .Y(n800) );
  INVXL U708 ( .A(n799), .Y(n797) );
  INVXL U709 ( .A(n796), .Y(n794) );
  INVXL U710 ( .A(n790), .Y(n788) );
  INVXL U711 ( .A(n781), .Y(n779) );
  INVXL U712 ( .A(n778), .Y(n776) );
  INVXL U713 ( .A(n775), .Y(n773) );
  INVXL U714 ( .A(n769), .Y(n767) );
  INVXL U715 ( .A(n766), .Y(n764) );
  INVXL U716 ( .A(n763), .Y(n761) );
  INVXL U717 ( .A(n760), .Y(n758) );
  INVXL U718 ( .A(n754), .Y(n752) );
  INVXL U719 ( .A(n751), .Y(n749) );
  INVXL U720 ( .A(n748), .Y(n746) );
  INVXL U721 ( .A(n745), .Y(n743) );
  INVXL U722 ( .A(n739), .Y(n737) );
  INVXL U723 ( .A(n736), .Y(n734) );
  INVXL U724 ( .A(n733), .Y(n731) );
  INVXL U725 ( .A(n721), .Y(n719) );
  INVXL U726 ( .A(n727), .Y(n725) );
  INVXL U727 ( .A(n724), .Y(n722) );
  INVXL U728 ( .A(n718), .Y(n716) );
  INVXL U729 ( .A(n712), .Y(n710) );
  INVXL U730 ( .A(n688), .Y(n686) );
  INVXL U731 ( .A(n700), .Y(n698) );
  INVXL U732 ( .A(n694), .Y(n692) );
  INVXL U733 ( .A(n691), .Y(n689) );
  INVXL U734 ( .A(n709), .Y(n707) );
  INVXL U735 ( .A(n706), .Y(n704) );
  INVXL U736 ( .A(n703), .Y(n701) );
  INVXL U737 ( .A(n697), .Y(n695) );
  NAND2XL U738 ( .A(n679), .B(n678), .Y(n896) );
  OAI2BB1XL U739 ( .A0N(n878), .A1N(n864), .B0(n877), .Y(n678) );
  AOI211XL U740 ( .A0(n876), .A1(n883), .B0(n675), .C0(n886), .Y(n679) );
  NAND2BXL U741 ( .AN(n906), .B(n914), .Y(n907) );
  NAND2BXL U742 ( .AN(n915), .B(n914), .Y(n916) );
  NAND2BXL U743 ( .AN(n910), .B(n914), .Y(n911) );
  NAND2BXL U744 ( .AN(n902), .B(n914), .Y(n903) );
  NAND2BXL U745 ( .AN(n904), .B(n914), .Y(n905) );
  NAND2BXL U746 ( .AN(n912), .B(n914), .Y(n913) );
  NAND2BXL U747 ( .AN(n908), .B(n914), .Y(n909) );
  OAI211XL U748 ( .A0(n594), .A1(n881), .B0(n593), .C0(n592), .Y(n899) );
  AOI22XL U749 ( .A0(n877), .A1(n864), .B0(n876), .B1(n666), .Y(n593) );
  INVXL U750 ( .A(n867), .Y(n594) );
  AOI211XL U751 ( .A0(n887), .A1(n657), .B0(n675), .C0(n885), .Y(n592) );
  NOR2X1 U752 ( .A(n918), .B(n557), .Y(n561) );
  NOR2X1 U753 ( .A(n919), .B(n551), .Y(n554) );
  NOR3XL U754 ( .A(ans_idx[5]), .B(n996), .C(n967), .Y(n841) );
  INVXL U755 ( .A(n891), .Y(n559) );
  NAND2XL U756 ( .A(n936), .B(n835), .Y(n863) );
  NAND2XL U757 ( .A(ans_idx[2]), .B(n835), .Y(n669) );
  OR2XL U758 ( .A(n945), .B(n950), .Y(n917) );
  AOI2BB2XL U759 ( .B0(n923), .B1(n862), .A0N(n862), .A1N(map[30]), .Y(n535)
         );
  AOI2BB2XL U760 ( .B0(n932), .B1(n862), .A0N(n862), .A1N(map[31]), .Y(n539)
         );
  AOI2BB2XL U761 ( .B0(n926), .B1(n862), .A0N(n862), .A1N(map[28]), .Y(n527)
         );
  AOI2BB2XL U762 ( .B0(n925), .B1(n862), .A0N(n862), .A1N(map[29]), .Y(n531)
         );
  AOI2BB2XL U763 ( .B0(n933), .B1(n862), .A0N(n862), .A1N(map[26]), .Y(n519)
         );
  AOI2BB2XL U764 ( .B0(n929), .B1(n862), .A0N(n862), .A1N(map[24]), .Y(n511)
         );
  AOI2BB2XL U765 ( .B0(n928), .B1(n862), .A0N(n862), .A1N(map[25]), .Y(n515)
         );
  OAI2BB1XL U766 ( .A0N(map[5]), .A1N(n862), .B0(n847), .Y(n533) );
  NAND2XL U767 ( .A(n861), .B(map[13]), .Y(n847) );
  OAI2BB1XL U768 ( .A0N(map[3]), .A1N(n862), .B0(n852), .Y(n525) );
  NAND2XL U769 ( .A(n861), .B(map[11]), .Y(n852) );
  AOI2BB2XL U770 ( .B0(n861), .B1(n933), .A0N(map[10]), .A1N(n861), .Y(n520)
         );
  AOI2BB2XL U771 ( .B0(n861), .B1(n928), .A0N(map[9]), .A1N(n861), .Y(n516) );
  OAI2BB1XL U772 ( .A0N(n861), .A1N(map[21]), .B0(n848), .Y(n532) );
  NAND2XL U773 ( .A(map[13]), .B(n862), .Y(n848) );
  OAI2BB1XL U774 ( .A0N(n861), .A1N(map[19]), .B0(n853), .Y(n524) );
  NAND2XL U775 ( .A(map[11]), .B(n862), .Y(n853) );
  OAI2BB1XL U776 ( .A0N(n861), .A1N(map[14]), .B0(n845), .Y(n537) );
  NAND2XL U777 ( .A(map[6]), .B(n862), .Y(n845) );
  OAI2BB1XL U778 ( .A0N(n861), .A1N(map[15]), .B0(n843), .Y(n541) );
  NAND2XL U779 ( .A(map[7]), .B(n862), .Y(n843) );
  OAI2BB1XL U780 ( .A0N(n861), .A1N(map[12]), .B0(n850), .Y(n529) );
  NAND2XL U781 ( .A(map[4]), .B(n862), .Y(n850) );
  OAI2BB1XL U782 ( .A0N(n861), .A1N(map[10]), .B0(n855), .Y(n521) );
  NAND2XL U783 ( .A(map[2]), .B(n862), .Y(n855) );
  OAI2BB1XL U784 ( .A0N(n861), .A1N(map[8]), .B0(n860), .Y(n513) );
  NAND2XL U785 ( .A(map[0]), .B(n862), .Y(n860) );
  OAI2BB1XL U786 ( .A0N(n861), .A1N(map[9]), .B0(n857), .Y(n517) );
  NAND2XL U787 ( .A(map[1]), .B(n862), .Y(n857) );
  OAI2BB1XL U788 ( .A0N(in0[1]), .A1N(n858), .B0(n842), .Y(n542) );
  NAND2XL U789 ( .A(n861), .B(map[7]), .Y(n842) );
  AOI22XL U790 ( .A0(n861), .A1(n931), .B0(n930), .B1(n862), .Y(n523) );
  AOI22XL U791 ( .A0(n861), .A1(n923), .B0(n922), .B1(n862), .Y(n536) );
  AOI22XL U792 ( .A0(n861), .A1(n932), .B0(n921), .B1(n862), .Y(n540) );
  AOI22XL U793 ( .A0(n861), .A1(n929), .B0(n924), .B1(n862), .Y(n512) );
  AOI2BB2XL U794 ( .B0(n861), .B1(n926), .A0N(map[12]), .A1N(n861), .Y(n528)
         );
  OAI2BB1XL U795 ( .A0N(n861), .A1N(map[6]), .B0(n844), .Y(n538) );
  NAND2XL U796 ( .A(in0[0]), .B(n858), .Y(n844) );
  OAI2BB1XL U797 ( .A0N(n861), .A1N(map[4]), .B0(n849), .Y(n530) );
  NAND2XL U798 ( .A(in1[0]), .B(n858), .Y(n849) );
  OAI2BB1XL U799 ( .A0N(n861), .A1N(map[5]), .B0(n846), .Y(n534) );
  NAND2XL U800 ( .A(in1[1]), .B(n858), .Y(n846) );
  OAI2BB1XL U801 ( .A0N(n861), .A1N(map[2]), .B0(n854), .Y(n522) );
  NAND2XL U802 ( .A(in2[0]), .B(n858), .Y(n854) );
  OAI2BB1XL U803 ( .A0N(n861), .A1N(map[3]), .B0(n851), .Y(n526) );
  NAND2XL U804 ( .A(in2[1]), .B(n858), .Y(n851) );
  OAI2BB1XL U805 ( .A0N(n861), .A1N(map[0]), .B0(n859), .Y(n514) );
  NAND2XL U806 ( .A(in3[0]), .B(n858), .Y(n859) );
  OAI2BB1XL U807 ( .A0N(n861), .A1N(map[1]), .B0(n856), .Y(n518) );
  NAND2XL U808 ( .A(in3[1]), .B(n858), .Y(n856) );
  AOI32XL U809 ( .A0(n824), .A1(n682), .A2(n681), .B0(n1037), .B1(n680), .Y(
        n398) );
  AOI32XL U810 ( .A0(n824), .A1(n823), .A2(n822), .B0(n1036), .B1(n821), .Y(
        n399) );
  AOI32XL U811 ( .A0(n824), .A1(n808), .A2(n807), .B0(n1034), .B1(n806), .Y(
        n403) );
  AOI32XL U812 ( .A0(n824), .A1(n787), .A2(n786), .B0(n1032), .B1(n785), .Y(
        n405) );
  AOI32XL U813 ( .A0(n824), .A1(n784), .A2(n783), .B0(n1030), .B1(n782), .Y(
        n407) );
  AOI32XL U814 ( .A0(n824), .A1(n820), .A2(n819), .B0(n1028), .B1(n818), .Y(
        n409) );
  AOI32XL U815 ( .A0(n824), .A1(n814), .A2(n813), .B0(n1026), .B1(n812), .Y(
        n411) );
  AOI32XL U816 ( .A0(n824), .A1(n817), .A2(n816), .B0(n1024), .B1(n815), .Y(
        n413) );
  AOI32XL U817 ( .A0(n824), .A1(n811), .A2(n810), .B0(n1022), .B1(n809), .Y(
        n415) );
  AOI32XL U818 ( .A0(n824), .A1(n805), .A2(n804), .B0(n1020), .B1(n803), .Y(
        n419) );
  AOI32XL U819 ( .A0(n824), .A1(n802), .A2(n801), .B0(n1018), .B1(n800), .Y(
        n421) );
  AOI32XL U820 ( .A0(n824), .A1(n799), .A2(n798), .B0(n1016), .B1(n797), .Y(
        n423) );
  AOI32XL U821 ( .A0(n824), .A1(n796), .A2(n795), .B0(n1014), .B1(n794), .Y(
        n425) );
  AOI32XL U822 ( .A0(n824), .A1(n793), .A2(n792), .B0(n1012), .B1(n791), .Y(
        n427) );
  AOI32XL U823 ( .A0(n824), .A1(n790), .A2(n789), .B0(n1009), .B1(n788), .Y(
        n429) );
  AOI32XL U824 ( .A0(n824), .A1(n781), .A2(n780), .B0(n1007), .B1(n779), .Y(
        n431) );
  AOI32XL U825 ( .A0(n824), .A1(n778), .A2(n777), .B0(n1005), .B1(n776), .Y(
        n435) );
  AOI32XL U826 ( .A0(n824), .A1(n775), .A2(n774), .B0(n1003), .B1(n773), .Y(
        n437) );
  AOI32XL U827 ( .A0(n824), .A1(n772), .A2(n771), .B0(n1001), .B1(n770), .Y(
        n439) );
  AOI32XL U828 ( .A0(n824), .A1(n769), .A2(n768), .B0(n999), .B1(n767), .Y(
        n441) );
  AOI32XL U829 ( .A0(n824), .A1(n766), .A2(n765), .B0(n997), .B1(n764), .Y(
        n443) );
  AOI32XL U830 ( .A0(n824), .A1(n763), .A2(n762), .B0(n994), .B1(n761), .Y(
        n445) );
  AOI32XL U831 ( .A0(n824), .A1(n760), .A2(n759), .B0(n992), .B1(n758), .Y(
        n447) );
  AOI32XL U832 ( .A0(n824), .A1(n757), .A2(n756), .B0(n990), .B1(n755), .Y(
        n451) );
  AOI32XL U833 ( .A0(n824), .A1(n754), .A2(n753), .B0(n988), .B1(n752), .Y(
        n453) );
  AOI32XL U834 ( .A0(n824), .A1(n751), .A2(n750), .B0(n986), .B1(n749), .Y(
        n455) );
  AOI32XL U835 ( .A0(n824), .A1(n748), .A2(n747), .B0(n984), .B1(n746), .Y(
        n457) );
  AOI32XL U836 ( .A0(n824), .A1(n745), .A2(n744), .B0(n982), .B1(n743), .Y(
        n459) );
  AOI32XL U837 ( .A0(n824), .A1(n742), .A2(n741), .B0(n980), .B1(n740), .Y(
        n461) );
  AOI32XL U838 ( .A0(n824), .A1(n739), .A2(n738), .B0(n978), .B1(n737), .Y(
        n463) );
  AOI32XL U839 ( .A0(n824), .A1(n736), .A2(n735), .B0(n976), .B1(n734), .Y(
        n467) );
  AOI32XL U840 ( .A0(n824), .A1(n733), .A2(n732), .B0(n974), .B1(n731), .Y(
        n469) );
  AOI32XL U841 ( .A0(n824), .A1(n721), .A2(n720), .B0(n972), .B1(n719), .Y(
        n471) );
  AOI32XL U842 ( .A0(n824), .A1(n730), .A2(n729), .B0(n970), .B1(n728), .Y(
        n473) );
  AOI32XL U843 ( .A0(n824), .A1(n727), .A2(n726), .B0(n968), .B1(n725), .Y(
        n475) );
  AOI32XL U844 ( .A0(n824), .A1(n724), .A2(n723), .B0(n965), .B1(n722), .Y(
        n477) );
  AOI32XL U845 ( .A0(n824), .A1(n718), .A2(n717), .B0(n963), .B1(n716), .Y(
        n479) );
  AOI32XL U846 ( .A0(n824), .A1(n712), .A2(n711), .B0(n961), .B1(n710), .Y(
        n483) );
  AOI32XL U847 ( .A0(n824), .A1(n685), .A2(n684), .B0(n959), .B1(n683), .Y(
        n485) );
  AOI32XL U848 ( .A0(n824), .A1(n688), .A2(n687), .B0(n957), .B1(n686), .Y(
        n487) );
  AOI32XL U849 ( .A0(n824), .A1(n700), .A2(n699), .B0(n955), .B1(n698), .Y(
        n489) );
  AOI32XL U850 ( .A0(n824), .A1(n694), .A2(n693), .B0(n953), .B1(n692), .Y(
        n491) );
  AOI32XL U851 ( .A0(n824), .A1(n691), .A2(n690), .B0(n951), .B1(n689), .Y(
        n493) );
  AOI32XL U852 ( .A0(n824), .A1(n715), .A2(n714), .B0(n948), .B1(n713), .Y(
        n495) );
  AOI32XL U853 ( .A0(n824), .A1(n709), .A2(n708), .B0(n946), .B1(n707), .Y(
        n499) );
  AOI32XL U854 ( .A0(n824), .A1(n706), .A2(n705), .B0(n943), .B1(n704), .Y(
        n501) );
  AOI32XL U855 ( .A0(n824), .A1(n703), .A2(n702), .B0(n940), .B1(n701), .Y(
        n503) );
  AOI32XL U856 ( .A0(n824), .A1(n697), .A2(n696), .B0(n938), .B1(n695), .Y(
        n505) );
  AOI2BB2XL U857 ( .B0(n893), .B1(n892), .A0N(n892), .A1N(lane[0]), .Y(n509)
         );
  AOI22XL U858 ( .A0(current_state[1]), .A1(n935), .B0(n891), .B1(init[0]), 
        .Y(n893) );
  MXI2XL U859 ( .A(n934), .B(n890), .S0(n892), .Y(n510) );
  AOI22XL U860 ( .A0(current_state[1]), .A1(n875), .B0(n891), .B1(init[1]), 
        .Y(n890) );
  AOI32XL U861 ( .A0(n651), .A1(n682), .A2(n600), .B0(n1038), .B1(n680), .Y(
        n397) );
  AOI32XL U862 ( .A0(n651), .A1(n823), .A2(n618), .B0(n937), .B1(n821), .Y(
        n508) );
  AOI32XL U863 ( .A0(n651), .A1(n808), .A2(n606), .B0(n1035), .B1(n806), .Y(
        n402) );
  AOI32XL U864 ( .A0(n651), .A1(n787), .A2(n599), .B0(n1033), .B1(n785), .Y(
        n404) );
  AOI32XL U865 ( .A0(n651), .A1(n784), .A2(n613), .B0(n1031), .B1(n782), .Y(
        n406) );
  AOI32XL U866 ( .A0(n651), .A1(n820), .A2(n597), .B0(n1029), .B1(n818), .Y(
        n408) );
  AOI32XL U867 ( .A0(n651), .A1(n814), .A2(n635), .B0(n1027), .B1(n812), .Y(
        n410) );
  AOI32XL U868 ( .A0(n651), .A1(n817), .A2(n609), .B0(n1025), .B1(n815), .Y(
        n412) );
  AOI32XL U869 ( .A0(n651), .A1(n811), .A2(n626), .B0(n1023), .B1(n809), .Y(
        n414) );
  AOI32XL U870 ( .A0(n651), .A1(n805), .A2(n596), .B0(n1021), .B1(n803), .Y(
        n418) );
  AOI32XL U871 ( .A0(n651), .A1(n802), .A2(n603), .B0(n1019), .B1(n800), .Y(
        n420) );
  AOI32XL U872 ( .A0(n651), .A1(n799), .A2(n630), .B0(n1017), .B1(n797), .Y(
        n422) );
  AOI32XL U873 ( .A0(n651), .A1(n796), .A2(n598), .B0(n1015), .B1(n794), .Y(
        n424) );
  AOI32XL U874 ( .A0(n651), .A1(n793), .A2(n601), .B0(n1013), .B1(n791), .Y(
        n426) );
  AOI32XL U875 ( .A0(n651), .A1(n790), .A2(n607), .B0(n1010), .B1(n788), .Y(
        n428) );
  AOI32XL U876 ( .A0(n651), .A1(n781), .A2(n647), .B0(n1008), .B1(n779), .Y(
        n430) );
  AOI32XL U877 ( .A0(n651), .A1(n778), .A2(n602), .B0(n1006), .B1(n776), .Y(
        n434) );
  AOI32XL U878 ( .A0(n651), .A1(n775), .A2(n627), .B0(n1004), .B1(n773), .Y(
        n436) );
  AOI32XL U879 ( .A0(n651), .A1(n772), .A2(n604), .B0(n1002), .B1(n770), .Y(
        n438) );
  AOI32XL U880 ( .A0(n651), .A1(n769), .A2(n605), .B0(n1000), .B1(n767), .Y(
        n440) );
  AOI32XL U881 ( .A0(n651), .A1(n766), .A2(n644), .B0(n998), .B1(n764), .Y(
        n442) );
  AOI32XL U882 ( .A0(n651), .A1(n763), .A2(n615), .B0(n995), .B1(n761), .Y(
        n444) );
  AOI32XL U883 ( .A0(n651), .A1(n760), .A2(n617), .B0(n993), .B1(n758), .Y(
        n446) );
  AOI32XL U884 ( .A0(n651), .A1(n757), .A2(n619), .B0(n991), .B1(n755), .Y(
        n450) );
  AOI32XL U885 ( .A0(n651), .A1(n754), .A2(n620), .B0(n989), .B1(n752), .Y(
        n452) );
  AOI32XL U886 ( .A0(n651), .A1(n751), .A2(n621), .B0(n987), .B1(n749), .Y(
        n454) );
  AOI32XL U887 ( .A0(n651), .A1(n748), .A2(n622), .B0(n985), .B1(n746), .Y(
        n456) );
  AOI32XL U888 ( .A0(n651), .A1(n745), .A2(n623), .B0(n983), .B1(n743), .Y(
        n458) );
  AOI32XL U889 ( .A0(n651), .A1(n742), .A2(n624), .B0(n981), .B1(n740), .Y(
        n460) );
  AOI32XL U890 ( .A0(n651), .A1(n739), .A2(n634), .B0(n979), .B1(n737), .Y(
        n462) );
  AOI32XL U891 ( .A0(n651), .A1(n736), .A2(n636), .B0(n977), .B1(n734), .Y(
        n466) );
  AOI32XL U892 ( .A0(n651), .A1(n733), .A2(n638), .B0(n975), .B1(n731), .Y(
        n468) );
  AOI32XL U893 ( .A0(n651), .A1(n721), .A2(n640), .B0(n973), .B1(n719), .Y(
        n470) );
  AOI32XL U894 ( .A0(n651), .A1(n730), .A2(n642), .B0(n971), .B1(n728), .Y(
        n472) );
  AOI32XL U895 ( .A0(n651), .A1(n727), .A2(n643), .B0(n969), .B1(n725), .Y(
        n474) );
  AOI32XL U896 ( .A0(n651), .A1(n724), .A2(n633), .B0(n966), .B1(n722), .Y(
        n476) );
  AOI32XL U897 ( .A0(n651), .A1(n718), .A2(n645), .B0(n964), .B1(n716), .Y(
        n478) );
  AOI32XL U898 ( .A0(n651), .A1(n712), .A2(n649), .B0(n962), .B1(n710), .Y(
        n482) );
  AOI32XL U899 ( .A0(n651), .A1(n685), .A2(n610), .B0(n960), .B1(n683), .Y(
        n484) );
  AOI32XL U900 ( .A0(n651), .A1(n688), .A2(n611), .B0(n958), .B1(n686), .Y(
        n486) );
  AOI32XL U901 ( .A0(n651), .A1(n700), .A2(n612), .B0(n956), .B1(n698), .Y(
        n488) );
  AOI32XL U902 ( .A0(n651), .A1(n694), .A2(n650), .B0(n954), .B1(n692), .Y(
        n490) );
  AOI32XL U903 ( .A0(n651), .A1(n691), .A2(n614), .B0(n952), .B1(n689), .Y(
        n492) );
  AOI32XL U904 ( .A0(n651), .A1(n715), .A2(n631), .B0(n949), .B1(n713), .Y(
        n494) );
  AOI32XL U905 ( .A0(n651), .A1(n709), .A2(n629), .B0(n947), .B1(n707), .Y(
        n498) );
  AOI32XL U906 ( .A0(n651), .A1(n706), .A2(n628), .B0(n944), .B1(n704), .Y(
        n500) );
  AOI32XL U907 ( .A0(n651), .A1(n703), .A2(n608), .B0(n941), .B1(n701), .Y(
        n502) );
  AOI32XL U908 ( .A0(n651), .A1(n697), .A2(n625), .B0(n939), .B1(n695), .Y(
        n504) );
  NOR2X1 U909 ( .A(n826), .B(n825), .Y(n830) );
  OAI2BB1XL U910 ( .A0N(n900), .A1N(n896), .B0(n895), .Y(n507) );
  OAI2BB1XL U911 ( .A0N(n900), .A1N(n899), .B0(n898), .Y(n506) );
  INVXL U912 ( .A(n861), .Y(n862) );
  INVXL U913 ( .A(n863), .Y(n870) );
  INVXL U914 ( .A(in_valid), .Y(n833) );
  INVXL U915 ( .A(n787), .Y(n785) );
  INVXL U916 ( .A(n811), .Y(n809) );
  INVXL U917 ( .A(n793), .Y(n791) );
  INVXL U918 ( .A(n772), .Y(n770) );
  INVXL U919 ( .A(n757), .Y(n755) );
  INVXL U920 ( .A(n742), .Y(n740) );
  INVXL U921 ( .A(n730), .Y(n728) );
  INVXL U922 ( .A(n685), .Y(n683) );
  INVXL U923 ( .A(n715), .Y(n713) );
  NAND2XL U924 ( .A(n559), .B(cnt[6]), .Y(n546) );
  NAND3XL U925 ( .A(cnt[0]), .B(cnt[1]), .C(n559), .Y(n551) );
  NAND2XL U926 ( .A(cnt[3]), .B(n554), .Y(n557) );
  NAND2XL U927 ( .A(cnt[5]), .B(n561), .Y(n545) );
  XOR2XL U928 ( .A(n546), .B(n545), .Y(N384) );
  INVXL U929 ( .A(n669), .Y(n587) );
  NAND2XL U930 ( .A(n587), .B(ans_idx[3]), .Y(n838) );
  NAND2XL U931 ( .A(current_state[1]), .B(n838), .Y(n837) );
  AOI21XL U932 ( .A0(n669), .A1(n996), .B0(n837), .Y(N3615) );
  NAND2XL U933 ( .A(current_state[1]), .B(n616), .Y(n547) );
  NAND2XL U934 ( .A(ans_idx[1]), .B(N3612), .Y(n901) );
  NAND2XL U935 ( .A(n547), .B(n901), .Y(N3613) );
  NAND2XL U936 ( .A(cnt[0]), .B(n559), .Y(N378) );
  NAND2XL U937 ( .A(cnt[1]), .B(n559), .Y(n549) );
  INVXL U938 ( .A(n551), .Y(n548) );
  AOI21XL U939 ( .A0(N378), .A1(n549), .B0(n548), .Y(N379) );
  NAND2XL U940 ( .A(n552), .B(n551), .Y(n550) );
  OAI21XL U941 ( .A0(n552), .A1(n551), .B0(n550), .Y(N380) );
  NAND2XL U942 ( .A(n559), .B(cnt[3]), .Y(n555) );
  NAND2XL U943 ( .A(n555), .B(n554), .Y(n553) );
  OAI21XL U944 ( .A0(n555), .A1(n554), .B0(n553), .Y(N381) );
  NAND2XL U945 ( .A(n558), .B(n557), .Y(n556) );
  OAI21XL U946 ( .A0(n558), .A1(n557), .B0(n556), .Y(N382) );
  NAND2XL U947 ( .A(n559), .B(cnt[5]), .Y(n562) );
  NAND2XL U948 ( .A(n562), .B(n561), .Y(n560) );
  OAI21XL U949 ( .A0(n562), .A1(n561), .B0(n560), .Y(N383) );
  NAND4XL U950 ( .A(cnt[5]), .B(cnt[4]), .C(cnt[3]), .D(cnt[2]), .Y(n826) );
  NOR4BXL U951 ( .AN(cnt[1]), .B(cnt[0]), .C(n920), .D(n826), .Y(n828) );
  NAND4BXL U952 ( .AN(cnt[3]), .B(cnt[0]), .C(cnt[1]), .D(n918), .Y(n563) );
  NOR4XL U953 ( .A(cnt[5]), .B(cnt[6]), .C(n919), .D(n563), .Y(n827) );
  NAND2XL U954 ( .A(current_state[0]), .B(n827), .Y(n564) );
  AOI22XL U955 ( .A0(n828), .A1(n544), .B0(n945), .B1(n564), .Y(next_state_1_)
         );
  AOI222XL U956 ( .A0(n577), .A1(map[18]), .B0(n576), .B1(map[16]), .C0(n869), 
        .C1(map[20]), .Y(n580) );
  NAND2XL U957 ( .A(n942), .B(n927), .Y(n584) );
  NAND2XL U958 ( .A(n872), .B(map[22]), .Y(n670) );
  AOI222XL U959 ( .A0(n577), .A1(map[22]), .B0(n576), .B1(map[20]), .C0(n869), 
        .C1(map[18]), .Y(n579) );
  OAI211XL U960 ( .A0(lane[0]), .A1(n660), .B0(lane[1]), .C0(n583), .Y(n591)
         );
  AOI2BB1XL U961 ( .A0N(map[8]), .A1N(map[14]), .B0(n584), .Y(n585) );
  NAND4XL U962 ( .A(ans_idx[2]), .B(map[10]), .C(map[12]), .D(n585), .Y(n667)
         );
  OAI211XL U963 ( .A0(map[17]), .A1(n933), .B0(n588), .C0(n587), .Y(n589) );
  NAND2X1 U964 ( .A(n831), .B(n899), .Y(n651) );
  NAND2XL U965 ( .A(n544), .B(answer[77]), .Y(n596) );
  NAND2XL U966 ( .A(n544), .B(answer[85]), .Y(n597) );
  NAND2XL U967 ( .A(n544), .B(answer[71]), .Y(n598) );
  NAND2XL U968 ( .A(n544), .B(answer[89]), .Y(n599) );
  NAND2XL U969 ( .A(n544), .B(answer[95]), .Y(n600) );
  NAND2XL U970 ( .A(n544), .B(answer[69]), .Y(n601) );
  NAND2XL U971 ( .A(n544), .B(answer[63]), .Y(n602) );
  NAND2XL U972 ( .A(n544), .B(answer[75]), .Y(n603) );
  NAND2XL U973 ( .A(n544), .B(answer[59]), .Y(n604) );
  NAND2XL U974 ( .A(n544), .B(answer[57]), .Y(n605) );
  NAND2XL U975 ( .A(n544), .B(answer[91]), .Y(n606) );
  NAND2XL U976 ( .A(n544), .B(answer[67]), .Y(n607) );
  NAND2XL U977 ( .A(n544), .B(answer[3]), .Y(n608) );
  NAND2XL U978 ( .A(n544), .B(answer[81]), .Y(n609) );
  NAND2XL U979 ( .A(n544), .B(answer[19]), .Y(n610) );
  NAND2XL U980 ( .A(n544), .B(answer[17]), .Y(n611) );
  NAND2XL U981 ( .A(n544), .B(answer[15]), .Y(n612) );
  NAND2XL U982 ( .A(n544), .B(answer[87]), .Y(n613) );
  NAND2XL U983 ( .A(n544), .B(answer[11]), .Y(n614) );
  NAND2XL U984 ( .A(n544), .B(answer[53]), .Y(n615) );
  NAND2XL U985 ( .A(n544), .B(answer[51]), .Y(n617) );
  NAND2XL U986 ( .A(n544), .B(answer[93]), .Y(n618) );
  NAND2XL U987 ( .A(n544), .B(answer[49]), .Y(n619) );
  NAND2XL U988 ( .A(n544), .B(answer[47]), .Y(n620) );
  NAND2XL U989 ( .A(n544), .B(answer[45]), .Y(n621) );
  NAND2XL U990 ( .A(n544), .B(answer[43]), .Y(n622) );
  NAND2XL U991 ( .A(n544), .B(answer[41]), .Y(n623) );
  NAND2XL U992 ( .A(n544), .B(answer[39]), .Y(n624) );
  NAND2XL U993 ( .A(n544), .B(answer[1]), .Y(n625) );
  NAND2XL U994 ( .A(n544), .B(answer[79]), .Y(n626) );
  NAND2XL U995 ( .A(n544), .B(answer[61]), .Y(n627) );
  NAND2XL U996 ( .A(n544), .B(answer[5]), .Y(n628) );
  NAND2XL U997 ( .A(n544), .B(answer[7]), .Y(n629) );
  NAND2XL U998 ( .A(n544), .B(answer[73]), .Y(n630) );
  NAND2XL U999 ( .A(n544), .B(answer[9]), .Y(n631) );
  NAND2XL U1000 ( .A(n544), .B(answer[25]), .Y(n633) );
  NAND2XL U1001 ( .A(n544), .B(answer[37]), .Y(n634) );
  NAND2XL U1002 ( .A(n544), .B(answer[83]), .Y(n635) );
  NAND2XL U1003 ( .A(n544), .B(answer[35]), .Y(n636) );
  NAND2XL U1004 ( .A(n544), .B(answer[33]), .Y(n638) );
  NAND2XL U1005 ( .A(n544), .B(answer[31]), .Y(n640) );
  NAND2XL U1006 ( .A(n544), .B(answer[29]), .Y(n642) );
  NAND2XL U1007 ( .A(n544), .B(answer[27]), .Y(n643) );
  NAND2XL U1008 ( .A(n544), .B(answer[55]), .Y(n644) );
  NAND2XL U1009 ( .A(n544), .B(answer[23]), .Y(n645) );
  NAND2XL U1010 ( .A(n544), .B(answer[65]), .Y(n647) );
  NAND2XL U1011 ( .A(n544), .B(answer[21]), .Y(n649) );
  NAND2XL U1012 ( .A(n544), .B(answer[13]), .Y(n650) );
  NAND2X1 U1013 ( .A(n831), .B(n896), .Y(n824) );
  NAND2XL U1014 ( .A(n544), .B(answer[94]), .Y(n681) );
  NAND2XL U1015 ( .A(n544), .B(answer[18]), .Y(n684) );
  NAND2XL U1016 ( .A(n544), .B(answer[16]), .Y(n687) );
  NAND2XL U1017 ( .A(n544), .B(answer[10]), .Y(n690) );
  NAND2XL U1018 ( .A(n544), .B(answer[12]), .Y(n693) );
  NAND2XL U1019 ( .A(n544), .B(answer[0]), .Y(n696) );
  NAND2XL U1020 ( .A(n544), .B(answer[14]), .Y(n699) );
  NAND2XL U1021 ( .A(answer[2]), .B(n544), .Y(n702) );
  NAND2XL U1022 ( .A(n544), .B(answer[4]), .Y(n705) );
  NAND2XL U1023 ( .A(n544), .B(answer[6]), .Y(n708) );
  NAND2XL U1024 ( .A(n544), .B(answer[20]), .Y(n711) );
  NAND2XL U1025 ( .A(n544), .B(answer[8]), .Y(n714) );
  NAND2XL U1026 ( .A(n544), .B(answer[22]), .Y(n717) );
  NAND2XL U1027 ( .A(n544), .B(answer[30]), .Y(n720) );
  NAND2XL U1028 ( .A(n544), .B(answer[24]), .Y(n723) );
  NAND2XL U1029 ( .A(n544), .B(answer[26]), .Y(n726) );
  NAND2XL U1030 ( .A(n544), .B(answer[28]), .Y(n729) );
  NAND2XL U1031 ( .A(n544), .B(answer[32]), .Y(n732) );
  NAND2XL U1032 ( .A(n544), .B(answer[34]), .Y(n735) );
  NAND2XL U1033 ( .A(n544), .B(answer[36]), .Y(n738) );
  NAND2XL U1034 ( .A(n544), .B(answer[38]), .Y(n741) );
  NAND2XL U1035 ( .A(n544), .B(answer[40]), .Y(n744) );
  NAND2XL U1036 ( .A(n544), .B(answer[42]), .Y(n747) );
  NAND2XL U1037 ( .A(n544), .B(answer[44]), .Y(n750) );
  NAND2XL U1038 ( .A(n544), .B(answer[46]), .Y(n753) );
  NAND2XL U1039 ( .A(n544), .B(answer[48]), .Y(n756) );
  NAND2XL U1040 ( .A(n544), .B(answer[50]), .Y(n759) );
  NAND2XL U1041 ( .A(n544), .B(answer[52]), .Y(n762) );
  NAND2XL U1042 ( .A(n544), .B(answer[54]), .Y(n765) );
  NAND2XL U1043 ( .A(n544), .B(answer[56]), .Y(n768) );
  NAND2XL U1044 ( .A(n544), .B(answer[58]), .Y(n771) );
  NAND2XL U1045 ( .A(n544), .B(answer[60]), .Y(n774) );
  NAND2XL U1046 ( .A(n544), .B(answer[62]), .Y(n777) );
  NAND2XL U1047 ( .A(n544), .B(answer[64]), .Y(n780) );
  NAND2XL U1048 ( .A(n544), .B(answer[86]), .Y(n783) );
  NAND2XL U1049 ( .A(n544), .B(answer[88]), .Y(n786) );
  NAND2XL U1050 ( .A(n544), .B(answer[66]), .Y(n789) );
  NAND2XL U1051 ( .A(n544), .B(answer[68]), .Y(n792) );
  NAND2XL U1052 ( .A(n544), .B(answer[70]), .Y(n795) );
  NAND2XL U1053 ( .A(n544), .B(answer[72]), .Y(n798) );
  NAND2XL U1054 ( .A(n544), .B(answer[74]), .Y(n801) );
  NAND2XL U1055 ( .A(n544), .B(answer[76]), .Y(n804) );
  NAND2XL U1056 ( .A(n544), .B(answer[90]), .Y(n807) );
  NAND2XL U1057 ( .A(n544), .B(answer[78]), .Y(n810) );
  NAND2XL U1058 ( .A(n544), .B(answer[82]), .Y(n813) );
  NAND2XL U1059 ( .A(n544), .B(answer[80]), .Y(n816) );
  NAND2XL U1060 ( .A(n544), .B(answer[84]), .Y(n819) );
  NAND2XL U1061 ( .A(n544), .B(answer[92]), .Y(n822) );
  NAND2XL U1062 ( .A(cnt[0]), .B(cnt[1]), .Y(n825) );
  AOI221XL U1063 ( .A0(current_state[1]), .A1(n828), .B0(n945), .B1(n827), 
        .C0(n950), .Y(n829) );
  AOI31XL U1064 ( .A0(n831), .A1(n830), .A2(n920), .B0(n829), .Y(n832) );
  NAND2XL U1065 ( .A(n832), .B(n888), .Y(n543) );
  AOI221XL U1066 ( .A0(n835), .A1(n863), .B0(n936), .B1(n863), .C0(n945), .Y(
        N3614) );
  OAI2BB2XL U1067 ( .B0(n967), .B1(n837), .A0N(n840), .A1N(n836), .Y(N3616) );
  OAI211XL U1068 ( .A0(n967), .A1(n838), .B0(ans_idx[5]), .C0(current_state[1]), .Y(n839) );
  OAI2BB1XL U1069 ( .A0N(n841), .A1N(n840), .B0(n839), .Y(N3617) );
  OAI22XL U1070 ( .A0(n867), .A1(n866), .B0(n865), .B1(n864), .Y(n868) );
  AOI211XL U1071 ( .A0(n871), .A1(n870), .B0(n869), .C0(n868), .Y(n873) );
  AOI21XL U1072 ( .A0(n874), .A1(n873), .B0(n872), .Y(n875) );
  INVXL U1073 ( .A(n876), .Y(n882) );
  OAI21XL U1074 ( .A0(n879), .A1(n878), .B0(n877), .Y(n880) );
  OAI211XL U1075 ( .A0(n883), .A1(n882), .B0(n881), .C0(n880), .Y(n884) );
  INVXL U1076 ( .A(n900), .Y(n897) );
  NAND2XL U1077 ( .A(answer[0]), .B(n897), .Y(n895) );
  NAND2XL U1078 ( .A(answer[1]), .B(n897), .Y(n898) );
  OAI2BB2XL U1079 ( .B0(n917), .B1(n946), .A0N(answer[8]), .A1N(n903), .Y(n497) );
  OAI2BB2XL U1080 ( .B0(n917), .B1(n947), .A0N(answer[9]), .A1N(n903), .Y(n496) );
  OAI2BB2XL U1081 ( .B0(n917), .B1(n961), .A0N(answer[22]), .A1N(n905), .Y(
        n481) );
  OAI2BB2XL U1082 ( .B0(n917), .B1(n962), .A0N(answer[23]), .A1N(n905), .Y(
        n480) );
  OAI2BB2XL U1083 ( .B0(n917), .B1(n976), .A0N(answer[36]), .A1N(n907), .Y(
        n465) );
  OAI2BB2XL U1084 ( .B0(n917), .B1(n977), .A0N(answer[37]), .A1N(n907), .Y(
        n464) );
  OAI2BB2XL U1085 ( .B0(n917), .B1(n990), .A0N(answer[50]), .A1N(n909), .Y(
        n449) );
  OAI2BB2XL U1086 ( .B0(n917), .B1(n991), .A0N(answer[51]), .A1N(n909), .Y(
        n448) );
  OAI2BB2XL U1087 ( .B0(n917), .B1(n1005), .A0N(answer[64]), .A1N(n911), .Y(
        n433) );
  OAI2BB2XL U1088 ( .B0(n917), .B1(n1006), .A0N(answer[65]), .A1N(n911), .Y(
        n432) );
  OAI2BB2XL U1089 ( .B0(n917), .B1(n1020), .A0N(answer[78]), .A1N(n913), .Y(
        n417) );
  OAI2BB2XL U1090 ( .B0(n917), .B1(n1021), .A0N(answer[79]), .A1N(n913), .Y(
        n416) );
  OAI2BB2XL U1091 ( .B0(n917), .B1(n1034), .A0N(answer[92]), .A1N(n916), .Y(
        n401) );
  OAI2BB2XL U1092 ( .B0(n917), .B1(n1035), .A0N(answer[93]), .A1N(n916), .Y(
        n400) );
endmodule

