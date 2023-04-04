//############################################################################
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//   (C) Copyright Optimum Application-Specific Integrated System Laboratory
//   All Right Reserved
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   ICLAB 2023 Spring
//   Lab06-Exercise_SoftIP  : Inversion in Prime Field
//   Author     	        : Zhi-Ting Dong (yjdzt918.ee11@nycu.edu.tw)
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   File Name   : TESETBED.v
//   Module Name : TESETBED
//   Release version : V1.0 (Release Date: 2023-03)
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//############################################################################

`timescale 1ns/1ps 

`ifdef RTL
    `include "PATTERN_IP.v"
    `include "INV_IP_demo.v"
`endif

`ifdef GATE
    `include "PATTERN_IP.v"
    `include "INV_IP_demo_SYN.v"
`endif

module TESTBED; 

// Parameter
parameter IP_WIDTH = 7;

// Connection wires
wire [IP_WIDTH-1:0] IN_1, IN_2;
wire [IP_WIDTH-1:0] OUT_INV;


initial begin
    `ifdef RTL
        $fsdbDumpfile("INV_IP_demo.fsdb");
        $fsdbDumpvars(0,"+mda");
        $fsdbDumpvars();
    `endif
    `ifdef GATE
        $sdf_annotate("INV_IP_demo_SYN.sdf",My_IP);
        $fsdbDumpfile("INV_IP_demo_SYN.fsdb");
        $fsdbDumpvars(0,"+mda");
        $fsdbDumpvars();
    `endif
end

`ifdef RTL
    INV_IP_demo #(.IP_WIDTH(IP_WIDTH)) My_IP (
            .IN_1(IN_1), 
            .IN_2(IN_2),
            .OUT_INV(OUT_INV)
    );
    
    PATTERN_IP #(.IP_WIDTH(IP_WIDTH)) My_PATTERN (
            .IN_1(IN_1), 
            .IN_2(IN_2),
            .OUT_INV(OUT_INV)
    );

`elsif GATE
    INV_IP_demo My_IP (
            .IN_1(IN_1), 
            .IN_2(IN_2),
            .OUT_INV(OUT_INV)
    );
    
    PATTERN_IP #(.IP_WIDTH(IP_WIDTH)) My_PATTERN (
            .IN_1(IN_1), 
            .IN_2(IN_2),
            .OUT_INV(OUT_INV)
    );

`endif  


endmodule