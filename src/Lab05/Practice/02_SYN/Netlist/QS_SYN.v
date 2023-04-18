/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03
// Date      : Wed Apr 19 01:44:46 2023
/////////////////////////////////////////////////////////////


module QS ( clk, rst_n, in_valid, in_data, action, out_valid, out_data );
  input [7:0] in_data;
  output [7:0] out_data;
  input clk, rst_n, in_valid, action;
  output out_valid;
  wire   cs_1_, act, N87, N89, N90, N91, N92, N93, N94, N95, N96, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82,
         n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96,
         n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108,
         n109, n110, n111, n112, n113, n114, n115, n116, n117, n118, n119,
         n120, n121, n122, n123, n124, n125, n126, n127, n128, n129, n130,
         n131, n132, n133, n134, n135, n136, n137, n138, n139, n140, n141,
         n142, n143;
  wire   [3:0] count;
  wire   [3:0] len;
  wire   [7:0] in_buffer;
  wire   [7:0] sram_d;
  tri   [7:0] sram_q;

  RA1SH U_SRAM ( .Q(sram_q), .A({n75, n74, n73, n72}), .D(sram_d), .CLK(clk), 
        .CEN(1'b0), .OEN(1'b0), .WEN(n76) );
  DFFRX1 cs_reg_1_ ( .D(n71), .CK(clk), .RN(rst_n), .Q(cs_1_), .QN(n135) );
  DFFRX1 in_buffer_reg_7_ ( .D(n60), .CK(clk), .RN(rst_n), .Q(in_buffer[7]) );
  DFFRX1 in_buffer_reg_6_ ( .D(n59), .CK(clk), .RN(rst_n), .Q(in_buffer[6]) );
  DFFRX1 in_buffer_reg_5_ ( .D(n58), .CK(clk), .RN(rst_n), .Q(in_buffer[5]) );
  DFFRX1 in_buffer_reg_4_ ( .D(n57), .CK(clk), .RN(rst_n), .Q(in_buffer[4]) );
  DFFRX1 in_buffer_reg_3_ ( .D(n56), .CK(clk), .RN(rst_n), .Q(in_buffer[3]) );
  DFFRX1 in_buffer_reg_2_ ( .D(n55), .CK(clk), .RN(rst_n), .Q(in_buffer[2]) );
  DFFRX1 in_buffer_reg_1_ ( .D(n54), .CK(clk), .RN(rst_n), .Q(in_buffer[1]) );
  DFFRX1 in_buffer_reg_0_ ( .D(n53), .CK(clk), .RN(rst_n), .Q(in_buffer[0]) );
  DFFRX1 len_reg_3_ ( .D(n64), .CK(clk), .RN(rst_n), .Q(len[3]), .QN(n140) );
  DFFRX1 cs_reg_0_ ( .D(n70), .CK(clk), .RN(rst_n), .QN(n143) );
  DFFRX1 len_reg_0_ ( .D(n65), .CK(clk), .RN(rst_n), .Q(len[0]), .QN(n139) );
  DFFRX1 len_reg_2_ ( .D(n63), .CK(clk), .RN(rst_n), .Q(len[2]), .QN(n141) );
  DFFRX1 len_reg_1_ ( .D(n62), .CK(clk), .RN(rst_n), .Q(len[1]), .QN(n142) );
  DFFRX1 count_reg_0_ ( .D(n66), .CK(clk), .RN(rst_n), .Q(count[0]) );
  DFFRX1 count_reg_1_ ( .D(n67), .CK(clk), .RN(rst_n), .Q(count[1]), .QN(n136)
         );
  DFFRX1 count_reg_2_ ( .D(n68), .CK(clk), .RN(rst_n), .Q(count[2]), .QN(n138)
         );
  DFFRX1 count_reg_3_ ( .D(n69), .CK(clk), .RN(rst_n), .Q(count[3]), .QN(n137)
         );
  DFFRX1 act_reg ( .D(n61), .CK(clk), .RN(rst_n), .Q(act) );
  DFFRHQXL out_valid_reg ( .D(N87), .CK(clk), .RN(rst_n), .Q(out_valid) );
  DFFRHQXL out_data_reg_7_ ( .D(N96), .CK(clk), .RN(rst_n), .Q(out_data[7]) );
  DFFRHQXL out_data_reg_6_ ( .D(N95), .CK(clk), .RN(rst_n), .Q(out_data[6]) );
  DFFRHQXL out_data_reg_5_ ( .D(N94), .CK(clk), .RN(rst_n), .Q(out_data[5]) );
  DFFRHQXL out_data_reg_4_ ( .D(N93), .CK(clk), .RN(rst_n), .Q(out_data[4]) );
  DFFRHQXL out_data_reg_3_ ( .D(N92), .CK(clk), .RN(rst_n), .Q(out_data[3]) );
  DFFRHQXL out_data_reg_2_ ( .D(N91), .CK(clk), .RN(rst_n), .Q(out_data[2]) );
  DFFRHQXL out_data_reg_1_ ( .D(N90), .CK(clk), .RN(rst_n), .Q(out_data[1]) );
  DFFRHQXL out_data_reg_0_ ( .D(N89), .CK(clk), .RN(rst_n), .Q(out_data[0]) );
  NOR2XL U97 ( .A(n140), .B(n100), .Y(n98) );
  NOR2XL U98 ( .A(n142), .B(n139), .Y(n101) );
  NOR2XL U99 ( .A(n141), .B(n82), .Y(n85) );
  NOR2XL U100 ( .A(n138), .B(n121), .Y(n119) );
  NOR2XL U101 ( .A(cs_1_), .B(n123), .Y(n122) );
  NOR2XL U102 ( .A(n143), .B(cs_1_), .Y(n117) );
  NOR2XL U103 ( .A(count[0]), .B(n122), .Y(n66) );
  NOR2X1 U104 ( .A(n85), .B(n86), .Y(n84) );
  NOR2X1 U105 ( .A(n80), .B(n81), .Y(n79) );
  NOR2X1 U106 ( .A(n142), .B(n91), .Y(n80) );
  NOR2X1 U107 ( .A(n76), .B(n134), .Y(n123) );
  NOR2X1 U108 ( .A(len[1]), .B(n96), .Y(n81) );
  NOR2X1 U109 ( .A(count[0]), .B(count[1]), .Y(n120) );
  OAI22XL U110 ( .A0(n137), .A1(len[3]), .B0(n142), .B1(count[1]), .Y(n110) );
  INVXL U111 ( .A(n108), .Y(n114) );
  NAND2XL U112 ( .A(n143), .B(cs_1_), .Y(n109) );
  OAI2BB1XL U113 ( .A0N(n104), .A1N(n103), .B0(cs_1_), .Y(n116) );
  AOI211XL U114 ( .A0(n137), .A1(n124), .B0(n98), .C0(n97), .Y(n104) );
  OAI22XL U115 ( .A0(count[1]), .A1(n105), .B0(n107), .B1(count[2]), .Y(n102)
         );
  AOI211XL U116 ( .A0(n138), .A1(n121), .B0(n119), .C0(n122), .Y(n68) );
  NOR3BXL U117 ( .AN(n121), .B(n122), .C(n120), .Y(n67) );
  OAI22XL U118 ( .A0(n125), .A1(n142), .B0(n105), .B1(n106), .Y(n62) );
  OAI22XL U119 ( .A0(n125), .A1(n141), .B0(n107), .B1(n106), .Y(n63) );
  NAND2XL U120 ( .A(n96), .B(n95), .Y(n108) );
  NAND2XL U121 ( .A(len[2]), .B(n101), .Y(n100) );
  OAI21XL U122 ( .A0(n137), .A1(n124), .B0(n108), .Y(n97) );
  AOI2BB1XL U123 ( .A0N(count[1]), .A1N(n81), .B0(n80), .Y(n82) );
  NAND2XL U124 ( .A(count[0]), .B(n139), .Y(n96) );
  NAND2XL U125 ( .A(count[0]), .B(count[1]), .Y(n121) );
  OAI21XL U126 ( .A0(len[1]), .A1(len[0]), .B0(n99), .Y(n105) );
  OAI21XL U127 ( .A0(len[2]), .A1(n101), .B0(n100), .Y(n107) );
  INVXL U128 ( .A(n123), .Y(n106) );
  MXI2XL U129 ( .A(len[3]), .B(n140), .S0(n100), .Y(n124) );
  AOI2BB1XL U130 ( .A0N(n143), .A1N(in_valid), .B0(cs_1_), .Y(n125) );
  AND2XL U131 ( .A(n141), .B(n82), .Y(n86) );
  INVXL U132 ( .A(n96), .Y(n91) );
  OR2XL U133 ( .A(n139), .B(count[0]), .Y(n95) );
  OAI21XL U134 ( .A0(act), .A1(n109), .B0(n76), .Y(n90) );
  INVXL U135 ( .A(n109), .Y(n92) );
  NAND2XL U136 ( .A(act), .B(n92), .Y(n94) );
  AOI31XL U137 ( .A0(n120), .A1(n137), .A2(n138), .B0(n135), .Y(N87) );
  NAND2XL U138 ( .A(n143), .B(n111), .Y(n77) );
  AOI22XL U139 ( .A0(len[0]), .A1(n125), .B0(n106), .B1(n139), .Y(n65) );
  OAI21XL U140 ( .A0(n143), .A1(n116), .B0(n115), .Y(n70) );
  AOI31XL U141 ( .A0(n114), .A1(n113), .A2(n112), .B0(n111), .Y(n115) );
  OAI2BB2XL U142 ( .B0(n125), .B1(n140), .A0N(n124), .A1N(n123), .Y(n64) );
  OAI2BB1XL U143 ( .A0N(in_buffer[0]), .A1N(n134), .B0(n133), .Y(n53) );
  NAND2XL U144 ( .A(in_valid), .B(in_data[0]), .Y(n133) );
  OAI2BB1XL U145 ( .A0N(in_buffer[1]), .A1N(n134), .B0(n132), .Y(n54) );
  NAND2XL U146 ( .A(in_valid), .B(in_data[1]), .Y(n132) );
  OAI2BB1XL U147 ( .A0N(in_buffer[2]), .A1N(n134), .B0(n131), .Y(n55) );
  NAND2XL U148 ( .A(in_valid), .B(in_data[2]), .Y(n131) );
  OAI2BB1XL U149 ( .A0N(in_buffer[3]), .A1N(n134), .B0(n130), .Y(n56) );
  NAND2XL U150 ( .A(in_valid), .B(in_data[3]), .Y(n130) );
  OAI2BB1XL U151 ( .A0N(in_buffer[4]), .A1N(n134), .B0(n129), .Y(n57) );
  NAND2XL U152 ( .A(in_valid), .B(in_data[4]), .Y(n129) );
  OAI2BB1XL U153 ( .A0N(in_buffer[5]), .A1N(n134), .B0(n128), .Y(n58) );
  NAND2XL U154 ( .A(in_valid), .B(in_data[5]), .Y(n128) );
  OAI2BB1XL U155 ( .A0N(in_buffer[6]), .A1N(n134), .B0(n127), .Y(n59) );
  NAND2XL U156 ( .A(in_valid), .B(in_data[6]), .Y(n127) );
  OAI2BB1XL U157 ( .A0N(in_buffer[7]), .A1N(n134), .B0(n126), .Y(n60) );
  NAND2XL U158 ( .A(in_valid), .B(in_data[7]), .Y(n126) );
  OAI211XL U159 ( .A0(in_valid), .A1(n76), .B0(n109), .C0(n116), .Y(n71) );
  AND2XL U160 ( .A(N87), .B(sram_q[0]), .Y(N89) );
  AND2XL U161 ( .A(N87), .B(sram_q[1]), .Y(N90) );
  AND2XL U162 ( .A(N87), .B(sram_q[2]), .Y(N91) );
  AND2XL U163 ( .A(N87), .B(sram_q[3]), .Y(N92) );
  AND2XL U164 ( .A(N87), .B(sram_q[4]), .Y(N93) );
  AND2XL U165 ( .A(N87), .B(sram_q[5]), .Y(N94) );
  AND2XL U166 ( .A(N87), .B(sram_q[6]), .Y(N95) );
  AND2XL U167 ( .A(N87), .B(sram_q[7]), .Y(N96) );
  AND2XL U168 ( .A(n117), .B(in_buffer[7]), .Y(sram_d[7]) );
  AND2XL U169 ( .A(n117), .B(in_buffer[6]), .Y(sram_d[6]) );
  AND2XL U170 ( .A(n117), .B(in_buffer[5]), .Y(sram_d[5]) );
  AND2XL U171 ( .A(n117), .B(in_buffer[4]), .Y(sram_d[4]) );
  AND2XL U172 ( .A(n117), .B(in_buffer[3]), .Y(sram_d[3]) );
  AND2XL U173 ( .A(n117), .B(in_buffer[2]), .Y(sram_d[2]) );
  AND2XL U174 ( .A(n117), .B(in_buffer[1]), .Y(sram_d[1]) );
  AND2XL U175 ( .A(n117), .B(in_buffer[0]), .Y(sram_d[0]) );
  OAI32XL U176 ( .A0(count[3]), .A1(n89), .A2(n94), .B0(n88), .B1(n137), .Y(
        n75) );
  AOI21XL U177 ( .A0(n92), .A1(n89), .B0(n90), .Y(n88) );
  MXI2XL U178 ( .A(len[3]), .B(n140), .S0(n87), .Y(n89) );
  AOI2BB1XL U179 ( .A0N(count[2]), .A1N(n86), .B0(n85), .Y(n87) );
  OAI32XL U180 ( .A0(count[2]), .A1(n84), .A2(n94), .B0(n83), .B1(n138), .Y(
        n74) );
  AOI21XL U181 ( .A0(n92), .A1(n84), .B0(n90), .Y(n83) );
  OAI32XL U182 ( .A0(count[1]), .A1(n79), .A2(n94), .B0(n78), .B1(n136), .Y(
        n73) );
  AOI21XL U183 ( .A0(n92), .A1(n79), .B0(n90), .Y(n78) );
  OAI21XL U184 ( .A0(n94), .A1(n95), .B0(n93), .Y(n72) );
  AOI22XL U185 ( .A0(n92), .A1(n91), .B0(count[0]), .B1(n90), .Y(n93) );
  INVXL U186 ( .A(in_valid), .Y(n134) );
  MX2XL U187 ( .A(action), .B(act), .S0(n77), .Y(n61) );
  INVXL U188 ( .A(n117), .Y(n76) );
  NOR2XL U189 ( .A(cs_1_), .B(n134), .Y(n111) );
  INVXL U190 ( .A(n101), .Y(n99) );
  AOI221XL U191 ( .A0(n105), .A1(count[1]), .B0(n107), .B1(count[2]), .C0(n102), .Y(n103) );
  AOI221XL U192 ( .A0(len[2]), .A1(n138), .B0(n141), .B1(count[2]), .C0(n109), 
        .Y(n113) );
  AOI221XL U193 ( .A0(n137), .A1(len[3]), .B0(count[1]), .B1(n142), .C0(n110), 
        .Y(n112) );
  INVXL U195 ( .A(n119), .Y(n118) );
  AOI221XL U196 ( .A0(count[3]), .A1(n119), .B0(n137), .B1(n118), .C0(n122), 
        .Y(n69) );
endmodule

