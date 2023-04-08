/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03
// Date      : Sun Apr  9 01:26:09 2023
/////////////////////////////////////////////////////////////


module CORE ( in_n0, in_n1, opt, out_n );
  input [2:0] in_n0;
  input [2:0] in_n1;
  output [3:0] out_n;
  input opt;
  wire   n9, n10, n11, n12, n13, n14, n15, n16, n17, n18;

  INVXL U11 ( .A(opt), .Y(n18) );
  XOR2XL U12 ( .A(in_n0[0]), .B(in_n1[0]), .Y(out_n[0]) );
  INVXL U13 ( .A(in_n0[1]), .Y(n12) );
  MXI2XL U14 ( .A(opt), .B(in_n0[0]), .S0(in_n1[0]), .Y(n11) );
  MXI2XL U15 ( .A(opt), .B(n18), .S0(in_n1[1]), .Y(n10) );
  INVXL U16 ( .A(n9), .Y(out_n[1]) );
  INVXL U17 ( .A(in_n0[2]), .Y(n16) );
  MXI2XL U18 ( .A(opt), .B(n18), .S0(in_n1[2]), .Y(n15) );
  ADDFXL U19 ( .A(n12), .B(n11), .CI(n10), .CO(n14), .S(n9) );
  INVXL U20 ( .A(n13), .Y(out_n[2]) );
  ADDFXL U21 ( .A(n16), .B(n15), .CI(n14), .CO(n17), .S(n13) );
  MXI2XL U22 ( .A(opt), .B(n18), .S0(n17), .Y(out_n[3]) );
endmodule

