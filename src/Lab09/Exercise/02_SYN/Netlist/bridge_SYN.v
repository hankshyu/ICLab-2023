/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03
// Date      : Wed May  3 11:11:01 2023
/////////////////////////////////////////////////////////////


module bridge ( clk, inf_rst_n, inf_C_addr, inf_C_data_w, inf_C_in_valid, 
        inf_C_r_wb, inf_AR_READY, inf_R_VALID, inf_R_RESP, inf_R_DATA, 
        inf_AW_READY, inf_W_READY, inf_B_VALID, inf_B_RESP, inf_C_out_valid, 
        inf_C_data_r, inf_AR_VALID, inf_AR_ADDR, inf_R_READY, inf_AW_VALID, 
        inf_AW_ADDR, inf_W_VALID, inf_W_DATA, inf_B_READY );
  input [7:0] inf_C_addr;
  input [63:0] inf_C_data_w;
  input [1:0] inf_R_RESP;
  input [63:0] inf_R_DATA;
  input [1:0] inf_B_RESP;
  output [63:0] inf_C_data_r;
  output [16:0] inf_AR_ADDR;
  output [16:0] inf_AW_ADDR;
  output [63:0] inf_W_DATA;
  input clk, inf_rst_n, inf_C_in_valid, inf_C_r_wb, inf_AR_READY, inf_R_VALID,
         inf_AW_READY, inf_W_READY, inf_B_VALID;
  output inf_C_out_valid, inf_AR_VALID, inf_R_READY, inf_AW_VALID, inf_W_VALID,
         inf_B_READY;
  wire   N70, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224,
         n225, n226, n227, n228, n229, n231, n233, n268, n269, n270, n271,
         n272, n273, n274, n275, n276, n277, n278, n279, n280, n281, n282,
         n283, n284, n285, n286, n287, n288, n289, n290, n291, n292, n293,
         n294, n295, n296, n297, n298, n299, n300, n301, n302, n303, n304,
         n305, n306, n307, n308, n309, n310, n311, n312, n313, n314, n315,
         n316, n317, n318, n319, n320, n321, n322, n323, n324, n325, n326,
         n327, n328, n329, n330, n331, n332, n333, n334, n335, n336, n337,
         n338, n339, n340, n341, n342, n343, n344, n345, n346, n347, n348,
         n349, n350, n351, n352, n353, n354, n355, n356, n357, n358, n359,
         n360, n363;
  wire   [2:0] cs;
  wire   [7:0] addr_reg;
  wire   [63:0] data_reg;

  DFFRHQXL addr_reg_reg_7_ ( .D(n227), .CK(clk), .RN(inf_rst_n), .Q(
        addr_reg[7]) );
  DFFRHQXL addr_reg_reg_6_ ( .D(n226), .CK(clk), .RN(inf_rst_n), .Q(
        addr_reg[6]) );
  DFFRHQXL addr_reg_reg_5_ ( .D(n225), .CK(clk), .RN(inf_rst_n), .Q(
        addr_reg[5]) );
  DFFRHQXL addr_reg_reg_4_ ( .D(n224), .CK(clk), .RN(inf_rst_n), .Q(
        addr_reg[4]) );
  DFFRHQXL addr_reg_reg_3_ ( .D(n223), .CK(clk), .RN(inf_rst_n), .Q(
        addr_reg[3]) );
  DFFRHQXL addr_reg_reg_2_ ( .D(n222), .CK(clk), .RN(inf_rst_n), .Q(
        addr_reg[2]) );
  DFFRHQXL addr_reg_reg_1_ ( .D(n221), .CK(clk), .RN(inf_rst_n), .Q(
        addr_reg[1]) );
  DFFRHQXL addr_reg_reg_0_ ( .D(n220), .CK(clk), .RN(inf_rst_n), .Q(
        addr_reg[0]) );
  DFFRHQXL data_reg_reg_63_ ( .D(n219), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[63]) );
  DFFRHQXL data_reg_reg_62_ ( .D(n218), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[62]) );
  DFFRHQXL data_reg_reg_61_ ( .D(n217), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[61]) );
  DFFRHQXL data_reg_reg_60_ ( .D(n216), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[60]) );
  DFFRHQXL data_reg_reg_59_ ( .D(n215), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[59]) );
  DFFRHQXL data_reg_reg_58_ ( .D(n214), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[58]) );
  DFFRHQXL data_reg_reg_57_ ( .D(n213), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[57]) );
  DFFRHQXL data_reg_reg_56_ ( .D(n212), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[56]) );
  DFFRHQXL data_reg_reg_55_ ( .D(n211), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[55]) );
  DFFRHQXL data_reg_reg_54_ ( .D(n210), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[54]) );
  DFFRHQXL data_reg_reg_53_ ( .D(n209), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[53]) );
  DFFRHQXL data_reg_reg_52_ ( .D(n208), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[52]) );
  DFFRHQXL data_reg_reg_51_ ( .D(n207), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[51]) );
  DFFRHQXL data_reg_reg_50_ ( .D(n206), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[50]) );
  DFFRHQXL data_reg_reg_49_ ( .D(n205), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[49]) );
  DFFRHQXL data_reg_reg_48_ ( .D(n204), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[48]) );
  DFFRHQXL data_reg_reg_47_ ( .D(n203), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[47]) );
  DFFRHQXL data_reg_reg_46_ ( .D(n202), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[46]) );
  DFFRHQXL data_reg_reg_45_ ( .D(n201), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[45]) );
  DFFRHQXL data_reg_reg_44_ ( .D(n200), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[44]) );
  DFFRHQXL data_reg_reg_43_ ( .D(n199), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[43]) );
  DFFRHQXL data_reg_reg_42_ ( .D(n198), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[42]) );
  DFFRHQXL data_reg_reg_41_ ( .D(n197), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[41]) );
  DFFRHQXL data_reg_reg_40_ ( .D(n196), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[40]) );
  DFFRHQXL data_reg_reg_39_ ( .D(n195), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[39]) );
  DFFRHQXL data_reg_reg_38_ ( .D(n194), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[38]) );
  DFFRHQXL data_reg_reg_37_ ( .D(n193), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[37]) );
  DFFRHQXL data_reg_reg_36_ ( .D(n192), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[36]) );
  DFFRHQXL data_reg_reg_35_ ( .D(n191), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[35]) );
  DFFRHQXL data_reg_reg_34_ ( .D(n190), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[34]) );
  DFFRHQXL data_reg_reg_33_ ( .D(n189), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[33]) );
  DFFRHQXL data_reg_reg_32_ ( .D(n188), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[32]) );
  DFFRHQXL data_reg_reg_31_ ( .D(n187), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[31]) );
  DFFRHQXL data_reg_reg_30_ ( .D(n186), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[30]) );
  DFFRHQXL data_reg_reg_29_ ( .D(n185), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[29]) );
  DFFRHQXL data_reg_reg_28_ ( .D(n184), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[28]) );
  DFFRHQXL data_reg_reg_27_ ( .D(n183), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[27]) );
  DFFRHQXL data_reg_reg_26_ ( .D(n182), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[26]) );
  DFFRHQXL data_reg_reg_25_ ( .D(n181), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[25]) );
  DFFRHQXL data_reg_reg_24_ ( .D(n180), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[24]) );
  DFFRHQXL data_reg_reg_23_ ( .D(n179), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[23]) );
  DFFRHQXL data_reg_reg_22_ ( .D(n178), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[22]) );
  DFFRHQXL data_reg_reg_21_ ( .D(n177), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[21]) );
  DFFRHQXL data_reg_reg_20_ ( .D(n176), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[20]) );
  DFFRHQXL data_reg_reg_19_ ( .D(n175), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[19]) );
  DFFRHQXL data_reg_reg_18_ ( .D(n174), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[18]) );
  DFFRHQXL data_reg_reg_17_ ( .D(n173), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[17]) );
  DFFRHQXL data_reg_reg_16_ ( .D(n172), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[16]) );
  DFFRHQXL data_reg_reg_15_ ( .D(n171), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[15]) );
  DFFRHQXL data_reg_reg_14_ ( .D(n170), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[14]) );
  DFFRHQXL data_reg_reg_13_ ( .D(n169), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[13]) );
  DFFRHQXL data_reg_reg_12_ ( .D(n168), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[12]) );
  DFFRHQXL data_reg_reg_11_ ( .D(n167), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[11]) );
  DFFRHQXL data_reg_reg_10_ ( .D(n166), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[10]) );
  DFFRHQXL data_reg_reg_9_ ( .D(n165), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[9]) );
  DFFRHQXL data_reg_reg_8_ ( .D(n164), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[8]) );
  DFFRHQXL data_reg_reg_7_ ( .D(n163), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[7]) );
  DFFRHQXL data_reg_reg_6_ ( .D(n162), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[6]) );
  DFFRHQXL data_reg_reg_5_ ( .D(n161), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[5]) );
  DFFRHQXL data_reg_reg_4_ ( .D(n160), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[4]) );
  DFFRHQXL data_reg_reg_3_ ( .D(n159), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[3]) );
  DFFRHQXL data_reg_reg_2_ ( .D(n158), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[2]) );
  DFFRHQXL data_reg_reg_1_ ( .D(n157), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[1]) );
  DFFRHQXL data_reg_reg_0_ ( .D(n156), .CK(clk), .RN(inf_rst_n), .Q(
        data_reg[0]) );
  DFFRHQX1 cs_reg_0_ ( .D(n231), .CK(clk), .RN(inf_rst_n), .Q(cs[0]) );
  DFFSX1 cs_reg_2_ ( .D(n360), .CK(clk), .SN(inf_rst_n), .Q(n363), .QN(cs[2])
         );
  DFFRHQXL inf_C_data_r_reg_62_ ( .D(n154), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[62]) );
  DFFRHQXL inf_C_data_r_reg_47_ ( .D(n139), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[47]) );
  DFFRHQXL inf_C_data_r_reg_32_ ( .D(n124), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[32]) );
  DFFRHQXL inf_C_data_r_reg_17_ ( .D(n109), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[17]) );
  DFFRHQXL inf_C_data_r_reg_2_ ( .D(n94), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[2]) );
  DFFRHQXL inf_C_out_valid_reg ( .D(n229), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_out_valid) );
  DFFRHQXL inf_C_data_r_reg_63_ ( .D(n155), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[63]) );
  DFFRHQXL inf_C_data_r_reg_61_ ( .D(n153), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[61]) );
  DFFRHQXL inf_C_data_r_reg_60_ ( .D(n152), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[60]) );
  DFFRHQXL inf_C_data_r_reg_59_ ( .D(n151), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[59]) );
  DFFRHQXL inf_C_data_r_reg_58_ ( .D(n150), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[58]) );
  DFFRHQXL inf_C_data_r_reg_57_ ( .D(n149), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[57]) );
  DFFRHQXL inf_C_data_r_reg_56_ ( .D(n148), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[56]) );
  DFFRHQXL inf_C_data_r_reg_55_ ( .D(n147), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[55]) );
  DFFRHQXL inf_C_data_r_reg_54_ ( .D(n146), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[54]) );
  DFFRHQXL inf_C_data_r_reg_53_ ( .D(n145), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[53]) );
  DFFRHQXL inf_C_data_r_reg_52_ ( .D(n144), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[52]) );
  DFFRHQXL inf_C_data_r_reg_51_ ( .D(n143), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[51]) );
  DFFRHQXL inf_C_data_r_reg_50_ ( .D(n142), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[50]) );
  DFFRHQXL inf_C_data_r_reg_49_ ( .D(n141), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[49]) );
  DFFRHQXL inf_C_data_r_reg_48_ ( .D(n140), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[48]) );
  DFFRHQXL inf_C_data_r_reg_46_ ( .D(n138), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[46]) );
  DFFRHQXL inf_C_data_r_reg_45_ ( .D(n137), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[45]) );
  DFFRHQXL inf_C_data_r_reg_44_ ( .D(n136), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[44]) );
  DFFRHQXL inf_C_data_r_reg_43_ ( .D(n135), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[43]) );
  DFFRHQXL inf_C_data_r_reg_42_ ( .D(n134), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[42]) );
  DFFRHQXL inf_C_data_r_reg_41_ ( .D(n133), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[41]) );
  DFFRHQXL inf_C_data_r_reg_40_ ( .D(n132), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[40]) );
  DFFRHQXL inf_C_data_r_reg_39_ ( .D(n131), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[39]) );
  DFFRHQXL inf_C_data_r_reg_38_ ( .D(n130), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[38]) );
  DFFRHQXL inf_C_data_r_reg_37_ ( .D(n129), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[37]) );
  DFFRHQXL inf_C_data_r_reg_36_ ( .D(n128), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[36]) );
  DFFRHQXL inf_C_data_r_reg_35_ ( .D(n127), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[35]) );
  DFFRHQXL inf_C_data_r_reg_34_ ( .D(n126), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[34]) );
  DFFRHQXL inf_C_data_r_reg_33_ ( .D(n125), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[33]) );
  DFFRHQXL inf_C_data_r_reg_31_ ( .D(n123), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[31]) );
  DFFRHQXL inf_C_data_r_reg_30_ ( .D(n122), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[30]) );
  DFFRHQXL inf_C_data_r_reg_29_ ( .D(n121), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[29]) );
  DFFRHQXL inf_C_data_r_reg_28_ ( .D(n120), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[28]) );
  DFFRHQXL inf_C_data_r_reg_27_ ( .D(n119), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[27]) );
  DFFRHQXL inf_C_data_r_reg_26_ ( .D(n118), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[26]) );
  DFFRHQXL inf_C_data_r_reg_25_ ( .D(n117), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[25]) );
  DFFRHQXL inf_C_data_r_reg_24_ ( .D(n116), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[24]) );
  DFFRHQXL inf_C_data_r_reg_23_ ( .D(n115), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[23]) );
  DFFRHQXL inf_C_data_r_reg_22_ ( .D(n114), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[22]) );
  DFFRHQXL inf_C_data_r_reg_21_ ( .D(n113), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[21]) );
  DFFRHQXL inf_C_data_r_reg_20_ ( .D(n112), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[20]) );
  DFFRHQXL inf_C_data_r_reg_19_ ( .D(n111), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[19]) );
  DFFRHQXL inf_C_data_r_reg_18_ ( .D(n110), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[18]) );
  DFFRHQXL inf_C_data_r_reg_16_ ( .D(n108), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[16]) );
  DFFRHQXL inf_C_data_r_reg_15_ ( .D(n107), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[15]) );
  DFFRHQXL inf_C_data_r_reg_14_ ( .D(n106), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[14]) );
  DFFRHQXL inf_C_data_r_reg_13_ ( .D(n105), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[13]) );
  DFFRHQXL inf_C_data_r_reg_12_ ( .D(n104), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[12]) );
  DFFRHQXL inf_C_data_r_reg_11_ ( .D(n103), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[11]) );
  DFFRHQXL inf_C_data_r_reg_10_ ( .D(n102), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[10]) );
  DFFRHQXL inf_C_data_r_reg_9_ ( .D(n101), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[9]) );
  DFFRHQXL inf_C_data_r_reg_8_ ( .D(n100), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[8]) );
  DFFRHQXL inf_C_data_r_reg_7_ ( .D(n99), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[7]) );
  DFFRHQXL inf_C_data_r_reg_6_ ( .D(n98), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[6]) );
  DFFRHQXL inf_C_data_r_reg_5_ ( .D(n97), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[5]) );
  DFFRHQXL inf_C_data_r_reg_4_ ( .D(n96), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[4]) );
  DFFRHQXL inf_C_data_r_reg_3_ ( .D(n95), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[3]) );
  DFFRHQXL inf_C_data_r_reg_1_ ( .D(n93), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[1]) );
  DFFRHQXL inf_C_data_r_reg_0_ ( .D(n92), .CK(clk), .RN(inf_rst_n), .Q(
        inf_C_data_r[0]) );
  DFFRHQXL cs_reg_1_ ( .D(n228), .CK(clk), .RN(inf_rst_n), .Q(cs[1]) );
  NOR2XL U321 ( .A(cs[2]), .B(cs[0]), .Y(n279) );
  NOR2XL U322 ( .A(n269), .B(cs[0]), .Y(N70) );
  INVX2 U323 ( .A(n307), .Y(n233) );
  INVX2 U324 ( .A(inf_C_in_valid), .Y(n294) );
  INVXL U325 ( .A(1'b1), .Y(inf_AW_ADDR[0]) );
  INVXL U327 ( .A(1'b1), .Y(inf_AW_ADDR[1]) );
  INVXL U329 ( .A(1'b1), .Y(inf_AW_ADDR[2]) );
  INVXL U331 ( .A(1'b1), .Y(inf_AW_ADDR[11]) );
  INVXL U333 ( .A(1'b1), .Y(inf_AW_ADDR[12]) );
  INVXL U335 ( .A(1'b1), .Y(inf_AW_ADDR[13]) );
  INVXL U337 ( .A(1'b1), .Y(inf_AW_ADDR[14]) );
  INVXL U339 ( .A(1'b1), .Y(inf_AW_ADDR[15]) );
  INVXL U341 ( .A(1'b1), .Y(inf_AR_ADDR[0]) );
  INVXL U343 ( .A(1'b1), .Y(inf_AR_ADDR[1]) );
  INVXL U345 ( .A(1'b1), .Y(inf_AR_ADDR[2]) );
  INVXL U347 ( .A(1'b1), .Y(inf_AR_ADDR[11]) );
  INVXL U349 ( .A(1'b1), .Y(inf_AR_ADDR[12]) );
  INVXL U351 ( .A(1'b1), .Y(inf_AR_ADDR[13]) );
  INVXL U353 ( .A(1'b1), .Y(inf_AR_ADDR[14]) );
  INVXL U355 ( .A(1'b1), .Y(inf_AR_ADDR[15]) );
  BUFX8 U357 ( .A(N70), .Y(inf_W_VALID) );
  NOR2X4 U358 ( .A(inf_C_r_wb), .B(n294), .Y(n307) );
  NAND2XL U359 ( .A(cs[0]), .B(n363), .Y(n271) );
  NAND2XL U360 ( .A(cs[1]), .B(n279), .Y(n280) );
  AOI22XL U361 ( .A0(cs[2]), .A1(n273), .B0(n272), .B1(inf_AR_READY), .Y(n275)
         );
  NAND2XL U362 ( .A(n274), .B(cs[2]), .Y(n269) );
  OAI211XL U363 ( .A0(inf_AW_READY), .A1(n282), .B0(n281), .C0(n280), .Y(n285)
         );
  AOI22XL U364 ( .A0(n307), .A1(n279), .B0(inf_AR_ADDR[16]), .B1(inf_AR_READY), 
        .Y(n281) );
  NAND2XL U365 ( .A(n268), .B(n269), .Y(n283) );
  AOI22XL U366 ( .A0(inf_AW_READY), .A1(inf_AW_ADDR[16]), .B0(inf_R_READY), 
        .B1(inf_R_VALID), .Y(n268) );
  NAND3XL U367 ( .A(inf_B_READY), .B(cs[0]), .C(inf_B_VALID), .Y(n284) );
  AND2XL U368 ( .A(data_reg[0]), .B(inf_W_VALID), .Y(inf_W_DATA[0]) );
  AND2XL U369 ( .A(inf_W_VALID), .B(data_reg[1]), .Y(inf_W_DATA[1]) );
  AND2XL U370 ( .A(inf_W_VALID), .B(data_reg[2]), .Y(inf_W_DATA[2]) );
  AND2XL U371 ( .A(inf_W_VALID), .B(data_reg[3]), .Y(inf_W_DATA[3]) );
  AND2XL U372 ( .A(inf_W_VALID), .B(data_reg[4]), .Y(inf_W_DATA[4]) );
  AND2XL U373 ( .A(inf_W_VALID), .B(data_reg[5]), .Y(inf_W_DATA[5]) );
  AND2XL U374 ( .A(inf_W_VALID), .B(data_reg[6]), .Y(inf_W_DATA[6]) );
  AND2XL U375 ( .A(inf_W_VALID), .B(data_reg[7]), .Y(inf_W_DATA[7]) );
  AND2XL U376 ( .A(inf_W_VALID), .B(data_reg[8]), .Y(inf_W_DATA[8]) );
  AND2XL U377 ( .A(inf_W_VALID), .B(data_reg[9]), .Y(inf_W_DATA[9]) );
  AND2XL U378 ( .A(inf_W_VALID), .B(data_reg[10]), .Y(inf_W_DATA[10]) );
  AND2XL U379 ( .A(inf_W_VALID), .B(data_reg[11]), .Y(inf_W_DATA[11]) );
  AND2XL U380 ( .A(inf_W_VALID), .B(data_reg[12]), .Y(inf_W_DATA[12]) );
  AND2XL U381 ( .A(inf_W_VALID), .B(data_reg[13]), .Y(inf_W_DATA[13]) );
  AND2XL U382 ( .A(inf_W_VALID), .B(data_reg[14]), .Y(inf_W_DATA[14]) );
  AND2XL U383 ( .A(inf_W_VALID), .B(data_reg[15]), .Y(inf_W_DATA[15]) );
  AND2XL U384 ( .A(inf_W_VALID), .B(data_reg[16]), .Y(inf_W_DATA[16]) );
  AND2XL U385 ( .A(inf_W_VALID), .B(data_reg[17]), .Y(inf_W_DATA[17]) );
  AND2XL U386 ( .A(inf_W_VALID), .B(data_reg[18]), .Y(inf_W_DATA[18]) );
  AND2XL U387 ( .A(inf_W_VALID), .B(data_reg[19]), .Y(inf_W_DATA[19]) );
  AND2XL U388 ( .A(inf_W_VALID), .B(data_reg[20]), .Y(inf_W_DATA[20]) );
  AND2XL U389 ( .A(inf_W_VALID), .B(data_reg[21]), .Y(inf_W_DATA[21]) );
  AND2XL U390 ( .A(inf_W_VALID), .B(data_reg[22]), .Y(inf_W_DATA[22]) );
  AND2XL U391 ( .A(inf_W_VALID), .B(data_reg[23]), .Y(inf_W_DATA[23]) );
  AND2XL U392 ( .A(inf_W_VALID), .B(data_reg[24]), .Y(inf_W_DATA[24]) );
  AND2XL U393 ( .A(inf_W_VALID), .B(data_reg[25]), .Y(inf_W_DATA[25]) );
  AND2XL U394 ( .A(inf_W_VALID), .B(data_reg[26]), .Y(inf_W_DATA[26]) );
  AND2XL U395 ( .A(inf_W_VALID), .B(data_reg[27]), .Y(inf_W_DATA[27]) );
  AND2XL U396 ( .A(inf_W_VALID), .B(data_reg[28]), .Y(inf_W_DATA[28]) );
  AND2XL U397 ( .A(inf_W_VALID), .B(data_reg[29]), .Y(inf_W_DATA[29]) );
  AND2XL U398 ( .A(inf_W_VALID), .B(data_reg[30]), .Y(inf_W_DATA[30]) );
  AND2XL U399 ( .A(inf_W_VALID), .B(data_reg[31]), .Y(inf_W_DATA[31]) );
  AND2XL U400 ( .A(inf_W_VALID), .B(data_reg[32]), .Y(inf_W_DATA[32]) );
  AND2XL U401 ( .A(inf_W_VALID), .B(data_reg[33]), .Y(inf_W_DATA[33]) );
  AND2XL U402 ( .A(inf_W_VALID), .B(data_reg[34]), .Y(inf_W_DATA[34]) );
  AND2XL U403 ( .A(inf_W_VALID), .B(data_reg[35]), .Y(inf_W_DATA[35]) );
  AND2XL U404 ( .A(inf_W_VALID), .B(data_reg[36]), .Y(inf_W_DATA[36]) );
  AND2XL U405 ( .A(inf_W_VALID), .B(data_reg[37]), .Y(inf_W_DATA[37]) );
  AND2XL U406 ( .A(inf_W_VALID), .B(data_reg[38]), .Y(inf_W_DATA[38]) );
  AND2XL U407 ( .A(inf_W_VALID), .B(data_reg[39]), .Y(inf_W_DATA[39]) );
  AND2XL U408 ( .A(inf_W_VALID), .B(data_reg[40]), .Y(inf_W_DATA[40]) );
  AND2XL U409 ( .A(inf_W_VALID), .B(data_reg[41]), .Y(inf_W_DATA[41]) );
  AND2XL U410 ( .A(inf_W_VALID), .B(data_reg[42]), .Y(inf_W_DATA[42]) );
  AND2XL U411 ( .A(inf_W_VALID), .B(data_reg[43]), .Y(inf_W_DATA[43]) );
  AND2XL U412 ( .A(inf_W_VALID), .B(data_reg[44]), .Y(inf_W_DATA[44]) );
  AND2XL U413 ( .A(inf_W_VALID), .B(data_reg[45]), .Y(inf_W_DATA[45]) );
  AND2XL U414 ( .A(inf_W_VALID), .B(data_reg[46]), .Y(inf_W_DATA[46]) );
  AND2XL U415 ( .A(inf_W_VALID), .B(data_reg[47]), .Y(inf_W_DATA[47]) );
  AND2XL U416 ( .A(inf_W_VALID), .B(data_reg[48]), .Y(inf_W_DATA[48]) );
  AND2XL U417 ( .A(inf_W_VALID), .B(data_reg[49]), .Y(inf_W_DATA[49]) );
  AND2XL U418 ( .A(inf_W_VALID), .B(data_reg[50]), .Y(inf_W_DATA[50]) );
  AND2XL U419 ( .A(inf_W_VALID), .B(data_reg[51]), .Y(inf_W_DATA[51]) );
  AND2XL U420 ( .A(inf_W_VALID), .B(data_reg[52]), .Y(inf_W_DATA[52]) );
  AND2XL U421 ( .A(inf_W_VALID), .B(data_reg[53]), .Y(inf_W_DATA[53]) );
  AND2XL U422 ( .A(inf_W_VALID), .B(data_reg[54]), .Y(inf_W_DATA[54]) );
  AND2XL U423 ( .A(inf_W_VALID), .B(data_reg[55]), .Y(inf_W_DATA[55]) );
  AND2XL U424 ( .A(inf_W_VALID), .B(data_reg[56]), .Y(inf_W_DATA[56]) );
  AND2XL U425 ( .A(inf_W_VALID), .B(data_reg[57]), .Y(inf_W_DATA[57]) );
  AND2XL U426 ( .A(inf_W_VALID), .B(data_reg[58]), .Y(inf_W_DATA[58]) );
  AND2XL U427 ( .A(inf_W_VALID), .B(data_reg[59]), .Y(inf_W_DATA[59]) );
  AND2XL U428 ( .A(inf_W_VALID), .B(data_reg[60]), .Y(inf_W_DATA[60]) );
  AND2XL U429 ( .A(inf_W_VALID), .B(data_reg[61]), .Y(inf_W_DATA[61]) );
  AND2XL U430 ( .A(inf_W_VALID), .B(data_reg[62]), .Y(inf_W_DATA[62]) );
  AND2XL U431 ( .A(inf_W_VALID), .B(data_reg[63]), .Y(inf_W_DATA[63]) );
  BUFX1 U432 ( .A(inf_AW_ADDR[16]), .Y(inf_AW_VALID) );
  INVXL U433 ( .A(n280), .Y(inf_R_READY) );
  BUFX1 U434 ( .A(inf_AR_ADDR[16]), .Y(inf_AR_VALID) );
  AND2XL U435 ( .A(inf_R_VALID), .B(inf_R_DATA[2]), .Y(n94) );
  AND2XL U436 ( .A(inf_R_VALID), .B(inf_R_DATA[17]), .Y(n109) );
  AND2XL U437 ( .A(inf_R_VALID), .B(inf_R_DATA[32]), .Y(n124) );
  AND2XL U438 ( .A(inf_R_VALID), .B(inf_R_DATA[47]), .Y(n139) );
  AND2XL U439 ( .A(inf_R_VALID), .B(inf_R_DATA[62]), .Y(n154) );
  NAND2BXL U440 ( .AN(n285), .B(n284), .Y(n228) );
  OAI21XL U441 ( .A0(inf_AW_READY), .A1(n278), .B0(n277), .Y(n231) );
  OAI211XL U442 ( .A0(inf_C_in_valid), .A1(n276), .B0(n275), .C0(n274), .Y(
        n277) );
  AND2XL U443 ( .A(inf_R_VALID), .B(inf_R_DATA[0]), .Y(n92) );
  AND2XL U444 ( .A(inf_R_VALID), .B(inf_R_DATA[1]), .Y(n93) );
  AND2XL U445 ( .A(inf_R_VALID), .B(inf_R_DATA[3]), .Y(n95) );
  AND2XL U446 ( .A(inf_R_VALID), .B(inf_R_DATA[4]), .Y(n96) );
  AND2XL U447 ( .A(inf_R_VALID), .B(inf_R_DATA[5]), .Y(n97) );
  AND2XL U448 ( .A(inf_R_VALID), .B(inf_R_DATA[6]), .Y(n98) );
  AND2XL U449 ( .A(inf_R_VALID), .B(inf_R_DATA[7]), .Y(n99) );
  AND2XL U450 ( .A(inf_R_VALID), .B(inf_R_DATA[8]), .Y(n100) );
  AND2XL U451 ( .A(inf_R_VALID), .B(inf_R_DATA[9]), .Y(n101) );
  AND2XL U452 ( .A(inf_R_VALID), .B(inf_R_DATA[10]), .Y(n102) );
  AND2XL U453 ( .A(inf_R_VALID), .B(inf_R_DATA[11]), .Y(n103) );
  AND2XL U454 ( .A(inf_R_VALID), .B(inf_R_DATA[12]), .Y(n104) );
  AND2XL U455 ( .A(inf_R_VALID), .B(inf_R_DATA[13]), .Y(n105) );
  AND2XL U456 ( .A(inf_R_VALID), .B(inf_R_DATA[14]), .Y(n106) );
  AND2XL U457 ( .A(inf_R_VALID), .B(inf_R_DATA[15]), .Y(n107) );
  AND2XL U458 ( .A(inf_R_VALID), .B(inf_R_DATA[16]), .Y(n108) );
  AND2XL U459 ( .A(inf_R_VALID), .B(inf_R_DATA[18]), .Y(n110) );
  AND2XL U460 ( .A(inf_R_VALID), .B(inf_R_DATA[19]), .Y(n111) );
  AND2XL U461 ( .A(inf_R_VALID), .B(inf_R_DATA[20]), .Y(n112) );
  AND2XL U462 ( .A(inf_R_VALID), .B(inf_R_DATA[21]), .Y(n113) );
  AND2XL U463 ( .A(inf_R_VALID), .B(inf_R_DATA[22]), .Y(n114) );
  AND2XL U464 ( .A(inf_R_VALID), .B(inf_R_DATA[23]), .Y(n115) );
  AND2XL U465 ( .A(inf_R_VALID), .B(inf_R_DATA[24]), .Y(n116) );
  AND2XL U466 ( .A(inf_R_VALID), .B(inf_R_DATA[25]), .Y(n117) );
  AND2XL U467 ( .A(inf_R_VALID), .B(inf_R_DATA[26]), .Y(n118) );
  AND2XL U468 ( .A(inf_R_VALID), .B(inf_R_DATA[27]), .Y(n119) );
  AND2XL U469 ( .A(inf_R_VALID), .B(inf_R_DATA[28]), .Y(n120) );
  AND2XL U470 ( .A(inf_R_VALID), .B(inf_R_DATA[29]), .Y(n121) );
  AND2XL U471 ( .A(inf_R_VALID), .B(inf_R_DATA[30]), .Y(n122) );
  AND2XL U472 ( .A(inf_R_VALID), .B(inf_R_DATA[31]), .Y(n123) );
  AND2XL U473 ( .A(inf_R_VALID), .B(inf_R_DATA[33]), .Y(n125) );
  AND2XL U474 ( .A(inf_R_VALID), .B(inf_R_DATA[34]), .Y(n126) );
  AND2XL U475 ( .A(inf_R_VALID), .B(inf_R_DATA[35]), .Y(n127) );
  AND2XL U476 ( .A(inf_R_VALID), .B(inf_R_DATA[36]), .Y(n128) );
  AND2XL U477 ( .A(inf_R_VALID), .B(inf_R_DATA[37]), .Y(n129) );
  AND2XL U478 ( .A(inf_R_VALID), .B(inf_R_DATA[38]), .Y(n130) );
  AND2XL U479 ( .A(inf_R_VALID), .B(inf_R_DATA[39]), .Y(n131) );
  AND2XL U480 ( .A(inf_R_VALID), .B(inf_R_DATA[40]), .Y(n132) );
  AND2XL U481 ( .A(inf_R_VALID), .B(inf_R_DATA[41]), .Y(n133) );
  AND2XL U482 ( .A(inf_R_VALID), .B(inf_R_DATA[42]), .Y(n134) );
  AND2XL U483 ( .A(inf_R_VALID), .B(inf_R_DATA[43]), .Y(n135) );
  AND2XL U484 ( .A(inf_R_VALID), .B(inf_R_DATA[44]), .Y(n136) );
  AND2XL U485 ( .A(inf_R_VALID), .B(inf_R_DATA[45]), .Y(n137) );
  AND2XL U486 ( .A(inf_R_VALID), .B(inf_R_DATA[46]), .Y(n138) );
  AND2XL U487 ( .A(inf_R_VALID), .B(inf_R_DATA[48]), .Y(n140) );
  AND2XL U488 ( .A(inf_R_VALID), .B(inf_R_DATA[49]), .Y(n141) );
  AND2XL U489 ( .A(inf_R_VALID), .B(inf_R_DATA[50]), .Y(n142) );
  AND2XL U490 ( .A(inf_R_VALID), .B(inf_R_DATA[51]), .Y(n143) );
  AND2XL U491 ( .A(inf_R_VALID), .B(inf_R_DATA[52]), .Y(n144) );
  AND2XL U492 ( .A(inf_R_VALID), .B(inf_R_DATA[53]), .Y(n145) );
  AND2XL U493 ( .A(inf_R_VALID), .B(inf_R_DATA[54]), .Y(n146) );
  AND2XL U494 ( .A(inf_R_VALID), .B(inf_R_DATA[55]), .Y(n147) );
  AND2XL U495 ( .A(inf_R_VALID), .B(inf_R_DATA[56]), .Y(n148) );
  AND2XL U496 ( .A(inf_R_VALID), .B(inf_R_DATA[57]), .Y(n149) );
  AND2XL U497 ( .A(inf_R_VALID), .B(inf_R_DATA[58]), .Y(n150) );
  AND2XL U498 ( .A(inf_R_VALID), .B(inf_R_DATA[59]), .Y(n151) );
  AND2XL U499 ( .A(inf_R_VALID), .B(inf_R_DATA[60]), .Y(n152) );
  AND2XL U500 ( .A(inf_R_VALID), .B(inf_R_DATA[61]), .Y(n153) );
  AND2XL U501 ( .A(inf_R_VALID), .B(inf_R_DATA[63]), .Y(n155) );
  OAI2BB1XL U502 ( .A0N(n285), .A1N(n283), .B0(n284), .Y(n229) );
  OAI2BB1XL U503 ( .A0N(data_reg[0]), .A1N(n233), .B0(n359), .Y(n156) );
  NAND2XL U504 ( .A(n307), .B(inf_C_data_w[0]), .Y(n359) );
  OAI2BB1XL U505 ( .A0N(data_reg[1]), .A1N(n233), .B0(n358), .Y(n157) );
  NAND2XL U506 ( .A(n307), .B(inf_C_data_w[1]), .Y(n358) );
  OAI2BB1XL U507 ( .A0N(data_reg[2]), .A1N(n233), .B0(n357), .Y(n158) );
  NAND2XL U508 ( .A(n307), .B(inf_C_data_w[2]), .Y(n357) );
  OAI2BB1XL U509 ( .A0N(data_reg[3]), .A1N(n233), .B0(n356), .Y(n159) );
  NAND2XL U510 ( .A(n307), .B(inf_C_data_w[3]), .Y(n356) );
  OAI2BB1XL U511 ( .A0N(data_reg[4]), .A1N(n233), .B0(n355), .Y(n160) );
  NAND2XL U512 ( .A(n307), .B(inf_C_data_w[4]), .Y(n355) );
  OAI2BB1XL U513 ( .A0N(data_reg[5]), .A1N(n233), .B0(n354), .Y(n161) );
  NAND2XL U514 ( .A(n307), .B(inf_C_data_w[5]), .Y(n354) );
  OAI2BB1XL U515 ( .A0N(data_reg[6]), .A1N(n233), .B0(n353), .Y(n162) );
  NAND2XL U516 ( .A(n307), .B(inf_C_data_w[6]), .Y(n353) );
  OAI2BB1XL U517 ( .A0N(data_reg[7]), .A1N(n233), .B0(n352), .Y(n163) );
  NAND2XL U518 ( .A(n307), .B(inf_C_data_w[7]), .Y(n352) );
  OAI2BB1XL U519 ( .A0N(data_reg[8]), .A1N(n233), .B0(n351), .Y(n164) );
  NAND2XL U520 ( .A(n307), .B(inf_C_data_w[8]), .Y(n351) );
  OAI2BB1XL U521 ( .A0N(data_reg[9]), .A1N(n233), .B0(n350), .Y(n165) );
  NAND2XL U522 ( .A(n307), .B(inf_C_data_w[9]), .Y(n350) );
  OAI2BB1XL U523 ( .A0N(data_reg[10]), .A1N(n233), .B0(n349), .Y(n166) );
  NAND2XL U524 ( .A(n307), .B(inf_C_data_w[10]), .Y(n349) );
  OAI2BB1XL U525 ( .A0N(data_reg[11]), .A1N(n233), .B0(n348), .Y(n167) );
  NAND2XL U526 ( .A(n307), .B(inf_C_data_w[11]), .Y(n348) );
  OAI2BB1XL U527 ( .A0N(data_reg[12]), .A1N(n233), .B0(n347), .Y(n168) );
  NAND2XL U528 ( .A(n307), .B(inf_C_data_w[12]), .Y(n347) );
  OAI2BB1XL U529 ( .A0N(data_reg[13]), .A1N(n233), .B0(n346), .Y(n169) );
  NAND2XL U530 ( .A(n307), .B(inf_C_data_w[13]), .Y(n346) );
  OAI2BB1XL U531 ( .A0N(data_reg[14]), .A1N(n233), .B0(n345), .Y(n170) );
  NAND2XL U532 ( .A(n307), .B(inf_C_data_w[14]), .Y(n345) );
  OAI2BB1XL U533 ( .A0N(data_reg[15]), .A1N(n233), .B0(n344), .Y(n171) );
  NAND2XL U534 ( .A(n307), .B(inf_C_data_w[15]), .Y(n344) );
  OAI2BB1XL U535 ( .A0N(data_reg[16]), .A1N(n233), .B0(n343), .Y(n172) );
  NAND2XL U536 ( .A(n307), .B(inf_C_data_w[16]), .Y(n343) );
  OAI2BB1XL U537 ( .A0N(data_reg[17]), .A1N(n233), .B0(n342), .Y(n173) );
  NAND2XL U538 ( .A(n307), .B(inf_C_data_w[17]), .Y(n342) );
  OAI2BB1XL U539 ( .A0N(data_reg[18]), .A1N(n233), .B0(n341), .Y(n174) );
  NAND2XL U540 ( .A(n307), .B(inf_C_data_w[18]), .Y(n341) );
  OAI2BB1XL U541 ( .A0N(data_reg[19]), .A1N(n233), .B0(n340), .Y(n175) );
  NAND2XL U542 ( .A(n307), .B(inf_C_data_w[19]), .Y(n340) );
  OAI2BB1XL U543 ( .A0N(data_reg[20]), .A1N(n233), .B0(n339), .Y(n176) );
  NAND2XL U544 ( .A(n307), .B(inf_C_data_w[20]), .Y(n339) );
  OAI2BB1XL U545 ( .A0N(data_reg[21]), .A1N(n233), .B0(n338), .Y(n177) );
  NAND2XL U546 ( .A(n307), .B(inf_C_data_w[21]), .Y(n338) );
  OAI2BB1XL U547 ( .A0N(data_reg[22]), .A1N(n233), .B0(n337), .Y(n178) );
  NAND2XL U548 ( .A(n307), .B(inf_C_data_w[22]), .Y(n337) );
  OAI2BB1XL U549 ( .A0N(data_reg[23]), .A1N(n233), .B0(n336), .Y(n179) );
  NAND2XL U550 ( .A(n307), .B(inf_C_data_w[23]), .Y(n336) );
  OAI2BB1XL U551 ( .A0N(data_reg[24]), .A1N(n233), .B0(n335), .Y(n180) );
  NAND2XL U552 ( .A(n307), .B(inf_C_data_w[24]), .Y(n335) );
  OAI2BB1XL U553 ( .A0N(data_reg[25]), .A1N(n233), .B0(n334), .Y(n181) );
  NAND2XL U554 ( .A(n307), .B(inf_C_data_w[25]), .Y(n334) );
  OAI2BB1XL U555 ( .A0N(data_reg[26]), .A1N(n233), .B0(n333), .Y(n182) );
  NAND2XL U556 ( .A(n307), .B(inf_C_data_w[26]), .Y(n333) );
  OAI2BB1XL U557 ( .A0N(data_reg[27]), .A1N(n233), .B0(n332), .Y(n183) );
  NAND2XL U558 ( .A(n307), .B(inf_C_data_w[27]), .Y(n332) );
  OAI2BB1XL U559 ( .A0N(data_reg[28]), .A1N(n233), .B0(n331), .Y(n184) );
  NAND2XL U560 ( .A(n307), .B(inf_C_data_w[28]), .Y(n331) );
  OAI2BB1XL U561 ( .A0N(data_reg[29]), .A1N(n233), .B0(n330), .Y(n185) );
  NAND2XL U562 ( .A(n307), .B(inf_C_data_w[29]), .Y(n330) );
  OAI2BB1XL U563 ( .A0N(data_reg[30]), .A1N(n233), .B0(n329), .Y(n186) );
  NAND2XL U564 ( .A(n307), .B(inf_C_data_w[30]), .Y(n329) );
  OAI2BB1XL U565 ( .A0N(data_reg[31]), .A1N(n233), .B0(n328), .Y(n187) );
  NAND2XL U566 ( .A(n307), .B(inf_C_data_w[31]), .Y(n328) );
  OAI2BB1XL U567 ( .A0N(data_reg[32]), .A1N(n233), .B0(n327), .Y(n188) );
  NAND2XL U568 ( .A(n307), .B(inf_C_data_w[32]), .Y(n327) );
  OAI2BB1XL U569 ( .A0N(data_reg[33]), .A1N(n233), .B0(n326), .Y(n189) );
  NAND2XL U570 ( .A(n307), .B(inf_C_data_w[33]), .Y(n326) );
  OAI2BB1XL U571 ( .A0N(data_reg[34]), .A1N(n233), .B0(n325), .Y(n190) );
  NAND2XL U572 ( .A(n307), .B(inf_C_data_w[34]), .Y(n325) );
  OAI2BB1XL U573 ( .A0N(data_reg[35]), .A1N(n233), .B0(n324), .Y(n191) );
  NAND2XL U574 ( .A(n307), .B(inf_C_data_w[35]), .Y(n324) );
  OAI2BB1XL U575 ( .A0N(data_reg[36]), .A1N(n233), .B0(n323), .Y(n192) );
  NAND2XL U576 ( .A(n307), .B(inf_C_data_w[36]), .Y(n323) );
  OAI2BB1XL U577 ( .A0N(data_reg[37]), .A1N(n233), .B0(n322), .Y(n193) );
  NAND2XL U578 ( .A(n307), .B(inf_C_data_w[37]), .Y(n322) );
  OAI2BB1XL U579 ( .A0N(data_reg[38]), .A1N(n233), .B0(n321), .Y(n194) );
  NAND2XL U580 ( .A(n307), .B(inf_C_data_w[38]), .Y(n321) );
  OAI2BB1XL U581 ( .A0N(data_reg[39]), .A1N(n233), .B0(n320), .Y(n195) );
  NAND2XL U582 ( .A(n307), .B(inf_C_data_w[39]), .Y(n320) );
  OAI2BB1XL U583 ( .A0N(data_reg[40]), .A1N(n233), .B0(n319), .Y(n196) );
  NAND2XL U584 ( .A(n307), .B(inf_C_data_w[40]), .Y(n319) );
  OAI2BB1XL U585 ( .A0N(data_reg[41]), .A1N(n233), .B0(n318), .Y(n197) );
  NAND2XL U586 ( .A(n307), .B(inf_C_data_w[41]), .Y(n318) );
  OAI2BB1XL U587 ( .A0N(data_reg[42]), .A1N(n233), .B0(n317), .Y(n198) );
  NAND2XL U588 ( .A(n307), .B(inf_C_data_w[42]), .Y(n317) );
  OAI2BB1XL U589 ( .A0N(data_reg[43]), .A1N(n233), .B0(n316), .Y(n199) );
  NAND2XL U590 ( .A(n307), .B(inf_C_data_w[43]), .Y(n316) );
  OAI2BB1XL U591 ( .A0N(data_reg[44]), .A1N(n233), .B0(n315), .Y(n200) );
  NAND2XL U592 ( .A(n307), .B(inf_C_data_w[44]), .Y(n315) );
  OAI2BB1XL U593 ( .A0N(data_reg[45]), .A1N(n233), .B0(n314), .Y(n201) );
  NAND2XL U594 ( .A(n307), .B(inf_C_data_w[45]), .Y(n314) );
  OAI2BB1XL U595 ( .A0N(data_reg[46]), .A1N(n233), .B0(n313), .Y(n202) );
  NAND2XL U596 ( .A(n307), .B(inf_C_data_w[46]), .Y(n313) );
  OAI2BB1XL U597 ( .A0N(data_reg[47]), .A1N(n233), .B0(n312), .Y(n203) );
  NAND2XL U598 ( .A(n307), .B(inf_C_data_w[47]), .Y(n312) );
  OAI2BB1XL U599 ( .A0N(data_reg[48]), .A1N(n233), .B0(n311), .Y(n204) );
  NAND2XL U600 ( .A(n307), .B(inf_C_data_w[48]), .Y(n311) );
  OAI2BB1XL U601 ( .A0N(data_reg[49]), .A1N(n233), .B0(n310), .Y(n205) );
  NAND2XL U602 ( .A(n307), .B(inf_C_data_w[49]), .Y(n310) );
  OAI2BB1XL U603 ( .A0N(data_reg[50]), .A1N(n233), .B0(n309), .Y(n206) );
  NAND2XL U604 ( .A(n307), .B(inf_C_data_w[50]), .Y(n309) );
  OAI2BB1XL U605 ( .A0N(data_reg[51]), .A1N(n233), .B0(n308), .Y(n207) );
  NAND2XL U606 ( .A(n307), .B(inf_C_data_w[51]), .Y(n308) );
  OAI2BB1XL U607 ( .A0N(data_reg[52]), .A1N(n233), .B0(n306), .Y(n208) );
  NAND2XL U608 ( .A(n307), .B(inf_C_data_w[52]), .Y(n306) );
  OAI2BB1XL U609 ( .A0N(data_reg[53]), .A1N(n233), .B0(n305), .Y(n209) );
  NAND2XL U610 ( .A(n307), .B(inf_C_data_w[53]), .Y(n305) );
  OAI2BB1XL U611 ( .A0N(data_reg[54]), .A1N(n233), .B0(n304), .Y(n210) );
  NAND2XL U612 ( .A(n307), .B(inf_C_data_w[54]), .Y(n304) );
  OAI2BB1XL U613 ( .A0N(data_reg[55]), .A1N(n233), .B0(n303), .Y(n211) );
  NAND2XL U614 ( .A(n307), .B(inf_C_data_w[55]), .Y(n303) );
  OAI2BB1XL U615 ( .A0N(data_reg[56]), .A1N(n233), .B0(n302), .Y(n212) );
  NAND2XL U616 ( .A(n307), .B(inf_C_data_w[56]), .Y(n302) );
  OAI2BB1XL U617 ( .A0N(data_reg[57]), .A1N(n233), .B0(n301), .Y(n213) );
  NAND2XL U618 ( .A(n307), .B(inf_C_data_w[57]), .Y(n301) );
  OAI2BB1XL U619 ( .A0N(data_reg[58]), .A1N(n233), .B0(n300), .Y(n214) );
  NAND2XL U620 ( .A(n307), .B(inf_C_data_w[58]), .Y(n300) );
  OAI2BB1XL U621 ( .A0N(data_reg[59]), .A1N(n233), .B0(n299), .Y(n215) );
  NAND2XL U622 ( .A(n307), .B(inf_C_data_w[59]), .Y(n299) );
  OAI2BB1XL U623 ( .A0N(data_reg[60]), .A1N(n233), .B0(n298), .Y(n216) );
  NAND2XL U624 ( .A(n307), .B(inf_C_data_w[60]), .Y(n298) );
  OAI2BB1XL U625 ( .A0N(data_reg[61]), .A1N(n233), .B0(n297), .Y(n217) );
  NAND2XL U626 ( .A(n307), .B(inf_C_data_w[61]), .Y(n297) );
  OAI2BB1XL U627 ( .A0N(data_reg[62]), .A1N(n233), .B0(n296), .Y(n218) );
  NAND2XL U628 ( .A(n307), .B(inf_C_data_w[62]), .Y(n296) );
  OAI2BB1XL U629 ( .A0N(data_reg[63]), .A1N(n233), .B0(n295), .Y(n219) );
  NAND2XL U630 ( .A(n307), .B(inf_C_data_w[63]), .Y(n295) );
  OAI2BB1XL U631 ( .A0N(addr_reg[0]), .A1N(n294), .B0(n293), .Y(n220) );
  OAI2BB1XL U632 ( .A0N(addr_reg[1]), .A1N(n294), .B0(n292), .Y(n221) );
  OAI2BB1XL U633 ( .A0N(addr_reg[2]), .A1N(n294), .B0(n291), .Y(n222) );
  OAI2BB1XL U634 ( .A0N(addr_reg[3]), .A1N(n294), .B0(n290), .Y(n223) );
  OAI2BB1XL U635 ( .A0N(addr_reg[4]), .A1N(n294), .B0(n289), .Y(n224) );
  OAI2BB1XL U636 ( .A0N(addr_reg[5]), .A1N(n294), .B0(n288), .Y(n225) );
  OAI2BB1XL U637 ( .A0N(addr_reg[6]), .A1N(n294), .B0(n287), .Y(n226) );
  OAI2BB1XL U638 ( .A0N(addr_reg[7]), .A1N(n294), .B0(n286), .Y(n227) );
  INVXL U639 ( .A(n271), .Y(n272) );
  CLKINVX2 U640 ( .A(cs[1]), .Y(n274) );
  NOR2X2 U641 ( .A(n274), .B(n271), .Y(inf_AW_ADDR[16]) );
  INVXL U642 ( .A(n283), .Y(n360) );
  NOR2X2 U643 ( .A(cs[1]), .B(n271), .Y(inf_AR_ADDR[16]) );
  INVXL U644 ( .A(n269), .Y(inf_B_READY) );
  INVXL U645 ( .A(inf_AW_ADDR[16]), .Y(n278) );
  INVXL U646 ( .A(n279), .Y(n276) );
  NAND2XL U647 ( .A(cs[0]), .B(inf_B_VALID), .Y(n270) );
  OAI21XL U648 ( .A0(cs[0]), .A1(inf_W_READY), .B0(n270), .Y(n273) );
  AND2X1 U649 ( .A(inf_AW_ADDR[16]), .B(addr_reg[0]), .Y(inf_AW_ADDR[3]) );
  AND2X1 U650 ( .A(inf_AW_ADDR[16]), .B(addr_reg[1]), .Y(inf_AW_ADDR[4]) );
  AND2X1 U651 ( .A(inf_AW_ADDR[16]), .B(addr_reg[2]), .Y(inf_AW_ADDR[5]) );
  AND2X1 U652 ( .A(inf_AW_ADDR[16]), .B(addr_reg[3]), .Y(inf_AW_ADDR[6]) );
  AND2X1 U653 ( .A(inf_AW_ADDR[16]), .B(addr_reg[4]), .Y(inf_AW_ADDR[7]) );
  AND2X1 U654 ( .A(inf_AW_ADDR[16]), .B(addr_reg[5]), .Y(inf_AW_ADDR[8]) );
  AND2X1 U655 ( .A(inf_AW_ADDR[16]), .B(addr_reg[6]), .Y(inf_AW_ADDR[9]) );
  AND2X1 U656 ( .A(inf_AW_ADDR[16]), .B(addr_reg[7]), .Y(inf_AW_ADDR[10]) );
  AND2X1 U657 ( .A(inf_AR_ADDR[16]), .B(addr_reg[0]), .Y(inf_AR_ADDR[3]) );
  AND2X1 U658 ( .A(inf_AR_ADDR[16]), .B(addr_reg[1]), .Y(inf_AR_ADDR[4]) );
  AND2X1 U659 ( .A(inf_AR_ADDR[16]), .B(addr_reg[2]), .Y(inf_AR_ADDR[5]) );
  AND2X1 U660 ( .A(inf_AR_ADDR[16]), .B(addr_reg[3]), .Y(inf_AR_ADDR[6]) );
  AND2X1 U661 ( .A(inf_AR_ADDR[16]), .B(addr_reg[4]), .Y(inf_AR_ADDR[7]) );
  AND2X1 U662 ( .A(inf_AR_ADDR[16]), .B(addr_reg[5]), .Y(inf_AR_ADDR[8]) );
  AND2X1 U663 ( .A(inf_AR_ADDR[16]), .B(addr_reg[6]), .Y(inf_AR_ADDR[9]) );
  AND2X1 U664 ( .A(inf_AR_ADDR[16]), .B(addr_reg[7]), .Y(inf_AR_ADDR[10]) );
  NAND2XL U665 ( .A(cs[1]), .B(n363), .Y(n282) );
  NAND2XL U666 ( .A(inf_C_in_valid), .B(inf_C_addr[7]), .Y(n286) );
  NAND2XL U667 ( .A(inf_C_in_valid), .B(inf_C_addr[6]), .Y(n287) );
  NAND2XL U668 ( .A(inf_C_in_valid), .B(inf_C_addr[5]), .Y(n288) );
  NAND2XL U669 ( .A(inf_C_in_valid), .B(inf_C_addr[4]), .Y(n289) );
  NAND2XL U670 ( .A(inf_C_in_valid), .B(inf_C_addr[3]), .Y(n290) );
  NAND2XL U671 ( .A(inf_C_in_valid), .B(inf_C_addr[2]), .Y(n291) );
  NAND2XL U672 ( .A(inf_C_in_valid), .B(inf_C_addr[1]), .Y(n292) );
  NAND2XL U673 ( .A(inf_C_in_valid), .B(inf_C_addr[0]), .Y(n293) );
endmodule

