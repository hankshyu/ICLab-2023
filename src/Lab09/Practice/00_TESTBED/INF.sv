//############################################################################
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//   (C) Copyright Laboratory System Integration and Silicon Implementation
//   All Right Reserved
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   2018 ICLAB Spring Course
//   Lab09      : Coffee Maker
//   Author     : Chiang Wei
//                
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   File Name   : INF.sv
//   Module Name : INF
//   Release version : v1.0 (Release Date: Nov-2018)
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//############################################################################
`include "Usertype_PKG.sv"

interface INF(input bit clk);
    import      usertype::*;

    logic	rst_n;
    ingredient  select_i;
    logic[9:0]  supply;
    size        required_size;
    logic[2:0]  ratio;
    flavor	flavor_btn;
    
    logic               out_valid;
    ingredient_window	window;
    flavor		flavor_out;

    // Modify INF.sv
    modport PATTERN(
	
	// You need to modify here	
    

    );

    modport DESIGN(
		
	// You need to modify here
    

    );

endinterface
