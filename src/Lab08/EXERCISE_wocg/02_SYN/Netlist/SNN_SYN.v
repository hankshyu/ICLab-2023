/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03
// Date      : Sun Apr 23 01:30:57 2023
/////////////////////////////////////////////////////////////


module SNN ( clk, rst_n, in_valid, img, ker, weight, out_valid, out_data );
  input [7:0] img;
  input [7:0] ker;
  input [7:0] weight;
  output [9:0] out_data;
  input clk, rst_n, in_valid;
  output out_valid;
  wire   scmp_result, N192, N193, N194, N195, N196, N197, N198,
         flatten_arr2_3__7_, flatten_arr2_3__6_, flatten_arr2_3__5_,
         flatten_arr2_3__4_, flatten_arr2_3__3_, flatten_arr2_3__2_,
         flatten_arr2_3__1_, flatten_arr2_3__0_, N988, N989, N990, N991, N992,
         N993, N994, N995, N996, N997, N1000, N1001, N1002, N1003, N1004,
         N1005, N1006, N1009, N1010, N1011, N1012, N1013, N1014, N1015, N1016,
         N1017, N1018, N1029, N1030, N1031, N1032, N1033, N1034, N1035, N1036,
         N1037, N1038, n898, n899, n900, n901, n902, n903, n904, n905, n906,
         n907, n908, n909, n910, n911, n912, n913, n914, n915, n916, n917,
         n918, n919, n920, n921, n922, n923, n924, n925, n926, n927, n928,
         n929, n930, n931, n932, n933, n934, n935, n936, n937, n938, n939,
         n940, n941, n942, n943, n944, n945, n946, n947, n951, n955, n959,
         n963, n967, n971, n975, n979, n980, n981, n982, n983, n984, n985,
         n986, n987, n988, n989, n990, n991, n992, n993, n994, n995, n996,
         n997, n998, n999, n1000, n1001, n1002, n1003, n1004, n1005, n1006,
         n1007, n1008, n1009, n1010, n1011, n1012, n1013, n1014, n1015, n1016,
         n1017, n1018, n1019, n1020, n1021, n1022, n1023, n1024, n1025, n1026,
         n1027, n1044, n1045, n1046, n1047, n1048, n1049, n1050, n1051, n1052,
         n1053, n1054, n1055, n1056, n1057, n1058, n1059, n1060, n1061, n1062,
         n1063, n1064, n1065, n1066, n1067, n1068, n1069, n1070, n1071, n1072,
         n1073, n1074, n1075, n1076, n1077, n1078, n1079, n1080, n1081, n1082,
         n1083, n1084, n1085, n1086, n1087, n1088, n1089, n1090, n1091, n1092,
         n1093, n1094, n1095, n1096, n1097, n1098, n1099, n1100, n1101, n1102,
         n1103, n1104, n1105, n1106, n1107, n1108, n1109, n1110, n1111, n1112,
         n1113, n1114, n1115, n1116, n1117, n1118, n1119, n1120, n1121, n1122,
         n1123, n1124, n1125, n1126, n1127, n1128, n1129, n1130, n1131, n1132,
         n1133, n1134, n1135, n1136, n1137, n1138, n1139, n1140, n1141, n1142,
         n1143, n1144, n1145, n1146, n1147, n1148, n1149, n1150, n1151, n1152,
         n1153, n1154, n1155, n1164, n1165, n1166, n1167, n1168, n1169, n1170,
         N1271, N1270, N1269, N1268, N1267, N1266, N1265, N1264, N1263, N1262,
         smult_out_8__9_, smult_out_8__8_, smult_out_8__7_, smult_out_8__6_,
         smult_out_8__5_, smult_out_8__4_, smult_out_8__3_, smult_out_8__2_,
         smult_out_8__1_, smult_out_8__15_, smult_out_8__14_, smult_out_8__13_,
         smult_out_8__12_, smult_out_8__11_, smult_out_8__10_, smult_out_8__0_,
         smult_out_7__9_, smult_out_7__8_, smult_out_7__7_, smult_out_7__6_,
         smult_out_7__5_, smult_out_7__4_, smult_out_7__3_, smult_out_7__2_,
         smult_out_7__1_, smult_out_7__15_, smult_out_7__14_, smult_out_7__13_,
         smult_out_7__12_, smult_out_7__11_, smult_out_7__10_, smult_out_7__0_,
         smult_out_6__9_, smult_out_6__8_, smult_out_6__7_, smult_out_6__6_,
         smult_out_6__5_, smult_out_6__4_, smult_out_6__3_, smult_out_6__2_,
         smult_out_6__1_, smult_out_6__15_, smult_out_6__14_, smult_out_6__13_,
         smult_out_6__12_, smult_out_6__11_, smult_out_6__10_, smult_out_6__0_,
         smult_out_5__9_, smult_out_5__8_, smult_out_5__7_, smult_out_5__6_,
         smult_out_5__5_, smult_out_5__4_, smult_out_5__3_, smult_out_5__2_,
         smult_out_5__1_, smult_out_5__15_, smult_out_5__14_, smult_out_5__13_,
         smult_out_5__12_, smult_out_5__11_, smult_out_5__10_, smult_out_5__0_,
         smult_out_4__9_, smult_out_4__8_, smult_out_4__7_, smult_out_4__6_,
         smult_out_4__5_, smult_out_4__4_, smult_out_4__3_, smult_out_4__2_,
         smult_out_4__1_, smult_out_4__15_, smult_out_4__14_, smult_out_4__13_,
         smult_out_4__12_, smult_out_4__11_, smult_out_4__10_, smult_out_4__0_,
         smult_out_3__9_, smult_out_3__8_, smult_out_3__7_, smult_out_3__6_,
         smult_out_3__5_, smult_out_3__4_, smult_out_3__3_, smult_out_3__2_,
         smult_out_3__1_, smult_out_3__15_, smult_out_3__14_, smult_out_3__13_,
         smult_out_3__12_, smult_out_3__11_, smult_out_3__10_, smult_out_3__0_,
         smult_out_2__9_, smult_out_2__8_, smult_out_2__7_, smult_out_2__6_,
         smult_out_2__5_, smult_out_2__4_, smult_out_2__3_, smult_out_2__2_,
         smult_out_2__1_, smult_out_2__15_, smult_out_2__14_, smult_out_2__13_,
         smult_out_2__12_, smult_out_2__11_, smult_out_2__10_, smult_out_2__0_,
         N99, N98, N97, N96, N95, N94, N93, N92, N145, N144, N143, N142, N141,
         N140, N139, N138, N137, N136, N135, N134, N133, N132, N131, N130,
         N129, N108, N107, N106, N105, N104, N103, N102, N101, N100,
         smult_out_1__9_, smult_out_1__8_, smult_out_1__7_, smult_out_1__6_,
         smult_out_1__5_, smult_out_1__4_, smult_out_1__3_, smult_out_1__2_,
         smult_out_1__1_, smult_out_1__15_, smult_out_1__14_, smult_out_1__13_,
         smult_out_1__12_, smult_out_1__11_, smult_out_1__10_, smult_out_1__0_,
         smult_out_0__9_, smult_out_0__8_, smult_out_0__7_, smult_out_0__6_,
         smult_out_0__5_, smult_out_0__4_, smult_out_0__3_, smult_out_0__2_,
         smult_out_0__1_, smult_out_0__15_, smult_out_0__14_, smult_out_0__13_,
         smult_out_0__12_, smult_out_0__11_, smult_out_0__10_, smult_out_0__0_,
         div_82_u_div_BInv_3__14_, div_82_u_div_BInv_3__13_,
         div_82_u_div_BInv_3__12_, div_82_u_div_BInv_3__11_,
         div_82_u_div_BInv_3__10_, div_82_u_div_BInv_3__9_,
         div_82_u_div_BInv_3__8_, div_82_u_div_BInv_3__7_,
         div_82_u_div_BInv_3__6_, div_82_u_div_BInv_3__5_,
         div_82_u_div_BInv_3__4_, div_82_u_div_BInv_3__3_,
         div_82_u_div_BInv_3__2_, div_82_u_div_BInv_3__1_,
         div_82_u_div_BInv_3__0_, div_82_u_div_BInv_5__14_,
         div_82_u_div_BInv_5__13_, div_82_u_div_BInv_5__12_,
         div_82_u_div_BInv_5__11_, div_82_u_div_BInv_5__10_,
         div_82_u_div_BInv_5__8_, div_82_u_div_BInv_5__7_,
         div_82_u_div_BInv_5__6_, div_82_u_div_BInv_5__5_,
         div_82_u_div_BInv_5__4_, div_82_u_div_BInv_5__3_,
         div_82_u_div_BInv_5__2_, div_82_u_div_BInv_5__1_,
         div_82_u_div_BInv_5__0_, div_82_u_div_BInv_6__14_,
         div_82_u_div_BInv_6__13_, div_82_u_div_BInv_6__12_,
         div_82_u_div_BInv_6__11_, div_82_u_div_BInv_6__10_,
         div_82_u_div_BInv_6__9_, div_82_u_div_BInv_6__8_,
         div_82_u_div_BInv_6__7_, div_82_u_div_BInv_6__6_,
         div_82_u_div_BInv_6__5_, div_82_u_div_BInv_6__4_,
         div_82_u_div_BInv_6__3_, div_82_u_div_BInv_6__2_,
         div_82_u_div_BInv_6__1_, div_82_u_div_BInv_7__14_,
         div_82_u_div_BInv_7__13_, div_82_u_div_BInv_7__12_,
         div_82_u_div_BInv_7__11_, div_82_u_div_BInv_7__10_,
         div_82_u_div_BInv_7__9_, div_82_u_div_BInv_7__8_,
         div_82_u_div_BInv_7__7_, div_82_u_div_BInv_7__6_,
         div_82_u_div_BInv_7__5_, div_82_u_div_BInv_7__3_,
         div_82_u_div_BInv_7__2_, div_82_u_div_BInv_7__1_,
         div_82_u_div_BInv_7__0_, div_82_u_div_PartRem_6__5_,
         div_82_u_div_PartRem_3__14_, div_82_u_div_PartRem_3__13_,
         div_82_u_div_PartRem_3__12_, div_82_u_div_PartRem_3__11_,
         div_82_u_div_PartRem_3__10_, div_82_u_div_PartRem_3__9_,
         div_82_u_div_PartRem_3__8_, div_82_u_div_PartRem_3__7_,
         div_82_u_div_PartRem_3__6_, div_82_u_div_PartRem_3__5_,
         div_82_u_div_PartRem_3__4_, div_82_u_div_PartRem_3__3_,
         div_82_u_div_PartRem_2__14_, div_82_u_div_PartRem_2__13_,
         div_82_u_div_PartRem_2__12_, div_82_u_div_PartRem_2__11_,
         div_82_u_div_PartRem_2__10_, div_82_u_div_PartRem_2__9_,
         div_82_u_div_PartRem_2__8_, div_82_u_div_PartRem_2__7_,
         div_82_u_div_PartRem_2__6_, div_82_u_div_PartRem_1__14_,
         div_82_u_div_PartRem_1__13_, div_82_u_div_PartRem_1__12_,
         div_82_u_div_PartRem_1__11_, div_82_u_div_PartRem_1__10_,
         div_82_u_div_PartRem_1__9_, div_82_u_div_PartRem_1__8_,
         div_82_u_div_PartRem_1__7_, div_82_u_div_PartRem_1__5_,
         div_82_u_div_PartRem_1__4_, div_82_u_div_PartRem_1__3_,
         div_82_u_div_CryOut_1__6_, div_82_u_div_CryOut_1__5_,
         div_82_u_div_CryOut_1__4_, div_82_u_div_CryOut_1__3_,
         div_82_u_div_CryOut_1__2_, div_82_u_div_CryOut_1__1_,
         div_82_u_div_CryOut_1__0_, div_82_u_div_CryOut_2__6_,
         div_82_u_div_CryOut_2__5_, div_82_u_div_CryOut_2__4_,
         div_82_u_div_CryOut_2__3_, div_82_u_div_CryOut_2__2_,
         div_82_u_div_CryOut_2__1_, div_82_u_div_CryOut_2__0_,
         div_82_u_div_CryOut_3__6_, div_82_u_div_CryOut_3__5_,
         div_82_u_div_CryOut_3__4_, div_82_u_div_CryOut_3__3_,
         div_82_u_div_CryOut_3__2_, div_82_u_div_CryOut_3__1_,
         div_82_u_div_CryOut_3__0_, div_82_u_div_CryOut_5__5_,
         div_82_u_div_CryOut_5__4_, div_82_u_div_CryOut_5__3_,
         div_82_u_div_CryOut_5__2_, div_82_u_div_CryOut_5__1_,
         div_82_u_div_CryOut_5__0_, div_82_u_div_CryOut_6__5_,
         div_82_u_div_CryOut_6__4_, div_82_u_div_CryOut_6__3_,
         div_82_u_div_CryOut_6__2_, div_82_u_div_CryOut_6__1_,
         div_82_u_div_CryOut_6__0_, div_82_u_div_CryOut_7__5_,
         div_82_u_div_CryOut_7__4_, div_82_u_div_CryOut_7__3_,
         div_82_u_div_CryOut_7__2_, div_82_u_div_CryOut_7__1_,
         div_82_u_div_CryOut_7__0_, div_82_u_div_SumTmp_1__6__2_,
         div_82_u_div_SumTmp_1__6__1_, div_82_u_div_SumTmp_1__6__0_,
         div_82_u_div_SumTmp_1__5__5_, div_82_u_div_SumTmp_1__5__4_,
         div_82_u_div_SumTmp_1__5__3_, div_82_u_div_SumTmp_1__5__2_,
         div_82_u_div_SumTmp_1__5__1_, div_82_u_div_SumTmp_1__5__0_,
         div_82_u_div_SumTmp_1__4__8_, div_82_u_div_SumTmp_1__4__7_,
         div_82_u_div_SumTmp_1__4__6_, div_82_u_div_SumTmp_1__4__5_,
         div_82_u_div_SumTmp_1__4__4_, div_82_u_div_SumTmp_1__4__3_,
         div_82_u_div_SumTmp_1__4__2_, div_82_u_div_SumTmp_1__4__1_,
         div_82_u_div_SumTmp_1__4__0_, div_82_u_div_SumTmp_1__3__11_,
         div_82_u_div_SumTmp_1__3__10_, div_82_u_div_SumTmp_1__3__9_,
         div_82_u_div_SumTmp_1__3__8_, div_82_u_div_SumTmp_1__3__7_,
         div_82_u_div_SumTmp_1__3__6_, div_82_u_div_SumTmp_1__3__5_,
         div_82_u_div_SumTmp_1__3__4_, div_82_u_div_SumTmp_1__3__3_,
         div_82_u_div_SumTmp_1__3__2_, div_82_u_div_SumTmp_1__3__1_,
         div_82_u_div_SumTmp_1__3__0_, div_82_u_div_SumTmp_1__2__11_,
         div_82_u_div_SumTmp_1__2__10_, div_82_u_div_SumTmp_1__2__9_,
         div_82_u_div_SumTmp_1__2__8_, div_82_u_div_SumTmp_1__2__7_,
         div_82_u_div_SumTmp_1__2__6_, div_82_u_div_SumTmp_1__2__5_,
         div_82_u_div_SumTmp_1__2__4_, div_82_u_div_SumTmp_1__2__3_,
         div_82_u_div_SumTmp_1__2__2_, div_82_u_div_SumTmp_1__2__1_,
         div_82_u_div_SumTmp_1__2__0_, div_82_u_div_SumTmp_1__1__11_,
         div_82_u_div_SumTmp_1__1__10_, div_82_u_div_SumTmp_1__1__9_,
         div_82_u_div_SumTmp_1__1__8_, div_82_u_div_SumTmp_1__1__7_,
         div_82_u_div_SumTmp_1__1__6_, div_82_u_div_SumTmp_1__1__5_,
         div_82_u_div_SumTmp_1__1__4_, div_82_u_div_SumTmp_1__1__3_,
         div_82_u_div_SumTmp_1__1__2_, div_82_u_div_SumTmp_1__1__1_,
         div_82_u_div_SumTmp_1__1__0_, div_82_u_div_SumTmp_2__6__2_,
         div_82_u_div_SumTmp_2__6__1_, div_82_u_div_SumTmp_2__6__0_,
         div_82_u_div_SumTmp_2__5__5_, div_82_u_div_SumTmp_2__5__4_,
         div_82_u_div_SumTmp_2__5__3_, div_82_u_div_SumTmp_2__5__2_,
         div_82_u_div_SumTmp_2__5__1_, div_82_u_div_SumTmp_2__5__0_,
         div_82_u_div_SumTmp_2__4__8_, div_82_u_div_SumTmp_2__4__7_,
         div_82_u_div_SumTmp_2__4__6_, div_82_u_div_SumTmp_2__4__5_,
         div_82_u_div_SumTmp_2__4__4_, div_82_u_div_SumTmp_2__4__3_,
         div_82_u_div_SumTmp_2__4__2_, div_82_u_div_SumTmp_2__4__1_,
         div_82_u_div_SumTmp_2__4__0_, div_82_u_div_SumTmp_2__3__11_,
         div_82_u_div_SumTmp_2__3__10_, div_82_u_div_SumTmp_2__3__9_,
         div_82_u_div_SumTmp_2__3__8_, div_82_u_div_SumTmp_2__3__7_,
         div_82_u_div_SumTmp_2__3__6_, div_82_u_div_SumTmp_2__3__5_,
         div_82_u_div_SumTmp_2__3__4_, div_82_u_div_SumTmp_2__3__3_,
         div_82_u_div_SumTmp_2__3__2_, div_82_u_div_SumTmp_2__3__1_,
         div_82_u_div_SumTmp_2__3__0_, div_82_u_div_SumTmp_2__2__11_,
         div_82_u_div_SumTmp_2__2__10_, div_82_u_div_SumTmp_2__2__9_,
         div_82_u_div_SumTmp_2__2__8_, div_82_u_div_SumTmp_2__2__7_,
         div_82_u_div_SumTmp_2__2__6_, div_82_u_div_SumTmp_2__2__5_,
         div_82_u_div_SumTmp_2__2__4_, div_82_u_div_SumTmp_2__2__3_,
         div_82_u_div_SumTmp_2__2__2_, div_82_u_div_SumTmp_2__2__1_,
         div_82_u_div_SumTmp_2__2__0_, div_82_u_div_SumTmp_2__1__11_,
         div_82_u_div_SumTmp_2__1__10_, div_82_u_div_SumTmp_2__1__9_,
         div_82_u_div_SumTmp_2__1__8_, div_82_u_div_SumTmp_2__1__7_,
         div_82_u_div_SumTmp_2__1__6_, div_82_u_div_SumTmp_2__1__5_,
         div_82_u_div_SumTmp_2__1__4_, div_82_u_div_SumTmp_2__1__3_,
         div_82_u_div_SumTmp_2__1__2_, div_82_u_div_SumTmp_2__1__1_,
         div_82_u_div_SumTmp_2__1__0_, div_82_u_div_SumTmp_3__6__2_,
         div_82_u_div_SumTmp_3__6__1_, div_82_u_div_SumTmp_3__6__0_,
         div_82_u_div_SumTmp_3__5__5_, div_82_u_div_SumTmp_3__5__4_,
         div_82_u_div_SumTmp_3__5__3_, div_82_u_div_SumTmp_3__5__2_,
         div_82_u_div_SumTmp_3__5__1_, div_82_u_div_SumTmp_3__5__0_,
         div_82_u_div_SumTmp_3__4__8_, div_82_u_div_SumTmp_3__4__7_,
         div_82_u_div_SumTmp_3__4__6_, div_82_u_div_SumTmp_3__4__5_,
         div_82_u_div_SumTmp_3__4__4_, div_82_u_div_SumTmp_3__4__3_,
         div_82_u_div_SumTmp_3__4__2_, div_82_u_div_SumTmp_3__4__1_,
         div_82_u_div_SumTmp_3__4__0_, div_82_u_div_SumTmp_3__3__11_,
         div_82_u_div_SumTmp_3__3__10_, div_82_u_div_SumTmp_3__3__9_,
         div_82_u_div_SumTmp_3__3__8_, div_82_u_div_SumTmp_3__3__7_,
         div_82_u_div_SumTmp_3__3__6_, div_82_u_div_SumTmp_3__3__5_,
         div_82_u_div_SumTmp_3__3__4_, div_82_u_div_SumTmp_3__3__3_,
         div_82_u_div_SumTmp_3__3__2_, div_82_u_div_SumTmp_3__3__1_,
         div_82_u_div_SumTmp_3__3__0_, div_82_u_div_SumTmp_3__2__11_,
         div_82_u_div_SumTmp_3__2__10_, div_82_u_div_SumTmp_3__2__9_,
         div_82_u_div_SumTmp_3__2__8_, div_82_u_div_SumTmp_3__2__7_,
         div_82_u_div_SumTmp_3__2__6_, div_82_u_div_SumTmp_3__2__5_,
         div_82_u_div_SumTmp_3__2__4_, div_82_u_div_SumTmp_3__2__3_,
         div_82_u_div_SumTmp_3__2__2_, div_82_u_div_SumTmp_3__2__1_,
         div_82_u_div_SumTmp_3__2__0_, div_82_u_div_SumTmp_3__1__11_,
         div_82_u_div_SumTmp_3__1__10_, div_82_u_div_SumTmp_3__1__9_,
         div_82_u_div_SumTmp_3__1__8_, div_82_u_div_SumTmp_3__1__7_,
         div_82_u_div_SumTmp_3__1__6_, div_82_u_div_SumTmp_3__1__5_,
         div_82_u_div_SumTmp_3__1__4_, div_82_u_div_SumTmp_3__1__3_,
         div_82_u_div_SumTmp_3__1__2_, div_82_u_div_SumTmp_3__1__1_,
         div_82_u_div_SumTmp_3__1__0_, div_82_u_div_SumTmp_4__5__5_,
         div_82_u_div_SumTmp_4__5__4_, div_82_u_div_SumTmp_4__5__3_,
         div_82_u_div_SumTmp_4__5__2_, div_82_u_div_SumTmp_4__5__1_,
         div_82_u_div_SumTmp_4__5__0_, div_82_u_div_SumTmp_4__4__8_,
         div_82_u_div_SumTmp_4__4__7_, div_82_u_div_SumTmp_4__4__6_,
         div_82_u_div_SumTmp_4__4__5_, div_82_u_div_SumTmp_4__4__4_,
         div_82_u_div_SumTmp_4__4__3_, div_82_u_div_SumTmp_4__4__2_,
         div_82_u_div_SumTmp_4__4__1_, div_82_u_div_SumTmp_4__4__0_,
         div_82_u_div_SumTmp_4__3__11_, div_82_u_div_SumTmp_4__3__10_,
         div_82_u_div_SumTmp_4__3__9_, div_82_u_div_SumTmp_4__3__8_,
         div_82_u_div_SumTmp_4__3__7_, div_82_u_div_SumTmp_4__3__6_,
         div_82_u_div_SumTmp_4__3__5_, div_82_u_div_SumTmp_4__3__4_,
         div_82_u_div_SumTmp_4__3__3_, div_82_u_div_SumTmp_4__3__2_,
         div_82_u_div_SumTmp_4__3__1_, div_82_u_div_SumTmp_4__3__0_,
         div_82_u_div_SumTmp_4__2__11_, div_82_u_div_SumTmp_4__2__10_,
         div_82_u_div_SumTmp_4__2__9_, div_82_u_div_SumTmp_4__2__8_,
         div_82_u_div_SumTmp_4__2__7_, div_82_u_div_SumTmp_4__2__6_,
         div_82_u_div_SumTmp_4__2__5_, div_82_u_div_SumTmp_4__2__4_,
         div_82_u_div_SumTmp_4__2__3_, div_82_u_div_SumTmp_4__2__2_,
         div_82_u_div_SumTmp_4__2__1_, div_82_u_div_SumTmp_4__2__0_,
         div_82_u_div_SumTmp_4__1__11_, div_82_u_div_SumTmp_4__1__10_,
         div_82_u_div_SumTmp_4__1__9_, div_82_u_div_SumTmp_4__1__8_,
         div_82_u_div_SumTmp_4__1__7_, div_82_u_div_SumTmp_4__1__6_,
         div_82_u_div_SumTmp_4__1__5_, div_82_u_div_SumTmp_4__1__4_,
         div_82_u_div_SumTmp_4__1__3_, div_82_u_div_SumTmp_4__1__2_,
         div_82_u_div_SumTmp_4__1__1_, div_82_u_div_SumTmp_4__1__0_,
         div_82_u_div_SumTmp_5__5__5_, div_82_u_div_SumTmp_5__5__4_,
         div_82_u_div_SumTmp_5__5__3_, div_82_u_div_SumTmp_5__5__2_,
         div_82_u_div_SumTmp_5__5__1_, div_82_u_div_SumTmp_5__5__0_,
         div_82_u_div_SumTmp_5__4__8_, div_82_u_div_SumTmp_5__4__7_,
         div_82_u_div_SumTmp_5__4__6_, div_82_u_div_SumTmp_5__4__5_,
         div_82_u_div_SumTmp_5__4__4_, div_82_u_div_SumTmp_5__4__3_,
         div_82_u_div_SumTmp_5__4__2_, div_82_u_div_SumTmp_5__4__1_,
         div_82_u_div_SumTmp_5__4__0_, div_82_u_div_SumTmp_5__3__11_,
         div_82_u_div_SumTmp_5__3__10_, div_82_u_div_SumTmp_5__3__9_,
         div_82_u_div_SumTmp_5__3__8_, div_82_u_div_SumTmp_5__3__7_,
         div_82_u_div_SumTmp_5__3__6_, div_82_u_div_SumTmp_5__3__5_,
         div_82_u_div_SumTmp_5__3__4_, div_82_u_div_SumTmp_5__3__3_,
         div_82_u_div_SumTmp_5__3__2_, div_82_u_div_SumTmp_5__3__1_,
         div_82_u_div_SumTmp_5__3__0_, div_82_u_div_SumTmp_5__2__11_,
         div_82_u_div_SumTmp_5__2__10_, div_82_u_div_SumTmp_5__2__9_,
         div_82_u_div_SumTmp_5__2__8_, div_82_u_div_SumTmp_5__2__7_,
         div_82_u_div_SumTmp_5__2__6_, div_82_u_div_SumTmp_5__2__5_,
         div_82_u_div_SumTmp_5__2__4_, div_82_u_div_SumTmp_5__2__3_,
         div_82_u_div_SumTmp_5__2__2_, div_82_u_div_SumTmp_5__2__1_,
         div_82_u_div_SumTmp_5__2__0_, div_82_u_div_SumTmp_5__1__11_,
         div_82_u_div_SumTmp_5__1__10_, div_82_u_div_SumTmp_5__1__9_,
         div_82_u_div_SumTmp_5__1__8_, div_82_u_div_SumTmp_5__1__7_,
         div_82_u_div_SumTmp_5__1__6_, div_82_u_div_SumTmp_5__1__5_,
         div_82_u_div_SumTmp_5__1__4_, div_82_u_div_SumTmp_5__1__3_,
         div_82_u_div_SumTmp_5__1__2_, div_82_u_div_SumTmp_5__1__1_,
         div_82_u_div_SumTmp_5__1__0_, div_82_u_div_SumTmp_6__5__5_,
         div_82_u_div_SumTmp_6__5__4_, div_82_u_div_SumTmp_6__5__3_,
         div_82_u_div_SumTmp_6__5__2_, div_82_u_div_SumTmp_6__5__1_,
         div_82_u_div_SumTmp_6__5__0_, div_82_u_div_SumTmp_6__4__8_,
         div_82_u_div_SumTmp_6__4__7_, div_82_u_div_SumTmp_6__4__6_,
         div_82_u_div_SumTmp_6__4__5_, div_82_u_div_SumTmp_6__4__4_,
         div_82_u_div_SumTmp_6__4__3_, div_82_u_div_SumTmp_6__4__2_,
         div_82_u_div_SumTmp_6__4__1_, div_82_u_div_SumTmp_6__4__0_,
         div_82_u_div_SumTmp_6__3__11_, div_82_u_div_SumTmp_6__3__10_,
         div_82_u_div_SumTmp_6__3__9_, div_82_u_div_SumTmp_6__3__8_,
         div_82_u_div_SumTmp_6__3__7_, div_82_u_div_SumTmp_6__3__6_,
         div_82_u_div_SumTmp_6__3__5_, div_82_u_div_SumTmp_6__3__4_,
         div_82_u_div_SumTmp_6__3__3_, div_82_u_div_SumTmp_6__3__2_,
         div_82_u_div_SumTmp_6__3__1_, div_82_u_div_SumTmp_6__3__0_,
         div_82_u_div_SumTmp_6__2__11_, div_82_u_div_SumTmp_6__2__10_,
         div_82_u_div_SumTmp_6__2__9_, div_82_u_div_SumTmp_6__2__8_,
         div_82_u_div_SumTmp_6__2__7_, div_82_u_div_SumTmp_6__2__6_,
         div_82_u_div_SumTmp_6__2__5_, div_82_u_div_SumTmp_6__2__4_,
         div_82_u_div_SumTmp_6__2__3_, div_82_u_div_SumTmp_6__2__2_,
         div_82_u_div_SumTmp_6__2__1_, div_82_u_div_SumTmp_6__2__0_,
         div_82_u_div_SumTmp_6__1__11_, div_82_u_div_SumTmp_6__1__10_,
         div_82_u_div_SumTmp_6__1__9_, div_82_u_div_SumTmp_6__1__8_,
         div_82_u_div_SumTmp_6__1__7_, div_82_u_div_SumTmp_6__1__6_,
         div_82_u_div_SumTmp_6__1__5_, div_82_u_div_SumTmp_6__1__4_,
         div_82_u_div_SumTmp_6__1__3_, div_82_u_div_SumTmp_6__1__2_,
         div_82_u_div_SumTmp_6__1__1_, div_82_u_div_SumTmp_6__1__0_,
         div_82_u_div_SumTmp_7__5__5_, div_82_u_div_SumTmp_7__5__4_,
         div_82_u_div_SumTmp_7__5__3_, div_82_u_div_SumTmp_7__5__2_,
         div_82_u_div_SumTmp_7__5__1_, div_82_u_div_SumTmp_7__5__0_,
         div_82_u_div_SumTmp_7__4__8_, div_82_u_div_SumTmp_7__4__7_,
         div_82_u_div_SumTmp_7__4__6_, div_82_u_div_SumTmp_7__4__5_,
         div_82_u_div_SumTmp_7__4__4_, div_82_u_div_SumTmp_7__4__3_,
         div_82_u_div_SumTmp_7__4__2_, div_82_u_div_SumTmp_7__4__1_,
         div_82_u_div_SumTmp_7__4__0_, div_82_u_div_SumTmp_7__3__11_,
         div_82_u_div_SumTmp_7__3__10_, div_82_u_div_SumTmp_7__3__9_,
         div_82_u_div_SumTmp_7__3__8_, div_82_u_div_SumTmp_7__3__7_,
         div_82_u_div_SumTmp_7__3__6_, div_82_u_div_SumTmp_7__3__5_,
         div_82_u_div_SumTmp_7__3__4_, div_82_u_div_SumTmp_7__3__3_,
         div_82_u_div_SumTmp_7__3__2_, div_82_u_div_SumTmp_7__3__1_,
         div_82_u_div_SumTmp_7__3__0_, div_82_u_div_SumTmp_7__2__11_,
         div_82_u_div_SumTmp_7__2__10_, div_82_u_div_SumTmp_7__2__9_,
         div_82_u_div_SumTmp_7__2__8_, div_82_u_div_SumTmp_7__2__7_,
         div_82_u_div_SumTmp_7__2__6_, div_82_u_div_SumTmp_7__2__5_,
         div_82_u_div_SumTmp_7__2__4_, div_82_u_div_SumTmp_7__2__3_,
         div_82_u_div_SumTmp_7__2__2_, div_82_u_div_SumTmp_7__2__1_,
         div_82_u_div_SumTmp_7__2__0_, div_82_u_div_SumTmp_7__1__11_,
         div_82_u_div_SumTmp_7__1__10_, div_82_u_div_SumTmp_7__1__9_,
         div_82_u_div_SumTmp_7__1__8_, div_82_u_div_SumTmp_7__1__7_,
         div_82_u_div_SumTmp_7__1__6_, div_82_u_div_SumTmp_7__1__5_,
         div_82_u_div_SumTmp_7__1__4_, div_82_u_div_SumTmp_7__1__3_,
         div_82_u_div_SumTmp_7__1__2_, div_82_u_div_SumTmp_7__1__1_,
         div_82_u_div_SumTmp_7__1__0_, div_82_quotient_8_, div_82_quotient_11_,
         div_82_quotient_14_, div_82_quotient_17_, n1172, n1173, n1174, n1175,
         n1176, n1177, n1178, n1179, n1180, n1181, n1182, n1183, n1184, n1185,
         n1186, n1187, n1188, n1189, n1190, n1191, n1192, n1193, n1194, n1195,
         n1196, n1197, n1198, n1199, n1200, n1201, n1202, n1203, n1204, n1205,
         n1206, n1207, n1208, n1209, n1210, n1211, n1212, n1213, n1214, n1215,
         n1216, n1217, n1218, n1219, n1220, n1221, n1222, n1223, n1224, n1225,
         n1226, n1227, n1228, n1229, n1230, n1231, n1232, n1233, n1234, n1235,
         n1236, n1237, n1238, n1239, n1240, n1241, n1242, n1243, n1244, n1245,
         n1246, n1247, n1248, n1249, n1250, n1251, n1252, n1253, n1254, n1255,
         n1256, n1257, n1258, n1259, n1260, n1261, n1262, n1263, n1264, n1265,
         n1266, n1267, n1268, n1269, n1270, n1271, n1272, n1273, n1274, n1275,
         n1276, n1277, n1278, n1279, n1280, n1281, n1282, n1283, n1284, n1285,
         n1286, n1287, n1288, n1289, n1290, n1291, n1292, n1293, n1294, n1295,
         n1296, n1297, n1298, n1299, n1300, n1301, n1302, n1303, n1304, n1305,
         n1306, n1307, n1308, n1309, n1310, n1311, n1312, n1313, n1314, n1315,
         n1316, n1317, n1318, n1319, n1320, n1321, n1322, n1323, n1324, n1325,
         n1326, n1327, n1328, n1329, n1330, n1331, n1332, n1333, n1334, n1335,
         n1336, n1337, n1338, n1339, n1340, n1341, n1342, n1343, n1344, n1345,
         n1346, n1347, n1348, n1349, n1350, n1351, n1352, n1353, n1354, n1355,
         n1356, n1357, n1358, n1359, n1360, n1361, n1362, n1363, n1364, n1365,
         n1366, n1367, n1368, n1369, n1370, n1371, n1372, n1373, n1374, n1375,
         n1376, n1377, n1378, n1379, n1380, n1381, n1382, n1383, n1384, n1385,
         n1386, n1387, n1388, n1389, n1390, n1391, n1392, n1393, n1394, n1395,
         n1396, n1397, n1398, n1399, n1400, n1401, n1402, n1403, n1404, n1405,
         n1406, n1407, n1408, n1409, n1410, n1411, n1412, n1413, n1414, n1415,
         n1416, n1417, n1418, n1419, n1420, n1421, n1422, n1423, n1424, n1425,
         n1426, n1427, n1428, n1429, n1430, n1431, n1432, n1433, n1434, n1435,
         n1436, n1437, n1438, n1439, n1440, n1441, n1442, n1443, n1444, n1445,
         n1446, n1447, n1448, n1449, n1450, n1451, n1452, n1453, n1454, n1455,
         n1456, n1457, n1458, n1459, n1460, n1461, n1462, n1463, n1464, n1465,
         n1466, n1467, n1468, n1469, n1470, n1471, n1472, n1473, n1474, n1475,
         n1476, n1477, n1478, n1479, n1480, n1481, n1482, n1483, n1484, n1485,
         n1486, n1487, n1488, n1489, n1490, n1491, n1492, n1493, n1494, n1495,
         n1496, n1497, n1498, n1499, n1500, n1501, n1502, n1503, n1504, n1505,
         n1506, n1507, n1508, n1509, n1510, n1511, n1512, n1513, n1514, n1515,
         n1516, n1517, n1518, n1519, n1520, n1521, n1522, n1523, n1524, n1525,
         n1526, n1527, n1528, n1529, n1530, n1531, n1532, n1533, n1534, n1535,
         n1536, n1537, n1538, n1539, n1540, n1541, n1542, n1543, n1544, n1545,
         n1546, n1547, n1548, n1549, n1550, n1551, n1552, n1553, n1554, n1555,
         n1556, n1557, n1558, n1559, n1560, n1561, n1562, n1563, n1564, n1565,
         n1566, n1567, n1568, n1569, n1570, n1571, n1572, n1573, n1574, n1575,
         n1576, n1577, n1578, n1579, n1580, n1581, n1582, n1583, n1584, n1585,
         n1586, n1587, n1588, n1589, n1590, n1591, n1592, n1593, n1594, n1595,
         n1596, n1597, n1598, n1599, n1600, n1601, n1602, n1603, n1604, n1605,
         n1606, n1607, n1608, n1609, n1610, n1611, n1612, n1613, n1614, n1615,
         n1616, n1617, n1618, n1619, n1620, n1621, n1622, n1623, n1624, n1625,
         n1626, n1627, n1628, n1629, n1630, n1631, n1632, n1633, n1634, n1635,
         n1636, n1637, n1638, n1639, n1640, n1641, n1642, n1643, n1644, n1645,
         n1646, n1647, n1648, n1649, n1650, n1651, n1652, n1653, n1654, n1655,
         n1656, n1657, n1658, n1659, n1660, n1661, n1662, n1663, n1664, n1665,
         n1666, n1667, n1668, n1669, n1670, n1671, n1672, n1673, n1674, n1675,
         n1676, n1677, n1678, n1679, n1680, n1681, n1682, n1683, n1684, n1685,
         n1686, n1687, n1688, n1689, n1690, n1691, n1692, n1693, n1694, n1695,
         n1696, n1697, n1698, n1699, n1700, n1701, n1702, n1703, n1704, n1705,
         n1706, n1707, n1708, n1709, n1710, n1711, n1712, n1713, n1714, n1715,
         n1716, n1717, n1718, n1719, n1720, n1721, n1722, n1723, n1724, n1725,
         n1726, n1727, n1728, n1729, n1730, n1731, n1732, n1733, n1734, n1735,
         n1736, n1737, n1738, n1739, n1740, n1741, n1742, n1743, n1744, n1745,
         n1746, n1747, n1748, n1749, n1750, n1751, n1752, n1753, n1754, n1755,
         n1756, n1757, n1758, n1759, n1760, n1761, n1762, n1763, n1764, n1765,
         n1766, n1767, n1768, n1769, n1770, n1771, n1772, n1773, n1774, n1775,
         n1776, n1777, n1778, n1779, n1780, n1781, n1782, n1783, n1784, n1785,
         n1786, n1787, n1788, n1789, n1790, n1791, n1792, n1793, n1794, n1795,
         n1796, n1797, n1798, n1799, n1800, n1801, n1802, n1803, n1804, n1805,
         n1806, n1807, n1808, n1809, n1810, n1811, n1812, n1813, n1814, n1815,
         n1816, n1817, n1818, n1819, n1820, n1821, n1822, n1823, n1824, n1825,
         n1826, n1827, n1828, n1829, n1830, n1831, n1832, n1833, n1834, n1835,
         n1836, n1837, n1838, n1839, n1840, n1841, n1842, n1843, n1844, n1845,
         n1846, n1847, n1848, n1849, n1850, n1851, n1852, n1853, n1854, n1855,
         n1856, n1857, n1858, n1859, n1860, n1861, n1862, n1863, n1864, n1865,
         n1866, n1867, n1868, n1869, n1870, n1871, n1872, n1873, n1874, n1875,
         n1876, n1877, n1878, n1879, n1880, n1881, n1882, n1883, n1884, n1885,
         n1886, n1887, n1888, n1889, n1890, n1891, n1892, n1893, n1894, n1895,
         n1896, n1897, n1898, n1899, n1900, n1901, n1902, n1903, n1904, n1905,
         n1906, n1907, n1908, n1909, n1910, n1911, n1912, n1913, n1914, n1915,
         n1916, n1917, n1918, n1919, n1920, n1921, n1922, n1923, n1924, n1925,
         n1926, n1927, n1928, n1929, n1930, n1931, n1932, n1933, n1934, n1935,
         n1936, n1937, n1938, n1939, n1940, n1941, n1942, n1943, n1944, n1945,
         n1946, n1947, n1948, n1949, n1950, n1951, n1952, n1953, n1954, n1955,
         n1956, n1957, n1958, n1959, n1960, n1961, n1962, n1963, n1964, n1965,
         n1966, n1967, n1968, n1969, n1970, n1971, n1972, n1973, n1974, n1975,
         n1976, n1977, n1978, n1979, n1980, n1981, n1982, n1983, n1984, n1985,
         n1986, n1987, n1988, n1989, n1990, n1991, n1992, n1993, n1994, n1995,
         n1996, n1997, n1998, n1999, n2000, n2001, n2002, n2003, n2004, n2005,
         n2006, n2007, n2008, n2009, n2010, n2011, n2012, n2013, n2014, n2015,
         n2016, n2017, n2018, n2019, n2020, n2021, n2022, n2023, n2024, n2025,
         n2026, n2027, n2028, n2029, n2030, n2031, n2032, n2033, n2034, n2035,
         n2036, n2037, n2038, n2039, n2040, n2041, n2042, n2043, n2044, n2045,
         n2046, n2047, n2048, n2049, n2050, n2051, n2052, n2053, n2054, n2055,
         n2056, n2057, n2058, n2059, n2060, n2061, n2062, n2063, n2064, n2065,
         n2066, n2067, n2068, n2069, n2070, n2071, n2072, n2073, n2074, n2075,
         n2076, n2077, n2078, n2079, n2080, n2081, n2082, n2083, n2084, n2085,
         n2086, n2087, n2088, n2089, n2090, n2091, n2092, n2093, n2094, n2095,
         n2096, n2097, n2098, n2099, n2100, n2101, n2102, n2103, n2104, n2105,
         n2106, n2107, n2108, n2109, n2110, n2111, n2112, n2113, n2114, n2115,
         n2116, n2117, n2118, n2119, n2120, n2121, n2122, n2123, n2124, n2125,
         n2126, n2127, n2128, n2129, n2130, n2131, n2132, n2133, n2134, n2135,
         n2136, n2137, n2138, n2139, n2140, n2141, n2142, n2143, n2144, n2145,
         n2146, n2147, n2148, n2149, n2150, n2151, n2152, n2153, n2154, n2155,
         n2156, n2157, n2158, n2159, n2160, n2161, n2162, n2163, n2164, n2165,
         n2166, n2167, n2168, n2169, n2170, n2171, n2172, n2173, n2174, n2175,
         n2176, n2177, n2178, n2179, n2180, n2181, n2182, n2183, n2184, n2185,
         n2186, n2187, n2188, n2189, n2190, n2191, n2192, n2193, n2194, n2195,
         n2196, n2197, n2198, n2199, n2200, n2201, n2202, n2203, n2204, n2205,
         n2206, n2207, n2208, n2209, n2210, n2211, n2212, n2213, n2214, n2215,
         n2216, n2217, n2218, n2219, n2220, n2221, n2222, n2223, n2224, n2225,
         n2226, n2227, n2228, n2229, n2230, n2231, n2232, n2233, n2234, n2235,
         n2236, n2237, n2238, n2239, n2240, n2241, n2242, n2243, n2244, n2245,
         n2246, n2247, n2248, n2249, n2250, n2251, n2252, n2253, n2254, n2255,
         n2256, n2257, n2258, n2259, n2260, n2261, n2262, n2263, n2264, n2265,
         n2266, n2267, n2268, n2269, n2270, n2271, n2272, n2273, n2274, n2275,
         n2276, n2277, n2278, n2279, n2280, n2281, n2282, n2283, n2284, n2285,
         n2286, n2287, n2288, n2289, n2290, n2291, n2292, n2293, n2294, n2295,
         n2296, n2297, n2298, n2299, n2300, n2301, n2302, n2303, n2304, n2305,
         n2306, n2307, n2308, n2309, n2310, n2311, n2312, n2313, n2314, n2315,
         n2316, n2317, n2318, n2319, n2320, n2321, n2322, n2323, n2324, n2325,
         n2326, n2327, n2328, n2329, n2330, n2331, n2332, n2333, n2334, n2335,
         n2336, n2337, n2338, n2339, n2340, n2341, n2342, n2343, n2344, n2345,
         n2346, n2347, n2348, n2349, n2350, n2351, n2352, n2353, n2354, n2355,
         n2356, n2357, n2358, n2359, n2360, n2361, n2362, n2363, n2364, n2365,
         n2366, n2367, n2368, n2369, n2370, n2371, n2372, n2373, n2374, n2375,
         n2376, n2377, n2378, n2379, n2380, n2381, n2382, n2383, n2384, n2385,
         n2386, n2387, n2388, n2389, n2390, n2391, n2392, n2393, n2394, n2395,
         n2396, n2397, n2398, n2399, n2400, n2401, n2402, n2403, n2404, n2405,
         n2406, n2407, n2408, n2409, n2410, n2411, n2412, n2413, n2414, n2415,
         n2416, n2417, n2418, n2419, n2420, n2421, n2422, n2423, n2424, n2425,
         n2426, n2427, n2428, n2429, n2430, n2431, n2432, n2433, n2434, n2435,
         n2436, n2437, n2438, n2439, n2440, n2441, n2442, n2443, n2444, n2445,
         n2446, n2447, n2448, n2449, n2450, n2451, n2452, n2453, n2454, n2455,
         n2456, n2457, n2458, n2459, n2460, n2461, n2462, n2463, n2464, n2465,
         n2466, n2467, n2468, n2469, n2470, n2471, n2472, n2473, n2474, n2475,
         n2476, n2477, n2478, n2479, n2480, n2481, n2482, n2483, n2484, n2485,
         n2486, n2487, n2488, n2489, n2490, n2491, n2492, n2493, n2494, n2495,
         n2496, n2497, n2498, n2499, n2500, n2501, n2502, n2503, n2504, n2505,
         n2506, n2507, n2508, n2509, n2510, n2511, n2512, n2513, n2514, n2515,
         n2516, n2517, n2518, n2519, n2520, n2521, n2522, n2523, n2524, n2525,
         n2526, n2527, n2528, n2529, n2530, n2531, n2532, n2533, n2534, n2535,
         n2536, n2537, n2538, n2539, n2540, n2541, n2542, n2543, n2544, n2545,
         n2546, n2547, n2548, n2549, n2550, n2551, n2552, n2553, n2554, n2555,
         n2556, n2557, n2558, n2559, n2560, n2561, n2562, n2563, n2564, n2565,
         n2566, n2567, n2568, n2569, n2570, n2571, n2572, n2573, n2574, n2575,
         n2576, n2577, n2578, n2579, n2580, n2581, n2582, n2583, n2584, n2585,
         n2586, n2587, n2588, n2589, n2590, n2591, n2592, n2593, n2594, n2595,
         n2596, n2597, n2598, n2599, n2600, n2601, n2602, n2603, n2604, n2605,
         n2606, n2607, n2608, n2609, n2610, n2611, n2612, n2613, n2614, n2615,
         n2616, n2617, n2618, n2619, n2620, n2621, n2622, n2623, n2624, n2625,
         n2626, n2627, n2628, n2629, n2630, n2631, n2632, n2633, n2634, n2635,
         n2636, n2637, n2638, n2639, n2640, n2641, n2642, n2643, n2644, n2645,
         n2646, n2647, n2648, n2649, n2650, n2651, n2652, n2653, n2654, n2655,
         n2656, n2657, n2658, n2659, n2660, n2661, n2662, n2663, n2664, n2665,
         n2666, n2667, n2668, n2669, n2670, n2671, n2672, n2673, n2674, n2675,
         n2676, n2677, n2678, n2679, n2680, n2681, n2682, n2683, n2684, n2685,
         n2686, n2687, n2688, n2689, n2690, n2691, n2692, n2693, n2694, n2695,
         n2696, n2697, n2698, n2699, n2700, n2701, n2702, n2703, n2704, n2705,
         n2706, n2707, n2708, n2709, n2710, n2711, n2712, n2713, n2714, n2715,
         n2716, n2717, n2718, n2719, n2720, n2721, n2722, n2723, n2724, n2725,
         n2726, n2727, n2728, n2729, n2730, n2731, n2732, n2733, n2734, n2735,
         n2736, n2737, n2738, n2739, n2740, n2741, n2742, n2743, n2744, n2745,
         n2746, n2747, n2748, n2749, n2750, n2751, n2752, n2753, n2754, n2755,
         n2756, n2757, n2758, n2759, n2760, n2761, n2762, n2763, n2764, n2765,
         n2766, n2767, n2768, n2773, n2774, n2775, n2776, n2777, n2778, n2779,
         n2780, n2781, n2782, n2783, n2784, n2785, n2786, n2787, n2788, n2789,
         n2791, n2792, n2793, n2794, n2795, n2796, n2797, n2798, n2799, n2800,
         n2801, n2802, n2803, n2804, n2805, n2806, n2807, n2808, n2809, n2810,
         n2811, n2812, n2813, n2814, n2815, n2816, n2817, n2818, n2819, n2820,
         n2821, n2822, n2823, n2824, n2825, n2826, n2827, n2828, n2829, n2830,
         n2831, n2832, n2833, n2834, n2835, n2836, n2837, n2838, n2839, n2840,
         n2841, n2842, n2843, n2844, n2845, SYNOPSYS_UNCONNECTED_1,
         SYNOPSYS_UNCONNECTED_2, SYNOPSYS_UNCONNECTED_3,
         SYNOPSYS_UNCONNECTED_4, SYNOPSYS_UNCONNECTED_5,
         SYNOPSYS_UNCONNECTED_6, SYNOPSYS_UNCONNECTED_7,
         SYNOPSYS_UNCONNECTED_8, SYNOPSYS_UNCONNECTED_9,
         SYNOPSYS_UNCONNECTED_10, SYNOPSYS_UNCONNECTED_11,
         SYNOPSYS_UNCONNECTED_12, SYNOPSYS_UNCONNECTED_13,
         SYNOPSYS_UNCONNECTED_14, SYNOPSYS_UNCONNECTED_15,
         SYNOPSYS_UNCONNECTED_16, SYNOPSYS_UNCONNECTED_17,
         SYNOPSYS_UNCONNECTED_18, SYNOPSYS_UNCONNECTED_19,
         SYNOPSYS_UNCONNECTED_20, SYNOPSYS_UNCONNECTED_21,
         SYNOPSYS_UNCONNECTED_22, SYNOPSYS_UNCONNECTED_23,
         SYNOPSYS_UNCONNECTED_24, SYNOPSYS_UNCONNECTED_25,
         SYNOPSYS_UNCONNECTED_26, SYNOPSYS_UNCONNECTED_27,
         SYNOPSYS_UNCONNECTED_28, SYNOPSYS_UNCONNECTED_29,
         SYNOPSYS_UNCONNECTED_30, SYNOPSYS_UNCONNECTED_31,
         SYNOPSYS_UNCONNECTED_32, SYNOPSYS_UNCONNECTED_33,
         SYNOPSYS_UNCONNECTED_34, SYNOPSYS_UNCONNECTED_35,
         SYNOPSYS_UNCONNECTED_36, SYNOPSYS_UNCONNECTED_37,
         SYNOPSYS_UNCONNECTED_38, SYNOPSYS_UNCONNECTED_39,
         SYNOPSYS_UNCONNECTED_40, SYNOPSYS_UNCONNECTED_41,
         SYNOPSYS_UNCONNECTED_42, SYNOPSYS_UNCONNECTED_43,
         SYNOPSYS_UNCONNECTED_44, SYNOPSYS_UNCONNECTED_45,
         SYNOPSYS_UNCONNECTED_46, SYNOPSYS_UNCONNECTED_47,
         SYNOPSYS_UNCONNECTED_48, SYNOPSYS_UNCONNECTED_49,
         SYNOPSYS_UNCONNECTED_50, SYNOPSYS_UNCONNECTED_51,
         SYNOPSYS_UNCONNECTED_52, SYNOPSYS_UNCONNECTED_53,
         SYNOPSYS_UNCONNECTED_54, SYNOPSYS_UNCONNECTED_55,
         SYNOPSYS_UNCONNECTED_56, SYNOPSYS_UNCONNECTED_57,
         SYNOPSYS_UNCONNECTED_58, SYNOPSYS_UNCONNECTED_59,
         SYNOPSYS_UNCONNECTED_60, SYNOPSYS_UNCONNECTED_61,
         SYNOPSYS_UNCONNECTED_62, SYNOPSYS_UNCONNECTED_63,
         SYNOPSYS_UNCONNECTED_64, SYNOPSYS_UNCONNECTED_65,
         SYNOPSYS_UNCONNECTED_66, SYNOPSYS_UNCONNECTED_67,
         SYNOPSYS_UNCONNECTED_68, SYNOPSYS_UNCONNECTED_69,
         SYNOPSYS_UNCONNECTED_70, SYNOPSYS_UNCONNECTED_71,
         SYNOPSYS_UNCONNECTED_72, SYNOPSYS_UNCONNECTED_73,
         SYNOPSYS_UNCONNECTED_74, SYNOPSYS_UNCONNECTED_75,
         SYNOPSYS_UNCONNECTED_76, SYNOPSYS_UNCONNECTED_77,
         SYNOPSYS_UNCONNECTED_78, SYNOPSYS_UNCONNECTED_79,
         SYNOPSYS_UNCONNECTED_80, SYNOPSYS_UNCONNECTED_81,
         SYNOPSYS_UNCONNECTED_82, SYNOPSYS_UNCONNECTED_83,
         SYNOPSYS_UNCONNECTED_84, SYNOPSYS_UNCONNECTED_85,
         SYNOPSYS_UNCONNECTED_86, SYNOPSYS_UNCONNECTED_87,
         SYNOPSYS_UNCONNECTED_88, SYNOPSYS_UNCONNECTED_89,
         SYNOPSYS_UNCONNECTED_90, SYNOPSYS_UNCONNECTED_91,
         SYNOPSYS_UNCONNECTED_92, SYNOPSYS_UNCONNECTED_93,
         SYNOPSYS_UNCONNECTED_94, SYNOPSYS_UNCONNECTED_95,
         SYNOPSYS_UNCONNECTED_96, SYNOPSYS_UNCONNECTED_97,
         SYNOPSYS_UNCONNECTED_98, SYNOPSYS_UNCONNECTED_99,
         SYNOPSYS_UNCONNECTED_100, SYNOPSYS_UNCONNECTED_101,
         SYNOPSYS_UNCONNECTED_102, SYNOPSYS_UNCONNECTED_103,
         SYNOPSYS_UNCONNECTED_104, SYNOPSYS_UNCONNECTED_105,
         SYNOPSYS_UNCONNECTED_106, SYNOPSYS_UNCONNECTED_107,
         SYNOPSYS_UNCONNECTED_108, SYNOPSYS_UNCONNECTED_109,
         SYNOPSYS_UNCONNECTED_110, SYNOPSYS_UNCONNECTED_111,
         SYNOPSYS_UNCONNECTED_112, SYNOPSYS_UNCONNECTED_113,
         SYNOPSYS_UNCONNECTED_114, SYNOPSYS_UNCONNECTED_115,
         SYNOPSYS_UNCONNECTED_116, SYNOPSYS_UNCONNECTED_117,
         SYNOPSYS_UNCONNECTED_118, SYNOPSYS_UNCONNECTED_119,
         SYNOPSYS_UNCONNECTED_120, SYNOPSYS_UNCONNECTED_121,
         SYNOPSYS_UNCONNECTED_122, SYNOPSYS_UNCONNECTED_123,
         SYNOPSYS_UNCONNECTED_124, SYNOPSYS_UNCONNECTED_125,
         SYNOPSYS_UNCONNECTED_126, SYNOPSYS_UNCONNECTED_127,
         SYNOPSYS_UNCONNECTED_128, SYNOPSYS_UNCONNECTED_129,
         SYNOPSYS_UNCONNECTED_130, SYNOPSYS_UNCONNECTED_131,
         SYNOPSYS_UNCONNECTED_132, SYNOPSYS_UNCONNECTED_133,
         SYNOPSYS_UNCONNECTED_134, SYNOPSYS_UNCONNECTED_135,
         SYNOPSYS_UNCONNECTED_136, SYNOPSYS_UNCONNECTED_137,
         SYNOPSYS_UNCONNECTED_138, SYNOPSYS_UNCONNECTED_139,
         SYNOPSYS_UNCONNECTED_140, SYNOPSYS_UNCONNECTED_141,
         SYNOPSYS_UNCONNECTED_142, SYNOPSYS_UNCONNECTED_143,
         SYNOPSYS_UNCONNECTED_144, SYNOPSYS_UNCONNECTED_145,
         SYNOPSYS_UNCONNECTED_146, SYNOPSYS_UNCONNECTED_147,
         SYNOPSYS_UNCONNECTED_148, SYNOPSYS_UNCONNECTED_149,
         SYNOPSYS_UNCONNECTED_150, SYNOPSYS_UNCONNECTED_151,
         SYNOPSYS_UNCONNECTED_152, SYNOPSYS_UNCONNECTED_153,
         SYNOPSYS_UNCONNECTED_154, SYNOPSYS_UNCONNECTED_155,
         SYNOPSYS_UNCONNECTED_156, SYNOPSYS_UNCONNECTED_157,
         SYNOPSYS_UNCONNECTED_158, SYNOPSYS_UNCONNECTED_159,
         SYNOPSYS_UNCONNECTED_160, SYNOPSYS_UNCONNECTED_161,
         SYNOPSYS_UNCONNECTED_162, SYNOPSYS_UNCONNECTED_163,
         SYNOPSYS_UNCONNECTED_164, SYNOPSYS_UNCONNECTED_165,
         SYNOPSYS_UNCONNECTED_166, SYNOPSYS_UNCONNECTED_167,
         SYNOPSYS_UNCONNECTED_168, SYNOPSYS_UNCONNECTED_169,
         SYNOPSYS_UNCONNECTED_170, SYNOPSYS_UNCONNECTED_171,
         SYNOPSYS_UNCONNECTED_172, SYNOPSYS_UNCONNECTED_173,
         SYNOPSYS_UNCONNECTED_174, SYNOPSYS_UNCONNECTED_175,
         SYNOPSYS_UNCONNECTED_176, SYNOPSYS_UNCONNECTED_177,
         SYNOPSYS_UNCONNECTED_178, SYNOPSYS_UNCONNECTED_179,
         SYNOPSYS_UNCONNECTED_180, SYNOPSYS_UNCONNECTED_181,
         SYNOPSYS_UNCONNECTED_182, SYNOPSYS_UNCONNECTED_183,
         SYNOPSYS_UNCONNECTED_184, SYNOPSYS_UNCONNECTED_185,
         SYNOPSYS_UNCONNECTED_186, SYNOPSYS_UNCONNECTED_187,
         SYNOPSYS_UNCONNECTED_188, SYNOPSYS_UNCONNECTED_189,
         SYNOPSYS_UNCONNECTED_190, SYNOPSYS_UNCONNECTED_191,
         SYNOPSYS_UNCONNECTED_192, SYNOPSYS_UNCONNECTED_193,
         SYNOPSYS_UNCONNECTED_194, SYNOPSYS_UNCONNECTED_195,
         SYNOPSYS_UNCONNECTED_196, SYNOPSYS_UNCONNECTED_197,
         SYNOPSYS_UNCONNECTED_198, SYNOPSYS_UNCONNECTED_199,
         SYNOPSYS_UNCONNECTED_200, SYNOPSYS_UNCONNECTED_201,
         SYNOPSYS_UNCONNECTED_202, SYNOPSYS_UNCONNECTED_203,
         SYNOPSYS_UNCONNECTED_204, SYNOPSYS_UNCONNECTED_205,
         SYNOPSYS_UNCONNECTED_206, SYNOPSYS_UNCONNECTED_207,
         SYNOPSYS_UNCONNECTED_208, SYNOPSYS_UNCONNECTED_209,
         SYNOPSYS_UNCONNECTED_210, SYNOPSYS_UNCONNECTED_211,
         SYNOPSYS_UNCONNECTED_212, SYNOPSYS_UNCONNECTED_213,
         SYNOPSYS_UNCONNECTED_214, SYNOPSYS_UNCONNECTED_215,
         SYNOPSYS_UNCONNECTED_216, SYNOPSYS_UNCONNECTED_217,
         SYNOPSYS_UNCONNECTED_218, SYNOPSYS_UNCONNECTED_219,
         SYNOPSYS_UNCONNECTED_220, SYNOPSYS_UNCONNECTED_221,
         SYNOPSYS_UNCONNECTED_222, SYNOPSYS_UNCONNECTED_223,
         SYNOPSYS_UNCONNECTED_224, SYNOPSYS_UNCONNECTED_225,
         SYNOPSYS_UNCONNECTED_226, SYNOPSYS_UNCONNECTED_227,
         SYNOPSYS_UNCONNECTED_228, SYNOPSYS_UNCONNECTED_229,
         SYNOPSYS_UNCONNECTED_230, SYNOPSYS_UNCONNECTED_231,
         SYNOPSYS_UNCONNECTED_232, SYNOPSYS_UNCONNECTED_233,
         SYNOPSYS_UNCONNECTED_234, SYNOPSYS_UNCONNECTED_235,
         SYNOPSYS_UNCONNECTED_236, SYNOPSYS_UNCONNECTED_237,
         SYNOPSYS_UNCONNECTED_238, SYNOPSYS_UNCONNECTED_239,
         SYNOPSYS_UNCONNECTED_240, SYNOPSYS_UNCONNECTED_241,
         SYNOPSYS_UNCONNECTED_242, SYNOPSYS_UNCONNECTED_243,
         SYNOPSYS_UNCONNECTED_244, SYNOPSYS_UNCONNECTED_245,
         SYNOPSYS_UNCONNECTED_246, SYNOPSYS_UNCONNECTED_247,
         SYNOPSYS_UNCONNECTED_248, SYNOPSYS_UNCONNECTED_249,
         SYNOPSYS_UNCONNECTED_250, SYNOPSYS_UNCONNECTED_251,
         SYNOPSYS_UNCONNECTED_252, SYNOPSYS_UNCONNECTED_253,
         SYNOPSYS_UNCONNECTED_254, SYNOPSYS_UNCONNECTED_255,
         SYNOPSYS_UNCONNECTED_256, SYNOPSYS_UNCONNECTED_257,
         SYNOPSYS_UNCONNECTED_258, SYNOPSYS_UNCONNECTED_259,
         SYNOPSYS_UNCONNECTED_260, SYNOPSYS_UNCONNECTED_261,
         SYNOPSYS_UNCONNECTED_262, SYNOPSYS_UNCONNECTED_263,
         SYNOPSYS_UNCONNECTED_264, SYNOPSYS_UNCONNECTED_265,
         SYNOPSYS_UNCONNECTED_266, SYNOPSYS_UNCONNECTED_267,
         SYNOPSYS_UNCONNECTED_268, SYNOPSYS_UNCONNECTED_269,
         SYNOPSYS_UNCONNECTED_270, SYNOPSYS_UNCONNECTED_271,
         SYNOPSYS_UNCONNECTED_272, SYNOPSYS_UNCONNECTED_273,
         SYNOPSYS_UNCONNECTED_274, SYNOPSYS_UNCONNECTED_275,
         SYNOPSYS_UNCONNECTED_276, SYNOPSYS_UNCONNECTED_277,
         SYNOPSYS_UNCONNECTED_278, SYNOPSYS_UNCONNECTED_279,
         SYNOPSYS_UNCONNECTED_280, SYNOPSYS_UNCONNECTED_281,
         SYNOPSYS_UNCONNECTED_282, SYNOPSYS_UNCONNECTED_283,
         SYNOPSYS_UNCONNECTED_284, SYNOPSYS_UNCONNECTED_285,
         SYNOPSYS_UNCONNECTED_286, SYNOPSYS_UNCONNECTED_287,
         SYNOPSYS_UNCONNECTED_288, SYNOPSYS_UNCONNECTED_289,
         SYNOPSYS_UNCONNECTED_290, SYNOPSYS_UNCONNECTED_291,
         SYNOPSYS_UNCONNECTED_292, SYNOPSYS_UNCONNECTED_293,
         SYNOPSYS_UNCONNECTED_294, SYNOPSYS_UNCONNECTED_295,
         SYNOPSYS_UNCONNECTED_296, SYNOPSYS_UNCONNECTED_297,
         SYNOPSYS_UNCONNECTED_298, SYNOPSYS_UNCONNECTED_299,
         SYNOPSYS_UNCONNECTED_300, SYNOPSYS_UNCONNECTED_301,
         SYNOPSYS_UNCONNECTED_302, SYNOPSYS_UNCONNECTED_303,
         SYNOPSYS_UNCONNECTED_304, SYNOPSYS_UNCONNECTED_305,
         SYNOPSYS_UNCONNECTED_306, SYNOPSYS_UNCONNECTED_307,
         SYNOPSYS_UNCONNECTED_308, SYNOPSYS_UNCONNECTED_309,
         SYNOPSYS_UNCONNECTED_310, SYNOPSYS_UNCONNECTED_311,
         SYNOPSYS_UNCONNECTED_312, SYNOPSYS_UNCONNECTED_313,
         SYNOPSYS_UNCONNECTED_314, SYNOPSYS_UNCONNECTED_315,
         SYNOPSYS_UNCONNECTED_316, SYNOPSYS_UNCONNECTED_317,
         SYNOPSYS_UNCONNECTED_318, SYNOPSYS_UNCONNECTED_319,
         SYNOPSYS_UNCONNECTED_320, SYNOPSYS_UNCONNECTED_321,
         SYNOPSYS_UNCONNECTED_322, SYNOPSYS_UNCONNECTED_323,
         SYNOPSYS_UNCONNECTED_324;
  wire   [71:0] smult_a;
  wire   [71:0] smult_b;
  wire   [16:0] ssum2_out;
  wire   [19:0] sum9_out;
  wire   [17:12] sdiv_dend;
  wire   [5:2] sdiv_result;
  wire   [7:0] smin_a;
  wire   [7:0] smin_b;
  wire   [7:0] smin_out;
  wire   [2:1] cs;
  wire   [2:0] ns;
  wire   [5:0] cnt;
  wire   [8:0] kernelreg;
  wire   [7:0] weightreg;
  wire   [23:0] pooled_arr;
  wire   [16:0] conv1_result;
  wire   [7:0] quant_conv1;
  wire   [3:0] pool_cnt;
  wire   [31:0] flatten_arr1;
  wire   [9:0] L1_sum;
  wire   [9:0] out_data_buffer;

  DFFRHQX4 cnt_reg_0_ ( .D(n1170), .CK(clk), .RN(rst_n), .Q(cnt[0]) );
  DFFRHQX4 cnt_reg_3_ ( .D(n1167), .CK(clk), .RN(rst_n), .Q(cnt[3]) );
  DFFRHQX4 cnt_reg_4_ ( .D(n1166), .CK(clk), .RN(rst_n), .Q(cnt[4]) );
  DFFRHQX4 cnt_reg_5_ ( .D(n1165), .CK(clk), .RN(rst_n), .Q(cnt[5]) );
  DFFRHQX4 cs_reg_1_ ( .D(ns[1]), .CK(clk), .RN(rst_n), .Q(cs[1]) );
  DFFRHQX4 cs_reg_2_ ( .D(ns[2]), .CK(clk), .RN(rst_n), .Q(cs[2]) );
  SNN_DW01_add_0 add_551_2 ( .A(L1_sum), .B({1'b0, 1'b0, smin_out}), .CI(1'b0), 
        .SUM({N1018, N1017, N1016, N1015, N1014, N1013, N1012, N1011, N1010, 
        N1009}) );
  SNN_DW01_add_1 add_551 ( .A({1'b0, L1_sum}), .B({1'b0, 1'b0, 1'b0, smin_out}), .CI(1'b0), .SUM({N1006, N1005, N1004, N1003, N1002, N1001, N1000, 
        SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2, SYNOPSYS_UNCONNECTED_3, 
        SYNOPSYS_UNCONNECTED_4}) );
  SNN_DW01_sub_0 sub_93 ( .A(smin_a), .B(smin_b), .CI(1'b0), .DIFF(smin_out)
         );
  SNN_DW01_inc_0_DW01_inc_1 r597 ( .A({n1359, n1396, n1361, n1394, n1385, 
        n1390, n1363}), .SUM({N198, N197, N196, N195, N194, N193, N192}) );
  SNN_DW01_add_25_DW01_add_10 add_537_S2_aco ( .A({N1271, N1270, N1269, N1268, 
        N1267, N1266, N1265, N1264, N1263, N1262}), .B({1'b0, 1'b0, smin_out}), 
        .CI(1'b0), .SUM({N997, N996, N995, N994, N993, N992, N991, N990, N989, 
        N988}) );
  SNN_DW_mult_uns_8 mult_64_G3 ( .a(smult_a[55:48]), .b(smult_b[55:48]), 
        .product({smult_out_2__15_, smult_out_2__14_, smult_out_2__13_, 
        smult_out_2__12_, smult_out_2__11_, smult_out_2__10_, smult_out_2__9_, 
        smult_out_2__8_, smult_out_2__7_, smult_out_2__6_, smult_out_2__5_, 
        smult_out_2__4_, smult_out_2__3_, smult_out_2__2_, smult_out_2__1_, 
        smult_out_2__0_}) );
  SNN_DW_mult_uns_7 mult_64_G4 ( .a(smult_a[47:40]), .b(smult_b[47:40]), 
        .product({smult_out_3__15_, smult_out_3__14_, smult_out_3__13_, 
        smult_out_3__12_, smult_out_3__11_, smult_out_3__10_, smult_out_3__9_, 
        smult_out_3__8_, smult_out_3__7_, smult_out_3__6_, smult_out_3__5_, 
        smult_out_3__4_, smult_out_3__3_, smult_out_3__2_, smult_out_3__1_, 
        smult_out_3__0_}) );
  SNN_DW_mult_uns_6 mult_64_G5 ( .a(smult_a[39:32]), .b(smult_b[39:32]), 
        .product({smult_out_4__15_, smult_out_4__14_, smult_out_4__13_, 
        smult_out_4__12_, smult_out_4__11_, smult_out_4__10_, smult_out_4__9_, 
        smult_out_4__8_, smult_out_4__7_, smult_out_4__6_, smult_out_4__5_, 
        smult_out_4__4_, smult_out_4__3_, smult_out_4__2_, smult_out_4__1_, 
        smult_out_4__0_}) );
  SNN_DW_mult_uns_5 mult_64_G6 ( .a(smult_a[31:24]), .b(smult_b[31:24]), 
        .product({smult_out_5__15_, smult_out_5__14_, smult_out_5__13_, 
        smult_out_5__12_, smult_out_5__11_, smult_out_5__10_, smult_out_5__9_, 
        smult_out_5__8_, smult_out_5__7_, smult_out_5__6_, smult_out_5__5_, 
        smult_out_5__4_, smult_out_5__3_, smult_out_5__2_, smult_out_5__1_, 
        smult_out_5__0_}) );
  SNN_DW_mult_uns_4 mult_64_G7 ( .a(smult_a[23:16]), .b(smult_b[23:16]), 
        .product({smult_out_6__15_, smult_out_6__14_, smult_out_6__13_, 
        smult_out_6__12_, smult_out_6__11_, smult_out_6__10_, smult_out_6__9_, 
        smult_out_6__8_, smult_out_6__7_, smult_out_6__6_, smult_out_6__5_, 
        smult_out_6__4_, smult_out_6__3_, smult_out_6__2_, smult_out_6__1_, 
        smult_out_6__0_}) );
  SNN_DW_mult_uns_3 mult_64_G8 ( .a(smult_a[15:8]), .b(smult_b[15:8]), 
        .product({smult_out_7__15_, smult_out_7__14_, smult_out_7__13_, 
        smult_out_7__12_, smult_out_7__11_, smult_out_7__10_, smult_out_7__9_, 
        smult_out_7__8_, smult_out_7__7_, smult_out_7__6_, smult_out_7__5_, 
        smult_out_7__4_, smult_out_7__3_, smult_out_7__2_, smult_out_7__1_, 
        smult_out_7__0_}) );
  SNN_DW_mult_uns_2 mult_64_G9 ( .a(smult_a[7:0]), .b(smult_b[7:0]), .product(
        {smult_out_8__15_, smult_out_8__14_, smult_out_8__13_, 
        smult_out_8__12_, smult_out_8__11_, smult_out_8__10_, smult_out_8__9_, 
        smult_out_8__8_, smult_out_8__7_, smult_out_8__6_, smult_out_8__5_, 
        smult_out_8__4_, smult_out_8__3_, smult_out_8__2_, smult_out_8__1_, 
        smult_out_8__0_}) );
  SNN_DW01_add_24_DW01_add_9 add_5_root_add_0_root_add_75_4 ( .A({1'b0, 1'b0, 
        smult_out_7__15_, smult_out_7__14_, smult_out_7__13_, smult_out_7__12_, 
        smult_out_7__11_, smult_out_7__10_, smult_out_7__9_, smult_out_7__8_, 
        smult_out_7__7_, smult_out_7__6_, smult_out_7__5_, smult_out_7__4_, 
        smult_out_7__3_, smult_out_7__2_, smult_out_7__1_, smult_out_7__0_}), 
        .B({1'b0, 1'b0, smult_out_8__15_, smult_out_8__14_, smult_out_8__13_, 
        smult_out_8__12_, smult_out_8__11_, smult_out_8__10_, smult_out_8__9_, 
        smult_out_8__8_, smult_out_8__7_, smult_out_8__6_, smult_out_8__5_, 
        smult_out_8__4_, smult_out_8__3_, smult_out_8__2_, smult_out_8__1_, 
        smult_out_8__0_}), .CI(1'b0), .SUM({SYNOPSYS_UNCONNECTED_5, n2789, 
        n2788, n2787, n2786, n2785, n2784, n2783, n2782, n2781, n2780, n2779, 
        n2778, n2777, n2776, n2775, n2774, n2773}) );
  SNN_DW01_add_23_DW01_add_8 add_3_root_add_0_root_add_75_4 ( .A({1'b0, 1'b0, 
        1'b0, smult_out_6__15_, smult_out_6__14_, smult_out_6__13_, 
        smult_out_6__12_, smult_out_6__11_, smult_out_6__10_, smult_out_6__9_, 
        smult_out_6__8_, smult_out_6__7_, smult_out_6__6_, smult_out_6__5_, 
        smult_out_6__4_, smult_out_6__3_, smult_out_6__2_, smult_out_6__1_, 
        smult_out_6__0_}), .B({1'b0, 1'b0, n2789, n2788, n2787, n2786, n2785, 
        n2784, n2783, n2782, n2781, n2780, n2779, n2778, n2777, n2776, n2775, 
        n2774, n2773}), .CI(1'b0), .SUM({SYNOPSYS_UNCONNECTED_6, n2808, n2807, 
        n2806, n2805, n2804, n2803, n2802, n2801, n2800, n2799, n2798, n2797, 
        n2796, n2795, n2794, n2793, n2792, n2791}) );
  SNN_DW01_add_22_DW01_add_7 add_6_root_add_0_root_add_75_4 ( .A({1'b0, 1'b0, 
        smult_out_3__15_, smult_out_3__14_, smult_out_3__13_, smult_out_3__12_, 
        smult_out_3__11_, smult_out_3__10_, smult_out_3__9_, smult_out_3__8_, 
        smult_out_3__7_, smult_out_3__6_, smult_out_3__5_, smult_out_3__4_, 
        smult_out_3__3_, smult_out_3__2_, smult_out_3__1_, smult_out_3__0_}), 
        .B({1'b0, 1'b0, smult_out_5__15_, smult_out_5__14_, smult_out_5__13_, 
        smult_out_5__12_, smult_out_5__11_, smult_out_5__10_, smult_out_5__9_, 
        smult_out_5__8_, smult_out_5__7_, smult_out_5__6_, smult_out_5__5_, 
        smult_out_5__4_, smult_out_5__3_, smult_out_5__2_, smult_out_5__1_, 
        smult_out_5__0_}), .CI(1'b0), .SUM({SYNOPSYS_UNCONNECTED_7, N108, N107, 
        N106, N105, N104, N103, N102, N101, N100, N99, N98, N97, N96, N95, N94, 
        N93, N92}) );
  SNN_DW01_add_21_DW01_add_6 add_2_root_add_0_root_add_75_4 ( .A({1'b0, 1'b0, 
        N108, N107, N106, N105, N104, N103, N102, N101, N100, N99, N98, N97, 
        N96, N95, N94, N93, N92}), .B({1'b0, 1'b0, ssum2_out}), .CI(1'b0), 
        .SUM({SYNOPSYS_UNCONNECTED_8, n2826, n2825, n2824, n2823, n2822, n2821, 
        n2820, n2819, n2818, n2817, n2816, n2815, n2814, n2813, n2812, n2811, 
        n2810, n2809}) );
  SNN_DW01_add_20_DW01_add_5 add_4_root_add_0_root_add_75_4 ( .A({1'b0, 1'b0, 
        1'b0, 1'b0, smult_out_4__15_, smult_out_4__14_, smult_out_4__13_, 
        smult_out_4__12_, smult_out_4__11_, smult_out_4__10_, smult_out_4__9_, 
        smult_out_4__8_, smult_out_4__7_, smult_out_4__6_, smult_out_4__5_, 
        smult_out_4__4_, smult_out_4__3_, smult_out_4__2_, smult_out_4__1_, 
        smult_out_4__0_}), .B({1'b0, 1'b0, 1'b0, 1'b0, smult_out_2__15_, 
        smult_out_2__14_, smult_out_2__13_, smult_out_2__12_, smult_out_2__11_, 
        smult_out_2__10_, smult_out_2__9_, smult_out_2__8_, smult_out_2__7_, 
        smult_out_2__6_, smult_out_2__5_, smult_out_2__4_, smult_out_2__3_, 
        smult_out_2__2_, smult_out_2__1_, smult_out_2__0_}), .CI(1'b0), .SUM({
        SYNOPSYS_UNCONNECTED_9, SYNOPSYS_UNCONNECTED_10, 
        SYNOPSYS_UNCONNECTED_11, N145, N144, N143, N142, N141, N140, N139, 
        N138, N137, N136, N135, N134, N133, N132, N131, N130, N129}) );
  SNN_DW01_add_19_DW01_add_4 add_1_root_add_0_root_add_75_4 ( .A({1'b0, 1'b0, 
        n2808, n2807, n2806, n2805, n2804, n2803, n2802, n2801, n2800, n2799, 
        n2798, n2797, n2796, n2795, n2794, n2793, n2792, n2791}), .B({1'b0, 
        1'b0, n2826, n2825, n2824, n2823, n2822, n2821, n2820, n2819, n2818, 
        n2817, n2816, n2815, n2814, n2813, n2812, n2811, n2810, n2809}), .CI(
        1'b0), .SUM({SYNOPSYS_UNCONNECTED_12, n2845, n2844, n2843, n2842, 
        n2841, n2840, n2839, n2838, n2837, n2836, n2835, n2834, n2833, n2832, 
        n2831, n2830, n2829, n2828, n2827}) );
  SNN_DW01_add_18_DW01_add_3 add_0_root_add_0_root_add_75_4 ( .A({1'b0, 1'b0, 
        1'b0, N145, N144, N143, N142, N141, N140, N139, N138, N137, N136, N135, 
        N134, N133, N132, N131, N130, N129}), .B({1'b0, n2845, n2844, n2843, 
        n2842, n2841, n2840, n2839, n2838, n2837, n2836, n2835, n2834, n2833, 
        n2832, n2831, n2830, n2829, n2828, n2827}), .CI(1'b0), .SUM(sum9_out)
         );
  SNN_DW_mult_uns_1 mult_64 ( .a(smult_a[71:64]), .b(smult_b[71:64]), 
        .product({smult_out_0__15_, smult_out_0__14_, smult_out_0__13_, 
        smult_out_0__12_, smult_out_0__11_, smult_out_0__10_, smult_out_0__9_, 
        smult_out_0__8_, smult_out_0__7_, smult_out_0__6_, smult_out_0__5_, 
        smult_out_0__4_, smult_out_0__3_, smult_out_0__2_, smult_out_0__1_, 
        smult_out_0__0_}) );
  SNN_DW_mult_uns_0 mult_64_G2 ( .a(smult_a[63:56]), .b(smult_b[63:56]), 
        .product({smult_out_1__15_, smult_out_1__14_, smult_out_1__13_, 
        smult_out_1__12_, smult_out_1__11_, smult_out_1__10_, smult_out_1__9_, 
        smult_out_1__8_, smult_out_1__7_, smult_out_1__6_, smult_out_1__5_, 
        smult_out_1__4_, smult_out_1__3_, smult_out_1__2_, smult_out_1__1_, 
        smult_out_1__0_}) );
  SNN_DW01_add_17_DW01_add_2 add_69 ( .A({1'b0, smult_out_0__15_, 
        smult_out_0__14_, smult_out_0__13_, smult_out_0__12_, smult_out_0__11_, 
        smult_out_0__10_, smult_out_0__9_, smult_out_0__8_, smult_out_0__7_, 
        smult_out_0__6_, smult_out_0__5_, smult_out_0__4_, smult_out_0__3_, 
        smult_out_0__2_, smult_out_0__1_, smult_out_0__0_}), .B({1'b0, 
        smult_out_1__15_, smult_out_1__14_, smult_out_1__13_, smult_out_1__12_, 
        smult_out_1__11_, smult_out_1__10_, smult_out_1__9_, smult_out_1__8_, 
        smult_out_1__7_, smult_out_1__6_, smult_out_1__5_, smult_out_1__4_, 
        smult_out_1__3_, smult_out_1__2_, smult_out_1__1_, smult_out_1__0_}), 
        .CI(1'b0), .SUM(ssum2_out) );
  SNN_DW01_add_31 div_82_u_div_u_add_PartRem_6_3 ( .A({1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, n1470, n1469}), 
        .B({div_82_u_div_BInv_3__13_, div_82_u_div_BInv_3__13_, 
        div_82_u_div_BInv_3__12_, div_82_u_div_BInv_3__11_, 
        div_82_u_div_BInv_3__10_, div_82_u_div_BInv_3__9_, n1214, n1532, n1556, 
        n1534, n1583, n1554, div_82_u_div_BInv_3__2_, div_82_u_div_BInv_3__1_, 
        div_82_u_div_BInv_3__0_}), .CI(1'b1), .SUM({SYNOPSYS_UNCONNECTED_13, 
        SYNOPSYS_UNCONNECTED_14, SYNOPSYS_UNCONNECTED_15, 
        SYNOPSYS_UNCONNECTED_16, SYNOPSYS_UNCONNECTED_17, 
        SYNOPSYS_UNCONNECTED_18, SYNOPSYS_UNCONNECTED_19, 
        SYNOPSYS_UNCONNECTED_20, SYNOPSYS_UNCONNECTED_21, 
        SYNOPSYS_UNCONNECTED_22, SYNOPSYS_UNCONNECTED_23, 
        SYNOPSYS_UNCONNECTED_24, div_82_u_div_SumTmp_3__6__2_, 
        div_82_u_div_SumTmp_3__6__1_, div_82_u_div_SumTmp_3__6__0_}), .CO(
        div_82_u_div_CryOut_3__6_) );
  SNN_DW01_sub_1 div_82_u_div_u_add_B7 ( .A({n1438, 1'b1, 1'b1, n1211, n1570, 
        n1570, n1570, n1570, n1211, n1570, n1570, n1418, 1'b1, 1'b1, 1'b1}), 
        .B({1'b1, 1'b1, 1'b1, n1439, 1'b1, 1'b1, n1452, n1570, n1570, n1570, 
        n1210, n1211, n1570, n1570, n2493}), .CI(1'b1), .DIFF({
        div_82_u_div_BInv_7__14_, div_82_u_div_BInv_7__13_, 
        div_82_u_div_BInv_7__12_, div_82_u_div_BInv_7__11_, 
        div_82_u_div_BInv_7__10_, div_82_u_div_BInv_7__9_, 
        div_82_u_div_BInv_7__8_, div_82_u_div_BInv_7__7_, 
        div_82_u_div_BInv_7__6_, div_82_u_div_BInv_7__5_, 
        SYNOPSYS_UNCONNECTED_25, div_82_u_div_BInv_7__3_, 
        div_82_u_div_BInv_7__2_, div_82_u_div_BInv_7__1_, 
        div_82_u_div_BInv_7__0_}) );
  SNN_DW01_add_79 div_82_u_div_u_add_PartRem_1_4 ( .A({n1488, n1498, n1326, 
        div_82_u_div_PartRem_2__11_, div_82_u_div_PartRem_2__10_, n1232, n1560, 
        n1506, n1518, n1495, n1346, n2496, n2474, n2473, n2472}), .B({1'b1, 
        n1439, 1'b1, 1'b1, n1212, n1570, n1570, n1570, n1570, n1211, n1570, 
        n1570, n1418, 1'b1, 1'b1}), .CI(1'b1), .SUM({SYNOPSYS_UNCONNECTED_26, 
        SYNOPSYS_UNCONNECTED_27, SYNOPSYS_UNCONNECTED_28, 
        div_82_u_div_SumTmp_4__1__11_, div_82_u_div_SumTmp_4__1__10_, 
        div_82_u_div_SumTmp_4__1__9_, div_82_u_div_SumTmp_4__1__8_, 
        div_82_u_div_SumTmp_4__1__7_, div_82_u_div_SumTmp_4__1__6_, 
        div_82_u_div_SumTmp_4__1__5_, div_82_u_div_SumTmp_4__1__4_, 
        div_82_u_div_SumTmp_4__1__3_, div_82_u_div_SumTmp_4__1__2_, 
        div_82_u_div_SumTmp_4__1__1_, div_82_u_div_SumTmp_4__1__0_}), .CO(
        sdiv_result[5]) );
  SNN_DW01_add_94 div_82_u_div_u_add_PartRem_4_3 ( .A({1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, n2492, n2491, n2490, n2467, n2466, n2468, sdiv_dend[14:12]}), .B({div_82_u_div_BInv_3__14_, n1414, div_82_u_div_BInv_3__12_, 
        div_82_u_div_BInv_3__11_, div_82_u_div_BInv_3__10_, 
        div_82_u_div_BInv_3__9_, n1216, n1532, n1556, n1534, n1583, n1554, 
        div_82_u_div_BInv_3__2_, div_82_u_div_BInv_3__1_, 
        div_82_u_div_BInv_3__0_}), .CI(1'b1), .SUM({SYNOPSYS_UNCONNECTED_29, 
        SYNOPSYS_UNCONNECTED_30, SYNOPSYS_UNCONNECTED_31, 
        SYNOPSYS_UNCONNECTED_32, SYNOPSYS_UNCONNECTED_33, 
        SYNOPSYS_UNCONNECTED_34, div_82_u_div_SumTmp_3__4__8_, 
        div_82_u_div_SumTmp_3__4__7_, div_82_u_div_SumTmp_3__4__6_, 
        div_82_u_div_SumTmp_3__4__5_, div_82_u_div_SumTmp_3__4__4_, 
        div_82_u_div_SumTmp_3__4__3_, div_82_u_div_SumTmp_3__4__2_, 
        div_82_u_div_SumTmp_3__4__1_, div_82_u_div_SumTmp_3__4__0_}), .CO(
        div_82_u_div_CryOut_3__4_) );
  SNN_DW01_add_95 div_82_u_div_u_add_PartRem_4_5 ( .A({1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, n2492, n2491, n2490, n2467, n2466, n2468, sdiv_dend[14:12]}), .B({div_82_u_div_BInv_5__14_, div_82_u_div_BInv_5__13_, 
        div_82_u_div_BInv_5__12_, div_82_u_div_BInv_5__11_, 
        div_82_u_div_BInv_5__10_, 1'b1, n1538, n1524, n1526, n1552, 
        div_82_u_div_BInv_5__4_, div_82_u_div_BInv_5__3_, 
        div_82_u_div_BInv_5__2_, div_82_u_div_BInv_5__1_, n1548}), .CI(1'b1), 
        .SUM({SYNOPSYS_UNCONNECTED_35, SYNOPSYS_UNCONNECTED_36, 
        SYNOPSYS_UNCONNECTED_37, SYNOPSYS_UNCONNECTED_38, 
        SYNOPSYS_UNCONNECTED_39, SYNOPSYS_UNCONNECTED_40, 
        div_82_u_div_SumTmp_5__4__8_, div_82_u_div_SumTmp_5__4__7_, 
        div_82_u_div_SumTmp_5__4__6_, div_82_u_div_SumTmp_5__4__5_, 
        div_82_u_div_SumTmp_5__4__4_, div_82_u_div_SumTmp_5__4__3_, 
        div_82_u_div_SumTmp_5__4__2_, div_82_u_div_SumTmp_5__4__1_, 
        div_82_u_div_SumTmp_5__4__0_}), .CO(div_82_u_div_CryOut_5__4_) );
  SNN_DW01_add_93 div_82_u_div_u_add_PartRem_4_7 ( .A({1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, n2492, n2491, n2490, n2467, n2466, n2468, sdiv_dend[14:12]}), .B({div_82_u_div_BInv_7__14_, div_82_u_div_BInv_7__13_, 
        div_82_u_div_BInv_7__12_, div_82_u_div_BInv_7__11_, 
        div_82_u_div_BInv_7__10_, n1329, div_82_u_div_BInv_7__8_, 
        div_82_u_div_BInv_7__7_, div_82_u_div_BInv_7__6_, n1576, n1575, 
        div_82_u_div_BInv_7__3_, div_82_u_div_BInv_7__2_, 
        div_82_u_div_BInv_7__1_, n1550}), .CI(1'b1), .SUM({
        SYNOPSYS_UNCONNECTED_41, SYNOPSYS_UNCONNECTED_42, 
        SYNOPSYS_UNCONNECTED_43, SYNOPSYS_UNCONNECTED_44, 
        SYNOPSYS_UNCONNECTED_45, SYNOPSYS_UNCONNECTED_46, 
        div_82_u_div_SumTmp_7__4__8_, div_82_u_div_SumTmp_7__4__7_, 
        div_82_u_div_SumTmp_7__4__6_, div_82_u_div_SumTmp_7__4__5_, 
        div_82_u_div_SumTmp_7__4__4_, div_82_u_div_SumTmp_7__4__3_, 
        div_82_u_div_SumTmp_7__4__2_, div_82_u_div_SumTmp_7__4__1_, 
        div_82_u_div_SumTmp_7__4__0_}), .CO(div_82_u_div_CryOut_7__4_) );
  SNN_DW01_add_80 div_82_u_div_u_add_PartRem_2_4 ( .A({
        div_82_u_div_PartRem_3__14_, div_82_u_div_PartRem_3__13_, n1226, n1486, 
        n1482, div_82_u_div_PartRem_3__9_, n1235, n1514, n1501, 
        div_82_u_div_PartRem_3__5_, n1523, n1217, n2477, n2476, n2475}), .B({
        1'b1, n1438, 1'b1, 1'b1, n1212, n1570, n1570, n1570, n1570, n1579, 
        n1570, n1570, n1418, 1'b1, 1'b1}), .CI(1'b1), .SUM({
        SYNOPSYS_UNCONNECTED_47, SYNOPSYS_UNCONNECTED_48, 
        SYNOPSYS_UNCONNECTED_49, div_82_u_div_SumTmp_4__2__11_, 
        div_82_u_div_SumTmp_4__2__10_, div_82_u_div_SumTmp_4__2__9_, 
        div_82_u_div_SumTmp_4__2__8_, div_82_u_div_SumTmp_4__2__7_, 
        div_82_u_div_SumTmp_4__2__6_, div_82_u_div_SumTmp_4__2__5_, 
        div_82_u_div_SumTmp_4__2__4_, div_82_u_div_SumTmp_4__2__3_, 
        div_82_u_div_SumTmp_4__2__2_, div_82_u_div_SumTmp_4__2__1_, 
        div_82_u_div_SumTmp_4__2__0_}), .CO(div_82_quotient_8_) );
  SNN_DW01_add_78 div_82_u_div_u_add_PartRem_0_4 ( .A({n1491, n1517, 
        div_82_u_div_PartRem_1__12_, div_82_u_div_PartRem_1__11_, 
        div_82_u_div_PartRem_1__10_, n1494, n1479, n1477, n1434, n1520, n1511, 
        div_82_u_div_PartRem_1__3_, n2471, n2470, n2469}), .B({1'b1, n1439, 
        1'b1, 1'b1, n1212, n1570, n1570, n1570, n1570, n1578, n1570, n1570, 
        n1418, 1'b1, 1'b1}), .CI(1'b1), .SUM({SYNOPSYS_UNCONNECTED_50, 
        SYNOPSYS_UNCONNECTED_51, SYNOPSYS_UNCONNECTED_52, 
        SYNOPSYS_UNCONNECTED_53, SYNOPSYS_UNCONNECTED_54, 
        SYNOPSYS_UNCONNECTED_55, SYNOPSYS_UNCONNECTED_56, 
        SYNOPSYS_UNCONNECTED_57, SYNOPSYS_UNCONNECTED_58, 
        SYNOPSYS_UNCONNECTED_59, SYNOPSYS_UNCONNECTED_60, 
        SYNOPSYS_UNCONNECTED_61, SYNOPSYS_UNCONNECTED_62, 
        SYNOPSYS_UNCONNECTED_63, SYNOPSYS_UNCONNECTED_64}), .CO(sdiv_result[2]) );
  SNN_DW01_add_100 div_82_u_div_u_add_PartRem_0_3 ( .A({n1491, n1517, 
        div_82_u_div_PartRem_1__12_, div_82_u_div_PartRem_1__11_, n1508, n1492, 
        n1480, n1476, n1348, n1519, n1512, div_82_u_div_PartRem_1__3_, n2471, 
        n2470, n2469}), .B({div_82_u_div_BInv_3__14_, n1414, 
        div_82_u_div_BInv_3__12_, div_82_u_div_BInv_3__11_, 
        div_82_u_div_BInv_3__10_, div_82_u_div_BInv_3__9_, n1215, n1532, n1556, 
        n1534, n1583, n1554, div_82_u_div_BInv_3__2_, n1569, 
        div_82_u_div_BInv_3__0_}), .CI(1'b1), .SUM({SYNOPSYS_UNCONNECTED_65, 
        SYNOPSYS_UNCONNECTED_66, SYNOPSYS_UNCONNECTED_67, 
        SYNOPSYS_UNCONNECTED_68, SYNOPSYS_UNCONNECTED_69, 
        SYNOPSYS_UNCONNECTED_70, SYNOPSYS_UNCONNECTED_71, 
        SYNOPSYS_UNCONNECTED_72, SYNOPSYS_UNCONNECTED_73, 
        SYNOPSYS_UNCONNECTED_74, SYNOPSYS_UNCONNECTED_75, 
        SYNOPSYS_UNCONNECTED_76, SYNOPSYS_UNCONNECTED_77, 
        SYNOPSYS_UNCONNECTED_78, SYNOPSYS_UNCONNECTED_79}), .CO(
        div_82_u_div_CryOut_3__0_) );
  SNN_DW01_add_99 div_82_u_div_u_add_PartRem_0_5 ( .A({n1491, n1517, 
        div_82_u_div_PartRem_1__12_, div_82_u_div_PartRem_1__11_, n1508, n1492, 
        n1480, n1476, n1348, n1520, n1513, div_82_u_div_PartRem_1__3_, n2471, 
        n2470, n2469}), .B({div_82_u_div_BInv_5__14_, div_82_u_div_BInv_5__13_, 
        div_82_u_div_BInv_5__12_, div_82_u_div_BInv_5__11_, 
        div_82_u_div_BInv_5__10_, 1'b1, n1538, n1524, n1526, n1552, 
        div_82_u_div_BInv_5__4_, div_82_u_div_BInv_5__3_, 
        div_82_u_div_BInv_5__2_, div_82_u_div_BInv_5__1_, n1548}), .CI(1'b1), 
        .SUM({SYNOPSYS_UNCONNECTED_80, SYNOPSYS_UNCONNECTED_81, 
        SYNOPSYS_UNCONNECTED_82, SYNOPSYS_UNCONNECTED_83, 
        SYNOPSYS_UNCONNECTED_84, SYNOPSYS_UNCONNECTED_85, 
        SYNOPSYS_UNCONNECTED_86, SYNOPSYS_UNCONNECTED_87, 
        SYNOPSYS_UNCONNECTED_88, SYNOPSYS_UNCONNECTED_89, 
        SYNOPSYS_UNCONNECTED_90, SYNOPSYS_UNCONNECTED_91, 
        SYNOPSYS_UNCONNECTED_92, SYNOPSYS_UNCONNECTED_93, 
        SYNOPSYS_UNCONNECTED_94}), .CO(div_82_u_div_CryOut_5__0_) );
  SNN_DW01_add_101 div_82_u_div_u_add_PartRem_0_7 ( .A({n1491, n1517, 
        div_82_u_div_PartRem_1__12_, div_82_u_div_PartRem_1__11_, n1508, n1493, 
        n1480, n1476, n1348, n1519, n1512, div_82_u_div_PartRem_1__3_, n2471, 
        n2470, n2469}), .B({div_82_u_div_BInv_7__14_, div_82_u_div_BInv_7__13_, 
        div_82_u_div_BInv_7__12_, div_82_u_div_BInv_7__11_, 
        div_82_u_div_BInv_7__10_, n1329, div_82_u_div_BInv_7__8_, 
        div_82_u_div_BInv_7__7_, div_82_u_div_BInv_7__6_, n1576, n1575, 
        div_82_u_div_BInv_7__3_, div_82_u_div_BInv_7__2_, 
        div_82_u_div_BInv_7__1_, n1550}), .CI(1'b1), .SUM({
        SYNOPSYS_UNCONNECTED_95, SYNOPSYS_UNCONNECTED_96, 
        SYNOPSYS_UNCONNECTED_97, SYNOPSYS_UNCONNECTED_98, 
        SYNOPSYS_UNCONNECTED_99, SYNOPSYS_UNCONNECTED_100, 
        SYNOPSYS_UNCONNECTED_101, SYNOPSYS_UNCONNECTED_102, 
        SYNOPSYS_UNCONNECTED_103, SYNOPSYS_UNCONNECTED_104, 
        SYNOPSYS_UNCONNECTED_105, SYNOPSYS_UNCONNECTED_106, 
        SYNOPSYS_UNCONNECTED_107, SYNOPSYS_UNCONNECTED_108, 
        SYNOPSYS_UNCONNECTED_109}), .CO(div_82_u_div_CryOut_7__0_) );
  SNN_DW01_add_103 div_82_u_div_u_add_PartRem_4_1 ( .A({1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, n2492, n2491, n2490, n2467, n2466, n2468, sdiv_dend[14:12]}), .B({1'b1, 1'b1, 1'b1, n1438, 1'b1, 1'b1, n1579, n1570, n1570, n1570, n1570, 
        n1579, n1570, n1210, n1418}), .CI(1'b1), .SUM({
        SYNOPSYS_UNCONNECTED_110, SYNOPSYS_UNCONNECTED_111, 
        SYNOPSYS_UNCONNECTED_112, SYNOPSYS_UNCONNECTED_113, 
        SYNOPSYS_UNCONNECTED_114, SYNOPSYS_UNCONNECTED_115, 
        div_82_u_div_SumTmp_1__4__8_, div_82_u_div_SumTmp_1__4__7_, 
        div_82_u_div_SumTmp_1__4__6_, div_82_u_div_SumTmp_1__4__5_, 
        div_82_u_div_SumTmp_1__4__4_, div_82_u_div_SumTmp_1__4__3_, 
        div_82_u_div_SumTmp_1__4__2_, div_82_u_div_SumTmp_1__4__1_, 
        div_82_u_div_SumTmp_1__4__0_}), .CO(div_82_u_div_CryOut_1__4_) );
  SNN_DW01_add_117 div_82_u_div_u_add_PartRem_2_7 ( .A({
        div_82_u_div_PartRem_3__14_, div_82_u_div_PartRem_3__13_, n1227, n1486, 
        n1482, n1499, n1237, n1514, n1502, div_82_u_div_PartRem_3__5_, n1522, 
        n1218, n2477, n2476, n2475}), .B({div_82_u_div_BInv_7__14_, 
        div_82_u_div_BInv_7__13_, div_82_u_div_BInv_7__12_, 
        div_82_u_div_BInv_7__11_, div_82_u_div_BInv_7__10_, n1329, 
        div_82_u_div_BInv_7__8_, div_82_u_div_BInv_7__7_, 
        div_82_u_div_BInv_7__6_, n1576, n1575, div_82_u_div_BInv_7__3_, 
        div_82_u_div_BInv_7__2_, div_82_u_div_BInv_7__1_, n1550}), .CI(1'b1), 
        .SUM({SYNOPSYS_UNCONNECTED_116, SYNOPSYS_UNCONNECTED_117, 
        SYNOPSYS_UNCONNECTED_118, div_82_u_div_SumTmp_7__2__11_, 
        div_82_u_div_SumTmp_7__2__10_, div_82_u_div_SumTmp_7__2__9_, 
        div_82_u_div_SumTmp_7__2__8_, div_82_u_div_SumTmp_7__2__7_, 
        div_82_u_div_SumTmp_7__2__6_, div_82_u_div_SumTmp_7__2__5_, 
        div_82_u_div_SumTmp_7__2__4_, div_82_u_div_SumTmp_7__2__3_, 
        div_82_u_div_SumTmp_7__2__2_, div_82_u_div_SumTmp_7__2__1_, 
        div_82_u_div_SumTmp_7__2__0_}), .CO(div_82_u_div_CryOut_7__2_) );
  SNN_DW01_add_98 div_82_u_div_u_add_PartRem_1_2 ( .A({n1488, n1498, n1327, 
        div_82_u_div_PartRem_2__11_, div_82_u_div_PartRem_2__10_, n1234, n1559, 
        n1507, n1518, n1495, n1346, n2496, n2474, n2473, n2472}), .B({1'b1, 
        1'b1, n1438, 1'b1, 1'b1, n1579, n1570, n1570, n1570, n1570, n1579, 
        n1570, n1570, n1418, 1'b1}), .CI(1'b1), .SUM({SYNOPSYS_UNCONNECTED_119, 
        SYNOPSYS_UNCONNECTED_120, SYNOPSYS_UNCONNECTED_121, 
        div_82_u_div_SumTmp_2__1__11_, div_82_u_div_SumTmp_2__1__10_, 
        div_82_u_div_SumTmp_2__1__9_, div_82_u_div_SumTmp_2__1__8_, 
        div_82_u_div_SumTmp_2__1__7_, div_82_u_div_SumTmp_2__1__6_, 
        div_82_u_div_SumTmp_2__1__5_, div_82_u_div_SumTmp_2__1__4_, 
        div_82_u_div_SumTmp_2__1__3_, div_82_u_div_SumTmp_2__1__2_, 
        div_82_u_div_SumTmp_2__1__1_, div_82_u_div_SumTmp_2__1__0_}), .CO(
        div_82_u_div_CryOut_2__1_) );
  SNN_DW01_add_107 div_82_u_div_u_add_PartRem_2_2 ( .A({
        div_82_u_div_PartRem_3__14_, div_82_u_div_PartRem_3__13_, n1227, n1485, 
        n1483, n1500, n1236, n1515, n1503, div_82_u_div_PartRem_3__5_, n1521, 
        n1219, n2477, n2476, n2475}), .B({1'b1, 1'b1, n1438, 1'b1, 1'b1, n1579, 
        n1570, n1570, n1570, n1570, n1212, n1570, n1570, n1418, 1'b1}), .CI(
        1'b1), .SUM({SYNOPSYS_UNCONNECTED_122, SYNOPSYS_UNCONNECTED_123, 
        SYNOPSYS_UNCONNECTED_124, div_82_u_div_SumTmp_2__2__11_, 
        div_82_u_div_SumTmp_2__2__10_, div_82_u_div_SumTmp_2__2__9_, 
        div_82_u_div_SumTmp_2__2__8_, div_82_u_div_SumTmp_2__2__7_, 
        div_82_u_div_SumTmp_2__2__6_, div_82_u_div_SumTmp_2__2__5_, 
        div_82_u_div_SumTmp_2__2__4_, div_82_u_div_SumTmp_2__2__3_, 
        div_82_u_div_SumTmp_2__2__2_, div_82_u_div_SumTmp_2__2__1_, 
        div_82_u_div_SumTmp_2__2__0_}), .CO(div_82_u_div_CryOut_2__2_) );
  SNN_DW01_add_110 div_82_u_div_u_add_PartRem_1_7 ( .A({n1488, n1498, 
        div_82_u_div_PartRem_2__12_, div_82_u_div_PartRem_2__11_, 
        div_82_u_div_PartRem_2__10_, n1233, n1560, n1507, n1518, n1495, n1346, 
        n2496, n2474, n2473, n2472}), .B({div_82_u_div_BInv_7__14_, 
        div_82_u_div_BInv_7__13_, div_82_u_div_BInv_7__12_, 
        div_82_u_div_BInv_7__11_, div_82_u_div_BInv_7__10_, n1329, 
        div_82_u_div_BInv_7__8_, div_82_u_div_BInv_7__7_, 
        div_82_u_div_BInv_7__6_, n1576, n1575, div_82_u_div_BInv_7__3_, 
        div_82_u_div_BInv_7__2_, div_82_u_div_BInv_7__1_, n1550}), .CI(1'b1), 
        .SUM({SYNOPSYS_UNCONNECTED_125, SYNOPSYS_UNCONNECTED_126, 
        SYNOPSYS_UNCONNECTED_127, div_82_u_div_SumTmp_7__1__11_, 
        div_82_u_div_SumTmp_7__1__10_, div_82_u_div_SumTmp_7__1__9_, 
        div_82_u_div_SumTmp_7__1__8_, div_82_u_div_SumTmp_7__1__7_, 
        div_82_u_div_SumTmp_7__1__6_, div_82_u_div_SumTmp_7__1__5_, 
        div_82_u_div_SumTmp_7__1__4_, div_82_u_div_SumTmp_7__1__3_, 
        div_82_u_div_SumTmp_7__1__2_, div_82_u_div_SumTmp_7__1__1_, 
        div_82_u_div_SumTmp_7__1__0_}), .CO(div_82_u_div_CryOut_7__1_) );
  SNN_DW01_add_115 div_82_u_div_u_add_PartRem_1_1 ( .A({n1488, n1498, 
        div_82_u_div_PartRem_2__12_, div_82_u_div_PartRem_2__11_, 
        div_82_u_div_PartRem_2__10_, n1234, n1559, n1507, n1518, n1495, n1346, 
        n2496, n2474, n2473, n2472}), .B({1'b1, 1'b1, 1'b1, n1438, 1'b1, 1'b1, 
        n1212, n1570, n1570, n1570, n1570, n1211, n1570, n1570, n1418}), .CI(
        1'b1), .SUM({SYNOPSYS_UNCONNECTED_128, SYNOPSYS_UNCONNECTED_129, 
        SYNOPSYS_UNCONNECTED_130, div_82_u_div_SumTmp_1__1__11_, 
        div_82_u_div_SumTmp_1__1__10_, div_82_u_div_SumTmp_1__1__9_, 
        div_82_u_div_SumTmp_1__1__8_, div_82_u_div_SumTmp_1__1__7_, 
        div_82_u_div_SumTmp_1__1__6_, div_82_u_div_SumTmp_1__1__5_, 
        div_82_u_div_SumTmp_1__1__4_, div_82_u_div_SumTmp_1__1__3_, 
        div_82_u_div_SumTmp_1__1__2_, div_82_u_div_SumTmp_1__1__1_, 
        div_82_u_div_SumTmp_1__1__0_}), .CO(div_82_u_div_CryOut_1__1_) );
  SNN_DW01_add_114 div_82_u_div_u_add_PartRem_1_6 ( .A({n1487, n1497, n1327, 
        div_82_u_div_PartRem_2__11_, div_82_u_div_PartRem_2__10_, n1233, n1560, 
        n1505, n1518, n1496, n1346, n2496, n2474, n2473, n2472}), .B({
        div_82_u_div_BInv_6__14_, div_82_u_div_BInv_6__13_, 
        div_82_u_div_BInv_6__12_, div_82_u_div_BInv_6__11_, 
        div_82_u_div_BInv_6__10_, n1536, n1544, n1528, n1530, n1542, n1540, 
        div_82_u_div_BInv_6__3_, div_82_u_div_BInv_6__2_, n1546, 1'b1}), .CI(
        1'b1), .SUM({SYNOPSYS_UNCONNECTED_131, SYNOPSYS_UNCONNECTED_132, 
        SYNOPSYS_UNCONNECTED_133, div_82_u_div_SumTmp_6__1__11_, 
        div_82_u_div_SumTmp_6__1__10_, div_82_u_div_SumTmp_6__1__9_, 
        div_82_u_div_SumTmp_6__1__8_, div_82_u_div_SumTmp_6__1__7_, 
        div_82_u_div_SumTmp_6__1__6_, div_82_u_div_SumTmp_6__1__5_, 
        div_82_u_div_SumTmp_6__1__4_, div_82_u_div_SumTmp_6__1__3_, 
        div_82_u_div_SumTmp_6__1__2_, div_82_u_div_SumTmp_6__1__1_, 
        div_82_u_div_SumTmp_6__1__0_}), .CO(div_82_u_div_CryOut_6__1_) );
  SNN_DW01_add_121 div_82_u_div_u_add_PartRem_2_1 ( .A({
        div_82_u_div_PartRem_3__14_, div_82_u_div_PartRem_3__13_, n1226, n1486, 
        n1483, n1500, n1236, n1514, n1502, div_82_u_div_PartRem_3__5_, n1522, 
        n1219, n2477, n2476, n2475}), .B({1'b1, 1'b1, 1'b1, n1438, 1'b1, 1'b1, 
        n1211, n1570, n1570, n1570, n1570, n1212, n1570, n1570, n1418}), .CI(
        1'b1), .SUM({SYNOPSYS_UNCONNECTED_134, SYNOPSYS_UNCONNECTED_135, 
        SYNOPSYS_UNCONNECTED_136, div_82_u_div_SumTmp_1__2__11_, 
        div_82_u_div_SumTmp_1__2__10_, div_82_u_div_SumTmp_1__2__9_, 
        div_82_u_div_SumTmp_1__2__8_, div_82_u_div_SumTmp_1__2__7_, 
        div_82_u_div_SumTmp_1__2__6_, div_82_u_div_SumTmp_1__2__5_, 
        div_82_u_div_SumTmp_1__2__4_, div_82_u_div_SumTmp_1__2__3_, 
        div_82_u_div_SumTmp_1__2__2_, div_82_u_div_SumTmp_1__2__1_, 
        div_82_u_div_SumTmp_1__2__0_}), .CO(div_82_u_div_CryOut_1__2_) );
  SNN_DW01_add_118 div_82_u_div_u_add_PartRem_2_6 ( .A({
        div_82_u_div_PartRem_3__14_, div_82_u_div_PartRem_3__13_, n1225, n1484, 
        n1481, n1499, n1235, n1514, n1502, div_82_u_div_PartRem_3__5_, n1522, 
        n1218, n2477, n2476, n2475}), .B({div_82_u_div_BInv_6__14_, 
        div_82_u_div_BInv_6__13_, div_82_u_div_BInv_6__12_, 
        div_82_u_div_BInv_6__11_, div_82_u_div_BInv_6__10_, n1536, n1544, 
        n1528, n1530, n1542, n1540, div_82_u_div_BInv_6__3_, 
        div_82_u_div_BInv_6__2_, n1546, 1'b1}), .CI(1'b1), .SUM({
        SYNOPSYS_UNCONNECTED_137, SYNOPSYS_UNCONNECTED_138, 
        SYNOPSYS_UNCONNECTED_139, div_82_u_div_SumTmp_6__2__11_, 
        div_82_u_div_SumTmp_6__2__10_, div_82_u_div_SumTmp_6__2__9_, 
        div_82_u_div_SumTmp_6__2__8_, div_82_u_div_SumTmp_6__2__7_, 
        div_82_u_div_SumTmp_6__2__6_, div_82_u_div_SumTmp_6__2__5_, 
        div_82_u_div_SumTmp_6__2__4_, div_82_u_div_SumTmp_6__2__3_, 
        div_82_u_div_SumTmp_6__2__2_, div_82_u_div_SumTmp_6__2__1_, 
        div_82_u_div_SumTmp_6__2__0_}), .CO(div_82_u_div_CryOut_6__2_) );
  SNN_DW01_add_123 div_82_u_div_u_add_PartRem_2_3 ( .A({
        div_82_u_div_PartRem_3__14_, div_82_u_div_PartRem_3__13_, n1226, n1486, 
        n1482, n1499, n1237, n1515, n1503, div_82_u_div_PartRem_3__5_, n1523, 
        n1219, n2477, n2476, n2475}), .B({div_82_u_div_BInv_3__14_, n1414, 
        div_82_u_div_BInv_3__12_, div_82_u_div_BInv_3__11_, 
        div_82_u_div_BInv_3__10_, div_82_u_div_BInv_3__9_, n1216, n1532, n1556, 
        n1534, n1583, n1554, div_82_u_div_BInv_3__2_, n1569, 
        div_82_u_div_BInv_3__0_}), .CI(1'b1), .SUM({SYNOPSYS_UNCONNECTED_140, 
        SYNOPSYS_UNCONNECTED_141, SYNOPSYS_UNCONNECTED_142, 
        div_82_u_div_SumTmp_3__2__11_, div_82_u_div_SumTmp_3__2__10_, 
        div_82_u_div_SumTmp_3__2__9_, div_82_u_div_SumTmp_3__2__8_, 
        div_82_u_div_SumTmp_3__2__7_, div_82_u_div_SumTmp_3__2__6_, 
        div_82_u_div_SumTmp_3__2__5_, div_82_u_div_SumTmp_3__2__4_, 
        div_82_u_div_SumTmp_3__2__3_, div_82_u_div_SumTmp_3__2__2_, 
        div_82_u_div_SumTmp_3__2__1_, div_82_u_div_SumTmp_3__2__0_}), .CO(
        div_82_u_div_CryOut_3__2_) );
  SNN_DW01_add_122 div_82_u_div_u_add_PartRem_2_5 ( .A({
        div_82_u_div_PartRem_3__14_, div_82_u_div_PartRem_3__13_, n1227, n1485, 
        n1483, n1500, n1236, n1515, n1503, div_82_u_div_PartRem_3__5_, n1521, 
        n1218, n2477, n2476, n2475}), .B({div_82_u_div_BInv_5__14_, 
        div_82_u_div_BInv_5__13_, div_82_u_div_BInv_5__12_, 
        div_82_u_div_BInv_5__11_, div_82_u_div_BInv_5__10_, 1'b1, n1538, n1524, 
        n1526, n1552, div_82_u_div_BInv_5__4_, div_82_u_div_BInv_5__3_, 
        div_82_u_div_BInv_5__2_, div_82_u_div_BInv_5__1_, n1548}), .CI(1'b1), 
        .SUM({SYNOPSYS_UNCONNECTED_143, SYNOPSYS_UNCONNECTED_144, 
        SYNOPSYS_UNCONNECTED_145, div_82_u_div_SumTmp_5__2__11_, 
        div_82_u_div_SumTmp_5__2__10_, div_82_u_div_SumTmp_5__2__9_, 
        div_82_u_div_SumTmp_5__2__8_, div_82_u_div_SumTmp_5__2__7_, 
        div_82_u_div_SumTmp_5__2__6_, div_82_u_div_SumTmp_5__2__5_, 
        div_82_u_div_SumTmp_5__2__4_, div_82_u_div_SumTmp_5__2__3_, 
        div_82_u_div_SumTmp_5__2__2_, div_82_u_div_SumTmp_5__2__1_, 
        div_82_u_div_SumTmp_5__2__0_}), .CO(div_82_u_div_CryOut_5__2_) );
  SNN_DW01_add_83 div_82_u_div_u_add_PartRem_5_7 ( .A({1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, n1331, n1222, n2498, sdiv_dend[17:15]}), 
        .B({div_82_u_div_BInv_7__14_, div_82_u_div_BInv_7__13_, 
        div_82_u_div_BInv_7__12_, div_82_u_div_BInv_7__11_, 
        div_82_u_div_BInv_7__10_, div_82_u_div_BInv_7__9_, 
        div_82_u_div_BInv_7__8_, div_82_u_div_BInv_7__7_, 
        div_82_u_div_BInv_7__6_, n1576, n1575, div_82_u_div_BInv_7__3_, 
        div_82_u_div_BInv_7__2_, div_82_u_div_BInv_7__1_, n1550}), .CI(1'b1), 
        .SUM({SYNOPSYS_UNCONNECTED_146, SYNOPSYS_UNCONNECTED_147, 
        SYNOPSYS_UNCONNECTED_148, SYNOPSYS_UNCONNECTED_149, 
        SYNOPSYS_UNCONNECTED_150, SYNOPSYS_UNCONNECTED_151, 
        SYNOPSYS_UNCONNECTED_152, SYNOPSYS_UNCONNECTED_153, 
        SYNOPSYS_UNCONNECTED_154, div_82_u_div_SumTmp_7__5__5_, 
        div_82_u_div_SumTmp_7__5__4_, div_82_u_div_SumTmp_7__5__3_, 
        div_82_u_div_SumTmp_7__5__2_, div_82_u_div_SumTmp_7__5__1_, 
        div_82_u_div_SumTmp_7__5__0_}), .CO(div_82_u_div_CryOut_7__5_) );
  SNN_DW01_add_120 div_82_u_div_u_add_PartRem_1_3 ( .A({n1488, n1497, n1326, 
        div_82_u_div_PartRem_2__11_, div_82_u_div_PartRem_2__10_, n1233, n1559, 
        n1506, n1518, n1495, n1346, n2496, n2474, n2473, n2472}), .B({
        div_82_u_div_BInv_3__14_, n1414, div_82_u_div_BInv_3__12_, 
        div_82_u_div_BInv_3__11_, div_82_u_div_BInv_3__10_, 
        div_82_u_div_BInv_3__9_, n1216, n1532, n1556, n1534, n1583, n1554, 
        div_82_u_div_BInv_3__2_, n1569, div_82_u_div_BInv_3__0_}), .CI(1'b1), 
        .SUM({SYNOPSYS_UNCONNECTED_155, SYNOPSYS_UNCONNECTED_156, 
        SYNOPSYS_UNCONNECTED_157, div_82_u_div_SumTmp_3__1__11_, 
        div_82_u_div_SumTmp_3__1__10_, div_82_u_div_SumTmp_3__1__9_, 
        div_82_u_div_SumTmp_3__1__8_, div_82_u_div_SumTmp_3__1__7_, 
        div_82_u_div_SumTmp_3__1__6_, div_82_u_div_SumTmp_3__1__5_, 
        div_82_u_div_SumTmp_3__1__4_, div_82_u_div_SumTmp_3__1__3_, 
        div_82_u_div_SumTmp_3__1__2_, div_82_u_div_SumTmp_3__1__1_, 
        div_82_u_div_SumTmp_3__1__0_}), .CO(div_82_u_div_CryOut_3__1_) );
  SNN_DW01_add_119 div_82_u_div_u_add_PartRem_1_5 ( .A({n1488, n1497, n1433, 
        div_82_u_div_PartRem_2__11_, div_82_u_div_PartRem_2__10_, n1233, n1560, 
        n1506, n1518, n1496, n1346, n2496, n2474, n2473, n2472}), .B({
        div_82_u_div_BInv_5__14_, div_82_u_div_BInv_5__13_, 
        div_82_u_div_BInv_5__12_, div_82_u_div_BInv_5__11_, 
        div_82_u_div_BInv_5__10_, 1'b1, n1538, n1524, n1526, n1552, 
        div_82_u_div_BInv_5__4_, div_82_u_div_BInv_5__3_, 
        div_82_u_div_BInv_5__2_, div_82_u_div_BInv_5__1_, n1548}), .CI(1'b1), 
        .SUM({SYNOPSYS_UNCONNECTED_158, SYNOPSYS_UNCONNECTED_159, 
        SYNOPSYS_UNCONNECTED_160, div_82_u_div_SumTmp_5__1__11_, 
        div_82_u_div_SumTmp_5__1__10_, div_82_u_div_SumTmp_5__1__9_, 
        div_82_u_div_SumTmp_5__1__8_, div_82_u_div_SumTmp_5__1__7_, 
        div_82_u_div_SumTmp_5__1__6_, div_82_u_div_SumTmp_5__1__5_, 
        div_82_u_div_SumTmp_5__1__4_, div_82_u_div_SumTmp_5__1__3_, 
        div_82_u_div_SumTmp_5__1__2_, div_82_u_div_SumTmp_5__1__1_, 
        div_82_u_div_SumTmp_5__1__0_}), .CO(div_82_u_div_CryOut_5__1_) );
  SNN_DW01_add_125 div_82_u_div_u_add_B6 ( .A({1'b1, n1439, 1'b1, 1'b1, n1579, 
        n1210, n1570, n1210, n1570, n1211, n1570, n1570, n2493, 1'b1, 1'b1}), 
        .B({1'b1, 1'b1, n1439, 1'b1, 1'b1, n1212, n1570, n1570, n1570, n1570, 
        n1579, n1210, n1210, n2493, 1'b1}), .CI(1'b1), .SUM({
        div_82_u_div_BInv_6__14_, div_82_u_div_BInv_6__13_, 
        div_82_u_div_BInv_6__12_, div_82_u_div_BInv_6__11_, 
        div_82_u_div_BInv_6__10_, div_82_u_div_BInv_6__9_, 
        div_82_u_div_BInv_6__8_, div_82_u_div_BInv_6__7_, 
        div_82_u_div_BInv_6__6_, div_82_u_div_BInv_6__5_, 
        div_82_u_div_BInv_6__4_, div_82_u_div_BInv_6__3_, 
        div_82_u_div_BInv_6__2_, div_82_u_div_BInv_6__1_, 
        SYNOPSYS_UNCONNECTED_161}) );
  SNN_DW01_add_124 div_82_u_div_u_add_B5 ( .A({1'b1, n1438, 1'b1, 1'b1, n1211, 
        n1210, n1570, n1570, n1570, n1579, n1570, n1210, n2493, 1'b1, 1'b1}), 
        .B({1'b1, 1'b1, 1'b1, n1438, 1'b1, 1'b1, n1579, n1570, n1570, n1570, 
        n1210, n1579, n1210, n1210, n2493}), .CI(1'b1), .SUM({
        div_82_u_div_BInv_5__14_, div_82_u_div_BInv_5__13_, 
        div_82_u_div_BInv_5__12_, div_82_u_div_BInv_5__11_, 
        div_82_u_div_BInv_5__10_, SYNOPSYS_UNCONNECTED_162, 
        div_82_u_div_BInv_5__8_, div_82_u_div_BInv_5__7_, 
        div_82_u_div_BInv_5__6_, div_82_u_div_BInv_5__5_, 
        div_82_u_div_BInv_5__4_, div_82_u_div_BInv_5__3_, 
        div_82_u_div_BInv_5__2_, div_82_u_div_BInv_5__1_, 
        div_82_u_div_BInv_5__0_}) );
  SNN_DW01_add_104 div_82_u_div_u_add_PartRem_5_3 ( .A({1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, n1331, n1222, n2498, sdiv_dend[17:15]}), 
        .B({div_82_u_div_BInv_3__14_, div_82_u_div_BInv_3__13_, 
        div_82_u_div_BInv_3__12_, div_82_u_div_BInv_3__11_, 
        div_82_u_div_BInv_3__10_, div_82_u_div_BInv_3__9_, n1215, n1532, n1556, 
        n1534, n1583, n1554, div_82_u_div_BInv_3__2_, div_82_u_div_BInv_3__1_, 
        div_82_u_div_BInv_3__0_}), .CI(1'b1), .SUM({SYNOPSYS_UNCONNECTED_163, 
        SYNOPSYS_UNCONNECTED_164, SYNOPSYS_UNCONNECTED_165, 
        SYNOPSYS_UNCONNECTED_166, SYNOPSYS_UNCONNECTED_167, 
        SYNOPSYS_UNCONNECTED_168, SYNOPSYS_UNCONNECTED_169, 
        SYNOPSYS_UNCONNECTED_170, SYNOPSYS_UNCONNECTED_171, 
        div_82_u_div_SumTmp_3__5__5_, div_82_u_div_SumTmp_3__5__4_, 
        div_82_u_div_SumTmp_3__5__3_, div_82_u_div_SumTmp_3__5__2_, 
        div_82_u_div_SumTmp_3__5__1_, div_82_u_div_SumTmp_3__5__0_}), .CO(
        div_82_u_div_CryOut_3__5_) );
  SNN_DW01_add_150 div_82_u_div_u_add_PartRem_0_1 ( .A({n1491, 
        div_82_u_div_PartRem_1__13_, div_82_u_div_PartRem_1__12_, 
        div_82_u_div_PartRem_1__11_, n1509, n1492, n1480, n1478, n1348, n1520, 
        n1513, div_82_u_div_PartRem_1__3_, n2471, n2470, n2469}), .B({1'b1, 
        1'b1, 1'b1, n1438, 1'b1, 1'b1, n1211, n1570, n1570, n1570, n1570, 
        n1579, n1570, n1570, n1418}), .CI(1'b1), .SUM({
        SYNOPSYS_UNCONNECTED_172, SYNOPSYS_UNCONNECTED_173, 
        SYNOPSYS_UNCONNECTED_174, SYNOPSYS_UNCONNECTED_175, 
        SYNOPSYS_UNCONNECTED_176, SYNOPSYS_UNCONNECTED_177, 
        SYNOPSYS_UNCONNECTED_178, SYNOPSYS_UNCONNECTED_179, 
        SYNOPSYS_UNCONNECTED_180, SYNOPSYS_UNCONNECTED_181, 
        SYNOPSYS_UNCONNECTED_182, SYNOPSYS_UNCONNECTED_183, 
        SYNOPSYS_UNCONNECTED_184, SYNOPSYS_UNCONNECTED_185, 
        SYNOPSYS_UNCONNECTED_186}), .CO(div_82_u_div_CryOut_1__0_) );
  SNN_DW01_add_127 div_82_u_div_u_add_B3 ( .A({1'b1, 1'b1, n1439, 1'b1, 1'b1, 
        n1431, n1209, n1570, n1570, n1210, n1211, n1570, n1570, n2493, 1'b1}), 
        .B({1'b1, 1'b1, 1'b1, n1603, 1'b1, 1'b1, n2494, n1570, n1570, n1570, 
        n1570, n1579, n1210, n1209, n2493}), .CI(1'b1), .SUM({
        div_82_u_div_BInv_3__14_, div_82_u_div_BInv_3__13_, 
        div_82_u_div_BInv_3__12_, div_82_u_div_BInv_3__11_, 
        div_82_u_div_BInv_3__10_, div_82_u_div_BInv_3__9_, 
        div_82_u_div_BInv_3__8_, div_82_u_div_BInv_3__7_, 
        div_82_u_div_BInv_3__6_, div_82_u_div_BInv_3__5_, 
        div_82_u_div_BInv_3__4_, div_82_u_div_BInv_3__3_, 
        div_82_u_div_BInv_3__2_, div_82_u_div_BInv_3__1_, 
        div_82_u_div_BInv_3__0_}) );
  SNN_DW01_add_162 div_82_u_div_u_add_PartRem_3_3 ( .A({1'b0, 1'b0, 1'b0, 
        n2489, n2488, n2487, n2486, n2485, n2484, n2483, n2482, n2481, n2480, 
        n2479, n2478}), .B({div_82_u_div_BInv_3__14_, n1414, 
        div_82_u_div_BInv_3__12_, div_82_u_div_BInv_3__11_, 
        div_82_u_div_BInv_3__10_, div_82_u_div_BInv_3__9_, n1215, n1532, n1556, 
        n1534, n1583, n1554, div_82_u_div_BInv_3__2_, n1569, 
        div_82_u_div_BInv_3__0_}), .CI(1'b1), .SUM({SYNOPSYS_UNCONNECTED_187, 
        SYNOPSYS_UNCONNECTED_188, SYNOPSYS_UNCONNECTED_189, 
        div_82_u_div_SumTmp_3__3__11_, div_82_u_div_SumTmp_3__3__10_, 
        div_82_u_div_SumTmp_3__3__9_, div_82_u_div_SumTmp_3__3__8_, 
        div_82_u_div_SumTmp_3__3__7_, div_82_u_div_SumTmp_3__3__6_, 
        div_82_u_div_SumTmp_3__3__5_, div_82_u_div_SumTmp_3__3__4_, 
        div_82_u_div_SumTmp_3__3__3_, div_82_u_div_SumTmp_3__3__2_, 
        div_82_u_div_SumTmp_3__3__1_, div_82_u_div_SumTmp_3__3__0_}), .CO(
        div_82_u_div_CryOut_3__3_) );
  SNN_DW01_add_169 div_82_u_div_u_add_PartRem_3_5 ( .A({1'b0, 1'b0, 1'b0, 
        n2489, n2488, n2487, n2486, n2485, n2484, n2483, n2482, n2481, n2480, 
        n2479, n2478}), .B({div_82_u_div_BInv_5__14_, div_82_u_div_BInv_5__13_, 
        div_82_u_div_BInv_5__12_, div_82_u_div_BInv_5__11_, 
        div_82_u_div_BInv_5__10_, 1'b1, n1538, n1524, n1526, n1552, 
        div_82_u_div_BInv_5__4_, div_82_u_div_BInv_5__3_, 
        div_82_u_div_BInv_5__2_, div_82_u_div_BInv_5__1_, n1548}), .CI(1'b1), 
        .SUM({SYNOPSYS_UNCONNECTED_190, SYNOPSYS_UNCONNECTED_191, 
        SYNOPSYS_UNCONNECTED_192, div_82_u_div_SumTmp_5__3__11_, 
        div_82_u_div_SumTmp_5__3__10_, div_82_u_div_SumTmp_5__3__9_, 
        div_82_u_div_SumTmp_5__3__8_, div_82_u_div_SumTmp_5__3__7_, 
        div_82_u_div_SumTmp_5__3__6_, div_82_u_div_SumTmp_5__3__5_, 
        div_82_u_div_SumTmp_5__3__4_, div_82_u_div_SumTmp_5__3__3_, 
        div_82_u_div_SumTmp_5__3__2_, div_82_u_div_SumTmp_5__3__1_, 
        div_82_u_div_SumTmp_5__3__0_}), .CO(div_82_u_div_CryOut_5__3_) );
  SNN_DW01_add_161 div_82_u_div_u_add_PartRem_3_7 ( .A({1'b0, 1'b0, 1'b0, 
        n2489, n2488, n2487, n2486, n2485, n2484, n2483, n2482, n2481, n2480, 
        n2479, n2478}), .B({div_82_u_div_BInv_7__14_, div_82_u_div_BInv_7__13_, 
        div_82_u_div_BInv_7__12_, div_82_u_div_BInv_7__11_, 
        div_82_u_div_BInv_7__10_, n1329, div_82_u_div_BInv_7__8_, 
        div_82_u_div_BInv_7__7_, div_82_u_div_BInv_7__6_, n1576, n1575, 
        div_82_u_div_BInv_7__3_, div_82_u_div_BInv_7__2_, 
        div_82_u_div_BInv_7__1_, n1550}), .CI(1'b1), .SUM({
        SYNOPSYS_UNCONNECTED_193, SYNOPSYS_UNCONNECTED_194, 
        SYNOPSYS_UNCONNECTED_195, div_82_u_div_SumTmp_7__3__11_, 
        div_82_u_div_SumTmp_7__3__10_, div_82_u_div_SumTmp_7__3__9_, 
        div_82_u_div_SumTmp_7__3__8_, div_82_u_div_SumTmp_7__3__7_, 
        div_82_u_div_SumTmp_7__3__6_, div_82_u_div_SumTmp_7__3__5_, 
        div_82_u_div_SumTmp_7__3__4_, div_82_u_div_SumTmp_7__3__3_, 
        div_82_u_div_SumTmp_7__3__2_, div_82_u_div_SumTmp_7__3__1_, 
        div_82_u_div_SumTmp_7__3__0_}), .CO(div_82_u_div_CryOut_7__3_) );
  SNN_DW01_add_130 div_82_u_div_u_add_PartRem_3_4 ( .A({1'b0, 1'b0, 1'b0, 
        n2489, n2488, n2487, n2486, n2485, n2484, n2483, n2482, n2481, n2480, 
        n2479, n2478}), .B({1'b1, n1438, 1'b1, 1'b1, n1579, n1570, n1570, 
        n1570, n1570, n1579, n1570, n1570, n1418, 1'b1, 1'b1}), .CI(1'b1), 
        .SUM({SYNOPSYS_UNCONNECTED_196, SYNOPSYS_UNCONNECTED_197, 
        SYNOPSYS_UNCONNECTED_198, div_82_u_div_SumTmp_4__3__11_, 
        div_82_u_div_SumTmp_4__3__10_, div_82_u_div_SumTmp_4__3__9_, 
        div_82_u_div_SumTmp_4__3__8_, div_82_u_div_SumTmp_4__3__7_, 
        div_82_u_div_SumTmp_4__3__6_, div_82_u_div_SumTmp_4__3__5_, 
        div_82_u_div_SumTmp_4__3__4_, div_82_u_div_SumTmp_4__3__3_, 
        div_82_u_div_SumTmp_4__3__2_, div_82_u_div_SumTmp_4__3__1_, 
        div_82_u_div_SumTmp_4__3__0_}), .CO(div_82_quotient_11_) );
  SNN_DW01_add_145 div_82_u_div_u_add_PartRem_3_6 ( .A({1'b0, 1'b0, 1'b0, 
        n2489, n2488, n2487, n2486, n2485, n2484, n2483, n2482, n2481, n2480, 
        n2479, n2478}), .B({div_82_u_div_BInv_6__14_, div_82_u_div_BInv_6__13_, 
        div_82_u_div_BInv_6__12_, div_82_u_div_BInv_6__11_, 
        div_82_u_div_BInv_6__10_, n1536, n1544, n1528, n1530, n1542, n1540, 
        div_82_u_div_BInv_6__3_, div_82_u_div_BInv_6__2_, n1546, 1'b1}), .CI(
        1'b1), .SUM({SYNOPSYS_UNCONNECTED_199, SYNOPSYS_UNCONNECTED_200, 
        SYNOPSYS_UNCONNECTED_201, div_82_u_div_SumTmp_6__3__11_, 
        div_82_u_div_SumTmp_6__3__10_, div_82_u_div_SumTmp_6__3__9_, 
        div_82_u_div_SumTmp_6__3__8_, div_82_u_div_SumTmp_6__3__7_, 
        div_82_u_div_SumTmp_6__3__6_, div_82_u_div_SumTmp_6__3__5_, 
        div_82_u_div_SumTmp_6__3__4_, div_82_u_div_SumTmp_6__3__3_, 
        div_82_u_div_SumTmp_6__3__2_, div_82_u_div_SumTmp_6__3__1_, 
        div_82_u_div_SumTmp_6__3__0_}), .CO(div_82_u_div_CryOut_6__3_) );
  SNN_DW01_add_168 div_82_u_div_u_add_PartRem_3_1 ( .A({1'b0, 1'b0, 1'b0, 
        n2489, n2488, n2487, n2486, n2485, n2484, n2483, n2482, n2481, n2480, 
        n2479, n2478}), .B({1'b1, 1'b1, 1'b1, n1438, 1'b1, 1'b1, n1579, n1570, 
        n1570, n1570, n1570, n1212, n1570, n1570, n1418}), .CI(1'b1), .SUM({
        SYNOPSYS_UNCONNECTED_202, SYNOPSYS_UNCONNECTED_203, 
        SYNOPSYS_UNCONNECTED_204, div_82_u_div_SumTmp_1__3__11_, 
        div_82_u_div_SumTmp_1__3__10_, div_82_u_div_SumTmp_1__3__9_, 
        div_82_u_div_SumTmp_1__3__8_, div_82_u_div_SumTmp_1__3__7_, 
        div_82_u_div_SumTmp_1__3__6_, div_82_u_div_SumTmp_1__3__5_, 
        div_82_u_div_SumTmp_1__3__4_, div_82_u_div_SumTmp_1__3__3_, 
        div_82_u_div_SumTmp_1__3__2_, div_82_u_div_SumTmp_1__3__1_, 
        div_82_u_div_SumTmp_1__3__0_}), .CO(div_82_u_div_CryOut_1__3_) );
  SNN_DW01_add_134 div_82_u_div_u_add_PartRem_3_2 ( .A({1'b0, 1'b0, 1'b0, 
        n2489, n2488, n2487, n2486, n2485, n2484, n2483, n2482, n2481, n2480, 
        n2479, n2478}), .B({1'b1, 1'b1, n1439, 1'b1, 1'b1, n1579, n1570, n1570, 
        n1570, n1570, n1212, n1570, n1570, n1418, 1'b1}), .CI(1'b1), .SUM({
        SYNOPSYS_UNCONNECTED_205, SYNOPSYS_UNCONNECTED_206, 
        SYNOPSYS_UNCONNECTED_207, div_82_u_div_SumTmp_2__3__11_, 
        div_82_u_div_SumTmp_2__3__10_, div_82_u_div_SumTmp_2__3__9_, 
        div_82_u_div_SumTmp_2__3__8_, div_82_u_div_SumTmp_2__3__7_, 
        div_82_u_div_SumTmp_2__3__6_, div_82_u_div_SumTmp_2__3__5_, 
        div_82_u_div_SumTmp_2__3__4_, div_82_u_div_SumTmp_2__3__3_, 
        div_82_u_div_SumTmp_2__3__2_, div_82_u_div_SumTmp_2__3__1_, 
        div_82_u_div_SumTmp_2__3__0_}), .CO(div_82_u_div_CryOut_2__3_) );
  SNN_DW01_add_183 div_82_u_div_u_add_PartRem_5_6 ( .A({1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, div_82_u_div_PartRem_6__5_, n1221, n2498, 
        sdiv_dend[17:15]}), .B({div_82_u_div_BInv_6__14_, 
        div_82_u_div_BInv_6__13_, div_82_u_div_BInv_6__12_, 
        div_82_u_div_BInv_6__11_, div_82_u_div_BInv_6__10_, n1536, n1544, 
        n1528, n1530, n1542, n1540, div_82_u_div_BInv_6__3_, 
        div_82_u_div_BInv_6__2_, n1546, 1'b1}), .CI(1'b1), .SUM({
        SYNOPSYS_UNCONNECTED_208, SYNOPSYS_UNCONNECTED_209, 
        SYNOPSYS_UNCONNECTED_210, SYNOPSYS_UNCONNECTED_211, 
        SYNOPSYS_UNCONNECTED_212, SYNOPSYS_UNCONNECTED_213, 
        SYNOPSYS_UNCONNECTED_214, SYNOPSYS_UNCONNECTED_215, 
        SYNOPSYS_UNCONNECTED_216, div_82_u_div_SumTmp_6__5__5_, 
        div_82_u_div_SumTmp_6__5__4_, div_82_u_div_SumTmp_6__5__3_, 
        div_82_u_div_SumTmp_6__5__2_, div_82_u_div_SumTmp_6__5__1_, 
        div_82_u_div_SumTmp_6__5__0_}), .CO(div_82_u_div_CryOut_6__5_) );
  SNN_DW01_add_201 div_82_u_div_u_add_PartRem_5_2 ( .A({1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, div_82_u_div_PartRem_6__5_, n1220, n2498, 
        sdiv_dend[17:15]}), .B({1'b1, 1'b1, n1439, 1'b1, 1'b1, n1579, n1210, 
        n1570, n1570, n1210, n1579, n1210, n1210, n1418, 1'b1}), .CI(1'b1), 
        .SUM({SYNOPSYS_UNCONNECTED_217, SYNOPSYS_UNCONNECTED_218, 
        SYNOPSYS_UNCONNECTED_219, SYNOPSYS_UNCONNECTED_220, 
        SYNOPSYS_UNCONNECTED_221, SYNOPSYS_UNCONNECTED_222, 
        SYNOPSYS_UNCONNECTED_223, SYNOPSYS_UNCONNECTED_224, 
        SYNOPSYS_UNCONNECTED_225, div_82_u_div_SumTmp_2__5__5_, 
        div_82_u_div_SumTmp_2__5__4_, div_82_u_div_SumTmp_2__5__3_, 
        div_82_u_div_SumTmp_2__5__2_, div_82_u_div_SumTmp_2__5__1_, 
        div_82_u_div_SumTmp_2__5__0_}), .CO(div_82_u_div_CryOut_2__5_) );
  SNN_DW01_add_198 div_82_u_div_u_add_PartRem_5_4 ( .A({1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, div_82_u_div_PartRem_6__5_, n1222, n2498, 
        sdiv_dend[17:15]}), .B({1'b1, n1438, 1'b1, 1'b1, n1579, n1210, n1570, 
        n1570, n1570, n1579, n1210, n1210, n1418, 1'b1, 1'b1}), .CI(1'b1), 
        .SUM({SYNOPSYS_UNCONNECTED_226, SYNOPSYS_UNCONNECTED_227, 
        SYNOPSYS_UNCONNECTED_228, SYNOPSYS_UNCONNECTED_229, 
        SYNOPSYS_UNCONNECTED_230, SYNOPSYS_UNCONNECTED_231, 
        SYNOPSYS_UNCONNECTED_232, SYNOPSYS_UNCONNECTED_233, 
        SYNOPSYS_UNCONNECTED_234, div_82_u_div_SumTmp_4__5__5_, 
        div_82_u_div_SumTmp_4__5__4_, div_82_u_div_SumTmp_4__5__3_, 
        div_82_u_div_SumTmp_4__5__2_, div_82_u_div_SumTmp_4__5__1_, 
        div_82_u_div_SumTmp_4__5__0_}), .CO(div_82_quotient_17_) );
  SNN_DW01_add_185 div_82_u_div_u_add_PartRem_6_2 ( .A({1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, n1470, n1469}), 
        .B({1'b1, 1'b1, n1439, 1'b1, 1'b1, n1452, n1570, n1570, n1570, n1210, 
        n1452, n1210, n1570, n2493, 1'b1}), .CI(1'b1), .SUM({
        SYNOPSYS_UNCONNECTED_235, SYNOPSYS_UNCONNECTED_236, 
        SYNOPSYS_UNCONNECTED_237, SYNOPSYS_UNCONNECTED_238, 
        SYNOPSYS_UNCONNECTED_239, SYNOPSYS_UNCONNECTED_240, 
        SYNOPSYS_UNCONNECTED_241, SYNOPSYS_UNCONNECTED_242, 
        SYNOPSYS_UNCONNECTED_243, SYNOPSYS_UNCONNECTED_244, 
        SYNOPSYS_UNCONNECTED_245, SYNOPSYS_UNCONNECTED_246, 
        div_82_u_div_SumTmp_2__6__2_, div_82_u_div_SumTmp_2__6__1_, 
        div_82_u_div_SumTmp_2__6__0_}), .CO(div_82_u_div_CryOut_2__6_) );
  SNN_DW01_add_188 div_82_u_div_u_add_PartRem_0_6 ( .A({n1490, n1517, 
        div_82_u_div_PartRem_1__12_, div_82_u_div_PartRem_1__11_, n1509, n1493, 
        n1480, n1476, n1434, n1520, n1512, div_82_u_div_PartRem_1__3_, n2471, 
        n2470, n2469}), .B({div_82_u_div_BInv_6__14_, div_82_u_div_BInv_6__13_, 
        div_82_u_div_BInv_6__12_, div_82_u_div_BInv_6__11_, 
        div_82_u_div_BInv_6__10_, n1536, n1544, n1528, n1530, n1542, n1540, 
        div_82_u_div_BInv_6__3_, div_82_u_div_BInv_6__2_, n1546, 1'b1}), .CI(
        1'b1), .SUM({SYNOPSYS_UNCONNECTED_247, SYNOPSYS_UNCONNECTED_248, 
        SYNOPSYS_UNCONNECTED_249, SYNOPSYS_UNCONNECTED_250, 
        SYNOPSYS_UNCONNECTED_251, SYNOPSYS_UNCONNECTED_252, 
        SYNOPSYS_UNCONNECTED_253, SYNOPSYS_UNCONNECTED_254, 
        SYNOPSYS_UNCONNECTED_255, SYNOPSYS_UNCONNECTED_256, 
        SYNOPSYS_UNCONNECTED_257, SYNOPSYS_UNCONNECTED_258, 
        SYNOPSYS_UNCONNECTED_259, SYNOPSYS_UNCONNECTED_260, 
        SYNOPSYS_UNCONNECTED_261}), .CO(div_82_u_div_CryOut_6__0_) );
  SNN_DW01_add_193 div_82_u_div_u_add_PartRem_0_2 ( .A({
        div_82_u_div_PartRem_1__14_, n1517, div_82_u_div_PartRem_1__12_, 
        div_82_u_div_PartRem_1__11_, n1509, n1492, n1479, n1478, n1434, n1519, 
        n1513, div_82_u_div_PartRem_1__3_, n2471, n2470, n2469}), .B({1'b1, 
        1'b1, n1439, 1'b1, 1'b1, n1212, n1570, n1570, n1570, n1570, n1579, 
        n1570, n1570, n1418, 1'b1}), .CI(1'b1), .SUM({SYNOPSYS_UNCONNECTED_262, 
        SYNOPSYS_UNCONNECTED_263, SYNOPSYS_UNCONNECTED_264, 
        SYNOPSYS_UNCONNECTED_265, SYNOPSYS_UNCONNECTED_266, 
        SYNOPSYS_UNCONNECTED_267, SYNOPSYS_UNCONNECTED_268, 
        SYNOPSYS_UNCONNECTED_269, SYNOPSYS_UNCONNECTED_270, 
        SYNOPSYS_UNCONNECTED_271, SYNOPSYS_UNCONNECTED_272, 
        SYNOPSYS_UNCONNECTED_273, SYNOPSYS_UNCONNECTED_274, 
        SYNOPSYS_UNCONNECTED_275, SYNOPSYS_UNCONNECTED_276}), .CO(
        div_82_u_div_CryOut_2__0_) );
  SNN_DW01_add_191 div_82_u_div_u_add_PartRem_4_6 ( .A({1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, n2492, n2491, n2490, n2467, n2466, n2468, sdiv_dend[14:12]}), .B({div_82_u_div_BInv_6__14_, div_82_u_div_BInv_6__13_, 
        div_82_u_div_BInv_6__12_, div_82_u_div_BInv_6__11_, 
        div_82_u_div_BInv_6__10_, n1536, n1544, n1528, n1530, n1542, n1540, 
        div_82_u_div_BInv_6__3_, div_82_u_div_BInv_6__2_, n1546, 1'b1}), .CI(
        1'b1), .SUM({SYNOPSYS_UNCONNECTED_277, SYNOPSYS_UNCONNECTED_278, 
        SYNOPSYS_UNCONNECTED_279, SYNOPSYS_UNCONNECTED_280, 
        SYNOPSYS_UNCONNECTED_281, SYNOPSYS_UNCONNECTED_282, 
        div_82_u_div_SumTmp_6__4__8_, div_82_u_div_SumTmp_6__4__7_, 
        div_82_u_div_SumTmp_6__4__6_, div_82_u_div_SumTmp_6__4__5_, 
        div_82_u_div_SumTmp_6__4__4_, div_82_u_div_SumTmp_6__4__3_, 
        div_82_u_div_SumTmp_6__4__2_, div_82_u_div_SumTmp_6__4__1_, 
        div_82_u_div_SumTmp_6__4__0_}), .CO(div_82_u_div_CryOut_6__4_) );
  SNN_DW01_add_196 div_82_u_div_u_add_PartRem_4_2 ( .A({1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, n2492, n2491, n2490, n2467, n2466, n2468, sdiv_dend[14:12]}), .B({1'b1, 1'b1, n1438, 1'b1, 1'b1, n1579, n1570, n1570, n1570, n1570, n1579, 
        n1570, n1210, n1418, 1'b1}), .CI(1'b1), .SUM({SYNOPSYS_UNCONNECTED_283, 
        SYNOPSYS_UNCONNECTED_284, SYNOPSYS_UNCONNECTED_285, 
        SYNOPSYS_UNCONNECTED_286, SYNOPSYS_UNCONNECTED_287, 
        SYNOPSYS_UNCONNECTED_288, div_82_u_div_SumTmp_2__4__8_, 
        div_82_u_div_SumTmp_2__4__7_, div_82_u_div_SumTmp_2__4__6_, 
        div_82_u_div_SumTmp_2__4__5_, div_82_u_div_SumTmp_2__4__4_, 
        div_82_u_div_SumTmp_2__4__3_, div_82_u_div_SumTmp_2__4__2_, 
        div_82_u_div_SumTmp_2__4__1_, div_82_u_div_SumTmp_2__4__0_}), .CO(
        div_82_u_div_CryOut_2__4_) );
  SNN_DW01_add_186 div_82_u_div_u_add_PartRem_4_4 ( .A({1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, n2492, n2491, n2490, n2467, n2466, n2468, sdiv_dend[14:12]}), .B({1'b1, n1438, 1'b1, 1'b1, n1579, n1570, n1570, n1570, n1570, n1579, 
        n1570, n1570, n1418, 1'b1, 1'b1}), .CI(1'b1), .SUM({
        SYNOPSYS_UNCONNECTED_289, SYNOPSYS_UNCONNECTED_290, 
        SYNOPSYS_UNCONNECTED_291, SYNOPSYS_UNCONNECTED_292, 
        SYNOPSYS_UNCONNECTED_293, SYNOPSYS_UNCONNECTED_294, 
        div_82_u_div_SumTmp_4__4__8_, div_82_u_div_SumTmp_4__4__7_, 
        div_82_u_div_SumTmp_4__4__6_, div_82_u_div_SumTmp_4__4__5_, 
        div_82_u_div_SumTmp_4__4__4_, div_82_u_div_SumTmp_4__4__3_, 
        div_82_u_div_SumTmp_4__4__2_, div_82_u_div_SumTmp_4__4__1_, 
        div_82_u_div_SumTmp_4__4__0_}), .CO(div_82_quotient_14_) );
  SNN_DW01_add_213 div_82_u_div_u_add_PartRem_5_1 ( .A({1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, div_82_u_div_PartRem_6__5_, n1221, n2498, 
        sdiv_dend[17:15]}), .B({1'b1, 1'b1, 1'b1, n1439, 1'b1, 1'b1, n1579, 
        n1210, n1570, n1210, n1210, n1579, n1210, n1210, n2493}), .CI(1'b1), 
        .SUM({SYNOPSYS_UNCONNECTED_295, SYNOPSYS_UNCONNECTED_296, 
        SYNOPSYS_UNCONNECTED_297, SYNOPSYS_UNCONNECTED_298, 
        SYNOPSYS_UNCONNECTED_299, SYNOPSYS_UNCONNECTED_300, 
        SYNOPSYS_UNCONNECTED_301, SYNOPSYS_UNCONNECTED_302, 
        SYNOPSYS_UNCONNECTED_303, div_82_u_div_SumTmp_1__5__5_, 
        div_82_u_div_SumTmp_1__5__4_, div_82_u_div_SumTmp_1__5__3_, 
        div_82_u_div_SumTmp_1__5__2_, div_82_u_div_SumTmp_1__5__1_, 
        div_82_u_div_SumTmp_1__5__0_}), .CO(div_82_u_div_CryOut_1__5_) );
  SNN_DW01_add_218 div_82_u_div_u_add_PartRem_5_5 ( .A({1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, div_82_u_div_PartRem_6__5_, n1221, n2498, 
        sdiv_dend[17:15]}), .B({div_82_u_div_BInv_5__14_, 
        div_82_u_div_BInv_5__13_, div_82_u_div_BInv_5__12_, 
        div_82_u_div_BInv_5__11_, div_82_u_div_BInv_5__10_, 1'b1, n1538, n1524, 
        n1526, n1552, div_82_u_div_BInv_5__4_, div_82_u_div_BInv_5__3_, 
        div_82_u_div_BInv_5__2_, div_82_u_div_BInv_5__1_, n1548}), .CI(1'b1), 
        .SUM({SYNOPSYS_UNCONNECTED_304, SYNOPSYS_UNCONNECTED_305, 
        SYNOPSYS_UNCONNECTED_306, SYNOPSYS_UNCONNECTED_307, 
        SYNOPSYS_UNCONNECTED_308, SYNOPSYS_UNCONNECTED_309, 
        SYNOPSYS_UNCONNECTED_310, SYNOPSYS_UNCONNECTED_311, 
        SYNOPSYS_UNCONNECTED_312, div_82_u_div_SumTmp_5__5__5_, 
        div_82_u_div_SumTmp_5__5__4_, div_82_u_div_SumTmp_5__5__3_, 
        div_82_u_div_SumTmp_5__5__2_, div_82_u_div_SumTmp_5__5__1_, 
        div_82_u_div_SumTmp_5__5__0_}), .CO(div_82_u_div_CryOut_5__5_) );
  SNN_DW01_add_219 div_82_u_div_u_add_PartRem_6_1 ( .A({1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, n1470, n1469}), 
        .B({1'b1, 1'b1, 1'b1, n1439, 1'b1, 1'b1, n1211, n1570, n1570, n1570, 
        n1210, n1578, n1570, n1210, n2493}), .CI(1'b1), .SUM({
        SYNOPSYS_UNCONNECTED_313, SYNOPSYS_UNCONNECTED_314, 
        SYNOPSYS_UNCONNECTED_315, SYNOPSYS_UNCONNECTED_316, 
        SYNOPSYS_UNCONNECTED_317, SYNOPSYS_UNCONNECTED_318, 
        SYNOPSYS_UNCONNECTED_319, SYNOPSYS_UNCONNECTED_320, 
        SYNOPSYS_UNCONNECTED_321, SYNOPSYS_UNCONNECTED_322, 
        SYNOPSYS_UNCONNECTED_323, SYNOPSYS_UNCONNECTED_324, 
        div_82_u_div_SumTmp_1__6__2_, div_82_u_div_SumTmp_1__6__1_, 
        div_82_u_div_SumTmp_1__6__0_}), .CO(div_82_u_div_CryOut_1__6_) );
  DFFRHQXL quant_conv1_reg_0_ ( .D(n1000), .CK(clk), .RN(rst_n), .Q(
        quant_conv1[0]) );
  DFFX1 imgshreg_reg_11__7_ ( .D(n1153), .CK(clk), .QN(n2758) );
  DFFX1 imgshreg_reg_10__7_ ( .D(n1152), .CK(clk), .QN(n2757) );
  DFFX1 imgshreg_reg_9__7_ ( .D(n1151), .CK(clk), .QN(n2756) );
  DFFX1 imgshreg_reg_5__7_ ( .D(n1147), .CK(clk), .QN(n2752) );
  DFFX1 imgshreg_reg_4__7_ ( .D(n1146), .CK(clk), .QN(n2751) );
  DFFX1 imgshreg_reg_3__7_ ( .D(n1145), .CK(clk), .QN(n2750) );
  DFFX1 imgshreg_reg_11__6_ ( .D(n1139), .CK(clk), .QN(n2744) );
  DFFX1 imgshreg_reg_10__6_ ( .D(n1138), .CK(clk), .QN(n2743) );
  DFFX1 imgshreg_reg_9__6_ ( .D(n1137), .CK(clk), .QN(n2742) );
  DFFX1 imgshreg_reg_5__6_ ( .D(n1133), .CK(clk), .QN(n2738) );
  DFFX1 imgshreg_reg_4__6_ ( .D(n1132), .CK(clk), .QN(n2737) );
  DFFX1 imgshreg_reg_3__6_ ( .D(n1131), .CK(clk), .QN(n2736) );
  DFFX1 imgshreg_reg_11__5_ ( .D(n1125), .CK(clk), .QN(n2730) );
  DFFX1 imgshreg_reg_10__5_ ( .D(n1124), .CK(clk), .QN(n2729) );
  DFFX1 imgshreg_reg_9__5_ ( .D(n1123), .CK(clk), .QN(n2728) );
  DFFX1 imgshreg_reg_5__5_ ( .D(n1119), .CK(clk), .QN(n2724) );
  DFFX1 imgshreg_reg_4__5_ ( .D(n1118), .CK(clk), .QN(n2723) );
  DFFX1 imgshreg_reg_3__5_ ( .D(n1117), .CK(clk), .QN(n2722) );
  DFFX1 imgshreg_reg_11__4_ ( .D(n1111), .CK(clk), .QN(n2716) );
  DFFX1 imgshreg_reg_10__4_ ( .D(n1110), .CK(clk), .QN(n2715) );
  DFFX1 imgshreg_reg_9__4_ ( .D(n1109), .CK(clk), .QN(n2714) );
  DFFX1 imgshreg_reg_5__4_ ( .D(n1105), .CK(clk), .QN(n2710) );
  DFFX1 imgshreg_reg_4__4_ ( .D(n1104), .CK(clk), .QN(n2709) );
  DFFX1 imgshreg_reg_3__4_ ( .D(n1103), .CK(clk), .QN(n2708) );
  DFFX1 imgshreg_reg_11__3_ ( .D(n1097), .CK(clk), .QN(n2702) );
  DFFX1 imgshreg_reg_10__3_ ( .D(n1096), .CK(clk), .QN(n2701) );
  DFFX1 imgshreg_reg_9__3_ ( .D(n1095), .CK(clk), .QN(n2700) );
  DFFX1 imgshreg_reg_5__3_ ( .D(n1091), .CK(clk), .QN(n2696) );
  DFFX1 imgshreg_reg_4__3_ ( .D(n1090), .CK(clk), .QN(n2695) );
  DFFX1 imgshreg_reg_3__3_ ( .D(n1089), .CK(clk), .QN(n2694) );
  DFFX1 imgshreg_reg_11__2_ ( .D(n1083), .CK(clk), .QN(n2688) );
  DFFX1 imgshreg_reg_10__2_ ( .D(n1082), .CK(clk), .QN(n2687) );
  DFFX1 imgshreg_reg_9__2_ ( .D(n1081), .CK(clk), .QN(n2686) );
  DFFX1 imgshreg_reg_5__2_ ( .D(n1077), .CK(clk), .QN(n2682) );
  DFFX1 imgshreg_reg_4__2_ ( .D(n1076), .CK(clk), .QN(n2681) );
  DFFX1 imgshreg_reg_3__2_ ( .D(n1075), .CK(clk), .QN(n2680) );
  DFFX1 imgshreg_reg_11__1_ ( .D(n1069), .CK(clk), .QN(n2674) );
  DFFX1 imgshreg_reg_10__1_ ( .D(n1068), .CK(clk), .QN(n2673) );
  DFFX1 imgshreg_reg_9__1_ ( .D(n1067), .CK(clk), .QN(n2672) );
  DFFX1 imgshreg_reg_5__1_ ( .D(n1063), .CK(clk), .QN(n2668) );
  DFFX1 imgshreg_reg_4__1_ ( .D(n1062), .CK(clk), .QN(n2667) );
  DFFX1 imgshreg_reg_3__1_ ( .D(n1061), .CK(clk), .QN(n2666) );
  DFFX1 imgshreg_reg_11__0_ ( .D(n1055), .CK(clk), .QN(n2660) );
  DFFX1 imgshreg_reg_10__0_ ( .D(n1054), .CK(clk), .QN(n2659) );
  DFFX1 imgshreg_reg_9__0_ ( .D(n1053), .CK(clk), .QN(n2658) );
  DFFX1 imgshreg_reg_5__0_ ( .D(n1049), .CK(clk), .QN(n2654) );
  DFFX1 imgshreg_reg_4__0_ ( .D(n1048), .CK(clk), .QN(n2653) );
  DFFX1 imgshreg_reg_3__0_ ( .D(n1047), .CK(clk), .QN(n2652) );
  DFFRHQX1 L1_sum_reg_9_ ( .D(n907), .CK(clk), .RN(rst_n), .Q(L1_sum[9]) );
  DFFRHQX1 L1_sum_reg_8_ ( .D(n906), .CK(clk), .RN(rst_n), .Q(L1_sum[8]) );
  DFFRHQX1 L1_sum_reg_7_ ( .D(n905), .CK(clk), .RN(rst_n), .Q(L1_sum[7]) );
  DFFRX1 maxpool_r_reg_4_ ( .D(n983), .CK(clk), .RN(rst_n), .QN(n2641) );
  DFFRHQX1 L1_sum_reg_6_ ( .D(n904), .CK(clk), .RN(rst_n), .Q(L1_sum[6]) );
  DFFRX1 maxpool_r_reg_6_ ( .D(n981), .CK(clk), .RN(rst_n), .QN(n2643) );
  DFFRX1 quant_conv1_reg_6_ ( .D(n1006), .CK(clk), .RN(rst_n), .Q(
        quant_conv1[6]), .QN(n2195) );
  DFFRX1 maxpool_l_reg_4_ ( .D(n991), .CK(clk), .RN(rst_n), .QN(n2633) );
  DFFRX1 maxpool_l_reg_6_ ( .D(n989), .CK(clk), .RN(rst_n), .QN(n2635) );
  DFFRX1 quant_conv1_reg_7_ ( .D(n1007), .CK(clk), .RN(rst_n), .Q(
        quant_conv1[7]), .QN(n2193) );
  DFFRX1 maxpool_r_reg_1_ ( .D(n986), .CK(clk), .RN(rst_n), .QN(n2638) );
  DFFRX1 maxpool_l_reg_1_ ( .D(n994), .CK(clk), .RN(rst_n), .QN(n2630) );
  DFFRHQX1 L1_sum_reg_5_ ( .D(n903), .CK(clk), .RN(rst_n), .Q(L1_sum[5]) );
  DFFRX1 maxpool_l_reg_0_ ( .D(n995), .CK(clk), .RN(rst_n), .QN(n2645) );
  DFFRX1 maxpool_r_reg_0_ ( .D(n987), .CK(clk), .RN(rst_n), .QN(n2637) );
  DFFRX1 maxpool_r_reg_5_ ( .D(n982), .CK(clk), .RN(rst_n), .QN(n2642) );
  DFFRX1 maxpool_l_reg_5_ ( .D(n990), .CK(clk), .RN(rst_n), .QN(n2634) );
  DFFRX1 maxpool_r_reg_7_ ( .D(n980), .CK(clk), .RN(rst_n), .QN(n2644) );
  DFFRX1 maxpool_r_reg_2_ ( .D(n985), .CK(clk), .RN(rst_n), .QN(n2639) );
  DFFRX1 maxpool_l_reg_2_ ( .D(n993), .CK(clk), .RN(rst_n), .QN(n2631) );
  DFFRX1 maxpool_l_reg_7_ ( .D(n988), .CK(clk), .RN(rst_n), .QN(n2636) );
  DFFRHQX1 L1_sum_reg_4_ ( .D(n902), .CK(clk), .RN(rst_n), .Q(L1_sum[4]) );
  DFFRHQX1 L1_sum_reg_3_ ( .D(n901), .CK(clk), .RN(rst_n), .Q(L1_sum[3]) );
  DFFHQX1 conv1_result_reg_2_ ( .D(n1010), .CK(clk), .Q(conv1_result[2]) );
  DFFRX1 maxpool_r_reg_3_ ( .D(n984), .CK(clk), .RN(rst_n), .QN(n2640) );
  DFFRX1 maxpool_l_reg_3_ ( .D(n992), .CK(clk), .RN(rst_n), .QN(n2632) );
  DFFHQX1 conv1_result_reg_1_ ( .D(n1009), .CK(clk), .Q(conv1_result[1]) );
  DFFRHQX1 L1_sum_reg_2_ ( .D(n900), .CK(clk), .RN(rst_n), .Q(L1_sum[2]) );
  DFFHQX1 conv1_result_reg_0_ ( .D(n1008), .CK(clk), .Q(conv1_result[0]) );
  DFFRHQX1 L1_sum_reg_0_ ( .D(n898), .CK(clk), .RN(rst_n), .Q(L1_sum[0]) );
  DFFRHQX1 L1_sum_reg_1_ ( .D(n899), .CK(clk), .RN(rst_n), .Q(L1_sum[1]) );
  DFFRHQX1 pool_cnt_reg_3_ ( .D(n996), .CK(clk), .RN(rst_n), .Q(pool_cnt[3])
         );
  DFFRHQX1 pool_cnt_reg_0_ ( .D(n999), .CK(clk), .RN(rst_n), .Q(pool_cnt[0])
         );
  DFFRHQX1 pool_cnt_reg_2_ ( .D(n997), .CK(clk), .RN(rst_n), .Q(pool_cnt[2])
         );
  DFFRHQX1 pool_cnt_reg_1_ ( .D(n998), .CK(clk), .RN(rst_n), .Q(pool_cnt[1])
         );
  DFFHQX1 conv1_result_reg_5_ ( .D(n1013), .CK(clk), .Q(conv1_result[5]) );
  DFFHQX1 conv1_result_reg_4_ ( .D(n1012), .CK(clk), .Q(conv1_result[4]) );
  DFFRHQX1 flatten_arr1_reg_1__7_ ( .D(n945), .CK(clk), .RN(rst_n), .Q(
        flatten_arr1[23]) );
  DFFHQX1 conv1_result_reg_3_ ( .D(n1011), .CK(clk), .Q(conv1_result[3]) );
  DFFRHQX1 flatten_arr1_reg_2__7_ ( .D(n946), .CK(clk), .RN(rst_n), .Q(
        flatten_arr1[15]) );
  DFFRHQX1 flatten_arr1_reg_1__6_ ( .D(n941), .CK(clk), .RN(rst_n), .Q(
        flatten_arr1[22]) );
  DFFRHQX1 flatten_arr1_reg_2__6_ ( .D(n942), .CK(clk), .RN(rst_n), .Q(
        flatten_arr1[14]) );
  DFFRHQX1 flatten_arr1_reg_3__7_ ( .D(n947), .CK(clk), .RN(rst_n), .Q(
        flatten_arr1[7]) );
  DFFRHQX1 flatten_arr1_reg_3__6_ ( .D(n943), .CK(clk), .RN(rst_n), .Q(
        flatten_arr1[6]) );
  DFFRHQX1 flatten_arr1_reg_0__7_ ( .D(n944), .CK(clk), .RN(rst_n), .Q(
        flatten_arr1[31]) );
  DFFRHQX1 flatten_arr2_reg_3__7_ ( .D(n915), .CK(clk), .RN(rst_n), .Q(
        flatten_arr2_3__7_) );
  DFFRHQX1 flatten_arr2_reg_3__6_ ( .D(n914), .CK(clk), .RN(rst_n), .Q(
        flatten_arr2_3__6_) );
  DFFRHQX1 flatten_arr1_reg_0__6_ ( .D(n940), .CK(clk), .RN(rst_n), .Q(
        flatten_arr1[30]) );
  DFFRHQX1 flatten_arr1_reg_1__4_ ( .D(n933), .CK(clk), .RN(rst_n), .Q(
        flatten_arr1[20]) );
  DFFRHQX1 flatten_arr1_reg_2__4_ ( .D(n934), .CK(clk), .RN(rst_n), .Q(
        flatten_arr1[12]) );
  DFFRHQX1 flatten_arr1_reg_1__5_ ( .D(n937), .CK(clk), .RN(rst_n), .Q(
        flatten_arr1[21]) );
  DFFRHQX1 flatten_arr1_reg_2__5_ ( .D(n938), .CK(clk), .RN(rst_n), .Q(
        flatten_arr1[13]) );
  DFFRHQXL flatten_arr1_reg_3__4_ ( .D(n935), .CK(clk), .RN(rst_n), .Q(
        flatten_arr1[4]) );
  DFFRHQX1 flatten_arr1_reg_1__1_ ( .D(n921), .CK(clk), .RN(rst_n), .Q(
        flatten_arr1[17]) );
  DFFRHQX1 flatten_arr1_reg_1__0_ ( .D(n917), .CK(clk), .RN(rst_n), .Q(
        flatten_arr1[16]) );
  DFFRHQX1 flatten_arr1_reg_1__2_ ( .D(n925), .CK(clk), .RN(rst_n), .Q(
        flatten_arr1[18]) );
  DFFRHQX1 flatten_arr1_reg_2__1_ ( .D(n922), .CK(clk), .RN(rst_n), .Q(
        flatten_arr1[9]) );
  DFFRHQX1 flatten_arr1_reg_2__0_ ( .D(n918), .CK(clk), .RN(rst_n), .Q(
        flatten_arr1[8]) );
  DFFRHQXL flatten_arr1_reg_3__1_ ( .D(n923), .CK(clk), .RN(rst_n), .Q(
        flatten_arr1[1]) );
  DFFRHQX1 flatten_arr1_reg_2__2_ ( .D(n926), .CK(clk), .RN(rst_n), .Q(
        flatten_arr1[10]) );
  DFFRHQXL flatten_arr1_reg_3__2_ ( .D(n927), .CK(clk), .RN(rst_n), .Q(
        flatten_arr1[2]) );
  DFFRHQXL flatten_arr2_reg_3__4_ ( .D(n912), .CK(clk), .RN(rst_n), .Q(
        flatten_arr2_3__4_) );
  DFFRHQX1 flatten_arr1_reg_1__3_ ( .D(n929), .CK(clk), .RN(rst_n), .Q(
        flatten_arr1[19]) );
  DFFX1 imgshreg_reg_2__7_ ( .D(n1144), .CK(clk), .QN(n2749) );
  DFFRHQX1 flatten_arr1_reg_2__3_ ( .D(n930), .CK(clk), .RN(rst_n), .Q(
        flatten_arr1[11]) );
  DFFX1 imgshreg_reg_7__7_ ( .D(n1149), .CK(clk), .QN(n2754) );
  DFFRHQX1 flatten_arr1_reg_0__4_ ( .D(n932), .CK(clk), .RN(rst_n), .Q(
        flatten_arr1[28]) );
  DFFRHQXL flatten_arr2_reg_3__1_ ( .D(n909), .CK(clk), .RN(rst_n), .Q(
        flatten_arr2_3__1_) );
  DFFRHQX1 flatten_arr1_reg_0__5_ ( .D(n936), .CK(clk), .RN(rst_n), .Q(
        flatten_arr1[29]) );
  DFFRHQXL flatten_arr1_reg_3__3_ ( .D(n931), .CK(clk), .RN(rst_n), .Q(
        flatten_arr1[3]) );
  DFFX1 imgshreg_reg_2__6_ ( .D(n1130), .CK(clk), .QN(n2735) );
  DFFX1 imgshreg_reg_7__6_ ( .D(n1135), .CK(clk), .QN(n2740) );
  DFFRHQX1 flatten_arr1_reg_0__2_ ( .D(n924), .CK(clk), .RN(rst_n), .Q(
        flatten_arr1[26]) );
  DFFRHQX1 flatten_arr1_reg_0__1_ ( .D(n920), .CK(clk), .RN(rst_n), .Q(
        flatten_arr1[25]) );
  DFFRHQX1 flatten_arr1_reg_0__0_ ( .D(n916), .CK(clk), .RN(rst_n), .Q(
        flatten_arr1[24]) );
  DFFRHQX1 out_data_buffer_reg_8_ ( .D(N1037), .CK(clk), .RN(rst_n), .Q(
        out_data_buffer[8]) );
  DFFRHQX1 out_data_buffer_reg_7_ ( .D(N1036), .CK(clk), .RN(rst_n), .Q(
        out_data_buffer[7]) );
  DFFRHQX1 out_data_buffer_reg_6_ ( .D(N1035), .CK(clk), .RN(rst_n), .Q(
        out_data_buffer[6]) );
  DFFRHQX1 out_data_buffer_reg_5_ ( .D(N1034), .CK(clk), .RN(rst_n), .Q(
        out_data_buffer[5]) );
  DFFRHQX1 out_data_buffer_reg_4_ ( .D(N1033), .CK(clk), .RN(rst_n), .Q(
        out_data_buffer[4]) );
  DFFRHQX1 out_data_buffer_reg_3_ ( .D(N1032), .CK(clk), .RN(rst_n), .Q(
        out_data_buffer[3]) );
  DFFRHQX1 out_data_buffer_reg_2_ ( .D(N1031), .CK(clk), .RN(rst_n), .Q(
        out_data_buffer[2]) );
  DFFRHQX1 out_data_buffer_reg_1_ ( .D(N1030), .CK(clk), .RN(rst_n), .Q(
        out_data_buffer[1]) );
  DFFRHQX1 out_data_buffer_reg_0_ ( .D(N1029), .CK(clk), .RN(rst_n), .Q(
        out_data_buffer[0]) );
  DFFRHQX1 out_data_buffer_reg_9_ ( .D(N1038), .CK(clk), .RN(rst_n), .Q(
        out_data_buffer[9]) );
  DFFX1 imgshreg_reg_2__5_ ( .D(n1116), .CK(clk), .QN(n2721) );
  DFFX1 imgshreg_reg_12__7_ ( .D(n1154), .CK(clk), .QN(n2759) );
  DFFRHQXL flatten_arr2_reg_3__3_ ( .D(n911), .CK(clk), .RN(rst_n), .Q(
        flatten_arr2_3__3_) );
  DFFRHQX1 flatten_arr1_reg_0__3_ ( .D(n928), .CK(clk), .RN(rst_n), .Q(
        flatten_arr1[27]) );
  DFFX1 imgshreg_reg_7__5_ ( .D(n1121), .CK(clk), .QN(n2726) );
  DFFRHQXL flatten_arr2_reg_3__2_ ( .D(n910), .CK(clk), .RN(rst_n), .Q(
        flatten_arr2_3__2_) );
  DFFX1 imgshreg_reg_2__4_ ( .D(n1102), .CK(clk), .QN(n2707) );
  DFFX1 imgshreg_reg_7__4_ ( .D(n1107), .CK(clk), .QN(n2712) );
  DFFHQX1 pooled_arr_reg_3__7_ ( .D(n979), .CK(clk), .Q(pooled_arr[7]) );
  DFFRHQX1 out_valid_reg ( .D(n1466), .CK(clk), .RN(rst_n), .Q(out_valid) );
  DFFX1 imgshreg_reg_12__6_ ( .D(n1140), .CK(clk), .QN(n2745) );
  DFFX1 imgshreg_reg_2__1_ ( .D(n1060), .CK(clk), .QN(n2665) );
  DFFX1 imgshreg_reg_2__3_ ( .D(n1088), .CK(clk), .QN(n2693) );
  DFFX1 imgshreg_reg_2__2_ ( .D(n1074), .CK(clk), .QN(n2679) );
  DFFX1 imgshreg_reg_7__1_ ( .D(n1065), .CK(clk), .QN(n2670) );
  DFFX1 imgshreg_reg_1__7_ ( .D(n1143), .CK(clk), .Q(n2236), .QN(n2748) );
  DFFX1 imgshreg_reg_8__7_ ( .D(n1150), .CK(clk), .QN(n2755) );
  DFFX1 imgshreg_reg_7__3_ ( .D(n1093), .CK(clk), .QN(n2698) );
  DFFX1 imgshreg_reg_0__7_ ( .D(n1142), .CK(clk), .Q(n2269), .QN(n2747) );
  DFFX1 imgshreg_reg_7__2_ ( .D(n1079), .CK(clk), .QN(n2684) );
  DFFX1 imgshreg_reg_6__7_ ( .D(n1148), .CK(clk), .QN(n2753) );
  DFFX1 imgshreg_reg_13__7_ ( .D(n1155), .CK(clk), .QN(n2760) );
  DFFX1 imgshreg_reg_2__0_ ( .D(n1046), .CK(clk), .QN(n2651) );
  DFFHQX1 pooled_arr_reg_3__6_ ( .D(n975), .CK(clk), .Q(pooled_arr[6]) );
  DFFX1 imgshreg_reg_12__5_ ( .D(n1126), .CK(clk), .QN(n2731) );
  DFFX1 imgshreg_reg_7__0_ ( .D(n1051), .CK(clk), .QN(n2656) );
  DFFHQX1 conv1_result_reg_8_ ( .D(n1016), .CK(clk), .Q(conv1_result[8]) );
  DFFX1 imgshreg_reg_1__6_ ( .D(n1129), .CK(clk), .Q(n2239), .QN(n2734) );
  DFFX1 imgshreg_reg_12__4_ ( .D(n1112), .CK(clk), .QN(n2717) );
  DFFX1 imgshreg_reg_8__6_ ( .D(n1136), .CK(clk), .QN(n2741) );
  DFFHQX1 conv1_result_reg_7_ ( .D(n1015), .CK(clk), .Q(conv1_result[7]) );
  DFFX1 imgshreg_reg_0__6_ ( .D(n1128), .CK(clk), .Q(n2274), .QN(n2733) );
  DFFX1 imgshreg_reg_6__6_ ( .D(n1134), .CK(clk), .QN(n2739) );
  DFFX1 imgshreg_reg_13__6_ ( .D(n1141), .CK(clk), .QN(n2746) );
  DFFHQX1 pooled_arr_reg_3__5_ ( .D(n971), .CK(clk), .Q(pooled_arr[5]) );
  DFFHQX1 conv1_result_reg_6_ ( .D(n1014), .CK(clk), .Q(conv1_result[6]) );
  DFFX1 imgshreg_reg_12__1_ ( .D(n1070), .CK(clk), .QN(n2675) );
  DFFHQX1 pooled_arr_reg_3__4_ ( .D(n967), .CK(clk), .Q(pooled_arr[4]) );
  DFFX1 imgshreg_reg_12__3_ ( .D(n1098), .CK(clk), .QN(n2703) );
  DFFX1 imgshreg_reg_1__5_ ( .D(n1115), .CK(clk), .Q(n2242), .QN(n2720) );
  DFFX1 imgshreg_reg_12__2_ ( .D(n1084), .CK(clk), .QN(n2689) );
  DFFX1 imgshreg_reg_8__5_ ( .D(n1122), .CK(clk), .QN(n2727) );
  DFFX1 imgshreg_reg_0__5_ ( .D(n1114), .CK(clk), .Q(n2279), .QN(n2719) );
  DFFX1 imgshreg_reg_6__5_ ( .D(n1120), .CK(clk), .QN(n2725) );
  DFFX1 imgshreg_reg_13__5_ ( .D(n1127), .CK(clk), .QN(n2732) );
  DFFX1 imgshreg_reg_1__4_ ( .D(n1101), .CK(clk), .Q(n2245), .QN(n2706) );
  DFFX1 imgshreg_reg_12__0_ ( .D(n1056), .CK(clk), .QN(n2661) );
  DFFX1 imgshreg_reg_8__4_ ( .D(n1108), .CK(clk), .QN(n2713) );
  DFFHQX1 pooled_arr_reg_3__1_ ( .D(n955), .CK(clk), .Q(pooled_arr[1]) );
  DFFX1 imgshreg_reg_0__4_ ( .D(n1100), .CK(clk), .Q(n2284), .QN(n2705) );
  DFFHQX1 pooled_arr_reg_3__3_ ( .D(n963), .CK(clk), .Q(pooled_arr[3]) );
  DFFX1 imgshreg_reg_6__4_ ( .D(n1106), .CK(clk), .QN(n2711) );
  DFFX1 imgshreg_reg_13__4_ ( .D(n1113), .CK(clk), .QN(n2718) );
  DFFHQX1 pooled_arr_reg_3__2_ ( .D(n959), .CK(clk), .Q(pooled_arr[2]) );
  DFFX1 imgshreg_reg_1__1_ ( .D(n1059), .CK(clk), .Q(n2254), .QN(n2664) );
  DFFHQX1 pooled_arr_reg_3__0_ ( .D(n951), .CK(clk), .Q(pooled_arr[0]) );
  DFFX1 imgshreg_reg_8__1_ ( .D(n1066), .CK(clk), .QN(n2671) );
  DFFX1 imgshreg_reg_1__3_ ( .D(n1087), .CK(clk), .Q(n2248), .QN(n2692) );
  DFFX1 imgshreg_reg_0__1_ ( .D(n1058), .CK(clk), .Q(n2299), .QN(n2663) );
  DFFX1 imgshreg_reg_8__3_ ( .D(n1094), .CK(clk), .QN(n2699) );
  DFFX1 imgshreg_reg_6__1_ ( .D(n1064), .CK(clk), .QN(n2669) );
  DFFX1 imgshreg_reg_13__1_ ( .D(n1071), .CK(clk), .QN(n2676) );
  DFFX1 imgshreg_reg_1__2_ ( .D(n1073), .CK(clk), .Q(n2251), .QN(n2678) );
  DFFX1 imgshreg_reg_8__2_ ( .D(n1080), .CK(clk), .QN(n2685) );
  DFFX1 imgshreg_reg_0__3_ ( .D(n1086), .CK(clk), .Q(n2289), .QN(n2691) );
  DFFX1 imgshreg_reg_6__3_ ( .D(n1092), .CK(clk), .QN(n2697) );
  DFFX1 imgshreg_reg_13__3_ ( .D(n1099), .CK(clk), .QN(n2704) );
  DFFX1 imgshreg_reg_0__2_ ( .D(n1072), .CK(clk), .Q(n2294), .QN(n2677) );
  DFFX1 imgshreg_reg_6__2_ ( .D(n1078), .CK(clk), .QN(n2683) );
  DFFX1 imgshreg_reg_13__2_ ( .D(n1085), .CK(clk), .QN(n2690) );
  DFFX1 imgshreg_reg_1__0_ ( .D(n1045), .CK(clk), .Q(n2259), .QN(n2650) );
  DFFX1 imgshreg_reg_8__0_ ( .D(n1052), .CK(clk), .QN(n2657) );
  DFFX1 imgshreg_reg_0__0_ ( .D(n1044), .CK(clk), .Q(n2305), .QN(n2649) );
  DFFX1 imgshreg_reg_6__0_ ( .D(n1050), .CK(clk), .QN(n2655) );
  DFFX1 imgshreg_reg_13__0_ ( .D(n1057), .CK(clk), .QN(n2662) );
  DFFHQX1 conv1_result_reg_11_ ( .D(n1019), .CK(clk), .Q(conv1_result[11]) );
  DFFHQX1 conv1_result_reg_10_ ( .D(n1018), .CK(clk), .Q(conv1_result[10]) );
  DFFHQX1 conv1_result_reg_9_ ( .D(n1017), .CK(clk), .Q(conv1_result[9]) );
  DFFHQX1 conv1_result_reg_14_ ( .D(n1022), .CK(clk), .Q(conv1_result[14]) );
  DFFHQX1 conv1_result_reg_13_ ( .D(n1021), .CK(clk), .Q(conv1_result[13]) );
  DFFHQX1 conv1_result_reg_12_ ( .D(n1020), .CK(clk), .Q(conv1_result[12]) );
  DFFHQX1 conv1_result_reg_15_ ( .D(n1023), .CK(clk), .Q(conv1_result[15]) );
  DFFHQX1 conv1_result_reg_16_ ( .D(n1024), .CK(clk), .Q(conv1_result[16]) );
  DFFRHQXL flatten_arr1_reg_3__5_ ( .D(n939), .CK(clk), .RN(rst_n), .Q(
        flatten_arr1[5]) );
  DFFRHQXL flatten_arr2_reg_3__5_ ( .D(n913), .CK(clk), .RN(rst_n), .Q(
        flatten_arr2_3__5_) );
  DFFRHQX4 cnt_reg_2_ ( .D(n1168), .CK(clk), .RN(rst_n), .Q(n1415) );
  DFFRHQX4 cnt_reg_6_ ( .D(n1164), .CK(clk), .RN(rst_n), .Q(n1404) );
  DFFRHQX4 cnt_reg_1_ ( .D(n1169), .CK(clk), .RN(rst_n), .Q(n1390) );
  DFFRHQX4 cs_reg_0_ ( .D(ns[0]), .CK(clk), .RN(rst_n), .Q(n1380) );
  EDFFXL imgshreg_reg_14__7_ ( .D(img[7]), .E(n1467), .CK(clk), .QN(n2768) );
  EDFFXL imgshreg_reg_14__6_ ( .D(img[6]), .E(n1467), .CK(clk), .QN(n2767) );
  EDFFXL imgshreg_reg_14__5_ ( .D(img[5]), .E(n1467), .CK(clk), .QN(n2766) );
  EDFFXL imgshreg_reg_14__4_ ( .D(img[4]), .E(n1467), .CK(clk), .QN(n2765) );
  EDFFXL imgshreg_reg_14__3_ ( .D(img[3]), .E(n1467), .CK(clk), .QN(n2764) );
  EDFFXL imgshreg_reg_14__2_ ( .D(img[2]), .E(n1467), .CK(clk), .QN(n2763) );
  EDFFXL imgshreg_reg_14__1_ ( .D(img[1]), .E(n1467), .CK(clk), .QN(n2762) );
  EDFFXL imgshreg_reg_14__0_ ( .D(img[0]), .E(n1467), .CK(clk), .QN(n2761) );
  EDFFXL kernelreg_reg_3__0_ ( .D(kernelreg[8]), .E(n1465), .CK(clk), .Q(n1313), .QN(n2583) );
  EDFFXL kernelreg_reg_2__0_ ( .D(n1313), .E(n1465), .CK(clk), .Q(n1269), .QN(
        n2591) );
  EDFFXL kernelreg_reg_1__0_ ( .D(n1269), .E(n1465), .CK(clk), .Q(n1281), .QN(
        n2513) );
  EDFFXL kernelreg_reg_0__0_ ( .D(n1281), .E(n1465), .CK(clk), .QN(n2615) );
  EDFFXL kernelreg_reg_7__7_ ( .D(kernelreg[7]), .E(n1465), .CK(clk), .Q(n1312), .QN(n2544) );
  EDFFXL kernelreg_reg_7__6_ ( .D(kernelreg[6]), .E(n1465), .CK(clk), .Q(n1311), .QN(n2545) );
  EDFFXL kernelreg_reg_7__5_ ( .D(kernelreg[5]), .E(n1465), .CK(clk), .Q(n1310), .QN(n2546) );
  EDFFXL kernelreg_reg_7__4_ ( .D(kernelreg[4]), .E(n1465), .CK(clk), .Q(n1309), .QN(n2547) );
  EDFFXL kernelreg_reg_7__3_ ( .D(kernelreg[3]), .E(n1465), .CK(clk), .Q(n1308), .QN(n2548) );
  EDFFXL kernelreg_reg_7__2_ ( .D(kernelreg[2]), .E(n1465), .CK(clk), .Q(n1307), .QN(n2549) );
  EDFFXL kernelreg_reg_7__1_ ( .D(kernelreg[1]), .E(n1465), .CK(clk), .Q(n1306), .QN(n2550) );
  EDFFXL kernelreg_reg_7__0_ ( .D(kernelreg[0]), .E(n1465), .CK(clk), .Q(n1305), .QN(n2551) );
  EDFFXL kernelreg_reg_6__7_ ( .D(n1312), .E(n1465), .CK(clk), .Q(n1268), .QN(
        n2552) );
  EDFFXL kernelreg_reg_6__6_ ( .D(n1311), .E(n1465), .CK(clk), .Q(n1267), .QN(
        n2553) );
  EDFFXL kernelreg_reg_6__5_ ( .D(n1310), .E(n1465), .CK(clk), .Q(n1266), .QN(
        n2554) );
  EDFFXL kernelreg_reg_6__4_ ( .D(n1309), .E(n1465), .CK(clk), .Q(n1265), .QN(
        n2555) );
  EDFFXL kernelreg_reg_6__3_ ( .D(n1308), .E(n1465), .CK(clk), .Q(n1264), .QN(
        n2556) );
  EDFFXL kernelreg_reg_6__2_ ( .D(n1307), .E(n1465), .CK(clk), .Q(n1263), .QN(
        n2557) );
  EDFFXL kernelreg_reg_6__1_ ( .D(n1306), .E(n1465), .CK(clk), .Q(n1262), .QN(
        n2558) );
  EDFFXL kernelreg_reg_6__0_ ( .D(n1305), .E(n1465), .CK(clk), .Q(n1261), .QN(
        n2559) );
  EDFFXL kernelreg_reg_5__7_ ( .D(n1268), .E(n1465), .CK(clk), .Q(n1304), .QN(
        n2560) );
  EDFFXL kernelreg_reg_5__6_ ( .D(n1267), .E(n1465), .CK(clk), .Q(n1303), .QN(
        n2561) );
  EDFFXL kernelreg_reg_5__5_ ( .D(n1266), .E(n1465), .CK(clk), .Q(n1302), .QN(
        n2562) );
  EDFFXL kernelreg_reg_5__4_ ( .D(n1265), .E(n1465), .CK(clk), .Q(n1301), .QN(
        n2563) );
  EDFFXL kernelreg_reg_5__3_ ( .D(n1264), .E(n1465), .CK(clk), .Q(n1300), .QN(
        n2564) );
  EDFFXL kernelreg_reg_5__2_ ( .D(n1263), .E(n1465), .CK(clk), .Q(n1299), .QN(
        n2565) );
  EDFFXL kernelreg_reg_5__1_ ( .D(n1262), .E(n1465), .CK(clk), .Q(n1298), .QN(
        n2566) );
  EDFFXL kernelreg_reg_5__0_ ( .D(n1261), .E(n1465), .CK(clk), .Q(n1297), .QN(
        n2567) );
  EDFFXL kernelreg_reg_4__7_ ( .D(n1304), .E(n1465), .CK(clk), .Q(n1260), .QN(
        n2568) );
  EDFFXL kernelreg_reg_4__6_ ( .D(n1303), .E(n1465), .CK(clk), .Q(n1259), .QN(
        n2569) );
  EDFFXL kernelreg_reg_4__5_ ( .D(n1302), .E(n1465), .CK(clk), .Q(n1258), .QN(
        n2570) );
  EDFFXL kernelreg_reg_4__4_ ( .D(n1301), .E(n1465), .CK(clk), .Q(n1257), .QN(
        n2571) );
  EDFFXL kernelreg_reg_4__3_ ( .D(n1300), .E(n1465), .CK(clk), .Q(n1256), .QN(
        n2572) );
  EDFFXL kernelreg_reg_4__2_ ( .D(n1299), .E(n1465), .CK(clk), .Q(n1255), .QN(
        n2573) );
  EDFFXL kernelreg_reg_4__1_ ( .D(n1298), .E(n1465), .CK(clk), .Q(n1254), .QN(
        n2574) );
  EDFFXL kernelreg_reg_4__0_ ( .D(n1297), .E(n1465), .CK(clk), .Q(kernelreg[8]), .QN(n2575) );
  EDFFXL kernelreg_reg_3__7_ ( .D(n1260), .E(n1465), .CK(clk), .Q(n1296), .QN(
        n2576) );
  EDFFXL kernelreg_reg_3__6_ ( .D(n1259), .E(n1465), .CK(clk), .Q(n1295), .QN(
        n2577) );
  EDFFXL kernelreg_reg_3__5_ ( .D(n1258), .E(n1465), .CK(clk), .Q(n1294), .QN(
        n2578) );
  EDFFXL kernelreg_reg_3__4_ ( .D(n1257), .E(n1465), .CK(clk), .Q(n1293), .QN(
        n2579) );
  EDFFXL kernelreg_reg_3__3_ ( .D(n1256), .E(n1465), .CK(clk), .Q(n1292), .QN(
        n2580) );
  EDFFXL kernelreg_reg_3__2_ ( .D(n1255), .E(n1465), .CK(clk), .Q(n1291), .QN(
        n2581) );
  EDFFXL kernelreg_reg_3__1_ ( .D(n1254), .E(n1465), .CK(clk), .Q(n1290), .QN(
        n2582) );
  EDFFXL kernelreg_reg_2__7_ ( .D(n1296), .E(n1465), .CK(clk), .Q(n1253), .QN(
        n2584) );
  EDFFXL kernelreg_reg_2__6_ ( .D(n1295), .E(n1465), .CK(clk), .Q(n1252), .QN(
        n2585) );
  EDFFXL kernelreg_reg_2__5_ ( .D(n1294), .E(n1465), .CK(clk), .Q(n1251), .QN(
        n2586) );
  EDFFXL kernelreg_reg_2__4_ ( .D(n1293), .E(n1465), .CK(clk), .Q(n1250), .QN(
        n2587) );
  EDFFXL kernelreg_reg_2__3_ ( .D(n1292), .E(n1465), .CK(clk), .Q(n1249), .QN(
        n2588) );
  EDFFXL kernelreg_reg_2__2_ ( .D(n1291), .E(n1465), .CK(clk), .Q(n1248), .QN(
        n2589) );
  EDFFXL kernelreg_reg_2__1_ ( .D(n1290), .E(n1465), .CK(clk), .Q(n1247), .QN(
        n2590) );
  EDFFXL kernelreg_reg_1__7_ ( .D(n1253), .E(n1465), .CK(clk), .Q(n1280), .QN(
        n2506) );
  EDFFXL kernelreg_reg_1__6_ ( .D(n1252), .E(n1465), .CK(clk), .Q(n1279), .QN(
        n2507) );
  EDFFXL kernelreg_reg_1__5_ ( .D(n1251), .E(n1465), .CK(clk), .Q(n1278), .QN(
        n2508) );
  EDFFXL kernelreg_reg_1__4_ ( .D(n1250), .E(n1465), .CK(clk), .Q(n1277), .QN(
        n2509) );
  EDFFXL kernelreg_reg_1__3_ ( .D(n1249), .E(n1465), .CK(clk), .Q(n1276), .QN(
        n2510) );
  EDFFXL kernelreg_reg_1__2_ ( .D(n1248), .E(n1465), .CK(clk), .Q(n1275), .QN(
        n2511) );
  EDFFXL kernelreg_reg_1__1_ ( .D(n1247), .E(n1465), .CK(clk), .Q(n1274), .QN(
        n2512) );
  EDFFXL kernelreg_reg_0__7_ ( .D(n1280), .E(n1465), .CK(clk), .QN(n2601) );
  EDFFXL kernelreg_reg_0__6_ ( .D(n1279), .E(n1465), .CK(clk), .QN(n2603) );
  EDFFXL kernelreg_reg_0__5_ ( .D(n1278), .E(n1465), .CK(clk), .QN(n2605) );
  EDFFXL kernelreg_reg_0__4_ ( .D(n1277), .E(n1465), .CK(clk), .QN(n2607) );
  EDFFXL kernelreg_reg_0__3_ ( .D(n1276), .E(n1465), .CK(clk), .QN(n2609) );
  EDFFXL kernelreg_reg_0__2_ ( .D(n1275), .E(n1465), .CK(clk), .QN(n2611) );
  EDFFXL kernelreg_reg_0__1_ ( .D(n1274), .E(n1465), .CK(clk), .QN(n2613) );
  EDFFXL weightreg_reg_2__7_ ( .D(weightreg[7]), .E(n1238), .CK(clk), .Q(n1289), .QN(n2514) );
  EDFFXL weightreg_reg_2__6_ ( .D(weightreg[6]), .E(n1238), .CK(clk), .Q(n1288), .QN(n2516) );
  EDFFXL weightreg_reg_2__5_ ( .D(weightreg[5]), .E(n1238), .CK(clk), .Q(n1287), .QN(n2518) );
  EDFFXL weightreg_reg_2__4_ ( .D(weightreg[4]), .E(n1238), .CK(clk), .Q(n1286), .QN(n2520) );
  EDFFXL weightreg_reg_2__3_ ( .D(weightreg[3]), .E(n1238), .CK(clk), .Q(n1285), .QN(n2522) );
  EDFFXL weightreg_reg_2__2_ ( .D(weightreg[2]), .E(n1238), .CK(clk), .Q(n1284), .QN(n2524) );
  EDFFXL weightreg_reg_2__1_ ( .D(weightreg[1]), .E(n1238), .CK(clk), .Q(n1283), .QN(n2526) );
  EDFFXL weightreg_reg_2__0_ ( .D(weightreg[0]), .E(n1238), .CK(clk), .Q(n1282), .QN(n2528) );
  EDFFXL weightreg_reg_1__7_ ( .D(n1289), .E(n1238), .CK(clk), .Q(n1246), .QN(
        n2515) );
  EDFFXL weightreg_reg_1__6_ ( .D(n1288), .E(n1238), .CK(clk), .Q(n1245), .QN(
        n2517) );
  EDFFXL weightreg_reg_1__5_ ( .D(n1287), .E(n1238), .CK(clk), .Q(n1244), .QN(
        n2519) );
  EDFFXL weightreg_reg_1__4_ ( .D(n1286), .E(n1238), .CK(clk), .Q(n1243), .QN(
        n2521) );
  EDFFXL weightreg_reg_1__3_ ( .D(n1285), .E(n1238), .CK(clk), .Q(n1242), .QN(
        n2523) );
  EDFFXL weightreg_reg_1__2_ ( .D(n1284), .E(n1238), .CK(clk), .Q(n1241), .QN(
        n2525) );
  EDFFXL weightreg_reg_1__1_ ( .D(n1283), .E(n1238), .CK(clk), .Q(n1240), .QN(
        n2527) );
  EDFFXL weightreg_reg_1__0_ ( .D(n1282), .E(n1238), .CK(clk), .Q(n1239), .QN(
        n2529) );
  EDFFXL weightreg_reg_0__7_ ( .D(n1246), .E(n1238), .CK(clk), .QN(n2600) );
  EDFFXL weightreg_reg_0__6_ ( .D(n1245), .E(n1238), .CK(clk), .QN(n2602) );
  EDFFXL weightreg_reg_0__5_ ( .D(n1244), .E(n1238), .CK(clk), .QN(n2604) );
  EDFFXL weightreg_reg_0__4_ ( .D(n1243), .E(n1238), .CK(clk), .QN(n2606) );
  EDFFXL weightreg_reg_0__3_ ( .D(n1242), .E(n1238), .CK(clk), .QN(n2608) );
  EDFFXL weightreg_reg_0__2_ ( .D(n1241), .E(n1238), .CK(clk), .QN(n2610) );
  EDFFXL weightreg_reg_0__1_ ( .D(n1240), .E(n1238), .CK(clk), .QN(n2612) );
  EDFFXL weightreg_reg_0__0_ ( .D(n1239), .E(n1238), .CK(clk), .QN(n2614) );
  EDFFXL pooled_arr_reg_2__7_ ( .D(pooled_arr[7]), .E(n2303), .CK(clk), .Q(
        pooled_arr[15]), .QN(n2272) );
  EDFFXL pooled_arr_reg_2__6_ ( .D(pooled_arr[6]), .E(n2303), .CK(clk), .Q(
        pooled_arr[14]), .QN(n2277) );
  EDFFXL pooled_arr_reg_2__5_ ( .D(pooled_arr[5]), .E(n2303), .CK(clk), .Q(
        pooled_arr[13]), .QN(n2282) );
  EDFFXL pooled_arr_reg_2__4_ ( .D(pooled_arr[4]), .E(n2303), .CK(clk), .Q(
        pooled_arr[12]), .QN(n2287) );
  EDFFXL pooled_arr_reg_2__3_ ( .D(pooled_arr[3]), .E(n2303), .CK(clk), .Q(
        pooled_arr[11]), .QN(n2292) );
  EDFFXL pooled_arr_reg_2__2_ ( .D(pooled_arr[2]), .E(n2303), .CK(clk), .Q(
        pooled_arr[10]), .QN(n2297) );
  EDFFXL pooled_arr_reg_2__1_ ( .D(pooled_arr[1]), .E(n2303), .CK(clk), .Q(
        pooled_arr[9]), .QN(n2302) );
  EDFFXL pooled_arr_reg_2__0_ ( .D(pooled_arr[0]), .E(n2303), .CK(clk), .Q(
        pooled_arr[8]), .QN(n2309) );
  EDFFXL pooled_arr_reg_1__7_ ( .D(pooled_arr[15]), .E(n2303), .CK(clk), .Q(
        pooled_arr[23]), .QN(n2268) );
  EDFFXL pooled_arr_reg_1__6_ ( .D(pooled_arr[14]), .E(n2303), .CK(clk), .Q(
        pooled_arr[22]), .QN(n2273) );
  EDFFXL pooled_arr_reg_1__5_ ( .D(pooled_arr[13]), .E(n2303), .CK(clk), .Q(
        pooled_arr[21]), .QN(n2278) );
  EDFFXL pooled_arr_reg_1__4_ ( .D(pooled_arr[12]), .E(n2303), .CK(clk), .Q(
        pooled_arr[20]), .QN(n2283) );
  EDFFXL pooled_arr_reg_1__3_ ( .D(pooled_arr[11]), .E(n2303), .CK(clk), .Q(
        pooled_arr[19]), .QN(n2288) );
  EDFFXL pooled_arr_reg_1__2_ ( .D(pooled_arr[10]), .E(n2303), .CK(clk), .Q(
        pooled_arr[18]), .QN(n2293) );
  EDFFXL pooled_arr_reg_1__1_ ( .D(pooled_arr[9]), .E(n2303), .CK(clk), .Q(
        pooled_arr[17]), .QN(n2298) );
  EDFFXL pooled_arr_reg_1__0_ ( .D(pooled_arr[8]), .E(n2303), .CK(clk), .Q(
        pooled_arr[16]), .QN(n2304) );
  EDFFXL pooled_arr_reg_0__7_ ( .D(pooled_arr[23]), .E(n2303), .CK(clk), .QN(
        n2271) );
  EDFFXL pooled_arr_reg_0__6_ ( .D(pooled_arr[22]), .E(n2303), .CK(clk), .QN(
        n2276) );
  EDFFXL pooled_arr_reg_0__5_ ( .D(pooled_arr[21]), .E(n2303), .CK(clk), .QN(
        n2281) );
  EDFFXL pooled_arr_reg_0__4_ ( .D(pooled_arr[20]), .E(n2303), .CK(clk), .QN(
        n2286) );
  EDFFXL pooled_arr_reg_0__3_ ( .D(pooled_arr[19]), .E(n2303), .CK(clk), .QN(
        n2291) );
  EDFFXL pooled_arr_reg_0__2_ ( .D(pooled_arr[18]), .E(n2303), .CK(clk), .QN(
        n2296) );
  EDFFXL pooled_arr_reg_0__1_ ( .D(pooled_arr[17]), .E(n2303), .CK(clk), .QN(
        n2301) );
  EDFFXL pooled_arr_reg_0__0_ ( .D(pooled_arr[16]), .E(n2303), .CK(clk), .QN(
        n2308) );
  EDFFXL kernelreg_reg_8__7_ ( .D(ker[7]), .E(n2217), .CK(clk), .Q(
        kernelreg[7]), .QN(n2536) );
  EDFFXL kernelreg_reg_8__6_ ( .D(ker[6]), .E(n2217), .CK(clk), .Q(
        kernelreg[6]), .QN(n2537) );
  EDFFXL kernelreg_reg_8__5_ ( .D(ker[5]), .E(n2217), .CK(clk), .Q(
        kernelreg[5]), .QN(n2538) );
  EDFFXL kernelreg_reg_8__4_ ( .D(ker[4]), .E(n2217), .CK(clk), .Q(
        kernelreg[4]), .QN(n2539) );
  EDFFXL kernelreg_reg_8__3_ ( .D(ker[3]), .E(n2217), .CK(clk), .Q(
        kernelreg[3]), .QN(n2540) );
  EDFFXL kernelreg_reg_8__2_ ( .D(ker[2]), .E(n2217), .CK(clk), .Q(
        kernelreg[2]), .QN(n2541) );
  EDFFXL kernelreg_reg_8__1_ ( .D(ker[1]), .E(n2217), .CK(clk), .Q(
        kernelreg[1]), .QN(n2542) );
  EDFFXL kernelreg_reg_8__0_ ( .D(ker[0]), .E(n2217), .CK(clk), .Q(
        kernelreg[0]), .QN(n2543) );
  EDFFXL weightreg_reg_3__7_ ( .D(weight[7]), .E(n1273), .CK(clk), .Q(
        weightreg[7]), .QN(n2592) );
  EDFFXL weightreg_reg_3__6_ ( .D(weight[6]), .E(n1273), .CK(clk), .Q(
        weightreg[6]), .QN(n2593) );
  EDFFXL weightreg_reg_3__5_ ( .D(weight[5]), .E(n1273), .CK(clk), .Q(
        weightreg[5]), .QN(n2594) );
  EDFFXL weightreg_reg_3__4_ ( .D(weight[4]), .E(n1273), .CK(clk), .Q(
        weightreg[4]), .QN(n2595) );
  EDFFXL weightreg_reg_3__3_ ( .D(weight[3]), .E(n1273), .CK(clk), .Q(
        weightreg[3]), .QN(n2596) );
  EDFFXL weightreg_reg_3__2_ ( .D(weight[2]), .E(n1273), .CK(clk), .Q(
        weightreg[2]), .QN(n2597) );
  EDFFXL weightreg_reg_3__1_ ( .D(weight[1]), .E(n1273), .CK(clk), .Q(
        weightreg[1]), .QN(n2598) );
  EDFFXL weightreg_reg_3__0_ ( .D(weight[0]), .E(n1273), .CK(clk), .Q(
        weightreg[0]), .QN(n2599) );
  DFFXL conv1_result_reg_17_ ( .D(n1025), .CK(clk), .QN(n2646) );
  DFFXL conv1_result_reg_19_ ( .D(n1027), .CK(clk), .QN(n2648) );
  DFFXL conv1_result_reg_18_ ( .D(n1026), .CK(clk), .QN(n2647) );
  DFFRXL quant_conv1_reg_4_ ( .D(n1004), .CK(clk), .RN(rst_n), .Q(
        quant_conv1[4]), .QN(n2200) );
  DFFRXL quant_conv1_reg_1_ ( .D(n1001), .CK(clk), .RN(rst_n), .Q(
        quant_conv1[1]), .QN(n2187) );
  DFFRXL quant_conv1_reg_5_ ( .D(n1005), .CK(clk), .RN(rst_n), .Q(
        quant_conv1[5]), .QN(n2198) );
  DFFRXL quant_conv1_reg_3_ ( .D(n1003), .CK(clk), .RN(rst_n), .Q(
        quant_conv1[3]), .QN(n2186) );
  DFFRXL quant_conv1_reg_2_ ( .D(n1002), .CK(clk), .RN(rst_n), .Q(
        quant_conv1[2]), .QN(n2185) );
  DFFRXL flatten_arr1_reg_3__0_ ( .D(n919), .CK(clk), .RN(rst_n), .Q(
        flatten_arr1[0]), .QN(n2425) );
  DFFRXL flatten_arr2_reg_3__0_ ( .D(n908), .CK(clk), .RN(rst_n), .Q(
        flatten_arr2_3__0_), .QN(n2426) );
  MX4X2 U1158 ( .A(div_82_u_div_CryOut_1__0_), .B(div_82_u_div_CryOut_5__0_), 
        .C(div_82_u_div_CryOut_3__0_), .D(div_82_u_div_CryOut_7__0_), .S0(
        sdiv_result[2]), .S1(n2325), .Y(n1449) );
  MX2X2 U1159 ( .A(div_82_u_div_CryOut_2__0_), .B(div_82_u_div_CryOut_6__0_), 
        .S0(sdiv_result[2]), .Y(n2325) );
  NAND2X4 U1160 ( .A(n1172), .B(n1173), .Y(n1174) );
  NAND2X4 U1161 ( .A(n1174), .B(n2034), .Y(div_82_u_div_PartRem_2__6_) );
  CLKINVX4 U1162 ( .A(n2326), .Y(n1172) );
  INVX2 U1163 ( .A(n2035), .Y(n1173) );
  INVX3 U1164 ( .A(n1229), .Y(n2326) );
  AND2X1 U1165 ( .A(div_82_u_div_SumTmp_6__3__1_), .B(n1432), .Y(n1175) );
  AND2X1 U1166 ( .A(div_82_u_div_SumTmp_4__3__1_), .B(n1917), .Y(n1176) );
  NOR3X1 U1167 ( .A(n1175), .B(n1176), .C(n1904), .Y(n1906) );
  NAND2XL U1168 ( .A(div_82_u_div_SumTmp_5__3__8_), .B(n1881), .Y(n1177) );
  NAND2XL U1169 ( .A(n1880), .B(n1842), .Y(n1178) );
  NAND2XL U1170 ( .A(div_82_u_div_SumTmp_7__3__8_), .B(n1924), .Y(n1179) );
  AND3X2 U1171 ( .A(n1177), .B(n1178), .C(n1179), .Y(n1843) );
  INVXL U1172 ( .A(n1841), .Y(n1842) );
  OAI221XL U1173 ( .A0(n1886), .A1(n1845), .B0(n1884), .B1(n1844), .C0(n1843), 
        .Y(div_82_u_div_PartRem_3__11_) );
  AND2X1 U1174 ( .A(div_82_u_div_SumTmp_6__3__9_), .B(n1432), .Y(n1180) );
  AND2XL U1175 ( .A(div_82_u_div_SumTmp_4__3__9_), .B(n1917), .Y(n1181) );
  NOR3X1 U1176 ( .A(n1180), .B(n1181), .C(n1832), .Y(n1833) );
  BUFX4 U1177 ( .A(n1443), .Y(n1432) );
  INVX4 U1178 ( .A(n1919), .Y(n1917) );
  AND2X2 U1179 ( .A(div_82_u_div_SumTmp_5__3__7_), .B(n1881), .Y(n1182) );
  AND2X2 U1180 ( .A(n1880), .B(n1850), .Y(n1183) );
  AND2X1 U1181 ( .A(div_82_u_div_SumTmp_7__3__7_), .B(n1924), .Y(n1184) );
  NOR3X2 U1182 ( .A(n1182), .B(n1183), .C(n1184), .Y(n1851) );
  CLKINVX8 U1183 ( .A(n1874), .Y(n1881) );
  CLKINVX8 U1184 ( .A(n1927), .Y(n1880) );
  OAI221X1 U1185 ( .A0(n1886), .A1(n1853), .B0(n1884), .B1(n1852), .C0(n1851), 
        .Y(div_82_u_div_PartRem_3__10_) );
  OR2X1 U1186 ( .A(n1886), .B(n1885), .Y(n1185) );
  OR2X1 U1187 ( .A(n1884), .B(n1883), .Y(n1186) );
  NAND3X2 U1188 ( .A(n1185), .B(n1186), .C(n1882), .Y(
        div_82_u_div_PartRem_3__6_) );
  BUFX3 U1189 ( .A(div_82_u_div_PartRem_3__6_), .Y(n1503) );
  AND2X1 U1190 ( .A(div_82_u_div_SumTmp_6__3__11_), .B(n1432), .Y(n1187) );
  AND2X1 U1191 ( .A(div_82_u_div_SumTmp_4__3__11_), .B(n1917), .Y(n1188) );
  NOR3X1 U1192 ( .A(n1187), .B(n1188), .C(n1814), .Y(n1815) );
  OAI2BB1X1 U1193 ( .A0N(div_82_u_div_SumTmp_2__3__11_), .A1N(n1915), .B0(
        n1813), .Y(n1814) );
  AND2X1 U1194 ( .A(div_82_u_div_SumTmp_3__3__2_), .B(n1925), .Y(n1189) );
  AND2X1 U1195 ( .A(n1896), .B(n1908), .Y(n1190) );
  NOR3X2 U1196 ( .A(n1189), .B(n1190), .C(n1895), .Y(n2015) );
  OAI2BB1X2 U1197 ( .A0N(div_82_u_div_CryOut_1__3_), .A1N(n1816), .B0(n1809), 
        .Y(n1908) );
  OR2X1 U1198 ( .A(n1886), .B(n1867), .Y(n1191) );
  OR2X1 U1199 ( .A(n1884), .B(n1866), .Y(n1192) );
  NAND3X2 U1200 ( .A(n1191), .B(n1192), .C(n1865), .Y(
        div_82_u_div_PartRem_3__8_) );
  BUFX3 U1201 ( .A(div_82_u_div_PartRem_3__8_), .Y(n1235) );
  CLKBUFX2 U1202 ( .A(div_82_u_div_PartRem_3__8_), .Y(n1237) );
  AND2X1 U1203 ( .A(div_82_u_div_SumTmp_7__2__3_), .B(n1447), .Y(n1193) );
  AND2X2 U1204 ( .A(n1324), .B(div_82_u_div_SumTmp_5__2__3_), .Y(n1194) );
  NOR3X2 U1205 ( .A(n1193), .B(n1194), .C(n2033), .Y(n2034) );
  NAND2X2 U1206 ( .A(n1195), .B(n1196), .Y(n1197) );
  NAND2X2 U1207 ( .A(n1197), .B(n2020), .Y(div_82_u_div_PartRem_2__8_) );
  INVX1 U1208 ( .A(n2326), .Y(n1195) );
  INVX2 U1209 ( .A(n2021), .Y(n1196) );
  AND2X1 U1210 ( .A(div_82_u_div_SumTmp_7__2__0_), .B(n1447), .Y(n1198) );
  AND2XL U1211 ( .A(div_82_u_div_SumTmp_3__2__0_), .B(n2062), .Y(n1199) );
  NOR3X2 U1212 ( .A(n1198), .B(n1199), .C(n2061), .Y(n2063) );
  OAI2BB1X2 U1213 ( .A0N(div_82_u_div_SumTmp_1__2__0_), .A1N(n1406), .B0(n2060), .Y(n2061) );
  AND2X1 U1214 ( .A(div_82_u_div_SumTmp_7__2__10_), .B(n1447), .Y(n1200) );
  AND2X1 U1215 ( .A(div_82_u_div_SumTmp_3__2__10_), .B(n2062), .Y(n1201) );
  NOR3X1 U1216 ( .A(n1200), .B(n1201), .C(n1980), .Y(n1981) );
  AND2X1 U1217 ( .A(div_82_u_div_SumTmp_7__2__2_), .B(n1447), .Y(n1202) );
  AND2X1 U1218 ( .A(div_82_u_div_SumTmp_3__2__2_), .B(n2062), .Y(n1203) );
  NOR3X1 U1219 ( .A(n1202), .B(n1203), .C(n2038), .Y(n2039) );
  OR2X4 U1220 ( .A(n2163), .B(n2162), .Y(n1204) );
  OR2X1 U1221 ( .A(n2161), .B(n2324), .Y(n1205) );
  NAND3X2 U1222 ( .A(n1204), .B(n1205), .C(n2160), .Y(n2165) );
  NAND2X2 U1223 ( .A(n2159), .B(n1410), .Y(n2162) );
  NAND2BX4 U1224 ( .AN(n2165), .B(n2164), .Y(div_82_u_div_PartRem_1__4_) );
  NAND2X1 U1225 ( .A(div_82_u_div_SumTmp_5__1__3_), .B(n1319), .Y(n1206) );
  NAND2XL U1226 ( .A(n2147), .B(n2159), .Y(n1207) );
  NAND2XL U1227 ( .A(div_82_u_div_SumTmp_7__1__3_), .B(n1440), .Y(n1208) );
  AND3X4 U1228 ( .A(n1206), .B(n1207), .C(n1208), .Y(n2148) );
  CLKINVX1 U1229 ( .A(n1318), .Y(n1319) );
  INVX3 U1230 ( .A(n2324), .Y(n2159) );
  BUFX8 U1231 ( .A(n1384), .Y(n1362) );
  XNOR2X2 U1232 ( .A(n2321), .B(n1425), .Y(n2318) );
  NAND2BX2 U1233 ( .AN(cnt[0]), .B(n1391), .Y(n2321) );
  AOI221XL U1234 ( .A0(div_82_u_div_SumTmp_4__5__0_), .A1(n1716), .B0(
        div_82_u_div_SumTmp_2__5__0_), .B1(n1448), .C0(n1715), .Y(n1717) );
  OAI2BB1X2 U1235 ( .A0N(div_82_u_div_SumTmp_2__3__8_), .A1N(n1915), .B0(n1839), .Y(n1840) );
  INVX4 U1236 ( .A(div_82_u_div_CryOut_3__6_), .Y(n1655) );
  AOI32XL U1237 ( .A0(div_82_u_div_SumTmp_1__5__0_), .A1(n1401), .A2(n1710), 
        .B0(div_82_u_div_SumTmp_7__5__0_), .B1(n1709), .Y(n1720) );
  INVX3 U1238 ( .A(n1652), .Y(n1654) );
  NAND2X1 U1239 ( .A(n1639), .B(n1362), .Y(n1646) );
  INVX8 U1240 ( .A(n1345), .Y(n1346) );
  OAI2BB1X1 U1241 ( .A0N(div_82_u_div_SumTmp_1__2__2_), .A1N(n1406), .B0(n2037), .Y(n2038) );
  NAND2X1 U1242 ( .A(div_82_u_div_SumTmp_1__2__3_), .B(n1406), .Y(n2032) );
  CLKINVX4 U1243 ( .A(sdiv_result[5]), .Y(n1408) );
  INVX3 U1244 ( .A(n2015), .Y(div_82_u_div_PartRem_3__5_) );
  OR2X1 U1245 ( .A(sdiv_result[5]), .B(n2071), .Y(n2095) );
  OR2XL U1246 ( .A(n1830), .B(n1921), .Y(n1831) );
  AOI222X2 U1247 ( .A0(div_82_u_div_SumTmp_5__3__9_), .A1(n1881), .B0(n1880), 
        .B1(n1834), .C0(div_82_u_div_SumTmp_7__3__9_), .C1(n1924), .Y(n1835)
         );
  INVX1 U1248 ( .A(n1880), .Y(n1416) );
  CLKBUFX2 U1249 ( .A(div_82_u_div_PartRem_3__12_), .Y(n1226) );
  AOI21X1 U1250 ( .A0(div_82_u_div_CryOut_3__3_), .A1(
        div_82_u_div_CryOut_2__3_), .B0(n1333), .Y(n1807) );
  INVX2 U1251 ( .A(n1878), .Y(n1879) );
  NOR3X2 U1252 ( .A(n1426), .B(n1427), .C(n1877), .Y(n1878) );
  OAI221X2 U1253 ( .A0(n1874), .A1(n1873), .B0(n1872), .B1(n1927), .C0(n1871), 
        .Y(div_82_u_div_PartRem_3__7_) );
  CLKINVX3 U1254 ( .A(div_82_quotient_11_), .Y(n1332) );
  OR2XL U1255 ( .A(n1868), .B(n1921), .Y(n1869) );
  OR2X1 U1256 ( .A(n1921), .B(n1913), .Y(n1914) );
  OR2X1 U1257 ( .A(n1921), .B(n1889), .Y(n1890) );
  OR2X4 U1258 ( .A(n1860), .B(n1921), .Y(n1861) );
  AND2X2 U1259 ( .A(div_82_u_div_SumTmp_4__3__3_), .B(n1917), .Y(n1427) );
  BUFX1 U1260 ( .A(div_82_u_div_PartRem_3__4_), .Y(n1521) );
  INVXL U1261 ( .A(n1921), .Y(n1887) );
  OR2X1 U1262 ( .A(n1846), .B(n1921), .Y(n1847) );
  INVX4 U1263 ( .A(div_82_u_div_CryOut_6__1_), .Y(n2130) );
  AOI32X1 U1264 ( .A0(n2159), .A1(div_82_u_div_SumTmp_2__1__1_), .A2(n1341), 
        .B0(div_82_u_div_SumTmp_7__1__1_), .B1(n1440), .Y(n2160) );
  INVX4 U1265 ( .A(div_82_quotient_17_), .Y(n1711) );
  CLKINVX2 U1266 ( .A(sdiv_result[5]), .Y(n1407) );
  AOI21X1 U1267 ( .A0(n1333), .A1(n1808), .B0(n1807), .Y(n1905) );
  BUFX2 U1268 ( .A(div_82_u_div_PartRem_3__4_), .Y(n1522) );
  OAI2BB1X4 U1269 ( .A0N(div_82_u_div_SumTmp_2__3__5_), .A1N(n1915), .B0(n1861), .Y(n1862) );
  OAI2BB1X1 U1270 ( .A0N(div_82_u_div_SumTmp_2__3__7_), .A1N(n1915), .B0(n1847), .Y(n1848) );
  INVX3 U1271 ( .A(n1902), .Y(n1915) );
  NAND2BX1 U1272 ( .AN(n1425), .B(n1390), .Y(n1424) );
  BUFX12 U1273 ( .A(n2495), .Y(n1209) );
  BUFX20 U1274 ( .A(n2495), .Y(n1210) );
  INVX8 U1275 ( .A(n1633), .Y(n2495) );
  INVX3 U1276 ( .A(n1390), .Y(n1391) );
  NOR2X4 U1277 ( .A(n2647), .B(n1210), .Y(n1469) );
  INVX1 U1278 ( .A(n1650), .Y(n1223) );
  OAI2BB1XL U1279 ( .A0N(div_82_u_div_CryOut_7__5_), .A1N(div_82_quotient_17_), 
        .B0(n1671), .Y(n1673) );
  CLKINVX2 U1280 ( .A(div_82_quotient_17_), .Y(n1401) );
  INVX8 U1281 ( .A(div_82_u_div_CryOut_2__6_), .Y(n1656) );
  AOI221X1 U1282 ( .A0(div_82_u_div_SumTmp_7__4__2_), .A1(n1441), .B0(
        div_82_u_div_SumTmp_5__4__2_), .B1(n1799), .C0(n1776), .Y(n1783) );
  OR2X2 U1283 ( .A(n1922), .B(n1919), .Y(n1874) );
  NOR2X2 U1284 ( .A(n1639), .B(n1643), .Y(n1454) );
  NAND2X2 U1285 ( .A(n1639), .B(n1362), .Y(n1387) );
  NOR2X2 U1286 ( .A(n1350), .B(n1442), .Y(n1358) );
  NOR2X2 U1287 ( .A(n1377), .B(div_82_u_div_CryOut_6__1_), .Y(n1442) );
  OAI2BB1X1 U1288 ( .A0N(div_82_u_div_SumTmp_2__1__11_), .A1N(n1341), .B0(
        n2078), .Y(n2079) );
  BUFX3 U1289 ( .A(div_82_u_div_PartRem_3__7_), .Y(n1515) );
  AOI221X4 U1290 ( .A0(div_82_u_div_SumTmp_4__2__11_), .A1(n1446), .B0(
        div_82_u_div_SumTmp_6__2__11_), .B1(n1445), .C0(n1970), .Y(n1971) );
  CLKINVX3 U1291 ( .A(div_82_u_div_CryOut_7__1_), .Y(n1322) );
  CLKINVXL U1292 ( .A(n1406), .Y(n1992) );
  OAI2BB1X2 U1293 ( .A0N(div_82_u_div_SumTmp_2__3__3_), .A1N(n1915), .B0(n1876), .Y(n1877) );
  AND2X1 U1294 ( .A(div_82_u_div_SumTmp_6__3__3_), .B(n1432), .Y(n1426) );
  BUFX2 U1295 ( .A(div_82_u_div_PartRem_1__7_), .Y(n1477) );
  BUFX2 U1296 ( .A(div_82_u_div_PartRem_1__7_), .Y(n1476) );
  BUFX2 U1297 ( .A(div_82_u_div_PartRem_1__7_), .Y(n1478) );
  INVX2 U1298 ( .A(n2044), .Y(n1935) );
  CLKINVX3 U1299 ( .A(n1504), .Y(n1507) );
  BUFX3 U1300 ( .A(div_82_u_div_PartRem_1__8_), .Y(n1479) );
  INVX4 U1301 ( .A(n1558), .Y(n1560) );
  CLKINVX3 U1302 ( .A(n1558), .Y(n1559) );
  INVX3 U1303 ( .A(div_82_u_div_PartRem_2__8_), .Y(n1558) );
  INVX4 U1304 ( .A(n1990), .Y(n2062) );
  OAI2BB1X4 U1305 ( .A0N(n2002), .A1N(n1230), .B0(n2001), .Y(
        div_82_u_div_PartRem_2__10_) );
  AOI222X2 U1306 ( .A0(div_82_u_div_SumTmp_5__1__10_), .A1(n1375), .B0(
        div_82_u_div_SumTmp_1__1__10_), .B1(n2173), .C0(n1392), .C1(n2086), 
        .Y(n2087) );
  OAI2BB1X2 U1307 ( .A0N(div_82_u_div_SumTmp_2__1__3_), .A1N(n1341), .B0(n2144), .Y(n2145) );
  OAI221X1 U1308 ( .A0(n2136), .A1(n2324), .B0(n2135), .B1(n2134), .C0(n2133), 
        .Y(div_82_u_div_PartRem_1__8_) );
  AOI32XL U1309 ( .A0(n2046), .A1(n2045), .A2(n2044), .B0(
        div_82_u_div_SumTmp_1__2__1_), .B1(n1406), .Y(n2052) );
  OAI2BB1X1 U1310 ( .A0N(div_82_u_div_SumTmp_1__2__5_), .A1N(n1406), .B0(n2018), .Y(n2019) );
  CLKINVX3 U1311 ( .A(n1580), .Y(n1211) );
  CLKINVX4 U1312 ( .A(n1580), .Y(n1212) );
  NOR2BX4 U1313 ( .AN(n1646), .B(n1645), .Y(n1452) );
  CLKINVX2 U1314 ( .A(n1580), .Y(n1578) );
  BUFX8 U1315 ( .A(n1452), .Y(n1431) );
  INVX8 U1316 ( .A(n1580), .Y(n1579) );
  INVX2 U1317 ( .A(n1452), .Y(n1580) );
  INVX3 U1318 ( .A(n1585), .Y(n1213) );
  CLKINVX4 U1319 ( .A(n1213), .Y(n1214) );
  CLKINVXL U1320 ( .A(n1213), .Y(n1215) );
  CLKINVXL U1321 ( .A(n1213), .Y(n1216) );
  OR4X2 U1322 ( .A(n1906), .B(n1561), .C(n1905), .D(n1564), .Y(n1910) );
  AOI222X1 U1323 ( .A0(div_82_u_div_SumTmp_5__1__11_), .A1(n1375), .B0(n1392), 
        .B1(n2081), .C0(div_82_u_div_SumTmp_7__1__11_), .C1(n1440), .Y(n2082)
         );
  BUFX3 U1324 ( .A(div_82_u_div_PartRem_1__9_), .Y(n1494) );
  BUFX3 U1325 ( .A(div_82_u_div_PartRem_1__5_), .Y(n1519) );
  BUFX3 U1326 ( .A(div_82_u_div_PartRem_3__3_), .Y(n1217) );
  CLKBUFX2 U1327 ( .A(div_82_u_div_PartRem_3__3_), .Y(n1218) );
  CLKBUFX2 U1328 ( .A(div_82_u_div_PartRem_3__3_), .Y(n1219) );
  OAI21X2 U1329 ( .A0(n1928), .A1(n1416), .B0(n1926), .Y(
        div_82_u_div_PartRem_3__3_) );
  AOI221X1 U1330 ( .A0(div_82_u_div_SumTmp_7__4__4_), .A1(n1441), .B0(
        div_82_u_div_SumTmp_5__4__4_), .B1(n1799), .C0(n1761), .Y(n1766) );
  BUFX4 U1331 ( .A(div_82_u_div_PartRem_3__4_), .Y(n1523) );
  OAI221X2 U1332 ( .A0(div_82_u_div_CryOut_1__6_), .A1(n1470), .B0(
        div_82_u_div_SumTmp_1__6__1_), .B1(n1653), .C0(n1656), .Y(n1651) );
  AOI222X1 U1333 ( .A0(div_82_u_div_SumTmp_5__2__1_), .A1(n1324), .B0(
        div_82_u_div_SumTmp_7__2__1_), .B1(n1447), .C0(n1411), .C1(
        div_82_u_div_SumTmp_3__2__1_), .Y(n2050) );
  CLKINVX4 U1334 ( .A(n1967), .Y(n1324) );
  INVX2 U1335 ( .A(n1693), .Y(sdiv_dend[17]) );
  INVX4 U1336 ( .A(n1729), .Y(n2492) );
  INVX2 U1337 ( .A(n1637), .Y(n1364) );
  AOI221XL U1338 ( .A0(div_82_u_div_SumTmp_6__5__2_), .A1(n1709), .B0(
        div_82_u_div_SumTmp_2__5__2_), .B1(n1448), .C0(n1695), .Y(n1696) );
  INVX4 U1339 ( .A(n1755), .Y(n2467) );
  OAI2BB1X1 U1340 ( .A0N(div_82_u_div_SumTmp_3__4__4_), .A1N(n1780), .B0(n1760), .Y(n1761) );
  OAI2BB1X1 U1341 ( .A0N(div_82_u_div_SumTmp_3__4__3_), .A1N(n1780), .B0(n1767), .Y(n1768) );
  MX2X2 U1342 ( .A(n1752), .B(n1751), .S0(n1800), .Y(n1830) );
  AOI221XL U1343 ( .A0(div_82_u_div_SumTmp_6__4__5_), .A1(n1441), .B0(
        div_82_u_div_SumTmp_4__4__5_), .B1(n1799), .C0(n1757), .Y(n1758) );
  CLKINVX2 U1344 ( .A(div_82_u_div_CryOut_6__3_), .Y(n1810) );
  BUFX2 U1345 ( .A(div_82_u_div_PartRem_3__10_), .Y(n1481) );
  NOR3X1 U1346 ( .A(n1314), .B(n1315), .C(n2019), .Y(n2020) );
  NAND3X2 U1347 ( .A(n1435), .B(n1436), .C(n1827), .Y(
        div_82_u_div_PartRem_3__13_) );
  NOR2BX1 U1348 ( .AN(n2008), .B(n2012), .Y(n2013) );
  OR2X2 U1349 ( .A(n1425), .B(n2266), .Y(n1423) );
  INVX2 U1350 ( .A(div_82_u_div_SumTmp_5__1__0_), .Y(n1399) );
  INVX2 U1351 ( .A(n1533), .Y(n1532) );
  AOI222X1 U1352 ( .A0(n2172), .A1(div_82_u_div_SumTmp_3__1__5_), .B0(
        div_82_u_div_SumTmp_7__1__5_), .B1(n1440), .C0(
        div_82_u_div_SumTmp_1__1__5_), .C1(n2173), .Y(n2133) );
  OAI221XL U1353 ( .A0(n1992), .A1(n1991), .B0(n1566), .B1(n1989), .C0(n1988), 
        .Y(div_82_u_div_PartRem_2__12_) );
  INVX2 U1354 ( .A(n1545), .Y(n1544) );
  INVX2 U1355 ( .A(n1531), .Y(n1530) );
  INVX2 U1356 ( .A(div_82_u_div_BInv_6__6_), .Y(n1531) );
  INVX2 U1357 ( .A(n1714), .Y(sdiv_dend[15]) );
  INVX2 U1358 ( .A(n1223), .Y(n1224) );
  OAI21X1 U1359 ( .A0(n1568), .A1(n1665), .B0(n1704), .Y(n1705) );
  INVX2 U1360 ( .A(n1401), .Y(n1334) );
  INVX2 U1361 ( .A(n1656), .Y(n1395) );
  AOI221XL U1362 ( .A0(div_82_u_div_SumTmp_1__5__2_), .A1(n1701), .B0(
        div_82_u_div_SumTmp_5__5__2_), .B1(n1716), .C0(n1692), .Y(n1698) );
  INVX2 U1363 ( .A(n1778), .Y(n1775) );
  INVX2 U1364 ( .A(n1726), .Y(n1780) );
  MX2X2 U1365 ( .A(n1676), .B(n1675), .S0(n1718), .Y(n1729) );
  INVX2 U1366 ( .A(div_82_u_div_CryOut_1__3_), .Y(n1806) );
  INVX4 U1367 ( .A(n1884), .Y(n1925) );
  AND2X1 U1368 ( .A(n1412), .B(div_82_u_div_SumTmp_5__2__5_), .Y(n1315) );
  NAND2X1 U1369 ( .A(div_82_u_div_SumTmp_3__2__5_), .B(n1411), .Y(n2018) );
  AND2X1 U1370 ( .A(div_82_u_div_SumTmp_7__2__5_), .B(n1447), .Y(n1314) );
  NOR2X1 U1371 ( .A(n1816), .B(n1810), .Y(n1443) );
  NAND2BX1 U1372 ( .AN(n1816), .B(div_82_u_div_CryOut_7__3_), .Y(n1897) );
  INVX2 U1373 ( .A(n1565), .Y(n1911) );
  AND2X2 U1374 ( .A(div_82_u_div_SumTmp_5__2__4_), .B(n1324), .Y(n1343) );
  INVX4 U1375 ( .A(n1817), .Y(n1924) );
  OR2X2 U1376 ( .A(n1911), .B(n1897), .Y(n1817) );
  INVX2 U1377 ( .A(n1967), .Y(n1412) );
  INVX2 U1378 ( .A(div_82_u_div_SumTmp_3__1__4_), .Y(n1420) );
  NAND2X1 U1379 ( .A(div_82_u_div_SumTmp_1__1__4_), .B(n2173), .Y(n2139) );
  OR2X1 U1380 ( .A(n2143), .B(n2153), .Y(n2144) );
  INVX2 U1381 ( .A(n1547), .Y(n1546) );
  NOR2BX2 U1382 ( .AN(n1377), .B(n1340), .Y(n1341) );
  BUFX2 U1383 ( .A(n2130), .Y(n1344) );
  INVX2 U1384 ( .A(n1553), .Y(n1552) );
  INVX2 U1385 ( .A(div_82_u_div_BInv_5__5_), .Y(n1553) );
  INVX2 U1386 ( .A(n1549), .Y(n1548) );
  INVX2 U1387 ( .A(n1584), .Y(n1583) );
  INVX2 U1388 ( .A(n1535), .Y(n1534) );
  INVX2 U1389 ( .A(n1555), .Y(n1554) );
  INVX2 U1390 ( .A(div_82_u_div_BInv_3__3_), .Y(n1555) );
  INVX2 U1391 ( .A(n1551), .Y(n1550) );
  BUFX2 U1392 ( .A(div_82_u_div_PartRem_2__13_), .Y(n1497) );
  INVX2 U1393 ( .A(n1529), .Y(n1528) );
  OAI211X1 U1394 ( .A0(n1360), .A1(n2265), .B0(n2262), .C0(n2317), .Y(n2235)
         );
  INVX2 U1395 ( .A(n1527), .Y(n1526) );
  INVX2 U1396 ( .A(n1586), .Y(n1585) );
  BUFX4 U1397 ( .A(n1581), .Y(n1570) );
  INVX2 U1398 ( .A(n2384), .Y(n2427) );
  INVX2 U1399 ( .A(n1354), .Y(n1323) );
  OAI221X1 U1400 ( .A0(n1956), .A1(n1365), .B0(n1361), .B1(n1394), .C0(n1405), 
        .Y(n2207) );
  INVX2 U1401 ( .A(n1380), .Y(n1381) );
  NOR2X1 U1402 ( .A(n1349), .B(n1396), .Y(n2215) );
  INVX2 U1403 ( .A(n1407), .Y(n1354) );
  OAI31X1 U1404 ( .A0(n2322), .A1(n1389), .A2(n2320), .B0(n1474), .Y(n2323) );
  OAI31X1 U1405 ( .A0(n2207), .A1(n2206), .A2(n2322), .B0(n2225), .Y(n2208) );
  INVX2 U1406 ( .A(n2617), .Y(n1953) );
  INVX2 U1407 ( .A(n1384), .Y(n1643) );
  INVX2 U1408 ( .A(cnt[5]), .Y(n2206) );
  INVX2 U1409 ( .A(cnt[3]), .Y(n1955) );
  OAI31X1 U1410 ( .A0(n1378), .A1(n1604), .A2(n2216), .B0(n2225), .Y(n2217) );
  NOR2X1 U1411 ( .A(n1604), .B(n1475), .Y(n1467) );
  AOI221XL U1412 ( .A0(n2339), .A1(n1632), .B0(in_valid), .B1(n1960), .C0(
        n1466), .Y(n1621) );
  NOR2X1 U1413 ( .A(n1605), .B(n2386), .Y(n1466) );
  MX2X2 U1414 ( .A(N997), .B(L1_sum[9]), .S0(n1474), .Y(n907) );
  INVX1 U1415 ( .A(n1710), .Y(n1397) );
  BUFX4 U1416 ( .A(n2499), .Y(n1220) );
  BUFX4 U1417 ( .A(n2499), .Y(n1221) );
  BUFX8 U1418 ( .A(n2499), .Y(n1222) );
  BUFX2 U1419 ( .A(div_82_u_div_PartRem_3__12_), .Y(n1225) );
  CLKBUFX2 U1420 ( .A(div_82_u_div_PartRem_3__12_), .Y(n1227) );
  OAI221X1 U1421 ( .A0(n1886), .A1(n1837), .B0(n1884), .B1(n1836), .C0(n1835), 
        .Y(div_82_u_div_PartRem_3__12_) );
  CLKBUFX2 U1422 ( .A(div_82_u_div_PartRem_3__10_), .Y(n1483) );
  INVX2 U1423 ( .A(n1886), .Y(n1907) );
  OR2X4 U1424 ( .A(n1922), .B(n1921), .Y(n1886) );
  NAND2BX4 U1425 ( .AN(n1381), .B(n1366), .Y(n2234) );
  NOR2X2 U1426 ( .A(n1606), .B(cs[1]), .Y(n1366) );
  AOI221X2 U1427 ( .A0(div_82_u_div_SumTmp_3__3__0_), .A1(n1925), .B0(
        div_82_u_div_SumTmp_7__3__0_), .B1(n1924), .C0(n1923), .Y(n1926) );
  CLKBUFX2 U1428 ( .A(div_82_u_div_PartRem_3__11_), .Y(n1486) );
  OR4X2 U1429 ( .A(n1893), .B(n1892), .C(n1561), .D(n1564), .Y(n1894) );
  AOI221X1 U1430 ( .A0(div_82_u_div_SumTmp_6__3__2_), .A1(n1432), .B0(
        div_82_u_div_SumTmp_4__3__2_), .B1(n1917), .C0(n1891), .Y(n1893) );
  CLKINVXL U1431 ( .A(n1668), .Y(n1331) );
  INVX3 U1432 ( .A(n2064), .Y(n1228) );
  CLKINVX2 U1433 ( .A(n1228), .Y(n1229) );
  CLKINVX3 U1434 ( .A(n1228), .Y(n1230) );
  NOR2X4 U1435 ( .A(div_82_u_div_CryOut_6__1_), .B(n1408), .Y(n1409) );
  INVX8 U1436 ( .A(n1838), .Y(n2486) );
  OAI2BB1X1 U1437 ( .A0N(div_82_u_div_SumTmp_3__4__5_), .A1N(n1780), .B0(n1753), .Y(n1754) );
  BUFX3 U1438 ( .A(div_82_u_div_PartRem_3__11_), .Y(n1484) );
  INVX3 U1439 ( .A(div_82_u_div_PartRem_2__9_), .Y(n1231) );
  INVX2 U1440 ( .A(n1231), .Y(n1232) );
  INVX3 U1441 ( .A(n1231), .Y(n1233) );
  CLKINVX2 U1442 ( .A(n1231), .Y(n1234) );
  OAI2BB1X2 U1443 ( .A0N(div_82_u_div_SumTmp_7__3__2_), .A1N(n1924), .B0(n1894), .Y(n1895) );
  BUFX3 U1444 ( .A(div_82_u_div_PartRem_3__8_), .Y(n1236) );
  CLKINVX4 U1445 ( .A(n2150), .Y(n2172) );
  NOR3X2 U1446 ( .A(n1359), .B(n2220), .C(n2224), .Y(n1238) );
  INVX2 U1447 ( .A(div_82_u_div_PartRem_1__13_), .Y(n1516) );
  INVX2 U1448 ( .A(n1516), .Y(n1517) );
  AND2X1 U1449 ( .A(div_82_u_div_SumTmp_2__1__0_), .B(n1341), .Y(n1270) );
  INVX2 U1450 ( .A(n2234), .Y(n1632) );
  INVX2 U1451 ( .A(n1347), .Y(n1348) );
  INVX4 U1452 ( .A(n1454), .Y(n1439) );
  INVX4 U1453 ( .A(n1830), .Y(n2487) );
  NOR3X1 U1454 ( .A(n1378), .B(n2390), .C(n2389), .Y(n1271) );
  AND3X2 U1455 ( .A(n2616), .B(n2617), .C(n1936), .Y(n1272) );
  NOR2X1 U1456 ( .A(n1380), .B(n1640), .Y(n1383) );
  NAND2X1 U1457 ( .A(n2226), .B(n2225), .Y(n1273) );
  NOR2X1 U1458 ( .A(n1632), .B(n1382), .Y(n1379) );
  NOR2X4 U1459 ( .A(n2220), .B(n2216), .Y(n1465) );
  AOI32X1 U1460 ( .A0(n1410), .A1(div_82_u_div_PartRem_2__10_), .A2(n2159), 
        .B0(div_82_u_div_SumTmp_7__1__10_), .B1(n1440), .Y(n2088) );
  BUFX1 U1461 ( .A(n2058), .Y(n1316) );
  NOR2XL U1462 ( .A(n1445), .B(n1563), .Y(n1317) );
  INVX4 U1463 ( .A(n1725), .Y(n1799) );
  AOI221X1 U1464 ( .A0(div_82_u_div_SumTmp_6__3__8_), .A1(n1432), .B0(
        div_82_u_div_SumTmp_4__3__8_), .B1(n1917), .C0(n1840), .Y(n1841) );
  BUFX4 U1465 ( .A(div_82_u_div_PartRem_3__7_), .Y(n1514) );
  OR2X1 U1466 ( .A(n2092), .B(n1408), .Y(n2093) );
  INVX8 U1467 ( .A(n1860), .Y(n2483) );
  MX2X4 U1468 ( .A(n1783), .B(n1782), .S0(n1800), .Y(n1860) );
  MX2X4 U1469 ( .A(n1791), .B(n1790), .S0(n1800), .Y(n1868) );
  AOI221X1 U1470 ( .A0(div_82_u_div_SumTmp_7__1__9_), .A1(n1440), .B0(n1392), 
        .B1(n2099), .C0(n2098), .Y(n2100) );
  INVX4 U1471 ( .A(n2152), .Y(n2173) );
  CLKINVXL U1472 ( .A(n2095), .Y(n2110) );
  OAI2BB1X1 U1473 ( .A0N(n2094), .A1N(n1323), .B0(n2093), .Y(n2099) );
  CLKINVXL U1474 ( .A(n2169), .Y(n1318) );
  BUFX1 U1475 ( .A(n1800), .Y(n1320) );
  AOI221X1 U1476 ( .A0(div_82_u_div_SumTmp_7__1__6_), .A1(n1440), .B0(
        div_82_u_div_SumTmp_1__1__6_), .B1(n2173), .C0(n2124), .Y(n2125) );
  AOI221X1 U1477 ( .A0(div_82_u_div_SumTmp_6__3__7_), .A1(n1432), .B0(
        div_82_u_div_SumTmp_4__3__7_), .B1(n1917), .C0(n1848), .Y(n1849) );
  AND2X4 U1478 ( .A(div_82_u_div_SumTmp_4__3__5_), .B(n1917), .Y(n1335) );
  NAND2XL U1479 ( .A(div_82_u_div_CryOut_2__5_), .B(n1401), .Y(n1402) );
  NOR3BX4 U1480 ( .AN(n1321), .B(n1335), .C(n1862), .Y(n1863) );
  NAND2X1 U1481 ( .A(div_82_u_div_SumTmp_6__3__5_), .B(n1432), .Y(n1321) );
  CLKINVXL U1482 ( .A(n1434), .Y(n1347) );
  CLKINVXL U1483 ( .A(n2169), .Y(n1374) );
  NAND2X1 U1484 ( .A(div_82_u_div_CryOut_3__1_), .B(div_82_u_div_CryOut_2__1_), 
        .Y(n2073) );
  BUFX1 U1485 ( .A(div_82_u_div_CryOut_2__2_), .Y(n1325) );
  OAI221X1 U1486 ( .A0(n1992), .A1(n1991), .B0(n1566), .B1(n1989), .C0(n1988), 
        .Y(n1326) );
  OAI221X2 U1487 ( .A0(n1992), .A1(n1991), .B0(n1566), .B1(n1989), .C0(n1988), 
        .Y(n1327) );
  OAI221X1 U1488 ( .A0(n1992), .A1(n1991), .B0(n1566), .B1(n1989), .C0(n1988), 
        .Y(n1433) );
  INVXL U1489 ( .A(n2062), .Y(n1566) );
  OR2X1 U1490 ( .A(n1345), .B(n2153), .Y(n2137) );
  INVX1 U1491 ( .A(n2153), .Y(n2167) );
  BUFX3 U1492 ( .A(div_82_u_div_PartRem_2__13_), .Y(n1498) );
  OAI2BB1X1 U1493 ( .A0N(div_82_u_div_SumTmp_2__2__7_), .A1N(n1562), .B0(n1998), .Y(n2002) );
  CLKINVXL U1494 ( .A(n1340), .Y(n1328) );
  INVX4 U1495 ( .A(div_82_u_div_CryOut_2__1_), .Y(n1340) );
  NAND2X4 U1496 ( .A(n1340), .B(n1377), .Y(n2153) );
  INVX4 U1497 ( .A(sdiv_result[5]), .Y(n1377) );
  CLKINVXL U1498 ( .A(n1341), .Y(n2123) );
  BUFX1 U1499 ( .A(div_82_u_div_BInv_7__9_), .Y(n1329) );
  NAND2BXL U1500 ( .AN(n1399), .B(n2169), .Y(n2170) );
  CLKINVX2 U1501 ( .A(n2105), .Y(n2106) );
  OR2XL U1502 ( .A(n1390), .B(n2313), .Y(n1623) );
  INVX1 U1503 ( .A(n2153), .Y(n1350) );
  INVX3 U1504 ( .A(n1990), .Y(n1411) );
  AOI32X1 U1505 ( .A0(n1410), .A1(n1518), .A2(n1392), .B0(
        div_82_u_div_SumTmp_3__1__6_), .B1(n2172), .Y(n2126) );
  NOR2X2 U1506 ( .A(n1408), .B(n2130), .Y(n1444) );
  CLKBUFX2 U1507 ( .A(div_82_u_div_CryOut_6__1_), .Y(n1356) );
  BUFX1 U1508 ( .A(div_82_u_div_PartRem_3__11_), .Y(n1485) );
  INVX1 U1509 ( .A(n1849), .Y(n1850) );
  INVX2 U1510 ( .A(n2172), .Y(n1330) );
  OAI2BB1X2 U1511 ( .A0N(div_82_u_div_SumTmp_7__2__8_), .A1N(n1447), .B0(n1994), .Y(n1995) );
  NOR3X1 U1512 ( .A(n1333), .B(div_82_u_div_CryOut_2__3_), .C(n1806), .Y(n1450) );
  OAI2BB1X1 U1513 ( .A0N(div_82_u_div_SumTmp_4__1__0_), .A1N(n1409), .B0(n2166), .Y(n2168) );
  CLKINVX4 U1514 ( .A(n1972), .Y(n2327) );
  INVXL U1515 ( .A(n1815), .Y(n1818) );
  OAI221X1 U1516 ( .A0(n1874), .A1(n1859), .B0(n1858), .B1(n1927), .C0(n1857), 
        .Y(div_82_u_div_PartRem_3__9_) );
  INVX4 U1517 ( .A(n1415), .Y(n1425) );
  INVX4 U1518 ( .A(n1908), .Y(n1922) );
  AOI32X1 U1519 ( .A0(div_82_u_div_SumTmp_5__3__1_), .A1(n1908), .A2(n1917), 
        .B0(div_82_u_div_SumTmp_1__3__1_), .B1(n1907), .Y(n1909) );
  AOI222X1 U1520 ( .A0(div_82_u_div_SumTmp_5__3__10_), .A1(n1881), .B0(n1880), 
        .B1(n1826), .C0(div_82_u_div_SumTmp_7__3__10_), .C1(n1924), .Y(n1827)
         );
  INVX3 U1521 ( .A(n1703), .Y(n1701) );
  INVX4 U1522 ( .A(n1332), .Y(n1333) );
  OAI221X2 U1523 ( .A0(n2152), .A1(n2151), .B0(n1330), .B1(n2149), .C0(n2148), 
        .Y(n1434) );
  AND2X1 U1524 ( .A(div_82_u_div_SumTmp_1__1__0_), .B(n2173), .Y(n1336) );
  AND2X2 U1525 ( .A(div_82_u_div_SumTmp_3__1__0_), .B(n2172), .Y(n1337) );
  NOR3X4 U1526 ( .A(n1336), .B(n1337), .C(n2171), .Y(n2174) );
  NAND2X2 U1527 ( .A(n1392), .B(n1338), .Y(n1339) );
  NAND2X4 U1528 ( .A(n1339), .B(n2174), .Y(div_82_u_div_PartRem_1__3_) );
  INVX2 U1529 ( .A(n2175), .Y(n1338) );
  OAI33X1 U1530 ( .A0(n2472), .A1(n1270), .A2(n2168), .B0(n2168), .B1(n1410), 
        .B2(n1270), .Y(n2175) );
  INVXL U1531 ( .A(div_82_u_div_CryOut_2__1_), .Y(n2076) );
  BUFX1 U1532 ( .A(n1563), .Y(n1562) );
  NAND2X1 U1533 ( .A(div_82_u_div_SumTmp_5__2__0_), .B(n1412), .Y(n2060) );
  BUFX3 U1534 ( .A(n2497), .Y(n1496) );
  OAI211X1 U1535 ( .A0(n1330), .A1(n2089), .B0(n2088), .C0(n2087), .Y(
        div_82_u_div_PartRem_1__13_) );
  NOR2X4 U1536 ( .A(n2108), .B(n2107), .Y(n1440) );
  AND2X2 U1537 ( .A(div_82_u_div_SumTmp_7__2__4_), .B(n1447), .Y(n1342) );
  NOR3X4 U1538 ( .A(n1342), .B(n1343), .C(n2026), .Y(n2027) );
  AND3X4 U1539 ( .A(n2052), .B(n2051), .C(n2050), .Y(n1345) );
  BUFX12 U1540 ( .A(div_82_u_div_PartRem_2__6_), .Y(n1518) );
  OAI31XL U1541 ( .A0(n2105), .A1(n1444), .A2(n2097), .B0(n2096), .Y(n2098) );
  NAND2X1 U1542 ( .A(div_82_u_div_CryOut_1__1_), .B(n2076), .Y(n2072) );
  CLKINVX2 U1543 ( .A(n2135), .Y(n1375) );
  INVX4 U1544 ( .A(n1510), .Y(n1511) );
  OAI2BB1X2 U1545 ( .A0N(n2073), .A1N(n2072), .B0(n1323), .Y(n2074) );
  AOI2BB2XL U1546 ( .B0(n2132), .B1(n1323), .A0N(n2131), .A1N(n1323), .Y(n2136) );
  OR2X1 U1547 ( .A(n1377), .B(n2070), .Y(n2105) );
  AND3X4 U1548 ( .A(n1428), .B(n1429), .C(n1430), .Y(n1988) );
  BUFX2 U1549 ( .A(div_82_u_div_PartRem_1__8_), .Y(n1480) );
  OAI211X1 U1550 ( .A0(n1374), .A1(n2120), .B0(n2119), .C0(n2118), .Y(
        div_82_u_div_PartRem_1__10_) );
  AOI32XL U1551 ( .A0(n1410), .A1(n1506), .A2(n1392), .B0(
        div_82_u_div_SumTmp_3__1__7_), .B1(n2172), .Y(n2119) );
  BUFX1 U1552 ( .A(div_82_u_div_PartRem_1__9_), .Y(n1492) );
  BUFX1 U1553 ( .A(div_82_u_div_PartRem_1__9_), .Y(n1493) );
  BUFX1 U1554 ( .A(n2213), .Y(n1349) );
  INVX2 U1555 ( .A(n1510), .Y(n1513) );
  OAI21X1 U1556 ( .A0(n1420), .A1(n2150), .B0(n2139), .Y(n2140) );
  INVX2 U1557 ( .A(n2045), .Y(n1934) );
  OAI22X4 U1558 ( .A0(div_82_u_div_SumTmp_1__6__0_), .A1(
        div_82_u_div_CryOut_2__6_), .B0(div_82_u_div_SumTmp_3__6__0_), .B1(
        n1656), .Y(n1652) );
  NAND2X2 U1559 ( .A(n1422), .B(n1641), .Y(n1642) );
  NAND2XL U1560 ( .A(div_82_u_div_CryOut_3__5_), .B(n1711), .Y(n1671) );
  MX2X2 U1561 ( .A(n1655), .B(n1653), .S0(n1656), .Y(n1647) );
  CLKINVXL U1562 ( .A(n2498), .Y(n1351) );
  OAI33X1 U1563 ( .A0(n1654), .A1(n1395), .A2(n1653), .B0(
        div_82_u_div_CryOut_1__6_), .B1(n1395), .B2(n1469), .Y(n1658) );
  NAND2X1 U1564 ( .A(n2230), .B(n1384), .Y(n1421) );
  INVX1 U1565 ( .A(n1421), .Y(n1422) );
  INVXL U1566 ( .A(n1454), .Y(n1438) );
  MXI2X2 U1567 ( .A(n1653), .B(n1655), .S0(n1395), .Y(n1355) );
  OR2X2 U1568 ( .A(n2162), .B(n2156), .Y(n1352) );
  OR2X1 U1569 ( .A(n2155), .B(n2324), .Y(n1353) );
  NAND3X1 U1570 ( .A(n1352), .B(n2154), .C(n1353), .Y(n2158) );
  OAI2BB1X2 U1571 ( .A0N(div_82_u_div_SumTmp_2__6__2_), .A1N(n1395), .B0(n1647), .Y(n1648) );
  AOI22X1 U1572 ( .A0(div_82_u_div_SumTmp_4__1__9_), .A1(n1344), .B0(
        div_82_u_div_SumTmp_6__1__9_), .B1(n1356), .Y(n2092) );
  AOI32XL U1573 ( .A0(n2159), .A1(div_82_u_div_SumTmp_2__1__2_), .A2(n1341), 
        .B0(div_82_u_div_SumTmp_7__1__2_), .B1(n1440), .Y(n2154) );
  NAND2XL U1574 ( .A(n1696), .B(n1718), .Y(n1697) );
  INVX3 U1575 ( .A(div_82_u_div_CryOut_6__2_), .Y(n2055) );
  CLKINVXL U1576 ( .A(n2055), .Y(n1357) );
  AOI221X1 U1577 ( .A0(div_82_u_div_SumTmp_3__2__8_), .A1(n2062), .B0(
        div_82_u_div_SumTmp_5__2__8_), .B1(n1324), .C0(n1995), .Y(n1996) );
  AOI221X4 U1578 ( .A0(div_82_u_div_SumTmp_6__3__0_), .A1(n1432), .B0(
        div_82_u_div_SumTmp_4__3__0_), .B1(n1917), .C0(n1916), .Y(n1928) );
  OR2X4 U1579 ( .A(n2167), .B(n1442), .Y(n2108) );
  AOI221X2 U1580 ( .A0(div_82_u_div_SumTmp_4__1__3_), .A1(n1409), .B0(
        div_82_u_div_SumTmp_6__1__3_), .B1(n1444), .C0(n2145), .Y(n2146) );
  BUFX8 U1581 ( .A(n2497), .Y(n1495) );
  AOI2BB2X1 U1582 ( .B0(n1897), .B1(n1898), .A0N(n1432), .A1N(n1915), .Y(n1892) );
  OAI2BB1X1 U1583 ( .A0N(div_82_u_div_SumTmp_2__3__2_), .A1N(n1915), .B0(n1890), .Y(n1891) );
  INVX2 U1584 ( .A(n1454), .Y(n1603) );
  BUFX1 U1585 ( .A(n1404), .Y(n1359) );
  BUFX1 U1586 ( .A(n1391), .Y(n1360) );
  BUFX1 U1587 ( .A(cnt[4]), .Y(n1361) );
  INVX1 U1588 ( .A(cnt[4]), .Y(n1365) );
  CLKINVXL U1589 ( .A(n2266), .Y(n1363) );
  NAND2XL U1590 ( .A(n1415), .B(n1404), .Y(n1637) );
  INVX3 U1591 ( .A(cnt[0]), .Y(n2266) );
  NAND2XL U1592 ( .A(cnt[3]), .B(cnt[5]), .Y(n1636) );
  NAND2X1 U1593 ( .A(div_82_u_div_CryOut_1__2_), .B(n2058), .Y(n2045) );
  NAND2XL U1594 ( .A(div_82_u_div_SumTmp_2__2__6_), .B(n1562), .Y(n2006) );
  NAND4BBX4 U1595 ( .AN(n2219), .BN(n2321), .C(n1364), .D(n1365), .Y(n1641) );
  OR2X4 U1596 ( .A(n1606), .B(cs[1]), .Y(n1640) );
  INVX3 U1597 ( .A(cs[2]), .Y(n1606) );
  INVX2 U1598 ( .A(n1379), .Y(n1645) );
  OR2X4 U1599 ( .A(cnt[4]), .B(n1404), .Y(n2213) );
  CLKINVXL U1600 ( .A(n1359), .Y(n1405) );
  MX2X4 U1601 ( .A(n1773), .B(n1772), .S0(n1800), .Y(n1854) );
  NAND2XL U1602 ( .A(div_82_u_div_CryOut_6__3_), .B(div_82_u_div_CryOut_7__3_), 
        .Y(n1808) );
  MX2X4 U1603 ( .A(n1759), .B(n1758), .S0(n1800), .Y(n1838) );
  AOI221XL U1604 ( .A0(div_82_u_div_SumTmp_6__5__1_), .A1(n1709), .B0(
        div_82_u_div_SumTmp_2__5__1_), .B1(n1448), .C0(n1705), .Y(n1706) );
  OR2X1 U1605 ( .A(n1992), .B(n1977), .Y(n1367) );
  OR2X1 U1606 ( .A(n1566), .B(n1976), .Y(n1368) );
  NAND3X2 U1607 ( .A(n1367), .B(n1368), .C(n1975), .Y(
        div_82_u_div_PartRem_2__14_) );
  OR2X1 U1608 ( .A(n2152), .B(n2084), .Y(n1369) );
  OR2X1 U1609 ( .A(n1330), .B(n2083), .Y(n1370) );
  NAND3X1 U1610 ( .A(n1369), .B(n1370), .C(n2082), .Y(
        div_82_u_div_PartRem_1__14_) );
  NAND2XL U1611 ( .A(div_82_u_div_SumTmp_5__2__11_), .B(n1324), .Y(n1371) );
  NAND2XL U1612 ( .A(n1974), .B(n1230), .Y(n1372) );
  NAND2XL U1613 ( .A(div_82_u_div_SumTmp_7__2__11_), .B(n1447), .Y(n1373) );
  AND3X2 U1614 ( .A(n1371), .B(n1372), .C(n1373), .Y(n1975) );
  INVX2 U1615 ( .A(div_82_u_div_PartRem_1__14_), .Y(n1489) );
  OR2XL U1616 ( .A(n1729), .B(n1778), .Y(n1730) );
  INVX2 U1617 ( .A(n2324), .Y(n1392) );
  AOI222X1 U1618 ( .A0(div_82_u_div_SumTmp_6__1__10_), .A1(n1444), .B0(
        div_82_u_div_SumTmp_2__1__10_), .B1(n1341), .C0(
        div_82_u_div_SumTmp_4__1__10_), .C1(n1409), .Y(n2085) );
  BUFX8 U1619 ( .A(div_82_u_div_PartRem_1__5_), .Y(n1520) );
  NAND2X4 U1620 ( .A(n1376), .B(div_82_u_div_CryOut_1__1_), .Y(n2152) );
  AND2X2 U1621 ( .A(n1340), .B(n1407), .Y(n1376) );
  NAND2BX4 U1622 ( .AN(n1446), .B(n2041), .Y(n1972) );
  CLKINVXL U1623 ( .A(n1613), .Y(n1378) );
  OR2X2 U1624 ( .A(n1679), .B(n1703), .Y(n1680) );
  OR2XL U1625 ( .A(n1741), .B(n1778), .Y(n1742) );
  OAI211X1 U1626 ( .A0(n1374), .A1(n2127), .B0(n2126), .C0(n2125), .Y(
        div_82_u_div_PartRem_1__9_) );
  INVX4 U1627 ( .A(n1741), .Y(n2491) );
  OR2X2 U1628 ( .A(div_82_u_div_CryOut_6__4_), .B(n1732), .Y(n1725) );
  INVX4 U1629 ( .A(div_82_u_div_CryOut_6__4_), .Y(n1733) );
  AOI221XL U1630 ( .A0(div_82_u_div_SumTmp_7__2__7_), .A1(n1447), .B0(
        div_82_u_div_SumTmp_1__2__7_), .B1(n1406), .C0(n2000), .Y(n2001) );
  NOR2BX1 U1631 ( .AN(n1381), .B(n1640), .Y(n1382) );
  NOR2BX2 U1632 ( .AN(n1381), .B(n1640), .Y(n1468) );
  NOR2BX4 U1633 ( .AN(n1606), .B(n1613), .Y(n1384) );
  NAND2X1 U1634 ( .A(n2206), .B(n1955), .Y(n2219) );
  OR2X2 U1635 ( .A(div_82_quotient_14_), .B(n1797), .Y(n1726) );
  MX2X2 U1636 ( .A(n1683), .B(n1682), .S0(n1718), .Y(n1741) );
  INVX2 U1637 ( .A(n1400), .Y(n1385) );
  BUFX1 U1638 ( .A(n1393), .Y(n1386) );
  OR3XL U1639 ( .A(n2223), .B(n1645), .C(n2221), .Y(n1660) );
  NAND2XL U1640 ( .A(div_82_u_div_SumTmp_7__2__6_), .B(n1447), .Y(n2009) );
  OR2XL U1641 ( .A(n1385), .B(n1361), .Y(n2218) );
  INVX2 U1642 ( .A(div_82_u_div_CryOut_5__1_), .Y(n2070) );
  NAND2XL U1643 ( .A(div_82_u_div_SumTmp_1__2__10_), .B(n1406), .Y(n1979) );
  NAND2XL U1644 ( .A(div_82_u_div_SumTmp_1__2__4_), .B(n1406), .Y(n2025) );
  CLKINVXL U1645 ( .A(n1358), .Y(n1388) );
  BUFX1 U1646 ( .A(n2321), .Y(n1389) );
  OAI32X4 U1647 ( .A0(n1333), .A1(div_82_u_div_CryOut_2__3_), .A2(n1903), .B0(
        n1902), .B1(n1901), .Y(n1904) );
  NAND2X2 U1648 ( .A(div_82_u_div_CryOut_5__3_), .B(n1333), .Y(n1809) );
  OR3XL U1649 ( .A(n1360), .B(n2233), .C(n1363), .Y(n2339) );
  OR2X1 U1650 ( .A(n1812), .B(n1921), .Y(n1813) );
  OAI2BB1X2 U1651 ( .A0N(div_82_u_div_SumTmp_1__6__2_), .A1N(n1656), .B0(n1355), .Y(n1649) );
  NOR2BXL U1652 ( .AN(n2318), .B(n2319), .Y(n1464) );
  OAI32X4 U1653 ( .A0(n2233), .A1(n1389), .A2(n2234), .B0(n2322), .B1(n2231), 
        .Y(n2232) );
  OR2X4 U1654 ( .A(n1636), .B(n2213), .Y(n1393) );
  OR2X2 U1655 ( .A(n1636), .B(n2213), .Y(n2230) );
  INVX2 U1656 ( .A(n1605), .Y(n1604) );
  CLKINVXL U1657 ( .A(cs[2]), .Y(n1605) );
  NAND3BX1 U1658 ( .AN(cnt[0]), .B(n1391), .C(n1425), .Y(n1635) );
  CLKINVXL U1659 ( .A(n1955), .Y(n1394) );
  CLKINVXL U1660 ( .A(n2206), .Y(n1396) );
  INVX2 U1661 ( .A(cs[1]), .Y(n1613) );
  INVX4 U1662 ( .A(div_82_u_div_CryOut_2__5_), .Y(n1710) );
  AOI221X1 U1663 ( .A0(div_82_u_div_SumTmp_7__5__5_), .A1(n1709), .B0(
        div_82_u_div_SumTmp_5__5__5_), .B1(n1716), .C0(n1667), .Y(n1676) );
  CLKINVXL U1664 ( .A(n1383), .Y(n2314) );
  BUFX1 U1665 ( .A(n1380), .Y(n1398) );
  OAI22XL U1666 ( .A0(n1475), .A1(n1605), .B0(n2204), .B1(n1623), .Y(ns[2]) );
  OR4X1 U1667 ( .A(n1360), .B(n1620), .C(n1363), .D(n1359), .Y(n1627) );
  OR4X1 U1668 ( .A(n1389), .B(n1365), .C(n1359), .D(n1394), .Y(n1957) );
  BUFX1 U1669 ( .A(n1425), .Y(n1400) );
  NAND2XL U1670 ( .A(div_82_u_div_CryOut_6__5_), .B(div_82_quotient_17_), .Y(
        n1403) );
  NAND2X1 U1671 ( .A(n1402), .B(n1403), .Y(n1674) );
  MXI2X1 U1672 ( .A(n1811), .B(n1810), .S0(div_82_quotient_11_), .Y(n1565) );
  NOR2X2 U1673 ( .A(n2327), .B(n2045), .Y(n1406) );
  NAND2X2 U1674 ( .A(div_82_u_div_SumTmp_7__5__2_), .B(n1709), .Y(n1691) );
  NAND3X1 U1675 ( .A(n2011), .B(n2010), .C(n2009), .Y(n2012) );
  INVX2 U1676 ( .A(div_82_u_div_CryOut_6__5_), .Y(n1567) );
  MX2X1 U1677 ( .A(flatten_arr1[0]), .B(n1449), .S0(n1573), .Y(n919) );
  OAI21X4 U1678 ( .A0(n1638), .A1(n1393), .B0(n1641), .Y(n1639) );
  OAI33X4 U1679 ( .A0(div_82_quotient_14_), .A1(n1797), .A2(n1788), .B0(
        div_82_u_div_CryOut_2__4_), .B1(div_82_quotient_14_), .B2(n1787), .Y(
        n1789) );
  OAI33X4 U1680 ( .A0(n1797), .A1(div_82_quotient_14_), .A2(n1796), .B0(
        div_82_u_div_CryOut_2__4_), .B1(div_82_quotient_14_), .B2(n1795), .Y(
        n1798) );
  OAI33X4 U1681 ( .A0(n1797), .A1(div_82_quotient_14_), .A2(n1793), .B0(
        div_82_u_div_CryOut_2__4_), .B1(div_82_quotient_14_), .B2(n1792), .Y(
        n1794) );
  OR2X2 U1682 ( .A(div_82_u_div_CryOut_2__4_), .B(div_82_quotient_14_), .Y(
        n1778) );
  NAND2X1 U1683 ( .A(n1412), .B(div_82_u_div_SumTmp_5__2__2_), .Y(n2037) );
  OAI2BB1X2 U1684 ( .A0N(div_82_u_div_SumTmp_5__2__7_), .A1N(n1412), .B0(n1999), .Y(n2000) );
  NAND2X1 U1685 ( .A(div_82_u_div_SumTmp_5__2__6_), .B(n1324), .Y(n2010) );
  INVX2 U1686 ( .A(n2100), .Y(div_82_u_div_PartRem_1__12_) );
  BUFX1 U1687 ( .A(n2167), .Y(n1410) );
  OAI2BB1X2 U1688 ( .A0N(div_82_u_div_SumTmp_3__2__3_), .A1N(n1411), .B0(n2032), .Y(n2033) );
  OAI21X2 U1689 ( .A0(n2326), .A1(n2028), .B0(n2027), .Y(
        div_82_u_div_PartRem_2__7_) );
  OAI21X1 U1690 ( .A0(n2142), .A1(n2324), .B0(n2141), .Y(
        div_82_u_div_PartRem_1__7_) );
  AOI221X1 U1691 ( .A0(div_82_u_div_SumTmp_7__1__4_), .A1(n1440), .B0(
        div_82_u_div_SumTmp_5__1__4_), .B1(n2169), .C0(n2140), .Y(n2141) );
  CLKINVX2 U1692 ( .A(div_82_u_div_CryOut_3__1_), .Y(n2071) );
  BUFX1 U1693 ( .A(n2327), .Y(n1413) );
  OR3XL U1694 ( .A(n1955), .B(n2266), .C(n1405), .Y(n1614) );
  OR3XL U1695 ( .A(n2219), .B(n1405), .C(n1628), .Y(n2203) );
  BUFX1 U1696 ( .A(div_82_u_div_BInv_3__13_), .Y(n1414) );
  AOI222X1 U1697 ( .A0(div_82_u_div_SumTmp_3__1__1_), .A1(n2172), .B0(
        div_82_u_div_SumTmp_1__1__1_), .B1(n2173), .C0(
        div_82_u_div_SumTmp_5__1__1_), .C1(n2169), .Y(n2164) );
  AOI222X1 U1698 ( .A0(div_82_u_div_SumTmp_3__1__2_), .A1(n2172), .B0(
        div_82_u_div_SumTmp_1__1__2_), .B1(n2173), .C0(
        div_82_u_div_SumTmp_5__1__2_), .C1(n2169), .Y(n2157) );
  AOI221XL U1699 ( .A0(div_82_u_div_SumTmp_6__3__10_), .A1(n1432), .B0(
        div_82_u_div_SumTmp_4__3__10_), .B1(n1917), .C0(n1824), .Y(n1825) );
  BUFX4 U1700 ( .A(div_82_u_div_PartRem_3__9_), .Y(n1499) );
  INVX4 U1701 ( .A(n2135), .Y(n2169) );
  OR2X1 U1702 ( .A(n1822), .B(n1921), .Y(n1823) );
  CLKINVXL U1703 ( .A(div_82_u_div_CryOut_2__3_), .Y(n1811) );
  MX2X1 U1704 ( .A(div_82_u_div_CryOut_2__3_), .B(div_82_u_div_CryOut_6__3_), 
        .S0(div_82_quotient_11_), .Y(n1451) );
  OR2X2 U1705 ( .A(n1322), .B(n1408), .Y(n2107) );
  INVX8 U1706 ( .A(n1875), .Y(n2481) );
  MX2X4 U1707 ( .A(n1802), .B(n1801), .S0(n1800), .Y(n1875) );
  INVX8 U1708 ( .A(n1748), .Y(n2490) );
  INVX3 U1709 ( .A(n1719), .Y(n1718) );
  NAND2BX1 U1710 ( .AN(div_82_quotient_11_), .B(div_82_u_div_CryOut_2__3_), 
        .Y(n1902) );
  AOI222X4 U1711 ( .A0(div_82_u_div_SumTmp_5__3__11_), .A1(n1881), .B0(n1880), 
        .B1(n1818), .C0(div_82_u_div_SumTmp_7__3__11_), .C1(n1924), .Y(n1819)
         );
  BUFX3 U1712 ( .A(div_82_u_div_PartRem_3__9_), .Y(n1500) );
  CLKINVXL U1713 ( .A(n2493), .Y(n1417) );
  INVX3 U1714 ( .A(n1417), .Y(n1418) );
  BUFX1 U1715 ( .A(n1358), .Y(n1419) );
  CLKINVXL U1716 ( .A(div_82_u_div_BInv_3__8_), .Y(n1586) );
  OR2X4 U1717 ( .A(n2108), .B(n2095), .Y(n2150) );
  OAI32X1 U1718 ( .A0(n2123), .A1(n2324), .A2(n2122), .B0(n2121), .B1(n2324), 
        .Y(n2124) );
  OAI32X4 U1719 ( .A0(div_82_u_div_CryOut_6__2_), .A1(n2058), .A2(n2043), .B0(
        n2042), .B1(n2041), .Y(n2046) );
  INVX4 U1720 ( .A(n1504), .Y(n1506) );
  INVX4 U1721 ( .A(div_82_u_div_PartRem_2__7_), .Y(n1504) );
  CLKINVX8 U1722 ( .A(n1644), .Y(n2493) );
  AOI221X2 U1723 ( .A0(div_82_u_div_SumTmp_7__5__3_), .A1(n1709), .B0(
        div_82_u_div_SumTmp_5__5__3_), .B1(n1716), .C0(n1685), .Y(n1690) );
  BUFX4 U1724 ( .A(div_82_u_div_PartRem_3__6_), .Y(n1502) );
  INVX1 U1725 ( .A(n2085), .Y(n2086) );
  AOI221X4 U1726 ( .A0(div_82_u_div_SumTmp_4__1__4_), .A1(n1409), .B0(
        div_82_u_div_SumTmp_6__1__4_), .B1(n1444), .C0(n2138), .Y(n2142) );
  OR2XL U1727 ( .A(n1778), .B(n1755), .Y(n1756) );
  OAI222X4 U1728 ( .A0(n2152), .A1(n2114), .B0(n2113), .B1(n2324), .C0(n2112), 
        .C1(n2111), .Y(div_82_u_div_PartRem_1__11_) );
  NAND2X1 U1729 ( .A(n1706), .B(n1718), .Y(n1707) );
  OAI32X1 U1730 ( .A0(n1397), .A1(n1334), .A2(n1714), .B0(n1713), .B1(n1712), 
        .Y(n1715) );
  AOI32X2 U1731 ( .A0(n1355), .A1(n1395), .A2(div_82_u_div_SumTmp_3__6__2_), 
        .B0(n1649), .B1(n1648), .Y(n1668) );
  AOI221X1 U1732 ( .A0(div_82_u_div_SumTmp_1__5__1_), .A1(n1701), .B0(
        div_82_u_div_SumTmp_5__5__1_), .B1(n1716), .C0(n1700), .Y(n1708) );
  AOI221X1 U1733 ( .A0(div_82_u_div_SumTmp_6__5__4_), .A1(n1709), .B0(
        div_82_u_div_SumTmp_4__5__4_), .B1(n1716), .C0(n1681), .Y(n1682) );
  OAI2BB1XL U1734 ( .A0N(div_82_u_div_SumTmp_2__4__4_), .A1N(n1780), .B0(n1763), .Y(n1764) );
  OR2XL U1735 ( .A(n1703), .B(n1351), .Y(n1687) );
  OR2X1 U1736 ( .A(n1703), .B(n1693), .Y(n1694) );
  CLKINVX8 U1737 ( .A(n1868), .Y(n2482) );
  INVX1 U1738 ( .A(n2080), .Y(n2081) );
  OR2X4 U1739 ( .A(div_82_quotient_11_), .B(div_82_u_div_CryOut_2__3_), .Y(
        n1921) );
  AOI33X4 U1740 ( .A0(div_82_u_div_SumTmp_6__2__1_), .A1(div_82_quotient_8_), 
        .A2(n1357), .B0(div_82_u_div_SumTmp_2__2__1_), .B1(n1316), .B2(n1325), 
        .Y(n2048) );
  NAND2XL U1741 ( .A(div_82_u_div_CryOut_5__2_), .B(div_82_quotient_8_), .Y(
        n2044) );
  NAND2XL U1742 ( .A(div_82_u_div_CryOut_7__2_), .B(div_82_quotient_8_), .Y(
        n1973) );
  MX2XL U1743 ( .A(n1449), .B(flatten_arr2_3__0_), .S0(n2423), .Y(n908) );
  MX2X2 U1744 ( .A(n1449), .B(quant_conv1[0]), .S0(n2189), .Y(n1000) );
  OAI211X1 U1745 ( .A0(n1912), .A1(n1911), .B0(n1910), .C0(n1909), .Y(
        div_82_u_div_PartRem_3__4_) );
  OAI2BB1X2 U1746 ( .A0N(div_82_u_div_SumTmp_7__1__0_), .A1N(n1440), .B0(n2170), .Y(n2171) );
  OAI2BB1X4 U1747 ( .A0N(n2065), .A1N(n1230), .B0(n2063), .Y(n2496) );
  MX2X4 U1748 ( .A(n1690), .B(n1689), .S0(n1718), .Y(n1748) );
  INVX2 U1749 ( .A(n1863), .Y(n1864) );
  NAND2BX2 U1750 ( .AN(n2158), .B(n2157), .Y(div_82_u_div_PartRem_1__5_) );
  AOI222X4 U1751 ( .A0(div_82_u_div_SumTmp_4__2__7_), .A1(n1446), .B0(n2003), 
        .B1(n1514), .C0(div_82_u_div_SumTmp_6__2__7_), .C1(n1445), .Y(n1998)
         );
  AOI221X4 U1752 ( .A0(div_82_u_div_SumTmp_6__2__5_), .A1(n1445), .B0(
        div_82_u_div_SumTmp_4__2__5_), .B1(n1446), .C0(n2017), .Y(n2021) );
  AOI222X4 U1753 ( .A0(n2003), .A1(n1482), .B0(div_82_u_div_SumTmp_6__2__10_), 
        .B1(n1445), .C0(div_82_u_div_SumTmp_4__2__10_), .C1(n1446), .Y(n1978)
         );
  AOI221X4 U1754 ( .A0(div_82_u_div_SumTmp_4__2__3_), .A1(n1446), .B0(
        div_82_u_div_SumTmp_6__2__3_), .B1(n1445), .C0(n2031), .Y(n2035) );
  OR2XL U1755 ( .A(n2015), .B(n2041), .Y(n2016) );
  AOI221X4 U1756 ( .A0(div_82_u_div_SumTmp_4__2__9_), .A1(n1446), .B0(
        div_82_u_div_SumTmp_6__2__9_), .B1(n1445), .C0(n1985), .Y(n1986) );
  AOI221X4 U1757 ( .A0(div_82_u_div_SumTmp_4__2__4_), .A1(n1446), .B0(
        div_82_u_div_SumTmp_6__2__4_), .B1(n1445), .C0(n2024), .Y(n2028) );
  AOI222X4 U1758 ( .A0(n2477), .A1(n2003), .B0(div_82_u_div_SumTmp_4__2__2_), 
        .B1(n1446), .C0(div_82_u_div_SumTmp_6__2__2_), .C1(n1445), .Y(n2036)
         );
  AOI222X4 U1759 ( .A0(n2003), .A1(n1237), .B0(div_82_u_div_SumTmp_4__2__8_), 
        .B1(n1446), .C0(div_82_u_div_SumTmp_6__2__8_), .C1(n1445), .Y(n1993)
         );
  OAI2BB1XL U1760 ( .A0N(div_82_u_div_SumTmp_2__4__2_), .A1N(n1780), .B0(n1779), .Y(n1781) );
  OR2X2 U1761 ( .A(n1703), .B(n1702), .Y(n1704) );
  AOI222X2 U1762 ( .A0(div_82_u_div_SumTmp_1__3__4_), .A1(n1907), .B0(
        div_82_u_div_SumTmp_7__3__4_), .B1(n1924), .C0(
        div_82_u_div_SumTmp_3__3__4_), .C1(n1925), .Y(n1871) );
  AOI221X1 U1763 ( .A0(div_82_u_div_SumTmp_7__5__4_), .A1(n1709), .B0(
        div_82_u_div_SumTmp_5__5__4_), .B1(n1716), .C0(n1678), .Y(n1683) );
  INVX4 U1764 ( .A(n1762), .Y(n2466) );
  NOR2X4 U1765 ( .A(div_82_u_div_CryOut_6__2_), .B(n2058), .Y(n1446) );
  OAI221X4 U1766 ( .A0(n1886), .A1(n1821), .B0(n1884), .B1(n1820), .C0(n1819), 
        .Y(div_82_u_div_PartRem_3__14_) );
  INVX1 U1767 ( .A(div_82_u_div_BInv_5__0_), .Y(n1549) );
  INVX4 U1768 ( .A(n1702), .Y(sdiv_dend[16]) );
  OAI221X2 U1769 ( .A0(n2318), .A1(n1643), .B0(n1366), .B1(n1362), .C0(n1642), 
        .Y(n1644) );
  NAND2BX1 U1770 ( .AN(n1378), .B(n1398), .Y(n2358) );
  OAI211XL U1771 ( .A0(n2266), .A1(n2265), .B0(n2317), .C0(n2314), .Y(n2267)
         );
  NAND2X1 U1772 ( .A(div_82_u_div_SumTmp_1__5__4_), .B(n1701), .Y(n1677) );
  INVX1 U1773 ( .A(n1825), .Y(n1826) );
  NAND2XL U1774 ( .A(n1987), .B(n1230), .Y(n1429) );
  INVX1 U1775 ( .A(div_82_u_div_SumTmp_1__2__9_), .Y(n1991) );
  CLKINVX4 U1776 ( .A(div_82_quotient_11_), .Y(n1816) );
  NAND3X2 U1777 ( .A(n1635), .B(n1423), .C(n1424), .Y(n1638) );
  OR2X4 U1778 ( .A(n2327), .B(n2044), .Y(n1967) );
  OAI2BB1X2 U1779 ( .A0N(div_82_u_div_SumTmp_3__2__4_), .A1N(n2062), .B0(n2025), .Y(n2026) );
  INVX3 U1780 ( .A(n1822), .Y(n2488) );
  INVX3 U1781 ( .A(n1812), .Y(n2489) );
  CLKINVXL U1782 ( .A(n1210), .Y(n1582) );
  CLKINVX2 U1783 ( .A(div_82_u_div_BInv_7__0_), .Y(n1551) );
  INVX2 U1784 ( .A(n1777), .Y(sdiv_dend[14]) );
  NAND2XL U1785 ( .A(div_82_u_div_SumTmp_5__2__9_), .B(n1324), .Y(n1428) );
  NAND2XL U1786 ( .A(div_82_u_div_SumTmp_7__2__9_), .B(n1447), .Y(n1430) );
  OAI33X2 U1787 ( .A0(n2047), .A1(n1317), .A2(n2049), .B0(n1933), .B1(n1934), 
        .B2(n1935), .Y(n2064) );
  INVXL U1788 ( .A(div_82_u_div_SumTmp_1__3__10_), .Y(n1829) );
  INVXL U1789 ( .A(div_82_u_div_SumTmp_3__3__10_), .Y(n1828) );
  OR2XL U1790 ( .A(n1886), .B(n1829), .Y(n1435) );
  OR2XL U1791 ( .A(n1884), .B(n1828), .Y(n1436) );
  AND2X4 U1792 ( .A(n2058), .B(div_82_u_div_CryOut_2__2_), .Y(n1563) );
  NOR2X2 U1793 ( .A(div_82_quotient_17_), .B(n1710), .Y(n1448) );
  OR2X4 U1794 ( .A(div_82_u_div_CryOut_2__5_), .B(div_82_quotient_17_), .Y(
        n1703) );
  OR2X1 U1795 ( .A(n1875), .B(n1921), .Y(n1876) );
  INVX1 U1796 ( .A(div_82_u_div_SumTmp_3__2__9_), .Y(n1989) );
  OAI2BB1X1 U1797 ( .A0N(div_82_u_div_SumTmp_2__2__10_), .A1N(n1562), .B0(
        n1978), .Y(n1982) );
  OR2XL U1798 ( .A(n1854), .B(n1921), .Y(n1855) );
  OAI2BB1X2 U1799 ( .A0N(n1708), .A1N(n1719), .B0(n1707), .Y(n1762) );
  CLKINVX1 U1800 ( .A(div_82_u_div_SumTmp_3__4__1_), .Y(n1785) );
  CLKINVXL U1801 ( .A(n2107), .Y(n2109) );
  INVX1 U1802 ( .A(div_82_u_div_SumTmp_5__1__7_), .Y(n2120) );
  INVX1 U1803 ( .A(n1986), .Y(n1987) );
  BUFX4 U1804 ( .A(div_82_u_div_PartRem_2__14_), .Y(n1488) );
  OAI2BB1X1 U1805 ( .A0N(n1982), .A1N(n1230), .B0(n1981), .Y(
        div_82_u_div_PartRem_2__13_) );
  CLKINVX1 U1806 ( .A(div_82_u_div_SumTmp_5__1__9_), .Y(n2097) );
  INVX1 U1807 ( .A(div_82_u_div_SumTmp_3__3__9_), .Y(n1836) );
  BUFX1 U1808 ( .A(div_82_u_div_PartRem_2__14_), .Y(n1487) );
  INVX1 U1809 ( .A(div_82_u_div_SumTmp_1__3__8_), .Y(n1845) );
  INVX1 U1810 ( .A(div_82_u_div_SumTmp_3__3__8_), .Y(n1844) );
  INVXL U1811 ( .A(n1971), .Y(n1974) );
  INVX1 U1812 ( .A(div_82_u_div_SumTmp_2__1__7_), .Y(n2116) );
  NAND2XL U1813 ( .A(n1502), .B(n2003), .Y(n2007) );
  INVX4 U1814 ( .A(div_82_u_div_CryOut_2__4_), .Y(n1797) );
  INVX1 U1815 ( .A(div_82_u_div_SumTmp_3__1__11_), .Y(n2083) );
  INVX1 U1816 ( .A(div_82_u_div_SumTmp_1__1__11_), .Y(n2084) );
  NAND2XL U1817 ( .A(div_82_u_div_SumTmp_1__4__4_), .B(n1775), .Y(n1760) );
  NAND2XL U1818 ( .A(div_82_u_div_CryOut_3__2_), .B(n2058), .Y(n1966) );
  INVX1 U1819 ( .A(div_82_u_div_SumTmp_1__3__11_), .Y(n1821) );
  OR3X4 U1820 ( .A(n1450), .B(n1905), .C(n1564), .Y(n1927) );
  NAND2BX1 U1821 ( .AN(div_82_quotient_11_), .B(div_82_u_div_CryOut_3__3_), 
        .Y(n1898) );
  INVX1 U1822 ( .A(div_82_u_div_BInv_6__8_), .Y(n1545) );
  OAI2BB1X1 U1823 ( .A0N(div_82_u_div_SumTmp_2__4__6_), .A1N(n1780), .B0(n1749), .Y(n1750) );
  INVX1 U1824 ( .A(div_82_u_div_SumTmp_1__3__3_), .Y(n1885) );
  AOI222X2 U1825 ( .A0(div_82_u_div_SumTmp_5__3__3_), .A1(n1881), .B0(n1879), 
        .B1(n1880), .C0(div_82_u_div_SumTmp_7__3__3_), .C1(n1924), .Y(n1882)
         );
  INVX1 U1826 ( .A(div_82_u_div_SumTmp_5__1__5_), .Y(n2134) );
  NAND2XL U1827 ( .A(div_82_u_div_SumTmp_1__5__5_), .B(n1701), .Y(n1666) );
  CLKINVXL U1828 ( .A(n1522), .Y(n2022) );
  INVX1 U1829 ( .A(n2146), .Y(n2147) );
  OAI2BB1X1 U1830 ( .A0N(div_82_u_div_SumTmp_2__4__3_), .A1N(n1780), .B0(n1770), .Y(n1771) );
  CLKINVXL U1831 ( .A(n1218), .Y(n2029) );
  INVX1 U1832 ( .A(div_82_u_div_SumTmp_1__4__1_), .Y(n1784) );
  OR3X4 U1833 ( .A(n1632), .B(n1468), .C(n1384), .Y(n1633) );
  AOI22X1 U1834 ( .A0(div_82_u_div_SumTmp_7__3__1_), .A1(n1900), .B0(
        div_82_u_div_SumTmp_3__3__1_), .B1(n1899), .Y(n1912) );
  CLKINVXL U1835 ( .A(n1221), .Y(n1679) );
  OR2XL U1836 ( .A(n1383), .B(n1362), .Y(n1951) );
  INVX4 U1837 ( .A(div_82_u_div_PartRem_1__4_), .Y(n1510) );
  NOR2X4 U1838 ( .A(n2648), .B(n1209), .Y(n1470) );
  AOI2BB1X1 U1839 ( .A0N(n1386), .A1N(n1385), .B0(n2322), .Y(n2205) );
  OR2XL U1840 ( .A(n1390), .B(n2265), .Y(n1437) );
  OR2XL U1841 ( .A(n2646), .B(n1660), .Y(n1659) );
  NAND2BX1 U1842 ( .AN(n1570), .B(conv1_result[8]), .Y(n1930) );
  NAND2BX1 U1843 ( .AN(n1570), .B(conv1_result[3]), .Y(n2069) );
  NAND2BX1 U1844 ( .AN(n1570), .B(conv1_result[0]), .Y(n2184) );
  NAND2BX1 U1845 ( .AN(n1570), .B(conv1_result[1]), .Y(n2179) );
  NAND2BX1 U1846 ( .AN(n1570), .B(conv1_result[2]), .Y(n2177) );
  AOI221XL U1847 ( .A0(div_82_u_div_SumTmp_3__1__8_), .A1(n2110), .B0(
        div_82_u_div_SumTmp_7__1__8_), .B1(n2109), .C0(n1388), .Y(n2111) );
  INVX2 U1848 ( .A(div_82_u_div_SumTmp_3__1__10_), .Y(n2089) );
  BUFX2 U1849 ( .A(div_82_u_div_PartRem_3__10_), .Y(n1482) );
  INVX2 U1850 ( .A(n1897), .Y(n1900) );
  NOR2X4 U1851 ( .A(n1732), .B(n1733), .Y(n1441) );
  MX2X1 U1852 ( .A(n1745), .B(n1744), .S0(n1800), .Y(n1822) );
  AOI221XL U1853 ( .A0(div_82_u_div_SumTmp_6__4__7_), .A1(n1441), .B0(
        div_82_u_div_SumTmp_4__4__7_), .B1(n1799), .C0(n1743), .Y(n1744) );
  AOI221XL U1854 ( .A0(div_82_u_div_SumTmp_7__4__7_), .A1(n1441), .B0(
        div_82_u_div_SumTmp_5__4__7_), .B1(n1799), .C0(n1740), .Y(n1745) );
  INVX2 U1855 ( .A(div_82_u_div_SumTmp_1__1__8_), .Y(n2114) );
  OAI2BB1X1 U1856 ( .A0N(div_82_u_div_SumTmp_3__4__7_), .A1N(n1780), .B0(n1739), .Y(n1740) );
  INVX2 U1857 ( .A(div_82_u_div_SumTmp_2__1__6_), .Y(n2122) );
  OR2X1 U1858 ( .A(n2077), .B(n2153), .Y(n2078) );
  CLKINVXL U1859 ( .A(div_82_u_div_PartRem_2__11_), .Y(n2077) );
  NOR2X4 U1860 ( .A(n2055), .B(n2058), .Y(n1445) );
  OAI2BB1X2 U1861 ( .A0N(n2014), .A1N(n1230), .B0(n2013), .Y(
        div_82_u_div_PartRem_2__9_) );
  INVX2 U1862 ( .A(div_82_u_div_SumTmp_1__3__7_), .Y(n1853) );
  INVX2 U1863 ( .A(div_82_u_div_SumTmp_3__3__7_), .Y(n1852) );
  NOR2X2 U1864 ( .A(n1973), .B(n1972), .Y(n1447) );
  MX2X1 U1865 ( .A(n1738), .B(n1737), .S0(n1320), .Y(n1812) );
  AOI221XL U1866 ( .A0(div_82_u_div_SumTmp_6__4__8_), .A1(n1441), .B0(
        div_82_u_div_SumTmp_4__4__8_), .B1(n1799), .C0(n1731), .Y(n1737) );
  AOI221XL U1867 ( .A0(div_82_u_div_SumTmp_7__4__8_), .A1(n1441), .B0(
        div_82_u_div_SumTmp_5__4__8_), .B1(n1799), .C0(n1728), .Y(n1738) );
  INVX1 U1868 ( .A(n1973), .Y(n2049) );
  INVX1 U1869 ( .A(div_82_u_div_SumTmp_1__3__9_), .Y(n1837) );
  INVX2 U1870 ( .A(n1966), .Y(n2047) );
  OAI2BB1X1 U1871 ( .A0N(div_82_u_div_SumTmp_2__2__9_), .A1N(n1563), .B0(n1984), .Y(n1985) );
  OR2X1 U1872 ( .A(n1968), .B(n2041), .Y(n1969) );
  CLKINVXL U1873 ( .A(n1485), .Y(n1968) );
  OR2X1 U1874 ( .A(n2041), .B(n1983), .Y(n1984) );
  CLKINVXL U1875 ( .A(n1499), .Y(n1983) );
  OAI2BB1X1 U1876 ( .A0N(div_82_u_div_SumTmp_3__4__8_), .A1N(n1780), .B0(n1727), .Y(n1728) );
  NAND2XL U1877 ( .A(div_82_u_div_SumTmp_1__4__8_), .B(n1775), .Y(n1727) );
  INVX2 U1878 ( .A(n1898), .Y(n1899) );
  INVX2 U1879 ( .A(n1537), .Y(n1536) );
  INVX2 U1880 ( .A(div_82_u_div_BInv_6__9_), .Y(n1537) );
  INVX2 U1881 ( .A(n1539), .Y(n1538) );
  INVX2 U1882 ( .A(div_82_u_div_BInv_5__8_), .Y(n1539) );
  INVX2 U1883 ( .A(n1543), .Y(n1542) );
  INVX2 U1884 ( .A(div_82_u_div_BInv_6__5_), .Y(n1543) );
  CLKINVXL U1885 ( .A(n2041), .Y(n2003) );
  INVX2 U1886 ( .A(div_82_u_div_BInv_5__6_), .Y(n1527) );
  INVX2 U1887 ( .A(div_82_u_div_BInv_3__7_), .Y(n1533) );
  INVX2 U1888 ( .A(div_82_u_div_BInv_3__5_), .Y(n1535) );
  INVX2 U1889 ( .A(div_82_u_div_BInv_6__7_), .Y(n1529) );
  INVX2 U1890 ( .A(n1525), .Y(n1524) );
  INVX2 U1891 ( .A(div_82_u_div_BInv_5__7_), .Y(n1525) );
  INVX2 U1892 ( .A(div_82_u_div_SumTmp_1__3__5_), .Y(n1867) );
  INVX2 U1893 ( .A(div_82_u_div_SumTmp_3__3__5_), .Y(n1866) );
  AOI221XL U1894 ( .A0(div_82_u_div_SumTmp_6__4__4_), .A1(n1441), .B0(
        div_82_u_div_SumTmp_4__4__4_), .B1(n1799), .C0(n1764), .Y(n1765) );
  AOI221XL U1895 ( .A0(div_82_u_div_SumTmp_7__4__6_), .A1(n1441), .B0(
        div_82_u_div_SumTmp_5__4__6_), .B1(n1799), .C0(n1747), .Y(n1752) );
  AOI221XL U1896 ( .A0(div_82_u_div_SumTmp_6__4__6_), .A1(n1441), .B0(
        div_82_u_div_SumTmp_4__4__6_), .B1(n1799), .C0(n1750), .Y(n1751) );
  OAI2BB1X1 U1897 ( .A0N(div_82_u_div_SumTmp_2__4__7_), .A1N(n1780), .B0(n1742), .Y(n1743) );
  BUFX2 U1898 ( .A(div_82_u_div_PartRem_3__6_), .Y(n1501) );
  OAI2BB1X1 U1899 ( .A0N(div_82_u_div_SumTmp_3__4__6_), .A1N(n1780), .B0(n1746), .Y(n1747) );
  NAND2XL U1900 ( .A(div_82_u_div_SumTmp_1__4__6_), .B(n1775), .Y(n1746) );
  OAI2BB1X1 U1901 ( .A0N(div_82_u_div_SumTmp_2__3__10_), .A1N(n1915), .B0(
        n1823), .Y(n1824) );
  INVX2 U1902 ( .A(div_82_u_div_SumTmp_5__3__6_), .Y(n1859) );
  AOI221XL U1903 ( .A0(div_82_u_div_SumTmp_6__3__6_), .A1(n1432), .B0(
        div_82_u_div_SumTmp_4__3__6_), .B1(n1917), .C0(n1856), .Y(n1858) );
  NAND2BX1 U1904 ( .AN(n1838), .B(n1887), .Y(n1839) );
  INVX2 U1905 ( .A(div_82_u_div_SumTmp_1__2__11_), .Y(n1977) );
  INVX2 U1906 ( .A(div_82_u_div_SumTmp_3__2__11_), .Y(n1976) );
  INVX2 U1907 ( .A(div_82_u_div_SumTmp_3__3__11_), .Y(n1820) );
  OAI2BB1X1 U1908 ( .A0N(div_82_u_div_SumTmp_2__3__9_), .A1N(n1915), .B0(n1831), .Y(n1832) );
  CLKINVXL U1909 ( .A(n1233), .Y(n2090) );
  INVX2 U1910 ( .A(n1557), .Y(n1556) );
  INVX2 U1911 ( .A(div_82_u_div_BInv_3__6_), .Y(n1557) );
  OAI2BB1X1 U1912 ( .A0N(div_82_u_div_SumTmp_2__4__8_), .A1N(n1780), .B0(n1730), .Y(n1731) );
  CLKINVXL U1913 ( .A(n1559), .Y(n2101) );
  INVX2 U1914 ( .A(n1577), .Y(n1576) );
  INVX2 U1915 ( .A(div_82_u_div_BInv_7__5_), .Y(n1577) );
  INVX2 U1916 ( .A(n1577), .Y(n1575) );
  NAND2XL U1917 ( .A(div_82_u_div_SumTmp_6__2__6_), .B(n1445), .Y(n2004) );
  INVX4 U1918 ( .A(n1668), .Y(div_82_u_div_PartRem_6__5_) );
  INVX2 U1919 ( .A(div_82_u_div_SumTmp_5__1__6_), .Y(n2127) );
  INVX2 U1920 ( .A(div_82_u_div_SumTmp_3__1__3_), .Y(n2149) );
  INVX2 U1921 ( .A(div_82_u_div_SumTmp_1__1__3_), .Y(n2151) );
  OR2XL U1922 ( .A(n1748), .B(n1778), .Y(n1749) );
  AOI221XL U1923 ( .A0(div_82_u_div_SumTmp_7__4__5_), .A1(n1441), .B0(
        div_82_u_div_SumTmp_5__4__5_), .B1(n1799), .C0(n1754), .Y(n1759) );
  INVX2 U1924 ( .A(div_82_u_div_SumTmp_5__3__4_), .Y(n1873) );
  INVX2 U1925 ( .A(div_82_u_div_SumTmp_3__3__3_), .Y(n1883) );
  NOR2X2 U1926 ( .A(n1451), .B(n1809), .Y(n1564) );
  OAI2BB1X1 U1927 ( .A0N(div_82_u_div_SumTmp_2__3__6_), .A1N(n1915), .B0(n1855), .Y(n1856) );
  OR2X1 U1928 ( .A(n2022), .B(n2041), .Y(n2023) );
  INVX2 U1929 ( .A(n1541), .Y(n1540) );
  INVX2 U1930 ( .A(div_82_u_div_BInv_6__4_), .Y(n1541) );
  INVX2 U1931 ( .A(n1592), .Y(n1591) );
  INVX2 U1932 ( .A(n1593), .Y(n1590) );
  INVX2 U1933 ( .A(n1593), .Y(n1589) );
  INVX2 U1934 ( .A(n1594), .Y(n1588) );
  INVX2 U1935 ( .A(n1594), .Y(n1587) );
  AOI221XL U1936 ( .A0(div_82_u_div_SumTmp_6__4__3_), .A1(n1441), .B0(
        div_82_u_div_SumTmp_4__4__3_), .B1(n1799), .C0(n1771), .Y(n1772) );
  AOI221XL U1937 ( .A0(div_82_u_div_SumTmp_7__4__3_), .A1(n1441), .B0(
        div_82_u_div_SumTmp_5__4__3_), .B1(n1799), .C0(n1768), .Y(n1773) );
  NAND2X1 U1938 ( .A(div_82_u_div_SumTmp_1__5__3_), .B(n1701), .Y(n1684) );
  NAND2X1 U1939 ( .A(div_82_u_div_SumTmp_7__5__1_), .B(n1709), .Y(n1699) );
  OAI2BB1X1 U1940 ( .A0N(div_82_u_div_SumTmp_2__4__5_), .A1N(n1780), .B0(n1756), .Y(n1757) );
  NAND2XL U1941 ( .A(div_82_u_div_SumTmp_3__4__2_), .B(n1780), .Y(n1774) );
  OAI2BB1X1 U1942 ( .A0N(div_82_u_div_SumTmp_5__3__2_), .A1N(n1917), .B0(n1888), .Y(n1896) );
  NAND2XL U1943 ( .A(div_82_u_div_SumTmp_1__3__2_), .B(n1887), .Y(n1888) );
  OAI2BB1X1 U1944 ( .A0N(div_82_u_div_SumTmp_2__3__4_), .A1N(n1915), .B0(n1869), .Y(n1870) );
  INVX2 U1945 ( .A(n1582), .Y(n1581) );
  CLKINVXL U1946 ( .A(n1496), .Y(n2128) );
  CLKINVXL U1947 ( .A(n2468), .Y(n1769) );
  CLKINVXL U1948 ( .A(n2496), .Y(n2143) );
  INVX2 U1949 ( .A(n1600), .Y(n1598) );
  INVX2 U1950 ( .A(n1601), .Y(n1597) );
  INVX2 U1951 ( .A(n1602), .Y(n1595) );
  INVX2 U1952 ( .A(n1600), .Y(n1599) );
  INVX2 U1953 ( .A(n1601), .Y(n1596) );
  INVX2 U1954 ( .A(n1951), .Y(n2189) );
  OR2X1 U1955 ( .A(n2222), .B(n1660), .Y(n1615) );
  INVX2 U1956 ( .A(n1453), .Y(n1592) );
  INVX2 U1957 ( .A(n1453), .Y(n1593) );
  INVX2 U1958 ( .A(n1453), .Y(n1594) );
  INVX2 U1959 ( .A(n1660), .Y(n2182) );
  AOI221XL U1960 ( .A0(div_82_u_div_SumTmp_5__4__1_), .A1(n1799), .B0(
        div_82_u_div_SumTmp_7__4__1_), .B1(n1441), .C0(n1786), .Y(n1791) );
  AOI221XL U1961 ( .A0(div_82_u_div_SumTmp_4__4__1_), .A1(n1799), .B0(
        div_82_u_div_SumTmp_6__4__1_), .B1(n1441), .C0(n1789), .Y(n1790) );
  AOI221XL U1962 ( .A0(div_82_u_div_SumTmp_5__4__0_), .A1(n1799), .B0(
        div_82_u_div_SumTmp_7__4__0_), .B1(n1441), .C0(n1794), .Y(n1802) );
  AOI221XL U1963 ( .A0(div_82_u_div_SumTmp_4__4__0_), .A1(n1799), .B0(
        div_82_u_div_SumTmp_6__4__0_), .B1(n1441), .C0(n1798), .Y(n1801) );
  AOI221XL U1964 ( .A0(div_82_u_div_SumTmp_6__4__2_), .A1(n1441), .B0(
        div_82_u_div_SumTmp_4__4__2_), .B1(n1799), .C0(n1781), .Y(n1782) );
  OAI2BB1X1 U1965 ( .A0N(div_82_u_div_SumTmp_1__4__2_), .A1N(n1775), .B0(n1774), .Y(n1776) );
  OAI2BB1X1 U1966 ( .A0N(div_82_u_div_SumTmp_2__2__0_), .A1N(n1325), .B0(n2054), .Y(n2059) );
  INVX2 U1967 ( .A(div_82_u_div_SumTmp_1__4__0_), .Y(n1792) );
  INVX2 U1968 ( .A(div_82_u_div_SumTmp_3__4__0_), .Y(n1793) );
  OAI33XL U1969 ( .A0(n1922), .A1(n1921), .A2(n1920), .B0(n1922), .B1(n1919), 
        .B2(n1918), .Y(n1923) );
  INVX2 U1970 ( .A(div_82_u_div_SumTmp_1__3__0_), .Y(n1920) );
  INVX2 U1971 ( .A(div_82_u_div_SumTmp_5__3__0_), .Y(n1918) );
  INVX2 U1972 ( .A(div_82_u_div_BInv_6__1_), .Y(n1547) );
  OR2X1 U1973 ( .A(n2029), .B(n2041), .Y(n2030) );
  INVX2 U1974 ( .A(div_82_u_div_SumTmp_4__5__1_), .Y(n1568) );
  OR2XL U1975 ( .A(n1386), .B(n2322), .Y(n2319) );
  INVX2 U1976 ( .A(n2502), .Y(n1600) );
  INVX2 U1977 ( .A(n2502), .Y(n1601) );
  INVX2 U1978 ( .A(n2502), .Y(n1602) );
  INVX2 U1979 ( .A(div_82_u_div_SumTmp_2__3__1_), .Y(n1901) );
  OR2X1 U1980 ( .A(n1460), .B(n1952), .Y(n2190) );
  OR2X1 U1981 ( .A(n1460), .B(n1965), .Y(n2191) );
  INVX2 U1982 ( .A(n2322), .Y(n2223) );
  NOR3X1 U1983 ( .A(n2223), .B(n2222), .C(n2221), .Y(n1453) );
  BUFX2 U1984 ( .A(n1464), .Y(n1574) );
  BUFX2 U1985 ( .A(n1464), .Y(n1573) );
  INVX2 U1986 ( .A(n2220), .Y(n2222) );
  INVX2 U1987 ( .A(n2625), .Y(n2532) );
  NAND3BX4 U1988 ( .AN(n1455), .B(n1651), .C(n1224), .Y(n2499) );
  AND3X1 U1989 ( .A(div_82_u_div_CryOut_3__6_), .B(n1395), .C(
        div_82_u_div_SumTmp_3__6__1_), .Y(n1455) );
  INVX2 U1990 ( .A(div_82_u_div_SumTmp_6__5__0_), .Y(n1712) );
  OR2XL U1991 ( .A(n1778), .B(n1777), .Y(n1779) );
  INVX2 U1992 ( .A(div_82_u_div_SumTmp_2__4__1_), .Y(n1788) );
  INVX2 U1993 ( .A(div_82_u_div_SumTmp_2__4__0_), .Y(n1796) );
  OAI2BB1X1 U1994 ( .A0N(div_82_u_div_SumTmp_2__3__0_), .A1N(n1915), .B0(n1914), .Y(n1916) );
  INVX2 U1995 ( .A(div_82_u_div_SumTmp_4__2__1_), .Y(n2043) );
  OR2XL U1996 ( .A(n1325), .B(n2053), .Y(n2054) );
  INVX2 U1997 ( .A(n1795), .Y(sdiv_dend[12]) );
  INVX2 U1998 ( .A(n1787), .Y(sdiv_dend[13]) );
  INVX2 U1999 ( .A(n1913), .Y(n2478) );
  INVX2 U2000 ( .A(n1903), .Y(n2479) );
  INVX2 U2001 ( .A(n1889), .Y(n2480) );
  OR2XL U2002 ( .A(n1604), .B(n2386), .Y(n2322) );
  INVX2 U2003 ( .A(n2267), .Y(n2311) );
  OAI222X1 U2004 ( .A0(n2606), .A1(n2312), .B0(n2521), .B1(n2311), .C0(n2607), 
        .C1(n1598), .Y(smult_b[68]) );
  OAI222X1 U2005 ( .A0(n2520), .A1(n2312), .B0(n2595), .B1(n2311), .C0(n2509), 
        .C1(n1599), .Y(smult_b[60]) );
  OAI222X1 U2006 ( .A0(n2608), .A1(n2312), .B0(n2523), .B1(n2311), .C0(n2609), 
        .C1(n1598), .Y(smult_b[67]) );
  OAI222X1 U2007 ( .A0(n2610), .A1(n2312), .B0(n2525), .B1(n2311), .C0(n2611), 
        .C1(n1598), .Y(smult_b[66]) );
  OAI222X1 U2008 ( .A0(n2614), .A1(n2312), .B0(n2529), .B1(n2311), .C0(n2615), 
        .C1(n1598), .Y(smult_b[64]) );
  OAI222X1 U2009 ( .A0(n2522), .A1(n2312), .B0(n2596), .B1(n2311), .C0(n2510), 
        .C1(n1599), .Y(smult_b[59]) );
  OAI222X1 U2010 ( .A0(n2612), .A1(n2312), .B0(n2527), .B1(n2311), .C0(n2613), 
        .C1(n1598), .Y(smult_b[65]) );
  OR2XL U2011 ( .A(n2234), .B(n2357), .Y(n2317) );
  OAI222X1 U2012 ( .A0(n2524), .A1(n2312), .B0(n2597), .B1(n2311), .C0(n2511), 
        .C1(n1599), .Y(smult_b[58]) );
  OAI222X1 U2013 ( .A0(n2528), .A1(n2312), .B0(n2599), .B1(n2311), .C0(n2513), 
        .C1(n1599), .Y(smult_b[56]) );
  OAI222X1 U2014 ( .A0(n2526), .A1(n2312), .B0(n2598), .B1(n2311), .C0(n2512), 
        .C1(n1599), .Y(smult_b[57]) );
  INVX2 U2015 ( .A(n2264), .Y(n2312) );
  OAI2BB1X1 U2016 ( .A0N(n2263), .A1N(n2266), .B0(n2262), .Y(n2264) );
  INVX2 U2017 ( .A(n2265), .Y(n2263) );
  OAI222X1 U2018 ( .A0(n2602), .A1(n2312), .B0(n2517), .B1(n2311), .C0(n2603), 
        .C1(n1599), .Y(smult_b[70]) );
  INVX2 U2019 ( .A(n1572), .Y(n2502) );
  OAI222X1 U2020 ( .A0(n2516), .A1(n2312), .B0(n2593), .B1(n2311), .C0(n2507), 
        .C1(n1599), .Y(smult_b[62]) );
  OAI222X1 U2021 ( .A0(n2604), .A1(n2312), .B0(n2519), .B1(n2311), .C0(n2605), 
        .C1(n1598), .Y(smult_b[69]) );
  OAI222X1 U2022 ( .A0(n2518), .A1(n2312), .B0(n2594), .B1(n2311), .C0(n2508), 
        .C1(n1599), .Y(smult_b[61]) );
  INVX2 U2023 ( .A(n2232), .Y(n2262) );
  OR2X1 U2024 ( .A(n2218), .B(n2203), .Y(n2231) );
  OAI222X1 U2025 ( .A0(n2600), .A1(n2312), .B0(n2515), .B1(n2311), .C0(n2601), 
        .C1(n1599), .Y(smult_b[71]) );
  OAI222X1 U2026 ( .A0(n2514), .A1(n2312), .B0(n2592), .B1(n2311), .C0(n2506), 
        .C1(n1599), .Y(smult_b[63]) );
  INVX2 U2027 ( .A(n2053), .Y(n2475) );
  INVX2 U2028 ( .A(n2042), .Y(n2476) );
  AND2X1 U2029 ( .A(n1604), .B(n2422), .Y(smin_a[1]) );
  NAND4BBX1 U2030 ( .AN(n1458), .BN(n1459), .C(n2463), .D(n2461), .Y(n2384) );
  OR2X1 U2031 ( .A(n2417), .B(n2413), .Y(n2371) );
  INVX2 U2032 ( .A(n2227), .Y(n2500) );
  OAI2BB1X1 U2033 ( .A0N(n2629), .A1N(n2628), .B0(n1466), .Y(n2227) );
  AND2X1 U2034 ( .A(n1604), .B(n2410), .Y(smin_a[4]) );
  AND2X1 U2035 ( .A(n1604), .B(n2446), .Y(smin_b[4]) );
  AND2X1 U2036 ( .A(n1604), .B(n2406), .Y(smin_a[5]) );
  AND2X1 U2037 ( .A(n1604), .B(n2442), .Y(smin_b[5]) );
  AND2X1 U2038 ( .A(n1604), .B(n2402), .Y(smin_a[6]) );
  AND2X1 U2039 ( .A(n1604), .B(n2438), .Y(smin_b[6]) );
  AND2X1 U2040 ( .A(n1604), .B(n2418), .Y(smin_a[2]) );
  AND2X1 U2041 ( .A(n1604), .B(n2454), .Y(smin_b[2]) );
  AND2X1 U2042 ( .A(n1604), .B(n2414), .Y(smin_a[3]) );
  AND2X1 U2043 ( .A(n1604), .B(n2450), .Y(smin_b[3]) );
  AND2X1 U2044 ( .A(n1604), .B(n2398), .Y(smin_a[7]) );
  AND2X1 U2045 ( .A(n1604), .B(n2434), .Y(smin_b[7]) );
  INVX2 U2046 ( .A(n2429), .Y(n2430) );
  OR2X1 U2047 ( .A(n2387), .B(n2386), .Y(n2429) );
  INVX2 U2048 ( .A(n2385), .Y(n2387) );
  NOR2BX1 U2049 ( .AN(n2393), .B(n2394), .Y(n1456) );
  NOR2BX1 U2050 ( .AN(n2391), .B(n2392), .Y(n1457) );
  INVX2 U2051 ( .A(n2163), .Y(n2473) );
  NOR2X1 U2052 ( .A(n2386), .B(n2385), .Y(n1458) );
  OR2X1 U2053 ( .A(n2392), .B(n2391), .Y(n2463) );
  INVX2 U2054 ( .A(n2156), .Y(n2474) );
  NOR2X1 U2055 ( .A(n2394), .B(n2393), .Y(n1459) );
  OR2XL U2056 ( .A(n2358), .B(n2357), .Y(n2392) );
  OR2XL U2057 ( .A(n2358), .B(n2339), .Y(n2394) );
  OAI32X1 U2058 ( .A0(n1472), .A1(n1938), .A2(n2185), .B0(n1937), .B1(n2186), 
        .Y(n1948) );
  AOI211X1 U2059 ( .A0(n1945), .A1(n1944), .B0(n1473), .C0(n2202), .Y(n1946)
         );
  OAI2BB1X1 U2060 ( .A0N(n1943), .A1N(n1942), .B0(n1941), .Y(n1944) );
  INVX2 U2061 ( .A(n1948), .Y(n1945) );
  OAI2BB1X1 U2062 ( .A0N(n1940), .A1N(n1939), .B0(n2187), .Y(n1941) );
  NOR2X1 U2063 ( .A(n2532), .B(scmp_result), .Y(n1460) );
  NOR2X1 U2064 ( .A(n2626), .B(n1965), .Y(n1461) );
  AOI21X1 U2065 ( .A0(n1954), .A1(n1953), .B0(n1952), .Y(n1462) );
  INVX2 U2066 ( .A(scmp_result), .Y(n1954) );
  OAI32X1 U2067 ( .A0(n2197), .A1(n2196), .A2(n2195), .B0(n2194), .B1(n2193), 
        .Y(n2533) );
  INVX2 U2068 ( .A(n2192), .Y(n2197) );
  OAI32X1 U2069 ( .A0(n1473), .A1(n2201), .A2(n2200), .B0(n2199), .B1(n2198), 
        .Y(n2535) );
  INVX2 U2070 ( .A(n1943), .Y(n1939) );
  OAI2BB1X1 U2071 ( .A0N(n2196), .A1N(n2195), .B0(n2192), .Y(n2202) );
  INVX2 U2072 ( .A(n1942), .Y(n1940) );
  INVX2 U2073 ( .A(n2201), .Y(n1947) );
  INVX2 U2074 ( .A(n2323), .Y(n2423) );
  OR2X1 U2075 ( .A(n2339), .B(n2234), .Y(n2316) );
  OR2X1 U2076 ( .A(n2504), .B(n2229), .Y(n2257) );
  INVX2 U2077 ( .A(n2229), .Y(n2303) );
  NOR2X1 U2078 ( .A(n2620), .B(n2211), .Y(n1463) );
  OAI2BB1X1 U2079 ( .A0N(N197), .A1N(n1615), .B0(n1608), .Y(n1165) );
  OR2XL U2080 ( .A(n2206), .B(n1618), .Y(n1608) );
  OAI2BB1X1 U2081 ( .A0N(N196), .A1N(n1615), .B0(n1609), .Y(n1166) );
  OR2X1 U2082 ( .A(n1365), .B(n1618), .Y(n1609) );
  OAI2BB1X1 U2083 ( .A0N(N195), .A1N(n1615), .B0(n1612), .Y(n1167) );
  OR2XL U2084 ( .A(n1955), .B(n1618), .Y(n1612) );
  INVX2 U2085 ( .A(n2204), .Y(n2221) );
  INVX2 U2086 ( .A(n1964), .Y(n1965) );
  OAI31X1 U2087 ( .A0(n2189), .A1(n2625), .A2(n2504), .B0(n1963), .Y(n1964) );
  INVX2 U2088 ( .A(n2211), .Y(n2209) );
  INVX2 U2089 ( .A(n2225), .Y(n1960) );
  OAI2BB1X1 U2090 ( .A0N(n2223), .A1N(n1661), .B0(n2204), .Y(n2180) );
  OAI2BB1X1 U2091 ( .A0N(n2223), .A1N(n1661), .B0(n2204), .Y(n1571) );
  OAI2BB1XL U2092 ( .A0N(n1662), .A1N(n2223), .B0(n1379), .Y(n2181) );
  INVX2 U2093 ( .A(n1661), .Y(n1662) );
  OAI211X1 U2094 ( .A0(n2220), .A1(n1627), .B0(n2386), .C0(n1626), .Y(ns[1])
         );
  AOI2BB1X1 U2095 ( .A0N(n1625), .A1N(n1643), .B0(n1624), .Y(n1626) );
  INVX2 U2096 ( .A(n2316), .Y(n1624) );
  INVX2 U2097 ( .A(n1623), .Y(n1625) );
  OR2X1 U2098 ( .A(n2219), .B(n2218), .Y(n2224) );
  INVX2 U2099 ( .A(n2208), .Y(n2501) );
  OR2XL U2100 ( .A(n1604), .B(n2358), .Y(n2220) );
  NAND2X1 U2101 ( .A(n2622), .B(n1951), .Y(n1952) );
  MX2XL U2102 ( .A(flatten_arr1[1]), .B(n2325), .S0(n1574), .Y(n923) );
  MX2XL U2103 ( .A(n2325), .B(flatten_arr2_3__1_), .S0(n2423), .Y(n909) );
  MX2XL U2104 ( .A(n2325), .B(quant_conv1[1]), .S0(n2189), .Y(n1001) );
  MX2XL U2105 ( .A(flatten_arr1[2]), .B(sdiv_result[2]), .S0(n1573), .Y(n927)
         );
  MX2XL U2106 ( .A(sdiv_result[2]), .B(flatten_arr2_3__2_), .S0(n2423), .Y(
        n910) );
  MX2XL U2107 ( .A(sdiv_result[2]), .B(quant_conv1[2]), .S0(n2189), .Y(n1002)
         );
  NAND2BX1 U2108 ( .AN(n1210), .B(conv1_result[15]), .Y(n1714) );
  NAND2BX1 U2109 ( .AN(n1210), .B(conv1_result[16]), .Y(n1702) );
  OR2X1 U2110 ( .A(n2646), .B(n1210), .Y(n1693) );
  NAND2BX1 U2111 ( .AN(n1210), .B(conv1_result[12]), .Y(n1795) );
  NAND2BX1 U2112 ( .AN(n1210), .B(conv1_result[13]), .Y(n1787) );
  NAND2BX1 U2113 ( .AN(n1210), .B(conv1_result[14]), .Y(n1777) );
  MX2XL U2114 ( .A(n1354), .B(flatten_arr2_3__5_), .S0(n2423), .Y(n913) );
  MX2XL U2115 ( .A(flatten_arr1[5]), .B(n1354), .S0(n1574), .Y(n939) );
  MX2XL U2116 ( .A(n1354), .B(quant_conv1[5]), .S0(n2189), .Y(n1005) );
  NAND2BX1 U2117 ( .AN(n1570), .B(conv1_result[9]), .Y(n1913) );
  NAND2BX1 U2118 ( .AN(n1570), .B(conv1_result[10]), .Y(n1903) );
  NAND2BX1 U2119 ( .AN(n1570), .B(conv1_result[11]), .Y(n1889) );
  INVX2 U2120 ( .A(n1663), .Y(n1024) );
  AOI222XL U2121 ( .A0(conv1_result[16]), .A1(n2182), .B0(ssum2_out[16]), .B1(
        n2181), .C0(sum9_out[16]), .C1(n1571), .Y(n1663) );
  OR2XL U2122 ( .A(n1405), .B(n1620), .Y(n2233) );
  OAI221X1 U2123 ( .A0(n2310), .A1(n2309), .B0(n1437), .B1(n2308), .C0(n2307), 
        .Y(smult_a[64]) );
  OAI2BB1X1 U2124 ( .A0N(sum9_out[18]), .A1N(n1571), .B0(n1634), .Y(n1026) );
  OR2XL U2125 ( .A(n2647), .B(n1660), .Y(n1634) );
  OAI221X1 U2126 ( .A0(n2310), .A1(n2261), .B0(n1437), .B1(n2304), .C0(n2260), 
        .Y(smult_a[56]) );
  OAI2BB1X1 U2127 ( .A0N(sum9_out[19]), .A1N(n2180), .B0(n1631), .Y(n1027) );
  OR2XL U2128 ( .A(n2648), .B(n1660), .Y(n1631) );
  OAI221X1 U2129 ( .A0(n2310), .A1(n2297), .B0(n1437), .B1(n2296), .C0(n2295), 
        .Y(smult_a[66]) );
  OAI221X1 U2130 ( .A0(n2310), .A1(n2292), .B0(n1437), .B1(n2291), .C0(n2290), 
        .Y(smult_a[67]) );
  INVX2 U2131 ( .A(n1664), .Y(n1023) );
  AOI222XL U2132 ( .A0(conv1_result[15]), .A1(n2182), .B0(ssum2_out[15]), .B1(
        n2181), .C0(sum9_out[15]), .C1(n2180), .Y(n1664) );
  OAI221X1 U2133 ( .A0(n2310), .A1(n2253), .B0(n1437), .B1(n2293), .C0(n2252), 
        .Y(smult_a[58]) );
  OAI221X1 U2134 ( .A0(n2310), .A1(n2302), .B0(n1437), .B1(n2301), .C0(n2300), 
        .Y(smult_a[65]) );
  INVX2 U2135 ( .A(n2235), .Y(n2310) );
  OAI221X1 U2136 ( .A0(n2310), .A1(n2250), .B0(n1437), .B1(n2288), .C0(n2249), 
        .Y(smult_a[59]) );
  BUFX2 U2137 ( .A(n2306), .Y(n1572) );
  OAI2BB1X1 U2138 ( .A0N(n2205), .A1N(n2231), .B0(n2204), .Y(n2306) );
  OAI2BB1X1 U2139 ( .A0N(sum9_out[17]), .A1N(n2180), .B0(n1659), .Y(n1025) );
  OAI221X1 U2140 ( .A0(n2310), .A1(n2256), .B0(n1437), .B1(n2298), .C0(n2255), 
        .Y(smult_a[57]) );
  OAI221X1 U2141 ( .A0(n2310), .A1(n2287), .B0(n1437), .B1(n2286), .C0(n2285), 
        .Y(smult_a[68]) );
  OR2X1 U2142 ( .A(n2266), .B(n1360), .Y(n1628) );
  OAI221X1 U2143 ( .A0(n2310), .A1(n2247), .B0(n1437), .B1(n2283), .C0(n2246), 
        .Y(smult_a[60]) );
  OR2X1 U2144 ( .A(n1381), .B(n1643), .Y(n2204) );
  OAI221X1 U2145 ( .A0(n2310), .A1(n2282), .B0(n1437), .B1(n2281), .C0(n2280), 
        .Y(smult_a[69]) );
  INVX2 U2146 ( .A(n1722), .Y(n1022) );
  AOI222XL U2147 ( .A0(conv1_result[14]), .A1(n2182), .B0(ssum2_out[14]), .B1(
        n2181), .C0(sum9_out[14]), .C1(n1571), .Y(n1722) );
  OAI221X1 U2148 ( .A0(n2310), .A1(n2244), .B0(n1437), .B1(n2278), .C0(n2243), 
        .Y(smult_a[61]) );
  OAI221X1 U2149 ( .A0(n2310), .A1(n2277), .B0(n1437), .B1(n2276), .C0(n2275), 
        .Y(smult_a[70]) );
  OAI221X1 U2150 ( .A0(n2310), .A1(n2241), .B0(n1437), .B1(n2273), .C0(n2240), 
        .Y(smult_a[62]) );
  INVX2 U2151 ( .A(n1723), .Y(n1021) );
  AOI222XL U2152 ( .A0(conv1_result[13]), .A1(n2182), .B0(ssum2_out[13]), .B1(
        n2181), .C0(sum9_out[13]), .C1(n2180), .Y(n1723) );
  OAI221X1 U2153 ( .A0(n2310), .A1(n2272), .B0(n1437), .B1(n2271), .C0(n2270), 
        .Y(smult_a[71]) );
  OAI221X1 U2154 ( .A0(n2310), .A1(n2238), .B0(n1437), .B1(n2268), .C0(n2237), 
        .Y(smult_a[63]) );
  INVX2 U2155 ( .A(n1724), .Y(n1020) );
  AOI222XL U2156 ( .A0(conv1_result[12]), .A1(n2182), .B0(ssum2_out[12]), .B1(
        n2181), .C0(sum9_out[12]), .C1(n1571), .Y(n1724) );
  NAND2BX1 U2157 ( .AN(n1570), .B(conv1_result[6]), .Y(n2053) );
  NAND2BX1 U2158 ( .AN(n1570), .B(conv1_result[7]), .Y(n2042) );
  INVX2 U2159 ( .A(n1803), .Y(n1019) );
  AOI222XL U2160 ( .A0(conv1_result[11]), .A1(n2182), .B0(ssum2_out[11]), .B1(
        n2181), .C0(sum9_out[11]), .C1(n2180), .Y(n1803) );
  INVX2 U2161 ( .A(n1930), .Y(n2477) );
  INVX2 U2162 ( .A(n1804), .Y(n1018) );
  AOI222XL U2163 ( .A0(conv1_result[10]), .A1(n2182), .B0(ssum2_out[10]), .B1(
        n2181), .C0(sum9_out[10]), .C1(n1571), .Y(n1804) );
  INVX2 U2164 ( .A(n1805), .Y(n1017) );
  AOI222XL U2165 ( .A0(conv1_result[9]), .A1(n2182), .B0(ssum2_out[9]), .B1(
        n2181), .C0(sum9_out[9]), .C1(n2180), .Y(n1805) );
  INVX2 U2166 ( .A(pooled_arr[0]), .Y(n2261) );
  INVX2 U2167 ( .A(pooled_arr[2]), .Y(n2253) );
  INVX2 U2168 ( .A(pooled_arr[3]), .Y(n2250) );
  INVX2 U2169 ( .A(pooled_arr[1]), .Y(n2256) );
  INVX2 U2170 ( .A(n1929), .Y(n1016) );
  AOI222XL U2171 ( .A0(conv1_result[8]), .A1(n2182), .B0(ssum2_out[8]), .B1(
        n2181), .C0(sum9_out[8]), .C1(n1571), .Y(n1929) );
  INVX2 U2172 ( .A(pooled_arr[4]), .Y(n2247) );
  INVX2 U2173 ( .A(pooled_arr[5]), .Y(n2244) );
  INVX2 U2174 ( .A(n1931), .Y(n1015) );
  AOI222XL U2175 ( .A0(conv1_result[7]), .A1(n2182), .B0(ssum2_out[7]), .B1(
        n2181), .C0(sum9_out[7]), .C1(n2180), .Y(n1931) );
  INVX2 U2176 ( .A(pooled_arr[6]), .Y(n2241) );
  INVX2 U2177 ( .A(pooled_arr[7]), .Y(n2238) );
  INVX2 U2178 ( .A(n1932), .Y(n1014) );
  AOI222XL U2179 ( .A0(conv1_result[6]), .A1(n2182), .B0(ssum2_out[6]), .B1(
        n2181), .C0(sum9_out[6]), .C1(n1571), .Y(n1932) );
  NAND2X1 U2180 ( .A(n1622), .B(n1621), .Y(ns[0]) );
  AOI221XL U2181 ( .A0(n2222), .A1(n1627), .B0(n2221), .B1(n1623), .C0(n1619), 
        .Y(n1622) );
  OAI32XL U2182 ( .A0(n1628), .A1(n2386), .A2(n2320), .B0(n1605), .B1(n2390), 
        .Y(n1619) );
  OAI221X1 U2183 ( .A0(flatten_arr2_3__1_), .A1(n2373), .B0(n2456), .B1(n2462), 
        .C0(n2378), .Y(n2374) );
  AND2X1 U2184 ( .A(n2456), .B(n2462), .Y(n2373) );
  OAI221X1 U2185 ( .A0(flatten_arr1[26]), .A1(n2372), .B0(flatten_arr1[27]), 
        .B1(n1471), .C0(n2371), .Y(n2378) );
  AND2X1 U2186 ( .A(flatten_arr1[27]), .B(n2413), .Y(n2372) );
  INVX2 U2187 ( .A(flatten_arr2_3__2_), .Y(n2417) );
  AND2X1 U2188 ( .A(n1604), .B(n2428), .Y(smin_a[0]) );
  OAI221X1 U2189 ( .A0(n2427), .A1(n2426), .B0(n2425), .B1(n2429), .C0(n2424), 
        .Y(n2428) );
  AOI222XL U2190 ( .A0(n1271), .A1(flatten_arr1[24]), .B0(n1457), .B1(
        flatten_arr1[16]), .C0(n1456), .C1(flatten_arr1[8]), .Y(n2424) );
  OAI2BB1X1 U2191 ( .A0N(flatten_arr1[31]), .A1N(n2397), .B0(n2383), .Y(n2388)
         );
  OAI221X1 U2192 ( .A0(flatten_arr1[30]), .A1(n2401), .B0(flatten_arr1[31]), 
        .B1(n2397), .C0(n2382), .Y(n2383) );
  OAI221X1 U2193 ( .A0(flatten_arr2_3__5_), .A1(n2440), .B0(flatten_arr2_3__6_), .B1(n2436), .C0(n2381), .Y(n2382) );
  AOI31X1 U2194 ( .A0(flatten_arr1[28]), .A1(n2409), .A2(n2380), .B0(n2379), 
        .Y(n2381) );
  AOI211X1 U2195 ( .A0(n2378), .A1(n2377), .B0(n2376), .C0(n2375), .Y(n2379)
         );
  OAI22X1 U2196 ( .A0(flatten_arr1[27]), .A1(n2413), .B0(flatten_arr1[26]), 
        .B1(n2417), .Y(n2377) );
  INVX2 U2197 ( .A(n2380), .Y(n2375) );
  OAI2BB1X1 U2198 ( .A0N(flatten_arr2_3__4_), .A1N(n2444), .B0(n2374), .Y(
        n2376) );
  OAI221X1 U2199 ( .A0(n2427), .A1(n2421), .B0(n2420), .B1(n2429), .C0(n2419), 
        .Y(n2422) );
  INVX2 U2200 ( .A(flatten_arr2_3__1_), .Y(n2421) );
  AOI222XL U2201 ( .A0(n1271), .A1(flatten_arr1[25]), .B0(n1457), .B1(
        flatten_arr1[17]), .C0(n1456), .C1(flatten_arr1[9]), .Y(n2419) );
  INVX2 U2202 ( .A(flatten_arr2_3__3_), .Y(n2413) );
  NOR2X1 U2203 ( .A(flatten_arr2_3__3_), .B(flatten_arr2_3__2_), .Y(n1471) );
  INVX2 U2204 ( .A(n2388), .Y(n2389) );
  AND2X1 U2205 ( .A(n1604), .B(n2465), .Y(smin_b[0]) );
  OAI221X1 U2206 ( .A0(n2464), .A1(n2463), .B0(n2462), .B1(n2461), .C0(n2460), 
        .Y(n2465) );
  AOI222XL U2207 ( .A0(n1459), .A1(flatten_arr1[8]), .B0(flatten_arr2_3__0_), 
        .B1(n2459), .C0(n1458), .C1(flatten_arr1[0]), .Y(n2460) );
  INVX2 U2208 ( .A(flatten_arr1[24]), .Y(n2462) );
  AND2X1 U2209 ( .A(n1604), .B(n2458), .Y(smin_b[1]) );
  OAI221X1 U2210 ( .A0(n2457), .A1(n2463), .B0(n2456), .B1(n2461), .C0(n2455), 
        .Y(n2458) );
  AOI222XL U2211 ( .A0(n1459), .A1(flatten_arr1[9]), .B0(flatten_arr2_3__1_), 
        .B1(n2459), .C0(n1458), .C1(flatten_arr1[1]), .Y(n2455) );
  INVX2 U2212 ( .A(flatten_arr1[25]), .Y(n2456) );
  OAI2BB1X1 U2213 ( .A0N(flatten_arr1[7]), .A1N(n2397), .B0(n2338), .Y(n2385)
         );
  OAI221X1 U2214 ( .A0(flatten_arr1[6]), .A1(n2401), .B0(flatten_arr1[7]), 
        .B1(n2397), .C0(n2337), .Y(n2338) );
  OAI221X1 U2215 ( .A0(flatten_arr2_3__5_), .A1(n2404), .B0(flatten_arr2_3__6_), .B1(n2400), .C0(n2336), .Y(n2337) );
  AOI31X1 U2216 ( .A0(flatten_arr1[4]), .A1(n2409), .A2(n2335), .B0(n2334), 
        .Y(n2336) );
  AND2X1 U2217 ( .A(flatten_arr1[3]), .B(n2413), .Y(n2329) );
  AOI221XL U2218 ( .A0(n2333), .A1(n2332), .B0(flatten_arr2_3__4_), .B1(n2408), 
        .C0(n2331), .Y(n2334) );
  OAI2BB1X1 U2219 ( .A0N(n2420), .A1N(n2425), .B0(n2328), .Y(n2333) );
  OAI2BB1X1 U2220 ( .A0N(n2330), .A1N(n2332), .B0(n2335), .Y(n2331) );
  OAI221X1 U2221 ( .A0(flatten_arr1[2]), .A1(n2329), .B0(flatten_arr1[3]), 
        .B1(n1471), .C0(n2371), .Y(n2332) );
  OAI221X1 U2222 ( .A0(n2427), .A1(n2417), .B0(n2416), .B1(n2429), .C0(n2415), 
        .Y(n2418) );
  INVX2 U2223 ( .A(flatten_arr1[2]), .Y(n2416) );
  AOI222XL U2224 ( .A0(n1271), .A1(flatten_arr1[26]), .B0(n1457), .B1(
        flatten_arr1[18]), .C0(n1456), .C1(flatten_arr1[10]), .Y(n2415) );
  OAI2BB1X1 U2225 ( .A0N(flatten_arr1[0]), .A1N(flatten_arr1[1]), .B0(
        flatten_arr2_3__1_), .Y(n2328) );
  INVX2 U2226 ( .A(n2066), .Y(n1013) );
  AOI222XL U2227 ( .A0(conv1_result[5]), .A1(n2182), .B0(ssum2_out[5]), .B1(
        n2181), .C0(sum9_out[5]), .C1(n2180), .Y(n2066) );
  OAI221X1 U2228 ( .A0(flatten_arr1[10]), .A1(n2340), .B0(flatten_arr1[11]), 
        .B1(n1471), .C0(n2371), .Y(n2348) );
  AND2X1 U2229 ( .A(flatten_arr1[11]), .B(n2413), .Y(n2340) );
  OAI2BB1X1 U2230 ( .A0N(flatten_arr1[15]), .A1N(n2397), .B0(n2356), .Y(n2393)
         );
  OAI221X1 U2231 ( .A0(flatten_arr1[14]), .A1(n2401), .B0(flatten_arr1[15]), 
        .B1(n2397), .C0(n2355), .Y(n2356) );
  OAI221X1 U2232 ( .A0(flatten_arr2_3__5_), .A1(n2354), .B0(flatten_arr2_3__6_), .B1(n2353), .C0(n2352), .Y(n2355) );
  INVX2 U2233 ( .A(flatten_arr1[13]), .Y(n2354) );
  OAI2BB1X1 U2234 ( .A0N(flatten_arr2_3__4_), .A1N(n2345), .B0(n2344), .Y(
        n2347) );
  INVX2 U2235 ( .A(flatten_arr1[12]), .Y(n2345) );
  OAI221X1 U2236 ( .A0(flatten_arr2_3__1_), .A1(n2343), .B0(n2342), .B1(n2341), 
        .C0(n2348), .Y(n2344) );
  AND2X1 U2237 ( .A(n2342), .B(n2341), .Y(n2343) );
  AOI31X1 U2238 ( .A0(flatten_arr1[12]), .A1(n2409), .A2(n2351), .B0(n2350), 
        .Y(n2352) );
  AOI211X1 U2239 ( .A0(n2349), .A1(n2348), .B0(n2347), .C0(n2346), .Y(n2350)
         );
  OAI22X1 U2240 ( .A0(flatten_arr1[11]), .A1(n2413), .B0(flatten_arr1[10]), 
        .B1(n2417), .Y(n2349) );
  INVX2 U2241 ( .A(n2351), .Y(n2346) );
  INVX2 U2242 ( .A(flatten_arr2_3__5_), .Y(n2405) );
  OR2X1 U2243 ( .A(flatten_arr1[29]), .B(n2405), .Y(n2380) );
  OAI221X1 U2244 ( .A0(flatten_arr2_3__1_), .A1(n2360), .B0(n2457), .B1(n2464), 
        .C0(n2365), .Y(n2361) );
  AND2X1 U2245 ( .A(n2457), .B(n2464), .Y(n2360) );
  OAI221X1 U2246 ( .A0(flatten_arr1[18]), .A1(n2359), .B0(flatten_arr1[19]), 
        .B1(n1471), .C0(n2371), .Y(n2365) );
  AND2X1 U2247 ( .A(flatten_arr1[19]), .B(n2413), .Y(n2359) );
  OAI2BB1X1 U2248 ( .A0N(flatten_arr1[23]), .A1N(n2397), .B0(n2370), .Y(n2391)
         );
  OAI221X1 U2249 ( .A0(flatten_arr1[22]), .A1(n2401), .B0(flatten_arr1[23]), 
        .B1(n2397), .C0(n2369), .Y(n2370) );
  OAI221X1 U2250 ( .A0(flatten_arr2_3__5_), .A1(n2441), .B0(flatten_arr2_3__6_), .B1(n2437), .C0(n2368), .Y(n2369) );
  AOI31X1 U2251 ( .A0(flatten_arr1[20]), .A1(n2367), .A2(n2409), .B0(n2366), 
        .Y(n2368) );
  AOI211X1 U2252 ( .A0(n2365), .A1(n2364), .B0(n2363), .C0(n2362), .Y(n2366)
         );
  OAI22X1 U2253 ( .A0(flatten_arr1[19]), .A1(n2413), .B0(flatten_arr1[18]), 
        .B1(n2417), .Y(n2364) );
  INVX2 U2254 ( .A(n2367), .Y(n2362) );
  OAI2BB1X1 U2255 ( .A0N(flatten_arr2_3__4_), .A1N(n2445), .B0(n2361), .Y(
        n2363) );
  INVX2 U2256 ( .A(n2069), .Y(n2472) );
  OAI22X1 U2257 ( .A0(flatten_arr1[3]), .A1(n2413), .B0(flatten_arr1[2]), .B1(
        n2417), .Y(n2330) );
  OR2X1 U2258 ( .A(flatten_arr1[5]), .B(n2405), .Y(n2335) );
  OAI221X1 U2259 ( .A0(n2463), .A1(n2453), .B0(n2461), .B1(n2452), .C0(n2451), 
        .Y(n2454) );
  INVX2 U2260 ( .A(flatten_arr1[18]), .Y(n2453) );
  INVX2 U2261 ( .A(flatten_arr1[26]), .Y(n2452) );
  AOI222XL U2262 ( .A0(flatten_arr1[10]), .A1(n1459), .B0(flatten_arr2_3__2_), 
        .B1(n2459), .C0(flatten_arr1[2]), .C1(n1458), .Y(n2451) );
  INVX2 U2263 ( .A(flatten_arr1[28]), .Y(n2444) );
  OAI221X1 U2264 ( .A0(n2427), .A1(n2413), .B0(n2412), .B1(n2429), .C0(n2411), 
        .Y(n2414) );
  INVX2 U2265 ( .A(flatten_arr1[3]), .Y(n2412) );
  AOI222XL U2266 ( .A0(n1271), .A1(flatten_arr1[27]), .B0(n1457), .B1(
        flatten_arr1[19]), .C0(n1456), .C1(flatten_arr1[11]), .Y(n2411) );
  NAND2BX1 U2267 ( .AN(n1570), .B(conv1_result[4]), .Y(n2163) );
  INVX2 U2268 ( .A(n2067), .Y(n1012) );
  AOI222XL U2269 ( .A0(conv1_result[4]), .A1(n2182), .B0(ssum2_out[4]), .B1(
        n2181), .C0(sum9_out[4]), .C1(n1571), .Y(n2067) );
  OR2X1 U2270 ( .A(flatten_arr1[13]), .B(n2405), .Y(n2351) );
  OAI221X1 U2271 ( .A0(n2449), .A1(n2463), .B0(n2448), .B1(n2461), .C0(n2447), 
        .Y(n2450) );
  INVX2 U2272 ( .A(flatten_arr1[19]), .Y(n2449) );
  INVX2 U2273 ( .A(flatten_arr1[27]), .Y(n2448) );
  AOI222XL U2274 ( .A0(n1459), .A1(flatten_arr1[11]), .B0(flatten_arr2_3__3_), 
        .B1(n2459), .C0(n1458), .C1(flatten_arr1[3]), .Y(n2447) );
  INVX2 U2275 ( .A(flatten_arr1[1]), .Y(n2420) );
  INVX2 U2276 ( .A(flatten_arr1[8]), .Y(n2341) );
  OR2X1 U2277 ( .A(flatten_arr1[21]), .B(n2405), .Y(n2367) );
  INVX2 U2278 ( .A(flatten_arr1[9]), .Y(n2342) );
  OAI221X1 U2279 ( .A0(n2427), .A1(n2409), .B0(n2408), .B1(n2429), .C0(n2407), 
        .Y(n2410) );
  AOI222XL U2280 ( .A0(n1271), .A1(flatten_arr1[28]), .B0(n1457), .B1(
        flatten_arr1[20]), .C0(n1456), .C1(flatten_arr1[12]), .Y(n2407) );
  MX2X2 U2281 ( .A(N996), .B(L1_sum[8]), .S0(n1474), .Y(n906) );
  INVX2 U2282 ( .A(flatten_arr1[16]), .Y(n2464) );
  INVX2 U2283 ( .A(flatten_arr1[17]), .Y(n2457) );
  INVX2 U2284 ( .A(flatten_arr1[4]), .Y(n2408) );
  OAI221X1 U2285 ( .A0(n2445), .A1(n2463), .B0(n2444), .B1(n2461), .C0(n2443), 
        .Y(n2446) );
  AOI222XL U2286 ( .A0(n1459), .A1(flatten_arr1[12]), .B0(flatten_arr2_3__4_), 
        .B1(n2459), .C0(n1458), .C1(flatten_arr1[4]), .Y(n2443) );
  NAND2BX1 U2287 ( .AN(n1570), .B(conv1_result[5]), .Y(n2156) );
  OAI221X1 U2288 ( .A0(n2427), .A1(n2405), .B0(n2404), .B1(n2429), .C0(n2403), 
        .Y(n2406) );
  AOI222XL U2289 ( .A0(n1271), .A1(flatten_arr1[29]), .B0(n1457), .B1(
        flatten_arr1[21]), .C0(n1456), .C1(flatten_arr1[13]), .Y(n2403) );
  MX2X2 U2290 ( .A(N995), .B(L1_sum[7]), .S0(n1474), .Y(n905) );
  INVX2 U2291 ( .A(flatten_arr2_3__4_), .Y(n2409) );
  INVX2 U2292 ( .A(flatten_arr1[20]), .Y(n2445) );
  INVX2 U2293 ( .A(n2068), .Y(n1011) );
  AOI222XL U2294 ( .A0(conv1_result[3]), .A1(n2182), .B0(ssum2_out[3]), .B1(
        n2181), .C0(sum9_out[3]), .C1(n2180), .Y(n2068) );
  INVX2 U2295 ( .A(flatten_arr1[30]), .Y(n2436) );
  OAI221X1 U2296 ( .A0(n2441), .A1(n2463), .B0(n2440), .B1(n2461), .C0(n2439), 
        .Y(n2442) );
  AOI222XL U2297 ( .A0(n1459), .A1(flatten_arr1[13]), .B0(flatten_arr2_3__5_), 
        .B1(n2459), .C0(n1458), .C1(flatten_arr1[5]), .Y(n2439) );
  INVX2 U2298 ( .A(flatten_arr1[29]), .Y(n2440) );
  MX2X2 U2299 ( .A(N994), .B(L1_sum[6]), .S0(n1474), .Y(n904) );
  OAI221X1 U2300 ( .A0(n2427), .A1(n2401), .B0(n2400), .B1(n2429), .C0(n2399), 
        .Y(n2402) );
  AOI222XL U2301 ( .A0(n1271), .A1(flatten_arr1[30]), .B0(n1457), .B1(
        flatten_arr1[22]), .C0(n1456), .C1(flatten_arr1[14]), .Y(n2399) );
  INVX2 U2302 ( .A(flatten_arr2_3__6_), .Y(n2401) );
  OAI221X1 U2303 ( .A0(n2437), .A1(n2463), .B0(n2436), .B1(n2461), .C0(n2435), 
        .Y(n2438) );
  AOI222XL U2304 ( .A0(n1459), .A1(flatten_arr1[14]), .B0(flatten_arr2_3__6_), 
        .B1(n2459), .C0(n1458), .C1(flatten_arr1[6]), .Y(n2435) );
  INVX2 U2305 ( .A(flatten_arr2_3__7_), .Y(n2397) );
  INVX2 U2306 ( .A(n2176), .Y(n1010) );
  AOI222XL U2307 ( .A0(n2182), .A1(conv1_result[2]), .B0(ssum2_out[2]), .B1(
        n2181), .C0(sum9_out[2]), .C1(n1571), .Y(n2176) );
  MX2X2 U2308 ( .A(N993), .B(L1_sum[5]), .S0(n1474), .Y(n903) );
  INVX2 U2309 ( .A(flatten_arr1[6]), .Y(n2400) );
  INVX2 U2310 ( .A(flatten_arr1[5]), .Y(n2404) );
  OAI221X1 U2311 ( .A0(n2427), .A1(n2397), .B0(n2396), .B1(n2429), .C0(n2395), 
        .Y(n2398) );
  INVX2 U2312 ( .A(flatten_arr1[7]), .Y(n2396) );
  AOI222XL U2313 ( .A0(n1271), .A1(flatten_arr1[31]), .B0(n1457), .B1(
        flatten_arr1[23]), .C0(n1456), .C1(flatten_arr1[15]), .Y(n2395) );
  OAI221X1 U2314 ( .A0(n2433), .A1(n2463), .B0(n2432), .B1(n2461), .C0(n2431), 
        .Y(n2434) );
  INVX2 U2315 ( .A(flatten_arr1[23]), .Y(n2433) );
  INVX2 U2316 ( .A(flatten_arr1[31]), .Y(n2432) );
  AOI222XL U2317 ( .A0(n1459), .A1(flatten_arr1[15]), .B0(flatten_arr2_3__7_), 
        .B1(n2459), .C0(n1458), .C1(flatten_arr1[7]), .Y(n2431) );
  MX2X2 U2318 ( .A(N992), .B(L1_sum[4]), .S0(n1474), .Y(n902) );
  INVX2 U2319 ( .A(flatten_arr1[14]), .Y(n2353) );
  INVX2 U2320 ( .A(n2178), .Y(n1009) );
  AOI222XL U2321 ( .A0(n2182), .A1(conv1_result[1]), .B0(ssum2_out[1]), .B1(
        n2181), .C0(sum9_out[1]), .C1(n2180), .Y(n2178) );
  INVX2 U2322 ( .A(flatten_arr1[22]), .Y(n2437) );
  INVX2 U2323 ( .A(flatten_arr1[21]), .Y(n2441) );
  MX2X2 U2324 ( .A(N991), .B(L1_sum[3]), .S0(n1474), .Y(n901) );
  MX2X2 U2325 ( .A(N990), .B(L1_sum[2]), .S0(n1474), .Y(n900) );
  INVX2 U2326 ( .A(n2183), .Y(n1008) );
  AOI222XL U2327 ( .A0(n2182), .A1(conv1_result[0]), .B0(ssum2_out[0]), .B1(
        n2181), .C0(sum9_out[0]), .C1(n1571), .Y(n2183) );
  MX2X2 U2328 ( .A(N989), .B(L1_sum[1]), .S0(n1474), .Y(n899) );
  MX2X2 U2329 ( .A(N988), .B(L1_sum[0]), .S0(n1474), .Y(n898) );
  INVX2 U2330 ( .A(n2184), .Y(n2469) );
  OAI22X1 U2331 ( .A0(n2640), .A1(n1963), .B0(n2632), .B1(n1272), .Y(n1937) );
  OAI22X1 U2332 ( .A0(n2185), .A1(n2190), .B0(n2631), .B1(n1462), .Y(n993) );
  OAI22X1 U2333 ( .A0(n2186), .A1(n2190), .B0(n2632), .B1(n1462), .Y(n992) );
  OAI22X1 U2334 ( .A0(n2200), .A1(n2190), .B0(n2633), .B1(n1462), .Y(n991) );
  OAI22X1 U2335 ( .A0(n2198), .A1(n2190), .B0(n2634), .B1(n1462), .Y(n990) );
  OAI22X1 U2336 ( .A0(n2195), .A1(n2190), .B0(n2635), .B1(n1462), .Y(n989) );
  OAI22X1 U2337 ( .A0(n2193), .A1(n2190), .B0(n2636), .B1(n1462), .Y(n988) );
  OAI22X1 U2338 ( .A0(n2188), .A1(n2191), .B0(n2637), .B1(n1461), .Y(n987) );
  OAI22X1 U2339 ( .A0(n2185), .A1(n2191), .B0(n2639), .B1(n1461), .Y(n985) );
  OAI22X1 U2340 ( .A0(n2186), .A1(n2191), .B0(n2640), .B1(n1461), .Y(n984) );
  OAI22X1 U2341 ( .A0(n2200), .A1(n2191), .B0(n2641), .B1(n1461), .Y(n983) );
  OAI22X1 U2342 ( .A0(n2198), .A1(n2191), .B0(n2642), .B1(n1461), .Y(n982) );
  OAI22X1 U2343 ( .A0(n2195), .A1(n2191), .B0(n2643), .B1(n1461), .Y(n981) );
  OAI22X1 U2344 ( .A0(n2193), .A1(n2191), .B0(n2644), .B1(n1461), .Y(n980) );
  OAI22X1 U2345 ( .A0(n2188), .A1(n2190), .B0(n2645), .B1(n1462), .Y(n995) );
  NAND2X1 U2346 ( .A(n2534), .B(n1950), .Y(scmp_result) );
  OAI221X1 U2347 ( .A0(n1949), .A1(n1948), .B0(quant_conv1[4]), .B1(n1947), 
        .C0(n1946), .Y(n1950) );
  INVX2 U2348 ( .A(n2202), .Y(n2503) );
  OR2X1 U2349 ( .A(pool_cnt[2]), .B(n2189), .Y(n2228) );
  AND2X1 U2350 ( .A(n2186), .B(n1937), .Y(n1472) );
  INVX2 U2351 ( .A(n2228), .Y(n1936) );
  OAI22X1 U2352 ( .A0(n2190), .A1(n2187), .B0(n2630), .B1(n1462), .Y(n994) );
  OAI22X1 U2353 ( .A0(n2191), .A1(n2187), .B0(n2638), .B1(n1461), .Y(n986) );
  INVX2 U2354 ( .A(n2179), .Y(n2470) );
  OAI22X1 U2355 ( .A0(n2639), .A1(n1963), .B0(n2631), .B1(n1272), .Y(n1938) );
  INVX2 U2356 ( .A(n2177), .Y(n2471) );
  OAI22X1 U2357 ( .A0(n2644), .A1(n1963), .B0(n2636), .B1(n1272), .Y(n2194) );
  NAND2X1 U2358 ( .A(n2193), .B(n2194), .Y(n2192) );
  NAND3X1 U2359 ( .A(n2627), .B(n2530), .C(n1951), .Y(n1963) );
  OAI22X1 U2360 ( .A0(n2642), .A1(n1963), .B0(n2634), .B1(n1272), .Y(n2199) );
  AND2X1 U2361 ( .A(n2198), .B(n2199), .Y(n1473) );
  OAI221X1 U2362 ( .A0(n2645), .A1(n1272), .B0(n2637), .B1(n1963), .C0(
        quant_conv1[0]), .Y(n1943) );
  OAI22X1 U2363 ( .A0(n2638), .A1(n1963), .B0(n2630), .B1(n1272), .Y(n1942) );
  OAI22X1 U2364 ( .A0(n2643), .A1(n1963), .B0(n2635), .B1(n1272), .Y(n2196) );
  OAI22X1 U2365 ( .A0(n2641), .A1(n1963), .B0(n2633), .B1(n1272), .Y(n2201) );
  AOI21X1 U2366 ( .A0(n2185), .A1(n1938), .B0(n1472), .Y(n1949) );
  INVX2 U2367 ( .A(pool_cnt[2]), .Y(n2530) );
  INVX2 U2368 ( .A(pool_cnt[3]), .Y(n2531) );
  INVX2 U2369 ( .A(pool_cnt[0]), .Y(n2505) );
  AND3X2 U2370 ( .A(n2317), .B(n2316), .C(n2315), .Y(n1474) );
  OAI222X1 U2371 ( .A0(n2630), .A1(n2258), .B0(n2638), .B1(n2257), .C0(n2303), 
        .C1(n2256), .Y(n955) );
  OAI222X1 U2372 ( .A0(n2631), .A1(n2258), .B0(n2639), .B1(n2257), .C0(n2303), 
        .C1(n2253), .Y(n959) );
  OAI222X1 U2373 ( .A0(n2632), .A1(n2258), .B0(n2640), .B1(n2257), .C0(n2303), 
        .C1(n2250), .Y(n963) );
  OAI222X1 U2374 ( .A0(n2633), .A1(n2258), .B0(n2641), .B1(n2257), .C0(n2303), 
        .C1(n2247), .Y(n967) );
  OAI222X1 U2375 ( .A0(n2634), .A1(n2258), .B0(n2642), .B1(n2257), .C0(n2303), 
        .C1(n2244), .Y(n971) );
  OAI222X1 U2376 ( .A0(n2635), .A1(n2258), .B0(n2643), .B1(n2257), .C0(n2303), 
        .C1(n2241), .Y(n975) );
  OAI222X1 U2377 ( .A0(n2636), .A1(n2258), .B0(n2644), .B1(n2257), .C0(n2303), 
        .C1(n2238), .Y(n979) );
  OAI222X1 U2378 ( .A0(n2645), .A1(n2258), .B0(n2637), .B1(n2257), .C0(n2303), 
        .C1(n2261), .Y(n951) );
  OR2X1 U2379 ( .A(pool_cnt[1]), .B(n2229), .Y(n2258) );
  OAI32XL U2380 ( .A0(n1959), .A1(n1383), .A2(n2221), .B0(n2620), .B1(n2531), 
        .Y(n2211) );
  AND2X1 U2381 ( .A(n2223), .B(n1958), .Y(n1959) );
  OAI2BB1X1 U2382 ( .A0N(n2212), .A1N(n2211), .B0(n2210), .Y(n2621) );
  OAI2BB1X1 U2383 ( .A0N(n1463), .A1N(pool_cnt[2]), .B0(n2531), .Y(n2210) );
  OR2XL U2384 ( .A(n1381), .B(n1615), .Y(n1618) );
  OAI2BB1X1 U2385 ( .A0N(n2620), .A1N(n2209), .B0(n2212), .Y(n2619) );
  OAI2BB1X1 U2386 ( .A0N(N194), .A1N(n1615), .B0(n1610), .Y(n1168) );
  OR2XL U2387 ( .A(n1400), .B(n1618), .Y(n1610) );
  OAI2BB1X1 U2388 ( .A0N(N198), .A1N(n1615), .B0(n1607), .Y(n1164) );
  OR2XL U2389 ( .A(n1405), .B(n1618), .Y(n1607) );
  OAI2BB1X1 U2390 ( .A0N(N193), .A1N(n1615), .B0(n1611), .Y(n1169) );
  OR2X1 U2391 ( .A(n1360), .B(n1618), .Y(n1611) );
  OAI221XL U2392 ( .A0(n2266), .A1(n1618), .B0(n1617), .B1(n1616), .C0(n2225), 
        .Y(n1170) );
  INVX2 U2393 ( .A(N192), .Y(n1616) );
  INVX2 U2394 ( .A(n1615), .Y(n1617) );
  OAI221X1 U2395 ( .A0(n1962), .A1(n2211), .B0(n2504), .B1(n2212), .C0(n2225), 
        .Y(n998) );
  XOR2X1 U2396 ( .A(n2505), .B(pool_cnt[1]), .Y(n1962) );
  MX2X2 U2397 ( .A(n2209), .B(n1961), .S0(pool_cnt[0]), .Y(n999) );
  INVX2 U2398 ( .A(n2212), .Y(n1961) );
  AND2X1 U2399 ( .A(n1955), .B(n1400), .Y(n1956) );
  OAI2BB1X1 U2400 ( .A0N(n1630), .A1N(n2203), .B0(n1629), .Y(n1661) );
  OR2XL U2401 ( .A(n1359), .B(n1636), .Y(n1630) );
  INVX2 U2402 ( .A(n2218), .Y(n1629) );
  MX2X2 U2403 ( .A(flatten_arr1[8]), .B(flatten_arr1[0]), .S0(n1574), .Y(n918)
         );
  MX2X2 U2404 ( .A(flatten_arr1[27]), .B(flatten_arr1[19]), .S0(n1574), .Y(
        n928) );
  MX2X2 U2405 ( .A(flatten_arr1[25]), .B(flatten_arr1[17]), .S0(n1574), .Y(
        n920) );
  MX2X2 U2406 ( .A(flatten_arr1[17]), .B(flatten_arr1[9]), .S0(n1574), .Y(n921) );
  MX2X2 U2407 ( .A(flatten_arr1[10]), .B(flatten_arr1[2]), .S0(n1574), .Y(n926) );
  MX2X2 U2408 ( .A(flatten_arr1[19]), .B(flatten_arr1[11]), .S0(n1574), .Y(
        n929) );
  MX2X2 U2409 ( .A(flatten_arr1[12]), .B(flatten_arr1[4]), .S0(n1574), .Y(n934) );
  MX2X2 U2410 ( .A(flatten_arr1[29]), .B(flatten_arr1[21]), .S0(n1574), .Y(
        n936) );
  MX2X2 U2411 ( .A(flatten_arr1[21]), .B(flatten_arr1[13]), .S0(n1574), .Y(
        n937) );
  MX2X2 U2412 ( .A(flatten_arr1[30]), .B(flatten_arr1[22]), .S0(n1574), .Y(
        n940) );
  MX2X2 U2413 ( .A(flatten_arr1[22]), .B(flatten_arr1[14]), .S0(n1574), .Y(
        n941) );
  MX2X2 U2414 ( .A(flatten_arr1[15]), .B(flatten_arr1[7]), .S0(n1574), .Y(n946) );
  MX2X2 U2415 ( .A(flatten_arr1[24]), .B(flatten_arr1[16]), .S0(n1573), .Y(
        n916) );
  MX2X2 U2416 ( .A(flatten_arr1[16]), .B(flatten_arr1[8]), .S0(n1573), .Y(n917) );
  MX2X2 U2417 ( .A(flatten_arr1[9]), .B(flatten_arr1[1]), .S0(n1573), .Y(n922)
         );
  MX2X2 U2418 ( .A(flatten_arr1[26]), .B(flatten_arr1[18]), .S0(n1573), .Y(
        n924) );
  MX2X2 U2419 ( .A(flatten_arr1[18]), .B(flatten_arr1[10]), .S0(n1573), .Y(
        n925) );
  MX2X2 U2420 ( .A(flatten_arr1[11]), .B(flatten_arr1[3]), .S0(n1573), .Y(n930) );
  MX2X2 U2421 ( .A(flatten_arr1[28]), .B(flatten_arr1[20]), .S0(n1573), .Y(
        n932) );
  MX2X2 U2422 ( .A(flatten_arr1[20]), .B(flatten_arr1[12]), .S0(n1573), .Y(
        n933) );
  MX2X2 U2423 ( .A(flatten_arr1[13]), .B(flatten_arr1[5]), .S0(n1573), .Y(n938) );
  MX2X2 U2424 ( .A(flatten_arr1[14]), .B(flatten_arr1[6]), .S0(n1573), .Y(n942) );
  MX2X2 U2425 ( .A(flatten_arr1[31]), .B(flatten_arr1[23]), .S0(n1573), .Y(
        n944) );
  MX2X2 U2426 ( .A(flatten_arr1[23]), .B(flatten_arr1[15]), .S0(n1573), .Y(
        n945) );
  NAND2X1 U2427 ( .A(n2215), .B(n2214), .Y(n2216) );
  INVX2 U2428 ( .A(pool_cnt[1]), .Y(n2504) );
  NOR2X1 U2429 ( .A(n1381), .B(n1613), .Y(n1475) );
  INVX2 U2430 ( .A(quant_conv1[0]), .Y(n2188) );
  INVX4 U2431 ( .A(div_82_quotient_14_), .Y(n1732) );
  INVX1 U2432 ( .A(n1504), .Y(n1505) );
  OAI32XL U2433 ( .A0(n2123), .A1(n2324), .A2(n2116), .B0(n2115), .B1(n2324), 
        .Y(n2117) );
  OAI2BB1XL U2434 ( .A0N(div_82_u_div_SumTmp_3__5__3_), .A1N(n1448), .B0(n1684), .Y(n1685) );
  AOI221X1 U2435 ( .A0(div_82_u_div_SumTmp_6__5__5_), .A1(n1709), .B0(
        div_82_u_div_SumTmp_4__5__5_), .B1(n1716), .C0(n1670), .Y(n1675) );
  INVXL U2436 ( .A(n1489), .Y(n1490) );
  INVX1 U2437 ( .A(n1489), .Y(n1491) );
  OAI2BB1X2 U2438 ( .A0N(n2040), .A1N(n1230), .B0(n2039), .Y(n2497) );
  AOI221X1 U2439 ( .A0(div_82_u_div_SumTmp_6__5__3_), .A1(n1709), .B0(
        div_82_u_div_SumTmp_4__5__3_), .B1(n1716), .C0(n1688), .Y(n1689) );
  BUFX2 U2440 ( .A(div_82_u_div_PartRem_1__10_), .Y(n1508) );
  BUFX2 U2441 ( .A(div_82_u_div_PartRem_1__10_), .Y(n1509) );
  INVX2 U2442 ( .A(n1510), .Y(n1512) );
  OAI2BB1X2 U2443 ( .A0N(n1673), .A1N(n1674), .B0(n1672), .Y(n1719) );
  OAI33X1 U2444 ( .A0(div_82_u_div_CryOut_3__6_), .A1(
        div_82_u_div_SumTmp_2__6__0_), .A2(n1656), .B0(n1655), .B1(n1654), 
        .B2(n1656), .Y(n1657) );
  BUFX1 U2445 ( .A(n1450), .Y(n1561) );
  NAND4X1 U2446 ( .A(n2007), .B(n2006), .C(n2005), .D(n2004), .Y(n2014) );
  OAI2BB1X1 U2447 ( .A0N(n2059), .A1N(n1316), .B0(n2057), .Y(n2065) );
  OAI2BB1X1 U2448 ( .A0N(div_82_u_div_SumTmp_2__2__4_), .A1N(n1563), .B0(n2023), .Y(n2024) );
  OAI2BB1X1 U2449 ( .A0N(div_82_u_div_SumTmp_2__2__11_), .A1N(n1563), .B0(
        n1969), .Y(n1970) );
  OAI2BB1X1 U2450 ( .A0N(div_82_u_div_SumTmp_2__2__5_), .A1N(n1563), .B0(n2016), .Y(n2017) );
  OR2XL U2451 ( .A(n2056), .B(n1316), .Y(n2057) );
  OAI2BB1X1 U2452 ( .A0N(div_82_u_div_SumTmp_2__2__3_), .A1N(n1563), .B0(n2030), .Y(n2031) );
  OAI2BB1X2 U2453 ( .A0N(div_82_u_div_SumTmp_2__2__2_), .A1N(n1562), .B0(n2036), .Y(n2040) );
  AOI221XL U2454 ( .A0(div_82_u_div_SumTmp_6__3__4_), .A1(n1432), .B0(
        div_82_u_div_SumTmp_4__3__4_), .B1(n1917), .C0(n1870), .Y(n1872) );
  AOI221XL U2455 ( .A0(div_82_u_div_SumTmp_4__1__11_), .A1(n1409), .B0(
        div_82_u_div_SumTmp_6__1__11_), .B1(n1444), .C0(n2079), .Y(n2080) );
  MX2XL U2456 ( .A(n1413), .B(quant_conv1[7]), .S0(n2189), .Y(n1007) );
  MX2XL U2457 ( .A(n1413), .B(flatten_arr2_3__7_), .S0(n2423), .Y(n915) );
  MX2XL U2458 ( .A(flatten_arr1[7]), .B(n1413), .S0(n1573), .Y(n947) );
  OAI2BB1X1 U2459 ( .A0N(div_82_u_div_SumTmp_3__5__5_), .A1N(n1448), .B0(n1666), .Y(n1667) );
  OAI2BB1X2 U2460 ( .A0N(n1698), .A1N(n1719), .B0(n1697), .Y(n1755) );
  OAI2BB1X1 U2461 ( .A0N(div_82_u_div_SumTmp_2__2__8_), .A1N(n1562), .B0(n1993), .Y(n1997) );
  OAI2BB1X2 U2462 ( .A0N(n1997), .A1N(n1230), .B0(n1996), .Y(
        div_82_u_div_PartRem_2__11_) );
  OAI2BB1X1 U2463 ( .A0N(div_82_u_div_SumTmp_2__5__4_), .A1N(n1448), .B0(n1680), .Y(n1681) );
  OAI2BB1X1 U2464 ( .A0N(div_82_u_div_SumTmp_2__5__3_), .A1N(n1448), .B0(n1687), .Y(n1688) );
  OAI2BB1X1 U2465 ( .A0N(div_82_u_div_SumTmp_3__5__4_), .A1N(n1448), .B0(n1677), .Y(n1678) );
  OAI2BB1X1 U2466 ( .A0N(div_82_u_div_SumTmp_3__5__1_), .A1N(n1448), .B0(n1699), .Y(n1700) );
  OR3X1 U2467 ( .A(n1360), .B(n2314), .C(n2313), .Y(n2315) );
  AOI2BB2X1 U2468 ( .B0(n1572), .B1(n2236), .A0N(n2314), .A1N(n2272), .Y(n2237) );
  AOI2BB2X1 U2469 ( .B0(n1572), .B1(n2269), .A0N(n2314), .A1N(n2268), .Y(n2270) );
  AOI2BB2X1 U2470 ( .B0(n1572), .B1(n2239), .A0N(n2314), .A1N(n2277), .Y(n2240) );
  AOI2BB2X1 U2471 ( .B0(n1572), .B1(n2274), .A0N(n2314), .A1N(n2273), .Y(n2275) );
  AOI2BB2X1 U2472 ( .B0(n1572), .B1(n2242), .A0N(n2314), .A1N(n2282), .Y(n2243) );
  AOI2BB2X1 U2473 ( .B0(n1572), .B1(n2279), .A0N(n2314), .A1N(n2278), .Y(n2280) );
  AOI2BB2X1 U2474 ( .B0(n1572), .B1(n2245), .A0N(n2314), .A1N(n2287), .Y(n2246) );
  AOI2BB2X1 U2475 ( .B0(n1572), .B1(n2284), .A0N(n2314), .A1N(n2283), .Y(n2285) );
  AOI2BB2X1 U2476 ( .B0(n1572), .B1(n2254), .A0N(n2314), .A1N(n2302), .Y(n2255) );
  AOI2BB2X1 U2477 ( .B0(n1572), .B1(n2248), .A0N(n2314), .A1N(n2292), .Y(n2249) );
  AOI2BB2X1 U2478 ( .B0(n1572), .B1(n2299), .A0N(n2314), .A1N(n2298), .Y(n2300) );
  AOI2BB2X1 U2479 ( .B0(n1572), .B1(n2251), .A0N(n2314), .A1N(n2297), .Y(n2252) );
  AOI2BB2X1 U2480 ( .B0(n1572), .B1(n2289), .A0N(n2314), .A1N(n2288), .Y(n2290) );
  AOI2BB2X1 U2481 ( .B0(n1572), .B1(n2294), .A0N(n2314), .A1N(n2293), .Y(n2295) );
  AOI2BB2X1 U2482 ( .B0(n1572), .B1(n2259), .A0N(n2314), .A1N(n2309), .Y(n2260) );
  AOI2BB2X1 U2483 ( .B0(n1572), .B1(n2305), .A0N(n2314), .A1N(n2304), .Y(n2307) );
  INVX1 U2484 ( .A(n1833), .Y(n1834) );
  MX2XL U2485 ( .A(n1419), .B(quant_conv1[4]), .S0(n2189), .Y(n1004) );
  MX2XL U2486 ( .A(n1419), .B(flatten_arr2_3__4_), .S0(n2423), .Y(n912) );
  MX2XL U2487 ( .A(flatten_arr1[4]), .B(n1419), .S0(n1573), .Y(n935) );
  OAI2BB1XL U2488 ( .A0N(n1957), .A1N(n2207), .B0(n1396), .Y(n1958) );
  AOI21XL U2489 ( .A0(div_82_u_div_SumTmp_5__1__8_), .A1(n2106), .B0(n1419), 
        .Y(n2112) );
  OR3X1 U2490 ( .A(n1396), .B(n2218), .C(n1614), .Y(n2313) );
  OR4X1 U2491 ( .A(n1425), .B(n1955), .C(n1361), .D(n1396), .Y(n1620) );
  NAND2XL U2492 ( .A(div_82_u_div_SumTmp_3__2__6_), .B(n2062), .Y(n2008) );
  NAND2XL U2493 ( .A(div_82_u_div_SumTmp_3__2__7_), .B(n1411), .Y(n1999) );
  AOI32XL U2494 ( .A0(n2110), .A1(n2153), .A2(div_82_u_div_SumTmp_3__1__9_), 
        .B0(div_82_u_div_SumTmp_1__1__9_), .B1(n2173), .Y(n2096) );
  CLKINVX1 U2495 ( .A(div_82_u_div_BInv_3__4_), .Y(n1584) );
  OR4X1 U2496 ( .A(n1604), .B(n2224), .C(n1359), .D(n1378), .Y(n2226) );
  OR3XL U2497 ( .A(n2390), .B(n2388), .C(n1378), .Y(n2461) );
  AOI22XL U2498 ( .A0(div_82_u_div_SumTmp_5__5__0_), .A1(n1716), .B0(
        div_82_u_div_SumTmp_3__5__0_), .B1(n1448), .Y(n1721) );
  OAI2BB1X2 U2499 ( .A0N(div_82_u_div_SumTmp_4__5__2_), .A1N(n1716), .B0(n1694), .Y(n1695) );
  OR2XL U2500 ( .A(n1668), .B(n1703), .Y(n1669) );
  OAI2BB1X1 U2501 ( .A0N(div_82_u_div_SumTmp_2__5__5_), .A1N(n1448), .B0(n1669), .Y(n1670) );
  AND2X1 U2502 ( .A(L1_sum[9]), .B(n1398), .Y(N1271) );
  AND2X1 U2503 ( .A(L1_sum[8]), .B(n1398), .Y(N1270) );
  OR3XL U2504 ( .A(n1604), .B(n1378), .C(n1398), .Y(n2225) );
  AND2X1 U2505 ( .A(L1_sum[7]), .B(n1398), .Y(N1269) );
  AND2X1 U2506 ( .A(L1_sum[6]), .B(n1398), .Y(N1268) );
  AND2X1 U2507 ( .A(L1_sum[5]), .B(n1398), .Y(N1267) );
  AND2X1 U2508 ( .A(L1_sum[4]), .B(n1398), .Y(N1266) );
  AND2X1 U2509 ( .A(L1_sum[3]), .B(n1398), .Y(N1265) );
  AND2X1 U2510 ( .A(L1_sum[2]), .B(n1398), .Y(N1264) );
  AND2X1 U2511 ( .A(L1_sum[1]), .B(n1398), .Y(N1263) );
  AND2X1 U2512 ( .A(L1_sum[0]), .B(n1398), .Y(N1262) );
  OR3XL U2513 ( .A(n1360), .B(n2313), .C(n1380), .Y(n2390) );
  OR2X1 U2514 ( .A(n1380), .B(n1613), .Y(n2386) );
  OR3XL U2515 ( .A(n2266), .B(n2233), .C(n1390), .Y(n2357) );
  BUFX1 U2516 ( .A(div_82_u_div_BInv_3__1_), .Y(n1569) );
  NAND2XL U2517 ( .A(div_82_u_div_SumTmp_1__2__8_), .B(n1406), .Y(n1994) );
  NAND2XL U2518 ( .A(div_82_u_div_SumTmp_1__4__7_), .B(n1775), .Y(n1739) );
  NAND2XL U2519 ( .A(div_82_u_div_SumTmp_1__4__3_), .B(n1775), .Y(n1767) );
  NAND2X1 U2520 ( .A(div_82_u_div_SumTmp_1__4__5_), .B(n1775), .Y(n1753) );
  OR2X1 U2521 ( .A(n1778), .B(n1769), .Y(n1770) );
  OR3XL U2522 ( .A(n1361), .B(n2219), .C(n1637), .Y(n2320) );
  NAND3XL U2523 ( .A(n1395), .B(n1655), .C(div_82_u_div_SumTmp_2__6__1_), .Y(
        n1650) );
  OAI2BB1X1 U2524 ( .A0N(div_82_u_div_SumTmp_2__1__4_), .A1N(n1341), .B0(n2137), .Y(n2138) );
  OAI2BB1X1 U2525 ( .A0N(div_82_u_div_SumTmp_2__1__8_), .A1N(n1328), .B0(n2102), .Y(n2104) );
  OAI2BB1X1 U2526 ( .A0N(div_82_u_div_SumTmp_2__1__5_), .A1N(n1328), .B0(n2129), .Y(n2132) );
  OR2X1 U2527 ( .A(n1328), .B(n2101), .Y(n2102) );
  OR2XL U2528 ( .A(n1328), .B(n2128), .Y(n2129) );
  OAI2BB1X1 U2529 ( .A0N(div_82_u_div_SumTmp_2__1__9_), .A1N(n1328), .B0(n2091), .Y(n2094) );
  OR2X1 U2530 ( .A(n1328), .B(n2090), .Y(n2091) );
  AOI22XL U2531 ( .A0(div_82_u_div_SumTmp_6__2__0_), .A1(n1357), .B0(
        div_82_u_div_SumTmp_4__2__0_), .B1(n2055), .Y(n2056) );
  MX2XL U2532 ( .A(n2326), .B(quant_conv1[6]), .S0(n2189), .Y(n1006) );
  MX2XL U2533 ( .A(n2326), .B(flatten_arr2_3__6_), .S0(n2423), .Y(n914) );
  MX2XL U2534 ( .A(flatten_arr1[6]), .B(n2326), .S0(n1574), .Y(n943) );
  AOI221XL U2535 ( .A0(div_82_u_div_SumTmp_7__1__7_), .A1(n1440), .B0(
        div_82_u_div_SumTmp_1__1__7_), .B1(n2173), .C0(n2117), .Y(n2118) );
  OAI2BB1X1 U2536 ( .A0N(div_82_u_div_SumTmp_3__5__2_), .A1N(n1448), .B0(n1691), .Y(n1692) );
  INVX8 U2537 ( .A(n1665), .Y(n1716) );
  AOI33X1 U2538 ( .A0(n1334), .A1(n1567), .A2(div_82_u_div_CryOut_5__5_), .B0(
        div_82_u_div_CryOut_1__5_), .B1(n1710), .B2(n1711), .Y(n1672) );
  NAND2XL U2539 ( .A(div_82_u_div_SumTmp_4__2__6_), .B(n1446), .Y(n2005) );
  OR2X1 U2540 ( .A(n1778), .B(n1762), .Y(n1763) );
  INVX8 U2541 ( .A(n1713), .Y(n1709) );
  OAI2BB1X2 U2542 ( .A0N(div_82_u_div_SumTmp_5__2__10_), .A1N(n1324), .B0(
        n1979), .Y(n1980) );
  NAND2XL U2543 ( .A(div_82_u_div_SumTmp_6__1__0_), .B(n1444), .Y(n2166) );
  INVX8 U2544 ( .A(n1854), .Y(n2484) );
  NAND2XL U2545 ( .A(div_82_u_div_SumTmp_1__2__6_), .B(n1406), .Y(n2011) );
  CLKINVX8 U2546 ( .A(div_82_quotient_8_), .Y(n2058) );
  MX2XL U2547 ( .A(n2324), .B(quant_conv1[3]), .S0(n2189), .Y(n1003) );
  MX2XL U2548 ( .A(n2324), .B(flatten_arr2_3__3_), .S0(n2423), .Y(n911) );
  MX2XL U2549 ( .A(flatten_arr1[3]), .B(n2324), .S0(n1574), .Y(n931) );
  AOI22XL U2550 ( .A0(div_82_u_div_SumTmp_6__1__1_), .A1(n1444), .B0(
        div_82_u_div_SumTmp_4__1__1_), .B1(n1409), .Y(n2161) );
  AOI2BB2XL U2551 ( .B0(n2104), .B1(n1408), .A0N(n2103), .A1N(n1408), .Y(n2113) );
  AOI22XL U2552 ( .A0(div_82_u_div_SumTmp_6__1__2_), .A1(n1444), .B0(
        div_82_u_div_SumTmp_4__1__2_), .B1(n1409), .Y(n2155) );
  AOI22XL U2553 ( .A0(div_82_u_div_SumTmp_4__1__6_), .A1(n1409), .B0(
        div_82_u_div_SumTmp_6__1__6_), .B1(n1444), .Y(n2121) );
  AOI22XL U2554 ( .A0(div_82_u_div_SumTmp_4__1__7_), .A1(n1409), .B0(
        div_82_u_div_SumTmp_6__1__7_), .B1(n1444), .Y(n2115) );
  AOI222X2 U2555 ( .A0(div_82_u_div_SumTmp_5__3__5_), .A1(n1881), .B0(n1880), 
        .B1(n1864), .C0(div_82_u_div_SumTmp_7__3__5_), .C1(n1924), .Y(n1865)
         );
  AOI222X2 U2556 ( .A0(div_82_u_div_SumTmp_1__3__6_), .A1(n1907), .B0(
        div_82_u_div_SumTmp_7__3__6_), .B1(n1924), .C0(
        div_82_u_div_SumTmp_3__3__6_), .C1(n1925), .Y(n1857) );
  AOI22XL U2557 ( .A0(div_82_u_div_SumTmp_4__1__8_), .A1(n1344), .B0(
        div_82_u_div_SumTmp_6__1__8_), .B1(n1356), .Y(n2103) );
  AOI22XL U2558 ( .A0(div_82_u_div_SumTmp_6__1__5_), .A1(n1356), .B0(
        div_82_u_div_SumTmp_4__1__5_), .B1(n1344), .Y(n2131) );
  OAI22X1 U2559 ( .A0(n2130), .A1(n1322), .B0(div_82_u_div_CryOut_6__1_), .B1(
        n2070), .Y(n2075) );
  INVX8 U2560 ( .A(n1686), .Y(n2498) );
  INVX8 U2561 ( .A(n1846), .Y(n2485) );
  OAI21XL U2562 ( .A0(n1389), .A1(n1385), .B0(n1394), .Y(n2214) );
  OR2X1 U2563 ( .A(n1385), .B(n2319), .Y(n2265) );
  INVX8 U2564 ( .A(n1736), .Y(n1800) );
  AND2X4 U2565 ( .A(n1379), .B(n1387), .Y(n2494) );
  INVX4 U2566 ( .A(div_82_u_div_CryOut_1__6_), .Y(n1653) );
  OR2X4 U2567 ( .A(n1657), .B(n1658), .Y(n1686) );
  OR2X4 U2568 ( .A(n1567), .B(n1711), .Y(n1713) );
  OR2X4 U2569 ( .A(div_82_u_div_CryOut_6__5_), .B(n1711), .Y(n1665) );
  AOI32X4 U2570 ( .A0(n1721), .A1(n1720), .A2(n1719), .B0(n1718), .B1(n1717), 
        .Y(n2468) );
  AOI32X4 U2571 ( .A0(div_82_u_div_CryOut_3__4_), .A1(
        div_82_u_div_CryOut_2__4_), .A2(n1732), .B0(div_82_u_div_CryOut_7__4_), 
        .B1(n1441), .Y(n1735) );
  AOI33X4 U2572 ( .A0(div_82_u_div_CryOut_5__4_), .A1(div_82_quotient_14_), 
        .A2(n1733), .B0(div_82_u_div_CryOut_1__4_), .B1(n1797), .B2(n1732), 
        .Y(n1734) );
  NAND2X4 U2573 ( .A(n1735), .B(n1734), .Y(n1736) );
  MX2X4 U2574 ( .A(n1766), .B(n1765), .S0(n1800), .Y(n1846) );
  OAI33X4 U2575 ( .A0(div_82_quotient_14_), .A1(n1797), .A2(n1785), .B0(
        div_82_u_div_CryOut_2__4_), .B1(div_82_quotient_14_), .B2(n1784), .Y(
        n1786) );
  OR2X4 U2576 ( .A(n1911), .B(n1898), .Y(n1884) );
  OR2X4 U2577 ( .A(div_82_u_div_CryOut_6__3_), .B(n1816), .Y(n1919) );
  OR2X4 U2578 ( .A(n1445), .B(n1563), .Y(n1933) );
  OR2X4 U2579 ( .A(div_82_u_div_CryOut_2__2_), .B(div_82_quotient_8_), .Y(
        n2041) );
  OR4X2 U2580 ( .A(n1383), .B(n2223), .C(n2221), .D(n1960), .Y(n2212) );
  OR2X4 U2581 ( .A(n1972), .B(n1966), .Y(n1990) );
  OR3X2 U2582 ( .A(n2049), .B(n2048), .C(n2047), .Y(n2051) );
  OR2X4 U2583 ( .A(n1358), .B(n2105), .Y(n2135) );
  OAI2BB1X4 U2584 ( .A0N(n1354), .A1N(n2075), .B0(n2074), .Y(n2324) );
  OR3X2 U2585 ( .A(pool_cnt[0]), .B(n2531), .C(n2228), .Y(n2229) );
  OR4X2 U2586 ( .A(n1457), .B(n1456), .C(n1271), .D(n2430), .Y(n2459) );
  OAI22X1 U2590 ( .A0(n2533), .A1(n2535), .B0(n2503), .B1(n2533), .Y(n2534) );
  NOR2X1 U2591 ( .A(n1597), .B(n2536), .Y(smult_b[7]) );
  NOR2X1 U2592 ( .A(n1597), .B(n2537), .Y(smult_b[6]) );
  NOR2X1 U2593 ( .A(n1595), .B(n2538), .Y(smult_b[5]) );
  NOR2X1 U2594 ( .A(n1596), .B(n2539), .Y(smult_b[4]) );
  NOR2X1 U2595 ( .A(n1595), .B(n2540), .Y(smult_b[3]) );
  NOR2X1 U2596 ( .A(n1595), .B(n2541), .Y(smult_b[2]) );
  NOR2X1 U2597 ( .A(n1595), .B(n2542), .Y(smult_b[1]) );
  NOR2X1 U2598 ( .A(n1597), .B(n2543), .Y(smult_b[0]) );
  NOR2X1 U2599 ( .A(n1596), .B(n2544), .Y(smult_b[15]) );
  NOR2X1 U2600 ( .A(n1596), .B(n2545), .Y(smult_b[14]) );
  NOR2X1 U2601 ( .A(n1597), .B(n2546), .Y(smult_b[13]) );
  NOR2X1 U2602 ( .A(n1597), .B(n2547), .Y(smult_b[12]) );
  NOR2X1 U2603 ( .A(n1597), .B(n2548), .Y(smult_b[11]) );
  NOR2X1 U2604 ( .A(n1595), .B(n2549), .Y(smult_b[10]) );
  NOR2X1 U2605 ( .A(n1597), .B(n2550), .Y(smult_b[9]) );
  NOR2X1 U2606 ( .A(n1595), .B(n2551), .Y(smult_b[8]) );
  NOR2X1 U2607 ( .A(n1596), .B(n2552), .Y(smult_b[23]) );
  NOR2X1 U2608 ( .A(n1598), .B(n2553), .Y(smult_b[22]) );
  NOR2X1 U2609 ( .A(n1595), .B(n2554), .Y(smult_b[21]) );
  NOR2X1 U2610 ( .A(n1595), .B(n2555), .Y(smult_b[20]) );
  NOR2X1 U2611 ( .A(n1595), .B(n2556), .Y(smult_b[19]) );
  NOR2X1 U2612 ( .A(n1595), .B(n2557), .Y(smult_b[18]) );
  NOR2X1 U2613 ( .A(n1597), .B(n2558), .Y(smult_b[17]) );
  NOR2X1 U2614 ( .A(n1595), .B(n2559), .Y(smult_b[16]) );
  NOR2X1 U2615 ( .A(n1597), .B(n2560), .Y(smult_b[31]) );
  NOR2X1 U2616 ( .A(n1597), .B(n2561), .Y(smult_b[30]) );
  NOR2X1 U2617 ( .A(n1595), .B(n2562), .Y(smult_b[29]) );
  NOR2X1 U2618 ( .A(n1596), .B(n2563), .Y(smult_b[28]) );
  NOR2X1 U2619 ( .A(n1595), .B(n2564), .Y(smult_b[27]) );
  NOR2X1 U2620 ( .A(n1595), .B(n2565), .Y(smult_b[26]) );
  NOR2X1 U2621 ( .A(n1596), .B(n2566), .Y(smult_b[25]) );
  NOR2X1 U2622 ( .A(n1597), .B(n2567), .Y(smult_b[24]) );
  NOR2X1 U2623 ( .A(n1595), .B(n2568), .Y(smult_b[39]) );
  NOR2X1 U2624 ( .A(n1596), .B(n2569), .Y(smult_b[38]) );
  NOR2X1 U2625 ( .A(n1595), .B(n2570), .Y(smult_b[37]) );
  NOR2X1 U2626 ( .A(n1597), .B(n2571), .Y(smult_b[36]) );
  NOR2X1 U2627 ( .A(n1597), .B(n2572), .Y(smult_b[35]) );
  NOR2X1 U2628 ( .A(n2502), .B(n2573), .Y(smult_b[34]) );
  NOR2X1 U2629 ( .A(n1597), .B(n2574), .Y(smult_b[33]) );
  NOR2X1 U2630 ( .A(n1595), .B(n2575), .Y(smult_b[32]) );
  NOR2X1 U2631 ( .A(n1595), .B(n2576), .Y(smult_b[47]) );
  NOR2X1 U2632 ( .A(n1595), .B(n2577), .Y(smult_b[46]) );
  NOR2X1 U2633 ( .A(n1595), .B(n2578), .Y(smult_b[45]) );
  NOR2X1 U2634 ( .A(n1595), .B(n2579), .Y(smult_b[44]) );
  NOR2X1 U2635 ( .A(n1595), .B(n2580), .Y(smult_b[43]) );
  NOR2X1 U2636 ( .A(n1595), .B(n2581), .Y(smult_b[42]) );
  NOR2X1 U2637 ( .A(n1595), .B(n2582), .Y(smult_b[41]) );
  NOR2X1 U2638 ( .A(n1595), .B(n2583), .Y(smult_b[40]) );
  NOR2X1 U2639 ( .A(n1595), .B(n2584), .Y(smult_b[55]) );
  NOR2X1 U2640 ( .A(n1595), .B(n2585), .Y(smult_b[54]) );
  NOR2X1 U2641 ( .A(n1595), .B(n2586), .Y(smult_b[53]) );
  NOR2X1 U2642 ( .A(n1595), .B(n2587), .Y(smult_b[52]) );
  NOR2X1 U2643 ( .A(n1596), .B(n2588), .Y(smult_b[51]) );
  NOR2X1 U2644 ( .A(n1596), .B(n2589), .Y(smult_b[50]) );
  NOR2X1 U2645 ( .A(n1596), .B(n2590), .Y(smult_b[49]) );
  NOR2X1 U2646 ( .A(n1596), .B(n2591), .Y(smult_b[48]) );
  NOR2X1 U2647 ( .A(n2768), .B(n1596), .Y(smult_a[7]) );
  NOR2X1 U2648 ( .A(n2767), .B(n1596), .Y(smult_a[6]) );
  NOR2X1 U2649 ( .A(n2766), .B(n1596), .Y(smult_a[5]) );
  NOR2X1 U2650 ( .A(n2765), .B(n1596), .Y(smult_a[4]) );
  NOR2X1 U2651 ( .A(n2764), .B(n1596), .Y(smult_a[3]) );
  NOR2X1 U2652 ( .A(n2763), .B(n1596), .Y(smult_a[2]) );
  NOR2X1 U2653 ( .A(n2762), .B(n1596), .Y(smult_a[1]) );
  NOR2X1 U2654 ( .A(n2761), .B(n1596), .Y(smult_a[0]) );
  NOR2X1 U2655 ( .A(n2760), .B(n1596), .Y(smult_a[15]) );
  NOR2X1 U2656 ( .A(n2746), .B(n1597), .Y(smult_a[14]) );
  NOR2X1 U2657 ( .A(n2732), .B(n1597), .Y(smult_a[13]) );
  NOR2X1 U2658 ( .A(n2718), .B(n1597), .Y(smult_a[12]) );
  NOR2X1 U2659 ( .A(n2704), .B(n1597), .Y(smult_a[11]) );
  NOR2X1 U2660 ( .A(n2690), .B(n1597), .Y(smult_a[10]) );
  NOR2X1 U2661 ( .A(n2676), .B(n1597), .Y(smult_a[9]) );
  NOR2X1 U2662 ( .A(n2662), .B(n1597), .Y(smult_a[8]) );
  NOR2X1 U2663 ( .A(n2759), .B(n1597), .Y(smult_a[23]) );
  NOR2X1 U2664 ( .A(n2745), .B(n1597), .Y(smult_a[22]) );
  NOR2X1 U2665 ( .A(n2731), .B(n1597), .Y(smult_a[21]) );
  NOR2X1 U2666 ( .A(n2717), .B(n1597), .Y(smult_a[20]) );
  NOR2X1 U2667 ( .A(n2703), .B(n1597), .Y(smult_a[19]) );
  NOR2X1 U2668 ( .A(n2689), .B(n1597), .Y(smult_a[18]) );
  NOR2X1 U2669 ( .A(n2675), .B(n1597), .Y(smult_a[17]) );
  NOR2X1 U2670 ( .A(n2661), .B(n1595), .Y(smult_a[16]) );
  NOR2X1 U2671 ( .A(n2755), .B(n1599), .Y(smult_a[31]) );
  NOR2X1 U2672 ( .A(n2741), .B(n1596), .Y(smult_a[30]) );
  NOR2X1 U2673 ( .A(n2727), .B(n1597), .Y(smult_a[29]) );
  NOR2X1 U2674 ( .A(n2713), .B(n1596), .Y(smult_a[28]) );
  NOR2X1 U2675 ( .A(n2699), .B(n1597), .Y(smult_a[27]) );
  NOR2X1 U2676 ( .A(n2685), .B(n1597), .Y(smult_a[26]) );
  NOR2X1 U2677 ( .A(n2671), .B(n1596), .Y(smult_a[25]) );
  NOR2X1 U2678 ( .A(n2657), .B(n1596), .Y(smult_a[24]) );
  NOR2X1 U2679 ( .A(n2754), .B(n2502), .Y(smult_a[39]) );
  NOR2X1 U2680 ( .A(n2740), .B(n1595), .Y(smult_a[38]) );
  NOR2X1 U2681 ( .A(n2726), .B(n1596), .Y(smult_a[37]) );
  NOR2X1 U2682 ( .A(n2712), .B(n2502), .Y(smult_a[36]) );
  NOR2X1 U2683 ( .A(n2698), .B(n2502), .Y(smult_a[35]) );
  NOR2X1 U2684 ( .A(n2684), .B(n2502), .Y(smult_a[34]) );
  NOR2X1 U2685 ( .A(n2670), .B(n2502), .Y(smult_a[33]) );
  NOR2X1 U2686 ( .A(n2656), .B(n1595), .Y(smult_a[32]) );
  NOR2X1 U2687 ( .A(n2753), .B(n1596), .Y(smult_a[47]) );
  NOR2X1 U2688 ( .A(n2739), .B(n1598), .Y(smult_a[46]) );
  NOR2X1 U2689 ( .A(n2725), .B(n1596), .Y(smult_a[45]) );
  NOR2X1 U2690 ( .A(n2711), .B(n1595), .Y(smult_a[44]) );
  NOR2X1 U2691 ( .A(n2697), .B(n1596), .Y(smult_a[43]) );
  NOR2X1 U2692 ( .A(n2683), .B(n1595), .Y(smult_a[42]) );
  NOR2X1 U2693 ( .A(n2669), .B(n1595), .Y(smult_a[41]) );
  NOR2X1 U2694 ( .A(n2655), .B(n1597), .Y(smult_a[40]) );
  NOR2X1 U2695 ( .A(n2749), .B(n1598), .Y(smult_a[55]) );
  NOR2X1 U2696 ( .A(n2735), .B(n1598), .Y(smult_a[54]) );
  NOR2X1 U2697 ( .A(n2721), .B(n1598), .Y(smult_a[53]) );
  NOR2X1 U2698 ( .A(n2707), .B(n1598), .Y(smult_a[52]) );
  NOR2X1 U2699 ( .A(n2693), .B(n1598), .Y(smult_a[51]) );
  NOR2X1 U2700 ( .A(n2679), .B(n1598), .Y(smult_a[50]) );
  NOR2X1 U2701 ( .A(n2665), .B(n1598), .Y(smult_a[49]) );
  NOR2X1 U2702 ( .A(n2651), .B(n1598), .Y(smult_a[48]) );
  MXI2X1 U2703 ( .A(n2505), .B(pool_cnt[1]), .S0(pool_cnt[3]), .Y(n2616) );
  AND2X1 U2704 ( .A(out_valid), .B(out_data_buffer[9]), .Y(out_data[9]) );
  AND2X1 U2705 ( .A(out_data_buffer[8]), .B(out_valid), .Y(out_data[8]) );
  AND2X1 U2706 ( .A(out_data_buffer[7]), .B(out_valid), .Y(out_data[7]) );
  AND2X1 U2707 ( .A(out_data_buffer[6]), .B(out_valid), .Y(out_data[6]) );
  AND2X1 U2708 ( .A(out_data_buffer[5]), .B(out_valid), .Y(out_data[5]) );
  AND2X1 U2709 ( .A(out_data_buffer[4]), .B(out_valid), .Y(out_data[4]) );
  AND2X1 U2710 ( .A(out_data_buffer[3]), .B(out_valid), .Y(out_data[3]) );
  AND2X1 U2711 ( .A(out_data_buffer[2]), .B(out_valid), .Y(out_data[2]) );
  AND2X1 U2712 ( .A(out_data_buffer[1]), .B(out_valid), .Y(out_data[1]) );
  AND2X1 U2713 ( .A(out_data_buffer[0]), .B(out_valid), .Y(out_data[0]) );
  NAND2X1 U2714 ( .A(n2618), .B(n2501), .Y(n997) );
  MXI2X1 U2715 ( .A(n1463), .B(n2619), .S0(pool_cnt[2]), .Y(n2618) );
  NAND2X1 U2716 ( .A(n2621), .B(n2501), .Y(n996) );
  OAI2BB1X1 U2717 ( .A0N(n2532), .A1N(n2504), .B0(n2617), .Y(n2622) );
  NAND2X1 U2718 ( .A(n2623), .B(n2531), .Y(n2617) );
  MXI2X1 U2719 ( .A(n2624), .B(n2530), .S0(pool_cnt[1]), .Y(n2623) );
  NAND2X1 U2720 ( .A(pool_cnt[0]), .B(n2530), .Y(n2624) );
  AOI21X1 U2721 ( .A0(n2620), .A1(n2531), .B0(scmp_result), .Y(n2626) );
  MXI2X1 U2722 ( .A(n2620), .B(pool_cnt[1]), .S0(pool_cnt[3]), .Y(n2627) );
  NAND2X1 U2723 ( .A(pool_cnt[1]), .B(pool_cnt[0]), .Y(n2620) );
  NAND3X1 U2724 ( .A(n2530), .B(n2531), .C(n2505), .Y(n2625) );
  MXI2X1 U2725 ( .A(n2768), .B(n2760), .S0(n1588), .Y(n1155) );
  MXI2X1 U2726 ( .A(n2760), .B(n2759), .S0(n1588), .Y(n1154) );
  MXI2X1 U2727 ( .A(n2759), .B(n2758), .S0(n1589), .Y(n1153) );
  MXI2X1 U2728 ( .A(n2758), .B(n2757), .S0(n1590), .Y(n1152) );
  MXI2X1 U2729 ( .A(n2757), .B(n2756), .S0(n1590), .Y(n1151) );
  MXI2X1 U2730 ( .A(n2756), .B(n2755), .S0(n1591), .Y(n1150) );
  MXI2X1 U2731 ( .A(n2755), .B(n2754), .S0(n1587), .Y(n1149) );
  MXI2X1 U2732 ( .A(n2754), .B(n2753), .S0(n1587), .Y(n1148) );
  MXI2X1 U2733 ( .A(n2753), .B(n2752), .S0(n1588), .Y(n1147) );
  MXI2X1 U2734 ( .A(n2752), .B(n2751), .S0(n1589), .Y(n1146) );
  MXI2X1 U2735 ( .A(n2751), .B(n2750), .S0(n1589), .Y(n1145) );
  MXI2X1 U2736 ( .A(n2750), .B(n2749), .S0(n1590), .Y(n1144) );
  MXI2X1 U2737 ( .A(n2749), .B(n2748), .S0(n1587), .Y(n1143) );
  MXI2X1 U2738 ( .A(n2748), .B(n2747), .S0(n1587), .Y(n1142) );
  MXI2X1 U2739 ( .A(n2767), .B(n2746), .S0(n1587), .Y(n1141) );
  MXI2X1 U2740 ( .A(n2746), .B(n2745), .S0(n1587), .Y(n1140) );
  MXI2X1 U2741 ( .A(n2745), .B(n2744), .S0(n1587), .Y(n1139) );
  MXI2X1 U2742 ( .A(n2744), .B(n2743), .S0(n1587), .Y(n1138) );
  MXI2X1 U2743 ( .A(n2743), .B(n2742), .S0(n1587), .Y(n1137) );
  MXI2X1 U2744 ( .A(n2742), .B(n2741), .S0(n1587), .Y(n1136) );
  MXI2X1 U2745 ( .A(n2741), .B(n2740), .S0(n1587), .Y(n1135) );
  MXI2X1 U2746 ( .A(n2740), .B(n2739), .S0(n1587), .Y(n1134) );
  MXI2X1 U2747 ( .A(n2739), .B(n2738), .S0(n1587), .Y(n1133) );
  MXI2X1 U2748 ( .A(n2738), .B(n2737), .S0(n1587), .Y(n1132) );
  MXI2X1 U2749 ( .A(n2737), .B(n2736), .S0(n1591), .Y(n1131) );
  MXI2X1 U2750 ( .A(n2736), .B(n2735), .S0(n1588), .Y(n1130) );
  MXI2X1 U2751 ( .A(n2735), .B(n2734), .S0(n1590), .Y(n1129) );
  MXI2X1 U2752 ( .A(n2734), .B(n2733), .S0(n1589), .Y(n1128) );
  MXI2X1 U2753 ( .A(n2766), .B(n2732), .S0(n1590), .Y(n1127) );
  MXI2X1 U2754 ( .A(n2732), .B(n2731), .S0(n1587), .Y(n1126) );
  MXI2X1 U2755 ( .A(n2731), .B(n2730), .S0(n1591), .Y(n1125) );
  MXI2X1 U2756 ( .A(n2730), .B(n2729), .S0(n1591), .Y(n1124) );
  MXI2X1 U2757 ( .A(n2729), .B(n2728), .S0(n1588), .Y(n1123) );
  MXI2X1 U2758 ( .A(n2728), .B(n2727), .S0(n1587), .Y(n1122) );
  MXI2X1 U2759 ( .A(n2727), .B(n2726), .S0(n1588), .Y(n1121) );
  MXI2X1 U2760 ( .A(n2726), .B(n2725), .S0(n1587), .Y(n1120) );
  MXI2X1 U2761 ( .A(n2725), .B(n2724), .S0(n1588), .Y(n1119) );
  MXI2X1 U2762 ( .A(n2724), .B(n2723), .S0(n1588), .Y(n1118) );
  MXI2X1 U2763 ( .A(n2723), .B(n2722), .S0(n1588), .Y(n1117) );
  MXI2X1 U2764 ( .A(n2722), .B(n2721), .S0(n1588), .Y(n1116) );
  MXI2X1 U2765 ( .A(n2721), .B(n2720), .S0(n1588), .Y(n1115) );
  MXI2X1 U2766 ( .A(n2720), .B(n2719), .S0(n1588), .Y(n1114) );
  MXI2X1 U2767 ( .A(n2765), .B(n2718), .S0(n1588), .Y(n1113) );
  MXI2X1 U2768 ( .A(n2718), .B(n2717), .S0(n1588), .Y(n1112) );
  MXI2X1 U2769 ( .A(n2717), .B(n2716), .S0(n1588), .Y(n1111) );
  MXI2X1 U2770 ( .A(n2716), .B(n2715), .S0(n1588), .Y(n1110) );
  MXI2X1 U2771 ( .A(n2715), .B(n2714), .S0(n1588), .Y(n1109) );
  MXI2X1 U2772 ( .A(n2714), .B(n2713), .S0(n1588), .Y(n1108) );
  MXI2X1 U2773 ( .A(n2713), .B(n2712), .S0(n1590), .Y(n1107) );
  MXI2X1 U2774 ( .A(n2712), .B(n2711), .S0(n1591), .Y(n1106) );
  MXI2X1 U2775 ( .A(n2711), .B(n2710), .S0(n1587), .Y(n1105) );
  MXI2X1 U2776 ( .A(n2710), .B(n2709), .S0(n1588), .Y(n1104) );
  MXI2X1 U2777 ( .A(n2709), .B(n2708), .S0(n1589), .Y(n1103) );
  MXI2X1 U2778 ( .A(n2708), .B(n2707), .S0(n1590), .Y(n1102) );
  MXI2X1 U2779 ( .A(n2707), .B(n2706), .S0(n1591), .Y(n1101) );
  MXI2X1 U2780 ( .A(n2706), .B(n2705), .S0(n1587), .Y(n1100) );
  MXI2X1 U2781 ( .A(n2764), .B(n2704), .S0(n1588), .Y(n1099) );
  MXI2X1 U2782 ( .A(n2704), .B(n2703), .S0(n1589), .Y(n1098) );
  MXI2X1 U2783 ( .A(n2703), .B(n2702), .S0(n1590), .Y(n1097) );
  MXI2X1 U2784 ( .A(n2702), .B(n2701), .S0(n1587), .Y(n1096) );
  MXI2X1 U2785 ( .A(n2701), .B(n2700), .S0(n1589), .Y(n1095) );
  MXI2X1 U2786 ( .A(n2700), .B(n2699), .S0(n1589), .Y(n1094) );
  MXI2X1 U2787 ( .A(n2699), .B(n2698), .S0(n1589), .Y(n1093) );
  MXI2X1 U2788 ( .A(n2698), .B(n2697), .S0(n1589), .Y(n1092) );
  MXI2X1 U2789 ( .A(n2697), .B(n2696), .S0(n1589), .Y(n1091) );
  MXI2X1 U2790 ( .A(n2696), .B(n2695), .S0(n1589), .Y(n1090) );
  MXI2X1 U2791 ( .A(n2695), .B(n2694), .S0(n1589), .Y(n1089) );
  MXI2X1 U2792 ( .A(n2694), .B(n2693), .S0(n1589), .Y(n1088) );
  MXI2X1 U2793 ( .A(n2693), .B(n2692), .S0(n1589), .Y(n1087) );
  MXI2X1 U2794 ( .A(n2692), .B(n2691), .S0(n1589), .Y(n1086) );
  MXI2X1 U2795 ( .A(n2763), .B(n2690), .S0(n1589), .Y(n1085) );
  MXI2X1 U2796 ( .A(n2690), .B(n2689), .S0(n1589), .Y(n1084) );
  MXI2X1 U2797 ( .A(n2689), .B(n2688), .S0(n1590), .Y(n1083) );
  MXI2X1 U2798 ( .A(n2688), .B(n2687), .S0(n1590), .Y(n1082) );
  MXI2X1 U2799 ( .A(n2687), .B(n2686), .S0(n1590), .Y(n1081) );
  MXI2X1 U2800 ( .A(n2686), .B(n2685), .S0(n1590), .Y(n1080) );
  MXI2X1 U2801 ( .A(n2685), .B(n2684), .S0(n1590), .Y(n1079) );
  MXI2X1 U2802 ( .A(n2684), .B(n2683), .S0(n1590), .Y(n1078) );
  MXI2X1 U2803 ( .A(n2683), .B(n2682), .S0(n1590), .Y(n1077) );
  MXI2X1 U2804 ( .A(n2682), .B(n2681), .S0(n1590), .Y(n1076) );
  MXI2X1 U2805 ( .A(n2681), .B(n2680), .S0(n1590), .Y(n1075) );
  MXI2X1 U2806 ( .A(n2680), .B(n2679), .S0(n1590), .Y(n1074) );
  MXI2X1 U2807 ( .A(n2679), .B(n2678), .S0(n1590), .Y(n1073) );
  MXI2X1 U2808 ( .A(n2678), .B(n2677), .S0(n1590), .Y(n1072) );
  MXI2X1 U2809 ( .A(n2762), .B(n2676), .S0(n1589), .Y(n1071) );
  MXI2X1 U2810 ( .A(n2676), .B(n2675), .S0(n1590), .Y(n1070) );
  MXI2X1 U2811 ( .A(n2675), .B(n2674), .S0(n1591), .Y(n1069) );
  MXI2X1 U2812 ( .A(n2674), .B(n2673), .S0(n1587), .Y(n1068) );
  MXI2X1 U2813 ( .A(n2673), .B(n2672), .S0(n1588), .Y(n1067) );
  MXI2X1 U2814 ( .A(n2672), .B(n2671), .S0(n1589), .Y(n1066) );
  MXI2X1 U2815 ( .A(n2671), .B(n2670), .S0(n1589), .Y(n1065) );
  MXI2X1 U2816 ( .A(n2670), .B(n2669), .S0(n1590), .Y(n1064) );
  MXI2X1 U2817 ( .A(n2669), .B(n2668), .S0(n1591), .Y(n1063) );
  MXI2X1 U2818 ( .A(n2668), .B(n2667), .S0(n1587), .Y(n1062) );
  MXI2X1 U2819 ( .A(n2667), .B(n2666), .S0(n1588), .Y(n1061) );
  MXI2X1 U2820 ( .A(n2666), .B(n2665), .S0(n1590), .Y(n1060) );
  MXI2X1 U2821 ( .A(n2665), .B(n2664), .S0(n1591), .Y(n1059) );
  MXI2X1 U2822 ( .A(n2664), .B(n2663), .S0(n1591), .Y(n1058) );
  MXI2X1 U2823 ( .A(n2761), .B(n2662), .S0(n1591), .Y(n1057) );
  MXI2X1 U2824 ( .A(n2662), .B(n2661), .S0(n1591), .Y(n1056) );
  MXI2X1 U2825 ( .A(n2661), .B(n2660), .S0(n1591), .Y(n1055) );
  MXI2X1 U2826 ( .A(n2660), .B(n2659), .S0(n1591), .Y(n1054) );
  MXI2X1 U2827 ( .A(n2659), .B(n2658), .S0(n1591), .Y(n1053) );
  MXI2X1 U2828 ( .A(n2658), .B(n2657), .S0(n1591), .Y(n1052) );
  MXI2X1 U2829 ( .A(n2657), .B(n2656), .S0(n1591), .Y(n1051) );
  MXI2X1 U2830 ( .A(n2656), .B(n2655), .S0(n1591), .Y(n1050) );
  MXI2X1 U2831 ( .A(n2655), .B(n2654), .S0(n1591), .Y(n1049) );
  MXI2X1 U2832 ( .A(n2654), .B(n2653), .S0(n1591), .Y(n1048) );
  MXI2X1 U2833 ( .A(n2653), .B(n2652), .S0(n1591), .Y(n1047) );
  MXI2X1 U2834 ( .A(n2652), .B(n2651), .S0(n1589), .Y(n1046) );
  MXI2X1 U2835 ( .A(n2651), .B(n2650), .S0(n1591), .Y(n1045) );
  MXI2X1 U2836 ( .A(n2650), .B(n2649), .S0(n1591), .Y(n1044) );
  AND2X1 U2837 ( .A(N1018), .B(n2500), .Y(N1038) );
  AND2X1 U2838 ( .A(N1017), .B(n2500), .Y(N1037) );
  AND2X1 U2839 ( .A(N1016), .B(n2500), .Y(N1036) );
  AND2X1 U2840 ( .A(N1015), .B(n2500), .Y(N1035) );
  AND2X1 U2841 ( .A(N1014), .B(n2500), .Y(N1034) );
  AND2X1 U2842 ( .A(N1013), .B(n2500), .Y(N1033) );
  AND2X1 U2843 ( .A(N1012), .B(n2500), .Y(N1032) );
  AND2X1 U2844 ( .A(N1011), .B(n2500), .Y(N1031) );
  AND2X1 U2845 ( .A(N1010), .B(n2500), .Y(N1030) );
  AND2X1 U2846 ( .A(N1009), .B(n2500), .Y(N1029) );
  NOR4X1 U2847 ( .A(N1006), .B(N1005), .C(N1004), .D(N1003), .Y(n2629) );
  NOR3X1 U2848 ( .A(N1000), .B(N1002), .C(N1001), .Y(n2628) );
endmodule


module SNN_DW01_add_219 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n1, n13, n14, n34, n35, n36, n37, n88, n89, n90, n91, n92, n93, n94;

  NOR2X4 U4 ( .A(n13), .B(n89), .Y(CO) );
  NOR2X2 U55 ( .A(A[0]), .B(n92), .Y(n37) );
  OR2X2 U56 ( .A(n94), .B(n90), .Y(n89) );
  NAND2X1 U57 ( .A(n34), .B(n14), .Y(n13) );
  INVX2 U58 ( .A(n93), .Y(n92) );
  NOR2X1 U59 ( .A(n88), .B(n91), .Y(n14) );
  NAND2X1 U60 ( .A(B[3]), .B(B[4]), .Y(n88) );
  MXI2X1 U61 ( .A(n35), .B(n36), .S0(n37), .Y(n34) );
  NAND2BXL U62 ( .AN(n35), .B(n36), .Y(n1) );
  NOR2XL U63 ( .A(A[1]), .B(B[1]), .Y(n35) );
  INVX2 U64 ( .A(B[4]), .Y(n91) );
  CLKINVXL U65 ( .A(B[8]), .Y(n94) );
  XNOR2X1 U66 ( .A(n34), .B(n91), .Y(SUM[2]) );
  INVX2 U67 ( .A(B[11]), .Y(n90) );
  CLKINVXL U68 ( .A(B[0]), .Y(n93) );
  XNOR2X1 U69 ( .A(A[0]), .B(n92), .Y(SUM[0]) );
  NAND2XL U70 ( .A(A[1]), .B(B[1]), .Y(n36) );
  XOR2XL U71 ( .A(n1), .B(n37), .Y(SUM[1]) );
endmodule


module SNN_DW01_add_218 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n1, n3, n4, n8, n11, n12, n13, n15, n17, n18, n21, n26, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n53, n54, n55,
         n109, n110, n111;

  NAND2X4 U23 ( .A(B[10]), .B(n26), .Y(n21) );
  NOR2X2 U55 ( .A(A[4]), .B(B[4]), .Y(n43) );
  ADDFX2 U66 ( .A(A[1]), .B(B[1]), .CI(n109), .CO(n50), .S(SUM[1]) );
  AND2X1 U74 ( .A(B[8]), .B(B[6]), .Y(n26) );
  NOR2X1 U75 ( .A(n37), .B(n111), .Y(CO) );
  OR2X2 U76 ( .A(n11), .B(n8), .Y(n111) );
  OAI21X1 U77 ( .A0(n47), .A1(n1), .B0(n48), .Y(n46) );
  ADDFX2 U78 ( .A(A[2]), .B(B[2]), .CI(n50), .CO(n49), .S(SUM[2]) );
  OR2X1 U79 ( .A(A[0]), .B(B[0]), .Y(n109) );
  NAND2XL U80 ( .A(A[3]), .B(B[3]), .Y(n48) );
  NOR2XL U81 ( .A(A[3]), .B(B[3]), .Y(n47) );
  INVX2 U82 ( .A(B[13]), .Y(n13) );
  NAND2X1 U83 ( .A(n54), .B(n44), .Y(n3) );
  NAND2X1 U84 ( .A(A[4]), .B(B[4]), .Y(n44) );
  NOR2XL U85 ( .A(A[5]), .B(B[5]), .Y(n40) );
  INVX2 U86 ( .A(B[12]), .Y(n15) );
  XOR2X1 U87 ( .A(n42), .B(n110), .Y(SUM[5]) );
  AND2X1 U88 ( .A(n53), .B(n41), .Y(n110) );
  XNOR2X1 U89 ( .A(n4), .B(n49), .Y(SUM[3]) );
  XOR2X1 U90 ( .A(n45), .B(n3), .Y(SUM[4]) );
  INVX2 U91 ( .A(B[14]), .Y(n8) );
  CLKINVXL U92 ( .A(n46), .Y(n45) );
  NAND2X1 U93 ( .A(n17), .B(n12), .Y(n11) );
  NOR2X1 U94 ( .A(n18), .B(n21), .Y(n17) );
  NOR2X1 U95 ( .A(n13), .B(n15), .Y(n12) );
  INVX2 U96 ( .A(B[11]), .Y(n18) );
  OAI21XL U97 ( .A0(n45), .A1(n43), .B0(n44), .Y(n42) );
  CLKINVXL U98 ( .A(n40), .Y(n53) );
  CLKINVXL U99 ( .A(n43), .Y(n54) );
  NAND2XL U100 ( .A(n55), .B(n48), .Y(n4) );
  CLKINVXL U101 ( .A(n47), .Y(n55) );
  XNOR2XL U102 ( .A(A[0]), .B(B[0]), .Y(SUM[0]) );
  AOI21X1 U103 ( .A0(n38), .A1(n46), .B0(n39), .Y(n37) );
  NAND2XL U104 ( .A(A[5]), .B(B[5]), .Y(n41) );
  INVX2 U105 ( .A(n49), .Y(n1) );
  OAI21XL U106 ( .A0(n40), .A1(n44), .B0(n41), .Y(n39) );
  NOR2X1 U107 ( .A(n40), .B(n43), .Y(n38) );
endmodule


module SNN_DW01_add_213 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n14, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n42, n92, n93, n94;

  AOI21X1 U27 ( .A0(n25), .A1(n33), .B0(n26), .Y(n24) );
  ADDFX2 U48 ( .A(A[2]), .B(B[2]), .CI(n37), .CO(n36), .S(SUM[2]) );
  ADDFX2 U49 ( .A(A[1]), .B(B[1]), .CI(n93), .CO(n37), .S(SUM[1]) );
  NOR2X1 U57 ( .A(A[3]), .B(B[3]), .Y(n34) );
  NAND2XL U58 ( .A(A[3]), .B(B[3]), .Y(n35) );
  NAND2XL U59 ( .A(A[5]), .B(B[5]), .Y(n28) );
  NOR2XL U60 ( .A(A[5]), .B(B[5]), .Y(n27) );
  OR2X1 U61 ( .A(n14), .B(n94), .Y(n92) );
  XNOR2X1 U62 ( .A(n29), .B(n2), .Y(SUM[5]) );
  OAI21XL U63 ( .A0(n27), .A1(n31), .B0(n28), .Y(n26) );
  OAI21X1 U64 ( .A0(n34), .A1(n1), .B0(n35), .Y(n33) );
  CLKINVX2 U65 ( .A(n36), .Y(n1) );
  XNOR2X1 U66 ( .A(n4), .B(n36), .Y(SUM[3]) );
  NAND2BXL U67 ( .AN(n30), .B(n31), .Y(n3) );
  NAND2BX1 U68 ( .AN(n27), .B(n28), .Y(n2) );
  XOR2X1 U69 ( .A(n32), .B(n3), .Y(SUM[4]) );
  INVX2 U70 ( .A(n33), .Y(n32) );
  NAND2XL U71 ( .A(B[8]), .B(B[7]), .Y(n14) );
  NAND2XL U72 ( .A(n42), .B(n35), .Y(n4) );
  CLKINVXL U73 ( .A(n34), .Y(n42) );
  INVX2 U74 ( .A(B[11]), .Y(n94) );
  NOR2X1 U75 ( .A(A[4]), .B(B[4]), .Y(n30) );
  NAND2XL U76 ( .A(A[4]), .B(B[4]), .Y(n31) );
  OR2X1 U77 ( .A(A[0]), .B(B[0]), .Y(n93) );
  XNOR2XL U78 ( .A(A[0]), .B(B[0]), .Y(SUM[0]) );
  OAI21X1 U79 ( .A0(n32), .A1(n30), .B0(n31), .Y(n29) );
  NOR2X1 U80 ( .A(n24), .B(n92), .Y(CO) );
  NOR2X1 U81 ( .A(n27), .B(n30), .Y(n25) );
endmodule


module SNN_DW01_add_186 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n9, n10, n11, n12, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n58, n59, n60, n110, n111, n112, n115,
         n116;

  OAI21X4 U3 ( .A0(n1), .A1(n9), .B0(n10), .Y(CO) );
  NOR2X2 U52 ( .A(n48), .B(n45), .Y(n43) );
  AOI21X2 U77 ( .A0(n37), .A1(n11), .B0(n12), .Y(n10) );
  NOR2X1 U78 ( .A(n32), .B(n110), .Y(n12) );
  NAND2X1 U79 ( .A(n112), .B(B[13]), .Y(n110) );
  BUFX1 U80 ( .A(n1), .Y(n111) );
  NOR2X1 U81 ( .A(A[6]), .B(B[6]), .Y(n41) );
  INVX1 U82 ( .A(n48), .Y(n59) );
  NOR2X2 U83 ( .A(A[7]), .B(B[7]), .Y(n38) );
  NAND2X1 U84 ( .A(A[7]), .B(B[7]), .Y(n39) );
  NOR2X2 U85 ( .A(A[8]), .B(B[8]), .Y(n31) );
  NAND2X1 U86 ( .A(A[8]), .B(B[8]), .Y(n32) );
  NAND2XL U87 ( .A(n58), .B(n46), .Y(n5) );
  NOR2X2 U88 ( .A(n41), .B(n38), .Y(n36) );
  NAND2X2 U89 ( .A(A[4]), .B(B[4]), .Y(n49) );
  NOR2X4 U90 ( .A(n31), .B(n110), .Y(n11) );
  NOR2X2 U91 ( .A(A[4]), .B(B[4]), .Y(n48) );
  NAND2X1 U92 ( .A(A[5]), .B(B[5]), .Y(n46) );
  NAND2BX1 U93 ( .AN(n41), .B(n42), .Y(n4) );
  OAI21X2 U94 ( .A0(n38), .A1(n42), .B0(n39), .Y(n37) );
  CLKINVXL U95 ( .A(n36), .Y(n34) );
  CLKINVXL U96 ( .A(n52), .Y(n60) );
  AND2X1 U97 ( .A(B[10]), .B(B[9]), .Y(n112) );
  XNOR2X1 U98 ( .A(n40), .B(n3), .Y(SUM[7]) );
  XNOR2X1 U99 ( .A(n33), .B(n2), .Y(SUM[8]) );
  NAND2BX1 U100 ( .AN(n38), .B(n39), .Y(n3) );
  NAND2BX1 U101 ( .AN(n31), .B(n32), .Y(n2) );
  NAND2X2 U102 ( .A(A[6]), .B(B[6]), .Y(n42) );
  XNOR2X1 U103 ( .A(n47), .B(n5), .Y(SUM[5]) );
  OAI21XL U104 ( .A0(n50), .A1(n48), .B0(n49), .Y(n47) );
  CLKINVXL U105 ( .A(n45), .Y(n58) );
  CLKINVXL U106 ( .A(n37), .Y(n35) );
  XOR2X1 U107 ( .A(n50), .B(n6), .Y(SUM[4]) );
  NAND2XL U108 ( .A(n59), .B(n49), .Y(n6) );
  CLKINVXL U109 ( .A(n51), .Y(n50) );
  XOR2X1 U110 ( .A(n7), .B(n54), .Y(SUM[3]) );
  NOR2X1 U111 ( .A(A[2]), .B(n115), .Y(n54) );
  INVX2 U112 ( .A(n116), .Y(n115) );
  CLKINVXL U113 ( .A(B[2]), .Y(n116) );
  XNOR2X1 U114 ( .A(A[2]), .B(n115), .Y(SUM[2]) );
  CLKBUFX1 U115 ( .A(A[1]), .Y(SUM[1]) );
  BUFX2 U116 ( .A(A[0]), .Y(SUM[0]) );
  NAND2X2 U117 ( .A(n36), .B(n11), .Y(n9) );
  NOR2X2 U118 ( .A(A[3]), .B(B[3]), .Y(n52) );
  NOR2X4 U119 ( .A(A[5]), .B(B[5]), .Y(n45) );
  OAI21X2 U120 ( .A0(n45), .A1(n49), .B0(n46), .Y(n44) );
  NAND2XL U121 ( .A(n60), .B(n53), .Y(n7) );
  NAND2X1 U122 ( .A(A[3]), .B(B[3]), .Y(n53) );
  OAI21X4 U123 ( .A0(n52), .A1(n54), .B0(n53), .Y(n51) );
  AOI21X4 U124 ( .A0(n51), .A1(n43), .B0(n44), .Y(n1) );
  OAI21XL U125 ( .A0(n1), .A1(n41), .B0(n42), .Y(n40) );
  OAI21XL U126 ( .A0(n111), .A1(n34), .B0(n35), .Y(n33) );
  XOR2X1 U127 ( .A(n111), .B(n4), .Y(SUM[6]) );
endmodule


module SNN_DW01_add_196 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n5, n7, n8, n11, n12, n13, n14, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n52, n53, n54, n55, n56, n57, n108, n109, n110,
         n111, n112, n114, n115;

  NOR2X2 U46 ( .A(n43), .B(n40), .Y(n38) );
  ADDFX2 U66 ( .A(A[2]), .B(B[2]), .CI(n112), .CO(n49), .S(SUM[2]) );
  AOI21X1 U74 ( .A0(n32), .A1(n13), .B0(n14), .Y(n12) );
  NOR2X1 U75 ( .A(A[4]), .B(B[4]), .Y(n43) );
  NOR2X1 U76 ( .A(A[6]), .B(B[6]), .Y(n36) );
  NAND2X1 U77 ( .A(A[6]), .B(B[6]), .Y(n37) );
  NAND2X1 U78 ( .A(B[9]), .B(B[12]), .Y(n108) );
  NAND2X1 U79 ( .A(A[4]), .B(B[4]), .Y(n44) );
  NOR2X2 U80 ( .A(A[7]), .B(B[7]), .Y(n33) );
  NOR2X2 U81 ( .A(A[8]), .B(B[8]), .Y(n26) );
  NOR2X4 U82 ( .A(A[5]), .B(B[5]), .Y(n40) );
  OAI21X2 U83 ( .A0(n47), .A1(n2), .B0(n48), .Y(n46) );
  NAND2XL U84 ( .A(A[3]), .B(B[3]), .Y(n48) );
  NOR2X2 U85 ( .A(A[3]), .B(B[3]), .Y(n47) );
  NAND2XL U86 ( .A(A[7]), .B(B[7]), .Y(n34) );
  XOR2X1 U87 ( .A(n35), .B(n109), .Y(SUM[7]) );
  AND2X1 U88 ( .A(n53), .B(n34), .Y(n109) );
  XOR2X1 U89 ( .A(n28), .B(n110), .Y(SUM[8]) );
  AND2X1 U90 ( .A(n52), .B(n27), .Y(n110) );
  CLKINVXL U91 ( .A(n40), .Y(n55) );
  CLKINVXL U92 ( .A(n31), .Y(n29) );
  NOR2X2 U93 ( .A(n26), .B(n108), .Y(n13) );
  OAI21X2 U94 ( .A0(n40), .A1(n44), .B0(n41), .Y(n39) );
  NAND2XL U95 ( .A(n56), .B(n44), .Y(n7) );
  XOR2X1 U96 ( .A(n42), .B(n111), .Y(SUM[5]) );
  AND2X1 U97 ( .A(n55), .B(n41), .Y(n111) );
  OR2XL U98 ( .A(A[1]), .B(n114), .Y(n112) );
  CLKINVX1 U99 ( .A(n115), .Y(n114) );
  OAI21X1 U100 ( .A0(n33), .A1(n37), .B0(n34), .Y(n32) );
  NOR2X1 U101 ( .A(n36), .B(n33), .Y(n31) );
  INVX2 U102 ( .A(n36), .Y(n54) );
  CLKINVXL U103 ( .A(n33), .Y(n53) );
  INVX2 U104 ( .A(n26), .Y(n52) );
  NAND2XL U105 ( .A(A[8]), .B(B[8]), .Y(n27) );
  OAI21XL U106 ( .A0(n45), .A1(n43), .B0(n44), .Y(n42) );
  CLKINVXL U107 ( .A(n32), .Y(n30) );
  CLKINVXL U108 ( .A(n43), .Y(n56) );
  NAND2X1 U109 ( .A(n31), .B(n13), .Y(n11) );
  XOR2X1 U110 ( .A(n45), .B(n7), .Y(SUM[4]) );
  NAND2XL U111 ( .A(n54), .B(n37), .Y(n5) );
  NOR2X1 U112 ( .A(n27), .B(n108), .Y(n14) );
  NAND2XL U113 ( .A(A[5]), .B(B[5]), .Y(n41) );
  CLKINVXL U114 ( .A(n46), .Y(n45) );
  INVX2 U115 ( .A(n47), .Y(n57) );
  XNOR2X1 U116 ( .A(n8), .B(n49), .Y(SUM[3]) );
  INVX2 U117 ( .A(n49), .Y(n2) );
  CLKINVXL U118 ( .A(B[1]), .Y(n115) );
  XNOR2XL U119 ( .A(A[1]), .B(n114), .Y(SUM[1]) );
  BUFX2 U120 ( .A(A[0]), .Y(SUM[0]) );
  OAI21X4 U121 ( .A0(n1), .A1(n11), .B0(n12), .Y(CO) );
  AOI21X4 U122 ( .A0(n46), .A1(n38), .B0(n39), .Y(n1) );
  OAI21XL U123 ( .A0(n1), .A1(n36), .B0(n37), .Y(n35) );
  NAND2XL U124 ( .A(n57), .B(n48), .Y(n8) );
  OAI21XL U125 ( .A0(n1), .A1(n29), .B0(n30), .Y(n28) );
  XOR2X1 U126 ( .A(n1), .B(n5), .Y(SUM[6]) );
endmodule


module SNN_DW01_add_191 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n5, n6, n7, n8, n10, n11, n12, n13, n23, n31, n32, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n65, n66, n68, n123, n124,
         n125, n126, n127, n128, n130;

  AOI21X1 U5 ( .A0(n45), .A1(n12), .B0(n13), .Y(n11) );
  NOR2X2 U51 ( .A(A[7]), .B(B[7]), .Y(n46) );
  OAI21X4 U75 ( .A0(n60), .A1(n2), .B0(n61), .Y(n59) );
  ADDFX2 U81 ( .A(A[2]), .B(B[2]), .CI(n128), .CO(n62), .S(SUM[2]) );
  AND2X1 U89 ( .A(n23), .B(B[13]), .Y(n127) );
  INVX2 U90 ( .A(n62), .Y(n2) );
  NOR2X2 U91 ( .A(A[5]), .B(B[5]), .Y(n53) );
  NAND2X1 U92 ( .A(A[4]), .B(B[4]), .Y(n57) );
  NOR2X1 U93 ( .A(A[4]), .B(B[4]), .Y(n56) );
  OAI21X1 U94 ( .A0(n46), .A1(n50), .B0(n47), .Y(n45) );
  NOR2X1 U95 ( .A(n49), .B(n46), .Y(n44) );
  NAND2BXL U96 ( .AN(n60), .B(n61), .Y(n8) );
  OAI21X2 U97 ( .A0(n53), .A1(n57), .B0(n54), .Y(n52) );
  NOR2X2 U98 ( .A(n56), .B(n53), .Y(n51) );
  NOR2X1 U99 ( .A(A[3]), .B(B[3]), .Y(n60) );
  CLKINVXL U100 ( .A(B[10]), .Y(n32) );
  NAND2XL U101 ( .A(A[6]), .B(B[6]), .Y(n50) );
  XOR2X1 U102 ( .A(n58), .B(n7), .Y(SUM[4]) );
  NAND2BXL U103 ( .AN(n49), .B(n50), .Y(n5) );
  XOR2X1 U104 ( .A(n48), .B(n123), .Y(SUM[7]) );
  AND2X1 U105 ( .A(n66), .B(n47), .Y(n123) );
  NAND2XL U106 ( .A(A[5]), .B(B[5]), .Y(n54) );
  AND2X1 U107 ( .A(B[12]), .B(n124), .Y(n23) );
  AND2X1 U108 ( .A(B[11]), .B(n31), .Y(n124) );
  XNOR2X1 U109 ( .A(n8), .B(n62), .Y(SUM[3]) );
  NAND2XL U110 ( .A(A[3]), .B(B[3]), .Y(n61) );
  OR2XL U111 ( .A(A[1]), .B(B[1]), .Y(n128) );
  XNOR2X1 U112 ( .A(A[1]), .B(B[1]), .Y(SUM[1]) );
  CLKINVXL U113 ( .A(n44), .Y(n42) );
  CLKINVXL U114 ( .A(n45), .Y(n43) );
  INVX2 U115 ( .A(B[9]), .Y(n130) );
  NAND2XL U116 ( .A(A[7]), .B(B[7]), .Y(n47) );
  NOR2X1 U117 ( .A(A[8]), .B(B[8]), .Y(n39) );
  NAND2XL U118 ( .A(A[8]), .B(B[8]), .Y(n40) );
  NAND2BX1 U119 ( .AN(n56), .B(n57), .Y(n7) );
  NOR2X1 U120 ( .A(A[6]), .B(B[6]), .Y(n49) );
  CLKINVXL U121 ( .A(n46), .Y(n66) );
  NOR2X1 U122 ( .A(n40), .B(n126), .Y(n13) );
  XOR2X1 U123 ( .A(n41), .B(n125), .Y(SUM[8]) );
  AND2X1 U124 ( .A(n65), .B(n40), .Y(n125) );
  XNOR2X1 U125 ( .A(n55), .B(n6), .Y(SUM[5]) );
  NAND2X1 U126 ( .A(n68), .B(n54), .Y(n6) );
  OAI21XL U127 ( .A0(n58), .A1(n56), .B0(n57), .Y(n55) );
  CLKINVXL U128 ( .A(n53), .Y(n68) );
  CLKINVXL U129 ( .A(n59), .Y(n58) );
  NOR2X1 U130 ( .A(n32), .B(n130), .Y(n31) );
  NAND2XL U131 ( .A(n127), .B(B[14]), .Y(n126) );
  BUFX2 U132 ( .A(A[0]), .Y(SUM[0]) );
  AOI21X4 U133 ( .A0(n59), .A1(n51), .B0(n52), .Y(n1) );
  INVX2 U134 ( .A(n39), .Y(n65) );
  NOR2X1 U135 ( .A(n39), .B(n126), .Y(n12) );
  OAI21X2 U136 ( .A0(n1), .A1(n10), .B0(n11), .Y(CO) );
  NAND2X1 U137 ( .A(n44), .B(n12), .Y(n10) );
  OAI21XL U138 ( .A0(n1), .A1(n49), .B0(n50), .Y(n48) );
  OAI21XL U139 ( .A0(n1), .A1(n42), .B0(n43), .Y(n41) );
  XOR2X1 U140 ( .A(n1), .B(n5), .Y(SUM[6]) );
endmodule


module SNN_DW01_add_193 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n22, n23, n24, n25, n34, n42, n43, n44, n45, n46, n47, n48, n50, n51,
         n53, n54, n55, n56, n60, n61, n63, n64, n65, n66, n67, n69, n70, n72,
         n74, n75, n138, n139, n140, n141, n142;

  AOI21X1 U44 ( .A0(n45), .A1(n54), .B0(n46), .Y(n44) );
  ADDFX2 U96 ( .A(A[2]), .B(B[2]), .CI(n142), .CO(n75) );
  OAI21X2 U103 ( .A0(n66), .A1(n70), .B0(n67), .Y(n65) );
  NOR2X4 U104 ( .A(A[5]), .B(B[5]), .Y(n66) );
  NOR2X2 U105 ( .A(A[9]), .B(B[9]), .Y(n47) );
  INVX2 U106 ( .A(B[3]), .Y(n139) );
  NOR2X1 U107 ( .A(A[8]), .B(B[8]), .Y(n50) );
  OAI2BB1X2 U108 ( .A0N(n75), .A1N(n141), .B0(n74), .Y(n72) );
  NAND2BX1 U109 ( .AN(A[3]), .B(n139), .Y(n141) );
  NOR2X1 U110 ( .A(n23), .B(A[14]), .Y(n138) );
  NOR2X1 U111 ( .A(A[10]), .B(A[11]), .Y(n34) );
  NOR2X1 U112 ( .A(A[13]), .B(n140), .Y(n25) );
  NAND2XL U113 ( .A(n53), .B(n45), .Y(n43) );
  OAI21XL U114 ( .A0(n63), .A1(n43), .B0(n44), .Y(n42) );
  AOI21X1 U115 ( .A0(n64), .A1(n72), .B0(n65), .Y(n63) );
  NAND2XL U116 ( .A(A[6]), .B(B[6]), .Y(n61) );
  NOR2XL U117 ( .A(A[6]), .B(B[6]), .Y(n60) );
  OAI2BB1X2 U118 ( .A0N(n42), .A1N(n22), .B0(n138), .Y(CO) );
  NAND2XL U119 ( .A(A[7]), .B(B[7]), .Y(n56) );
  NOR2XL U120 ( .A(n60), .B(n55), .Y(n53) );
  NOR2XL U121 ( .A(A[12]), .B(B[12]), .Y(n24) );
  AND2X1 U122 ( .A(A[12]), .B(B[12]), .Y(n140) );
  NOR2X2 U123 ( .A(A[7]), .B(B[7]), .Y(n55) );
  OAI21X1 U124 ( .A0(n61), .A1(n55), .B0(n56), .Y(n54) );
  NAND2XL U125 ( .A(A[4]), .B(B[4]), .Y(n70) );
  CLKINVXL U126 ( .A(n24), .Y(n22) );
  OAI21XL U127 ( .A0(n47), .A1(n51), .B0(n48), .Y(n46) );
  NAND2XL U128 ( .A(A[8]), .B(B[8]), .Y(n51) );
  NAND2XL U129 ( .A(A[5]), .B(B[5]), .Y(n67) );
  NOR2X1 U130 ( .A(n69), .B(n66), .Y(n64) );
  NOR2X1 U131 ( .A(A[4]), .B(B[4]), .Y(n69) );
  OR2X1 U132 ( .A(A[1]), .B(B[1]), .Y(n142) );
  NAND2XL U133 ( .A(A[3]), .B(B[3]), .Y(n74) );
  OAI21XL U134 ( .A0(n34), .A1(n24), .B0(n25), .Y(n23) );
  NAND2XL U135 ( .A(A[9]), .B(B[9]), .Y(n48) );
  NOR2X1 U136 ( .A(n47), .B(n50), .Y(n45) );
endmodule


module SNN_DW01_add_188 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n1, n15, n17, n18, n19, n20, n21, n22, n26, n27, n31, n32, n33, n34,
         n41, n43, n45, n46, n48, n49, n50, n51, n52, n53, n54, n56, n57, n59,
         n60, n61, n62, n66, n67, n69, n70, n71, n72, n73, n75, n76, n78, n79,
         n80, n81, n147, n149, n150, n151, n152;

  AOI21X1 U54 ( .A0(n51), .A1(n60), .B0(n52), .Y(n50) );
  AOI21X1 U85 ( .A0(n70), .A1(n78), .B0(n71), .Y(n69) );
  ADDFX2 U106 ( .A(B[2]), .B(A[2]), .CI(n151), .CO(n81) );
  NAND2BX2 U113 ( .AN(A[12]), .B(n149), .Y(n152) );
  CLKINVXL U114 ( .A(B[12]), .Y(n149) );
  NOR2X1 U115 ( .A(A[9]), .B(B[9]), .Y(n53) );
  NOR2X1 U116 ( .A(A[14]), .B(B[14]), .Y(n21) );
  OR2XL U117 ( .A(A[11]), .B(B[11]), .Y(n150) );
  NOR2X1 U118 ( .A(A[5]), .B(B[5]), .Y(n72) );
  NOR2X1 U119 ( .A(A[3]), .B(B[3]), .Y(n79) );
  NOR2X1 U120 ( .A(A[8]), .B(B[8]), .Y(n56) );
  NOR2X1 U121 ( .A(n66), .B(n61), .Y(n59) );
  OAI21X1 U122 ( .A0(n33), .A1(n46), .B0(n34), .Y(n32) );
  AOI21X1 U123 ( .A0(n152), .A1(n41), .B0(n147), .Y(n34) );
  AND2X1 U124 ( .A(B[12]), .B(A[12]), .Y(n147) );
  NOR2X1 U125 ( .A(A[10]), .B(B[10]), .Y(n45) );
  NAND2X1 U126 ( .A(n19), .B(n31), .Y(n17) );
  NOR2X1 U127 ( .A(n33), .B(n45), .Y(n31) );
  NAND2XL U128 ( .A(A[6]), .B(B[6]), .Y(n67) );
  NOR2XL U129 ( .A(A[13]), .B(B[13]), .Y(n26) );
  NAND2XL U130 ( .A(A[13]), .B(B[13]), .Y(n27) );
  OAI2BB1X2 U131 ( .A0N(n48), .A1N(n15), .B0(n18), .Y(CO) );
  OAI21XL U132 ( .A0(n53), .A1(n57), .B0(n54), .Y(n52) );
  NAND2X1 U133 ( .A(A[10]), .B(B[10]), .Y(n46) );
  NOR2X2 U134 ( .A(A[7]), .B(B[7]), .Y(n61) );
  OAI21X1 U135 ( .A0(n69), .A1(n49), .B0(n50), .Y(n48) );
  NOR2XL U136 ( .A(A[6]), .B(B[6]), .Y(n66) );
  OAI21XL U137 ( .A0(n67), .A1(n61), .B0(n62), .Y(n60) );
  OAI21X1 U138 ( .A0(n72), .A1(n76), .B0(n73), .Y(n71) );
  NAND2XL U139 ( .A(A[11]), .B(B[11]), .Y(n43) );
  AOI21X1 U140 ( .A0(n19), .A1(n32), .B0(n20), .Y(n18) );
  NAND2X1 U141 ( .A(A[4]), .B(B[4]), .Y(n76) );
  NOR2X1 U142 ( .A(A[4]), .B(B[4]), .Y(n75) );
  NAND2XL U143 ( .A(A[7]), .B(B[7]), .Y(n62) );
  OR2X1 U144 ( .A(A[1]), .B(B[1]), .Y(n151) );
  NAND2X1 U145 ( .A(A[8]), .B(B[8]), .Y(n57) );
  NAND2X1 U146 ( .A(n152), .B(n150), .Y(n33) );
  INVX1 U147 ( .A(n17), .Y(n15) );
  NAND2XL U148 ( .A(A[5]), .B(B[5]), .Y(n73) );
  OAI21XL U149 ( .A0(n79), .A1(n1), .B0(n80), .Y(n78) );
  NOR2X1 U150 ( .A(n75), .B(n72), .Y(n70) );
  INVX2 U151 ( .A(n81), .Y(n1) );
  NAND2XL U152 ( .A(n59), .B(n51), .Y(n49) );
  NAND2XL U153 ( .A(A[3]), .B(B[3]), .Y(n80) );
  NAND2XL U154 ( .A(A[9]), .B(B[9]), .Y(n54) );
  NOR2X1 U155 ( .A(n53), .B(n56), .Y(n51) );
  OAI21XL U156 ( .A0(n21), .A1(n27), .B0(n22), .Y(n20) );
  NOR2X1 U157 ( .A(n26), .B(n21), .Y(n19) );
  INVX2 U158 ( .A(n43), .Y(n41) );
  NAND2XL U159 ( .A(A[14]), .B(B[14]), .Y(n22) );
endmodule


module SNN_DW01_add_185 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n6, n7, n8, n28, n29, n38, n91, n92, n93;

  NAND2X4 U8 ( .A(n7), .B(n28), .Y(n6) );
  NOR2X2 U9 ( .A(n8), .B(n91), .Y(n7) );
  NOR2X4 U37 ( .A(n29), .B(n38), .Y(n28) );
  INVX2 U57 ( .A(n93), .Y(n92) );
  BUFX1 U58 ( .A(A[0]), .Y(SUM[0]) );
  NAND2X1 U59 ( .A(B[9]), .B(B[12]), .Y(n8) );
  CLKINVXL U60 ( .A(B[1]), .Y(n93) );
  NOR2X2 U61 ( .A(n92), .B(A[1]), .Y(n38) );
  NAND2X1 U62 ( .A(B[4]), .B(B[3]), .Y(n29) );
  INVX2 U63 ( .A(B[5]), .Y(n91) );
  XNOR2XL U64 ( .A(A[1]), .B(n92), .Y(SUM[1]) );
  XOR2X1 U65 ( .A(n38), .B(n91), .Y(SUM[2]) );
  CLKINVX8 U66 ( .A(n6), .Y(CO) );
endmodule


module SNN_DW01_add_198 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n12, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n92, n95, n96, n97;

  OAI21X2 U59 ( .A0(n30), .A1(n34), .B0(n31), .Y(n29) );
  NOR2X2 U60 ( .A(n30), .B(n33), .Y(n28) );
  NOR2X2 U61 ( .A(A[4]), .B(B[4]), .Y(n33) );
  NOR2X2 U62 ( .A(A[3]), .B(B[3]), .Y(n37) );
  NAND2X1 U63 ( .A(A[3]), .B(B[3]), .Y(n38) );
  INVX1 U64 ( .A(n36), .Y(n35) );
  NAND2X2 U65 ( .A(A[4]), .B(B[4]), .Y(n34) );
  OAI21X2 U66 ( .A0(n37), .A1(n39), .B0(n38), .Y(n36) );
  XOR2X1 U67 ( .A(n3), .B(n39), .Y(SUM[3]) );
  CLKINVXL U68 ( .A(B[13]), .Y(n95) );
  CLKINVX2 U69 ( .A(n97), .Y(n96) );
  XNOR2X1 U70 ( .A(A[2]), .B(n96), .Y(SUM[2]) );
  OR2X1 U71 ( .A(n12), .B(n95), .Y(n92) );
  NAND2XL U72 ( .A(B[9]), .B(B[10]), .Y(n12) );
  CLKINVXL U73 ( .A(n30), .Y(n40) );
  XOR2X1 U74 ( .A(n35), .B(n2), .Y(SUM[4]) );
  CLKINVXL U75 ( .A(n33), .Y(n41) );
  NAND2XL U76 ( .A(n42), .B(n38), .Y(n3) );
  CLKINVXL U77 ( .A(n37), .Y(n42) );
  NOR2X1 U78 ( .A(A[2]), .B(n96), .Y(n39) );
  CLKINVXL U79 ( .A(B[2]), .Y(n97) );
  BUFX2 U80 ( .A(A[1]), .Y(SUM[1]) );
  CLKBUFX1 U81 ( .A(A[0]), .Y(SUM[0]) );
  XNOR2X1 U82 ( .A(n32), .B(n1), .Y(SUM[5]) );
  NAND2X1 U83 ( .A(A[5]), .B(B[5]), .Y(n31) );
  AOI21X4 U84 ( .A0(n36), .A1(n28), .B0(n29), .Y(n27) );
  OAI21XL U85 ( .A0(n35), .A1(n33), .B0(n34), .Y(n32) );
  NAND2XL U86 ( .A(n41), .B(n34), .Y(n2) );
  NAND2XL U87 ( .A(n40), .B(n31), .Y(n1) );
  NOR2X4 U88 ( .A(B[5]), .B(A[5]), .Y(n30) );
  NOR2X4 U89 ( .A(n27), .B(n92), .Y(CO) );
endmodule


module SNN_DW01_add_201 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n2, n3, n14, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n43, n44, n94, n95, n96, n97, n99, n100, n101, n102;

  ADDFX2 U52 ( .A(A[2]), .B(B[2]), .CI(n97), .CO(n39), .S(SUM[2]) );
  NAND2BXL U60 ( .AN(n30), .B(n31), .Y(n2) );
  OR2X1 U61 ( .A(n14), .B(n99), .Y(n96) );
  CLKINVX2 U62 ( .A(n36), .Y(n35) );
  NAND2XL U63 ( .A(B[5]), .B(A[5]), .Y(n31) );
  NAND2X1 U64 ( .A(A[3]), .B(B[3]), .Y(n38) );
  AOI21X2 U65 ( .A0(n28), .A1(n36), .B0(n29), .Y(n27) );
  NOR2X2 U66 ( .A(A[3]), .B(B[3]), .Y(n37) );
  OAI21X2 U67 ( .A0(n37), .A1(n94), .B0(n38), .Y(n36) );
  OAI21X1 U68 ( .A0(n30), .A1(n34), .B0(n31), .Y(n29) );
  NOR2X2 U69 ( .A(A[5]), .B(B[5]), .Y(n30) );
  INVX1 U70 ( .A(n39), .Y(n94) );
  CLKINVXL U71 ( .A(n33), .Y(n43) );
  XOR2X1 U72 ( .A(n95), .B(n39), .Y(SUM[3]) );
  AND2X1 U73 ( .A(n44), .B(n38), .Y(n95) );
  CLKINVX2 U74 ( .A(n101), .Y(n100) );
  INVX2 U75 ( .A(n37), .Y(n44) );
  NAND2XL U76 ( .A(B[9]), .B(B[8]), .Y(n14) );
  XOR2X1 U77 ( .A(n35), .B(n3), .Y(SUM[4]) );
  NAND2XL U78 ( .A(n43), .B(n102), .Y(n3) );
  INVX2 U79 ( .A(B[12]), .Y(n99) );
  XNOR2X1 U80 ( .A(A[1]), .B(n100), .Y(SUM[1]) );
  NOR2X1 U81 ( .A(A[4]), .B(B[4]), .Y(n33) );
  OR2X1 U82 ( .A(A[1]), .B(n100), .Y(n97) );
  CLKINVXL U83 ( .A(B[1]), .Y(n101) );
  CLKBUFX1 U84 ( .A(A[0]), .Y(SUM[0]) );
  NAND2XL U85 ( .A(A[4]), .B(B[4]), .Y(n102) );
  NAND2XL U86 ( .A(A[4]), .B(B[4]), .Y(n34) );
  XNOR2X1 U87 ( .A(n32), .B(n2), .Y(SUM[5]) );
  OAI21XL U88 ( .A0(n35), .A1(n33), .B0(n102), .Y(n32) );
  NOR2X2 U89 ( .A(n27), .B(n96), .Y(CO) );
  NOR2X1 U90 ( .A(n30), .B(n33), .Y(n28) );
endmodule


module SNN_DW01_add_183 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n3, n4, n8, n11, n21, n22, n25, n29, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n58, n113, n114, n115, n116, n117;

  NOR2X2 U22 ( .A(n22), .B(n25), .Y(n21) );
  ADDFX2 U71 ( .A(A[2]), .B(B[2]), .CI(n115), .CO(n55), .S(SUM[2]) );
  NOR2XL U79 ( .A(n46), .B(n49), .Y(n44) );
  NAND2X1 U80 ( .A(B[10]), .B(n29), .Y(n25) );
  AND2X1 U81 ( .A(B[9]), .B(B[6]), .Y(n29) );
  INVX2 U82 ( .A(B[11]), .Y(n22) );
  INVX2 U83 ( .A(B[14]), .Y(n8) );
  NOR2X1 U84 ( .A(A[4]), .B(B[4]), .Y(n49) );
  CLKINVXL U85 ( .A(n52), .Y(n51) );
  OR2X1 U86 ( .A(n11), .B(n8), .Y(n113) );
  AND2X1 U87 ( .A(B[12]), .B(B[13]), .Y(n114) );
  OR2X1 U88 ( .A(A[1]), .B(B[1]), .Y(n115) );
  NOR2X1 U89 ( .A(A[3]), .B(B[3]), .Y(n53) );
  NAND2BXL U90 ( .AN(n53), .B(n54), .Y(n4) );
  OAI21X1 U91 ( .A0(n53), .A1(n116), .B0(n54), .Y(n52) );
  AOI21X1 U92 ( .A0(n52), .A1(n44), .B0(n45), .Y(n43) );
  OAI21XL U93 ( .A0(n46), .A1(n50), .B0(n47), .Y(n45) );
  NOR2X1 U94 ( .A(A[5]), .B(B[5]), .Y(n46) );
  INVX2 U95 ( .A(n55), .Y(n116) );
  NOR2X2 U96 ( .A(n43), .B(n113), .Y(CO) );
  XNOR2X1 U97 ( .A(n4), .B(n55), .Y(SUM[3]) );
  XOR2X1 U98 ( .A(n48), .B(n117), .Y(SUM[5]) );
  AND2X1 U99 ( .A(n58), .B(n47), .Y(n117) );
  NAND2BXL U100 ( .AN(n49), .B(n50), .Y(n3) );
  NAND2XL U101 ( .A(A[5]), .B(B[5]), .Y(n47) );
  XOR2X1 U102 ( .A(n51), .B(n3), .Y(SUM[4]) );
  NAND2XL U103 ( .A(A[3]), .B(B[3]), .Y(n54) );
  CLKINVXL U104 ( .A(n46), .Y(n58) );
  XNOR2XL U105 ( .A(A[1]), .B(B[1]), .Y(SUM[1]) );
  NAND2X2 U106 ( .A(A[4]), .B(B[4]), .Y(n50) );
  BUFX2 U107 ( .A(A[0]), .Y(SUM[0]) );
  NAND2X1 U108 ( .A(n114), .B(n21), .Y(n11) );
  OAI21XL U109 ( .A0(n51), .A1(n49), .B0(n50), .Y(n48) );
endmodule


module SNN_DW01_add_134 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n1, n4, n5, n6, n7, n9, n10, n16, n21, n23, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n40, n41, n42, n43, n45, n48, n49, n50,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n71, n72, n73, n74, n75, n76, n77, n131, n132, n134,
         n135;

  AOI21X1 U36 ( .A0(n55), .A1(n35), .B0(n36), .Y(n34) );
  AOI21X1 U46 ( .A0(n55), .A1(n42), .B0(n43), .Y(n41) );
  AOI21X1 U58 ( .A0(n55), .A1(n74), .B0(n52), .Y(n50) );
  ADDFX2 U88 ( .A(A[2]), .B(B[2]), .CI(n132), .CO(n68), .S(SUM[2]) );
  OAI21X2 U96 ( .A0(n48), .A1(n54), .B0(n49), .Y(n43) );
  NOR2X2 U97 ( .A(n53), .B(n48), .Y(n42) );
  NOR2X2 U98 ( .A(A[7]), .B(B[7]), .Y(n48) );
  NAND2X1 U99 ( .A(n21), .B(B[12]), .Y(n16) );
  NAND2X1 U100 ( .A(A[6]), .B(B[6]), .Y(n54) );
  NOR2X1 U101 ( .A(A[8]), .B(B[8]), .Y(n37) );
  NAND2X1 U102 ( .A(A[7]), .B(B[7]), .Y(n49) );
  NOR2X1 U103 ( .A(n37), .B(n32), .Y(n30) );
  CLKINVXL U104 ( .A(n32), .Y(n71) );
  NOR2X2 U105 ( .A(n62), .B(n59), .Y(n57) );
  INVX1 U106 ( .A(n56), .Y(n55) );
  OAI21X2 U107 ( .A0(n59), .A1(n63), .B0(n60), .Y(n58) );
  NOR2X2 U108 ( .A(A[5]), .B(B[5]), .Y(n59) );
  NOR2X2 U109 ( .A(A[4]), .B(B[4]), .Y(n62) );
  INVX1 U110 ( .A(n62), .Y(n76) );
  NOR2X1 U111 ( .A(A[6]), .B(B[6]), .Y(n53) );
  NOR2XL U112 ( .A(n27), .B(A[10]), .Y(n23) );
  AOI21X1 U113 ( .A0(n30), .A1(n43), .B0(n31), .Y(n29) );
  NAND2XL U114 ( .A(A[5]), .B(B[5]), .Y(n60) );
  NAND2X1 U115 ( .A(A[4]), .B(B[4]), .Y(n63) );
  NAND2X1 U116 ( .A(A[3]), .B(B[3]), .Y(n67) );
  OAI21X2 U117 ( .A0(n56), .A1(n28), .B0(n29), .Y(n27) );
  OAI21X2 U118 ( .A0(n66), .A1(n1), .B0(n67), .Y(n65) );
  CLKINVXL U119 ( .A(n37), .Y(n72) );
  AOI21X2 U120 ( .A0(n57), .A1(n65), .B0(n58), .Y(n56) );
  OAI21XL U121 ( .A0(n45), .A1(n37), .B0(n40), .Y(n36) );
  NOR2X2 U122 ( .A(A[3]), .B(B[3]), .Y(n66) );
  CLKINVXL U123 ( .A(n43), .Y(n45) );
  XNOR2X1 U124 ( .A(n27), .B(A[10]), .Y(SUM[10]) );
  NAND2XL U125 ( .A(A[8]), .B(B[8]), .Y(n40) );
  CLKINVXL U126 ( .A(n59), .Y(n75) );
  OR2X1 U127 ( .A(A[10]), .B(A[11]), .Y(n21) );
  CLKINVXL U128 ( .A(n54), .Y(n52) );
  NOR2BXL U129 ( .AN(n42), .B(n37), .Y(n35) );
  CLKINVXL U130 ( .A(n48), .Y(n73) );
  XOR2X1 U131 ( .A(n50), .B(n6), .Y(SUM[7]) );
  NAND2XL U132 ( .A(n73), .B(n49), .Y(n6) );
  XOR2X1 U133 ( .A(n41), .B(n5), .Y(SUM[8]) );
  NAND2XL U134 ( .A(n72), .B(n40), .Y(n5) );
  XOR2X1 U135 ( .A(n34), .B(n4), .Y(SUM[9]) );
  NAND2XL U136 ( .A(n71), .B(n33), .Y(n4) );
  OAI21XL U137 ( .A0(n64), .A1(n62), .B0(n63), .Y(n61) );
  INVX2 U138 ( .A(n66), .Y(n77) );
  XNOR2X1 U139 ( .A(n55), .B(n7), .Y(SUM[6]) );
  NAND2XL U140 ( .A(n74), .B(n54), .Y(n7) );
  CLKINVXL U141 ( .A(n65), .Y(n64) );
  OAI2BB1X4 U142 ( .A0N(n27), .A1N(B[12]), .B0(n16), .Y(CO) );
  XOR2X1 U143 ( .A(n61), .B(n131), .Y(SUM[5]) );
  AND2X1 U144 ( .A(n75), .B(n60), .Y(n131) );
  INVX2 U145 ( .A(n68), .Y(n1) );
  XNOR2X1 U146 ( .A(n10), .B(n68), .Y(SUM[3]) );
  XOR2X1 U147 ( .A(n64), .B(n9), .Y(SUM[4]) );
  NAND2XL U148 ( .A(n76), .B(n63), .Y(n9) );
  OR2X1 U149 ( .A(A[1]), .B(n134), .Y(n132) );
  INVX2 U150 ( .A(n135), .Y(n134) );
  CLKINVXL U151 ( .A(B[1]), .Y(n135) );
  XNOR2X1 U152 ( .A(A[1]), .B(n134), .Y(SUM[1]) );
  BUFX2 U153 ( .A(A[0]), .Y(SUM[0]) );
  NAND2XL U154 ( .A(n77), .B(n67), .Y(n10) );
  INVX2 U155 ( .A(n53), .Y(n74) );
  XOR2XL U156 ( .A(n23), .B(A[11]), .Y(SUM[11]) );
  NAND2XL U157 ( .A(A[9]), .B(B[9]), .Y(n33) );
  OAI21XL U158 ( .A0(n32), .A1(n40), .B0(n33), .Y(n31) );
  NOR2X1 U159 ( .A(A[9]), .B(B[9]), .Y(n32) );
  NAND2X1 U160 ( .A(n42), .B(n30), .Y(n28) );
endmodule


module SNN_DW01_add_168 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n1, n5, n6, n9, n10, n19, n20, n21, n22, n24, n25, n28, n29, n30, n32,
         n35, n36, n37, n38, n39, n41, n44, n45, n46, n47, n48, n51, n52, n53,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n76, n77, n78, n79, n80, n81, n135, n136, n138,
         n139, n140, n141, n142;

  AOI21X1 U28 ( .A0(n58), .A1(n29), .B0(n30), .Y(n28) );
  AOI21X1 U37 ( .A0(n58), .A1(n36), .B0(n37), .Y(n35) );
  AOI21X1 U61 ( .A0(n58), .A1(n78), .B0(n55), .Y(n53) );
  ADDFX2 U91 ( .A(A[2]), .B(B[2]), .CI(n72), .CO(n71), .S(SUM[2]) );
  ADDFX2 U92 ( .A(A[1]), .B(B[1]), .CI(n140), .CO(n72), .S(SUM[1]) );
  OAI2BB1X2 U100 ( .A0N(n20), .A1N(n139), .B0(n19), .Y(CO) );
  OAI21X1 U101 ( .A0(n69), .A1(n1), .B0(n70), .Y(n68) );
  AOI21X1 U102 ( .A0(n60), .A1(n68), .B0(n61), .Y(n59) );
  OAI21X1 U103 ( .A0(n62), .A1(n66), .B0(n63), .Y(n61) );
  NOR2X1 U104 ( .A(n65), .B(n62), .Y(n60) );
  NOR2X1 U105 ( .A(A[3]), .B(B[3]), .Y(n69) );
  NOR2X1 U106 ( .A(n47), .B(n38), .Y(n36) );
  OAI21X1 U107 ( .A0(n59), .A1(n21), .B0(n22), .Y(n20) );
  NOR2XL U108 ( .A(A[7]), .B(B[7]), .Y(n51) );
  NAND2XL U109 ( .A(A[8]), .B(B[8]), .Y(n39) );
  CLKINVX1 U110 ( .A(n62), .Y(n79) );
  NOR2X1 U111 ( .A(A[5]), .B(B[5]), .Y(n62) );
  NOR2X1 U112 ( .A(A[4]), .B(B[4]), .Y(n65) );
  AND2XL U113 ( .A(n78), .B(n57), .Y(n135) );
  INVX1 U114 ( .A(n46), .Y(n48) );
  INVXL U115 ( .A(n57), .Y(n55) );
  NOR2XL U116 ( .A(A[9]), .B(n41), .Y(n32) );
  NOR2XL U117 ( .A(A[9]), .B(A[10]), .Y(n25) );
  NOR2X1 U118 ( .A(n56), .B(n51), .Y(n45) );
  CLKINVXL U119 ( .A(n51), .Y(n77) );
  XOR2X1 U120 ( .A(n53), .B(n6), .Y(SUM[7]) );
  XOR2X1 U121 ( .A(n58), .B(n135), .Y(SUM[6]) );
  CLKINVXL U122 ( .A(n56), .Y(n78) );
  NAND2X1 U123 ( .A(n25), .B(n39), .Y(n24) );
  AOI21X1 U124 ( .A0(n46), .A1(n76), .B0(n24), .Y(n22) );
  NAND2XL U125 ( .A(A[6]), .B(B[6]), .Y(n57) );
  XOR2X1 U126 ( .A(n64), .B(n136), .Y(SUM[5]) );
  AND2X1 U127 ( .A(n79), .B(n63), .Y(n136) );
  NAND2XL U128 ( .A(A[4]), .B(B[4]), .Y(n66) );
  INVX2 U129 ( .A(n45), .Y(n47) );
  OAI21X1 U130 ( .A0(n51), .A1(n57), .B0(n52), .Y(n46) );
  NAND2XL U131 ( .A(n77), .B(n52), .Y(n6) );
  NOR2X1 U132 ( .A(A[6]), .B(B[6]), .Y(n56) );
  INVX2 U133 ( .A(n38), .Y(n76) );
  CLKINVXL U134 ( .A(n59), .Y(n58) );
  XOR2X1 U135 ( .A(n44), .B(n5), .Y(SUM[8]) );
  XOR2XL U136 ( .A(n28), .B(A[10]), .Y(SUM[10]) );
  NOR2X1 U137 ( .A(n47), .B(n38), .Y(n29) );
  CLKINVXL U138 ( .A(n39), .Y(n41) );
  OAI21XL U139 ( .A0(n67), .A1(n65), .B0(n66), .Y(n64) );
  XOR2X1 U140 ( .A(n67), .B(n9), .Y(SUM[4]) );
  NAND2X1 U141 ( .A(n80), .B(n66), .Y(n9) );
  CLKINVXL U142 ( .A(n65), .Y(n80) );
  NOR2X1 U143 ( .A(A[8]), .B(B[8]), .Y(n38) );
  CLKINVXL U144 ( .A(n68), .Y(n67) );
  XOR2X1 U145 ( .A(n20), .B(n138), .Y(SUM[11]) );
  AND2X1 U146 ( .A(n139), .B(n19), .Y(n138) );
  INVX2 U147 ( .A(n71), .Y(n1) );
  OR2XL U148 ( .A(A[11]), .B(B[11]), .Y(n139) );
  XNOR2X1 U149 ( .A(n10), .B(n71), .Y(SUM[3]) );
  CLKINVXL U150 ( .A(n69), .Y(n81) );
  XNOR2X1 U151 ( .A(A[0]), .B(n141), .Y(SUM[0]) );
  OR2X1 U152 ( .A(A[0]), .B(n141), .Y(n140) );
  INVX2 U153 ( .A(n142), .Y(n141) );
  CLKINVXL U154 ( .A(B[0]), .Y(n142) );
  NAND2XL U155 ( .A(A[5]), .B(B[5]), .Y(n63) );
  NAND2XL U156 ( .A(A[11]), .B(B[11]), .Y(n19) );
  XOR2XL U157 ( .A(n35), .B(A[9]), .Y(SUM[9]) );
  AOI21XL U158 ( .A0(n58), .A1(n45), .B0(n46), .Y(n44) );
  NAND2XL U159 ( .A(n76), .B(n39), .Y(n5) );
  OAI21XL U160 ( .A0(n48), .A1(n38), .B0(n32), .Y(n30) );
  OAI21XL U161 ( .A0(n48), .A1(n38), .B0(n39), .Y(n37) );
  NAND2X1 U162 ( .A(n45), .B(n76), .Y(n21) );
  NAND2XL U163 ( .A(n81), .B(n70), .Y(n10) );
  NAND2XL U164 ( .A(A[7]), .B(B[7]), .Y(n52) );
  NAND2XL U165 ( .A(A[3]), .B(B[3]), .Y(n70) );
endmodule


module SNN_DW01_add_145 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n8, n9, n10, n14, n15, n16, n17, n19, n29,
         n30, n31, n32, n33, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n52, n53, n54, n55, n56, n57, n60, n61, n62,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n80, n84, n88, n90, n144, n145, n146;

  AOI21X1 U50 ( .A0(n67), .A1(n47), .B0(n48), .Y(n46) );
  AOI21X1 U72 ( .A0(n67), .A1(n88), .B0(n64), .Y(n62) );
  ADDFX2 U102 ( .A(n146), .B(A[2]), .CI(B[2]), .CO(n80), .S(SUM[2]) );
  CLKINVX2 U110 ( .A(n68), .Y(n67) );
  AOI21X2 U111 ( .A0(n69), .A1(n77), .B0(n70), .Y(n68) );
  NOR2X2 U112 ( .A(A[7]), .B(B[7]), .Y(n60) );
  NAND2X1 U113 ( .A(n30), .B(n16), .Y(n15) );
  NOR2X1 U114 ( .A(A[6]), .B(B[6]), .Y(n65) );
  OAI21X1 U115 ( .A0(n31), .A1(n37), .B0(n32), .Y(n30) );
  NAND2X1 U116 ( .A(A[6]), .B(B[6]), .Y(n66) );
  OAI21X1 U117 ( .A0(n60), .A1(n66), .B0(n61), .Y(n55) );
  NOR2X1 U118 ( .A(n65), .B(n60), .Y(n54) );
  NOR2X1 U119 ( .A(A[11]), .B(B[11]), .Y(n31) );
  XOR2X1 U120 ( .A(n38), .B(n3), .Y(SUM[10]) );
  NAND2X1 U121 ( .A(A[3]), .B(B[3]), .Y(n144) );
  NOR2X1 U122 ( .A(A[9]), .B(B[9]), .Y(n44) );
  NAND2X1 U123 ( .A(A[4]), .B(B[4]), .Y(n75) );
  NAND2BX1 U124 ( .AN(n71), .B(n72), .Y(n8) );
  NOR2X1 U125 ( .A(n74), .B(n71), .Y(n69) );
  INVX4 U126 ( .A(n39), .Y(n38) );
  NOR2X1 U127 ( .A(A[5]), .B(B[5]), .Y(n71) );
  AOI21XL U128 ( .A0(n39), .A1(n84), .B0(n35), .Y(n33) );
  NOR2X1 U129 ( .A(A[4]), .B(B[4]), .Y(n74) );
  OAI21X1 U130 ( .A0(n75), .A1(n71), .B0(n72), .Y(n70) );
  OAI21X2 U131 ( .A0(n78), .A1(n1), .B0(n144), .Y(n77) );
  NOR2X1 U132 ( .A(A[3]), .B(B[3]), .Y(n78) );
  AOI21X1 U133 ( .A0(n42), .A1(n55), .B0(n43), .Y(n41) );
  NAND2XL U134 ( .A(A[9]), .B(B[9]), .Y(n45) );
  NOR2XL U135 ( .A(A[10]), .B(B[10]), .Y(n36) );
  NAND2BX1 U136 ( .AN(n44), .B(n45), .Y(n4) );
  NAND2XL U137 ( .A(n90), .B(n75), .Y(n9) );
  NAND2XL U138 ( .A(A[7]), .B(B[7]), .Y(n61) );
  CLKINVXL U139 ( .A(n65), .Y(n88) );
  XNOR2X1 U140 ( .A(n73), .B(n8), .Y(SUM[5]) );
  XNOR2X1 U141 ( .A(n10), .B(n80), .Y(SUM[3]) );
  NAND2BX1 U142 ( .AN(n60), .B(n61), .Y(n6) );
  OAI21XL U143 ( .A0(n44), .A1(n52), .B0(n45), .Y(n43) );
  NOR2X1 U144 ( .A(n36), .B(n31), .Y(n29) );
  CLKINVXL U145 ( .A(n55), .Y(n57) );
  INVX2 U146 ( .A(n36), .Y(n84) );
  NAND2XL U147 ( .A(n84), .B(n37), .Y(n3) );
  NAND2BXL U148 ( .AN(n31), .B(n32), .Y(n2) );
  NAND2BX1 U149 ( .AN(n49), .B(n52), .Y(n5) );
  NOR2X1 U150 ( .A(A[8]), .B(B[8]), .Y(n49) );
  XOR2X1 U151 ( .A(n62), .B(n6), .Y(SUM[7]) );
  XOR2X1 U152 ( .A(n53), .B(n5), .Y(SUM[8]) );
  NAND2X1 U153 ( .A(A[8]), .B(B[8]), .Y(n52) );
  XOR2X1 U154 ( .A(n33), .B(n2), .Y(SUM[11]) );
  XOR2X1 U155 ( .A(n46), .B(n4), .Y(SUM[9]) );
  NAND2XL U156 ( .A(A[10]), .B(B[10]), .Y(n37) );
  CLKINVXL U157 ( .A(n37), .Y(n35) );
  INVX2 U158 ( .A(n66), .Y(n64) );
  NOR2X1 U159 ( .A(n56), .B(n49), .Y(n47) );
  OAI21XL U160 ( .A0(n57), .A1(n49), .B0(n52), .Y(n48) );
  XOR2X1 U161 ( .A(n67), .B(n145), .Y(SUM[6]) );
  AND2X1 U162 ( .A(n88), .B(n66), .Y(n145) );
  NAND2X2 U163 ( .A(n29), .B(n16), .Y(n14) );
  NOR2X1 U164 ( .A(n19), .B(n17), .Y(n16) );
  OAI21XL U165 ( .A0(n76), .A1(n74), .B0(n75), .Y(n73) );
  XOR2X1 U166 ( .A(n76), .B(n9), .Y(SUM[4]) );
  CLKINVXL U167 ( .A(n74), .Y(n90) );
  CLKINVXL U168 ( .A(n77), .Y(n76) );
  NAND2BXL U169 ( .AN(n78), .B(n144), .Y(n10) );
  NAND2XL U170 ( .A(B[12]), .B(B[13]), .Y(n19) );
  CLKINVXL U171 ( .A(B[14]), .Y(n17) );
  INVX2 U172 ( .A(n80), .Y(n1) );
  BUFX2 U173 ( .A(A[0]), .Y(SUM[0]) );
  OR2XL U174 ( .A(B[1]), .B(A[1]), .Y(n146) );
  XNOR2X1 U175 ( .A(B[1]), .B(A[1]), .Y(SUM[1]) );
  CLKINVX2 U176 ( .A(n54), .Y(n56) );
  AOI21X1 U177 ( .A0(n67), .A1(n54), .B0(n55), .Y(n53) );
  NAND2XL U178 ( .A(A[5]), .B(B[5]), .Y(n72) );
  NAND2XL U179 ( .A(A[11]), .B(B[11]), .Y(n32) );
  OAI21X4 U180 ( .A0(n38), .A1(n14), .B0(n15), .Y(CO) );
  NAND2X1 U181 ( .A(n54), .B(n42), .Y(n40) );
  NOR2X1 U182 ( .A(n49), .B(n44), .Y(n42) );
  OAI21X2 U183 ( .A0(n68), .A1(n40), .B0(n41), .Y(n39) );
endmodule


module SNN_DW01_add_130 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n7, n8, n9, n15, n23, n25, n27, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n44, n45, n46, n47, n49,
         n52, n53, n54, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n77, n79, n132, n133, n134, n135, n139,
         n140;

  AOI21X1 U42 ( .A0(n59), .A1(n39), .B0(n40), .Y(n38) );
  NOR2X2 U49 ( .A(A[8]), .B(B[8]), .Y(n41) );
  AOI21X1 U64 ( .A0(n59), .A1(n77), .B0(n56), .Y(n54) );
  NOR2X2 U91 ( .A(A[3]), .B(B[3]), .Y(n70) );
  AOI21X2 U99 ( .A0(n34), .A1(n47), .B0(n35), .Y(n33) );
  NAND2X1 U100 ( .A(n34), .B(n46), .Y(n32) );
  OAI21X1 U101 ( .A0(n36), .A1(n44), .B0(n37), .Y(n35) );
  NAND2X1 U102 ( .A(n23), .B(B[13]), .Y(n15) );
  NAND2X1 U103 ( .A(A[7]), .B(B[7]), .Y(n53) );
  NOR2X2 U104 ( .A(A[7]), .B(B[7]), .Y(n52) );
  NAND2X1 U105 ( .A(A[6]), .B(B[6]), .Y(n58) );
  OAI21X2 U106 ( .A0(n52), .A1(n58), .B0(n53), .Y(n47) );
  OR2X2 U107 ( .A(A[10]), .B(B[10]), .Y(n132) );
  AND2X1 U108 ( .A(n132), .B(B[13]), .Y(n133) );
  NOR2BXL U109 ( .AN(n46), .B(n41), .Y(n39) );
  INVX1 U110 ( .A(n69), .Y(n68) );
  NAND2BX1 U111 ( .AN(n70), .B(n71), .Y(n9) );
  BUFX1 U112 ( .A(n31), .Y(n134) );
  NAND2X2 U113 ( .A(A[3]), .B(B[3]), .Y(n71) );
  OAI21X4 U114 ( .A0(n70), .A1(n72), .B0(n71), .Y(n69) );
  NAND2BXL U115 ( .AN(n41), .B(n44), .Y(n4) );
  NAND2X1 U116 ( .A(A[8]), .B(B[8]), .Y(n44) );
  AOI21X4 U117 ( .A0(n61), .A1(n69), .B0(n62), .Y(n60) );
  OAI21X2 U118 ( .A0(n63), .A1(n67), .B0(n64), .Y(n62) );
  NOR2X1 U119 ( .A(A[6]), .B(B[6]), .Y(n57) );
  NOR2X2 U120 ( .A(n66), .B(n63), .Y(n61) );
  NAND2XL U121 ( .A(A[5]), .B(B[5]), .Y(n64) );
  NOR2X2 U122 ( .A(A[4]), .B(B[4]), .Y(n66) );
  NAND2XL U123 ( .A(B[9]), .B(A[9]), .Y(n37) );
  NOR2X2 U124 ( .A(A[9]), .B(B[9]), .Y(n36) );
  NOR2X2 U125 ( .A(A[5]), .B(B[5]), .Y(n63) );
  NOR2X2 U126 ( .A(n57), .B(n52), .Y(n46) );
  OAI21X4 U127 ( .A0(n60), .A1(n32), .B0(n33), .Y(n31) );
  CLKINVXL U128 ( .A(n57), .Y(n77) );
  NOR2X4 U129 ( .A(n41), .B(n36), .Y(n34) );
  CLKINVXL U130 ( .A(n29), .Y(n27) );
  NAND2XL U131 ( .A(n79), .B(n67), .Y(n8) );
  XNOR2X1 U132 ( .A(n65), .B(n7), .Y(SUM[5]) );
  NAND2BX1 U133 ( .AN(A[11]), .B(n29), .Y(n23) );
  CLKINVXL U134 ( .A(n47), .Y(n49) );
  XOR2X1 U135 ( .A(n54), .B(n5), .Y(SUM[7]) );
  XOR2X1 U136 ( .A(n30), .B(n2), .Y(SUM[10]) );
  XOR2X1 U137 ( .A(n45), .B(n4), .Y(SUM[8]) );
  XOR2X1 U138 ( .A(n38), .B(n3), .Y(SUM[9]) );
  CLKINVXL U139 ( .A(n58), .Y(n56) );
  NAND2BX1 U140 ( .AN(n52), .B(n53), .Y(n5) );
  XOR2X1 U141 ( .A(n59), .B(n135), .Y(SUM[6]) );
  AND2X1 U142 ( .A(n77), .B(n58), .Y(n135) );
  NAND2BX1 U143 ( .AN(n36), .B(n37), .Y(n3) );
  CLKINVXL U144 ( .A(n60), .Y(n59) );
  OAI21XL U145 ( .A0(n68), .A1(n66), .B0(n67), .Y(n65) );
  NAND2X1 U146 ( .A(n132), .B(n29), .Y(n2) );
  NAND2BX1 U147 ( .AN(n63), .B(n64), .Y(n7) );
  XOR2X1 U148 ( .A(n68), .B(n8), .Y(SUM[4]) );
  CLKINVXL U149 ( .A(n66), .Y(n79) );
  OAI2BB1X4 U150 ( .A0N(n133), .A1N(n31), .B0(n15), .Y(CO) );
  NAND2X2 U151 ( .A(A[4]), .B(B[4]), .Y(n67) );
  NAND2XL U152 ( .A(A[10]), .B(B[10]), .Y(n29) );
  XOR2X1 U153 ( .A(n9), .B(n72), .Y(SUM[3]) );
  XNOR2X1 U154 ( .A(A[2]), .B(n139), .Y(SUM[2]) );
  NOR2X1 U155 ( .A(A[2]), .B(n139), .Y(n72) );
  INVX2 U156 ( .A(n140), .Y(n139) );
  CLKINVXL U157 ( .A(B[2]), .Y(n140) );
  BUFX2 U158 ( .A(A[0]), .Y(SUM[0]) );
  BUFX2 U159 ( .A(A[1]), .Y(SUM[1]) );
  CLKINVXL U160 ( .A(n134), .Y(n30) );
  XOR2XL U161 ( .A(n25), .B(A[11]), .Y(SUM[11]) );
  AOI21XL U162 ( .A0(n31), .A1(n132), .B0(n27), .Y(n25) );
  AOI21XL U163 ( .A0(n59), .A1(n46), .B0(n47), .Y(n45) );
  OAI21XL U164 ( .A0(n49), .A1(n41), .B0(n44), .Y(n40) );
endmodule


module SNN_DW01_add_161 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n1, n3, n4, n5, n6, n8, n9, n12, n14, n15, n16, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n50, n51, n52, n53, n55, n58, n59, n60, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n82,
         n83, n84, n86, n87, n88, n89, n90, n144, n145, n147, n148, n149, n150,
         n151;

  NOR2X2 U34 ( .A(A[10]), .B(B[10]), .Y(n34) );
  AOI21X1 U48 ( .A0(n65), .A1(n45), .B0(n46), .Y(n44) );
  AOI21X1 U70 ( .A0(n65), .A1(n87), .B0(n62), .Y(n60) );
  ADDFX2 U100 ( .A(B[2]), .B(A[2]), .CI(n79), .CO(n78), .S(SUM[2]) );
  ADDFX2 U101 ( .A(n149), .B(A[1]), .CI(B[1]), .CO(n79), .S(SUM[1]) );
  NOR2X1 U109 ( .A(A[3]), .B(B[3]), .Y(n76) );
  OAI21X1 U110 ( .A0(n76), .A1(n1), .B0(n77), .Y(n75) );
  NAND2X1 U111 ( .A(n29), .B(n16), .Y(n14) );
  NOR2X1 U112 ( .A(n34), .B(n31), .Y(n29) );
  AOI21X1 U113 ( .A0(n67), .A1(n75), .B0(n68), .Y(n66) );
  NOR2X1 U114 ( .A(A[6]), .B(B[6]), .Y(n63) );
  NOR2X1 U115 ( .A(A[7]), .B(B[7]), .Y(n58) );
  NOR2X1 U116 ( .A(A[8]), .B(B[8]), .Y(n47) );
  XNOR2X1 U117 ( .A(n71), .B(n8), .Y(SUM[5]) );
  OAI2BB1X2 U118 ( .A0N(n37), .A1N(n12), .B0(n15), .Y(CO) );
  NAND2X1 U119 ( .A(n30), .B(n16), .Y(n15) );
  INVX2 U120 ( .A(n14), .Y(n12) );
  AOI21XL U121 ( .A0(n65), .A1(n52), .B0(n53), .Y(n51) );
  NOR2X1 U122 ( .A(n72), .B(n69), .Y(n67) );
  OAI21X1 U123 ( .A0(n69), .A1(n73), .B0(n70), .Y(n68) );
  NAND2XL U124 ( .A(A[8]), .B(B[8]), .Y(n50) );
  OAI21X1 U125 ( .A0(n66), .A1(n38), .B0(n39), .Y(n37) );
  NOR2X1 U126 ( .A(n151), .B(n42), .Y(n40) );
  AOI21XL U127 ( .A0(n40), .A1(n53), .B0(n41), .Y(n39) );
  NAND2X1 U128 ( .A(n52), .B(n40), .Y(n38) );
  INVXL U129 ( .A(n42), .Y(n84) );
  NOR2XL U130 ( .A(A[4]), .B(B[4]), .Y(n72) );
  NOR2XL U131 ( .A(A[9]), .B(B[9]), .Y(n42) );
  OAI21X1 U132 ( .A0(n31), .A1(n35), .B0(n32), .Y(n30) );
  NOR2X1 U133 ( .A(A[11]), .B(B[11]), .Y(n31) );
  CLKINVXL U134 ( .A(n69), .Y(n88) );
  NOR2BXL U135 ( .AN(n52), .B(n151), .Y(n45) );
  OAI21XL U136 ( .A0(n55), .A1(n151), .B0(n50), .Y(n46) );
  CLKINVXL U137 ( .A(n53), .Y(n55) );
  NAND2XL U138 ( .A(n83), .B(n35), .Y(n3) );
  CLKINVXL U139 ( .A(n37), .Y(n36) );
  NAND2XL U140 ( .A(n86), .B(n59), .Y(n6) );
  XOR2X1 U141 ( .A(n33), .B(n144), .Y(SUM[11]) );
  AND2X1 U142 ( .A(n82), .B(n32), .Y(n144) );
  XOR2X1 U143 ( .A(n65), .B(n145), .Y(SUM[6]) );
  AND2X1 U144 ( .A(n87), .B(n64), .Y(n145) );
  CLKINVXL U145 ( .A(n63), .Y(n87) );
  NAND2XL U146 ( .A(A[6]), .B(B[6]), .Y(n64) );
  NAND2XL U147 ( .A(n88), .B(n70), .Y(n8) );
  NOR2XL U148 ( .A(A[5]), .B(B[5]), .Y(n69) );
  NAND2XL U149 ( .A(A[4]), .B(B[4]), .Y(n73) );
  INVX2 U150 ( .A(n150), .Y(n151) );
  OAI21X1 U151 ( .A0(n58), .A1(n64), .B0(n59), .Y(n53) );
  NOR2X1 U152 ( .A(n63), .B(n58), .Y(n52) );
  XOR2X1 U153 ( .A(n51), .B(n5), .Y(SUM[8]) );
  NAND2XL U154 ( .A(n150), .B(n50), .Y(n5) );
  XOR2X1 U155 ( .A(n60), .B(n6), .Y(SUM[7]) );
  XOR2X1 U156 ( .A(n44), .B(n4), .Y(SUM[9]) );
  NAND2XL U157 ( .A(n84), .B(n43), .Y(n4) );
  OAI21XL U158 ( .A0(n36), .A1(n34), .B0(n35), .Y(n33) );
  CLKINVXL U159 ( .A(n31), .Y(n82) );
  XOR2X1 U160 ( .A(n36), .B(n3), .Y(SUM[10]) );
  CLKINVXL U161 ( .A(n34), .Y(n83) );
  INVX2 U162 ( .A(n64), .Y(n62) );
  NAND2XL U163 ( .A(A[7]), .B(B[7]), .Y(n59) );
  NAND2XL U164 ( .A(A[10]), .B(B[10]), .Y(n35) );
  CLKINVXL U165 ( .A(n66), .Y(n65) );
  OAI21XL U166 ( .A0(n74), .A1(n72), .B0(n73), .Y(n71) );
  XOR2X1 U167 ( .A(n74), .B(n9), .Y(SUM[4]) );
  NAND2X1 U168 ( .A(n89), .B(n73), .Y(n9) );
  CLKINVXL U169 ( .A(n72), .Y(n89) );
  AND2X1 U170 ( .A(n147), .B(B[14]), .Y(n16) );
  AND2X1 U171 ( .A(B[12]), .B(B[13]), .Y(n147) );
  INVX2 U172 ( .A(n78), .Y(n1) );
  XOR2X1 U173 ( .A(n148), .B(n78), .Y(SUM[3]) );
  AND2X1 U174 ( .A(n90), .B(n77), .Y(n148) );
  OR2XL U175 ( .A(B[0]), .B(A[0]), .Y(n149) );
  XNOR2X1 U176 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
  INVX2 U177 ( .A(n75), .Y(n74) );
  NAND2XL U178 ( .A(A[5]), .B(B[5]), .Y(n70) );
  NAND2XL U179 ( .A(A[11]), .B(B[11]), .Y(n32) );
  NAND2XL U180 ( .A(A[9]), .B(B[9]), .Y(n43) );
  CLKINVXL U181 ( .A(n58), .Y(n86) );
  INVX2 U182 ( .A(n47), .Y(n150) );
  OAI21XL U183 ( .A0(n42), .A1(n50), .B0(n43), .Y(n41) );
  INVXL U184 ( .A(n76), .Y(n90) );
  NAND2XL U185 ( .A(A[3]), .B(B[3]), .Y(n77) );
endmodule


module SNN_DW01_add_169 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n1, n3, n5, n6, n8, n9, n10, n15, n16, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n41, n42, n43, n44, n45, n46, n49, n50, n51,
         n52, n53, n54, n57, n58, n59, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n81, n82, n83, n84,
         n85, n87, n88, n142, n143, n144, n146, n147;

  AOI21X1 U40 ( .A0(n52), .A1(n83), .B0(n41), .Y(n39) );
  AOI21X1 U46 ( .A0(n64), .A1(n44), .B0(n45), .Y(n43) );
  AOI21X1 U68 ( .A0(n64), .A1(n85), .B0(n61), .Y(n59) );
  AOI21X1 U77 ( .A0(n66), .A1(n74), .B0(n67), .Y(n65) );
  ADDFX2 U98 ( .A(B[2]), .B(A[2]), .CI(n78), .CO(n77), .S(SUM[2]) );
  ADDFX2 U99 ( .A(A[1]), .B(B[1]), .CI(n147), .CO(n78), .S(SUM[1]) );
  NOR2X1 U107 ( .A(A[3]), .B(B[3]), .Y(n75) );
  OAI2BB1X2 U108 ( .A0N(n37), .A1N(n142), .B0(n15), .Y(CO) );
  NAND2X1 U109 ( .A(n30), .B(n16), .Y(n15) );
  XNOR2X1 U110 ( .A(n70), .B(n8), .Y(SUM[5]) );
  NOR2X1 U111 ( .A(n53), .B(n46), .Y(n44) );
  OAI21X1 U112 ( .A0(n31), .A1(n35), .B0(n32), .Y(n30) );
  NOR2X1 U113 ( .A(n34), .B(n31), .Y(n29) );
  NOR2X1 U114 ( .A(A[11]), .B(B[11]), .Y(n31) );
  AND2XL U115 ( .A(n29), .B(n16), .Y(n142) );
  NOR2X1 U116 ( .A(A[7]), .B(B[7]), .Y(n57) );
  NAND2X2 U117 ( .A(A[6]), .B(B[6]), .Y(n63) );
  NOR2XL U118 ( .A(A[6]), .B(B[6]), .Y(n62) );
  NOR2XL U119 ( .A(A[4]), .B(B[4]), .Y(n71) );
  NOR2XL U120 ( .A(A[5]), .B(B[5]), .Y(n68) );
  NAND2XL U121 ( .A(A[3]), .B(B[3]), .Y(n76) );
  NOR2X1 U122 ( .A(A[10]), .B(B[10]), .Y(n34) );
  NAND2XL U123 ( .A(n49), .B(n42), .Y(n41) );
  OAI21XL U124 ( .A0(n73), .A1(n71), .B0(n72), .Y(n70) );
  INVX1 U125 ( .A(n46), .Y(n83) );
  NAND2XL U126 ( .A(n82), .B(n35), .Y(n3) );
  OAI21X1 U127 ( .A0(n57), .A1(n63), .B0(n58), .Y(n52) );
  NAND2XL U128 ( .A(A[8]), .B(B[8]), .Y(n49) );
  XOR2X1 U129 ( .A(n59), .B(n6), .Y(SUM[7]) );
  XOR2X1 U130 ( .A(n64), .B(n143), .Y(SUM[6]) );
  AND2X1 U131 ( .A(n85), .B(n63), .Y(n143) );
  CLKINVXL U132 ( .A(n62), .Y(n85) );
  XOR2X1 U133 ( .A(n33), .B(n144), .Y(SUM[11]) );
  AND2X1 U134 ( .A(n81), .B(n32), .Y(n144) );
  NAND2BX1 U135 ( .AN(n68), .B(n69), .Y(n8) );
  NAND2XL U136 ( .A(n87), .B(n72), .Y(n9) );
  CLKINVXL U137 ( .A(n71), .Y(n87) );
  OAI21X1 U138 ( .A0(n75), .A1(n1), .B0(n76), .Y(n74) );
  XNOR2X1 U139 ( .A(n10), .B(n77), .Y(SUM[3]) );
  XOR2X1 U140 ( .A(n36), .B(n3), .Y(SUM[10]) );
  INVX2 U141 ( .A(n34), .Y(n82) );
  CLKINVXL U142 ( .A(n51), .Y(n53) );
  INVX2 U143 ( .A(n52), .Y(n54) );
  NOR2X1 U144 ( .A(A[8]), .B(B[8]), .Y(n46) );
  XOR2X1 U145 ( .A(n50), .B(n5), .Y(SUM[8]) );
  NAND2XL U146 ( .A(n83), .B(n49), .Y(n5) );
  NAND2XL U147 ( .A(A[10]), .B(B[10]), .Y(n35) );
  NAND2XL U148 ( .A(n84), .B(n58), .Y(n6) );
  CLKINVXL U149 ( .A(n57), .Y(n84) );
  OAI21XL U150 ( .A0(n54), .A1(n46), .B0(n49), .Y(n45) );
  INVX2 U151 ( .A(n37), .Y(n36) );
  INVX2 U152 ( .A(n63), .Y(n61) );
  OAI21X1 U153 ( .A0(n65), .A1(n38), .B0(n39), .Y(n37) );
  CLKINVXL U154 ( .A(n65), .Y(n64) );
  OAI21XL U155 ( .A0(n36), .A1(n34), .B0(n35), .Y(n33) );
  CLKINVXL U156 ( .A(n31), .Y(n81) );
  INVX2 U157 ( .A(n74), .Y(n73) );
  XOR2X1 U158 ( .A(n73), .B(n9), .Y(SUM[4]) );
  AND2X1 U159 ( .A(n146), .B(B[14]), .Y(n16) );
  AND2X1 U160 ( .A(B[13]), .B(B[12]), .Y(n146) );
  INVX2 U161 ( .A(n77), .Y(n1) );
  NAND2XL U162 ( .A(A[4]), .B(B[4]), .Y(n72) );
  NAND2XL U163 ( .A(n88), .B(n76), .Y(n10) );
  CLKINVXL U164 ( .A(n75), .Y(n88) );
  OR2XL U165 ( .A(B[0]), .B(A[0]), .Y(n147) );
  XNOR2X1 U166 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
  NAND2XL U167 ( .A(A[5]), .B(B[5]), .Y(n69) );
  NAND2XL U168 ( .A(A[11]), .B(B[11]), .Y(n32) );
  XOR2XL U169 ( .A(n43), .B(A[9]), .Y(SUM[9]) );
  CLKINVXL U170 ( .A(A[9]), .Y(n42) );
  AOI21XL U171 ( .A0(n64), .A1(n51), .B0(n52), .Y(n50) );
  NAND2XL U172 ( .A(n51), .B(n83), .Y(n38) );
  NOR2X1 U173 ( .A(n62), .B(n57), .Y(n51) );
  NAND2XL U174 ( .A(A[7]), .B(B[7]), .Y(n58) );
  OAI21XL U175 ( .A0(n68), .A1(n72), .B0(n69), .Y(n67) );
  NOR2X1 U176 ( .A(n71), .B(n68), .Y(n66) );
endmodule


module SNN_DW01_add_162 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n1, n3, n4, n5, n6, n8, n9, n10, n12, n14, n15, n16, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n50, n51, n52, n53, n55, n58, n59, n60, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n145, n146, n147, n148;

  AOI21X1 U48 ( .A0(n65), .A1(n45), .B0(n46), .Y(n44) );
  AOI21X1 U58 ( .A0(n65), .A1(n52), .B0(n53), .Y(n51) );
  AOI21X1 U70 ( .A0(n65), .A1(n87), .B0(n62), .Y(n60) );
  ADDFX2 U101 ( .A(n148), .B(A[1]), .CI(B[1]), .CO(n79), .S(SUM[1]) );
  ADDFXL U109 ( .A(B[2]), .B(A[2]), .CI(n79), .CO(n78), .S(SUM[2]) );
  NOR2XL U110 ( .A(A[11]), .B(B[11]), .Y(n31) );
  OAI21X1 U111 ( .A0(n76), .A1(n1), .B0(n77), .Y(n75) );
  NAND2X1 U112 ( .A(n29), .B(n16), .Y(n14) );
  NOR2X1 U113 ( .A(n47), .B(n42), .Y(n40) );
  NOR2X1 U114 ( .A(A[6]), .B(B[6]), .Y(n63) );
  XNOR2X1 U115 ( .A(n71), .B(n8), .Y(SUM[5]) );
  NAND2X1 U116 ( .A(n30), .B(n16), .Y(n15) );
  NOR2X1 U117 ( .A(A[7]), .B(B[7]), .Y(n58) );
  CLKINVX2 U118 ( .A(n37), .Y(n36) );
  OAI21XL U119 ( .A0(n31), .A1(n35), .B0(n32), .Y(n30) );
  NOR2X1 U120 ( .A(n34), .B(n31), .Y(n29) );
  NOR2X1 U121 ( .A(A[8]), .B(B[8]), .Y(n47) );
  NOR2XL U122 ( .A(A[10]), .B(B[10]), .Y(n34) );
  CLKINVX1 U123 ( .A(n69), .Y(n88) );
  AOI21X2 U124 ( .A0(n67), .A1(n75), .B0(n68), .Y(n66) );
  NOR2X1 U125 ( .A(n72), .B(n69), .Y(n67) );
  OAI21XL U126 ( .A0(n69), .A1(n73), .B0(n70), .Y(n68) );
  NOR2XL U127 ( .A(A[5]), .B(B[5]), .Y(n69) );
  OAI21X1 U128 ( .A0(n66), .A1(n38), .B0(n39), .Y(n37) );
  AOI21X1 U129 ( .A0(n40), .A1(n53), .B0(n41), .Y(n39) );
  NAND2X1 U130 ( .A(A[4]), .B(B[4]), .Y(n73) );
  NOR2XL U131 ( .A(A[4]), .B(B[4]), .Y(n72) );
  NOR2XL U132 ( .A(A[3]), .B(B[3]), .Y(n76) );
  NOR2XL U133 ( .A(A[9]), .B(B[9]), .Y(n42) );
  NAND2XL U134 ( .A(A[11]), .B(B[11]), .Y(n32) );
  NAND2XL U135 ( .A(n85), .B(n50), .Y(n5) );
  OAI21XL U136 ( .A0(n42), .A1(n50), .B0(n43), .Y(n41) );
  OAI2BB1X2 U137 ( .A0N(n37), .A1N(n12), .B0(n15), .Y(CO) );
  XOR2X1 U138 ( .A(n60), .B(n6), .Y(SUM[7]) );
  XOR2X1 U139 ( .A(n65), .B(n145), .Y(SUM[6]) );
  AND2X1 U140 ( .A(n87), .B(n64), .Y(n145) );
  CLKINVXL U141 ( .A(n63), .Y(n87) );
  NAND2XL U142 ( .A(A[6]), .B(B[6]), .Y(n64) );
  XOR2X1 U143 ( .A(n33), .B(n146), .Y(SUM[11]) );
  AND2X1 U144 ( .A(n82), .B(n32), .Y(n146) );
  XNOR2X1 U145 ( .A(n10), .B(n78), .Y(SUM[3]) );
  OR2XL U146 ( .A(B[0]), .B(A[0]), .Y(n148) );
  INVX2 U147 ( .A(n14), .Y(n12) );
  OAI21X1 U148 ( .A0(n58), .A1(n64), .B0(n59), .Y(n53) );
  NOR2X1 U149 ( .A(n63), .B(n58), .Y(n52) );
  NAND2XL U150 ( .A(n86), .B(n59), .Y(n6) );
  CLKINVXL U151 ( .A(n58), .Y(n86) );
  XOR2X1 U152 ( .A(n51), .B(n5), .Y(SUM[8]) );
  CLKINVXL U153 ( .A(n47), .Y(n85) );
  XOR2X1 U154 ( .A(n36), .B(n3), .Y(SUM[10]) );
  CLKINVXL U155 ( .A(n34), .Y(n83) );
  OAI21XL U156 ( .A0(n55), .A1(n47), .B0(n50), .Y(n46) );
  CLKINVXL U157 ( .A(n53), .Y(n55) );
  NOR2BXL U158 ( .AN(n52), .B(n47), .Y(n45) );
  INVX2 U159 ( .A(n64), .Y(n62) );
  NAND2XL U160 ( .A(A[8]), .B(B[8]), .Y(n50) );
  CLKINVXL U161 ( .A(n31), .Y(n82) );
  CLKINVXL U162 ( .A(n66), .Y(n65) );
  XOR2X1 U163 ( .A(n44), .B(n4), .Y(SUM[9]) );
  NAND2XL U164 ( .A(n84), .B(n43), .Y(n4) );
  CLKINVXL U165 ( .A(n42), .Y(n84) );
  XOR2X1 U166 ( .A(n74), .B(n9), .Y(SUM[4]) );
  NAND2X1 U167 ( .A(n89), .B(n73), .Y(n9) );
  CLKINVXL U168 ( .A(n72), .Y(n89) );
  NAND2XL U169 ( .A(n88), .B(n70), .Y(n8) );
  OAI21XL U170 ( .A0(n74), .A1(n72), .B0(n73), .Y(n71) );
  INVX2 U171 ( .A(n75), .Y(n74) );
  AND2X1 U172 ( .A(n147), .B(B[14]), .Y(n16) );
  AND2X1 U173 ( .A(B[13]), .B(B[12]), .Y(n147) );
  INVX2 U174 ( .A(n78), .Y(n1) );
  NAND2XL U175 ( .A(n90), .B(n77), .Y(n10) );
  CLKINVXL U176 ( .A(n76), .Y(n90) );
  NAND2XL U177 ( .A(A[5]), .B(B[5]), .Y(n70) );
  NAND2XL U178 ( .A(n83), .B(n35), .Y(n3) );
  OAI21XL U179 ( .A0(n36), .A1(n34), .B0(n35), .Y(n33) );
  NAND2XL U180 ( .A(n52), .B(n40), .Y(n38) );
  NAND2XL U181 ( .A(A[9]), .B(B[9]), .Y(n43) );
  XNOR2X1 U182 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
  NAND2XL U183 ( .A(A[7]), .B(B[7]), .Y(n59) );
  NAND2XL U184 ( .A(A[10]), .B(B[10]), .Y(n35) );
  NAND2XL U185 ( .A(A[3]), .B(B[3]), .Y(n77) );
endmodule


module SNN_DW01_add_127 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n8, n83, n12, n13, n14, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n65, n72, n73, n75;

  NOR2BX4 U3 ( .AN(n8), .B(n13), .Y(n12) );
  XOR2X4 U13 ( .A(n8), .B(A[9]), .Y(SUM[10]) );
  BUFX3 U27 ( .A(B[0]), .Y(SUM[0]) );
  NAND2X1 U28 ( .A(n73), .B(n8), .Y(n62) );
  BUFX4 U29 ( .A(n83), .Y(SUM[9]) );
  XOR2XL U30 ( .A(n55), .B(A[8]), .Y(n83) );
  MX2X4 U31 ( .A(B[11]), .B(n63), .S0(n8), .Y(SUM[12]) );
  CLKINVX2 U32 ( .A(n14), .Y(n56) );
  BUFX1 U33 ( .A(SUM[13]), .Y(SUM[14]) );
  CLKINVX3 U34 ( .A(B[8]), .Y(n75) );
  CLKINVX1 U35 ( .A(B[8]), .Y(n55) );
  AND2X2 U36 ( .A(B[11]), .B(B[8]), .Y(n14) );
  NAND2X2 U37 ( .A(n14), .B(A[12]), .Y(n13) );
  NAND2XL U38 ( .A(n14), .B(n57), .Y(n58) );
  CLKINVXL U39 ( .A(n8), .Y(n60) );
  CLKINVXL U40 ( .A(n55), .Y(SUM[8]) );
  NAND2X1 U41 ( .A(n56), .B(A[12]), .Y(n59) );
  NAND2X1 U42 ( .A(n58), .B(n59), .Y(n63) );
  BUFX1 U43 ( .A(A[5]), .Y(SUM[6]) );
  CLKINVXL U44 ( .A(B[2]), .Y(n72) );
  INVXL U45 ( .A(A[12]), .Y(n57) );
  CLKINVX8 U46 ( .A(n12), .Y(SUM[13]) );
  NAND2X4 U47 ( .A(n61), .B(n62), .Y(SUM[11]) );
  XNOR2X4 U48 ( .A(A[1]), .B(B[1]), .Y(SUM[1]) );
  AND2X4 U49 ( .A(n75), .B(A[8]), .Y(n8) );
  OR2X2 U50 ( .A(A[1]), .B(B[1]), .Y(SUM[2]) );
  NAND2XL U51 ( .A(A[12]), .B(n60), .Y(n61) );
  XNOR2XL U52 ( .A(B[11]), .B(n75), .Y(n73) );
  BUFX1 U53 ( .A(SUM[7]), .Y(SUM[5]) );
  BUFX1 U54 ( .A(SUM[8]), .Y(SUM[4]) );
  INVX2 U55 ( .A(n72), .Y(SUM[7]) );
  INVX2 U56 ( .A(n65), .Y(SUM[3]) );
  CLKINVX2 U57 ( .A(B[3]), .Y(n65) );
endmodule


module SNN_DW01_add_150 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n1, n14, n21, n26, n27, n28, n29, n30, n31, n32, n33, n44, n45, n57,
         n58, n59, n60, n64, n65, n67, n68, n69, n70, n71, n73, n74, n76, n77,
         n78, n79, n80, n142, n143, n144, n145;

  AOI21X1 U23 ( .A0(n58), .A1(n29), .B0(n30), .Y(n28) );
  AOI21X1 U78 ( .A0(n76), .A1(n68), .B0(n69), .Y(n67) );
  ADDFX2 U99 ( .A(A[2]), .B(B[2]), .CI(n80), .CO(n79) );
  ADDFX2 U100 ( .A(A[1]), .B(B[1]), .CI(n142), .CO(n80) );
  NOR2X1 U107 ( .A(A[11]), .B(B[11]), .Y(n31) );
  NOR2X1 U108 ( .A(A[3]), .B(B[3]), .Y(n77) );
  NOR2X1 U109 ( .A(A[6]), .B(B[6]), .Y(n64) );
  INVX2 U110 ( .A(n14), .Y(CO) );
  OR2X1 U111 ( .A(A[0]), .B(B[0]), .Y(n142) );
  NOR2X1 U112 ( .A(A[7]), .B(B[7]), .Y(n59) );
  OR2XL U113 ( .A(A[13]), .B(A[12]), .Y(n21) );
  OR2X1 U114 ( .A(A[14]), .B(n21), .Y(n143) );
  AND2X1 U115 ( .A(A[11]), .B(B[11]), .Y(n144) );
  OAI21XL U116 ( .A0(n70), .A1(n74), .B0(n71), .Y(n69) );
  NAND2X1 U117 ( .A(n57), .B(n29), .Y(n27) );
  NOR2X1 U118 ( .A(n64), .B(n59), .Y(n57) );
  OAI21XL U119 ( .A0(n65), .A1(n59), .B0(n60), .Y(n58) );
  NAND2XL U120 ( .A(A[7]), .B(B[7]), .Y(n60) );
  AND2X1 U121 ( .A(A[8]), .B(B[8]), .Y(n145) );
  NOR2X1 U122 ( .A(n44), .B(n31), .Y(n29) );
  NOR2X1 U123 ( .A(A[8]), .B(B[8]), .Y(n44) );
  NOR2X2 U124 ( .A(n26), .B(n143), .Y(n14) );
  OAI21X1 U125 ( .A0(n67), .A1(n27), .B0(n28), .Y(n26) );
  AOI21X1 U126 ( .A0(A[10]), .A1(n33), .B0(n144), .Y(n32) );
  INVX1 U127 ( .A(n31), .Y(n33) );
  NOR2X1 U128 ( .A(A[4]), .B(B[4]), .Y(n73) );
  NOR2X1 U129 ( .A(A[5]), .B(B[5]), .Y(n70) );
  NAND2XL U130 ( .A(A[4]), .B(B[4]), .Y(n74) );
  NAND2XL U131 ( .A(A[5]), .B(B[5]), .Y(n71) );
  NOR2X1 U132 ( .A(n73), .B(n70), .Y(n68) );
  OAI21XL U133 ( .A0(n77), .A1(n1), .B0(n78), .Y(n76) );
  INVX2 U134 ( .A(n79), .Y(n1) );
  OAI21X1 U135 ( .A0(n45), .A1(n31), .B0(n32), .Y(n30) );
  NAND2XL U136 ( .A(A[6]), .B(B[6]), .Y(n65) );
  NAND2XL U137 ( .A(A[3]), .B(B[3]), .Y(n78) );
  NOR2XL U138 ( .A(A[9]), .B(n145), .Y(n45) );
endmodule


module SNN_DW01_add_104 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n14, n15, n18, n31, n46, n47, n48, n49, n50, n51, n52,
         n54, n56, n57, n58, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127;

  NOR2X2 U63 ( .A(A[4]), .B(B[4]), .Y(n50) );
  ADDFX2 U73 ( .A(B[2]), .B(A[2]), .CI(n58), .CO(n57), .S(SUM[2]) );
  ADDFHXL U82 ( .A(n125), .B(A[1]), .CI(B[1]), .CO(n58), .S(SUM[1]) );
  CLKINVX3 U83 ( .A(n49), .Y(n48) );
  OAI21X2 U84 ( .A0(n52), .A1(n50), .B0(n51), .Y(n49) );
  CLKINVXL U85 ( .A(B[13]), .Y(n15) );
  OR2X1 U86 ( .A(A[0]), .B(n126), .Y(n125) );
  OR2X1 U87 ( .A(n47), .B(n121), .Y(n119) );
  OR2X1 U88 ( .A(n46), .B(n121), .Y(n118) );
  AND2X1 U89 ( .A(n31), .B(n120), .Y(n122) );
  NAND2X1 U90 ( .A(A[3]), .B(B[3]), .Y(n56) );
  OAI21X1 U91 ( .A0(n118), .A1(n48), .B0(n119), .Y(CO) );
  AOI21X4 U92 ( .A0(n124), .A1(n57), .B0(n54), .Y(n52) );
  AND2X1 U93 ( .A(B[10]), .B(n14), .Y(n120) );
  NOR2X1 U94 ( .A(n18), .B(n15), .Y(n14) );
  NAND2XL U95 ( .A(B[12]), .B(B[11]), .Y(n18) );
  OR2X4 U96 ( .A(A[3]), .B(B[3]), .Y(n124) );
  NOR2XL U97 ( .A(A[5]), .B(B[5]), .Y(n46) );
  AND2X1 U98 ( .A(B[9]), .B(n123), .Y(n31) );
  CLKINVXL U99 ( .A(B[0]), .Y(n127) );
  NAND2XL U100 ( .A(A[4]), .B(B[4]), .Y(n51) );
  NAND2BX1 U101 ( .AN(n46), .B(n47), .Y(n1) );
  NAND2XL U102 ( .A(n122), .B(B[14]), .Y(n121) );
  XOR2X1 U103 ( .A(n1), .B(n48), .Y(SUM[5]) );
  AND2X1 U104 ( .A(B[7]), .B(B[8]), .Y(n123) );
  XNOR2XL U105 ( .A(n3), .B(n57), .Y(SUM[3]) );
  NAND2X1 U106 ( .A(n124), .B(n56), .Y(n3) );
  INVX2 U107 ( .A(n56), .Y(n54) );
  NAND2BX1 U108 ( .AN(n50), .B(n51), .Y(n2) );
  INVX2 U109 ( .A(n127), .Y(n126) );
  XNOR2XL U110 ( .A(A[0]), .B(n126), .Y(SUM[0]) );
  NAND2XL U111 ( .A(A[5]), .B(B[5]), .Y(n47) );
  XOR2XL U112 ( .A(n2), .B(n52), .Y(SUM[4]) );
endmodule


module SNN_DW01_add_124 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n4, n5, n6, n7, n8, n9, n10, n11, n12, n14, n62, n65, n66,
         n67, n69, n70, n71;

  ADDHX4 U2 ( .A(n66), .B(n7), .CO(n6), .S(SUM[13]) );
  XOR3X2 U11 ( .A(n69), .B(n12), .C(B[11]), .Y(SUM[11]) );
  ADDFX2 U19 ( .A(A[3]), .B(B[3]), .CI(n14), .CO(SUM[4]), .S(SUM[3]) );
  NAND2X1 U28 ( .A(B[11]), .B(n69), .Y(n11) );
  AND2X1 U29 ( .A(n4), .B(SUM[8]), .Y(n9) );
  ADDHXL U30 ( .A(n70), .B(n69), .CO(n12), .S(SUM[10]) );
  INVX2 U31 ( .A(B[8]), .Y(n69) );
  NOR2X1 U32 ( .A(B[11]), .B(n69), .Y(n10) );
  MX2X4 U33 ( .A(n9), .B(n8), .S0(n12), .Y(n7) );
  AND2X1 U34 ( .A(n5), .B(SUM[8]), .Y(n8) );
  XOR2X1 U35 ( .A(n10), .B(SUM[8]), .Y(n1) );
  CLKINVX2 U36 ( .A(n10), .Y(n5) );
  INVX2 U37 ( .A(n69), .Y(SUM[8]) );
  MXI2X1 U38 ( .A(n2), .B(n1), .S0(n12), .Y(SUM[12]) );
  CLKINVXL U39 ( .A(A[9]), .Y(n71) );
  OR2XL U40 ( .A(A[2]), .B(B[2]), .Y(n14) );
  XOR2XL U41 ( .A(n11), .B(SUM[8]), .Y(n2) );
  CLKINVX2 U42 ( .A(n11), .Y(n4) );
  INVX2 U43 ( .A(n71), .Y(n70) );
  INVX2 U44 ( .A(n65), .Y(SUM[6]) );
  INVX2 U45 ( .A(B[4]), .Y(n65) );
  BUFX2 U46 ( .A(B[1]), .Y(SUM[1]) );
  INVX2 U47 ( .A(n67), .Y(n66) );
  INVX2 U48 ( .A(A[13]), .Y(n67) );
  INVX2 U49 ( .A(n62), .Y(SUM[5]) );
  CLKINVX2 U50 ( .A(A[5]), .Y(n62) );
  BUFX1 U51 ( .A(B[0]), .Y(SUM[0]) );
  BUFX2 U52 ( .A(SUM[6]), .Y(SUM[7]) );
  XNOR2X1 U53 ( .A(A[2]), .B(B[2]), .Y(SUM[2]) );
  CLKINVX8 U54 ( .A(n6), .Y(SUM[14]) );
endmodule


module SNN_DW01_add_125 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n10, n52, n59, n61;

  AND2X2 U23 ( .A(n10), .B(A[10]), .Y(n52) );
  XOR2X2 U24 ( .A(B[12]), .B(n52), .Y(SUM[12]) );
  AND2X1 U25 ( .A(n61), .B(A[9]), .Y(n10) );
  NOR2BX1 U26 ( .AN(B[12]), .B(n52), .Y(SUM[13]) );
  XOR2X1 U27 ( .A(n10), .B(A[10]), .Y(SUM[11]) );
  NAND2X1 U28 ( .A(A[13]), .B(n52), .Y(SUM[14]) );
  XNOR2X1 U29 ( .A(A[2]), .B(B[2]), .Y(SUM[2]) );
  CLKINVXL U30 ( .A(n61), .Y(SUM[9]) );
  BUFX2 U31 ( .A(SUM[9]), .Y(SUM[5]) );
  XOR2X1 U32 ( .A(n61), .B(A[9]), .Y(SUM[10]) );
  INVX2 U33 ( .A(n59), .Y(SUM[6]) );
  INVX2 U34 ( .A(B[3]), .Y(n59) );
  INVX2 U35 ( .A(B[9]), .Y(n61) );
  BUFX2 U36 ( .A(B[4]), .Y(SUM[4]) );
  BUFX1 U37 ( .A(B[1]), .Y(SUM[1]) );
  CLKBUFX1 U38 ( .A(A[7]), .Y(SUM[8]) );
  BUFX2 U39 ( .A(SUM[6]), .Y(SUM[7]) );
  OR2X1 U40 ( .A(A[2]), .B(B[2]), .Y(SUM[3]) );
endmodule


module SNN_DW01_add_119 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n1, n5, n6, n8, n9, n11, n12, n13, n14, n15, n16, n19, n20, n22, n23,
         n24, n25, n26, n27, n31, n32, n36, n37, n38, n39, n40, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n52, n53, n54, n55, n56, n59, n60, n61,
         n62, n63, n64, n67, n68, n69, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n95, n98, n99, n100,
         n101, n102, n155, n156, n157;

  AOI21X1 U15 ( .A0(n37), .A1(n24), .B0(n25), .Y(n23) );
  AOI21X1 U60 ( .A0(n54), .A1(n74), .B0(n55), .Y(n53) );
  NOR2X2 U75 ( .A(n72), .B(n67), .Y(n61) );
  AOI21X1 U82 ( .A0(n74), .A1(n99), .B0(n71), .Y(n69) );
  ADDFX2 U112 ( .A(B[2]), .B(A[2]), .CI(n88), .CO(n87), .S(SUM[2]) );
  ADDFX2 U113 ( .A(A[1]), .B(B[1]), .CI(n157), .CO(n88), .S(SUM[1]) );
  XNOR2X4 U120 ( .A(n13), .B(n87), .Y(SUM[3]) );
  AOI21X2 U121 ( .A0(n76), .A1(n84), .B0(n77), .Y(n75) );
  OAI21X2 U122 ( .A0(n75), .A1(n47), .B0(n48), .Y(n46) );
  AOI21X2 U123 ( .A0(n49), .A1(n62), .B0(n50), .Y(n48) );
  NOR2X1 U124 ( .A(n78), .B(n81), .Y(n76) );
  OAI21X1 U125 ( .A0(n78), .A1(n82), .B0(n79), .Y(n77) );
  NOR2X1 U126 ( .A(A[4]), .B(B[4]), .Y(n81) );
  NOR2X1 U127 ( .A(A[13]), .B(B[13]), .Y(n26) );
  NOR2X1 U128 ( .A(n63), .B(n56), .Y(n54) );
  AOI21X1 U129 ( .A0(n46), .A1(n15), .B0(n16), .Y(n14) );
  NOR2X1 U130 ( .A(A[12]), .B(B[12]), .Y(n31) );
  NAND2X1 U131 ( .A(A[4]), .B(B[4]), .Y(n82) );
  NOR2X1 U132 ( .A(A[3]), .B(B[3]), .Y(n85) );
  INVX2 U133 ( .A(n64), .Y(n155) );
  CLKINVXL U134 ( .A(n62), .Y(n64) );
  OAI21X1 U135 ( .A0(n67), .A1(n73), .B0(n68), .Y(n62) );
  NAND2XL U136 ( .A(n98), .B(n68), .Y(n9) );
  NAND2X4 U137 ( .A(A[6]), .B(B[6]), .Y(n73) );
  NOR2X1 U138 ( .A(A[6]), .B(B[6]), .Y(n72) );
  OAI21XL U139 ( .A0(n38), .A1(n44), .B0(n39), .Y(n37) );
  NOR2X2 U140 ( .A(A[5]), .B(B[5]), .Y(n78) );
  INVX2 U141 ( .A(n56), .Y(n49) );
  OAI21XL U142 ( .A0(n64), .A1(n56), .B0(n59), .Y(n55) );
  NOR2X2 U143 ( .A(A[7]), .B(B[7]), .Y(n67) );
  NAND2X1 U144 ( .A(A[10]), .B(B[10]), .Y(n44) );
  OAI21X1 U145 ( .A0(n26), .A1(n32), .B0(n27), .Y(n25) );
  NAND2X1 U146 ( .A(n49), .B(n61), .Y(n47) );
  CLKINVX2 U147 ( .A(n14), .Y(CO) );
  NOR2XL U148 ( .A(A[10]), .B(B[10]), .Y(n43) );
  AND2XL U149 ( .A(n99), .B(n73), .Y(n156) );
  AOI21XL U150 ( .A0(n74), .A1(n61), .B0(n155), .Y(n60) );
  NAND2XL U151 ( .A(A[8]), .B(B[8]), .Y(n59) );
  CLKINVXL U152 ( .A(A[9]), .Y(n52) );
  CLKINVXL U153 ( .A(n43), .Y(n95) );
  CLKINVXL U154 ( .A(n44), .Y(n42) );
  CLKINVXL U155 ( .A(n72), .Y(n99) );
  NAND2BX1 U156 ( .AN(n38), .B(n39), .Y(n5) );
  NAND2XL U157 ( .A(n100), .B(n79), .Y(n11) );
  CLKINVXL U158 ( .A(n78), .Y(n100) );
  CLKINVXL U159 ( .A(n84), .Y(n83) );
  CLKINVXL U160 ( .A(n81), .Y(n101) );
  NAND2X1 U161 ( .A(n59), .B(n52), .Y(n50) );
  NOR2X1 U162 ( .A(A[8]), .B(B[8]), .Y(n56) );
  NAND2XL U163 ( .A(n95), .B(n44), .Y(n6) );
  XOR2X1 U164 ( .A(n40), .B(n5), .Y(SUM[11]) );
  NOR2X1 U165 ( .A(n22), .B(n19), .Y(n15) );
  XOR2X1 U166 ( .A(n45), .B(n6), .Y(SUM[10]) );
  XOR2X1 U167 ( .A(n53), .B(A[9]), .Y(SUM[9]) );
  XOR2X1 U168 ( .A(n60), .B(n8), .Y(SUM[8]) );
  NAND2XL U169 ( .A(n49), .B(n59), .Y(n8) );
  CLKINVXL U170 ( .A(n61), .Y(n63) );
  XOR2X1 U171 ( .A(n69), .B(n9), .Y(SUM[7]) );
  CLKINVXL U172 ( .A(n67), .Y(n98) );
  CLKINVXL U173 ( .A(n46), .Y(n45) );
  OAI21X1 U174 ( .A0(n23), .A1(n19), .B0(n20), .Y(n16) );
  NOR2X1 U175 ( .A(n31), .B(n26), .Y(n24) );
  NOR2X1 U176 ( .A(A[14]), .B(B[14]), .Y(n19) );
  CLKINVXL U177 ( .A(n75), .Y(n74) );
  NAND2XL U178 ( .A(n36), .B(n24), .Y(n22) );
  NOR2X1 U179 ( .A(n38), .B(n43), .Y(n36) );
  XOR2X1 U180 ( .A(n74), .B(n156), .Y(SUM[6]) );
  INVX2 U181 ( .A(n73), .Y(n71) );
  NOR2X1 U182 ( .A(A[11]), .B(B[11]), .Y(n38) );
  NAND2XL U183 ( .A(A[13]), .B(B[13]), .Y(n27) );
  XNOR2X1 U184 ( .A(n80), .B(n11), .Y(SUM[5]) );
  OAI21XL U185 ( .A0(n83), .A1(n81), .B0(n82), .Y(n80) );
  XOR2X1 U186 ( .A(n83), .B(n12), .Y(SUM[4]) );
  NAND2XL U187 ( .A(n101), .B(n82), .Y(n12) );
  OAI21X1 U188 ( .A0(n85), .A1(n1), .B0(n86), .Y(n84) );
  INVX2 U189 ( .A(n87), .Y(n1) );
  NAND2XL U190 ( .A(A[5]), .B(B[5]), .Y(n79) );
  NAND2XL U191 ( .A(n102), .B(n86), .Y(n13) );
  CLKINVXL U192 ( .A(n85), .Y(n102) );
  XNOR2X1 U193 ( .A(A[0]), .B(B[0]), .Y(SUM[0]) );
  OR2X1 U194 ( .A(A[0]), .B(B[0]), .Y(n157) );
  NAND2XL U195 ( .A(A[11]), .B(B[11]), .Y(n39) );
  AOI21XL U196 ( .A0(n46), .A1(n95), .B0(n42), .Y(n40) );
  NAND2XL U197 ( .A(A[3]), .B(B[3]), .Y(n86) );
  NAND2XL U198 ( .A(A[14]), .B(B[14]), .Y(n20) );
  NAND2XL U199 ( .A(A[12]), .B(B[12]), .Y(n32) );
  NAND2XL U200 ( .A(A[7]), .B(B[7]), .Y(n68) );
endmodule


module SNN_DW01_add_120 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n1, n5, n7, n8, n9, n11, n12, n13, n14, n15, n16, n19, n20, n22, n23,
         n24, n25, n27, n31, n32, n36, n37, n38, n39, n40, n42, n43, n44, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n59, n60, n61, n62,
         n64, n67, n68, n69, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n86, n87, n88, n94, n95, n96, n98, n99, n100,
         n101, n102, n155, n156, n157, n158, n159, n160, n161;

  AOI21X1 U60 ( .A0(n54), .A1(n74), .B0(n55), .Y(n53) );
  ADDFX2 U112 ( .A(B[2]), .B(A[2]), .CI(n88), .CO(n87), .S(SUM[2]) );
  NOR2XL U120 ( .A(A[11]), .B(B[11]), .Y(n38) );
  XNOR2XL U121 ( .A(A[0]), .B(B[0]), .Y(SUM[0]) );
  NOR2X1 U122 ( .A(A[8]), .B(B[8]), .Y(n56) );
  AOI21X2 U123 ( .A0(n49), .A1(n62), .B0(n50), .Y(n48) );
  AOI21X2 U124 ( .A0(n46), .A1(n15), .B0(n16), .Y(n14) );
  NOR2X1 U125 ( .A(n72), .B(n67), .Y(n61) );
  OR2X1 U126 ( .A(A[0]), .B(B[0]), .Y(n155) );
  AOI21X1 U127 ( .A0(n76), .A1(n84), .B0(n77), .Y(n75) );
  NOR2X1 U128 ( .A(A[6]), .B(B[6]), .Y(n72) );
  INVX2 U129 ( .A(n14), .Y(CO) );
  CLKINVXL U130 ( .A(n56), .Y(n156) );
  INVX2 U131 ( .A(n156), .Y(n157) );
  OAI21X1 U132 ( .A0(n23), .A1(n19), .B0(n20), .Y(n16) );
  AOI21X1 U133 ( .A0(n37), .A1(n24), .B0(n25), .Y(n23) );
  CLKINVXL U134 ( .A(n78), .Y(n100) );
  INVXL U135 ( .A(n75), .Y(n74) );
  AOI21XL U136 ( .A0(n74), .A1(n99), .B0(n71), .Y(n69) );
  OAI21XL U137 ( .A0(n67), .A1(n73), .B0(n68), .Y(n158) );
  OAI21X1 U138 ( .A0(n67), .A1(n73), .B0(n68), .Y(n62) );
  NOR2XL U139 ( .A(n38), .B(n43), .Y(n36) );
  NAND2X1 U140 ( .A(n49), .B(n61), .Y(n47) );
  NOR2X1 U141 ( .A(n51), .B(n56), .Y(n49) );
  NAND2X2 U142 ( .A(A[6]), .B(B[6]), .Y(n73) );
  NOR2X2 U143 ( .A(A[7]), .B(B[7]), .Y(n67) );
  AOI21XL U144 ( .A0(n46), .A1(n95), .B0(n42), .Y(n40) );
  NAND2XL U145 ( .A(A[10]), .B(B[10]), .Y(n44) );
  NOR2XL U146 ( .A(A[10]), .B(B[10]), .Y(n43) );
  OAI21XL U147 ( .A0(n38), .A1(n44), .B0(n39), .Y(n37) );
  NOR2X1 U148 ( .A(A[3]), .B(B[3]), .Y(n85) );
  OAI21X1 U149 ( .A0(n85), .A1(n1), .B0(n86), .Y(n84) );
  OAI21X1 U150 ( .A0(n160), .A1(n32), .B0(n27), .Y(n25) );
  INVX1 U151 ( .A(n72), .Y(n99) );
  NOR2XL U152 ( .A(n78), .B(n81), .Y(n76) );
  NOR2X1 U153 ( .A(n31), .B(n160), .Y(n24) );
  NOR2XL U154 ( .A(A[12]), .B(B[12]), .Y(n31) );
  OAI21XL U155 ( .A0(n78), .A1(n82), .B0(n79), .Y(n77) );
  OAI21X2 U156 ( .A0(n75), .A1(n47), .B0(n48), .Y(n46) );
  NAND2XL U157 ( .A(A[11]), .B(B[11]), .Y(n39) );
  OAI21XL U158 ( .A0(n64), .A1(n157), .B0(n59), .Y(n55) );
  CLKINVXL U159 ( .A(n158), .Y(n64) );
  CLKINVXL U160 ( .A(n67), .Y(n98) );
  NAND2XL U161 ( .A(n98), .B(n68), .Y(n9) );
  CLKINVXL U162 ( .A(n43), .Y(n95) );
  CLKINVXL U163 ( .A(n44), .Y(n42) );
  OAI21X1 U164 ( .A0(n51), .A1(n59), .B0(n52), .Y(n50) );
  CLKINVXL U165 ( .A(n38), .Y(n94) );
  NAND2XL U166 ( .A(n101), .B(n82), .Y(n12) );
  NAND2XL U167 ( .A(n100), .B(n79), .Y(n11) );
  CLKINVXL U168 ( .A(n81), .Y(n101) );
  XOR2X1 U169 ( .A(n60), .B(n8), .Y(SUM[8]) );
  NOR2X1 U170 ( .A(n22), .B(n19), .Y(n15) );
  NOR2X1 U171 ( .A(A[14]), .B(B[14]), .Y(n19) );
  NOR2BXL U172 ( .AN(n61), .B(n157), .Y(n54) );
  XOR2X1 U173 ( .A(n69), .B(n9), .Y(SUM[7]) );
  NAND2BX1 U174 ( .AN(n157), .B(n59), .Y(n8) );
  XOR2X1 U175 ( .A(n46), .B(n159), .Y(SUM[10]) );
  AND2X1 U176 ( .A(n95), .B(n44), .Y(n159) );
  NOR2X1 U177 ( .A(A[13]), .B(B[13]), .Y(n160) );
  NAND2XL U178 ( .A(n36), .B(n24), .Y(n22) );
  XOR2X1 U179 ( .A(n53), .B(n7), .Y(SUM[9]) );
  NAND2XL U180 ( .A(n96), .B(n52), .Y(n7) );
  CLKINVXL U181 ( .A(n51), .Y(n96) );
  NAND2XL U182 ( .A(A[8]), .B(B[8]), .Y(n59) );
  XOR2X1 U183 ( .A(n40), .B(n5), .Y(SUM[11]) );
  NAND2XL U184 ( .A(n94), .B(n39), .Y(n5) );
  XOR2X1 U185 ( .A(n74), .B(n161), .Y(SUM[6]) );
  AND2X1 U186 ( .A(n99), .B(n73), .Y(n161) );
  INVX2 U187 ( .A(n73), .Y(n71) );
  XOR2X1 U188 ( .A(n83), .B(n12), .Y(SUM[4]) );
  CLKINVXL U189 ( .A(n84), .Y(n83) );
  XNOR2X1 U190 ( .A(n80), .B(n11), .Y(SUM[5]) );
  OAI21XL U191 ( .A0(n83), .A1(n81), .B0(n82), .Y(n80) );
  INVX2 U192 ( .A(n87), .Y(n1) );
  NOR2X1 U193 ( .A(A[5]), .B(B[5]), .Y(n78) );
  NAND2XL U194 ( .A(A[5]), .B(B[5]), .Y(n79) );
  NOR2X1 U195 ( .A(A[4]), .B(B[4]), .Y(n81) );
  XNOR2X1 U196 ( .A(n13), .B(n87), .Y(SUM[3]) );
  NAND2XL U197 ( .A(n102), .B(n86), .Y(n13) );
  CLKINVXL U198 ( .A(n85), .Y(n102) );
  ADDFX2 U199 ( .A(n155), .B(A[1]), .CI(B[1]), .CO(n88), .S(SUM[1]) );
  AOI21XL U200 ( .A0(n74), .A1(n61), .B0(n158), .Y(n60) );
  NAND2XL U201 ( .A(A[9]), .B(B[9]), .Y(n52) );
  NOR2X1 U202 ( .A(A[9]), .B(B[9]), .Y(n51) );
  NAND2XL U203 ( .A(A[3]), .B(B[3]), .Y(n86) );
  NAND2XL U204 ( .A(A[14]), .B(B[14]), .Y(n20) );
  NAND2XL U205 ( .A(A[13]), .B(B[13]), .Y(n27) );
  NAND2XL U206 ( .A(A[7]), .B(B[7]), .Y(n68) );
  NAND2XL U207 ( .A(A[12]), .B(B[12]), .Y(n32) );
  NAND2XL U208 ( .A(A[4]), .B(B[4]), .Y(n82) );
endmodule


module SNN_DW01_add_83 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n5, n7, n8, n9, n16, n25, n26, n33, n38, n45, n46, n47, n48,
         n49, n50, n51, n53, n54, n55, n56, n57, n61, n62, n116, n118, n119;

  INVX2 U81 ( .A(n54), .Y(n62) );
  XOR2X1 U82 ( .A(n1), .B(n47), .Y(SUM[5]) );
  OR2X1 U83 ( .A(n46), .B(n7), .Y(n118) );
  NOR2X1 U84 ( .A(A[4]), .B(B[4]), .Y(n49) );
  ADDFX2 U85 ( .A(B[2]), .B(A[2]), .CI(n57), .CO(n56), .S(SUM[2]) );
  NOR2X1 U86 ( .A(A[5]), .B(B[5]), .Y(n45) );
  OR2X1 U87 ( .A(A[0]), .B(B[0]), .Y(n116) );
  NOR2X1 U88 ( .A(n26), .B(n33), .Y(n25) );
  NOR2XL U89 ( .A(n45), .B(n7), .Y(n5) );
  NOR2X2 U90 ( .A(A[3]), .B(B[3]), .Y(n54) );
  OAI21X1 U91 ( .A0(n51), .A1(n49), .B0(n50), .Y(n48) );
  NAND2X1 U92 ( .A(A[3]), .B(B[3]), .Y(n55) );
  NAND2X2 U93 ( .A(B[9]), .B(B[10]), .Y(n26) );
  NAND2BX1 U94 ( .AN(n45), .B(n46), .Y(n1) );
  NAND2X1 U95 ( .A(B[13]), .B(B[14]), .Y(n9) );
  NAND2XL U96 ( .A(n61), .B(n50), .Y(n2) );
  XOR2X1 U97 ( .A(n119), .B(n56), .Y(SUM[3]) );
  NAND2XL U98 ( .A(A[4]), .B(B[4]), .Y(n50) );
  NAND2X1 U99 ( .A(n8), .B(n25), .Y(n7) );
  NOR2X1 U100 ( .A(n16), .B(n9), .Y(n8) );
  NAND2X1 U101 ( .A(n38), .B(B[8]), .Y(n33) );
  NAND2X1 U102 ( .A(B[12]), .B(B[11]), .Y(n16) );
  AND2X1 U103 ( .A(B[6]), .B(B[7]), .Y(n38) );
  OAI2BB1X2 U104 ( .A0N(n5), .A1N(n48), .B0(n118), .Y(CO) );
  CLKINVXL U105 ( .A(n48), .Y(n47) );
  XOR2XL U106 ( .A(n2), .B(n51), .Y(SUM[4]) );
  CLKINVXL U107 ( .A(n49), .Y(n61) );
  AND2X1 U108 ( .A(n62), .B(n55), .Y(n119) );
  ADDFHX1 U109 ( .A(n116), .B(A[1]), .CI(B[1]), .CO(n57), .S(SUM[1]) );
  XNOR2XL U110 ( .A(A[0]), .B(B[0]), .Y(SUM[0]) );
  NAND2XL U111 ( .A(A[5]), .B(B[5]), .Y(n46) );
  INVX2 U112 ( .A(n55), .Y(n53) );
  AOI21X4 U113 ( .A0(n62), .A1(n56), .B0(n53), .Y(n51) );
endmodule


module SNN_DW01_add_122 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n1, n6, n8, n9, n11, n12, n13, n15, n16, n19, n20, n22, n23, n24, n25,
         n26, n27, n31, n32, n36, n37, n38, n39, n40, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n52, n53, n54, n55, n56, n59, n60, n61, n62, n63,
         n64, n67, n68, n69, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n86, n87, n88, n94, n95, n98, n99, n100,
         n101, n102, n155, n157, n158, n159;

  AOI21X1 U15 ( .A0(n37), .A1(n24), .B0(n25), .Y(n23) );
  AOI21X1 U41 ( .A0(n46), .A1(n95), .B0(n42), .Y(n40) );
  AOI21X1 U60 ( .A0(n54), .A1(n74), .B0(n55), .Y(n53) );
  AOI21X1 U82 ( .A0(n74), .A1(n99), .B0(n71), .Y(n69) );
  ADDFX2 U112 ( .A(B[2]), .B(A[2]), .CI(n88), .CO(n87), .S(SUM[2]) );
  ADDFX2 U113 ( .A(A[1]), .B(B[1]), .CI(n159), .CO(n88), .S(SUM[1]) );
  NAND2X1 U120 ( .A(A[6]), .B(B[6]), .Y(n73) );
  OAI2BB1X1 U121 ( .A0N(n46), .A1N(n15), .B0(n157), .Y(CO) );
  CLKINVXL U122 ( .A(n44), .Y(n42) );
  NAND2XL U123 ( .A(n95), .B(n44), .Y(n6) );
  OAI21XL U124 ( .A0(n38), .A1(n44), .B0(n39), .Y(n37) );
  CLKINVX1 U125 ( .A(n16), .Y(n157) );
  OAI21X1 U126 ( .A0(n85), .A1(n1), .B0(n86), .Y(n84) );
  AOI21X1 U127 ( .A0(n84), .A1(n76), .B0(n77), .Y(n75) );
  OAI21XL U128 ( .A0(n78), .A1(n82), .B0(n79), .Y(n77) );
  NOR2X1 U129 ( .A(n78), .B(n81), .Y(n76) );
  NOR2X1 U130 ( .A(A[4]), .B(B[4]), .Y(n81) );
  OAI21X1 U131 ( .A0(n47), .A1(n75), .B0(n48), .Y(n46) );
  NOR2X1 U132 ( .A(n63), .B(n56), .Y(n54) );
  NOR2X1 U133 ( .A(A[8]), .B(B[8]), .Y(n56) );
  NOR2X1 U134 ( .A(A[11]), .B(B[11]), .Y(n38) );
  NOR2X1 U135 ( .A(n22), .B(n19), .Y(n15) );
  NOR2X1 U136 ( .A(A[7]), .B(B[7]), .Y(n67) );
  OAI21X1 U137 ( .A0(n67), .A1(n73), .B0(n68), .Y(n62) );
  OAI21XL U138 ( .A0(n83), .A1(n81), .B0(n82), .Y(n80) );
  CLKINVXL U139 ( .A(n78), .Y(n100) );
  NAND2XL U140 ( .A(A[10]), .B(B[10]), .Y(n44) );
  AOI21XL U141 ( .A0(n74), .A1(n61), .B0(n62), .Y(n60) );
  NOR2X1 U142 ( .A(A[13]), .B(B[13]), .Y(n26) );
  CLKINVXL U143 ( .A(n61), .Y(n63) );
  NOR2XL U144 ( .A(A[6]), .B(B[6]), .Y(n72) );
  NOR2XL U145 ( .A(A[10]), .B(B[10]), .Y(n43) );
  NAND2XL U146 ( .A(A[7]), .B(B[7]), .Y(n68) );
  NAND2BX1 U147 ( .AN(n56), .B(n59), .Y(n8) );
  XNOR2X1 U148 ( .A(n40), .B(n155), .Y(SUM[11]) );
  AND2X1 U149 ( .A(n94), .B(n39), .Y(n155) );
  CLKINVXL U150 ( .A(n84), .Y(n83) );
  NOR2X1 U151 ( .A(n67), .B(n72), .Y(n61) );
  NAND2X1 U152 ( .A(n59), .B(n52), .Y(n50) );
  INVX2 U153 ( .A(A[9]), .Y(n52) );
  INVX2 U154 ( .A(n72), .Y(n99) );
  INVX2 U155 ( .A(n43), .Y(n95) );
  INVX2 U156 ( .A(n67), .Y(n98) );
  XOR2X1 U157 ( .A(n45), .B(n6), .Y(SUM[10]) );
  XOR2X1 U158 ( .A(n53), .B(A[9]), .Y(SUM[9]) );
  XOR2X1 U159 ( .A(n69), .B(n9), .Y(SUM[7]) );
  NAND2X1 U160 ( .A(n98), .B(n68), .Y(n9) );
  NOR2X1 U161 ( .A(A[5]), .B(B[5]), .Y(n78) );
  NAND2XL U162 ( .A(A[14]), .B(B[14]), .Y(n20) );
  NAND2XL U163 ( .A(n36), .B(n24), .Y(n22) );
  NOR2X1 U164 ( .A(n43), .B(n38), .Y(n36) );
  CLKINVXL U165 ( .A(n46), .Y(n45) );
  CLKINVXL U166 ( .A(n38), .Y(n94) );
  CLKINVXL U167 ( .A(n73), .Y(n71) );
  NOR2XL U168 ( .A(A[14]), .B(B[14]), .Y(n19) );
  CLKINVXL U169 ( .A(n62), .Y(n64) );
  XOR2X1 U170 ( .A(n74), .B(n158), .Y(SUM[6]) );
  AND2X1 U171 ( .A(n99), .B(n73), .Y(n158) );
  INVX1 U172 ( .A(n56), .Y(n49) );
  CLKINVXL U173 ( .A(n75), .Y(n74) );
  XOR2X1 U174 ( .A(n83), .B(n12), .Y(SUM[4]) );
  NAND2X1 U175 ( .A(n101), .B(n82), .Y(n12) );
  INVX2 U176 ( .A(n81), .Y(n101) );
  XNOR2X1 U177 ( .A(n80), .B(n11), .Y(SUM[5]) );
  NAND2X1 U178 ( .A(n100), .B(n79), .Y(n11) );
  NAND2XL U179 ( .A(A[4]), .B(B[4]), .Y(n82) );
  NOR2X1 U180 ( .A(A[3]), .B(B[3]), .Y(n85) );
  XNOR2X1 U181 ( .A(A[0]), .B(B[0]), .Y(SUM[0]) );
  INVX2 U182 ( .A(n87), .Y(n1) );
  XNOR2X1 U183 ( .A(n13), .B(n87), .Y(SUM[3]) );
  NAND2XL U184 ( .A(n102), .B(n86), .Y(n13) );
  CLKINVXL U185 ( .A(n85), .Y(n102) );
  OR2X1 U186 ( .A(A[0]), .B(B[0]), .Y(n159) );
  XOR2X1 U187 ( .A(n60), .B(n8), .Y(SUM[8]) );
  AOI21X1 U188 ( .A0(n49), .A1(n62), .B0(n50), .Y(n48) );
  OAI21XL U189 ( .A0(n23), .A1(n19), .B0(n20), .Y(n16) );
  OAI21XL U190 ( .A0(n26), .A1(n32), .B0(n27), .Y(n25) );
  NOR2X1 U191 ( .A(n31), .B(n26), .Y(n24) );
  NAND2XL U192 ( .A(A[12]), .B(B[12]), .Y(n32) );
  NOR2XL U193 ( .A(A[12]), .B(B[12]), .Y(n31) );
  NAND2X1 U194 ( .A(n61), .B(n49), .Y(n47) );
  OAI21XL U195 ( .A0(n64), .A1(n56), .B0(n59), .Y(n55) );
  NAND2XL U196 ( .A(A[5]), .B(B[5]), .Y(n79) );
  NAND2XL U197 ( .A(A[3]), .B(B[3]), .Y(n86) );
  NAND2XL U198 ( .A(A[13]), .B(B[13]), .Y(n27) );
  NAND2XL U199 ( .A(A[11]), .B(B[11]), .Y(n39) );
  NAND2XL U200 ( .A(A[8]), .B(B[8]), .Y(n59) );
endmodule


module SNN_DW01_add_123 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n1, n5, n7, n8, n9, n12, n13, n14, n15, n16, n19, n20, n22, n23, n24,
         n25, n26, n27, n31, n32, n36, n37, n38, n39, n40, n42, n43, n44, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n59, n60, n61, n62,
         n64, n67, n68, n69, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n86, n87, n88, n94, n95, n96, n97, n98, n99,
         n101, n102, n155, n156, n157, n158, n159;

  AOI21X1 U15 ( .A0(n37), .A1(n24), .B0(n25), .Y(n23) );
  AOI21X1 U52 ( .A0(n49), .A1(n62), .B0(n50), .Y(n48) );
  AOI21X1 U60 ( .A0(n54), .A1(n74), .B0(n55), .Y(n53) );
  AOI21X1 U82 ( .A0(n74), .A1(n99), .B0(n71), .Y(n69) );
  ADDFXL U120 ( .A(B[2]), .B(A[2]), .CI(n88), .CO(n87), .S(SUM[2]) );
  XNOR2XL U121 ( .A(A[0]), .B(B[0]), .Y(SUM[0]) );
  NOR2XL U122 ( .A(A[11]), .B(B[11]), .Y(n38) );
  OAI21X1 U123 ( .A0(n85), .A1(n1), .B0(n86), .Y(n84) );
  AOI21X1 U124 ( .A0(n84), .A1(n76), .B0(n77), .Y(n75) );
  NOR2X1 U125 ( .A(n78), .B(n81), .Y(n76) );
  NOR2X1 U126 ( .A(n43), .B(n38), .Y(n36) );
  OAI21X2 U127 ( .A0(n47), .A1(n75), .B0(n48), .Y(n46) );
  OR2X1 U128 ( .A(A[0]), .B(B[0]), .Y(n155) );
  NOR2XL U129 ( .A(A[10]), .B(B[10]), .Y(n43) );
  NOR2XL U130 ( .A(A[12]), .B(B[12]), .Y(n31) );
  NOR2XL U131 ( .A(A[8]), .B(B[8]), .Y(n56) );
  NAND2XL U132 ( .A(A[11]), .B(B[11]), .Y(n39) );
  NAND2XL U133 ( .A(n101), .B(n82), .Y(n12) );
  CLKINVXL U134 ( .A(n85), .Y(n102) );
  CLKINVXL U135 ( .A(n72), .Y(n99) );
  NAND2XL U136 ( .A(A[6]), .B(B[6]), .Y(n73) );
  CLKINVXL U137 ( .A(n43), .Y(n95) );
  INVX1 U138 ( .A(n14), .Y(CO) );
  AOI21X1 U139 ( .A0(n46), .A1(n15), .B0(n16), .Y(n14) );
  NOR2X1 U140 ( .A(n22), .B(n19), .Y(n15) );
  XOR2X1 U141 ( .A(n74), .B(n156), .Y(SUM[6]) );
  AND2X1 U142 ( .A(n99), .B(n73), .Y(n156) );
  CLKINVXL U143 ( .A(n51), .Y(n96) );
  AOI21XL U144 ( .A0(n74), .A1(n61), .B0(n62), .Y(n60) );
  CLKINVXL U145 ( .A(n81), .Y(n101) );
  NAND2XL U146 ( .A(A[4]), .B(B[4]), .Y(n82) );
  CLKINVXL U147 ( .A(n75), .Y(n74) );
  XOR2X1 U148 ( .A(n80), .B(n157), .Y(SUM[5]) );
  AND2X1 U149 ( .A(n159), .B(n79), .Y(n157) );
  OAI21X1 U150 ( .A0(n78), .A1(n82), .B0(n79), .Y(n77) );
  OAI21X1 U151 ( .A0(n67), .A1(n73), .B0(n68), .Y(n62) );
  NOR2X1 U152 ( .A(n67), .B(n72), .Y(n61) );
  INVX2 U153 ( .A(n73), .Y(n71) );
  NOR2X1 U154 ( .A(A[7]), .B(B[7]), .Y(n67) );
  NOR2X1 U155 ( .A(A[6]), .B(B[6]), .Y(n72) );
  NOR2X1 U156 ( .A(A[14]), .B(B[14]), .Y(n19) );
  NAND2X1 U157 ( .A(A[7]), .B(B[7]), .Y(n68) );
  NOR2BXL U158 ( .AN(n61), .B(n56), .Y(n54) );
  CLKINVXL U159 ( .A(n62), .Y(n64) );
  CLKINVXL U160 ( .A(n44), .Y(n42) );
  OR2X1 U161 ( .A(A[5]), .B(B[5]), .Y(n159) );
  XOR2X1 U162 ( .A(n69), .B(n9), .Y(SUM[7]) );
  NAND2XL U163 ( .A(n98), .B(n68), .Y(n9) );
  CLKINVXL U164 ( .A(n67), .Y(n98) );
  NOR2X1 U165 ( .A(A[13]), .B(B[13]), .Y(n26) );
  NAND2X1 U166 ( .A(n36), .B(n24), .Y(n22) );
  XOR2X1 U167 ( .A(n46), .B(n158), .Y(SUM[10]) );
  AND2X1 U168 ( .A(n95), .B(n44), .Y(n158) );
  CLKINVXL U169 ( .A(n56), .Y(n97) );
  XOR2X1 U170 ( .A(n53), .B(n7), .Y(SUM[9]) );
  NAND2XL U171 ( .A(n96), .B(n52), .Y(n7) );
  XOR2X1 U172 ( .A(n40), .B(n5), .Y(SUM[11]) );
  NAND2XL U173 ( .A(n94), .B(n39), .Y(n5) );
  CLKINVXL U174 ( .A(n38), .Y(n94) );
  XOR2X1 U175 ( .A(n83), .B(n12), .Y(SUM[4]) );
  NOR2X1 U176 ( .A(A[9]), .B(B[9]), .Y(n51) );
  NOR2X1 U177 ( .A(A[4]), .B(B[4]), .Y(n81) );
  OAI21XL U178 ( .A0(n83), .A1(n81), .B0(n82), .Y(n80) );
  CLKINVX2 U179 ( .A(n159), .Y(n78) );
  NOR2X1 U180 ( .A(A[3]), .B(B[3]), .Y(n85) );
  INVX2 U181 ( .A(n84), .Y(n83) );
  XNOR2X1 U182 ( .A(n13), .B(n87), .Y(SUM[3]) );
  NAND2X1 U183 ( .A(n102), .B(n86), .Y(n13) );
  INVX2 U184 ( .A(n87), .Y(n1) );
  ADDFX2 U185 ( .A(n155), .B(A[1]), .CI(B[1]), .CO(n88), .S(SUM[1]) );
  NOR2X1 U186 ( .A(n31), .B(n26), .Y(n24) );
  OAI21XL U187 ( .A0(n26), .A1(n32), .B0(n27), .Y(n25) );
  NAND2X1 U188 ( .A(n97), .B(n59), .Y(n8) );
  OAI21XL U189 ( .A0(n51), .A1(n59), .B0(n52), .Y(n50) );
  OAI21XL U190 ( .A0(n64), .A1(n56), .B0(n59), .Y(n55) );
  NOR2X1 U191 ( .A(n56), .B(n51), .Y(n49) );
  XOR2X1 U192 ( .A(n60), .B(n8), .Y(SUM[8]) );
  NAND2X1 U193 ( .A(n61), .B(n49), .Y(n47) );
  OAI21XL U194 ( .A0(n23), .A1(n19), .B0(n20), .Y(n16) );
  OAI21XL U195 ( .A0(n38), .A1(n44), .B0(n39), .Y(n37) );
  AOI21XL U196 ( .A0(n46), .A1(n95), .B0(n42), .Y(n40) );
  NAND2XL U197 ( .A(A[10]), .B(B[10]), .Y(n44) );
  NAND2XL U198 ( .A(A[5]), .B(B[5]), .Y(n79) );
  NAND2XL U199 ( .A(A[14]), .B(B[14]), .Y(n20) );
  NAND2XL U200 ( .A(A[3]), .B(B[3]), .Y(n86) );
  NAND2XL U201 ( .A(A[13]), .B(B[13]), .Y(n27) );
  NAND2XL U202 ( .A(A[9]), .B(B[9]), .Y(n52) );
  NAND2XL U203 ( .A(A[12]), .B(B[12]), .Y(n32) );
  NAND2XL U204 ( .A(A[8]), .B(B[8]), .Y(n59) );
endmodule


module SNN_DW01_add_118 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n1, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n19, n20,
         n22, n23, n24, n25, n26, n27, n31, n32, n36, n37, n38, n39, n40, n42,
         n43, n44, n45, n46, n47, n48, n50, n51, n52, n53, n54, n55, n56, n59,
         n60, n61, n62, n64, n67, n68, n69, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n95, n97, n98,
         n99, n100, n101, n102, n156;

  NOR2X2 U10 ( .A(A[14]), .B(B[14]), .Y(n19) );
  AOI21X1 U15 ( .A0(n24), .A1(n37), .B0(n25), .Y(n23) );
  AOI21X1 U60 ( .A0(n54), .A1(n74), .B0(n55), .Y(n53) );
  AOI21X1 U82 ( .A0(n74), .A1(n99), .B0(n71), .Y(n69) );
  ADDFX2 U112 ( .A(B[2]), .B(A[2]), .CI(n88), .CO(n87), .S(SUM[2]) );
  INVX1 U120 ( .A(n84), .Y(n83) );
  NAND2BX1 U121 ( .AN(n38), .B(n39), .Y(n5) );
  NOR2XL U122 ( .A(n43), .B(n38), .Y(n36) );
  INVX3 U123 ( .A(n14), .Y(CO) );
  NAND2X1 U124 ( .A(A[4]), .B(B[4]), .Y(n82) );
  CLKINVXL U125 ( .A(n46), .Y(n45) );
  NOR2X1 U126 ( .A(n78), .B(n81), .Y(n76) );
  OAI21X2 U127 ( .A0(n67), .A1(n73), .B0(n68), .Y(n62) );
  AOI21X2 U128 ( .A0(n46), .A1(n15), .B0(n16), .Y(n14) );
  OAI21X1 U129 ( .A0(n38), .A1(n44), .B0(n39), .Y(n37) );
  NAND2X2 U130 ( .A(A[10]), .B(B[10]), .Y(n44) );
  OAI21X2 U131 ( .A0(n47), .A1(n75), .B0(n48), .Y(n46) );
  AOI21X2 U132 ( .A0(n84), .A1(n76), .B0(n77), .Y(n75) );
  OAI21X1 U133 ( .A0(n23), .A1(n19), .B0(n20), .Y(n16) );
  NOR2X2 U134 ( .A(A[9]), .B(B[9]), .Y(n51) );
  NAND2X4 U135 ( .A(A[6]), .B(B[6]), .Y(n73) );
  CLKINVXL U136 ( .A(n78), .Y(n100) );
  OAI21X1 U137 ( .A0(n78), .A1(n82), .B0(n79), .Y(n77) );
  NOR2X2 U138 ( .A(A[7]), .B(B[7]), .Y(n67) );
  NAND2XL U139 ( .A(A[9]), .B(B[9]), .Y(n52) );
  NAND2XL U140 ( .A(n61), .B(n156), .Y(n47) );
  NOR2X1 U141 ( .A(n56), .B(n51), .Y(n156) );
  CLKINVXL U142 ( .A(n56), .Y(n97) );
  NAND2XL U143 ( .A(n100), .B(n79), .Y(n11) );
  NOR2XL U144 ( .A(A[10]), .B(B[10]), .Y(n43) );
  NOR2X2 U145 ( .A(A[5]), .B(B[5]), .Y(n78) );
  AOI21X1 U146 ( .A0(n156), .A1(n62), .B0(n50), .Y(n48) );
  NAND2XL U147 ( .A(n98), .B(n68), .Y(n9) );
  NOR2X1 U148 ( .A(A[13]), .B(B[13]), .Y(n26) );
  CLKINVXL U149 ( .A(n62), .Y(n64) );
  CLKINVXL U150 ( .A(n72), .Y(n99) );
  CLKINVXL U151 ( .A(n67), .Y(n98) );
  NOR2X2 U152 ( .A(A[11]), .B(B[11]), .Y(n38) );
  NAND2XL U153 ( .A(A[8]), .B(B[8]), .Y(n59) );
  OAI21X1 U154 ( .A0(n85), .A1(n1), .B0(n86), .Y(n84) );
  NAND2BX1 U155 ( .AN(n51), .B(n52), .Y(n7) );
  NOR2X1 U156 ( .A(n67), .B(n72), .Y(n61) );
  OAI21X1 U157 ( .A0(n59), .A1(n51), .B0(n52), .Y(n50) );
  CLKINVXL U158 ( .A(n43), .Y(n95) );
  NAND2XL U159 ( .A(n95), .B(n44), .Y(n6) );
  NAND2X1 U160 ( .A(A[7]), .B(B[7]), .Y(n68) );
  NOR2X1 U161 ( .A(A[6]), .B(B[6]), .Y(n72) );
  NOR2X1 U162 ( .A(A[8]), .B(B[8]), .Y(n56) );
  XOR2X1 U163 ( .A(n53), .B(n7), .Y(SUM[9]) );
  XOR2X1 U164 ( .A(n45), .B(n6), .Y(SUM[10]) );
  XOR2X1 U165 ( .A(n69), .B(n9), .Y(SUM[7]) );
  NOR2X1 U166 ( .A(n22), .B(n19), .Y(n15) );
  NAND2XL U167 ( .A(A[5]), .B(B[5]), .Y(n79) );
  CLKINVXL U168 ( .A(n44), .Y(n42) );
  NOR2BXL U169 ( .AN(n61), .B(n56), .Y(n54) );
  CLKINVXL U170 ( .A(n73), .Y(n71) );
  AOI21XL U171 ( .A0(n74), .A1(n61), .B0(n62), .Y(n60) );
  XNOR2X1 U172 ( .A(n74), .B(n10), .Y(SUM[6]) );
  NOR2X1 U173 ( .A(A[12]), .B(B[12]), .Y(n31) );
  NOR2X1 U174 ( .A(A[4]), .B(B[4]), .Y(n81) );
  NAND2XL U175 ( .A(A[14]), .B(B[14]), .Y(n20) );
  INVX2 U176 ( .A(n75), .Y(n74) );
  XNOR2X1 U177 ( .A(n80), .B(n11), .Y(SUM[5]) );
  XOR2X1 U178 ( .A(n83), .B(n12), .Y(SUM[4]) );
  NAND2X1 U179 ( .A(n101), .B(n82), .Y(n12) );
  CLKINVXL U180 ( .A(n81), .Y(n101) );
  NOR2X1 U181 ( .A(A[3]), .B(B[3]), .Y(n85) );
  INVX2 U182 ( .A(n87), .Y(n1) );
  XNOR2X1 U183 ( .A(B[1]), .B(A[1]), .Y(SUM[1]) );
  BUFX2 U184 ( .A(A[0]), .Y(SUM[0]) );
  XNOR2X1 U185 ( .A(n13), .B(n87), .Y(SUM[3]) );
  NAND2XL U186 ( .A(n102), .B(n86), .Y(n13) );
  CLKINVXL U187 ( .A(n85), .Y(n102) );
  OR2XL U188 ( .A(B[1]), .B(A[1]), .Y(n88) );
  XOR2X1 U189 ( .A(n40), .B(n5), .Y(SUM[11]) );
  NAND2X1 U190 ( .A(A[3]), .B(B[3]), .Y(n86) );
  NAND2XL U191 ( .A(n36), .B(n24), .Y(n22) );
  AOI21XL U192 ( .A0(n46), .A1(n95), .B0(n42), .Y(n40) );
  OAI21XL U193 ( .A0(n64), .A1(n56), .B0(n59), .Y(n55) );
  XOR2X1 U194 ( .A(n60), .B(n8), .Y(SUM[8]) );
  NOR2X1 U195 ( .A(n26), .B(n31), .Y(n24) );
  OAI21XL U196 ( .A0(n26), .A1(n32), .B0(n27), .Y(n25) );
  NAND2X1 U197 ( .A(A[12]), .B(B[12]), .Y(n32) );
  OAI21XL U198 ( .A0(n83), .A1(n81), .B0(n82), .Y(n80) );
  NAND2XL U199 ( .A(n99), .B(n73), .Y(n10) );
  NAND2XL U200 ( .A(n97), .B(n59), .Y(n8) );
  NAND2XL U201 ( .A(A[13]), .B(B[13]), .Y(n27) );
  NAND2X1 U202 ( .A(A[11]), .B(B[11]), .Y(n39) );
endmodule


module SNN_DW01_add_121 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n1, n8, n9, n12, n13, n16, n23, n24, n32, n34, n35, n36, n38, n39,
         n42, n43, n44, n46, n49, n50, n51, n52, n53, n58, n59, n60, n61, n62,
         n65, n66, n67, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85, n86, n90, n91, n92, n93, n94, n95, n148,
         n149, n151, n152, n153, n154, n155;

  AOI21X1 U34 ( .A0(n90), .A1(n60), .B0(n38), .Y(n36) );
  AOI21X1 U42 ( .A0(n43), .A1(n72), .B0(n44), .Y(n42) );
  AOI21X1 U51 ( .A0(n50), .A1(n72), .B0(n51), .Y(n49) );
  AOI21X1 U63 ( .A0(n72), .A1(n59), .B0(n60), .Y(n58) );
  AOI21X1 U75 ( .A0(n72), .A1(n92), .B0(n69), .Y(n67) );
  ADDFX2 U105 ( .A(A[2]), .B(B[2]), .CI(n86), .CO(n85), .S(SUM[2]) );
  ADDFX2 U106 ( .A(A[1]), .B(B[1]), .CI(n153), .CO(n86), .S(SUM[1]) );
  AOI21X1 U113 ( .A0(n82), .A1(n74), .B0(n75), .Y(n73) );
  NOR2X1 U114 ( .A(n76), .B(n79), .Y(n74) );
  NOR2X1 U115 ( .A(A[5]), .B(B[5]), .Y(n76) );
  NOR2X1 U116 ( .A(A[4]), .B(B[4]), .Y(n79) );
  NOR2X1 U117 ( .A(A[8]), .B(B[8]), .Y(n52) );
  NOR2X1 U118 ( .A(A[10]), .B(A[9]), .Y(n39) );
  NOR2X1 U119 ( .A(n23), .B(A[14]), .Y(n16) );
  NAND2XL U120 ( .A(n90), .B(n53), .Y(n8) );
  NAND2XL U121 ( .A(n24), .B(n32), .Y(n23) );
  NOR2X1 U122 ( .A(A[12]), .B(A[13]), .Y(n24) );
  CLKINVXL U123 ( .A(n60), .Y(n62) );
  CLKINVXL U124 ( .A(n59), .Y(n61) );
  CLKINVXL U125 ( .A(n70), .Y(n92) );
  CLKINVXL U126 ( .A(n76), .Y(n93) );
  XOR2X1 U127 ( .A(n78), .B(n148), .Y(SUM[5]) );
  AND2X1 U128 ( .A(n93), .B(n77), .Y(n148) );
  NAND2XL U129 ( .A(A[6]), .B(B[6]), .Y(n71) );
  NAND2XL U130 ( .A(n94), .B(n80), .Y(n12) );
  CLKINVXL U131 ( .A(n82), .Y(n81) );
  OAI21X1 U132 ( .A0(n65), .A1(n71), .B0(n66), .Y(n60) );
  NOR2X1 U133 ( .A(n65), .B(n70), .Y(n59) );
  INVX2 U134 ( .A(n71), .Y(n69) );
  NOR2X1 U135 ( .A(A[7]), .B(B[7]), .Y(n65) );
  INVX2 U136 ( .A(n52), .Y(n90) );
  NOR2X1 U137 ( .A(A[6]), .B(B[6]), .Y(n70) );
  NAND2XL U138 ( .A(A[7]), .B(B[7]), .Y(n66) );
  XOR2XL U139 ( .A(n42), .B(A[10]), .Y(SUM[10]) );
  XOR2X1 U140 ( .A(n67), .B(n9), .Y(SUM[7]) );
  NAND2XL U141 ( .A(n91), .B(n66), .Y(n9) );
  CLKINVXL U142 ( .A(n65), .Y(n91) );
  NOR2BXL U143 ( .AN(n53), .B(A[9]), .Y(n46) );
  XOR2X1 U144 ( .A(n72), .B(n149), .Y(SUM[6]) );
  AND2X1 U145 ( .A(n92), .B(n71), .Y(n149) );
  OAI21X1 U146 ( .A0(n35), .A1(n73), .B0(n36), .Y(n34) );
  NAND2XL U147 ( .A(n59), .B(n90), .Y(n35) );
  OAI2BB1X2 U148 ( .A0N(n34), .A1N(n152), .B0(n16), .Y(CO) );
  NAND2XL U149 ( .A(A[4]), .B(B[4]), .Y(n80) );
  CLKINVXL U150 ( .A(n73), .Y(n72) );
  XOR2X1 U151 ( .A(n81), .B(n12), .Y(SUM[4]) );
  CLKINVXL U152 ( .A(n79), .Y(n94) );
  OAI21XL U153 ( .A0(n81), .A1(n79), .B0(n80), .Y(n78) );
  XOR2X1 U154 ( .A(n34), .B(n151), .Y(SUM[11]) );
  AND2X1 U155 ( .A(n152), .B(n32), .Y(n151) );
  OAI21X1 U156 ( .A0(n76), .A1(n80), .B0(n77), .Y(n75) );
  OR2XL U157 ( .A(A[11]), .B(B[11]), .Y(n152) );
  NOR2X1 U158 ( .A(A[3]), .B(B[3]), .Y(n83) );
  XNOR2X1 U159 ( .A(A[0]), .B(n154), .Y(SUM[0]) );
  OAI21X1 U160 ( .A0(n83), .A1(n1), .B0(n84), .Y(n82) );
  INVX2 U161 ( .A(n85), .Y(n1) );
  XNOR2X1 U162 ( .A(n13), .B(n85), .Y(SUM[3]) );
  NAND2XL U163 ( .A(n95), .B(n84), .Y(n13) );
  CLKINVXL U164 ( .A(n83), .Y(n95) );
  OR2X1 U165 ( .A(A[0]), .B(n154), .Y(n153) );
  INVX2 U166 ( .A(n155), .Y(n154) );
  CLKINVXL U167 ( .A(B[0]), .Y(n155) );
  OAI21X1 U168 ( .A0(n62), .A1(n52), .B0(n53), .Y(n51) );
  NOR2X1 U169 ( .A(n61), .B(n52), .Y(n50) );
  NOR2X1 U170 ( .A(n61), .B(n52), .Y(n43) );
  OAI21X1 U171 ( .A0(n62), .A1(n52), .B0(n46), .Y(n44) );
  XOR2X1 U172 ( .A(n58), .B(n8), .Y(SUM[8]) );
  NAND2XL U173 ( .A(n39), .B(n53), .Y(n38) );
  NAND2XL U174 ( .A(A[5]), .B(B[5]), .Y(n77) );
  NAND2XL U175 ( .A(A[3]), .B(B[3]), .Y(n84) );
  XOR2XL U176 ( .A(n49), .B(A[9]), .Y(SUM[9]) );
  NAND2XL U177 ( .A(A[11]), .B(B[11]), .Y(n32) );
  NAND2XL U178 ( .A(A[8]), .B(B[8]), .Y(n53) );
endmodule


module SNN_DW01_add_114 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n1, n5, n6, n7, n8, n9, n11, n12, n13, n14, n15, n16, n19, n20, n22,
         n23, n24, n25, n26, n27, n31, n32, n36, n37, n38, n39, n40, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n59,
         n60, n61, n62, n64, n67, n68, n69, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n95, n98, n99,
         n155, n156, n157, n158;

  AOI21X1 U60 ( .A0(n54), .A1(n74), .B0(n55), .Y(n53) );
  NOR2X2 U96 ( .A(A[5]), .B(B[5]), .Y(n78) );
  ADDFX2 U112 ( .A(B[2]), .B(A[2]), .CI(n88), .CO(n87), .S(SUM[2]) );
  NAND2X1 U120 ( .A(A[12]), .B(B[12]), .Y(n32) );
  NOR2X2 U121 ( .A(A[12]), .B(B[12]), .Y(n31) );
  OAI21X1 U122 ( .A0(n51), .A1(n59), .B0(n52), .Y(n50) );
  NOR2X1 U123 ( .A(n72), .B(n67), .Y(n61) );
  NOR2X1 U124 ( .A(A[13]), .B(B[13]), .Y(n26) );
  NOR2X1 U125 ( .A(A[10]), .B(B[10]), .Y(n43) );
  NOR2X1 U126 ( .A(A[11]), .B(B[11]), .Y(n38) );
  NOR2X1 U127 ( .A(n31), .B(n26), .Y(n24) );
  NOR2X1 U128 ( .A(A[14]), .B(B[14]), .Y(n19) );
  NAND2X1 U129 ( .A(n49), .B(n61), .Y(n47) );
  INVXL U130 ( .A(n75), .Y(n74) );
  AOI21XL U131 ( .A0(n74), .A1(n99), .B0(n71), .Y(n69) );
  INVX2 U132 ( .A(n64), .Y(n155) );
  CLKINVXL U133 ( .A(n62), .Y(n64) );
  NAND2BXL U134 ( .AN(n56), .B(n59), .Y(n8) );
  AOI21XL U135 ( .A0(n74), .A1(n61), .B0(n155), .Y(n60) );
  NOR2X1 U136 ( .A(A[6]), .B(B[6]), .Y(n72) );
  NAND2X2 U137 ( .A(A[6]), .B(B[6]), .Y(n73) );
  OAI21X1 U138 ( .A0(n23), .A1(n19), .B0(n20), .Y(n16) );
  AOI21X1 U139 ( .A0(n37), .A1(n24), .B0(n25), .Y(n23) );
  CLKINVXL U140 ( .A(n81), .Y(n156) );
  INVX2 U141 ( .A(n156), .Y(n157) );
  NAND2X1 U142 ( .A(A[4]), .B(B[4]), .Y(n82) );
  OAI21X2 U143 ( .A0(n67), .A1(n73), .B0(n68), .Y(n62) );
  NAND2XL U144 ( .A(n156), .B(n82), .Y(n12) );
  NAND2X1 U145 ( .A(A[10]), .B(B[10]), .Y(n44) );
  AOI21X2 U146 ( .A0(n49), .A1(n62), .B0(n50), .Y(n48) );
  NOR2X2 U147 ( .A(A[9]), .B(B[9]), .Y(n51) );
  NOR2X2 U148 ( .A(A[8]), .B(B[8]), .Y(n56) );
  NAND2X1 U149 ( .A(A[8]), .B(B[8]), .Y(n59) );
  NOR2X1 U150 ( .A(A[4]), .B(B[4]), .Y(n81) );
  OAI21X2 U151 ( .A0(n85), .A1(n1), .B0(n86), .Y(n84) );
  NOR2X1 U152 ( .A(A[3]), .B(B[3]), .Y(n85) );
  NAND2XL U153 ( .A(A[3]), .B(B[3]), .Y(n86) );
  OAI21X2 U154 ( .A0(n75), .A1(n47), .B0(n48), .Y(n46) );
  AOI21X2 U155 ( .A0(n76), .A1(n84), .B0(n77), .Y(n75) );
  NAND2BX1 U156 ( .AN(n51), .B(n52), .Y(n7) );
  NOR2BXL U157 ( .AN(n61), .B(n56), .Y(n54) );
  CLKINVXL U158 ( .A(n73), .Y(n71) );
  NAND2BXL U159 ( .AN(n85), .B(n86), .Y(n13) );
  NAND2X1 U160 ( .A(A[5]), .B(B[5]), .Y(n79) );
  NOR2X2 U161 ( .A(A[7]), .B(B[7]), .Y(n67) );
  NAND2XL U162 ( .A(A[7]), .B(B[7]), .Y(n68) );
  CLKINVXL U163 ( .A(n43), .Y(n95) );
  NAND2BX1 U164 ( .AN(n38), .B(n39), .Y(n5) );
  NAND2XL U165 ( .A(n95), .B(n44), .Y(n6) );
  XOR2X1 U166 ( .A(n40), .B(n5), .Y(SUM[11]) );
  XOR2X1 U167 ( .A(n45), .B(n6), .Y(SUM[10]) );
  OAI21XL U168 ( .A0(n64), .A1(n56), .B0(n59), .Y(n55) );
  XOR2X1 U169 ( .A(n53), .B(n7), .Y(SUM[9]) );
  CLKINVXL U170 ( .A(n44), .Y(n42) );
  CLKINVXL U171 ( .A(n46), .Y(n45) );
  XOR2X1 U172 ( .A(n60), .B(n8), .Y(SUM[8]) );
  XOR2X1 U173 ( .A(n69), .B(n9), .Y(SUM[7]) );
  NAND2XL U174 ( .A(n98), .B(n68), .Y(n9) );
  CLKINVXL U175 ( .A(n67), .Y(n98) );
  NOR2X1 U176 ( .A(n22), .B(n19), .Y(n15) );
  NAND2XL U177 ( .A(n36), .B(n24), .Y(n22) );
  XOR2X1 U178 ( .A(n74), .B(n158), .Y(SUM[6]) );
  AND2X1 U179 ( .A(n99), .B(n73), .Y(n158) );
  CLKINVXL U180 ( .A(n72), .Y(n99) );
  OAI21XL U181 ( .A0(n26), .A1(n32), .B0(n27), .Y(n25) );
  NAND2XL U182 ( .A(A[13]), .B(B[13]), .Y(n27) );
  OAI21X1 U183 ( .A0(n78), .A1(n82), .B0(n79), .Y(n77) );
  NOR2X1 U184 ( .A(n78), .B(n81), .Y(n76) );
  XNOR2X1 U185 ( .A(n80), .B(n11), .Y(SUM[5]) );
  OAI21XL U186 ( .A0(n83), .A1(n157), .B0(n82), .Y(n80) );
  CLKINVXL U187 ( .A(n84), .Y(n83) );
  NAND2BX1 U188 ( .AN(n78), .B(n79), .Y(n11) );
  XOR2X1 U189 ( .A(n83), .B(n12), .Y(SUM[4]) );
  XNOR2X1 U190 ( .A(n13), .B(n87), .Y(SUM[3]) );
  INVX2 U191 ( .A(n87), .Y(n1) );
  XNOR2X1 U192 ( .A(B[1]), .B(A[1]), .Y(SUM[1]) );
  OR2XL U193 ( .A(B[1]), .B(A[1]), .Y(n88) );
  BUFX2 U194 ( .A(A[0]), .Y(SUM[0]) );
  OAI21XL U195 ( .A0(n38), .A1(n44), .B0(n39), .Y(n37) );
  NOR2X1 U196 ( .A(n38), .B(n43), .Y(n36) );
  AOI21X2 U197 ( .A0(n46), .A1(n15), .B0(n16), .Y(n14) );
  INVX4 U198 ( .A(n14), .Y(CO) );
  NOR2X4 U199 ( .A(n51), .B(n56), .Y(n49) );
  NAND2X1 U200 ( .A(A[11]), .B(B[11]), .Y(n39) );
  AOI21XL U201 ( .A0(n95), .A1(n46), .B0(n42), .Y(n40) );
  NAND2XL U202 ( .A(A[9]), .B(B[9]), .Y(n52) );
  NAND2XL U203 ( .A(A[14]), .B(B[14]), .Y(n20) );
endmodule


module SNN_DW01_add_115 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n1, n8, n9, n11, n12, n13, n16, n23, n24, n32, n34, n35, n36, n38,
         n39, n42, n43, n44, n46, n49, n50, n51, n52, n53, n55, n58, n59, n60,
         n61, n62, n65, n66, n67, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n90, n91, n92, n93, n94,
         n95, n148, n150, n151, n152;

  AOI21X1 U42 ( .A0(n43), .A1(n72), .B0(n44), .Y(n42) );
  AOI21X1 U51 ( .A0(n50), .A1(n72), .B0(n51), .Y(n49) );
  AOI21X1 U63 ( .A0(n72), .A1(n59), .B0(n60), .Y(n58) );
  AOI21X1 U75 ( .A0(n72), .A1(n92), .B0(n69), .Y(n67) );
  AOI21X1 U84 ( .A0(n74), .A1(n82), .B0(n75), .Y(n73) );
  ADDFX2 U105 ( .A(A[2]), .B(B[2]), .CI(n86), .CO(n85), .S(SUM[2]) );
  ADDFX2 U106 ( .A(A[1]), .B(B[1]), .CI(n152), .CO(n86), .S(SUM[1]) );
  NOR2XL U113 ( .A(A[12]), .B(A[13]), .Y(n24) );
  NAND2XL U114 ( .A(n91), .B(n66), .Y(n9) );
  OAI21X2 U115 ( .A0(n65), .A1(n71), .B0(n66), .Y(n60) );
  CLKINVXL U116 ( .A(n71), .Y(n69) );
  NOR2X2 U117 ( .A(A[7]), .B(B[7]), .Y(n65) );
  NOR2X2 U118 ( .A(A[8]), .B(B[8]), .Y(n52) );
  NOR2XL U119 ( .A(n61), .B(n52), .Y(n50) );
  NOR2X1 U120 ( .A(A[4]), .B(B[4]), .Y(n79) );
  NOR2X1 U121 ( .A(A[6]), .B(B[6]), .Y(n70) );
  NOR2X1 U122 ( .A(A[9]), .B(A[10]), .Y(n39) );
  NOR2X1 U123 ( .A(A[3]), .B(B[3]), .Y(n83) );
  NOR2X1 U124 ( .A(n70), .B(n65), .Y(n59) );
  NOR2X1 U125 ( .A(A[9]), .B(n55), .Y(n46) );
  OAI2BB1X2 U126 ( .A0N(n151), .A1N(n34), .B0(n16), .Y(CO) );
  CLKINVXL U127 ( .A(n60), .Y(n62) );
  NOR2X1 U128 ( .A(A[5]), .B(B[5]), .Y(n76) );
  NOR2XL U129 ( .A(n76), .B(n79), .Y(n74) );
  INVX1 U130 ( .A(n73), .Y(n72) );
  NAND2X1 U131 ( .A(A[6]), .B(B[6]), .Y(n71) );
  NOR2XL U132 ( .A(n61), .B(n52), .Y(n43) );
  INVX2 U133 ( .A(n52), .Y(n90) );
  NAND2XL U134 ( .A(n59), .B(n90), .Y(n35) );
  INVX1 U135 ( .A(n59), .Y(n61) );
  OAI21X1 U136 ( .A0(n73), .A1(n35), .B0(n36), .Y(n34) );
  OAI21XL U137 ( .A0(n76), .A1(n80), .B0(n77), .Y(n75) );
  NAND2XL U138 ( .A(n24), .B(n32), .Y(n23) );
  CLKINVXL U139 ( .A(n65), .Y(n91) );
  CLKINVXL U140 ( .A(n70), .Y(n92) );
  NAND2XL U141 ( .A(A[8]), .B(B[8]), .Y(n53) );
  CLKINVXL U142 ( .A(n76), .Y(n93) );
  NAND2XL U143 ( .A(n93), .B(n77), .Y(n11) );
  CLKINVXL U144 ( .A(n82), .Y(n81) );
  CLKINVXL U145 ( .A(n79), .Y(n94) );
  XOR2X1 U146 ( .A(n67), .B(n9), .Y(SUM[7]) );
  AOI21X1 U147 ( .A0(n60), .A1(n90), .B0(n38), .Y(n36) );
  NAND2X1 U148 ( .A(n39), .B(n53), .Y(n38) );
  OAI21XL U149 ( .A0(n62), .A1(n52), .B0(n53), .Y(n51) );
  XOR2X1 U150 ( .A(n58), .B(n8), .Y(SUM[8]) );
  NAND2XL U151 ( .A(n90), .B(n53), .Y(n8) );
  OAI21XL U152 ( .A0(n62), .A1(n52), .B0(n46), .Y(n44) );
  XOR2X1 U153 ( .A(n72), .B(n148), .Y(SUM[6]) );
  AND2X1 U154 ( .A(n92), .B(n71), .Y(n148) );
  INVX2 U155 ( .A(n53), .Y(n55) );
  NOR2X1 U156 ( .A(n23), .B(A[14]), .Y(n16) );
  XNOR2X1 U157 ( .A(n78), .B(n11), .Y(SUM[5]) );
  XOR2X1 U158 ( .A(n34), .B(n150), .Y(SUM[11]) );
  AND2X1 U159 ( .A(n151), .B(n32), .Y(n150) );
  XOR2X1 U160 ( .A(n81), .B(n12), .Y(SUM[4]) );
  NAND2XL U161 ( .A(n94), .B(n80), .Y(n12) );
  OAI21X1 U162 ( .A0(n83), .A1(n1), .B0(n84), .Y(n82) );
  INVX2 U163 ( .A(n85), .Y(n1) );
  NAND2XL U164 ( .A(A[5]), .B(B[5]), .Y(n77) );
  OR2XL U165 ( .A(A[11]), .B(B[11]), .Y(n151) );
  XNOR2X1 U166 ( .A(n13), .B(n85), .Y(SUM[3]) );
  NAND2XL U167 ( .A(n95), .B(n84), .Y(n13) );
  CLKINVXL U168 ( .A(n83), .Y(n95) );
  OR2X1 U169 ( .A(A[0]), .B(B[0]), .Y(n152) );
  XNOR2X1 U170 ( .A(A[0]), .B(B[0]), .Y(SUM[0]) );
  XOR2XL U171 ( .A(n42), .B(A[10]), .Y(SUM[10]) );
  NAND2XL U172 ( .A(A[11]), .B(B[11]), .Y(n32) );
  XOR2XL U173 ( .A(n49), .B(A[9]), .Y(SUM[9]) );
  NAND2XL U174 ( .A(A[3]), .B(B[3]), .Y(n84) );
  NAND2XL U175 ( .A(A[7]), .B(B[7]), .Y(n66) );
  OAI21XL U176 ( .A0(n81), .A1(n79), .B0(n80), .Y(n78) );
  NAND2XL U177 ( .A(A[4]), .B(B[4]), .Y(n80) );
endmodule


module SNN_DW01_add_110 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n1, n5, n7, n8, n9, n11, n12, n13, n14, n15, n16, n19, n20, n22, n23,
         n24, n25, n26, n27, n31, n32, n36, n37, n38, n39, n40, n42, n43, n44,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n59, n60, n61,
         n62, n63, n64, n67, n68, n69, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n95, n98, n99, n100,
         n101, n102, n155, n156, n157;

  AOI21X1 U15 ( .A0(n37), .A1(n24), .B0(n25), .Y(n23) );
  AOI21X1 U52 ( .A0(n49), .A1(n62), .B0(n50), .Y(n48) );
  AOI21X1 U60 ( .A0(n54), .A1(n74), .B0(n55), .Y(n53) );
  AOI21X1 U82 ( .A0(n74), .A1(n99), .B0(n71), .Y(n69) );
  ADDFX2 U112 ( .A(B[2]), .B(A[2]), .CI(n88), .CO(n87), .S(SUM[2]) );
  ADDFX2 U113 ( .A(n157), .B(A[1]), .CI(B[1]), .CO(n88), .S(SUM[1]) );
  NAND2XL U120 ( .A(A[8]), .B(B[8]), .Y(n59) );
  OAI21X1 U121 ( .A0(n78), .A1(n82), .B0(n79), .Y(n77) );
  NOR2X1 U122 ( .A(n72), .B(n67), .Y(n61) );
  NAND2X1 U123 ( .A(n49), .B(n61), .Y(n47) );
  NOR2X1 U124 ( .A(B[6]), .B(A[6]), .Y(n72) );
  NOR2X1 U125 ( .A(A[13]), .B(B[13]), .Y(n26) );
  NOR2X1 U126 ( .A(n63), .B(n56), .Y(n54) );
  NOR2X2 U127 ( .A(A[5]), .B(B[5]), .Y(n78) );
  NOR2X1 U128 ( .A(A[4]), .B(B[4]), .Y(n81) );
  NAND2X2 U129 ( .A(A[6]), .B(B[6]), .Y(n73) );
  OAI21X1 U130 ( .A0(n51), .A1(n59), .B0(n52), .Y(n50) );
  CLKINVX1 U131 ( .A(n73), .Y(n71) );
  NOR2X1 U132 ( .A(n78), .B(n81), .Y(n76) );
  NOR2X1 U133 ( .A(A[9]), .B(B[9]), .Y(n51) );
  NAND2BXL U134 ( .AN(n56), .B(n59), .Y(n8) );
  NAND2XL U135 ( .A(A[10]), .B(B[10]), .Y(n44) );
  NOR2X2 U136 ( .A(n51), .B(n56), .Y(n49) );
  INVX2 U137 ( .A(n14), .Y(CO) );
  AOI21XL U138 ( .A0(n74), .A1(n61), .B0(n62), .Y(n60) );
  NOR2X2 U139 ( .A(A[8]), .B(B[8]), .Y(n56) );
  CLKINVXL U140 ( .A(n81), .Y(n101) );
  CLKINVX2 U141 ( .A(n75), .Y(n74) );
  OAI21X1 U142 ( .A0(n67), .A1(n73), .B0(n68), .Y(n62) );
  AOI21XL U143 ( .A0(n46), .A1(n95), .B0(n42), .Y(n40) );
  AOI21X2 U144 ( .A0(n46), .A1(n15), .B0(n16), .Y(n14) );
  NOR2XL U145 ( .A(A[10]), .B(B[10]), .Y(n43) );
  OAI21X2 U146 ( .A0(n75), .A1(n47), .B0(n48), .Y(n46) );
  AOI21X2 U147 ( .A0(n76), .A1(n84), .B0(n77), .Y(n75) );
  NOR2XL U148 ( .A(A[3]), .B(B[3]), .Y(n85) );
  NAND2XL U149 ( .A(n101), .B(n82), .Y(n12) );
  OAI21XL U150 ( .A0(n83), .A1(n81), .B0(n82), .Y(n80) );
  OAI21XL U151 ( .A0(n26), .A1(n32), .B0(n27), .Y(n25) );
  OAI21X1 U152 ( .A0(n38), .A1(n44), .B0(n39), .Y(n37) );
  OAI21X1 U153 ( .A0(n23), .A1(n19), .B0(n20), .Y(n16) );
  CLKINVXL U154 ( .A(n62), .Y(n64) );
  NAND2XL U155 ( .A(n98), .B(n68), .Y(n9) );
  CLKINVXL U156 ( .A(n43), .Y(n95) );
  CLKINVXL U157 ( .A(n72), .Y(n99) );
  CLKINVXL U158 ( .A(n78), .Y(n100) );
  NAND2XL U159 ( .A(n100), .B(n79), .Y(n11) );
  CLKINVXL U160 ( .A(n84), .Y(n83) );
  XOR2X1 U161 ( .A(n60), .B(n8), .Y(SUM[8]) );
  NOR2X1 U162 ( .A(n31), .B(n26), .Y(n24) );
  NOR2X1 U163 ( .A(A[12]), .B(B[12]), .Y(n31) );
  NAND2BX1 U164 ( .AN(n38), .B(n39), .Y(n5) );
  NAND2BX1 U165 ( .AN(n51), .B(n52), .Y(n7) );
  XOR2X1 U166 ( .A(n40), .B(n5), .Y(SUM[11]) );
  XOR2X1 U167 ( .A(n53), .B(n7), .Y(SUM[9]) );
  NOR2X1 U168 ( .A(n22), .B(n19), .Y(n15) );
  NOR2X1 U169 ( .A(A[11]), .B(B[11]), .Y(n38) );
  NAND2XL U170 ( .A(n36), .B(n24), .Y(n22) );
  NOR2X1 U171 ( .A(n38), .B(n43), .Y(n36) );
  NAND2XL U172 ( .A(A[13]), .B(B[13]), .Y(n27) );
  INVX2 U173 ( .A(n44), .Y(n42) );
  OAI21XL U174 ( .A0(n64), .A1(n56), .B0(n59), .Y(n55) );
  XOR2X1 U175 ( .A(n69), .B(n9), .Y(SUM[7]) );
  CLKINVXL U176 ( .A(n67), .Y(n98) );
  XOR2X1 U177 ( .A(n46), .B(n155), .Y(SUM[10]) );
  AND2X1 U178 ( .A(n95), .B(n44), .Y(n155) );
  CLKINVXL U179 ( .A(n61), .Y(n63) );
  NOR2X1 U180 ( .A(A[14]), .B(B[14]), .Y(n19) );
  XOR2X1 U181 ( .A(n74), .B(n156), .Y(SUM[6]) );
  AND2X1 U182 ( .A(n99), .B(n73), .Y(n156) );
  XNOR2X1 U183 ( .A(n80), .B(n11), .Y(SUM[5]) );
  XOR2X1 U184 ( .A(n83), .B(n12), .Y(SUM[4]) );
  OAI21X1 U185 ( .A0(n85), .A1(n1), .B0(n86), .Y(n84) );
  INVX2 U186 ( .A(n87), .Y(n1) );
  NAND2XL U187 ( .A(A[5]), .B(B[5]), .Y(n79) );
  XNOR2X1 U188 ( .A(n13), .B(n87), .Y(SUM[3]) );
  NAND2XL U189 ( .A(n102), .B(n86), .Y(n13) );
  CLKINVXL U190 ( .A(n85), .Y(n102) );
  XNOR2X1 U191 ( .A(A[0]), .B(B[0]), .Y(SUM[0]) );
  OR2X1 U192 ( .A(A[0]), .B(B[0]), .Y(n157) );
  NAND2XL U193 ( .A(A[11]), .B(B[11]), .Y(n39) );
  NAND2XL U194 ( .A(A[9]), .B(B[9]), .Y(n52) );
  NOR2X2 U195 ( .A(A[7]), .B(B[7]), .Y(n67) );
  NAND2XL U196 ( .A(A[14]), .B(B[14]), .Y(n20) );
  NAND2XL U197 ( .A(A[3]), .B(B[3]), .Y(n86) );
  NAND2XL U198 ( .A(A[12]), .B(B[12]), .Y(n32) );
  NAND2XL U199 ( .A(A[7]), .B(B[7]), .Y(n68) );
  NAND2XL U200 ( .A(A[4]), .B(B[4]), .Y(n82) );
endmodule


module SNN_DW01_add_107 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n1, n7, n8, n9, n11, n12, n13, n16, n17, n18, n21, n25, n26, n27, n28,
         n30, n33, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n50, n51, n52, n53, n55, n58, n59, n60, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n82, n85, n86,
         n87, n88, n140, n141, n143, n145;

  AOI21X1 U47 ( .A0(n45), .A1(n65), .B0(n46), .Y(n44) );
  AOI21X1 U69 ( .A0(n65), .A1(n85), .B0(n62), .Y(n60) );
  ADDFX2 U99 ( .A(A[2]), .B(B[2]), .CI(n143), .CO(n78), .S(SUM[2]) );
  NAND2X1 U106 ( .A(A[5]), .B(B[5]), .Y(n70) );
  AOI21XL U107 ( .A0(n65), .A1(n52), .B0(n53), .Y(n51) );
  OAI21X2 U108 ( .A0(n58), .A1(n64), .B0(n59), .Y(n53) );
  NOR2XL U109 ( .A(n37), .B(A[10]), .Y(n33) );
  OAI21X2 U110 ( .A0(n38), .A1(n66), .B0(n39), .Y(n37) );
  AOI21X1 U111 ( .A0(n67), .A1(n75), .B0(n68), .Y(n66) );
  OAI21X1 U112 ( .A0(n69), .A1(n73), .B0(n70), .Y(n68) );
  OAI21X1 U113 ( .A0(n76), .A1(n1), .B0(n77), .Y(n75) );
  NOR2X1 U114 ( .A(n26), .B(n17), .Y(n16) );
  NAND2X1 U115 ( .A(n21), .B(n18), .Y(n17) );
  INVX1 U116 ( .A(n66), .Y(n65) );
  NAND2X1 U117 ( .A(A[6]), .B(B[6]), .Y(n140) );
  NOR2X2 U118 ( .A(A[5]), .B(B[5]), .Y(n69) );
  AOI21X1 U119 ( .A0(n40), .A1(n53), .B0(n41), .Y(n39) );
  NOR2X1 U120 ( .A(n69), .B(n72), .Y(n67) );
  NAND2BX1 U121 ( .AN(n47), .B(n50), .Y(n8) );
  CLKINVXL U122 ( .A(A[13]), .Y(n21) );
  NOR2BXL U123 ( .AN(n52), .B(n47), .Y(n45) );
  CLKINVXL U124 ( .A(n69), .Y(n86) );
  CLKINVXL U125 ( .A(n63), .Y(n85) );
  NOR2X1 U126 ( .A(A[8]), .B(B[8]), .Y(n47) );
  NAND2XL U127 ( .A(A[7]), .B(B[7]), .Y(n59) );
  CLKINVXL U128 ( .A(A[14]), .Y(n18) );
  NOR2X2 U129 ( .A(A[9]), .B(B[9]), .Y(n42) );
  CLKINVXL U130 ( .A(n76), .Y(n88) );
  NOR2XL U131 ( .A(A[12]), .B(B[12]), .Y(n27) );
  NOR2X1 U132 ( .A(A[11]), .B(A[10]), .Y(n30) );
  XOR2X1 U133 ( .A(n60), .B(n9), .Y(SUM[7]) );
  NOR2X1 U134 ( .A(n58), .B(n63), .Y(n52) );
  CLKINVXL U135 ( .A(n53), .Y(n55) );
  NAND2BX1 U136 ( .AN(n58), .B(n59), .Y(n9) );
  NAND2X1 U137 ( .A(A[6]), .B(B[6]), .Y(n64) );
  NOR2X1 U138 ( .A(n47), .B(n42), .Y(n40) );
  NOR2X1 U139 ( .A(A[6]), .B(B[6]), .Y(n63) );
  NAND2XL U140 ( .A(A[8]), .B(B[8]), .Y(n50) );
  NOR2X1 U141 ( .A(A[7]), .B(B[7]), .Y(n58) );
  XOR2X1 U142 ( .A(n44), .B(n7), .Y(SUM[9]) );
  NAND2XL U143 ( .A(n82), .B(n43), .Y(n7) );
  INVX2 U144 ( .A(n42), .Y(n82) );
  CLKINVXL U145 ( .A(n140), .Y(n62) );
  XOR2X1 U146 ( .A(n65), .B(n141), .Y(SUM[6]) );
  AND2X1 U147 ( .A(n140), .B(n85), .Y(n141) );
  NAND2X1 U148 ( .A(n145), .B(n52), .Y(n38) );
  OAI2BB1X4 U149 ( .A0N(n37), .A1N(n25), .B0(n16), .Y(CO) );
  NAND2X1 U150 ( .A(A[4]), .B(B[4]), .Y(n73) );
  XOR2X1 U151 ( .A(n74), .B(n12), .Y(SUM[4]) );
  NAND2XL U152 ( .A(n87), .B(n73), .Y(n12) );
  XNOR2X1 U153 ( .A(n71), .B(n11), .Y(SUM[5]) );
  NAND2XL U154 ( .A(n86), .B(n70), .Y(n11) );
  NOR2X1 U155 ( .A(A[3]), .B(B[3]), .Y(n76) );
  CLKINVXL U156 ( .A(n75), .Y(n74) );
  INVX2 U157 ( .A(n78), .Y(n1) );
  XNOR2X1 U158 ( .A(n13), .B(n78), .Y(SUM[3]) );
  NAND2XL U159 ( .A(n88), .B(n77), .Y(n13) );
  XNOR2X1 U160 ( .A(A[1]), .B(B[1]), .Y(SUM[1]) );
  BUFX2 U161 ( .A(A[0]), .Y(SUM[0]) );
  OR2X1 U162 ( .A(A[1]), .B(B[1]), .Y(n143) );
  NAND2X1 U163 ( .A(A[3]), .B(B[3]), .Y(n77) );
  XOR2XL U164 ( .A(n36), .B(A[10]), .Y(SUM[10]) );
  CLKINVXL U165 ( .A(n37), .Y(n36) );
  OAI21X1 U166 ( .A0(n42), .A1(n50), .B0(n43), .Y(n41) );
  NOR2XL U167 ( .A(n47), .B(n42), .Y(n145) );
  INVX1 U168 ( .A(n72), .Y(n87) );
  OAI21XL U169 ( .A0(n74), .A1(n72), .B0(n73), .Y(n71) );
  XOR2X1 U170 ( .A(n51), .B(n8), .Y(SUM[8]) );
  NOR2X1 U171 ( .A(A[4]), .B(B[4]), .Y(n72) );
  OAI21XL U172 ( .A0(n30), .A1(n27), .B0(n28), .Y(n26) );
  INVX1 U173 ( .A(n27), .Y(n25) );
  NAND2XL U174 ( .A(A[12]), .B(B[12]), .Y(n28) );
  OAI21XL U175 ( .A0(n55), .A1(n47), .B0(n50), .Y(n46) );
  NAND2XL U176 ( .A(A[9]), .B(B[9]), .Y(n43) );
  XOR2XL U177 ( .A(n33), .B(A[11]), .Y(SUM[11]) );
endmodule


module SNN_DW01_add_98 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n1, n7, n8, n9, n10, n11, n12, n16, n17, n18, n21, n25, n26, n27, n28,
         n30, n33, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n50, n51, n52, n53, n54, n55, n58, n59, n60, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n85, n87,
         n88, n140, n141, n142, n143, n145;

  AOI21X1 U47 ( .A0(n45), .A1(n65), .B0(n46), .Y(n44) );
  NOR2X2 U62 ( .A(n63), .B(n58), .Y(n52) );
  AOI21X1 U69 ( .A0(n65), .A1(n85), .B0(n62), .Y(n60) );
  ADDFX2 U99 ( .A(A[2]), .B(B[2]), .CI(n145), .CO(n78), .S(SUM[2]) );
  NAND2X2 U106 ( .A(n40), .B(n52), .Y(n38) );
  NOR2XL U107 ( .A(n37), .B(A[10]), .Y(n33) );
  OAI21X2 U108 ( .A0(n76), .A1(n1), .B0(n77), .Y(n75) );
  BUFX1 U109 ( .A(n47), .Y(n142) );
  NOR2X2 U110 ( .A(A[8]), .B(B[8]), .Y(n47) );
  NOR2X2 U111 ( .A(A[7]), .B(B[7]), .Y(n58) );
  AOI21X2 U112 ( .A0(n40), .A1(n53), .B0(n41), .Y(n39) );
  OAI21X2 U113 ( .A0(n58), .A1(n64), .B0(n59), .Y(n53) );
  NAND2X1 U114 ( .A(A[6]), .B(B[6]), .Y(n64) );
  NOR2X1 U115 ( .A(n54), .B(n142), .Y(n45) );
  NOR2X1 U116 ( .A(n26), .B(n17), .Y(n16) );
  NAND2X1 U117 ( .A(n18), .B(n21), .Y(n17) );
  CLKINVXL U118 ( .A(n50), .Y(n140) );
  INVX2 U119 ( .A(n140), .Y(n141) );
  CLKINVXL U120 ( .A(n53), .Y(n55) );
  NOR2X1 U121 ( .A(A[9]), .B(B[9]), .Y(n42) );
  NAND2XL U122 ( .A(B[5]), .B(A[5]), .Y(n70) );
  NOR2X1 U123 ( .A(A[6]), .B(B[6]), .Y(n63) );
  NAND2BXL U124 ( .AN(n142), .B(n141), .Y(n8) );
  NOR2XL U125 ( .A(A[11]), .B(A[10]), .Y(n30) );
  AOI21X2 U126 ( .A0(n67), .A1(n75), .B0(n68), .Y(n66) );
  INVXL U127 ( .A(n66), .Y(n65) );
  NAND2X1 U128 ( .A(A[7]), .B(B[7]), .Y(n59) );
  NAND2X1 U129 ( .A(A[4]), .B(B[4]), .Y(n73) );
  NAND2X1 U130 ( .A(A[8]), .B(B[8]), .Y(n50) );
  AOI21XL U131 ( .A0(n65), .A1(n52), .B0(n53), .Y(n51) );
  NOR2X1 U132 ( .A(B[4]), .B(A[4]), .Y(n72) );
  NOR2X2 U133 ( .A(A[5]), .B(B[5]), .Y(n69) );
  OAI21X2 U134 ( .A0(n66), .A1(n38), .B0(n39), .Y(n37) );
  NOR2X2 U135 ( .A(n42), .B(n47), .Y(n40) );
  INVX2 U136 ( .A(A[13]), .Y(n21) );
  CLKINVXL U137 ( .A(n52), .Y(n54) );
  CLKINVXL U138 ( .A(n37), .Y(n36) );
  CLKINVXL U139 ( .A(n64), .Y(n62) );
  NAND2XL U140 ( .A(n85), .B(n64), .Y(n10) );
  CLKINVXL U141 ( .A(n76), .Y(n88) );
  CLKINVXL U142 ( .A(n75), .Y(n74) );
  XOR2X1 U143 ( .A(n143), .B(n78), .Y(SUM[3]) );
  AND2X1 U144 ( .A(n88), .B(n77), .Y(n143) );
  INVX2 U145 ( .A(A[14]), .Y(n18) );
  XNOR2X1 U146 ( .A(n65), .B(n10), .Y(SUM[6]) );
  XOR2X1 U147 ( .A(n60), .B(n9), .Y(SUM[7]) );
  NAND2BX1 U148 ( .AN(n58), .B(n59), .Y(n9) );
  OAI21X1 U149 ( .A0(n42), .A1(n50), .B0(n43), .Y(n41) );
  XOR2X1 U150 ( .A(n44), .B(n7), .Y(SUM[9]) );
  XOR2X1 U151 ( .A(n51), .B(n8), .Y(SUM[8]) );
  NAND2BX1 U152 ( .AN(n42), .B(n43), .Y(n7) );
  CLKINVXL U153 ( .A(n63), .Y(n85) );
  OAI2BB1X4 U154 ( .A0N(n25), .A1N(n37), .B0(n16), .Y(CO) );
  NOR2X1 U155 ( .A(n72), .B(n69), .Y(n67) );
  XOR2X1 U156 ( .A(n74), .B(n12), .Y(SUM[4]) );
  NAND2XL U157 ( .A(n87), .B(n73), .Y(n12) );
  OAI21XL U158 ( .A0(n74), .A1(n72), .B0(n73), .Y(n71) );
  CLKINVXL U159 ( .A(n72), .Y(n87) );
  NAND2BX1 U160 ( .AN(n69), .B(n70), .Y(n11) );
  INVX2 U161 ( .A(n78), .Y(n1) );
  NOR2X1 U162 ( .A(A[3]), .B(B[3]), .Y(n76) );
  XNOR2X1 U163 ( .A(n71), .B(n11), .Y(SUM[5]) );
  XNOR2X1 U164 ( .A(A[1]), .B(B[1]), .Y(SUM[1]) );
  OR2X1 U165 ( .A(A[1]), .B(B[1]), .Y(n145) );
  BUFX2 U166 ( .A(A[0]), .Y(SUM[0]) );
  OAI21X1 U167 ( .A0(n69), .A1(n73), .B0(n70), .Y(n68) );
  INVXL U168 ( .A(n27), .Y(n25) );
  OAI21XL U169 ( .A0(n30), .A1(n27), .B0(n28), .Y(n26) );
  XOR2XL U170 ( .A(n36), .B(A[10]), .Y(SUM[10]) );
  XOR2X1 U171 ( .A(n33), .B(A[11]), .Y(SUM[11]) );
  OAI21XL U172 ( .A0(n55), .A1(n142), .B0(n141), .Y(n46) );
  NAND2XL U173 ( .A(A[9]), .B(B[9]), .Y(n43) );
  NAND2XL U174 ( .A(A[3]), .B(B[3]), .Y(n77) );
  NAND2XL U175 ( .A(A[12]), .B(B[12]), .Y(n28) );
  NOR2XL U176 ( .A(A[12]), .B(B[12]), .Y(n27) );
endmodule


module SNN_DW01_add_117 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n1, n5, n7, n8, n9, n11, n12, n13, n14, n15, n16, n19, n20, n22, n23,
         n24, n25, n26, n27, n31, n32, n36, n37, n38, n39, n40, n42, n43, n44,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n59, n60, n61,
         n62, n63, n64, n67, n68, n69, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n94, n95, n97, n98,
         n99, n100, n101, n102, n155, n156, n157;

  AOI21X1 U15 ( .A0(n37), .A1(n24), .B0(n25), .Y(n23) );
  AOI21X1 U60 ( .A0(n54), .A1(n74), .B0(n55), .Y(n53) );
  AOI21X1 U70 ( .A0(n74), .A1(n61), .B0(n62), .Y(n60) );
  AOI21X1 U82 ( .A0(n74), .A1(n99), .B0(n71), .Y(n69) );
  ADDFX2 U113 ( .A(n157), .B(A[1]), .CI(B[1]), .CO(n88), .S(SUM[1]) );
  ADDFXL U120 ( .A(B[2]), .B(A[2]), .CI(n88), .CO(n87), .S(SUM[2]) );
  AOI21X1 U121 ( .A0(n84), .A1(n76), .B0(n77), .Y(n75) );
  OAI21X1 U122 ( .A0(n47), .A1(n75), .B0(n48), .Y(n46) );
  NOR2X1 U123 ( .A(A[5]), .B(B[5]), .Y(n78) );
  NOR2X1 U124 ( .A(A[4]), .B(B[4]), .Y(n81) );
  NOR2X1 U125 ( .A(A[8]), .B(B[8]), .Y(n56) );
  NOR2X1 U126 ( .A(n22), .B(n19), .Y(n15) );
  NOR2XL U127 ( .A(A[14]), .B(B[14]), .Y(n19) );
  OAI21X1 U128 ( .A0(n67), .A1(n73), .B0(n68), .Y(n62) );
  CLKINVXL U129 ( .A(n61), .Y(n63) );
  NAND2BX1 U130 ( .AN(n51), .B(n52), .Y(n7) );
  NAND2XL U131 ( .A(n97), .B(n59), .Y(n8) );
  CLKINVXL U132 ( .A(n72), .Y(n99) );
  CLKINVXL U133 ( .A(n43), .Y(n95) );
  AOI21X1 U134 ( .A0(n46), .A1(n15), .B0(n16), .Y(n14) );
  INVX1 U135 ( .A(n14), .Y(CO) );
  NAND2XL U136 ( .A(A[6]), .B(B[6]), .Y(n73) );
  NAND2XL U137 ( .A(A[10]), .B(B[10]), .Y(n44) );
  NAND2XL U138 ( .A(n101), .B(n82), .Y(n12) );
  CLKINVXL U139 ( .A(n84), .Y(n83) );
  NOR2X1 U140 ( .A(A[12]), .B(B[12]), .Y(n31) );
  INVX2 U141 ( .A(n56), .Y(n97) );
  XOR2X1 U142 ( .A(n53), .B(n7), .Y(SUM[9]) );
  OAI21XL U143 ( .A0(n38), .A1(n44), .B0(n39), .Y(n37) );
  NOR2X1 U144 ( .A(A[11]), .B(B[11]), .Y(n38) );
  NOR2X1 U145 ( .A(n67), .B(n72), .Y(n61) );
  NAND2XL U146 ( .A(n36), .B(n24), .Y(n22) );
  NOR2X1 U147 ( .A(n43), .B(n38), .Y(n36) );
  NOR2X1 U148 ( .A(A[9]), .B(B[9]), .Y(n51) );
  INVX2 U149 ( .A(n44), .Y(n42) );
  INVX2 U150 ( .A(n73), .Y(n71) );
  OAI21X1 U151 ( .A0(n23), .A1(n19), .B0(n20), .Y(n16) );
  NAND2XL U152 ( .A(A[14]), .B(B[14]), .Y(n20) );
  NOR2X1 U153 ( .A(A[7]), .B(B[7]), .Y(n67) );
  NOR2X1 U154 ( .A(A[6]), .B(B[6]), .Y(n72) );
  XOR2X1 U155 ( .A(n40), .B(n5), .Y(SUM[11]) );
  NAND2XL U156 ( .A(n94), .B(n39), .Y(n5) );
  CLKINVXL U157 ( .A(n38), .Y(n94) );
  NAND2XL U158 ( .A(A[7]), .B(B[7]), .Y(n68) );
  NOR2X1 U159 ( .A(A[10]), .B(B[10]), .Y(n43) );
  XOR2X1 U160 ( .A(n46), .B(n155), .Y(SUM[10]) );
  AND2X1 U161 ( .A(n95), .B(n44), .Y(n155) );
  XOR2X1 U162 ( .A(n69), .B(n9), .Y(SUM[7]) );
  NAND2XL U163 ( .A(n98), .B(n68), .Y(n9) );
  CLKINVXL U164 ( .A(n67), .Y(n98) );
  NOR2X1 U165 ( .A(n63), .B(n56), .Y(n54) );
  CLKINVXL U166 ( .A(n62), .Y(n64) );
  XOR2X1 U167 ( .A(n74), .B(n156), .Y(SUM[6]) );
  AND2X1 U168 ( .A(n99), .B(n73), .Y(n156) );
  NAND2XL U169 ( .A(A[4]), .B(B[4]), .Y(n82) );
  CLKINVXL U170 ( .A(n75), .Y(n74) );
  XNOR2X1 U171 ( .A(n80), .B(n11), .Y(SUM[5]) );
  NAND2X1 U172 ( .A(n100), .B(n79), .Y(n11) );
  OAI21XL U173 ( .A0(n83), .A1(n81), .B0(n82), .Y(n80) );
  CLKINVXL U174 ( .A(n78), .Y(n100) );
  XOR2X1 U175 ( .A(n83), .B(n12), .Y(SUM[4]) );
  CLKINVXL U176 ( .A(n81), .Y(n101) );
  NOR2X1 U177 ( .A(A[3]), .B(B[3]), .Y(n85) );
  OAI21X1 U178 ( .A0(n78), .A1(n82), .B0(n79), .Y(n77) );
  OAI21X1 U179 ( .A0(n85), .A1(n1), .B0(n86), .Y(n84) );
  INVX2 U180 ( .A(n87), .Y(n1) );
  XNOR2X1 U181 ( .A(n13), .B(n87), .Y(SUM[3]) );
  NAND2XL U182 ( .A(n102), .B(n86), .Y(n13) );
  CLKINVXL U183 ( .A(n85), .Y(n102) );
  OR2X1 U184 ( .A(A[0]), .B(B[0]), .Y(n157) );
  XNOR2X1 U185 ( .A(A[0]), .B(B[0]), .Y(SUM[0]) );
  OAI21XL U186 ( .A0(n51), .A1(n59), .B0(n52), .Y(n50) );
  XOR2X1 U187 ( .A(n60), .B(n8), .Y(SUM[8]) );
  NAND2X1 U188 ( .A(n61), .B(n49), .Y(n47) );
  AOI21X1 U189 ( .A0(n49), .A1(n62), .B0(n50), .Y(n48) );
  OAI21XL U190 ( .A0(n64), .A1(n56), .B0(n59), .Y(n55) );
  NOR2X1 U191 ( .A(n31), .B(n26), .Y(n24) );
  OAI21XL U192 ( .A0(n26), .A1(n32), .B0(n27), .Y(n25) );
  NOR2X1 U193 ( .A(A[13]), .B(B[13]), .Y(n26) );
  NAND2XL U194 ( .A(A[12]), .B(B[12]), .Y(n32) );
  AOI21XL U195 ( .A0(n46), .A1(n95), .B0(n42), .Y(n40) );
  NOR2X1 U196 ( .A(n56), .B(n51), .Y(n49) );
  NOR2X1 U197 ( .A(n78), .B(n81), .Y(n76) );
  NAND2XL U198 ( .A(A[5]), .B(B[5]), .Y(n79) );
  NAND2XL U199 ( .A(A[3]), .B(B[3]), .Y(n86) );
  NAND2XL U200 ( .A(A[13]), .B(B[13]), .Y(n27) );
  NAND2XL U201 ( .A(A[9]), .B(B[9]), .Y(n52) );
  NAND2XL U202 ( .A(A[11]), .B(B[11]), .Y(n39) );
  NAND2XL U203 ( .A(A[8]), .B(B[8]), .Y(n59) );
endmodule


module SNN_DW01_add_103 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n11, n12, n13, n14, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n54, n55, n105, n106, n107,
         n108;

  AOI21X1 U6 ( .A0(n29), .A1(n13), .B0(n14), .Y(n12) );
  ADDFX2 U61 ( .A(A[2]), .B(B[2]), .CI(n47), .CO(n46), .S(SUM[2]) );
  ADDFX2 U62 ( .A(A[1]), .B(B[1]), .CI(n105), .CO(n47), .S(SUM[1]) );
  NOR2X1 U70 ( .A(A[5]), .B(B[5]), .Y(n37) );
  OAI21X1 U71 ( .A0(n44), .A1(n2), .B0(n45), .Y(n43) );
  NOR2X1 U72 ( .A(A[7]), .B(B[7]), .Y(n30) );
  AOI21X1 U73 ( .A0(n35), .A1(n43), .B0(n36), .Y(n1) );
  NOR2X1 U74 ( .A(n40), .B(n37), .Y(n35) );
  OAI21X1 U75 ( .A0(n37), .A1(n41), .B0(n38), .Y(n36) );
  NOR2XL U76 ( .A(A[3]), .B(B[3]), .Y(n44) );
  OAI21XL U77 ( .A0(n1), .A1(n33), .B0(n34), .Y(n32) );
  NAND2BX1 U78 ( .AN(n37), .B(n38), .Y(n6) );
  CLKINVX2 U79 ( .A(n107), .Y(n106) );
  NAND2BXL U80 ( .AN(n33), .B(n34), .Y(n5) );
  NAND2BX1 U81 ( .AN(n30), .B(n31), .Y(n4) );
  CLKINVXL U82 ( .A(n28), .Y(n26) );
  CLKINVX2 U83 ( .A(n46), .Y(n2) );
  OR2XL U84 ( .A(A[0]), .B(n106), .Y(n105) );
  XNOR2X1 U85 ( .A(n39), .B(n6), .Y(SUM[5]) );
  OAI21X1 U86 ( .A0(n30), .A1(n34), .B0(n31), .Y(n29) );
  NOR2X1 U87 ( .A(n33), .B(n30), .Y(n28) );
  XNOR2X1 U88 ( .A(n25), .B(n3), .Y(SUM[8]) );
  XOR2X1 U89 ( .A(n1), .B(n5), .Y(SUM[6]) );
  NOR2X1 U90 ( .A(A[4]), .B(B[4]), .Y(n40) );
  NOR2X1 U91 ( .A(A[6]), .B(B[6]), .Y(n33) );
  NAND2XL U92 ( .A(A[6]), .B(B[6]), .Y(n34) );
  XOR2X1 U93 ( .A(n42), .B(n7), .Y(SUM[4]) );
  CLKINVXL U94 ( .A(n40), .Y(n54) );
  OAI21XL U95 ( .A0(n1), .A1(n26), .B0(n27), .Y(n25) );
  CLKINVXL U96 ( .A(n29), .Y(n27) );
  NAND2BX1 U97 ( .AN(n23), .B(n24), .Y(n3) );
  NAND2X1 U98 ( .A(n28), .B(n13), .Y(n11) );
  NOR2X1 U99 ( .A(n23), .B(n108), .Y(n13) );
  INVX2 U100 ( .A(n43), .Y(n42) );
  NOR2X1 U101 ( .A(A[8]), .B(B[8]), .Y(n23) );
  NAND2XL U102 ( .A(A[5]), .B(B[5]), .Y(n38) );
  NAND2XL U103 ( .A(A[8]), .B(B[8]), .Y(n24) );
  NOR2X1 U104 ( .A(n24), .B(n108), .Y(n14) );
  XNOR2X1 U105 ( .A(n8), .B(n46), .Y(SUM[3]) );
  CLKINVXL U106 ( .A(n44), .Y(n55) );
  CLKINVXL U107 ( .A(B[11]), .Y(n108) );
  XNOR2X1 U108 ( .A(A[0]), .B(n106), .Y(SUM[0]) );
  CLKINVXL U109 ( .A(B[0]), .Y(n107) );
  XNOR2X1 U110 ( .A(n32), .B(n4), .Y(SUM[7]) );
  NAND2XL U111 ( .A(n55), .B(n45), .Y(n8) );
  NAND2X1 U112 ( .A(n54), .B(n41), .Y(n7) );
  OAI21X1 U113 ( .A0(n42), .A1(n40), .B0(n41), .Y(n39) );
  OAI21XL U114 ( .A0(n1), .A1(n11), .B0(n12), .Y(CO) );
  NAND2XL U115 ( .A(A[4]), .B(B[4]), .Y(n41) );
  NAND2XL U116 ( .A(A[7]), .B(B[7]), .Y(n31) );
  NAND2XL U117 ( .A(A[3]), .B(B[3]), .Y(n45) );
endmodule


module SNN_DW01_add_101 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n18, n19, n20, n21, n22, n26, n27, n31, n32, n33, n34, n45, n46, n48,
         n49, n50, n51, n52, n53, n54, n56, n57, n59, n60, n61, n62, n66, n67,
         n69, n70, n71, n72, n73, n75, n76, n78, n80, n81, n82, n149, n150,
         n151, n152, n153, n155, n156;

  AOI21X1 U7 ( .A0(n19), .A1(n32), .B0(n20), .Y(n18) );
  AOI21X1 U29 ( .A0(n153), .A1(n152), .B0(n150), .Y(n34) );
  AOI21X1 U54 ( .A0(n60), .A1(n51), .B0(n52), .Y(n50) );
  AOI21X1 U85 ( .A0(n78), .A1(n70), .B0(n71), .Y(n69) );
  ADDFX2 U106 ( .A(B[2]), .B(A[2]), .CI(n82), .CO(n81) );
  NOR2X1 U114 ( .A(A[4]), .B(B[4]), .Y(n75) );
  NOR2X1 U115 ( .A(A[5]), .B(B[5]), .Y(n72) );
  NOR2X1 U116 ( .A(A[6]), .B(B[6]), .Y(n66) );
  AND2X1 U117 ( .A(n19), .B(n31), .Y(n149) );
  AND2X1 U118 ( .A(A[12]), .B(B[12]), .Y(n150) );
  NOR2X1 U119 ( .A(A[13]), .B(B[13]), .Y(n26) );
  NOR2XL U120 ( .A(A[8]), .B(B[8]), .Y(n56) );
  NOR2XL U121 ( .A(A[9]), .B(B[9]), .Y(n53) );
  NOR2XL U122 ( .A(A[7]), .B(B[7]), .Y(n61) );
  OR2X1 U123 ( .A(A[12]), .B(B[12]), .Y(n153) );
  NAND2XL U124 ( .A(A[8]), .B(B[8]), .Y(n57) );
  NAND2X1 U125 ( .A(n151), .B(n153), .Y(n33) );
  OR2XL U126 ( .A(A[11]), .B(B[11]), .Y(n151) );
  OAI21XL U127 ( .A0(n53), .A1(n57), .B0(n54), .Y(n52) );
  AND2X1 U128 ( .A(A[11]), .B(B[11]), .Y(n152) );
  OAI21XL U129 ( .A0(n21), .A1(n27), .B0(n22), .Y(n20) );
  OAI2BB1XL U130 ( .A0N(n48), .A1N(n149), .B0(n18), .Y(CO) );
  NAND2X1 U131 ( .A(n59), .B(n51), .Y(n49) );
  OAI21XL U132 ( .A0(n72), .A1(n76), .B0(n73), .Y(n71) );
  OR2XL U133 ( .A(A[3]), .B(B[3]), .Y(n155) );
  OAI2BB1XL U134 ( .A0N(n155), .A1N(n81), .B0(n80), .Y(n78) );
  ADDFX1 U135 ( .A(n156), .B(A[1]), .CI(B[1]), .CO(n82) );
  NOR2X1 U136 ( .A(n56), .B(n53), .Y(n51) );
  NOR2X1 U137 ( .A(n21), .B(n26), .Y(n19) );
  NOR2X1 U138 ( .A(A[14]), .B(B[14]), .Y(n21) );
  OAI21XL U139 ( .A0(n61), .A1(n67), .B0(n62), .Y(n60) );
  NAND2XL U140 ( .A(A[7]), .B(B[7]), .Y(n62) );
  NOR2X1 U141 ( .A(n33), .B(n45), .Y(n31) );
  NOR2X1 U142 ( .A(A[10]), .B(B[10]), .Y(n45) );
  NOR2X1 U143 ( .A(n61), .B(n66), .Y(n59) );
  NOR2X1 U144 ( .A(n75), .B(n72), .Y(n70) );
  NAND2XL U145 ( .A(A[5]), .B(B[5]), .Y(n73) );
  NAND2XL U146 ( .A(A[4]), .B(B[4]), .Y(n76) );
  OR2X1 U147 ( .A(A[0]), .B(B[0]), .Y(n156) );
  NAND2XL U148 ( .A(A[6]), .B(B[6]), .Y(n67) );
  NAND2XL U149 ( .A(A[10]), .B(B[10]), .Y(n46) );
  NAND2XL U150 ( .A(A[3]), .B(B[3]), .Y(n80) );
  NAND2XL U151 ( .A(A[9]), .B(B[9]), .Y(n54) );
  OAI21X1 U152 ( .A0(n69), .A1(n49), .B0(n50), .Y(n48) );
  OAI21X1 U153 ( .A0(n33), .A1(n46), .B0(n34), .Y(n32) );
  NAND2XL U154 ( .A(A[14]), .B(B[14]), .Y(n22) );
  NAND2XL U155 ( .A(A[13]), .B(B[13]), .Y(n27) );
endmodule


module SNN_DW01_add_99 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n1, n14, n16, n18, n19, n20, n21, n22, n26, n27, n31, n32, n33, n34,
         n45, n46, n48, n49, n50, n52, n54, n57, n59, n60, n61, n62, n66, n67,
         n69, n70, n71, n72, n73, n75, n76, n78, n79, n80, n81, n82, n149,
         n150, n151, n152, n153, n154, n155;

  AOI21X1 U3 ( .A0(n48), .A1(n149), .B0(n16), .Y(n14) );
  AOI21X1 U7 ( .A0(n19), .A1(n32), .B0(n20), .Y(n18) );
  AOI21X1 U29 ( .A0(n155), .A1(n152), .B0(n150), .Y(n34) );
  AOI21X1 U54 ( .A0(n60), .A1(n154), .B0(n52), .Y(n50) );
  AOI21X1 U85 ( .A0(n78), .A1(n70), .B0(n71), .Y(n69) );
  ADDFX2 U106 ( .A(B[2]), .B(A[2]), .CI(n82), .CO(n81) );
  ADDFX2 U107 ( .A(A[1]), .B(B[1]), .CI(n151), .CO(n82) );
  NOR2XL U114 ( .A(A[7]), .B(B[7]), .Y(n61) );
  NOR2X1 U115 ( .A(A[3]), .B(B[3]), .Y(n79) );
  NOR2X1 U116 ( .A(A[13]), .B(B[13]), .Y(n26) );
  AND2X1 U117 ( .A(n19), .B(n31), .Y(n149) );
  AND2X1 U118 ( .A(A[12]), .B(B[12]), .Y(n150) );
  OR2X1 U119 ( .A(A[0]), .B(B[0]), .Y(n151) );
  OR2X1 U120 ( .A(A[12]), .B(B[12]), .Y(n155) );
  CLKINVXL U121 ( .A(A[9]), .Y(n54) );
  NAND2XL U122 ( .A(n59), .B(n154), .Y(n49) );
  NAND2XL U123 ( .A(A[7]), .B(B[7]), .Y(n62) );
  OAI21XL U124 ( .A0(n61), .A1(n67), .B0(n62), .Y(n60) );
  NAND2XL U125 ( .A(A[8]), .B(B[8]), .Y(n57) );
  OAI21XL U126 ( .A0(n33), .A1(n46), .B0(n34), .Y(n32) );
  OAI21XL U127 ( .A0(n21), .A1(n27), .B0(n22), .Y(n20) );
  INVX1 U128 ( .A(n14), .Y(CO) );
  AND2X1 U129 ( .A(A[11]), .B(B[11]), .Y(n152) );
  NAND2XL U130 ( .A(n153), .B(n155), .Y(n33) );
  OR2XL U131 ( .A(A[11]), .B(B[11]), .Y(n153) );
  OAI21XL U132 ( .A0(n72), .A1(n76), .B0(n73), .Y(n71) );
  NAND2X1 U133 ( .A(n57), .B(n54), .Y(n52) );
  OR2X1 U134 ( .A(A[8]), .B(B[8]), .Y(n154) );
  NOR2X1 U135 ( .A(A[14]), .B(B[14]), .Y(n21) );
  NOR2X1 U136 ( .A(n33), .B(n45), .Y(n31) );
  NOR2X1 U137 ( .A(A[10]), .B(B[10]), .Y(n45) );
  NOR2X1 U138 ( .A(n61), .B(n66), .Y(n59) );
  NOR2X1 U139 ( .A(A[6]), .B(B[6]), .Y(n66) );
  NOR2X1 U140 ( .A(n21), .B(n26), .Y(n19) );
  INVX1 U141 ( .A(n18), .Y(n16) );
  OAI21XL U142 ( .A0(n69), .A1(n49), .B0(n50), .Y(n48) );
  NOR2X1 U143 ( .A(A[4]), .B(B[4]), .Y(n75) );
  NOR2X1 U144 ( .A(A[5]), .B(B[5]), .Y(n72) );
  NAND2XL U145 ( .A(A[4]), .B(B[4]), .Y(n76) );
  NAND2XL U146 ( .A(A[5]), .B(B[5]), .Y(n73) );
  NOR2X1 U147 ( .A(n75), .B(n72), .Y(n70) );
  OAI21XL U148 ( .A0(n79), .A1(n1), .B0(n80), .Y(n78) );
  INVX2 U149 ( .A(n81), .Y(n1) );
  NAND2XL U150 ( .A(A[6]), .B(B[6]), .Y(n67) );
  NAND2XL U151 ( .A(A[10]), .B(B[10]), .Y(n46) );
  NAND2XL U152 ( .A(A[3]), .B(B[3]), .Y(n80) );
  NAND2XL U153 ( .A(A[14]), .B(B[14]), .Y(n22) );
  NAND2XL U154 ( .A(A[13]), .B(B[13]), .Y(n27) );
endmodule


module SNN_DW01_add_100 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n1, n14, n16, n18, n19, n20, n21, n22, n26, n27, n31, n32, n33, n34,
         n45, n46, n48, n49, n50, n51, n52, n53, n54, n56, n57, n59, n60, n61,
         n62, n66, n67, n69, n70, n71, n72, n73, n75, n76, n78, n79, n80, n81,
         n82, n149, n150, n151, n152, n153, n154;

  AOI21X1 U29 ( .A0(n154), .A1(n151), .B0(n149), .Y(n34) );
  AOI21X1 U85 ( .A0(n78), .A1(n70), .B0(n71), .Y(n69) );
  ADDFX2 U106 ( .A(B[2]), .B(A[2]), .CI(n82), .CO(n81) );
  NOR2XL U114 ( .A(A[7]), .B(B[7]), .Y(n61) );
  NOR2X1 U115 ( .A(A[4]), .B(B[4]), .Y(n75) );
  NOR2X1 U116 ( .A(A[5]), .B(B[5]), .Y(n72) );
  NOR2X1 U117 ( .A(A[3]), .B(B[3]), .Y(n79) );
  NOR2X1 U118 ( .A(A[13]), .B(B[13]), .Y(n26) );
  NOR2X1 U119 ( .A(n33), .B(n45), .Y(n31) );
  NOR2X1 U120 ( .A(A[6]), .B(B[6]), .Y(n66) );
  AND2X1 U121 ( .A(A[12]), .B(B[12]), .Y(n149) );
  AND2X1 U122 ( .A(n19), .B(n31), .Y(n150) );
  AND2X1 U123 ( .A(A[11]), .B(B[11]), .Y(n151) );
  OR2X1 U124 ( .A(A[0]), .B(B[0]), .Y(n152) );
  NOR2XL U125 ( .A(A[9]), .B(B[9]), .Y(n53) );
  NOR2XL U126 ( .A(A[10]), .B(B[10]), .Y(n45) );
  OR2X1 U127 ( .A(A[12]), .B(B[12]), .Y(n154) );
  NAND2XL U128 ( .A(A[7]), .B(B[7]), .Y(n62) );
  NAND2XL U129 ( .A(n59), .B(n51), .Y(n49) );
  OAI21XL U130 ( .A0(n53), .A1(n57), .B0(n54), .Y(n52) );
  OAI21XL U131 ( .A0(n61), .A1(n67), .B0(n62), .Y(n60) );
  OAI21XL U132 ( .A0(n33), .A1(n46), .B0(n34), .Y(n32) );
  OAI21XL U133 ( .A0(n21), .A1(n27), .B0(n22), .Y(n20) );
  NAND2XL U134 ( .A(n153), .B(n154), .Y(n33) );
  OR2XL U135 ( .A(A[11]), .B(B[11]), .Y(n153) );
  OAI21XL U136 ( .A0(n72), .A1(n76), .B0(n73), .Y(n71) );
  NOR2X1 U137 ( .A(A[14]), .B(B[14]), .Y(n21) );
  NOR2X1 U138 ( .A(n56), .B(n53), .Y(n51) );
  NOR2X1 U139 ( .A(A[8]), .B(B[8]), .Y(n56) );
  AOI21X1 U140 ( .A0(n60), .A1(n51), .B0(n52), .Y(n50) );
  NAND2XL U141 ( .A(A[8]), .B(B[8]), .Y(n57) );
  NOR2X1 U142 ( .A(n61), .B(n66), .Y(n59) );
  INVX1 U143 ( .A(n14), .Y(CO) );
  AOI21X1 U144 ( .A0(n48), .A1(n150), .B0(n16), .Y(n14) );
  OAI21XL U145 ( .A0(n69), .A1(n49), .B0(n50), .Y(n48) );
  NAND2XL U146 ( .A(A[4]), .B(B[4]), .Y(n76) );
  NAND2XL U147 ( .A(A[5]), .B(B[5]), .Y(n73) );
  NOR2X1 U148 ( .A(n75), .B(n72), .Y(n70) );
  OAI21XL U149 ( .A0(n79), .A1(n1), .B0(n80), .Y(n78) );
  INVX2 U150 ( .A(n81), .Y(n1) );
  ADDFX2 U151 ( .A(n152), .B(A[1]), .CI(B[1]), .CO(n82) );
  NAND2XL U152 ( .A(A[6]), .B(B[6]), .Y(n67) );
  NAND2XL U153 ( .A(A[3]), .B(B[3]), .Y(n80) );
  AOI21XL U154 ( .A0(n19), .A1(n32), .B0(n20), .Y(n18) );
  NAND2XL U155 ( .A(A[10]), .B(B[10]), .Y(n46) );
  INVX1 U156 ( .A(n18), .Y(n16) );
  NOR2X1 U157 ( .A(n21), .B(n26), .Y(n19) );
  NAND2XL U158 ( .A(A[9]), .B(B[9]), .Y(n54) );
  NAND2XL U159 ( .A(A[14]), .B(B[14]), .Y(n22) );
  NAND2XL U160 ( .A(A[13]), .B(B[13]), .Y(n27) );
endmodule


module SNN_DW01_add_78 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n14, n16, n17, n19, n20, n25, n30, n31, n39, n41, n42, n43, n44, n45,
         n46, n47, n49, n50, n52, n53, n54, n55, n59, n60, n62, n63, n64, n65,
         n66, n68, n69, n71, n72, n73, n74, n134, n135, n137;

  AOI21X1 U45 ( .A0(n53), .A1(n44), .B0(n45), .Y(n43) );
  AOI21X1 U76 ( .A0(n63), .A1(n71), .B0(n64), .Y(n62) );
  NAND2X1 U101 ( .A(B[8]), .B(A[8]), .Y(n50) );
  NOR2X4 U102 ( .A(A[9]), .B(B[9]), .Y(n46) );
  NOR2X2 U103 ( .A(A[8]), .B(B[8]), .Y(n49) );
  NOR2X2 U104 ( .A(n49), .B(n46), .Y(n44) );
  AOI21X1 U105 ( .A0(n137), .A1(n30), .B0(n19), .Y(n17) );
  INVX2 U106 ( .A(B[13]), .Y(n134) );
  NOR2X1 U107 ( .A(A[11]), .B(A[12]), .Y(n31) );
  NAND2BX4 U108 ( .AN(A[13]), .B(n134), .Y(n137) );
  NAND2X1 U109 ( .A(A[6]), .B(B[6]), .Y(n60) );
  NAND2X1 U110 ( .A(A[3]), .B(B[3]), .Y(n73) );
  NAND2X1 U111 ( .A(A[5]), .B(B[5]), .Y(n66) );
  NOR2XL U112 ( .A(A[6]), .B(B[6]), .Y(n59) );
  NOR2X1 U113 ( .A(n59), .B(n54), .Y(n52) );
  OAI21X2 U114 ( .A0(n69), .A1(n65), .B0(n66), .Y(n64) );
  INVX1 U115 ( .A(n16), .Y(n14) );
  NAND2XL U116 ( .A(n52), .B(n44), .Y(n42) );
  NAND2X2 U117 ( .A(A[4]), .B(B[4]), .Y(n69) );
  NOR2X4 U118 ( .A(A[5]), .B(B[5]), .Y(n65) );
  NOR2X2 U119 ( .A(A[7]), .B(B[7]), .Y(n54) );
  OAI21XL U120 ( .A0(n46), .A1(n50), .B0(n47), .Y(n45) );
  NAND2XL U121 ( .A(B[9]), .B(A[9]), .Y(n47) );
  NOR2X1 U122 ( .A(A[3]), .B(B[3]), .Y(n72) );
  NOR2X2 U123 ( .A(A[4]), .B(B[4]), .Y(n68) );
  OAI2BB1X4 U124 ( .A0N(n41), .A1N(n14), .B0(n17), .Y(CO) );
  OR2XL U125 ( .A(A[10]), .B(B[10]), .Y(n135) );
  CLKINVX2 U126 ( .A(A[14]), .Y(n20) );
  NAND2X1 U127 ( .A(n135), .B(n137), .Y(n16) );
  NAND2XL U128 ( .A(B[7]), .B(A[7]), .Y(n55) );
  NAND2X1 U129 ( .A(n20), .B(n25), .Y(n19) );
  NOR2X1 U130 ( .A(A[2]), .B(B[2]), .Y(n74) );
  OAI21X1 U131 ( .A0(n62), .A1(n42), .B0(n43), .Y(n41) );
  NAND2X1 U132 ( .A(A[10]), .B(B[10]), .Y(n39) );
  OAI21X1 U133 ( .A0(n72), .A1(n74), .B0(n73), .Y(n71) );
  NOR2X1 U134 ( .A(n68), .B(n65), .Y(n63) );
  NAND2X1 U135 ( .A(n39), .B(n31), .Y(n30) );
  OAI21X1 U136 ( .A0(n60), .A1(n54), .B0(n55), .Y(n53) );
  NAND2XL U137 ( .A(A[13]), .B(B[13]), .Y(n25) );
endmodule


module SNN_DW01_add_80 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n5, n6, n7, n8, n10, n11, n12, n13, n30, n31, n38, n40, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n57, n58, n59, n60,
         n61, n62, n65, n66, n67, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n89, n91, n92, n93, n145,
         n146, n147, n148, n149, n150, n151, n154, n155, n156, n157, n158;

  AOI21X1 U56 ( .A0(n52), .A1(n72), .B0(n53), .Y(n51) );
  AOI21X1 U78 ( .A0(n72), .A1(n91), .B0(n69), .Y(n67) );
  NOR2X2 U83 ( .A(A[6]), .B(B[6]), .Y(n70) );
  NOR2X2 U112 ( .A(n83), .B(n85), .Y(n145) );
  INVX2 U113 ( .A(n84), .Y(n146) );
  OR2X4 U114 ( .A(n145), .B(n146), .Y(n82) );
  AOI21X4 U115 ( .A0(n82), .A1(n74), .B0(n75), .Y(n73) );
  NOR2X4 U116 ( .A(n54), .B(n49), .Y(n47) );
  CLKINVXL U117 ( .A(n70), .Y(n91) );
  NOR2X2 U118 ( .A(A[4]), .B(B[4]), .Y(n79) );
  NAND2XL U119 ( .A(n89), .B(n57), .Y(n7) );
  OAI21X2 U120 ( .A0(n49), .A1(n57), .B0(n50), .Y(n48) );
  NOR2X2 U121 ( .A(A[5]), .B(B[5]), .Y(n76) );
  NOR2X1 U122 ( .A(A[8]), .B(B[8]), .Y(n54) );
  NOR2X1 U123 ( .A(A[9]), .B(B[9]), .Y(n49) );
  AND2X2 U124 ( .A(n150), .B(n158), .Y(n147) );
  OAI21X4 U125 ( .A0(n65), .A1(n71), .B0(n66), .Y(n60) );
  INVX1 U126 ( .A(n73), .Y(n72) );
  BUFX1 U127 ( .A(n44), .Y(n148) );
  NAND2X4 U128 ( .A(A[6]), .B(B[6]), .Y(n71) );
  OAI21X2 U129 ( .A0(n76), .A1(n80), .B0(n77), .Y(n75) );
  NAND2X2 U130 ( .A(A[4]), .B(B[4]), .Y(n80) );
  NAND2X1 U131 ( .A(A[7]), .B(B[7]), .Y(n66) );
  OR2X1 U132 ( .A(A[13]), .B(B[13]), .Y(n150) );
  NAND2X1 U133 ( .A(A[10]), .B(B[10]), .Y(n42) );
  NOR2X2 U134 ( .A(A[7]), .B(B[7]), .Y(n65) );
  NAND2XL U135 ( .A(A[5]), .B(B[5]), .Y(n77) );
  CLKINVXL U136 ( .A(n79), .Y(n93) );
  CLKINVXL U137 ( .A(B[10]), .Y(n154) );
  CLKINVXL U138 ( .A(n59), .Y(n61) );
  NAND2XL U139 ( .A(n31), .B(n42), .Y(n30) );
  XOR2X1 U140 ( .A(n51), .B(n6), .Y(SUM[9]) );
  NAND2XL U141 ( .A(n158), .B(n42), .Y(n5) );
  XOR2X1 U142 ( .A(n67), .B(n8), .Y(SUM[7]) );
  NAND2BX1 U143 ( .AN(n49), .B(n50), .Y(n6) );
  NAND2BX1 U144 ( .AN(n65), .B(n66), .Y(n8) );
  NAND2XL U145 ( .A(A[8]), .B(B[8]), .Y(n57) );
  NOR2X1 U146 ( .A(n61), .B(n155), .Y(n52) );
  CLKINVXL U147 ( .A(n42), .Y(n40) );
  CLKINVXL U148 ( .A(n71), .Y(n69) );
  XOR2X1 U149 ( .A(n72), .B(n149), .Y(SUM[6]) );
  AND2X1 U150 ( .A(n91), .B(n71), .Y(n149) );
  XNOR2X1 U151 ( .A(n78), .B(n10), .Y(SUM[5]) );
  NAND2XL U152 ( .A(n92), .B(n77), .Y(n10) );
  OAI21XL U153 ( .A0(n81), .A1(n79), .B0(n80), .Y(n78) );
  CLKINVXL U154 ( .A(n76), .Y(n92) );
  XOR2X1 U155 ( .A(n81), .B(n11), .Y(SUM[4]) );
  NAND2XL U156 ( .A(n93), .B(n80), .Y(n11) );
  NAND2BX1 U157 ( .AN(n83), .B(n84), .Y(n12) );
  NOR2X2 U158 ( .A(n76), .B(n79), .Y(n74) );
  NOR2X1 U159 ( .A(n151), .B(A[14]), .Y(n157) );
  AND2XL U160 ( .A(A[13]), .B(B[13]), .Y(n151) );
  NOR2X1 U161 ( .A(A[3]), .B(B[3]), .Y(n83) );
  NAND2XL U162 ( .A(A[3]), .B(B[3]), .Y(n84) );
  CLKINVXL U163 ( .A(n82), .Y(n81) );
  XOR2X1 U164 ( .A(n12), .B(n85), .Y(SUM[3]) );
  BUFX2 U165 ( .A(A[0]), .Y(SUM[0]) );
  BUFX2 U166 ( .A(A[1]), .Y(SUM[1]) );
  NOR2X1 U167 ( .A(A[2]), .B(B[2]), .Y(n85) );
  XNOR2X1 U168 ( .A(A[2]), .B(B[2]), .Y(SUM[2]) );
  CLKINVXL U169 ( .A(n60), .Y(n62) );
  NOR2X2 U170 ( .A(n65), .B(n70), .Y(n59) );
  INVX4 U171 ( .A(n13), .Y(CO) );
  NAND2X1 U172 ( .A(A[9]), .B(B[9]), .Y(n50) );
  CLKINVX1 U173 ( .A(n89), .Y(n155) );
  CLKINVXL U174 ( .A(n54), .Y(n89) );
  XOR2X1 U175 ( .A(n58), .B(n7), .Y(SUM[8]) );
  OAI2BB1X2 U176 ( .A0N(n30), .A1N(n150), .B0(n157), .Y(n156) );
  NAND2BX2 U177 ( .AN(A[10]), .B(n154), .Y(n158) );
  CLKINVXL U178 ( .A(n44), .Y(n43) );
  XOR2X1 U179 ( .A(n43), .B(n5), .Y(SUM[10]) );
  NOR2X1 U180 ( .A(A[11]), .B(A[12]), .Y(n31) );
  AOI21X4 U181 ( .A0(n47), .A1(n60), .B0(n48), .Y(n46) );
  OAI21X4 U182 ( .A0(n73), .A1(n45), .B0(n46), .Y(n44) );
  AOI21XL U183 ( .A0(n72), .A1(n59), .B0(n60), .Y(n58) );
  NAND2X2 U184 ( .A(n47), .B(n59), .Y(n45) );
  AOI21XL U185 ( .A0(n148), .A1(n158), .B0(n40), .Y(n38) );
  AOI21X4 U186 ( .A0(n44), .A1(n147), .B0(n156), .Y(n13) );
  XOR2XL U187 ( .A(n38), .B(A[11]), .Y(SUM[11]) );
  OAI21XL U188 ( .A0(n62), .A1(n155), .B0(n57), .Y(n53) );
endmodule


module SNN_DW01_add_93 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n5, n6, n7, n8, n10, n11, n12, n13, n29, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n71, n72, n75, n76, n130, n131,
         n132, n133, n134, n135, n136;

  AOI21X1 U5 ( .A0(n50), .A1(n12), .B0(n13), .Y(n11) );
  AOI21X1 U65 ( .A0(n56), .A1(n64), .B0(n57), .Y(n1) );
  ADDFX2 U86 ( .A(B[2]), .B(A[2]), .CI(n68), .CO(n67), .S(SUM[2]) );
  ADDFX2 U87 ( .A(n136), .B(A[1]), .CI(B[1]), .CO(n68), .S(SUM[1]) );
  OAI21XL U95 ( .A0(n65), .A1(n2), .B0(n66), .Y(n64) );
  OR2X1 U96 ( .A(A[0]), .B(B[0]), .Y(n136) );
  NOR2X1 U97 ( .A(n54), .B(n51), .Y(n49) );
  NOR2X1 U98 ( .A(A[7]), .B(B[7]), .Y(n51) );
  NOR2X1 U99 ( .A(A[8]), .B(B[8]), .Y(n44) );
  NOR2XL U100 ( .A(A[3]), .B(B[3]), .Y(n65) );
  AND2XL U101 ( .A(n29), .B(n134), .Y(n133) );
  CLKINVXL U102 ( .A(n50), .Y(n48) );
  CLKINVXL U103 ( .A(n49), .Y(n47) );
  NAND2BXL U104 ( .AN(n54), .B(n55), .Y(n5) );
  XOR2X1 U105 ( .A(n53), .B(n130), .Y(SUM[7]) );
  AND2X1 U106 ( .A(n72), .B(n52), .Y(n130) );
  XOR2X1 U107 ( .A(n46), .B(n131), .Y(SUM[8]) );
  AND2X1 U108 ( .A(n71), .B(n45), .Y(n131) );
  CLKINVXL U109 ( .A(n61), .Y(n75) );
  NAND2XL U110 ( .A(n133), .B(B[14]), .Y(n132) );
  CLKINVX2 U111 ( .A(n67), .Y(n2) );
  CLKINVXL U112 ( .A(n65), .Y(n76) );
  XNOR2X1 U113 ( .A(A[0]), .B(B[0]), .Y(SUM[0]) );
  OAI21X1 U114 ( .A0(n51), .A1(n55), .B0(n52), .Y(n50) );
  NOR2X1 U115 ( .A(n44), .B(n132), .Y(n12) );
  NAND2XL U116 ( .A(A[8]), .B(B[8]), .Y(n45) );
  AND2X1 U117 ( .A(B[12]), .B(B[13]), .Y(n134) );
  CLKINVXL U118 ( .A(n51), .Y(n72) );
  NAND2X1 U119 ( .A(n49), .B(n12), .Y(n10) );
  NOR2X1 U120 ( .A(n45), .B(n132), .Y(n13) );
  CLKINVXL U121 ( .A(n44), .Y(n71) );
  XOR2X1 U122 ( .A(n63), .B(n7), .Y(SUM[4]) );
  NOR2X1 U123 ( .A(A[6]), .B(B[6]), .Y(n54) );
  NAND2XL U124 ( .A(A[6]), .B(B[6]), .Y(n55) );
  NAND2BX1 U125 ( .AN(n58), .B(n59), .Y(n6) );
  AND2X1 U126 ( .A(n135), .B(B[11]), .Y(n29) );
  AND2X1 U127 ( .A(B[9]), .B(B[10]), .Y(n135) );
  NOR2X1 U128 ( .A(n61), .B(n58), .Y(n56) );
  XNOR2X1 U129 ( .A(n60), .B(n6), .Y(SUM[5]) );
  NOR2X1 U130 ( .A(A[5]), .B(B[5]), .Y(n58) );
  CLKINVXL U131 ( .A(n64), .Y(n63) );
  NAND2XL U132 ( .A(A[5]), .B(B[5]), .Y(n59) );
  XNOR2X1 U133 ( .A(n8), .B(n67), .Y(SUM[3]) );
  NAND2X1 U134 ( .A(n75), .B(n62), .Y(n7) );
  OAI21XL U135 ( .A0(n58), .A1(n62), .B0(n59), .Y(n57) );
  OAI21X1 U136 ( .A0(n63), .A1(n61), .B0(n62), .Y(n60) );
  NAND2XL U137 ( .A(n76), .B(n66), .Y(n8) );
  NAND2XL U138 ( .A(A[4]), .B(B[4]), .Y(n62) );
  NOR2X1 U139 ( .A(A[4]), .B(B[4]), .Y(n61) );
  NAND2XL U140 ( .A(A[7]), .B(B[7]), .Y(n52) );
  OAI21XL U141 ( .A0(n1), .A1(n54), .B0(n55), .Y(n53) );
  OAI21XL U142 ( .A0(n1), .A1(n47), .B0(n48), .Y(n46) );
  XOR2X1 U143 ( .A(n1), .B(n5), .Y(SUM[6]) );
  OAI21XL U144 ( .A0(n1), .A1(n10), .B0(n11), .Y(CO) );
  NAND2XL U145 ( .A(A[3]), .B(B[3]), .Y(n66) );
endmodule


module SNN_DW01_add_95 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n5, n6, n7, n10, n11, n12, n13, n20, n25, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n67, n68, n70, n71, n72, n126,
         n127, n128, n129, n130;

  NOR2X2 U66 ( .A(A[5]), .B(B[5]), .Y(n54) );
  ADDFX2 U82 ( .A(B[2]), .B(A[2]), .CI(n64), .CO(n63), .S(SUM[2]) );
  ADDFX2 U83 ( .A(A[1]), .B(B[1]), .CI(n130), .CO(n64), .S(SUM[1]) );
  NOR2X1 U91 ( .A(n57), .B(n54), .Y(n52) );
  OAI21X1 U92 ( .A0(n61), .A1(n2), .B0(n62), .Y(n60) );
  OAI21X1 U93 ( .A0(n47), .A1(n51), .B0(n48), .Y(n46) );
  NAND2X1 U94 ( .A(n70), .B(n55), .Y(n6) );
  INVX2 U95 ( .A(n47), .Y(n68) );
  NOR2XL U96 ( .A(A[3]), .B(B[3]), .Y(n61) );
  CLKINVXL U97 ( .A(n45), .Y(n43) );
  CLKINVXL U98 ( .A(n46), .Y(n44) );
  NAND2BXL U99 ( .AN(n50), .B(n51), .Y(n5) );
  CLKINVXL U100 ( .A(n40), .Y(n67) );
  NAND2XL U101 ( .A(n127), .B(B[14]), .Y(n126) );
  AND2XL U102 ( .A(n20), .B(n25), .Y(n127) );
  XNOR2X1 U103 ( .A(n56), .B(n6), .Y(SUM[5]) );
  CLKINVXL U104 ( .A(n60), .Y(n59) );
  CLKINVX2 U105 ( .A(n63), .Y(n2) );
  OR2XL U106 ( .A(A[0]), .B(B[0]), .Y(n130) );
  NOR2X1 U107 ( .A(A[8]), .B(B[8]), .Y(n40) );
  NOR2X1 U108 ( .A(n50), .B(n47), .Y(n45) );
  NOR2X1 U109 ( .A(A[7]), .B(B[7]), .Y(n47) );
  NAND2XL U110 ( .A(A[8]), .B(B[8]), .Y(n41) );
  NOR2X1 U111 ( .A(n41), .B(n126), .Y(n13) );
  XOR2X1 U112 ( .A(n49), .B(n128), .Y(SUM[7]) );
  AND2X1 U113 ( .A(n68), .B(n48), .Y(n128) );
  XNOR2X1 U114 ( .A(n42), .B(n3), .Y(SUM[8]) );
  NAND2XL U115 ( .A(n67), .B(n41), .Y(n3) );
  NAND2X1 U116 ( .A(n45), .B(n12), .Y(n10) );
  AOI21X1 U117 ( .A0(n46), .A1(n12), .B0(n13), .Y(n11) );
  NOR2X1 U118 ( .A(n40), .B(n126), .Y(n12) );
  NOR2X1 U119 ( .A(A[6]), .B(B[6]), .Y(n50) );
  NAND2XL U120 ( .A(A[6]), .B(B[6]), .Y(n51) );
  AOI21X2 U121 ( .A0(n52), .A1(n60), .B0(n53), .Y(n1) );
  OAI21X1 U122 ( .A0(n54), .A1(n58), .B0(n55), .Y(n53) );
  CLKINVXL U123 ( .A(n54), .Y(n70) );
  XOR2X1 U124 ( .A(n59), .B(n7), .Y(SUM[4]) );
  NAND2XL U125 ( .A(n71), .B(n58), .Y(n7) );
  CLKINVXL U126 ( .A(n57), .Y(n71) );
  NAND2XL U127 ( .A(A[5]), .B(B[5]), .Y(n55) );
  AND2X1 U128 ( .A(B[12]), .B(B[13]), .Y(n20) );
  AND2X1 U129 ( .A(B[11]), .B(B[10]), .Y(n25) );
  XOR2X1 U130 ( .A(n129), .B(n63), .Y(SUM[3]) );
  AND2X1 U131 ( .A(n72), .B(n62), .Y(n129) );
  XNOR2X1 U132 ( .A(A[0]), .B(B[0]), .Y(SUM[0]) );
  INVX1 U133 ( .A(n61), .Y(n72) );
  OAI21XL U134 ( .A0(n1), .A1(n43), .B0(n44), .Y(n42) );
  XOR2X1 U135 ( .A(n1), .B(n5), .Y(SUM[6]) );
  OAI21X1 U136 ( .A0(n1), .A1(n50), .B0(n51), .Y(n49) );
  OAI21X1 U137 ( .A0(n1), .A1(n10), .B0(n11), .Y(CO) );
  OAI21X1 U138 ( .A0(n59), .A1(n57), .B0(n58), .Y(n56) );
  NAND2XL U139 ( .A(A[4]), .B(B[4]), .Y(n58) );
  NOR2X1 U140 ( .A(A[4]), .B(B[4]), .Y(n57) );
  NAND2XL U141 ( .A(A[7]), .B(B[7]), .Y(n48) );
  NAND2XL U142 ( .A(A[3]), .B(B[3]), .Y(n62) );
endmodule


module SNN_DW01_add_94 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n5, n6, n7, n10, n11, n12, n13, n16, n19, n23, n24, n27,
         n28, n29, n32, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n69, n72, n73, n127, n128, n129, n130, n131, n132, n133;

  AOI21X1 U5 ( .A0(n47), .A1(n12), .B0(n13), .Y(n11) );
  NOR2X2 U67 ( .A(A[5]), .B(B[5]), .Y(n55) );
  ADDFX2 U83 ( .A(B[2]), .B(A[2]), .CI(n65), .CO(n64), .S(SUM[2]) );
  CLKINVXL U92 ( .A(B[11]), .Y(n29) );
  ADDFHXL U93 ( .A(n129), .B(A[1]), .CI(B[1]), .CO(n65), .S(SUM[1]) );
  OAI21XL U94 ( .A0(n62), .A1(n2), .B0(n63), .Y(n61) );
  OAI2BB1X1 U95 ( .A0N(n69), .A1N(n133), .B0(n49), .Y(n47) );
  AOI21X1 U96 ( .A0(n53), .A1(n61), .B0(n54), .Y(n1) );
  OAI21X1 U97 ( .A0(n1), .A1(n51), .B0(n52), .Y(n50) );
  CLKINVXL U98 ( .A(B[12]), .Y(n24) );
  NOR2XL U99 ( .A(A[7]), .B(B[7]), .Y(n48) );
  NOR2XL U100 ( .A(A[3]), .B(B[3]), .Y(n62) );
  INVXL U101 ( .A(n61), .Y(n60) );
  INVX1 U102 ( .A(n48), .Y(n69) );
  XOR2X1 U103 ( .A(n50), .B(n127), .Y(SUM[7]) );
  AND2X1 U104 ( .A(n69), .B(n49), .Y(n127) );
  NAND2XL U105 ( .A(n72), .B(n59), .Y(n7) );
  XOR2X1 U106 ( .A(n60), .B(n7), .Y(SUM[4]) );
  NAND2XL U107 ( .A(A[6]), .B(B[6]), .Y(n52) );
  OR2X1 U108 ( .A(n19), .B(n16), .Y(n128) );
  OAI21X1 U109 ( .A0(n55), .A1(n59), .B0(n56), .Y(n54) );
  CLKINVX2 U110 ( .A(n64), .Y(n2) );
  CLKINVXL U111 ( .A(B[0]), .Y(n132) );
  OR2X1 U112 ( .A(A[0]), .B(n131), .Y(n129) );
  XNOR2X1 U113 ( .A(A[0]), .B(n131), .Y(SUM[0]) );
  XNOR2X1 U114 ( .A(n57), .B(n6), .Y(SUM[5]) );
  NOR2X1 U115 ( .A(n51), .B(n48), .Y(n46) );
  XNOR2X1 U116 ( .A(n43), .B(n3), .Y(SUM[8]) );
  NOR2X1 U117 ( .A(n42), .B(n128), .Y(n13) );
  NAND2BX1 U118 ( .AN(n51), .B(n52), .Y(n5) );
  NAND2BX1 U119 ( .AN(n41), .B(n42), .Y(n3) );
  OAI21X1 U120 ( .A0(n1), .A1(n10), .B0(n11), .Y(CO) );
  NAND2X1 U121 ( .A(n46), .B(n12), .Y(n10) );
  NOR2X1 U122 ( .A(n41), .B(n128), .Y(n12) );
  NOR2X1 U123 ( .A(A[4]), .B(B[4]), .Y(n58) );
  NOR2X1 U124 ( .A(A[8]), .B(B[8]), .Y(n41) );
  NOR2X1 U125 ( .A(A[6]), .B(B[6]), .Y(n51) );
  OAI21XL U126 ( .A0(n1), .A1(n44), .B0(n45), .Y(n43) );
  CLKINVXL U127 ( .A(n47), .Y(n45) );
  CLKINVXL U128 ( .A(n46), .Y(n44) );
  NAND2XL U129 ( .A(A[8]), .B(B[8]), .Y(n42) );
  NAND2BX1 U130 ( .AN(n55), .B(n56), .Y(n6) );
  NAND2XL U131 ( .A(A[5]), .B(B[5]), .Y(n56) );
  NOR2X1 U132 ( .A(n27), .B(n24), .Y(n23) );
  NOR2X1 U133 ( .A(n32), .B(n29), .Y(n28) );
  XOR2X1 U134 ( .A(n130), .B(n64), .Y(SUM[3]) );
  AND2X1 U135 ( .A(n73), .B(n63), .Y(n130) );
  INVX2 U136 ( .A(n132), .Y(n131) );
  INVX2 U137 ( .A(n58), .Y(n72) );
  OAI21X1 U138 ( .A0(n60), .A1(n58), .B0(n59), .Y(n57) );
  NOR2X1 U139 ( .A(n58), .B(n55), .Y(n53) );
  CLKINVXL U140 ( .A(n52), .Y(n133) );
  XOR2X1 U141 ( .A(n1), .B(n5), .Y(SUM[6]) );
  NAND2X1 U142 ( .A(n28), .B(B[9]), .Y(n27) );
  CLKINVXL U143 ( .A(B[14]), .Y(n16) );
  CLKINVXL U144 ( .A(B[10]), .Y(n32) );
  INVX1 U145 ( .A(n62), .Y(n73) );
  NAND2XL U146 ( .A(A[4]), .B(B[4]), .Y(n59) );
  NAND2XL U147 ( .A(A[7]), .B(B[7]), .Y(n49) );
  NAND2XL U148 ( .A(n23), .B(B[13]), .Y(n19) );
  NAND2XL U149 ( .A(A[3]), .B(B[3]), .Y(n63) );
endmodule


module SNN_DW01_add_79 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n5, n6, n7, n8, n11, n12, n13, n20, n25, n30, n31, n38, n40, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n57, n58, n59,
         n60, n62, n65, n66, n67, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n89, n90, n91, n92, n145,
         n146, n147, n148, n149, n150, n151, n152, n153, n154;

  NOR2X2 U53 ( .A(A[9]), .B(B[9]), .Y(n49) );
  AOI21X1 U56 ( .A0(n52), .A1(n72), .B0(n53), .Y(n51) );
  AOI21X1 U78 ( .A0(n72), .A1(n91), .B0(n69), .Y(n67) );
  NAND2X4 U112 ( .A(n47), .B(n59), .Y(n45) );
  NAND2XL U113 ( .A(n90), .B(n66), .Y(n8) );
  CLKINVXL U114 ( .A(n65), .Y(n90) );
  NOR2X2 U115 ( .A(n70), .B(n65), .Y(n59) );
  NAND2X4 U116 ( .A(A[4]), .B(B[4]), .Y(n80) );
  NOR2X2 U117 ( .A(B[4]), .B(A[4]), .Y(n79) );
  NOR2X2 U118 ( .A(A[6]), .B(B[6]), .Y(n70) );
  NAND2BX1 U119 ( .AN(n83), .B(n84), .Y(n12) );
  OAI21X4 U120 ( .A0(n83), .A1(n85), .B0(n84), .Y(n82) );
  NOR2X2 U121 ( .A(A[3]), .B(B[3]), .Y(n83) );
  AND2X2 U122 ( .A(n25), .B(n20), .Y(n147) );
  NAND2BX2 U123 ( .AN(A[13]), .B(n154), .Y(n153) );
  OAI2BB1X2 U124 ( .A0N(n30), .A1N(n153), .B0(n147), .Y(n146) );
  AND2X2 U125 ( .A(n152), .B(n153), .Y(n145) );
  OR2X1 U126 ( .A(A[10]), .B(B[10]), .Y(n152) );
  NAND2XL U127 ( .A(n89), .B(n57), .Y(n7) );
  CLKINVXL U128 ( .A(n60), .Y(n62) );
  OAI21X2 U129 ( .A0(n65), .A1(n71), .B0(n66), .Y(n60) );
  INVXL U130 ( .A(n73), .Y(n72) );
  INVX4 U131 ( .A(n13), .Y(CO) );
  NAND2X1 U132 ( .A(A[7]), .B(B[7]), .Y(n66) );
  OAI21X2 U133 ( .A0(n49), .A1(n57), .B0(n50), .Y(n48) );
  AOI21X2 U134 ( .A0(n74), .A1(n82), .B0(n75), .Y(n73) );
  NAND2BXL U135 ( .AN(n149), .B(n80), .Y(n11) );
  OAI21X4 U136 ( .A0(n73), .A1(n45), .B0(n46), .Y(n44) );
  CLKINVX2 U137 ( .A(A[14]), .Y(n20) );
  NAND2X2 U138 ( .A(A[8]), .B(B[8]), .Y(n57) );
  NOR2X4 U139 ( .A(A[7]), .B(B[7]), .Y(n65) );
  NOR2X4 U140 ( .A(n49), .B(n54), .Y(n47) );
  CLKINVXL U141 ( .A(n79), .Y(n148) );
  INVX2 U142 ( .A(n148), .Y(n149) );
  NAND2XL U143 ( .A(A[10]), .B(B[10]), .Y(n42) );
  OAI21X1 U144 ( .A0(n76), .A1(n80), .B0(n77), .Y(n75) );
  NOR2X2 U145 ( .A(A[5]), .B(B[5]), .Y(n76) );
  NAND2X4 U146 ( .A(A[6]), .B(B[6]), .Y(n71) );
  NAND2X1 U147 ( .A(A[3]), .B(B[3]), .Y(n84) );
  NOR2X4 U148 ( .A(A[8]), .B(B[8]), .Y(n54) );
  AOI21XL U149 ( .A0(n72), .A1(n59), .B0(n60), .Y(n58) );
  NOR2X1 U150 ( .A(A[11]), .B(A[12]), .Y(n31) );
  NOR2BXL U151 ( .AN(n59), .B(n54), .Y(n52) );
  CLKINVXL U152 ( .A(n70), .Y(n91) );
  CLKINVXL U153 ( .A(n71), .Y(n69) );
  XOR2X1 U154 ( .A(n78), .B(n150), .Y(SUM[5]) );
  AND2X1 U155 ( .A(n92), .B(n77), .Y(n150) );
  INVX2 U156 ( .A(B[13]), .Y(n154) );
  XOR2X1 U157 ( .A(n43), .B(n5), .Y(SUM[10]) );
  XOR2X1 U158 ( .A(n51), .B(n6), .Y(SUM[9]) );
  CLKINVXL U159 ( .A(n44), .Y(n43) );
  OAI21XL U160 ( .A0(n62), .A1(n54), .B0(n57), .Y(n53) );
  XOR2X1 U161 ( .A(n58), .B(n7), .Y(SUM[8]) );
  XOR2X1 U162 ( .A(n67), .B(n8), .Y(SUM[7]) );
  NAND2BX1 U163 ( .AN(n49), .B(n50), .Y(n6) );
  CLKINVXL U164 ( .A(n54), .Y(n89) );
  XOR2X1 U165 ( .A(n81), .B(n11), .Y(SUM[4]) );
  CLKINVXL U166 ( .A(n42), .Y(n40) );
  NAND2XL U167 ( .A(n152), .B(n42), .Y(n5) );
  XOR2X1 U168 ( .A(n72), .B(n151), .Y(SUM[6]) );
  AND2X1 U169 ( .A(n91), .B(n71), .Y(n151) );
  OAI21XL U170 ( .A0(n81), .A1(n149), .B0(n80), .Y(n78) );
  CLKINVXL U171 ( .A(n82), .Y(n81) );
  CLKINVXL U172 ( .A(n76), .Y(n92) );
  XOR2X1 U173 ( .A(n12), .B(n85), .Y(SUM[3]) );
  NAND2X1 U174 ( .A(A[13]), .B(B[13]), .Y(n25) );
  NAND2XL U175 ( .A(A[5]), .B(B[5]), .Y(n77) );
  BUFX2 U176 ( .A(A[1]), .Y(SUM[1]) );
  NOR2X1 U177 ( .A(A[2]), .B(B[2]), .Y(n85) );
  XNOR2X1 U178 ( .A(A[2]), .B(B[2]), .Y(SUM[2]) );
  BUFX2 U179 ( .A(A[0]), .Y(SUM[0]) );
  AOI21X2 U180 ( .A0(n47), .A1(n60), .B0(n48), .Y(n46) );
  XOR2XL U181 ( .A(n38), .B(A[11]), .Y(SUM[11]) );
  NAND2XL U182 ( .A(A[9]), .B(B[9]), .Y(n50) );
  NAND2X1 U183 ( .A(n31), .B(n42), .Y(n30) );
  NOR2X1 U184 ( .A(n79), .B(n76), .Y(n74) );
  AOI21XL U185 ( .A0(n44), .A1(n152), .B0(n40), .Y(n38) );
  AOI21X4 U186 ( .A0(n44), .A1(n145), .B0(n146), .Y(n13) );
endmodule


module SNN_DW01_sub_1 ( A, B, CI, DIFF, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] DIFF;
  input CI;
  output CO;
  wire   n166, n118, n119, n120, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155, n156, n157, n158, n159;

  CLKINVX4 U90 ( .A(n155), .Y(DIFF[10]) );
  CLKINVX4 U91 ( .A(n135), .Y(DIFF[6]) );
  XNOR2X1 U92 ( .A(n142), .B(n139), .Y(DIFF[3]) );
  BUFX2 U93 ( .A(DIFF[13]), .Y(DIFF[12]) );
  NAND2X1 U94 ( .A(n128), .B(DIFF[13]), .Y(DIFF[14]) );
  NOR2X1 U95 ( .A(n134), .B(n127), .Y(n118) );
  NAND2X1 U96 ( .A(n145), .B(n146), .Y(n144) );
  OR2X1 U97 ( .A(n129), .B(n127), .Y(n139) );
  INVX2 U98 ( .A(n126), .Y(n157) );
  XOR2X1 U99 ( .A(n131), .B(n127), .Y(DIFF[9]) );
  OAI21XL U100 ( .A0(n147), .A1(n154), .B0(n118), .Y(n156) );
  INVX4 U101 ( .A(n147), .Y(DIFF[7]) );
  AOI21X1 U102 ( .A0(n140), .A1(n138), .B0(n159), .Y(n158) );
  OR2X1 U103 ( .A(B[0]), .B(n130), .Y(n140) );
  NOR2X2 U104 ( .A(n158), .B(n143), .Y(n147) );
  OAI2BB1X2 U105 ( .A0N(n132), .A1N(DIFF[7]), .B0(n118), .Y(n151) );
  OAI2BB1X1 U106 ( .A0N(n132), .A1N(DIFF[7]), .B0(n133), .Y(n131) );
  NAND2BX2 U107 ( .AN(n153), .B(n148), .Y(n152) );
  NAND2X1 U108 ( .A(n149), .B(n148), .Y(n145) );
  INVX2 U109 ( .A(n144), .Y(DIFF[13]) );
  NAND2X1 U110 ( .A(n132), .B(n150), .Y(n149) );
  OR2X1 U111 ( .A(n157), .B(n130), .Y(n133) );
  OR2XL U112 ( .A(B[8]), .B(n126), .Y(n132) );
  OR2X1 U113 ( .A(n157), .B(n130), .Y(n137) );
  XOR2X1 U114 ( .A(DIFF[7]), .B(n119), .Y(DIFF[8]) );
  OR2X1 U115 ( .A(n154), .B(n134), .Y(n119) );
  XNOR2X2 U116 ( .A(n120), .B(n136), .Y(n135) );
  AND2X1 U117 ( .A(n137), .B(n138), .Y(n120) );
  CLKINVXL U118 ( .A(n136), .Y(n166) );
  INVX2 U119 ( .A(n137), .Y(n159) );
  CLKINVXL U120 ( .A(B[11]), .Y(n128) );
  OR2XL U121 ( .A(B[11]), .B(n130), .Y(n150) );
  INVX2 U122 ( .A(n133), .Y(n134) );
  INVX2 U123 ( .A(B[4]), .Y(n126) );
  BUFX2 U124 ( .A(n166), .Y(DIFF[5]) );
  INVX2 U125 ( .A(B[4]), .Y(n127) );
  INVX2 U126 ( .A(n132), .Y(n154) );
  CLKINVXL U127 ( .A(B[8]), .Y(n130) );
  NAND3XL U128 ( .A(n118), .B(n147), .C(n148), .Y(n146) );
  OR2XL U129 ( .A(B[8]), .B(n127), .Y(n138) );
  XOR2X1 U130 ( .A(n157), .B(n156), .Y(n155) );
  INVX2 U131 ( .A(n150), .Y(n153) );
  OR2X1 U132 ( .A(n143), .B(n126), .Y(DIFF[2]) );
  INVX2 U133 ( .A(n139), .Y(n143) );
  OR2XL U134 ( .A(B[8]), .B(n128), .Y(n148) );
  OAI2BB1X1 U135 ( .A0N(n139), .A1N(n140), .B0(n141), .Y(n136) );
  OR2XL U136 ( .A(B[8]), .B(n129), .Y(n141) );
  XOR2XL U137 ( .A(n129), .B(n157), .Y(DIFF[1]) );
  NAND2XL U138 ( .A(n141), .B(n140), .Y(n142) );
  CLKINVXL U139 ( .A(B[0]), .Y(n129) );
  BUFX1 U140 ( .A(B[0]), .Y(DIFF[0]) );
  XOR2X4 U141 ( .A(n151), .B(n152), .Y(DIFF[11]) );
endmodule


module SNN_DW01_add_31 ( A, B, CI, SUM, CO );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  input CI;
  output CO;
  wire   n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137;

  OR2X2 U93 ( .A(B[0]), .B(A[0]), .Y(n128) );
  NAND2X2 U94 ( .A(B[14]), .B(B[8]), .Y(n137) );
  NAND2X2 U95 ( .A(B[6]), .B(B[13]), .Y(n136) );
  XOR2X1 U96 ( .A(n131), .B(B[0]), .Y(SUM[0]) );
  NAND2X1 U97 ( .A(n129), .B(n130), .Y(n127) );
  NAND2X1 U98 ( .A(A[1]), .B(B[1]), .Y(n129) );
  XOR2X1 U99 ( .A(n126), .B(B[2]), .Y(SUM[2]) );
  NAND2X4 U100 ( .A(B[12]), .B(B[11]), .Y(n133) );
  OR2X4 U101 ( .A(B[1]), .B(A[1]), .Y(n130) );
  NOR2X4 U102 ( .A(n136), .B(n137), .Y(n134) );
  XNOR2XL U103 ( .A(n127), .B(n128), .Y(SUM[1]) );
  INVX2 U104 ( .A(A[0]), .Y(n131) );
  AND2X4 U105 ( .A(B[10]), .B(B[2]), .Y(n135) );
  NAND4X4 U106 ( .A(n134), .B(n135), .C(B[9]), .D(n126), .Y(n132) );
  NOR2X4 U107 ( .A(n132), .B(n133), .Y(CO) );
  OAI2BB1X4 U108 ( .A0N(n128), .A1N(n130), .B0(n129), .Y(n126) );
endmodule


module SNN_DW01_add_17_DW01_add_2 ( A, B, CI, SUM, CO );
  input [16:0] A;
  input [16:0] B;
  output [16:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [15:2] carry;

  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2 U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(
        SUM[14]) );
  ADDFX2 U1_15 ( .A(A[15]), .B(B[15]), .CI(carry[15]), .CO(SUM[16]), .S(
        SUM[15]) );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFX2 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFX2 U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  ADDFX2 U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(
        SUM[12]) );
  ADDFX2 U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(
        SUM[13]) );
  ADDFX2 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFX2 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  AND2X1 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module SNN_DW_mult_uns_0 ( a, b, product );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215;

  ADDFX2 U2 ( .A(n15), .B(n85), .CI(n2), .CO(product[15]), .S(product[14]) );
  ADDFX2 U3 ( .A(n18), .B(n16), .CI(n3), .CO(n2), .S(product[13]) );
  ADDFX2 U4 ( .A(n21), .B(n19), .CI(n4), .CO(n3), .S(product[12]) );
  ADDFX2 U5 ( .A(n26), .B(n22), .CI(n5), .CO(n4), .S(product[11]) );
  ADDFX2 U6 ( .A(n27), .B(n32), .CI(n6), .CO(n5), .S(product[10]) );
  ADDFX2 U7 ( .A(n33), .B(n40), .CI(n7), .CO(n6), .S(product[9]) );
  ADDFX2 U8 ( .A(n41), .B(n50), .CI(n8), .CO(n7), .S(product[8]) );
  ADDFX2 U9 ( .A(n51), .B(n60), .CI(n9), .CO(n8), .S(product[7]) );
  ADDFX2 U10 ( .A(n61), .B(n68), .CI(n10), .CO(n9), .S(product[6]) );
  ADDFX2 U11 ( .A(n69), .B(n75), .CI(n11), .CO(n10), .S(product[5]) );
  ADDFX2 U12 ( .A(n76), .B(n79), .CI(n12), .CO(n11), .S(product[4]) );
  ADDFX2 U13 ( .A(n80), .B(n82), .CI(n13), .CO(n12), .S(product[3]) );
  ADDFX2 U14 ( .A(n14), .B(n132), .CI(n84), .CO(n13), .S(product[2]) );
  ADDHXL U15 ( .A(n140), .B(n147), .CO(n14), .S(product[1]) );
  ADDFX2 U16 ( .A(n86), .B(n93), .CI(n17), .CO(n15), .S(n16) );
  CMPR42X1 U17 ( .A(n101), .B(n87), .C(n94), .D(n23), .ICI(n20), .S(n19), 
        .ICO(n17), .CO(n18) );
  CMPR42X1 U18 ( .A(n95), .B(n28), .C(n24), .D(n29), .ICI(n25), .S(n22), .ICO(
        n20), .CO(n21) );
  ADDFX2 U19 ( .A(n102), .B(n109), .CI(n88), .CO(n23), .S(n24) );
  CMPR42X1 U20 ( .A(n96), .B(n34), .C(n35), .D(n30), .ICI(n31), .S(n27), .ICO(
        n25), .CO(n26) );
  CMPR42X1 U21 ( .A(n103), .B(n89), .C(n117), .D(n110), .ICI(n37), .S(n30), 
        .ICO(n28), .CO(n29) );
  CMPR42X1 U22 ( .A(n42), .B(n38), .C(n43), .D(n36), .ICI(n39), .S(n33), .ICO(
        n31), .CO(n32) );
  CMPR42X1 U23 ( .A(n104), .B(n118), .C(n111), .D(n97), .ICI(n45), .S(n36), 
        .ICO(n34), .CO(n35) );
  ADDFX2 U24 ( .A(n90), .B(n125), .CI(n47), .CO(n37), .S(n38) );
  CMPR42X1 U25 ( .A(n48), .B(n46), .C(n49), .D(n53), .ICI(n44), .S(n41), .ICO(
        n39), .CO(n40) );
  CMPR42X1 U26 ( .A(n126), .B(n105), .C(n119), .D(n52), .ICI(n55), .S(n44), 
        .ICO(n42), .CO(n43) );
  ADDFX2 U27 ( .A(n133), .B(n112), .CI(n57), .CO(n45), .S(n46) );
  ADDHXL U28 ( .A(n98), .B(n91), .CO(n47), .S(n48) );
  CMPR42X1 U29 ( .A(n62), .B(n58), .C(n59), .D(n63), .ICI(n54), .S(n51), .ICO(
        n49), .CO(n50) );
  CMPR42X1 U30 ( .A(n134), .B(n113), .C(n120), .D(n127), .ICI(n56), .S(n54), 
        .ICO(n52), .CO(n53) );
  ADDFX2 U31 ( .A(n106), .B(n141), .CI(n65), .CO(n55), .S(n56) );
  ADDHXL U32 ( .A(n99), .B(n92), .CO(n57), .S(n58) );
  CMPR42X1 U33 ( .A(n128), .B(n121), .C(n66), .D(n70), .ICI(n64), .S(n61), 
        .ICO(n59), .CO(n60) );
  CMPR42X1 U34 ( .A(n142), .B(n114), .C(n135), .D(n72), .ICI(n67), .S(n64), 
        .ICO(n62), .CO(n63) );
  ADDHXL U35 ( .A(n107), .B(n100), .CO(n65), .S(n66) );
  CMPR42X1 U36 ( .A(n136), .B(n129), .C(n74), .D(n73), .ICI(n71), .S(n69), 
        .ICO(n67), .CO(n68) );
  ADDFX2 U37 ( .A(n122), .B(n143), .CI(n77), .CO(n70), .S(n71) );
  ADDHXL U38 ( .A(n115), .B(n108), .CO(n72), .S(n73) );
  CMPR42X1 U39 ( .A(n144), .B(n130), .C(n137), .D(n81), .ICI(n78), .S(n76), 
        .ICO(n74), .CO(n75) );
  ADDHXL U40 ( .A(n123), .B(n116), .CO(n77), .S(n78) );
  ADDFX2 U41 ( .A(n138), .B(n145), .CI(n83), .CO(n79), .S(n80) );
  ADDHXL U42 ( .A(n131), .B(n124), .CO(n81), .S(n82) );
  ADDHXL U43 ( .A(n146), .B(n139), .CO(n83), .S(n84) );
  INVX2 U126 ( .A(b[4]), .Y(n212) );
  INVX2 U127 ( .A(b[3]), .Y(n211) );
  INVX2 U128 ( .A(b[2]), .Y(n210) );
  INVX2 U129 ( .A(b[0]), .Y(n208) );
  INVX2 U130 ( .A(b[1]), .Y(n209) );
  INVX2 U131 ( .A(b[6]), .Y(n214) );
  INVX2 U132 ( .A(b[5]), .Y(n213) );
  INVX2 U133 ( .A(b[7]), .Y(n215) );
  INVX2 U134 ( .A(a[0]), .Y(n200) );
  INVX2 U135 ( .A(a[2]), .Y(n202) );
  INVX2 U136 ( .A(a[3]), .Y(n203) );
  INVX2 U137 ( .A(a[1]), .Y(n201) );
  INVX2 U138 ( .A(a[4]), .Y(n204) );
  INVX2 U139 ( .A(a[5]), .Y(n205) );
  INVX2 U140 ( .A(a[6]), .Y(n206) );
  INVX2 U141 ( .A(a[7]), .Y(n207) );
  NOR2X1 U142 ( .A(n200), .B(n208), .Y(product[0]) );
  NOR2X1 U143 ( .A(n206), .B(n209), .Y(n99) );
  NOR2X1 U144 ( .A(n206), .B(n210), .Y(n98) );
  NOR2X1 U145 ( .A(n206), .B(n211), .Y(n97) );
  NOR2X1 U146 ( .A(n206), .B(n212), .Y(n96) );
  NOR2X1 U147 ( .A(n206), .B(n213), .Y(n95) );
  NOR2X1 U148 ( .A(n206), .B(n214), .Y(n94) );
  NOR2X1 U149 ( .A(n206), .B(n215), .Y(n93) );
  NOR2X1 U150 ( .A(n208), .B(n207), .Y(n92) );
  NOR2X1 U151 ( .A(n209), .B(n207), .Y(n91) );
  NOR2X1 U152 ( .A(n210), .B(n207), .Y(n90) );
  NOR2X1 U153 ( .A(n211), .B(n207), .Y(n89) );
  NOR2X1 U154 ( .A(n212), .B(n207), .Y(n88) );
  NOR2X1 U155 ( .A(n213), .B(n207), .Y(n87) );
  NOR2X1 U156 ( .A(n214), .B(n207), .Y(n86) );
  NOR2X1 U157 ( .A(n215), .B(n207), .Y(n85) );
  NOR2X1 U158 ( .A(n200), .B(n209), .Y(n147) );
  NOR2X1 U159 ( .A(n200), .B(n210), .Y(n146) );
  NOR2X1 U160 ( .A(n200), .B(n211), .Y(n145) );
  NOR2X1 U161 ( .A(n200), .B(n212), .Y(n144) );
  NOR2X1 U162 ( .A(n200), .B(n213), .Y(n143) );
  NOR2X1 U163 ( .A(n200), .B(n214), .Y(n142) );
  NOR2X1 U164 ( .A(n200), .B(n215), .Y(n141) );
  NOR2X1 U165 ( .A(n208), .B(n201), .Y(n140) );
  NOR2X1 U166 ( .A(n209), .B(n201), .Y(n139) );
  NOR2X1 U167 ( .A(n210), .B(n201), .Y(n138) );
  NOR2X1 U168 ( .A(n211), .B(n201), .Y(n137) );
  NOR2X1 U169 ( .A(n212), .B(n201), .Y(n136) );
  NOR2X1 U170 ( .A(n213), .B(n201), .Y(n135) );
  NOR2X1 U171 ( .A(n214), .B(n201), .Y(n134) );
  NOR2X1 U172 ( .A(n215), .B(n201), .Y(n133) );
  NOR2X1 U173 ( .A(n208), .B(n202), .Y(n132) );
  NOR2X1 U174 ( .A(n209), .B(n202), .Y(n131) );
  NOR2X1 U175 ( .A(n210), .B(n202), .Y(n130) );
  NOR2X1 U176 ( .A(n211), .B(n202), .Y(n129) );
  NOR2X1 U177 ( .A(n212), .B(n202), .Y(n128) );
  NOR2X1 U178 ( .A(n213), .B(n202), .Y(n127) );
  NOR2X1 U179 ( .A(n214), .B(n202), .Y(n126) );
  NOR2X1 U180 ( .A(n215), .B(n202), .Y(n125) );
  NOR2X1 U181 ( .A(n208), .B(n203), .Y(n124) );
  NOR2X1 U182 ( .A(n209), .B(n203), .Y(n123) );
  NOR2X1 U183 ( .A(n210), .B(n203), .Y(n122) );
  NOR2X1 U184 ( .A(n211), .B(n203), .Y(n121) );
  NOR2X1 U185 ( .A(n212), .B(n203), .Y(n120) );
  NOR2X1 U186 ( .A(n213), .B(n203), .Y(n119) );
  NOR2X1 U187 ( .A(n214), .B(n203), .Y(n118) );
  NOR2X1 U188 ( .A(n215), .B(n203), .Y(n117) );
  NOR2X1 U189 ( .A(n208), .B(n204), .Y(n116) );
  NOR2X1 U190 ( .A(n209), .B(n204), .Y(n115) );
  NOR2X1 U191 ( .A(n210), .B(n204), .Y(n114) );
  NOR2X1 U192 ( .A(n211), .B(n204), .Y(n113) );
  NOR2X1 U193 ( .A(n212), .B(n204), .Y(n112) );
  NOR2X1 U194 ( .A(n213), .B(n204), .Y(n111) );
  NOR2X1 U195 ( .A(n214), .B(n204), .Y(n110) );
  NOR2X1 U196 ( .A(n215), .B(n204), .Y(n109) );
  NOR2X1 U197 ( .A(n208), .B(n205), .Y(n108) );
  NOR2X1 U198 ( .A(n209), .B(n205), .Y(n107) );
  NOR2X1 U199 ( .A(n210), .B(n205), .Y(n106) );
  NOR2X1 U200 ( .A(n211), .B(n205), .Y(n105) );
  NOR2X1 U201 ( .A(n212), .B(n205), .Y(n104) );
  NOR2X1 U202 ( .A(n213), .B(n205), .Y(n103) );
  NOR2X1 U203 ( .A(n214), .B(n205), .Y(n102) );
  NOR2X1 U204 ( .A(n215), .B(n205), .Y(n101) );
  NOR2X1 U205 ( .A(n208), .B(n206), .Y(n100) );
endmodule


module SNN_DW_mult_uns_1 ( a, b, product );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215;

  ADDFX2 U2 ( .A(n15), .B(n85), .CI(n2), .CO(product[15]), .S(product[14]) );
  ADDFX2 U3 ( .A(n18), .B(n16), .CI(n3), .CO(n2), .S(product[13]) );
  ADDFX2 U4 ( .A(n21), .B(n19), .CI(n4), .CO(n3), .S(product[12]) );
  ADDFX2 U5 ( .A(n26), .B(n22), .CI(n5), .CO(n4), .S(product[11]) );
  ADDFX2 U6 ( .A(n27), .B(n32), .CI(n6), .CO(n5), .S(product[10]) );
  ADDFX2 U7 ( .A(n33), .B(n40), .CI(n7), .CO(n6), .S(product[9]) );
  ADDFX2 U8 ( .A(n41), .B(n50), .CI(n8), .CO(n7), .S(product[8]) );
  ADDFX2 U9 ( .A(n51), .B(n60), .CI(n9), .CO(n8), .S(product[7]) );
  ADDFX2 U10 ( .A(n61), .B(n68), .CI(n10), .CO(n9), .S(product[6]) );
  ADDFX2 U11 ( .A(n69), .B(n75), .CI(n11), .CO(n10), .S(product[5]) );
  ADDFX2 U12 ( .A(n76), .B(n79), .CI(n12), .CO(n11), .S(product[4]) );
  ADDFX2 U13 ( .A(n80), .B(n82), .CI(n13), .CO(n12), .S(product[3]) );
  ADDFX2 U14 ( .A(n14), .B(n132), .CI(n84), .CO(n13), .S(product[2]) );
  ADDHXL U15 ( .A(n140), .B(n147), .CO(n14), .S(product[1]) );
  ADDFX2 U16 ( .A(n86), .B(n93), .CI(n17), .CO(n15), .S(n16) );
  CMPR42X1 U17 ( .A(n101), .B(n87), .C(n94), .D(n23), .ICI(n20), .S(n19), 
        .ICO(n17), .CO(n18) );
  CMPR42X1 U18 ( .A(n95), .B(n28), .C(n24), .D(n29), .ICI(n25), .S(n22), .ICO(
        n20), .CO(n21) );
  ADDFX2 U19 ( .A(n102), .B(n109), .CI(n88), .CO(n23), .S(n24) );
  CMPR42X1 U20 ( .A(n96), .B(n34), .C(n35), .D(n30), .ICI(n31), .S(n27), .ICO(
        n25), .CO(n26) );
  CMPR42X1 U21 ( .A(n103), .B(n89), .C(n117), .D(n110), .ICI(n37), .S(n30), 
        .ICO(n28), .CO(n29) );
  CMPR42X1 U22 ( .A(n42), .B(n38), .C(n43), .D(n36), .ICI(n39), .S(n33), .ICO(
        n31), .CO(n32) );
  CMPR42X1 U23 ( .A(n104), .B(n118), .C(n111), .D(n97), .ICI(n45), .S(n36), 
        .ICO(n34), .CO(n35) );
  ADDFX2 U24 ( .A(n90), .B(n125), .CI(n47), .CO(n37), .S(n38) );
  CMPR42X1 U25 ( .A(n48), .B(n46), .C(n49), .D(n53), .ICI(n44), .S(n41), .ICO(
        n39), .CO(n40) );
  CMPR42X1 U26 ( .A(n126), .B(n105), .C(n119), .D(n52), .ICI(n55), .S(n44), 
        .ICO(n42), .CO(n43) );
  ADDFX2 U27 ( .A(n133), .B(n112), .CI(n57), .CO(n45), .S(n46) );
  ADDHXL U28 ( .A(n98), .B(n91), .CO(n47), .S(n48) );
  CMPR42X1 U29 ( .A(n62), .B(n58), .C(n59), .D(n63), .ICI(n54), .S(n51), .ICO(
        n49), .CO(n50) );
  CMPR42X1 U30 ( .A(n134), .B(n113), .C(n120), .D(n127), .ICI(n56), .S(n54), 
        .ICO(n52), .CO(n53) );
  ADDFX2 U31 ( .A(n106), .B(n141), .CI(n65), .CO(n55), .S(n56) );
  ADDHXL U32 ( .A(n99), .B(n92), .CO(n57), .S(n58) );
  CMPR42X1 U33 ( .A(n128), .B(n121), .C(n66), .D(n70), .ICI(n64), .S(n61), 
        .ICO(n59), .CO(n60) );
  CMPR42X1 U34 ( .A(n142), .B(n114), .C(n135), .D(n72), .ICI(n67), .S(n64), 
        .ICO(n62), .CO(n63) );
  ADDHXL U35 ( .A(n107), .B(n100), .CO(n65), .S(n66) );
  CMPR42X1 U36 ( .A(n136), .B(n129), .C(n74), .D(n73), .ICI(n71), .S(n69), 
        .ICO(n67), .CO(n68) );
  ADDFX2 U37 ( .A(n122), .B(n143), .CI(n77), .CO(n70), .S(n71) );
  ADDHXL U38 ( .A(n115), .B(n108), .CO(n72), .S(n73) );
  CMPR42X1 U39 ( .A(n144), .B(n130), .C(n137), .D(n81), .ICI(n78), .S(n76), 
        .ICO(n74), .CO(n75) );
  ADDHXL U40 ( .A(n123), .B(n116), .CO(n77), .S(n78) );
  ADDFX2 U41 ( .A(n138), .B(n145), .CI(n83), .CO(n79), .S(n80) );
  ADDHXL U42 ( .A(n131), .B(n124), .CO(n81), .S(n82) );
  ADDHXL U43 ( .A(n146), .B(n139), .CO(n83), .S(n84) );
  INVX2 U126 ( .A(b[4]), .Y(n212) );
  INVX2 U127 ( .A(b[3]), .Y(n211) );
  INVX2 U128 ( .A(b[2]), .Y(n210) );
  INVX2 U129 ( .A(b[0]), .Y(n208) );
  INVX2 U130 ( .A(b[1]), .Y(n209) );
  INVX2 U131 ( .A(b[6]), .Y(n214) );
  INVX2 U132 ( .A(b[5]), .Y(n213) );
  INVX2 U133 ( .A(b[7]), .Y(n215) );
  INVX2 U134 ( .A(a[0]), .Y(n200) );
  INVX2 U135 ( .A(a[2]), .Y(n202) );
  INVX2 U136 ( .A(a[3]), .Y(n203) );
  INVX2 U137 ( .A(a[1]), .Y(n201) );
  INVX2 U138 ( .A(a[4]), .Y(n204) );
  INVX2 U139 ( .A(a[5]), .Y(n205) );
  INVX2 U140 ( .A(a[6]), .Y(n206) );
  INVX2 U141 ( .A(a[7]), .Y(n207) );
  NOR2X1 U142 ( .A(n200), .B(n208), .Y(product[0]) );
  NOR2X1 U143 ( .A(n206), .B(n209), .Y(n99) );
  NOR2X1 U144 ( .A(n206), .B(n210), .Y(n98) );
  NOR2X1 U145 ( .A(n206), .B(n211), .Y(n97) );
  NOR2X1 U146 ( .A(n206), .B(n212), .Y(n96) );
  NOR2X1 U147 ( .A(n206), .B(n213), .Y(n95) );
  NOR2X1 U148 ( .A(n206), .B(n214), .Y(n94) );
  NOR2X1 U149 ( .A(n206), .B(n215), .Y(n93) );
  NOR2X1 U150 ( .A(n208), .B(n207), .Y(n92) );
  NOR2X1 U151 ( .A(n209), .B(n207), .Y(n91) );
  NOR2X1 U152 ( .A(n210), .B(n207), .Y(n90) );
  NOR2X1 U153 ( .A(n211), .B(n207), .Y(n89) );
  NOR2X1 U154 ( .A(n212), .B(n207), .Y(n88) );
  NOR2X1 U155 ( .A(n213), .B(n207), .Y(n87) );
  NOR2X1 U156 ( .A(n214), .B(n207), .Y(n86) );
  NOR2X1 U157 ( .A(n215), .B(n207), .Y(n85) );
  NOR2X1 U158 ( .A(n200), .B(n209), .Y(n147) );
  NOR2X1 U159 ( .A(n200), .B(n210), .Y(n146) );
  NOR2X1 U160 ( .A(n200), .B(n211), .Y(n145) );
  NOR2X1 U161 ( .A(n200), .B(n212), .Y(n144) );
  NOR2X1 U162 ( .A(n200), .B(n213), .Y(n143) );
  NOR2X1 U163 ( .A(n200), .B(n214), .Y(n142) );
  NOR2X1 U164 ( .A(n200), .B(n215), .Y(n141) );
  NOR2X1 U165 ( .A(n208), .B(n201), .Y(n140) );
  NOR2X1 U166 ( .A(n209), .B(n201), .Y(n139) );
  NOR2X1 U167 ( .A(n210), .B(n201), .Y(n138) );
  NOR2X1 U168 ( .A(n211), .B(n201), .Y(n137) );
  NOR2X1 U169 ( .A(n212), .B(n201), .Y(n136) );
  NOR2X1 U170 ( .A(n213), .B(n201), .Y(n135) );
  NOR2X1 U171 ( .A(n214), .B(n201), .Y(n134) );
  NOR2X1 U172 ( .A(n215), .B(n201), .Y(n133) );
  NOR2X1 U173 ( .A(n208), .B(n202), .Y(n132) );
  NOR2X1 U174 ( .A(n209), .B(n202), .Y(n131) );
  NOR2X1 U175 ( .A(n210), .B(n202), .Y(n130) );
  NOR2X1 U176 ( .A(n211), .B(n202), .Y(n129) );
  NOR2X1 U177 ( .A(n212), .B(n202), .Y(n128) );
  NOR2X1 U178 ( .A(n213), .B(n202), .Y(n127) );
  NOR2X1 U179 ( .A(n214), .B(n202), .Y(n126) );
  NOR2X1 U180 ( .A(n215), .B(n202), .Y(n125) );
  NOR2X1 U181 ( .A(n208), .B(n203), .Y(n124) );
  NOR2X1 U182 ( .A(n209), .B(n203), .Y(n123) );
  NOR2X1 U183 ( .A(n210), .B(n203), .Y(n122) );
  NOR2X1 U184 ( .A(n211), .B(n203), .Y(n121) );
  NOR2X1 U185 ( .A(n212), .B(n203), .Y(n120) );
  NOR2X1 U186 ( .A(n213), .B(n203), .Y(n119) );
  NOR2X1 U187 ( .A(n214), .B(n203), .Y(n118) );
  NOR2X1 U188 ( .A(n215), .B(n203), .Y(n117) );
  NOR2X1 U189 ( .A(n208), .B(n204), .Y(n116) );
  NOR2X1 U190 ( .A(n209), .B(n204), .Y(n115) );
  NOR2X1 U191 ( .A(n210), .B(n204), .Y(n114) );
  NOR2X1 U192 ( .A(n211), .B(n204), .Y(n113) );
  NOR2X1 U193 ( .A(n212), .B(n204), .Y(n112) );
  NOR2X1 U194 ( .A(n213), .B(n204), .Y(n111) );
  NOR2X1 U195 ( .A(n214), .B(n204), .Y(n110) );
  NOR2X1 U196 ( .A(n215), .B(n204), .Y(n109) );
  NOR2X1 U197 ( .A(n208), .B(n205), .Y(n108) );
  NOR2X1 U198 ( .A(n209), .B(n205), .Y(n107) );
  NOR2X1 U199 ( .A(n210), .B(n205), .Y(n106) );
  NOR2X1 U200 ( .A(n211), .B(n205), .Y(n105) );
  NOR2X1 U201 ( .A(n212), .B(n205), .Y(n104) );
  NOR2X1 U202 ( .A(n213), .B(n205), .Y(n103) );
  NOR2X1 U203 ( .A(n214), .B(n205), .Y(n102) );
  NOR2X1 U204 ( .A(n215), .B(n205), .Y(n101) );
  NOR2X1 U205 ( .A(n208), .B(n206), .Y(n100) );
endmodule


module SNN_DW01_add_18_DW01_add_3 ( A, B, CI, SUM, CO );
  input [19:0] A;
  input [19:0] B;
  output [19:0] SUM;
  input CI;
  output CO;
  wire   n1, n3;
  wire   [17:2] carry;

  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2 U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(
        SUM[14]) );
  ADDFX2 U1_15 ( .A(A[15]), .B(B[15]), .CI(carry[15]), .CO(carry[16]), .S(
        SUM[15]) );
  ADDFX2 U1_16 ( .A(A[16]), .B(B[16]), .CI(carry[16]), .CO(carry[17]), .S(
        SUM[16]) );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFX2 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFX2 U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  ADDFX2 U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(
        SUM[12]) );
  ADDFX2 U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(
        SUM[13]) );
  ADDFX2 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFX2 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  AND2X1 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  AND2X1 U2 ( .A(B[18]), .B(n3), .Y(SUM[19]) );
  AND2X1 U3 ( .A(B[17]), .B(carry[17]), .Y(n3) );
  XOR2X1 U4 ( .A(B[18]), .B(n3), .Y(SUM[18]) );
  XOR2X1 U5 ( .A(B[17]), .B(carry[17]), .Y(SUM[17]) );
  XOR2X1 U6 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module SNN_DW01_add_19_DW01_add_4 ( A, B, CI, SUM, CO );
  input [19:0] A;
  input [19:0] B;
  output [19:0] SUM;
  input CI;
  output CO;
  wire   carry_17_, carry_16_, carry_15_, carry_14_, carry_13_, carry_12_,
         carry_11_, carry_10_, carry_9_, carry_8_, carry_7_, carry_6_,
         carry_5_, carry_4_, carry_3_, carry_2_, n1;

  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry_2_), .S(SUM[1]) );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry_2_), .CO(carry_3_), .S(SUM[2])
         );
  ADDFX2 U1_17 ( .A(A[17]), .B(B[17]), .CI(carry_17_), .CO(SUM[18]), .S(
        SUM[17]) );
  ADDFX2 U1_14 ( .A(A[14]), .B(B[14]), .CI(carry_14_), .CO(carry_15_), .S(
        SUM[14]) );
  ADDFX2 U1_15 ( .A(A[15]), .B(B[15]), .CI(carry_15_), .CO(carry_16_), .S(
        SUM[15]) );
  ADDFX2 U1_16 ( .A(A[16]), .B(B[16]), .CI(carry_16_), .CO(carry_17_), .S(
        SUM[16]) );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry_3_), .CO(carry_4_), .S(SUM[3])
         );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry_4_), .CO(carry_5_), .S(SUM[4])
         );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry_5_), .CO(carry_6_), .S(SUM[5])
         );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry_6_), .CO(carry_7_), .S(SUM[6])
         );
  ADDFX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry_7_), .CO(carry_8_), .S(SUM[7])
         );
  ADDFX2 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry_10_), .CO(carry_11_), .S(
        SUM[10]) );
  ADDFX2 U1_11 ( .A(A[11]), .B(B[11]), .CI(carry_11_), .CO(carry_12_), .S(
        SUM[11]) );
  ADDFX2 U1_12 ( .A(A[12]), .B(B[12]), .CI(carry_12_), .CO(carry_13_), .S(
        SUM[12]) );
  ADDFX2 U1_13 ( .A(A[13]), .B(B[13]), .CI(carry_13_), .CO(carry_14_), .S(
        SUM[13]) );
  ADDFX2 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry_8_), .CO(carry_9_), .S(SUM[8])
         );
  ADDFX2 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry_9_), .CO(carry_10_), .S(SUM[9])
         );
  AND2X1 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module SNN_DW01_add_20_DW01_add_5 ( A, B, CI, SUM, CO );
  input [19:0] A;
  input [19:0] B;
  output [19:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [15:2] carry;

  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2 U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(
        SUM[14]) );
  ADDFX2 U1_15 ( .A(A[15]), .B(B[15]), .CI(carry[15]), .CO(SUM[16]), .S(
        SUM[15]) );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFX2 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFX2 U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  ADDFX2 U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(
        SUM[12]) );
  ADDFX2 U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(
        SUM[13]) );
  ADDFX2 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFX2 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  AND2X1 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module SNN_DW01_add_21_DW01_add_6 ( A, B, CI, SUM, CO );
  input [18:0] A;
  input [18:0] B;
  output [18:0] SUM;
  input CI;
  output CO;
  wire   carry_16_, carry_15_, carry_14_, carry_13_, carry_12_, carry_11_,
         carry_10_, carry_9_, carry_8_, carry_7_, carry_6_, carry_5_, carry_4_,
         carry_3_, carry_2_, n1;

  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry_2_), .S(SUM[1]) );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry_2_), .CO(carry_3_), .S(SUM[2])
         );
  ADDFX2 U1_14 ( .A(A[14]), .B(B[14]), .CI(carry_14_), .CO(carry_15_), .S(
        SUM[14]) );
  ADDFX2 U1_16 ( .A(A[16]), .B(B[16]), .CI(carry_16_), .CO(SUM[17]), .S(
        SUM[16]) );
  ADDFX2 U1_15 ( .A(A[15]), .B(B[15]), .CI(carry_15_), .CO(carry_16_), .S(
        SUM[15]) );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry_3_), .CO(carry_4_), .S(SUM[3])
         );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry_4_), .CO(carry_5_), .S(SUM[4])
         );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry_5_), .CO(carry_6_), .S(SUM[5])
         );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry_6_), .CO(carry_7_), .S(SUM[6])
         );
  ADDFX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry_7_), .CO(carry_8_), .S(SUM[7])
         );
  ADDFX2 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry_10_), .CO(carry_11_), .S(
        SUM[10]) );
  ADDFX2 U1_11 ( .A(A[11]), .B(B[11]), .CI(carry_11_), .CO(carry_12_), .S(
        SUM[11]) );
  ADDFX2 U1_12 ( .A(A[12]), .B(B[12]), .CI(carry_12_), .CO(carry_13_), .S(
        SUM[12]) );
  ADDFX2 U1_13 ( .A(A[13]), .B(B[13]), .CI(carry_13_), .CO(carry_14_), .S(
        SUM[13]) );
  ADDFX2 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry_8_), .CO(carry_9_), .S(SUM[8])
         );
  ADDFX2 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry_9_), .CO(carry_10_), .S(SUM[9])
         );
  AND2X1 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module SNN_DW01_add_22_DW01_add_7 ( A, B, CI, SUM, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [15:2] carry;

  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2 U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(
        SUM[14]) );
  ADDFX2 U1_15 ( .A(A[15]), .B(B[15]), .CI(carry[15]), .CO(SUM[16]), .S(
        SUM[15]) );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFX2 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFX2 U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  ADDFX2 U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(
        SUM[12]) );
  ADDFX2 U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(
        SUM[13]) );
  ADDFX2 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFX2 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  AND2X1 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module SNN_DW01_add_23_DW01_add_8 ( A, B, CI, SUM, CO );
  input [18:0] A;
  input [18:0] B;
  output [18:0] SUM;
  input CI;
  output CO;
  wire   n2;
  wire   [16:2] carry;

  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n2), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2 U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(
        SUM[14]) );
  ADDFX2 U1_15 ( .A(A[15]), .B(B[15]), .CI(carry[15]), .CO(carry[16]), .S(
        SUM[15]) );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFX2 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFX2 U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  ADDFX2 U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(
        SUM[12]) );
  ADDFX2 U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(
        SUM[13]) );
  ADDFX2 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFX2 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  AND2X1 U1 ( .A(B[16]), .B(carry[16]), .Y(SUM[17]) );
  AND2X1 U2 ( .A(B[0]), .B(A[0]), .Y(n2) );
  XOR2X1 U3 ( .A(B[16]), .B(carry[16]), .Y(SUM[16]) );
  XOR2X1 U4 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module SNN_DW01_add_24_DW01_add_9 ( A, B, CI, SUM, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [15:2] carry;

  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2 U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(
        SUM[14]) );
  ADDFX2 U1_15 ( .A(A[15]), .B(B[15]), .CI(carry[15]), .CO(SUM[16]), .S(
        SUM[15]) );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFX2 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFX2 U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  ADDFX2 U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(
        SUM[12]) );
  ADDFX2 U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(
        SUM[13]) );
  ADDFX2 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFX2 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  AND2X1 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module SNN_DW_mult_uns_2 ( a, b, product );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215;

  ADDFX2 U2 ( .A(n15), .B(n85), .CI(n2), .CO(product[15]), .S(product[14]) );
  ADDFX2 U3 ( .A(n18), .B(n16), .CI(n3), .CO(n2), .S(product[13]) );
  ADDFX2 U4 ( .A(n21), .B(n19), .CI(n4), .CO(n3), .S(product[12]) );
  ADDFX2 U5 ( .A(n26), .B(n22), .CI(n5), .CO(n4), .S(product[11]) );
  ADDFX2 U6 ( .A(n27), .B(n32), .CI(n6), .CO(n5), .S(product[10]) );
  ADDFX2 U7 ( .A(n33), .B(n40), .CI(n7), .CO(n6), .S(product[9]) );
  ADDFX2 U8 ( .A(n41), .B(n50), .CI(n8), .CO(n7), .S(product[8]) );
  ADDFX2 U9 ( .A(n51), .B(n60), .CI(n9), .CO(n8), .S(product[7]) );
  ADDFX2 U10 ( .A(n61), .B(n68), .CI(n10), .CO(n9), .S(product[6]) );
  ADDFX2 U11 ( .A(n69), .B(n75), .CI(n11), .CO(n10), .S(product[5]) );
  ADDFX2 U12 ( .A(n76), .B(n79), .CI(n12), .CO(n11), .S(product[4]) );
  ADDFX2 U13 ( .A(n80), .B(n82), .CI(n13), .CO(n12), .S(product[3]) );
  ADDFX2 U14 ( .A(n14), .B(n132), .CI(n84), .CO(n13), .S(product[2]) );
  ADDHXL U15 ( .A(n140), .B(n147), .CO(n14), .S(product[1]) );
  ADDFX2 U16 ( .A(n86), .B(n93), .CI(n17), .CO(n15), .S(n16) );
  CMPR42X1 U17 ( .A(n101), .B(n87), .C(n94), .D(n23), .ICI(n20), .S(n19), 
        .ICO(n17), .CO(n18) );
  CMPR42X1 U18 ( .A(n95), .B(n28), .C(n24), .D(n29), .ICI(n25), .S(n22), .ICO(
        n20), .CO(n21) );
  ADDFX2 U19 ( .A(n102), .B(n109), .CI(n88), .CO(n23), .S(n24) );
  CMPR42X1 U20 ( .A(n96), .B(n34), .C(n35), .D(n30), .ICI(n31), .S(n27), .ICO(
        n25), .CO(n26) );
  CMPR42X1 U21 ( .A(n103), .B(n89), .C(n117), .D(n110), .ICI(n37), .S(n30), 
        .ICO(n28), .CO(n29) );
  CMPR42X1 U22 ( .A(n42), .B(n38), .C(n43), .D(n36), .ICI(n39), .S(n33), .ICO(
        n31), .CO(n32) );
  CMPR42X1 U23 ( .A(n104), .B(n118), .C(n111), .D(n97), .ICI(n45), .S(n36), 
        .ICO(n34), .CO(n35) );
  ADDFX2 U24 ( .A(n90), .B(n125), .CI(n47), .CO(n37), .S(n38) );
  CMPR42X1 U25 ( .A(n48), .B(n46), .C(n49), .D(n53), .ICI(n44), .S(n41), .ICO(
        n39), .CO(n40) );
  CMPR42X1 U26 ( .A(n126), .B(n105), .C(n119), .D(n52), .ICI(n55), .S(n44), 
        .ICO(n42), .CO(n43) );
  ADDFX2 U27 ( .A(n133), .B(n112), .CI(n57), .CO(n45), .S(n46) );
  ADDHXL U28 ( .A(n98), .B(n91), .CO(n47), .S(n48) );
  CMPR42X1 U29 ( .A(n62), .B(n58), .C(n59), .D(n63), .ICI(n54), .S(n51), .ICO(
        n49), .CO(n50) );
  CMPR42X1 U30 ( .A(n134), .B(n113), .C(n120), .D(n127), .ICI(n56), .S(n54), 
        .ICO(n52), .CO(n53) );
  ADDFX2 U31 ( .A(n106), .B(n141), .CI(n65), .CO(n55), .S(n56) );
  ADDHXL U32 ( .A(n99), .B(n92), .CO(n57), .S(n58) );
  CMPR42X1 U33 ( .A(n128), .B(n121), .C(n66), .D(n70), .ICI(n64), .S(n61), 
        .ICO(n59), .CO(n60) );
  CMPR42X1 U34 ( .A(n142), .B(n114), .C(n135), .D(n72), .ICI(n67), .S(n64), 
        .ICO(n62), .CO(n63) );
  ADDHXL U35 ( .A(n107), .B(n100), .CO(n65), .S(n66) );
  CMPR42X1 U36 ( .A(n136), .B(n129), .C(n74), .D(n73), .ICI(n71), .S(n69), 
        .ICO(n67), .CO(n68) );
  ADDFX2 U37 ( .A(n122), .B(n143), .CI(n77), .CO(n70), .S(n71) );
  ADDHXL U38 ( .A(n115), .B(n108), .CO(n72), .S(n73) );
  CMPR42X1 U39 ( .A(n144), .B(n130), .C(n137), .D(n81), .ICI(n78), .S(n76), 
        .ICO(n74), .CO(n75) );
  ADDHXL U40 ( .A(n123), .B(n116), .CO(n77), .S(n78) );
  ADDFX2 U41 ( .A(n138), .B(n145), .CI(n83), .CO(n79), .S(n80) );
  ADDHXL U42 ( .A(n131), .B(n124), .CO(n81), .S(n82) );
  ADDHXL U43 ( .A(n146), .B(n139), .CO(n83), .S(n84) );
  INVX2 U126 ( .A(b[4]), .Y(n212) );
  INVX2 U127 ( .A(b[3]), .Y(n211) );
  INVX2 U128 ( .A(b[2]), .Y(n210) );
  INVX2 U129 ( .A(b[0]), .Y(n208) );
  INVX2 U130 ( .A(b[1]), .Y(n209) );
  INVX2 U131 ( .A(b[6]), .Y(n214) );
  INVX2 U132 ( .A(b[5]), .Y(n213) );
  INVX2 U133 ( .A(b[7]), .Y(n215) );
  INVX2 U134 ( .A(a[0]), .Y(n200) );
  INVX2 U135 ( .A(a[2]), .Y(n202) );
  INVX2 U136 ( .A(a[3]), .Y(n203) );
  INVX2 U137 ( .A(a[1]), .Y(n201) );
  INVX2 U138 ( .A(a[4]), .Y(n204) );
  INVX2 U139 ( .A(a[5]), .Y(n205) );
  INVX2 U140 ( .A(a[6]), .Y(n206) );
  INVX2 U141 ( .A(a[7]), .Y(n207) );
  NOR2X1 U142 ( .A(n200), .B(n208), .Y(product[0]) );
  NOR2X1 U143 ( .A(n206), .B(n209), .Y(n99) );
  NOR2X1 U144 ( .A(n206), .B(n210), .Y(n98) );
  NOR2X1 U145 ( .A(n206), .B(n211), .Y(n97) );
  NOR2X1 U146 ( .A(n206), .B(n212), .Y(n96) );
  NOR2X1 U147 ( .A(n206), .B(n213), .Y(n95) );
  NOR2X1 U148 ( .A(n206), .B(n214), .Y(n94) );
  NOR2X1 U149 ( .A(n206), .B(n215), .Y(n93) );
  NOR2X1 U150 ( .A(n208), .B(n207), .Y(n92) );
  NOR2X1 U151 ( .A(n209), .B(n207), .Y(n91) );
  NOR2X1 U152 ( .A(n210), .B(n207), .Y(n90) );
  NOR2X1 U153 ( .A(n211), .B(n207), .Y(n89) );
  NOR2X1 U154 ( .A(n212), .B(n207), .Y(n88) );
  NOR2X1 U155 ( .A(n213), .B(n207), .Y(n87) );
  NOR2X1 U156 ( .A(n214), .B(n207), .Y(n86) );
  NOR2X1 U157 ( .A(n215), .B(n207), .Y(n85) );
  NOR2X1 U158 ( .A(n200), .B(n209), .Y(n147) );
  NOR2X1 U159 ( .A(n200), .B(n210), .Y(n146) );
  NOR2X1 U160 ( .A(n200), .B(n211), .Y(n145) );
  NOR2X1 U161 ( .A(n200), .B(n212), .Y(n144) );
  NOR2X1 U162 ( .A(n200), .B(n213), .Y(n143) );
  NOR2X1 U163 ( .A(n200), .B(n214), .Y(n142) );
  NOR2X1 U164 ( .A(n200), .B(n215), .Y(n141) );
  NOR2X1 U165 ( .A(n208), .B(n201), .Y(n140) );
  NOR2X1 U166 ( .A(n209), .B(n201), .Y(n139) );
  NOR2X1 U167 ( .A(n210), .B(n201), .Y(n138) );
  NOR2X1 U168 ( .A(n211), .B(n201), .Y(n137) );
  NOR2X1 U169 ( .A(n212), .B(n201), .Y(n136) );
  NOR2X1 U170 ( .A(n213), .B(n201), .Y(n135) );
  NOR2X1 U171 ( .A(n214), .B(n201), .Y(n134) );
  NOR2X1 U172 ( .A(n215), .B(n201), .Y(n133) );
  NOR2X1 U173 ( .A(n208), .B(n202), .Y(n132) );
  NOR2X1 U174 ( .A(n209), .B(n202), .Y(n131) );
  NOR2X1 U175 ( .A(n210), .B(n202), .Y(n130) );
  NOR2X1 U176 ( .A(n211), .B(n202), .Y(n129) );
  NOR2X1 U177 ( .A(n212), .B(n202), .Y(n128) );
  NOR2X1 U178 ( .A(n213), .B(n202), .Y(n127) );
  NOR2X1 U179 ( .A(n214), .B(n202), .Y(n126) );
  NOR2X1 U180 ( .A(n215), .B(n202), .Y(n125) );
  NOR2X1 U181 ( .A(n208), .B(n203), .Y(n124) );
  NOR2X1 U182 ( .A(n209), .B(n203), .Y(n123) );
  NOR2X1 U183 ( .A(n210), .B(n203), .Y(n122) );
  NOR2X1 U184 ( .A(n211), .B(n203), .Y(n121) );
  NOR2X1 U185 ( .A(n212), .B(n203), .Y(n120) );
  NOR2X1 U186 ( .A(n213), .B(n203), .Y(n119) );
  NOR2X1 U187 ( .A(n214), .B(n203), .Y(n118) );
  NOR2X1 U188 ( .A(n215), .B(n203), .Y(n117) );
  NOR2X1 U189 ( .A(n208), .B(n204), .Y(n116) );
  NOR2X1 U190 ( .A(n209), .B(n204), .Y(n115) );
  NOR2X1 U191 ( .A(n210), .B(n204), .Y(n114) );
  NOR2X1 U192 ( .A(n211), .B(n204), .Y(n113) );
  NOR2X1 U193 ( .A(n212), .B(n204), .Y(n112) );
  NOR2X1 U194 ( .A(n213), .B(n204), .Y(n111) );
  NOR2X1 U195 ( .A(n214), .B(n204), .Y(n110) );
  NOR2X1 U196 ( .A(n215), .B(n204), .Y(n109) );
  NOR2X1 U197 ( .A(n208), .B(n205), .Y(n108) );
  NOR2X1 U198 ( .A(n209), .B(n205), .Y(n107) );
  NOR2X1 U199 ( .A(n210), .B(n205), .Y(n106) );
  NOR2X1 U200 ( .A(n211), .B(n205), .Y(n105) );
  NOR2X1 U201 ( .A(n212), .B(n205), .Y(n104) );
  NOR2X1 U202 ( .A(n213), .B(n205), .Y(n103) );
  NOR2X1 U203 ( .A(n214), .B(n205), .Y(n102) );
  NOR2X1 U204 ( .A(n215), .B(n205), .Y(n101) );
  NOR2X1 U205 ( .A(n208), .B(n206), .Y(n100) );
endmodule


module SNN_DW_mult_uns_3 ( a, b, product );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215;

  ADDFX2 U2 ( .A(n15), .B(n85), .CI(n2), .CO(product[15]), .S(product[14]) );
  ADDFX2 U3 ( .A(n18), .B(n16), .CI(n3), .CO(n2), .S(product[13]) );
  ADDFX2 U4 ( .A(n21), .B(n19), .CI(n4), .CO(n3), .S(product[12]) );
  ADDFX2 U5 ( .A(n26), .B(n22), .CI(n5), .CO(n4), .S(product[11]) );
  ADDFX2 U6 ( .A(n27), .B(n32), .CI(n6), .CO(n5), .S(product[10]) );
  ADDFX2 U7 ( .A(n33), .B(n40), .CI(n7), .CO(n6), .S(product[9]) );
  ADDFX2 U8 ( .A(n41), .B(n50), .CI(n8), .CO(n7), .S(product[8]) );
  ADDFX2 U9 ( .A(n51), .B(n60), .CI(n9), .CO(n8), .S(product[7]) );
  ADDFX2 U10 ( .A(n61), .B(n68), .CI(n10), .CO(n9), .S(product[6]) );
  ADDFX2 U11 ( .A(n69), .B(n75), .CI(n11), .CO(n10), .S(product[5]) );
  ADDFX2 U12 ( .A(n76), .B(n79), .CI(n12), .CO(n11), .S(product[4]) );
  ADDFX2 U13 ( .A(n80), .B(n82), .CI(n13), .CO(n12), .S(product[3]) );
  ADDFX2 U14 ( .A(n14), .B(n132), .CI(n84), .CO(n13), .S(product[2]) );
  ADDHXL U15 ( .A(n140), .B(n147), .CO(n14), .S(product[1]) );
  ADDFX2 U16 ( .A(n86), .B(n93), .CI(n17), .CO(n15), .S(n16) );
  CMPR42X1 U17 ( .A(n101), .B(n87), .C(n94), .D(n23), .ICI(n20), .S(n19), 
        .ICO(n17), .CO(n18) );
  CMPR42X1 U18 ( .A(n95), .B(n28), .C(n24), .D(n29), .ICI(n25), .S(n22), .ICO(
        n20), .CO(n21) );
  ADDFX2 U19 ( .A(n102), .B(n109), .CI(n88), .CO(n23), .S(n24) );
  CMPR42X1 U20 ( .A(n96), .B(n34), .C(n35), .D(n30), .ICI(n31), .S(n27), .ICO(
        n25), .CO(n26) );
  CMPR42X1 U21 ( .A(n103), .B(n89), .C(n117), .D(n110), .ICI(n37), .S(n30), 
        .ICO(n28), .CO(n29) );
  CMPR42X1 U22 ( .A(n42), .B(n38), .C(n43), .D(n36), .ICI(n39), .S(n33), .ICO(
        n31), .CO(n32) );
  CMPR42X1 U23 ( .A(n104), .B(n118), .C(n111), .D(n97), .ICI(n45), .S(n36), 
        .ICO(n34), .CO(n35) );
  ADDFX2 U24 ( .A(n90), .B(n125), .CI(n47), .CO(n37), .S(n38) );
  CMPR42X1 U25 ( .A(n48), .B(n46), .C(n49), .D(n53), .ICI(n44), .S(n41), .ICO(
        n39), .CO(n40) );
  CMPR42X1 U26 ( .A(n126), .B(n105), .C(n119), .D(n52), .ICI(n55), .S(n44), 
        .ICO(n42), .CO(n43) );
  ADDFX2 U27 ( .A(n133), .B(n112), .CI(n57), .CO(n45), .S(n46) );
  ADDHXL U28 ( .A(n98), .B(n91), .CO(n47), .S(n48) );
  CMPR42X1 U29 ( .A(n62), .B(n58), .C(n59), .D(n63), .ICI(n54), .S(n51), .ICO(
        n49), .CO(n50) );
  CMPR42X1 U30 ( .A(n134), .B(n113), .C(n120), .D(n127), .ICI(n56), .S(n54), 
        .ICO(n52), .CO(n53) );
  ADDFX2 U31 ( .A(n106), .B(n141), .CI(n65), .CO(n55), .S(n56) );
  ADDHXL U32 ( .A(n99), .B(n92), .CO(n57), .S(n58) );
  CMPR42X1 U33 ( .A(n128), .B(n121), .C(n66), .D(n70), .ICI(n64), .S(n61), 
        .ICO(n59), .CO(n60) );
  CMPR42X1 U34 ( .A(n142), .B(n114), .C(n135), .D(n72), .ICI(n67), .S(n64), 
        .ICO(n62), .CO(n63) );
  ADDHXL U35 ( .A(n107), .B(n100), .CO(n65), .S(n66) );
  CMPR42X1 U36 ( .A(n136), .B(n129), .C(n74), .D(n73), .ICI(n71), .S(n69), 
        .ICO(n67), .CO(n68) );
  ADDFX2 U37 ( .A(n122), .B(n143), .CI(n77), .CO(n70), .S(n71) );
  ADDHXL U38 ( .A(n115), .B(n108), .CO(n72), .S(n73) );
  CMPR42X1 U39 ( .A(n144), .B(n130), .C(n137), .D(n81), .ICI(n78), .S(n76), 
        .ICO(n74), .CO(n75) );
  ADDHXL U40 ( .A(n123), .B(n116), .CO(n77), .S(n78) );
  ADDFX2 U41 ( .A(n138), .B(n145), .CI(n83), .CO(n79), .S(n80) );
  ADDHXL U42 ( .A(n131), .B(n124), .CO(n81), .S(n82) );
  ADDHXL U43 ( .A(n146), .B(n139), .CO(n83), .S(n84) );
  INVX2 U126 ( .A(b[4]), .Y(n212) );
  INVX2 U127 ( .A(b[3]), .Y(n211) );
  INVX2 U128 ( .A(b[2]), .Y(n210) );
  INVX2 U129 ( .A(b[0]), .Y(n208) );
  INVX2 U130 ( .A(b[1]), .Y(n209) );
  INVX2 U131 ( .A(b[6]), .Y(n214) );
  INVX2 U132 ( .A(b[5]), .Y(n213) );
  INVX2 U133 ( .A(b[7]), .Y(n215) );
  INVX2 U134 ( .A(a[0]), .Y(n200) );
  INVX2 U135 ( .A(a[2]), .Y(n202) );
  INVX2 U136 ( .A(a[3]), .Y(n203) );
  INVX2 U137 ( .A(a[1]), .Y(n201) );
  INVX2 U138 ( .A(a[4]), .Y(n204) );
  INVX2 U139 ( .A(a[5]), .Y(n205) );
  INVX2 U140 ( .A(a[6]), .Y(n206) );
  INVX2 U141 ( .A(a[7]), .Y(n207) );
  NOR2X1 U142 ( .A(n200), .B(n208), .Y(product[0]) );
  NOR2X1 U143 ( .A(n206), .B(n209), .Y(n99) );
  NOR2X1 U144 ( .A(n206), .B(n210), .Y(n98) );
  NOR2X1 U145 ( .A(n206), .B(n211), .Y(n97) );
  NOR2X1 U146 ( .A(n206), .B(n212), .Y(n96) );
  NOR2X1 U147 ( .A(n206), .B(n213), .Y(n95) );
  NOR2X1 U148 ( .A(n206), .B(n214), .Y(n94) );
  NOR2X1 U149 ( .A(n206), .B(n215), .Y(n93) );
  NOR2X1 U150 ( .A(n208), .B(n207), .Y(n92) );
  NOR2X1 U151 ( .A(n209), .B(n207), .Y(n91) );
  NOR2X1 U152 ( .A(n210), .B(n207), .Y(n90) );
  NOR2X1 U153 ( .A(n211), .B(n207), .Y(n89) );
  NOR2X1 U154 ( .A(n212), .B(n207), .Y(n88) );
  NOR2X1 U155 ( .A(n213), .B(n207), .Y(n87) );
  NOR2X1 U156 ( .A(n214), .B(n207), .Y(n86) );
  NOR2X1 U157 ( .A(n215), .B(n207), .Y(n85) );
  NOR2X1 U158 ( .A(n200), .B(n209), .Y(n147) );
  NOR2X1 U159 ( .A(n200), .B(n210), .Y(n146) );
  NOR2X1 U160 ( .A(n200), .B(n211), .Y(n145) );
  NOR2X1 U161 ( .A(n200), .B(n212), .Y(n144) );
  NOR2X1 U162 ( .A(n200), .B(n213), .Y(n143) );
  NOR2X1 U163 ( .A(n200), .B(n214), .Y(n142) );
  NOR2X1 U164 ( .A(n200), .B(n215), .Y(n141) );
  NOR2X1 U165 ( .A(n208), .B(n201), .Y(n140) );
  NOR2X1 U166 ( .A(n209), .B(n201), .Y(n139) );
  NOR2X1 U167 ( .A(n210), .B(n201), .Y(n138) );
  NOR2X1 U168 ( .A(n211), .B(n201), .Y(n137) );
  NOR2X1 U169 ( .A(n212), .B(n201), .Y(n136) );
  NOR2X1 U170 ( .A(n213), .B(n201), .Y(n135) );
  NOR2X1 U171 ( .A(n214), .B(n201), .Y(n134) );
  NOR2X1 U172 ( .A(n215), .B(n201), .Y(n133) );
  NOR2X1 U173 ( .A(n208), .B(n202), .Y(n132) );
  NOR2X1 U174 ( .A(n209), .B(n202), .Y(n131) );
  NOR2X1 U175 ( .A(n210), .B(n202), .Y(n130) );
  NOR2X1 U176 ( .A(n211), .B(n202), .Y(n129) );
  NOR2X1 U177 ( .A(n212), .B(n202), .Y(n128) );
  NOR2X1 U178 ( .A(n213), .B(n202), .Y(n127) );
  NOR2X1 U179 ( .A(n214), .B(n202), .Y(n126) );
  NOR2X1 U180 ( .A(n215), .B(n202), .Y(n125) );
  NOR2X1 U181 ( .A(n208), .B(n203), .Y(n124) );
  NOR2X1 U182 ( .A(n209), .B(n203), .Y(n123) );
  NOR2X1 U183 ( .A(n210), .B(n203), .Y(n122) );
  NOR2X1 U184 ( .A(n211), .B(n203), .Y(n121) );
  NOR2X1 U185 ( .A(n212), .B(n203), .Y(n120) );
  NOR2X1 U186 ( .A(n213), .B(n203), .Y(n119) );
  NOR2X1 U187 ( .A(n214), .B(n203), .Y(n118) );
  NOR2X1 U188 ( .A(n215), .B(n203), .Y(n117) );
  NOR2X1 U189 ( .A(n208), .B(n204), .Y(n116) );
  NOR2X1 U190 ( .A(n209), .B(n204), .Y(n115) );
  NOR2X1 U191 ( .A(n210), .B(n204), .Y(n114) );
  NOR2X1 U192 ( .A(n211), .B(n204), .Y(n113) );
  NOR2X1 U193 ( .A(n212), .B(n204), .Y(n112) );
  NOR2X1 U194 ( .A(n213), .B(n204), .Y(n111) );
  NOR2X1 U195 ( .A(n214), .B(n204), .Y(n110) );
  NOR2X1 U196 ( .A(n215), .B(n204), .Y(n109) );
  NOR2X1 U197 ( .A(n208), .B(n205), .Y(n108) );
  NOR2X1 U198 ( .A(n209), .B(n205), .Y(n107) );
  NOR2X1 U199 ( .A(n210), .B(n205), .Y(n106) );
  NOR2X1 U200 ( .A(n211), .B(n205), .Y(n105) );
  NOR2X1 U201 ( .A(n212), .B(n205), .Y(n104) );
  NOR2X1 U202 ( .A(n213), .B(n205), .Y(n103) );
  NOR2X1 U203 ( .A(n214), .B(n205), .Y(n102) );
  NOR2X1 U204 ( .A(n215), .B(n205), .Y(n101) );
  NOR2X1 U205 ( .A(n208), .B(n206), .Y(n100) );
endmodule


module SNN_DW_mult_uns_4 ( a, b, product );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215;

  ADDFX2 U2 ( .A(n15), .B(n85), .CI(n2), .CO(product[15]), .S(product[14]) );
  ADDFX2 U3 ( .A(n18), .B(n16), .CI(n3), .CO(n2), .S(product[13]) );
  ADDFX2 U4 ( .A(n21), .B(n19), .CI(n4), .CO(n3), .S(product[12]) );
  ADDFX2 U5 ( .A(n26), .B(n22), .CI(n5), .CO(n4), .S(product[11]) );
  ADDFX2 U6 ( .A(n27), .B(n32), .CI(n6), .CO(n5), .S(product[10]) );
  ADDFX2 U7 ( .A(n33), .B(n40), .CI(n7), .CO(n6), .S(product[9]) );
  ADDFX2 U8 ( .A(n41), .B(n50), .CI(n8), .CO(n7), .S(product[8]) );
  ADDFX2 U9 ( .A(n51), .B(n60), .CI(n9), .CO(n8), .S(product[7]) );
  ADDFX2 U10 ( .A(n61), .B(n68), .CI(n10), .CO(n9), .S(product[6]) );
  ADDFX2 U11 ( .A(n69), .B(n75), .CI(n11), .CO(n10), .S(product[5]) );
  ADDFX2 U12 ( .A(n76), .B(n79), .CI(n12), .CO(n11), .S(product[4]) );
  ADDFX2 U13 ( .A(n80), .B(n82), .CI(n13), .CO(n12), .S(product[3]) );
  ADDFX2 U14 ( .A(n14), .B(n132), .CI(n84), .CO(n13), .S(product[2]) );
  ADDHXL U15 ( .A(n140), .B(n147), .CO(n14), .S(product[1]) );
  ADDFX2 U16 ( .A(n86), .B(n93), .CI(n17), .CO(n15), .S(n16) );
  CMPR42X1 U17 ( .A(n101), .B(n87), .C(n94), .D(n23), .ICI(n20), .S(n19), 
        .ICO(n17), .CO(n18) );
  CMPR42X1 U18 ( .A(n95), .B(n28), .C(n24), .D(n29), .ICI(n25), .S(n22), .ICO(
        n20), .CO(n21) );
  ADDFX2 U19 ( .A(n102), .B(n109), .CI(n88), .CO(n23), .S(n24) );
  CMPR42X1 U20 ( .A(n96), .B(n34), .C(n35), .D(n30), .ICI(n31), .S(n27), .ICO(
        n25), .CO(n26) );
  CMPR42X1 U21 ( .A(n103), .B(n89), .C(n117), .D(n110), .ICI(n37), .S(n30), 
        .ICO(n28), .CO(n29) );
  CMPR42X1 U22 ( .A(n42), .B(n38), .C(n43), .D(n36), .ICI(n39), .S(n33), .ICO(
        n31), .CO(n32) );
  CMPR42X1 U23 ( .A(n104), .B(n118), .C(n111), .D(n97), .ICI(n45), .S(n36), 
        .ICO(n34), .CO(n35) );
  ADDFX2 U24 ( .A(n90), .B(n125), .CI(n47), .CO(n37), .S(n38) );
  CMPR42X1 U25 ( .A(n48), .B(n46), .C(n49), .D(n53), .ICI(n44), .S(n41), .ICO(
        n39), .CO(n40) );
  CMPR42X1 U26 ( .A(n126), .B(n105), .C(n119), .D(n52), .ICI(n55), .S(n44), 
        .ICO(n42), .CO(n43) );
  ADDFX2 U27 ( .A(n133), .B(n112), .CI(n57), .CO(n45), .S(n46) );
  ADDHXL U28 ( .A(n98), .B(n91), .CO(n47), .S(n48) );
  CMPR42X1 U29 ( .A(n62), .B(n58), .C(n59), .D(n63), .ICI(n54), .S(n51), .ICO(
        n49), .CO(n50) );
  CMPR42X1 U30 ( .A(n134), .B(n113), .C(n120), .D(n127), .ICI(n56), .S(n54), 
        .ICO(n52), .CO(n53) );
  ADDFX2 U31 ( .A(n106), .B(n141), .CI(n65), .CO(n55), .S(n56) );
  ADDHXL U32 ( .A(n99), .B(n92), .CO(n57), .S(n58) );
  CMPR42X1 U33 ( .A(n128), .B(n121), .C(n66), .D(n70), .ICI(n64), .S(n61), 
        .ICO(n59), .CO(n60) );
  CMPR42X1 U34 ( .A(n142), .B(n114), .C(n135), .D(n72), .ICI(n67), .S(n64), 
        .ICO(n62), .CO(n63) );
  ADDHXL U35 ( .A(n107), .B(n100), .CO(n65), .S(n66) );
  CMPR42X1 U36 ( .A(n136), .B(n129), .C(n74), .D(n73), .ICI(n71), .S(n69), 
        .ICO(n67), .CO(n68) );
  ADDFX2 U37 ( .A(n122), .B(n143), .CI(n77), .CO(n70), .S(n71) );
  ADDHXL U38 ( .A(n115), .B(n108), .CO(n72), .S(n73) );
  CMPR42X1 U39 ( .A(n144), .B(n130), .C(n137), .D(n81), .ICI(n78), .S(n76), 
        .ICO(n74), .CO(n75) );
  ADDHXL U40 ( .A(n123), .B(n116), .CO(n77), .S(n78) );
  ADDFX2 U41 ( .A(n138), .B(n145), .CI(n83), .CO(n79), .S(n80) );
  ADDHXL U42 ( .A(n131), .B(n124), .CO(n81), .S(n82) );
  ADDHXL U43 ( .A(n146), .B(n139), .CO(n83), .S(n84) );
  INVX2 U126 ( .A(b[4]), .Y(n212) );
  INVX2 U127 ( .A(b[3]), .Y(n211) );
  INVX2 U128 ( .A(b[2]), .Y(n210) );
  INVX2 U129 ( .A(b[0]), .Y(n208) );
  INVX2 U130 ( .A(b[1]), .Y(n209) );
  INVX2 U131 ( .A(b[6]), .Y(n214) );
  INVX2 U132 ( .A(b[5]), .Y(n213) );
  INVX2 U133 ( .A(b[7]), .Y(n215) );
  INVX2 U134 ( .A(a[0]), .Y(n200) );
  INVX2 U135 ( .A(a[2]), .Y(n202) );
  INVX2 U136 ( .A(a[3]), .Y(n203) );
  INVX2 U137 ( .A(a[1]), .Y(n201) );
  INVX2 U138 ( .A(a[4]), .Y(n204) );
  INVX2 U139 ( .A(a[5]), .Y(n205) );
  INVX2 U140 ( .A(a[6]), .Y(n206) );
  INVX2 U141 ( .A(a[7]), .Y(n207) );
  NOR2X1 U142 ( .A(n200), .B(n208), .Y(product[0]) );
  NOR2X1 U143 ( .A(n206), .B(n209), .Y(n99) );
  NOR2X1 U144 ( .A(n206), .B(n210), .Y(n98) );
  NOR2X1 U145 ( .A(n206), .B(n211), .Y(n97) );
  NOR2X1 U146 ( .A(n206), .B(n212), .Y(n96) );
  NOR2X1 U147 ( .A(n206), .B(n213), .Y(n95) );
  NOR2X1 U148 ( .A(n206), .B(n214), .Y(n94) );
  NOR2X1 U149 ( .A(n206), .B(n215), .Y(n93) );
  NOR2X1 U150 ( .A(n208), .B(n207), .Y(n92) );
  NOR2X1 U151 ( .A(n209), .B(n207), .Y(n91) );
  NOR2X1 U152 ( .A(n210), .B(n207), .Y(n90) );
  NOR2X1 U153 ( .A(n211), .B(n207), .Y(n89) );
  NOR2X1 U154 ( .A(n212), .B(n207), .Y(n88) );
  NOR2X1 U155 ( .A(n213), .B(n207), .Y(n87) );
  NOR2X1 U156 ( .A(n214), .B(n207), .Y(n86) );
  NOR2X1 U157 ( .A(n215), .B(n207), .Y(n85) );
  NOR2X1 U158 ( .A(n200), .B(n209), .Y(n147) );
  NOR2X1 U159 ( .A(n200), .B(n210), .Y(n146) );
  NOR2X1 U160 ( .A(n200), .B(n211), .Y(n145) );
  NOR2X1 U161 ( .A(n200), .B(n212), .Y(n144) );
  NOR2X1 U162 ( .A(n200), .B(n213), .Y(n143) );
  NOR2X1 U163 ( .A(n200), .B(n214), .Y(n142) );
  NOR2X1 U164 ( .A(n200), .B(n215), .Y(n141) );
  NOR2X1 U165 ( .A(n208), .B(n201), .Y(n140) );
  NOR2X1 U166 ( .A(n209), .B(n201), .Y(n139) );
  NOR2X1 U167 ( .A(n210), .B(n201), .Y(n138) );
  NOR2X1 U168 ( .A(n211), .B(n201), .Y(n137) );
  NOR2X1 U169 ( .A(n212), .B(n201), .Y(n136) );
  NOR2X1 U170 ( .A(n213), .B(n201), .Y(n135) );
  NOR2X1 U171 ( .A(n214), .B(n201), .Y(n134) );
  NOR2X1 U172 ( .A(n215), .B(n201), .Y(n133) );
  NOR2X1 U173 ( .A(n208), .B(n202), .Y(n132) );
  NOR2X1 U174 ( .A(n209), .B(n202), .Y(n131) );
  NOR2X1 U175 ( .A(n210), .B(n202), .Y(n130) );
  NOR2X1 U176 ( .A(n211), .B(n202), .Y(n129) );
  NOR2X1 U177 ( .A(n212), .B(n202), .Y(n128) );
  NOR2X1 U178 ( .A(n213), .B(n202), .Y(n127) );
  NOR2X1 U179 ( .A(n214), .B(n202), .Y(n126) );
  NOR2X1 U180 ( .A(n215), .B(n202), .Y(n125) );
  NOR2X1 U181 ( .A(n208), .B(n203), .Y(n124) );
  NOR2X1 U182 ( .A(n209), .B(n203), .Y(n123) );
  NOR2X1 U183 ( .A(n210), .B(n203), .Y(n122) );
  NOR2X1 U184 ( .A(n211), .B(n203), .Y(n121) );
  NOR2X1 U185 ( .A(n212), .B(n203), .Y(n120) );
  NOR2X1 U186 ( .A(n213), .B(n203), .Y(n119) );
  NOR2X1 U187 ( .A(n214), .B(n203), .Y(n118) );
  NOR2X1 U188 ( .A(n215), .B(n203), .Y(n117) );
  NOR2X1 U189 ( .A(n208), .B(n204), .Y(n116) );
  NOR2X1 U190 ( .A(n209), .B(n204), .Y(n115) );
  NOR2X1 U191 ( .A(n210), .B(n204), .Y(n114) );
  NOR2X1 U192 ( .A(n211), .B(n204), .Y(n113) );
  NOR2X1 U193 ( .A(n212), .B(n204), .Y(n112) );
  NOR2X1 U194 ( .A(n213), .B(n204), .Y(n111) );
  NOR2X1 U195 ( .A(n214), .B(n204), .Y(n110) );
  NOR2X1 U196 ( .A(n215), .B(n204), .Y(n109) );
  NOR2X1 U197 ( .A(n208), .B(n205), .Y(n108) );
  NOR2X1 U198 ( .A(n209), .B(n205), .Y(n107) );
  NOR2X1 U199 ( .A(n210), .B(n205), .Y(n106) );
  NOR2X1 U200 ( .A(n211), .B(n205), .Y(n105) );
  NOR2X1 U201 ( .A(n212), .B(n205), .Y(n104) );
  NOR2X1 U202 ( .A(n213), .B(n205), .Y(n103) );
  NOR2X1 U203 ( .A(n214), .B(n205), .Y(n102) );
  NOR2X1 U204 ( .A(n215), .B(n205), .Y(n101) );
  NOR2X1 U205 ( .A(n208), .B(n206), .Y(n100) );
endmodule


module SNN_DW_mult_uns_5 ( a, b, product );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215;

  ADDFX2 U2 ( .A(n15), .B(n85), .CI(n2), .CO(product[15]), .S(product[14]) );
  ADDFX2 U3 ( .A(n18), .B(n16), .CI(n3), .CO(n2), .S(product[13]) );
  ADDFX2 U4 ( .A(n21), .B(n19), .CI(n4), .CO(n3), .S(product[12]) );
  ADDFX2 U5 ( .A(n26), .B(n22), .CI(n5), .CO(n4), .S(product[11]) );
  ADDFX2 U6 ( .A(n27), .B(n32), .CI(n6), .CO(n5), .S(product[10]) );
  ADDFX2 U7 ( .A(n33), .B(n40), .CI(n7), .CO(n6), .S(product[9]) );
  ADDFX2 U8 ( .A(n41), .B(n50), .CI(n8), .CO(n7), .S(product[8]) );
  ADDFX2 U9 ( .A(n51), .B(n60), .CI(n9), .CO(n8), .S(product[7]) );
  ADDFX2 U10 ( .A(n61), .B(n68), .CI(n10), .CO(n9), .S(product[6]) );
  ADDFX2 U11 ( .A(n69), .B(n75), .CI(n11), .CO(n10), .S(product[5]) );
  ADDFX2 U12 ( .A(n76), .B(n79), .CI(n12), .CO(n11), .S(product[4]) );
  ADDFX2 U13 ( .A(n80), .B(n82), .CI(n13), .CO(n12), .S(product[3]) );
  ADDFX2 U14 ( .A(n14), .B(n132), .CI(n84), .CO(n13), .S(product[2]) );
  ADDHXL U15 ( .A(n140), .B(n147), .CO(n14), .S(product[1]) );
  ADDFX2 U16 ( .A(n86), .B(n93), .CI(n17), .CO(n15), .S(n16) );
  CMPR42X1 U17 ( .A(n101), .B(n87), .C(n94), .D(n23), .ICI(n20), .S(n19), 
        .ICO(n17), .CO(n18) );
  CMPR42X1 U18 ( .A(n95), .B(n28), .C(n24), .D(n29), .ICI(n25), .S(n22), .ICO(
        n20), .CO(n21) );
  ADDFX2 U19 ( .A(n102), .B(n109), .CI(n88), .CO(n23), .S(n24) );
  CMPR42X1 U20 ( .A(n96), .B(n34), .C(n35), .D(n30), .ICI(n31), .S(n27), .ICO(
        n25), .CO(n26) );
  CMPR42X1 U21 ( .A(n103), .B(n89), .C(n117), .D(n110), .ICI(n37), .S(n30), 
        .ICO(n28), .CO(n29) );
  CMPR42X1 U22 ( .A(n42), .B(n38), .C(n43), .D(n36), .ICI(n39), .S(n33), .ICO(
        n31), .CO(n32) );
  CMPR42X1 U23 ( .A(n104), .B(n118), .C(n111), .D(n97), .ICI(n45), .S(n36), 
        .ICO(n34), .CO(n35) );
  ADDFX2 U24 ( .A(n90), .B(n125), .CI(n47), .CO(n37), .S(n38) );
  CMPR42X1 U25 ( .A(n48), .B(n46), .C(n49), .D(n53), .ICI(n44), .S(n41), .ICO(
        n39), .CO(n40) );
  CMPR42X1 U26 ( .A(n126), .B(n105), .C(n119), .D(n52), .ICI(n55), .S(n44), 
        .ICO(n42), .CO(n43) );
  ADDFX2 U27 ( .A(n133), .B(n112), .CI(n57), .CO(n45), .S(n46) );
  ADDHXL U28 ( .A(n98), .B(n91), .CO(n47), .S(n48) );
  CMPR42X1 U29 ( .A(n62), .B(n58), .C(n59), .D(n63), .ICI(n54), .S(n51), .ICO(
        n49), .CO(n50) );
  CMPR42X1 U30 ( .A(n134), .B(n113), .C(n120), .D(n127), .ICI(n56), .S(n54), 
        .ICO(n52), .CO(n53) );
  ADDFX2 U31 ( .A(n106), .B(n141), .CI(n65), .CO(n55), .S(n56) );
  ADDHXL U32 ( .A(n99), .B(n92), .CO(n57), .S(n58) );
  CMPR42X1 U33 ( .A(n128), .B(n121), .C(n66), .D(n70), .ICI(n64), .S(n61), 
        .ICO(n59), .CO(n60) );
  CMPR42X1 U34 ( .A(n142), .B(n114), .C(n135), .D(n72), .ICI(n67), .S(n64), 
        .ICO(n62), .CO(n63) );
  ADDHXL U35 ( .A(n107), .B(n100), .CO(n65), .S(n66) );
  CMPR42X1 U36 ( .A(n136), .B(n129), .C(n74), .D(n73), .ICI(n71), .S(n69), 
        .ICO(n67), .CO(n68) );
  ADDFX2 U37 ( .A(n122), .B(n143), .CI(n77), .CO(n70), .S(n71) );
  ADDHXL U38 ( .A(n115), .B(n108), .CO(n72), .S(n73) );
  CMPR42X1 U39 ( .A(n144), .B(n130), .C(n137), .D(n81), .ICI(n78), .S(n76), 
        .ICO(n74), .CO(n75) );
  ADDHXL U40 ( .A(n123), .B(n116), .CO(n77), .S(n78) );
  ADDFX2 U41 ( .A(n138), .B(n145), .CI(n83), .CO(n79), .S(n80) );
  ADDHXL U42 ( .A(n131), .B(n124), .CO(n81), .S(n82) );
  ADDHXL U43 ( .A(n146), .B(n139), .CO(n83), .S(n84) );
  INVX2 U126 ( .A(b[4]), .Y(n212) );
  INVX2 U127 ( .A(b[3]), .Y(n211) );
  INVX2 U128 ( .A(b[2]), .Y(n210) );
  INVX2 U129 ( .A(b[0]), .Y(n208) );
  INVX2 U130 ( .A(b[1]), .Y(n209) );
  INVX2 U131 ( .A(b[6]), .Y(n214) );
  INVX2 U132 ( .A(b[5]), .Y(n213) );
  INVX2 U133 ( .A(b[7]), .Y(n215) );
  INVX2 U134 ( .A(a[0]), .Y(n200) );
  INVX2 U135 ( .A(a[2]), .Y(n202) );
  INVX2 U136 ( .A(a[3]), .Y(n203) );
  INVX2 U137 ( .A(a[1]), .Y(n201) );
  INVX2 U138 ( .A(a[4]), .Y(n204) );
  INVX2 U139 ( .A(a[5]), .Y(n205) );
  INVX2 U140 ( .A(a[6]), .Y(n206) );
  INVX2 U141 ( .A(a[7]), .Y(n207) );
  NOR2X1 U142 ( .A(n200), .B(n208), .Y(product[0]) );
  NOR2X1 U143 ( .A(n206), .B(n209), .Y(n99) );
  NOR2X1 U144 ( .A(n206), .B(n210), .Y(n98) );
  NOR2X1 U145 ( .A(n206), .B(n211), .Y(n97) );
  NOR2X1 U146 ( .A(n206), .B(n212), .Y(n96) );
  NOR2X1 U147 ( .A(n206), .B(n213), .Y(n95) );
  NOR2X1 U148 ( .A(n206), .B(n214), .Y(n94) );
  NOR2X1 U149 ( .A(n206), .B(n215), .Y(n93) );
  NOR2X1 U150 ( .A(n208), .B(n207), .Y(n92) );
  NOR2X1 U151 ( .A(n209), .B(n207), .Y(n91) );
  NOR2X1 U152 ( .A(n210), .B(n207), .Y(n90) );
  NOR2X1 U153 ( .A(n211), .B(n207), .Y(n89) );
  NOR2X1 U154 ( .A(n212), .B(n207), .Y(n88) );
  NOR2X1 U155 ( .A(n213), .B(n207), .Y(n87) );
  NOR2X1 U156 ( .A(n214), .B(n207), .Y(n86) );
  NOR2X1 U157 ( .A(n215), .B(n207), .Y(n85) );
  NOR2X1 U158 ( .A(n200), .B(n209), .Y(n147) );
  NOR2X1 U159 ( .A(n200), .B(n210), .Y(n146) );
  NOR2X1 U160 ( .A(n200), .B(n211), .Y(n145) );
  NOR2X1 U161 ( .A(n200), .B(n212), .Y(n144) );
  NOR2X1 U162 ( .A(n200), .B(n213), .Y(n143) );
  NOR2X1 U163 ( .A(n200), .B(n214), .Y(n142) );
  NOR2X1 U164 ( .A(n200), .B(n215), .Y(n141) );
  NOR2X1 U165 ( .A(n208), .B(n201), .Y(n140) );
  NOR2X1 U166 ( .A(n209), .B(n201), .Y(n139) );
  NOR2X1 U167 ( .A(n210), .B(n201), .Y(n138) );
  NOR2X1 U168 ( .A(n211), .B(n201), .Y(n137) );
  NOR2X1 U169 ( .A(n212), .B(n201), .Y(n136) );
  NOR2X1 U170 ( .A(n213), .B(n201), .Y(n135) );
  NOR2X1 U171 ( .A(n214), .B(n201), .Y(n134) );
  NOR2X1 U172 ( .A(n215), .B(n201), .Y(n133) );
  NOR2X1 U173 ( .A(n208), .B(n202), .Y(n132) );
  NOR2X1 U174 ( .A(n209), .B(n202), .Y(n131) );
  NOR2X1 U175 ( .A(n210), .B(n202), .Y(n130) );
  NOR2X1 U176 ( .A(n211), .B(n202), .Y(n129) );
  NOR2X1 U177 ( .A(n212), .B(n202), .Y(n128) );
  NOR2X1 U178 ( .A(n213), .B(n202), .Y(n127) );
  NOR2X1 U179 ( .A(n214), .B(n202), .Y(n126) );
  NOR2X1 U180 ( .A(n215), .B(n202), .Y(n125) );
  NOR2X1 U181 ( .A(n208), .B(n203), .Y(n124) );
  NOR2X1 U182 ( .A(n209), .B(n203), .Y(n123) );
  NOR2X1 U183 ( .A(n210), .B(n203), .Y(n122) );
  NOR2X1 U184 ( .A(n211), .B(n203), .Y(n121) );
  NOR2X1 U185 ( .A(n212), .B(n203), .Y(n120) );
  NOR2X1 U186 ( .A(n213), .B(n203), .Y(n119) );
  NOR2X1 U187 ( .A(n214), .B(n203), .Y(n118) );
  NOR2X1 U188 ( .A(n215), .B(n203), .Y(n117) );
  NOR2X1 U189 ( .A(n208), .B(n204), .Y(n116) );
  NOR2X1 U190 ( .A(n209), .B(n204), .Y(n115) );
  NOR2X1 U191 ( .A(n210), .B(n204), .Y(n114) );
  NOR2X1 U192 ( .A(n211), .B(n204), .Y(n113) );
  NOR2X1 U193 ( .A(n212), .B(n204), .Y(n112) );
  NOR2X1 U194 ( .A(n213), .B(n204), .Y(n111) );
  NOR2X1 U195 ( .A(n214), .B(n204), .Y(n110) );
  NOR2X1 U196 ( .A(n215), .B(n204), .Y(n109) );
  NOR2X1 U197 ( .A(n208), .B(n205), .Y(n108) );
  NOR2X1 U198 ( .A(n209), .B(n205), .Y(n107) );
  NOR2X1 U199 ( .A(n210), .B(n205), .Y(n106) );
  NOR2X1 U200 ( .A(n211), .B(n205), .Y(n105) );
  NOR2X1 U201 ( .A(n212), .B(n205), .Y(n104) );
  NOR2X1 U202 ( .A(n213), .B(n205), .Y(n103) );
  NOR2X1 U203 ( .A(n214), .B(n205), .Y(n102) );
  NOR2X1 U204 ( .A(n215), .B(n205), .Y(n101) );
  NOR2X1 U205 ( .A(n208), .B(n206), .Y(n100) );
endmodule


module SNN_DW_mult_uns_6 ( a, b, product );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215;

  ADDFX2 U2 ( .A(n15), .B(n85), .CI(n2), .CO(product[15]), .S(product[14]) );
  ADDFX2 U3 ( .A(n18), .B(n16), .CI(n3), .CO(n2), .S(product[13]) );
  ADDFX2 U4 ( .A(n21), .B(n19), .CI(n4), .CO(n3), .S(product[12]) );
  ADDFX2 U5 ( .A(n26), .B(n22), .CI(n5), .CO(n4), .S(product[11]) );
  ADDFX2 U6 ( .A(n27), .B(n32), .CI(n6), .CO(n5), .S(product[10]) );
  ADDFX2 U7 ( .A(n33), .B(n40), .CI(n7), .CO(n6), .S(product[9]) );
  ADDFX2 U8 ( .A(n41), .B(n50), .CI(n8), .CO(n7), .S(product[8]) );
  ADDFX2 U9 ( .A(n51), .B(n60), .CI(n9), .CO(n8), .S(product[7]) );
  ADDFX2 U10 ( .A(n61), .B(n68), .CI(n10), .CO(n9), .S(product[6]) );
  ADDFX2 U11 ( .A(n69), .B(n75), .CI(n11), .CO(n10), .S(product[5]) );
  ADDFX2 U12 ( .A(n76), .B(n79), .CI(n12), .CO(n11), .S(product[4]) );
  ADDFX2 U13 ( .A(n80), .B(n82), .CI(n13), .CO(n12), .S(product[3]) );
  ADDFX2 U14 ( .A(n14), .B(n132), .CI(n84), .CO(n13), .S(product[2]) );
  ADDHXL U15 ( .A(n140), .B(n147), .CO(n14), .S(product[1]) );
  ADDFX2 U16 ( .A(n86), .B(n93), .CI(n17), .CO(n15), .S(n16) );
  CMPR42X1 U17 ( .A(n101), .B(n87), .C(n94), .D(n23), .ICI(n20), .S(n19), 
        .ICO(n17), .CO(n18) );
  CMPR42X1 U18 ( .A(n95), .B(n28), .C(n24), .D(n29), .ICI(n25), .S(n22), .ICO(
        n20), .CO(n21) );
  ADDFX2 U19 ( .A(n102), .B(n109), .CI(n88), .CO(n23), .S(n24) );
  CMPR42X1 U20 ( .A(n96), .B(n34), .C(n35), .D(n30), .ICI(n31), .S(n27), .ICO(
        n25), .CO(n26) );
  CMPR42X1 U21 ( .A(n103), .B(n89), .C(n117), .D(n110), .ICI(n37), .S(n30), 
        .ICO(n28), .CO(n29) );
  CMPR42X1 U22 ( .A(n42), .B(n38), .C(n43), .D(n36), .ICI(n39), .S(n33), .ICO(
        n31), .CO(n32) );
  CMPR42X1 U23 ( .A(n104), .B(n118), .C(n111), .D(n97), .ICI(n45), .S(n36), 
        .ICO(n34), .CO(n35) );
  ADDFX2 U24 ( .A(n90), .B(n125), .CI(n47), .CO(n37), .S(n38) );
  CMPR42X1 U25 ( .A(n48), .B(n46), .C(n49), .D(n53), .ICI(n44), .S(n41), .ICO(
        n39), .CO(n40) );
  CMPR42X1 U26 ( .A(n126), .B(n105), .C(n119), .D(n52), .ICI(n55), .S(n44), 
        .ICO(n42), .CO(n43) );
  ADDFX2 U27 ( .A(n133), .B(n112), .CI(n57), .CO(n45), .S(n46) );
  ADDHXL U28 ( .A(n98), .B(n91), .CO(n47), .S(n48) );
  CMPR42X1 U29 ( .A(n62), .B(n58), .C(n59), .D(n63), .ICI(n54), .S(n51), .ICO(
        n49), .CO(n50) );
  CMPR42X1 U30 ( .A(n134), .B(n113), .C(n120), .D(n127), .ICI(n56), .S(n54), 
        .ICO(n52), .CO(n53) );
  ADDFX2 U31 ( .A(n106), .B(n141), .CI(n65), .CO(n55), .S(n56) );
  ADDHXL U32 ( .A(n99), .B(n92), .CO(n57), .S(n58) );
  CMPR42X1 U33 ( .A(n128), .B(n121), .C(n66), .D(n70), .ICI(n64), .S(n61), 
        .ICO(n59), .CO(n60) );
  CMPR42X1 U34 ( .A(n142), .B(n114), .C(n135), .D(n72), .ICI(n67), .S(n64), 
        .ICO(n62), .CO(n63) );
  ADDHXL U35 ( .A(n107), .B(n100), .CO(n65), .S(n66) );
  CMPR42X1 U36 ( .A(n136), .B(n129), .C(n74), .D(n73), .ICI(n71), .S(n69), 
        .ICO(n67), .CO(n68) );
  ADDFX2 U37 ( .A(n122), .B(n143), .CI(n77), .CO(n70), .S(n71) );
  ADDHXL U38 ( .A(n115), .B(n108), .CO(n72), .S(n73) );
  CMPR42X1 U39 ( .A(n144), .B(n130), .C(n137), .D(n81), .ICI(n78), .S(n76), 
        .ICO(n74), .CO(n75) );
  ADDHXL U40 ( .A(n123), .B(n116), .CO(n77), .S(n78) );
  ADDFX2 U41 ( .A(n138), .B(n145), .CI(n83), .CO(n79), .S(n80) );
  ADDHXL U42 ( .A(n131), .B(n124), .CO(n81), .S(n82) );
  ADDHXL U43 ( .A(n146), .B(n139), .CO(n83), .S(n84) );
  INVX2 U126 ( .A(b[4]), .Y(n212) );
  INVX2 U127 ( .A(b[3]), .Y(n211) );
  INVX2 U128 ( .A(b[2]), .Y(n210) );
  INVX2 U129 ( .A(b[0]), .Y(n208) );
  INVX2 U130 ( .A(b[1]), .Y(n209) );
  INVX2 U131 ( .A(b[6]), .Y(n214) );
  INVX2 U132 ( .A(b[5]), .Y(n213) );
  INVX2 U133 ( .A(b[7]), .Y(n215) );
  INVX2 U134 ( .A(a[0]), .Y(n200) );
  INVX2 U135 ( .A(a[2]), .Y(n202) );
  INVX2 U136 ( .A(a[3]), .Y(n203) );
  INVX2 U137 ( .A(a[1]), .Y(n201) );
  INVX2 U138 ( .A(a[4]), .Y(n204) );
  INVX2 U139 ( .A(a[5]), .Y(n205) );
  INVX2 U140 ( .A(a[6]), .Y(n206) );
  INVX2 U141 ( .A(a[7]), .Y(n207) );
  NOR2X1 U142 ( .A(n200), .B(n208), .Y(product[0]) );
  NOR2X1 U143 ( .A(n206), .B(n209), .Y(n99) );
  NOR2X1 U144 ( .A(n206), .B(n210), .Y(n98) );
  NOR2X1 U145 ( .A(n206), .B(n211), .Y(n97) );
  NOR2X1 U146 ( .A(n206), .B(n212), .Y(n96) );
  NOR2X1 U147 ( .A(n206), .B(n213), .Y(n95) );
  NOR2X1 U148 ( .A(n206), .B(n214), .Y(n94) );
  NOR2X1 U149 ( .A(n206), .B(n215), .Y(n93) );
  NOR2X1 U150 ( .A(n208), .B(n207), .Y(n92) );
  NOR2X1 U151 ( .A(n209), .B(n207), .Y(n91) );
  NOR2X1 U152 ( .A(n210), .B(n207), .Y(n90) );
  NOR2X1 U153 ( .A(n211), .B(n207), .Y(n89) );
  NOR2X1 U154 ( .A(n212), .B(n207), .Y(n88) );
  NOR2X1 U155 ( .A(n213), .B(n207), .Y(n87) );
  NOR2X1 U156 ( .A(n214), .B(n207), .Y(n86) );
  NOR2X1 U157 ( .A(n215), .B(n207), .Y(n85) );
  NOR2X1 U158 ( .A(n200), .B(n209), .Y(n147) );
  NOR2X1 U159 ( .A(n200), .B(n210), .Y(n146) );
  NOR2X1 U160 ( .A(n200), .B(n211), .Y(n145) );
  NOR2X1 U161 ( .A(n200), .B(n212), .Y(n144) );
  NOR2X1 U162 ( .A(n200), .B(n213), .Y(n143) );
  NOR2X1 U163 ( .A(n200), .B(n214), .Y(n142) );
  NOR2X1 U164 ( .A(n200), .B(n215), .Y(n141) );
  NOR2X1 U165 ( .A(n208), .B(n201), .Y(n140) );
  NOR2X1 U166 ( .A(n209), .B(n201), .Y(n139) );
  NOR2X1 U167 ( .A(n210), .B(n201), .Y(n138) );
  NOR2X1 U168 ( .A(n211), .B(n201), .Y(n137) );
  NOR2X1 U169 ( .A(n212), .B(n201), .Y(n136) );
  NOR2X1 U170 ( .A(n213), .B(n201), .Y(n135) );
  NOR2X1 U171 ( .A(n214), .B(n201), .Y(n134) );
  NOR2X1 U172 ( .A(n215), .B(n201), .Y(n133) );
  NOR2X1 U173 ( .A(n208), .B(n202), .Y(n132) );
  NOR2X1 U174 ( .A(n209), .B(n202), .Y(n131) );
  NOR2X1 U175 ( .A(n210), .B(n202), .Y(n130) );
  NOR2X1 U176 ( .A(n211), .B(n202), .Y(n129) );
  NOR2X1 U177 ( .A(n212), .B(n202), .Y(n128) );
  NOR2X1 U178 ( .A(n213), .B(n202), .Y(n127) );
  NOR2X1 U179 ( .A(n214), .B(n202), .Y(n126) );
  NOR2X1 U180 ( .A(n215), .B(n202), .Y(n125) );
  NOR2X1 U181 ( .A(n208), .B(n203), .Y(n124) );
  NOR2X1 U182 ( .A(n209), .B(n203), .Y(n123) );
  NOR2X1 U183 ( .A(n210), .B(n203), .Y(n122) );
  NOR2X1 U184 ( .A(n211), .B(n203), .Y(n121) );
  NOR2X1 U185 ( .A(n212), .B(n203), .Y(n120) );
  NOR2X1 U186 ( .A(n213), .B(n203), .Y(n119) );
  NOR2X1 U187 ( .A(n214), .B(n203), .Y(n118) );
  NOR2X1 U188 ( .A(n215), .B(n203), .Y(n117) );
  NOR2X1 U189 ( .A(n208), .B(n204), .Y(n116) );
  NOR2X1 U190 ( .A(n209), .B(n204), .Y(n115) );
  NOR2X1 U191 ( .A(n210), .B(n204), .Y(n114) );
  NOR2X1 U192 ( .A(n211), .B(n204), .Y(n113) );
  NOR2X1 U193 ( .A(n212), .B(n204), .Y(n112) );
  NOR2X1 U194 ( .A(n213), .B(n204), .Y(n111) );
  NOR2X1 U195 ( .A(n214), .B(n204), .Y(n110) );
  NOR2X1 U196 ( .A(n215), .B(n204), .Y(n109) );
  NOR2X1 U197 ( .A(n208), .B(n205), .Y(n108) );
  NOR2X1 U198 ( .A(n209), .B(n205), .Y(n107) );
  NOR2X1 U199 ( .A(n210), .B(n205), .Y(n106) );
  NOR2X1 U200 ( .A(n211), .B(n205), .Y(n105) );
  NOR2X1 U201 ( .A(n212), .B(n205), .Y(n104) );
  NOR2X1 U202 ( .A(n213), .B(n205), .Y(n103) );
  NOR2X1 U203 ( .A(n214), .B(n205), .Y(n102) );
  NOR2X1 U204 ( .A(n215), .B(n205), .Y(n101) );
  NOR2X1 U205 ( .A(n208), .B(n206), .Y(n100) );
endmodule


module SNN_DW_mult_uns_7 ( a, b, product );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215;

  ADDFX2 U2 ( .A(n15), .B(n85), .CI(n2), .CO(product[15]), .S(product[14]) );
  ADDFX2 U3 ( .A(n18), .B(n16), .CI(n3), .CO(n2), .S(product[13]) );
  ADDFX2 U4 ( .A(n21), .B(n19), .CI(n4), .CO(n3), .S(product[12]) );
  ADDFX2 U5 ( .A(n26), .B(n22), .CI(n5), .CO(n4), .S(product[11]) );
  ADDFX2 U6 ( .A(n27), .B(n32), .CI(n6), .CO(n5), .S(product[10]) );
  ADDFX2 U7 ( .A(n33), .B(n40), .CI(n7), .CO(n6), .S(product[9]) );
  ADDFX2 U8 ( .A(n41), .B(n50), .CI(n8), .CO(n7), .S(product[8]) );
  ADDFX2 U9 ( .A(n51), .B(n60), .CI(n9), .CO(n8), .S(product[7]) );
  ADDFX2 U10 ( .A(n61), .B(n68), .CI(n10), .CO(n9), .S(product[6]) );
  ADDFX2 U11 ( .A(n69), .B(n75), .CI(n11), .CO(n10), .S(product[5]) );
  ADDFX2 U12 ( .A(n76), .B(n79), .CI(n12), .CO(n11), .S(product[4]) );
  ADDFX2 U13 ( .A(n80), .B(n82), .CI(n13), .CO(n12), .S(product[3]) );
  ADDFX2 U14 ( .A(n14), .B(n132), .CI(n84), .CO(n13), .S(product[2]) );
  ADDHXL U15 ( .A(n140), .B(n147), .CO(n14), .S(product[1]) );
  ADDFX2 U16 ( .A(n86), .B(n93), .CI(n17), .CO(n15), .S(n16) );
  CMPR42X1 U17 ( .A(n101), .B(n87), .C(n94), .D(n23), .ICI(n20), .S(n19), 
        .ICO(n17), .CO(n18) );
  CMPR42X1 U18 ( .A(n95), .B(n28), .C(n24), .D(n29), .ICI(n25), .S(n22), .ICO(
        n20), .CO(n21) );
  ADDFX2 U19 ( .A(n102), .B(n109), .CI(n88), .CO(n23), .S(n24) );
  CMPR42X1 U20 ( .A(n96), .B(n34), .C(n35), .D(n30), .ICI(n31), .S(n27), .ICO(
        n25), .CO(n26) );
  CMPR42X1 U21 ( .A(n103), .B(n89), .C(n117), .D(n110), .ICI(n37), .S(n30), 
        .ICO(n28), .CO(n29) );
  CMPR42X1 U22 ( .A(n42), .B(n38), .C(n43), .D(n36), .ICI(n39), .S(n33), .ICO(
        n31), .CO(n32) );
  CMPR42X1 U23 ( .A(n104), .B(n118), .C(n111), .D(n97), .ICI(n45), .S(n36), 
        .ICO(n34), .CO(n35) );
  ADDFX2 U24 ( .A(n90), .B(n125), .CI(n47), .CO(n37), .S(n38) );
  CMPR42X1 U25 ( .A(n48), .B(n46), .C(n49), .D(n53), .ICI(n44), .S(n41), .ICO(
        n39), .CO(n40) );
  CMPR42X1 U26 ( .A(n126), .B(n105), .C(n119), .D(n52), .ICI(n55), .S(n44), 
        .ICO(n42), .CO(n43) );
  ADDFX2 U27 ( .A(n133), .B(n112), .CI(n57), .CO(n45), .S(n46) );
  ADDHXL U28 ( .A(n98), .B(n91), .CO(n47), .S(n48) );
  CMPR42X1 U29 ( .A(n62), .B(n58), .C(n59), .D(n63), .ICI(n54), .S(n51), .ICO(
        n49), .CO(n50) );
  CMPR42X1 U30 ( .A(n134), .B(n113), .C(n120), .D(n127), .ICI(n56), .S(n54), 
        .ICO(n52), .CO(n53) );
  ADDFX2 U31 ( .A(n106), .B(n141), .CI(n65), .CO(n55), .S(n56) );
  ADDHXL U32 ( .A(n99), .B(n92), .CO(n57), .S(n58) );
  CMPR42X1 U33 ( .A(n128), .B(n121), .C(n66), .D(n70), .ICI(n64), .S(n61), 
        .ICO(n59), .CO(n60) );
  CMPR42X1 U34 ( .A(n142), .B(n114), .C(n135), .D(n72), .ICI(n67), .S(n64), 
        .ICO(n62), .CO(n63) );
  ADDHXL U35 ( .A(n107), .B(n100), .CO(n65), .S(n66) );
  CMPR42X1 U36 ( .A(n136), .B(n129), .C(n74), .D(n73), .ICI(n71), .S(n69), 
        .ICO(n67), .CO(n68) );
  ADDFX2 U37 ( .A(n122), .B(n143), .CI(n77), .CO(n70), .S(n71) );
  ADDHXL U38 ( .A(n115), .B(n108), .CO(n72), .S(n73) );
  CMPR42X1 U39 ( .A(n144), .B(n130), .C(n137), .D(n81), .ICI(n78), .S(n76), 
        .ICO(n74), .CO(n75) );
  ADDHXL U40 ( .A(n123), .B(n116), .CO(n77), .S(n78) );
  ADDFX2 U41 ( .A(n138), .B(n145), .CI(n83), .CO(n79), .S(n80) );
  ADDHXL U42 ( .A(n131), .B(n124), .CO(n81), .S(n82) );
  ADDHXL U43 ( .A(n146), .B(n139), .CO(n83), .S(n84) );
  INVX2 U126 ( .A(b[4]), .Y(n212) );
  INVX2 U127 ( .A(b[3]), .Y(n211) );
  INVX2 U128 ( .A(b[2]), .Y(n210) );
  INVX2 U129 ( .A(b[0]), .Y(n208) );
  INVX2 U130 ( .A(b[1]), .Y(n209) );
  INVX2 U131 ( .A(b[6]), .Y(n214) );
  INVX2 U132 ( .A(b[5]), .Y(n213) );
  INVX2 U133 ( .A(b[7]), .Y(n215) );
  INVX2 U134 ( .A(a[0]), .Y(n200) );
  INVX2 U135 ( .A(a[2]), .Y(n202) );
  INVX2 U136 ( .A(a[3]), .Y(n203) );
  INVX2 U137 ( .A(a[1]), .Y(n201) );
  INVX2 U138 ( .A(a[4]), .Y(n204) );
  INVX2 U139 ( .A(a[5]), .Y(n205) );
  INVX2 U140 ( .A(a[6]), .Y(n206) );
  INVX2 U141 ( .A(a[7]), .Y(n207) );
  NOR2X1 U142 ( .A(n200), .B(n208), .Y(product[0]) );
  NOR2X1 U143 ( .A(n206), .B(n209), .Y(n99) );
  NOR2X1 U144 ( .A(n206), .B(n210), .Y(n98) );
  NOR2X1 U145 ( .A(n206), .B(n211), .Y(n97) );
  NOR2X1 U146 ( .A(n206), .B(n212), .Y(n96) );
  NOR2X1 U147 ( .A(n206), .B(n213), .Y(n95) );
  NOR2X1 U148 ( .A(n206), .B(n214), .Y(n94) );
  NOR2X1 U149 ( .A(n206), .B(n215), .Y(n93) );
  NOR2X1 U150 ( .A(n208), .B(n207), .Y(n92) );
  NOR2X1 U151 ( .A(n209), .B(n207), .Y(n91) );
  NOR2X1 U152 ( .A(n210), .B(n207), .Y(n90) );
  NOR2X1 U153 ( .A(n211), .B(n207), .Y(n89) );
  NOR2X1 U154 ( .A(n212), .B(n207), .Y(n88) );
  NOR2X1 U155 ( .A(n213), .B(n207), .Y(n87) );
  NOR2X1 U156 ( .A(n214), .B(n207), .Y(n86) );
  NOR2X1 U157 ( .A(n215), .B(n207), .Y(n85) );
  NOR2X1 U158 ( .A(n200), .B(n209), .Y(n147) );
  NOR2X1 U159 ( .A(n200), .B(n210), .Y(n146) );
  NOR2X1 U160 ( .A(n200), .B(n211), .Y(n145) );
  NOR2X1 U161 ( .A(n200), .B(n212), .Y(n144) );
  NOR2X1 U162 ( .A(n200), .B(n213), .Y(n143) );
  NOR2X1 U163 ( .A(n200), .B(n214), .Y(n142) );
  NOR2X1 U164 ( .A(n200), .B(n215), .Y(n141) );
  NOR2X1 U165 ( .A(n208), .B(n201), .Y(n140) );
  NOR2X1 U166 ( .A(n209), .B(n201), .Y(n139) );
  NOR2X1 U167 ( .A(n210), .B(n201), .Y(n138) );
  NOR2X1 U168 ( .A(n211), .B(n201), .Y(n137) );
  NOR2X1 U169 ( .A(n212), .B(n201), .Y(n136) );
  NOR2X1 U170 ( .A(n213), .B(n201), .Y(n135) );
  NOR2X1 U171 ( .A(n214), .B(n201), .Y(n134) );
  NOR2X1 U172 ( .A(n215), .B(n201), .Y(n133) );
  NOR2X1 U173 ( .A(n208), .B(n202), .Y(n132) );
  NOR2X1 U174 ( .A(n209), .B(n202), .Y(n131) );
  NOR2X1 U175 ( .A(n210), .B(n202), .Y(n130) );
  NOR2X1 U176 ( .A(n211), .B(n202), .Y(n129) );
  NOR2X1 U177 ( .A(n212), .B(n202), .Y(n128) );
  NOR2X1 U178 ( .A(n213), .B(n202), .Y(n127) );
  NOR2X1 U179 ( .A(n214), .B(n202), .Y(n126) );
  NOR2X1 U180 ( .A(n215), .B(n202), .Y(n125) );
  NOR2X1 U181 ( .A(n208), .B(n203), .Y(n124) );
  NOR2X1 U182 ( .A(n209), .B(n203), .Y(n123) );
  NOR2X1 U183 ( .A(n210), .B(n203), .Y(n122) );
  NOR2X1 U184 ( .A(n211), .B(n203), .Y(n121) );
  NOR2X1 U185 ( .A(n212), .B(n203), .Y(n120) );
  NOR2X1 U186 ( .A(n213), .B(n203), .Y(n119) );
  NOR2X1 U187 ( .A(n214), .B(n203), .Y(n118) );
  NOR2X1 U188 ( .A(n215), .B(n203), .Y(n117) );
  NOR2X1 U189 ( .A(n208), .B(n204), .Y(n116) );
  NOR2X1 U190 ( .A(n209), .B(n204), .Y(n115) );
  NOR2X1 U191 ( .A(n210), .B(n204), .Y(n114) );
  NOR2X1 U192 ( .A(n211), .B(n204), .Y(n113) );
  NOR2X1 U193 ( .A(n212), .B(n204), .Y(n112) );
  NOR2X1 U194 ( .A(n213), .B(n204), .Y(n111) );
  NOR2X1 U195 ( .A(n214), .B(n204), .Y(n110) );
  NOR2X1 U196 ( .A(n215), .B(n204), .Y(n109) );
  NOR2X1 U197 ( .A(n208), .B(n205), .Y(n108) );
  NOR2X1 U198 ( .A(n209), .B(n205), .Y(n107) );
  NOR2X1 U199 ( .A(n210), .B(n205), .Y(n106) );
  NOR2X1 U200 ( .A(n211), .B(n205), .Y(n105) );
  NOR2X1 U201 ( .A(n212), .B(n205), .Y(n104) );
  NOR2X1 U202 ( .A(n213), .B(n205), .Y(n103) );
  NOR2X1 U203 ( .A(n214), .B(n205), .Y(n102) );
  NOR2X1 U204 ( .A(n215), .B(n205), .Y(n101) );
  NOR2X1 U205 ( .A(n208), .B(n206), .Y(n100) );
endmodule


module SNN_DW_mult_uns_8 ( a, b, product );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215;

  ADDFX2 U2 ( .A(n15), .B(n85), .CI(n2), .CO(product[15]), .S(product[14]) );
  ADDFX2 U3 ( .A(n18), .B(n16), .CI(n3), .CO(n2), .S(product[13]) );
  ADDFX2 U4 ( .A(n21), .B(n19), .CI(n4), .CO(n3), .S(product[12]) );
  ADDFX2 U5 ( .A(n26), .B(n22), .CI(n5), .CO(n4), .S(product[11]) );
  ADDFX2 U6 ( .A(n27), .B(n32), .CI(n6), .CO(n5), .S(product[10]) );
  ADDFX2 U7 ( .A(n33), .B(n40), .CI(n7), .CO(n6), .S(product[9]) );
  ADDFX2 U8 ( .A(n41), .B(n50), .CI(n8), .CO(n7), .S(product[8]) );
  ADDFX2 U9 ( .A(n51), .B(n60), .CI(n9), .CO(n8), .S(product[7]) );
  ADDFX2 U10 ( .A(n61), .B(n68), .CI(n10), .CO(n9), .S(product[6]) );
  ADDFX2 U11 ( .A(n69), .B(n75), .CI(n11), .CO(n10), .S(product[5]) );
  ADDFX2 U12 ( .A(n76), .B(n79), .CI(n12), .CO(n11), .S(product[4]) );
  ADDFX2 U13 ( .A(n80), .B(n82), .CI(n13), .CO(n12), .S(product[3]) );
  ADDFX2 U14 ( .A(n14), .B(n132), .CI(n84), .CO(n13), .S(product[2]) );
  ADDHXL U15 ( .A(n140), .B(n147), .CO(n14), .S(product[1]) );
  ADDFX2 U16 ( .A(n86), .B(n93), .CI(n17), .CO(n15), .S(n16) );
  CMPR42X1 U17 ( .A(n101), .B(n87), .C(n94), .D(n23), .ICI(n20), .S(n19), 
        .ICO(n17), .CO(n18) );
  CMPR42X1 U18 ( .A(n95), .B(n28), .C(n24), .D(n29), .ICI(n25), .S(n22), .ICO(
        n20), .CO(n21) );
  ADDFX2 U19 ( .A(n102), .B(n109), .CI(n88), .CO(n23), .S(n24) );
  CMPR42X1 U20 ( .A(n96), .B(n34), .C(n35), .D(n30), .ICI(n31), .S(n27), .ICO(
        n25), .CO(n26) );
  CMPR42X1 U21 ( .A(n103), .B(n89), .C(n117), .D(n110), .ICI(n37), .S(n30), 
        .ICO(n28), .CO(n29) );
  CMPR42X1 U22 ( .A(n42), .B(n38), .C(n43), .D(n36), .ICI(n39), .S(n33), .ICO(
        n31), .CO(n32) );
  CMPR42X1 U23 ( .A(n104), .B(n118), .C(n111), .D(n97), .ICI(n45), .S(n36), 
        .ICO(n34), .CO(n35) );
  ADDFX2 U24 ( .A(n90), .B(n125), .CI(n47), .CO(n37), .S(n38) );
  CMPR42X1 U25 ( .A(n48), .B(n46), .C(n49), .D(n53), .ICI(n44), .S(n41), .ICO(
        n39), .CO(n40) );
  CMPR42X1 U26 ( .A(n126), .B(n105), .C(n119), .D(n52), .ICI(n55), .S(n44), 
        .ICO(n42), .CO(n43) );
  ADDFX2 U27 ( .A(n133), .B(n112), .CI(n57), .CO(n45), .S(n46) );
  ADDHXL U28 ( .A(n98), .B(n91), .CO(n47), .S(n48) );
  CMPR42X1 U29 ( .A(n62), .B(n58), .C(n59), .D(n63), .ICI(n54), .S(n51), .ICO(
        n49), .CO(n50) );
  CMPR42X1 U30 ( .A(n134), .B(n113), .C(n120), .D(n127), .ICI(n56), .S(n54), 
        .ICO(n52), .CO(n53) );
  ADDFX2 U31 ( .A(n106), .B(n141), .CI(n65), .CO(n55), .S(n56) );
  ADDHXL U32 ( .A(n99), .B(n92), .CO(n57), .S(n58) );
  CMPR42X1 U33 ( .A(n128), .B(n121), .C(n66), .D(n70), .ICI(n64), .S(n61), 
        .ICO(n59), .CO(n60) );
  CMPR42X1 U34 ( .A(n142), .B(n114), .C(n135), .D(n72), .ICI(n67), .S(n64), 
        .ICO(n62), .CO(n63) );
  ADDHXL U35 ( .A(n107), .B(n100), .CO(n65), .S(n66) );
  CMPR42X1 U36 ( .A(n136), .B(n129), .C(n74), .D(n73), .ICI(n71), .S(n69), 
        .ICO(n67), .CO(n68) );
  ADDFX2 U37 ( .A(n122), .B(n143), .CI(n77), .CO(n70), .S(n71) );
  ADDHXL U38 ( .A(n115), .B(n108), .CO(n72), .S(n73) );
  CMPR42X1 U39 ( .A(n144), .B(n130), .C(n137), .D(n81), .ICI(n78), .S(n76), 
        .ICO(n74), .CO(n75) );
  ADDHXL U40 ( .A(n123), .B(n116), .CO(n77), .S(n78) );
  ADDFX2 U41 ( .A(n138), .B(n145), .CI(n83), .CO(n79), .S(n80) );
  ADDHXL U42 ( .A(n131), .B(n124), .CO(n81), .S(n82) );
  ADDHXL U43 ( .A(n146), .B(n139), .CO(n83), .S(n84) );
  INVX2 U126 ( .A(b[4]), .Y(n212) );
  INVX2 U127 ( .A(b[3]), .Y(n211) );
  INVX2 U128 ( .A(b[2]), .Y(n210) );
  INVX2 U129 ( .A(b[0]), .Y(n208) );
  INVX2 U130 ( .A(b[1]), .Y(n209) );
  INVX2 U131 ( .A(b[6]), .Y(n214) );
  INVX2 U132 ( .A(b[5]), .Y(n213) );
  INVX2 U133 ( .A(b[7]), .Y(n215) );
  INVX2 U134 ( .A(a[0]), .Y(n200) );
  INVX2 U135 ( .A(a[2]), .Y(n202) );
  INVX2 U136 ( .A(a[3]), .Y(n203) );
  INVX2 U137 ( .A(a[1]), .Y(n201) );
  INVX2 U138 ( .A(a[4]), .Y(n204) );
  INVX2 U139 ( .A(a[5]), .Y(n205) );
  INVX2 U140 ( .A(a[6]), .Y(n206) );
  INVX2 U141 ( .A(a[7]), .Y(n207) );
  NOR2X1 U142 ( .A(n200), .B(n208), .Y(product[0]) );
  NOR2X1 U143 ( .A(n206), .B(n209), .Y(n99) );
  NOR2X1 U144 ( .A(n206), .B(n210), .Y(n98) );
  NOR2X1 U145 ( .A(n206), .B(n211), .Y(n97) );
  NOR2X1 U146 ( .A(n206), .B(n212), .Y(n96) );
  NOR2X1 U147 ( .A(n206), .B(n213), .Y(n95) );
  NOR2X1 U148 ( .A(n206), .B(n214), .Y(n94) );
  NOR2X1 U149 ( .A(n206), .B(n215), .Y(n93) );
  NOR2X1 U150 ( .A(n208), .B(n207), .Y(n92) );
  NOR2X1 U151 ( .A(n209), .B(n207), .Y(n91) );
  NOR2X1 U152 ( .A(n210), .B(n207), .Y(n90) );
  NOR2X1 U153 ( .A(n211), .B(n207), .Y(n89) );
  NOR2X1 U154 ( .A(n212), .B(n207), .Y(n88) );
  NOR2X1 U155 ( .A(n213), .B(n207), .Y(n87) );
  NOR2X1 U156 ( .A(n214), .B(n207), .Y(n86) );
  NOR2X1 U157 ( .A(n215), .B(n207), .Y(n85) );
  NOR2X1 U158 ( .A(n200), .B(n209), .Y(n147) );
  NOR2X1 U159 ( .A(n200), .B(n210), .Y(n146) );
  NOR2X1 U160 ( .A(n200), .B(n211), .Y(n145) );
  NOR2X1 U161 ( .A(n200), .B(n212), .Y(n144) );
  NOR2X1 U162 ( .A(n200), .B(n213), .Y(n143) );
  NOR2X1 U163 ( .A(n200), .B(n214), .Y(n142) );
  NOR2X1 U164 ( .A(n200), .B(n215), .Y(n141) );
  NOR2X1 U165 ( .A(n208), .B(n201), .Y(n140) );
  NOR2X1 U166 ( .A(n209), .B(n201), .Y(n139) );
  NOR2X1 U167 ( .A(n210), .B(n201), .Y(n138) );
  NOR2X1 U168 ( .A(n211), .B(n201), .Y(n137) );
  NOR2X1 U169 ( .A(n212), .B(n201), .Y(n136) );
  NOR2X1 U170 ( .A(n213), .B(n201), .Y(n135) );
  NOR2X1 U171 ( .A(n214), .B(n201), .Y(n134) );
  NOR2X1 U172 ( .A(n215), .B(n201), .Y(n133) );
  NOR2X1 U173 ( .A(n208), .B(n202), .Y(n132) );
  NOR2X1 U174 ( .A(n209), .B(n202), .Y(n131) );
  NOR2X1 U175 ( .A(n210), .B(n202), .Y(n130) );
  NOR2X1 U176 ( .A(n211), .B(n202), .Y(n129) );
  NOR2X1 U177 ( .A(n212), .B(n202), .Y(n128) );
  NOR2X1 U178 ( .A(n213), .B(n202), .Y(n127) );
  NOR2X1 U179 ( .A(n214), .B(n202), .Y(n126) );
  NOR2X1 U180 ( .A(n215), .B(n202), .Y(n125) );
  NOR2X1 U181 ( .A(n208), .B(n203), .Y(n124) );
  NOR2X1 U182 ( .A(n209), .B(n203), .Y(n123) );
  NOR2X1 U183 ( .A(n210), .B(n203), .Y(n122) );
  NOR2X1 U184 ( .A(n211), .B(n203), .Y(n121) );
  NOR2X1 U185 ( .A(n212), .B(n203), .Y(n120) );
  NOR2X1 U186 ( .A(n213), .B(n203), .Y(n119) );
  NOR2X1 U187 ( .A(n214), .B(n203), .Y(n118) );
  NOR2X1 U188 ( .A(n215), .B(n203), .Y(n117) );
  NOR2X1 U189 ( .A(n208), .B(n204), .Y(n116) );
  NOR2X1 U190 ( .A(n209), .B(n204), .Y(n115) );
  NOR2X1 U191 ( .A(n210), .B(n204), .Y(n114) );
  NOR2X1 U192 ( .A(n211), .B(n204), .Y(n113) );
  NOR2X1 U193 ( .A(n212), .B(n204), .Y(n112) );
  NOR2X1 U194 ( .A(n213), .B(n204), .Y(n111) );
  NOR2X1 U195 ( .A(n214), .B(n204), .Y(n110) );
  NOR2X1 U196 ( .A(n215), .B(n204), .Y(n109) );
  NOR2X1 U197 ( .A(n208), .B(n205), .Y(n108) );
  NOR2X1 U198 ( .A(n209), .B(n205), .Y(n107) );
  NOR2X1 U199 ( .A(n210), .B(n205), .Y(n106) );
  NOR2X1 U200 ( .A(n211), .B(n205), .Y(n105) );
  NOR2X1 U201 ( .A(n212), .B(n205), .Y(n104) );
  NOR2X1 U202 ( .A(n213), .B(n205), .Y(n103) );
  NOR2X1 U203 ( .A(n214), .B(n205), .Y(n102) );
  NOR2X1 U204 ( .A(n215), .B(n205), .Y(n101) );
  NOR2X1 U205 ( .A(n208), .B(n206), .Y(n100) );
endmodule


module SNN_DW01_add_25_DW01_add_10 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1, n2;
  wire   [8:2] carry;

  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  AND2X1 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  NAND2X1 U2 ( .A(A[8]), .B(carry[8]), .Y(n2) );
  XNOR2X1 U3 ( .A(A[9]), .B(n2), .Y(SUM[9]) );
  XOR2X1 U4 ( .A(A[8]), .B(carry[8]), .Y(SUM[8]) );
  XOR2X1 U5 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module SNN_DW01_inc_0_DW01_inc_1 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKINVXL U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2XL U2 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
endmodule


module SNN_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [7:1] carry;

  ADDFX2 U2_3 ( .A(A[3]), .B(n5), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  ADDFX2 U2_2 ( .A(A[2]), .B(n4), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  ADDFX2 U2_6 ( .A(A[6]), .B(n8), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  ADDFX2 U2_5 ( .A(A[5]), .B(n7), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  ADDFX2 U2_4 ( .A(A[4]), .B(n6), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  ADDFX2 U2_1 ( .A(A[1]), .B(n3), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  XNOR3X2 U1 ( .A(A[7]), .B(B[7]), .C(carry[7]), .Y(DIFF[7]) );
  INVX2 U2 ( .A(B[1]), .Y(n3) );
  NAND2X1 U3 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX2 U4 ( .A(A[0]), .Y(n1) );
  INVX2 U5 ( .A(B[4]), .Y(n6) );
  INVX2 U6 ( .A(B[5]), .Y(n7) );
  INVX2 U7 ( .A(B[6]), .Y(n8) );
  INVX2 U8 ( .A(B[2]), .Y(n4) );
  INVX2 U9 ( .A(B[3]), .Y(n5) );
  XNOR2X1 U10 ( .A(n2), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U11 ( .A(B[0]), .Y(n2) );
endmodule


module SNN_DW01_add_1 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   n1, n3, n4, n5, n6, n7;
  wire   [8:4] carry;

  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  AND2X1 U1 ( .A(A[8]), .B(carry[8]), .Y(n1) );
  XOR2X1 U2 ( .A(A[9]), .B(n1), .Y(SUM[9]) );
  XOR2X1 U3 ( .A(A[8]), .B(carry[8]), .Y(SUM[8]) );
  AND2X1 U4 ( .A(n1), .B(A[9]), .Y(SUM[10]) );
  OAI2BB1X1 U5 ( .A0N(A[3]), .A1N(n3), .B0(n4), .Y(carry[4]) );
  OAI21X1 U6 ( .A0(A[3]), .A1(n3), .B0(B[3]), .Y(n4) );
  OAI2BB1X1 U7 ( .A0N(A[2]), .A1N(n5), .B0(n6), .Y(n3) );
  OAI21X1 U8 ( .A0(A[2]), .A1(n5), .B0(B[2]), .Y(n6) );
  OAI2BB1X1 U9 ( .A0N(B[1]), .A1N(A[1]), .B0(n7), .Y(n5) );
  OAI211X1 U10 ( .A0(A[1]), .A1(B[1]), .B0(A[0]), .C0(B[0]), .Y(n7) );
endmodule


module SNN_DW01_add_0 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1, n2;
  wire   [8:2] carry;

  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  AND2X1 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
  XOR2X1 U3 ( .A(A[8]), .B(carry[8]), .Y(SUM[8]) );
  XNOR2X1 U4 ( .A(A[9]), .B(n2), .Y(SUM[9]) );
  NAND2X1 U5 ( .A(A[8]), .B(carry[8]), .Y(n2) );
endmodule

