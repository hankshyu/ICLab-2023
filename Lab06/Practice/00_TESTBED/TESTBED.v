//############################################################################
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//   (C) Copyright Laboratory System Integration and Silicon Implementation
//   All Right Reserved
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   ICLAB 2018 Fall
//   Lab06-Exercise		: Genvar Practice
//   Author     	        : Li-Wei Liu (willvegapunk.ee06g@nctu.edu.tw)
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   File Name   : TESETBED.v
//   Module Name : TESETBED
//   Release version : V1.0 (Release Date: 2018-09)
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//############################################################################
`timescale 1ns/1ps 

`ifdef RTL
  `include "COMPLEX_MULT.v"
  `include "PATTERN_IP.v"
`endif
	  		  	
module TESTBED; 

//Connection wires
wire	[63:0] operand1,operand2;
wire	[129:0] result;
wire	        clk,rst_n;
wire	        in_valid,out_valid;
      	

initial begin
  `ifdef RTL
    $fsdbDumpfile("COMPLEX_MULT.fsdb");
    $fsdbDumpvars();   
    $fsdbDumpvars(0,"+mda");   
  `endif
end

`ifdef RTL
	COMPLEX_MULT My_IP(
         .operand1(operand1), 
         .operand2(operand2),
         .result(result)
	);
	
	PATTERN_IP My_PATTERN(
         .operand1(operand1), 
         .operand2(operand2),
         .result(result)
	);
`endif  

 
endmodule
