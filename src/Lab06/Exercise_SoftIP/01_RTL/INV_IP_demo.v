//############################################################################
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//    (C) Copyright Optimum Application-Specific Integrated System Laboratory
//    All Right Reserved
//		Date		: 2023/03
//		Version		: v1.0
//   	File Name   : INV_IP_demo.v
//   	Module Name : INV_IP_demo
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//############################################################################

//synopsys translate_off
`include "INV_IP.v"
//synopsys translate_on

module INV_IP_demo #(parameter IP_WIDTH = 7) (
    // Input signals
    IN_1, IN_2,
    // Output signals
    OUT_INV
);

// ===============================================================
// Input & Output Declaration
// ===============================================================
input  [IP_WIDTH-1:0] IN_1, IN_2;
output [IP_WIDTH-1:0] OUT_INV;

// ===============================================================
// Soft IP
// ===============================================================
INV_IP #(.IP_WIDTH(IP_WIDTH)) I_INV_IP ( .IN_1(IN_1), .IN_2(IN_2), .OUT_INV(OUT_INV));


endmodule
