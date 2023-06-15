//############################################################################
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//   (C) Copyright Optimum Application-Specific Integrated System Laboratory
//   All Right Reserved
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   ICLAB 2023 Spring
//   Lab10  : Online Shopping Platform Simulation
//   
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   File Name   : INF.sv
//   Module Name : INF
//   Release version : V1.0 (Release Date: 2023-04)
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//############################################################################

interface INF();
	import  usertype::*;
	logic 	rst_n ; 
	logic   id_valid;
	logic   act_valid;
	logic   item_valid;
	logic   num_valid;
	logic   amnt_valid;
	DATA  	D;
	
	logic   out_valid;
	logic 	complete;
	Error_Msg 	err_msg;
	logic [31:0] out_info;
	
	logic [7:0]  C_addr;
	logic [63:0] C_data_w;
	logic [63:0] C_data_r;
	logic C_in_valid;
	logic C_out_valid;
	logic C_r_wb;
	
	logic  AR_READY, R_VALID, AW_READY, W_READY, B_VALID, AR_VALID, R_READY, AW_VALID, W_VALID, B_READY;
	logic [1:0]	 R_RESP, B_RESP;
    logic [63:0] R_DATA, W_DATA;
	logic [16:0] AW_ADDR, AR_ADDR;

	modport PATTERN(
		input  out_valid, err_msg, complete, out_info,
		output rst_n, D, id_valid, act_valid, item_valid, num_valid, amnt_valid
	);

	modport DRAM(
		input  AR_VALID, AR_ADDR, R_READY, AW_VALID, AW_ADDR, W_VALID, W_DATA, B_READY,
		output AR_READY, R_VALID, R_RESP, R_DATA, AW_READY, W_READY, B_VALID, B_RESP
	);
	
	//  sub module port 
  modport OS_inf(
		input  
		// Pattern
		rst_n, D, id_valid, act_valid, item_valid, amnt_valid, num_valid, 
		// Bridge
		C_out_valid, C_data_r,
		output 
		// Pattern
		out_valid, err_msg,  complete, out_info, 
		// Bridge
		C_addr, C_data_w, C_in_valid, C_r_wb
	);
		
	modport bridge_inf(
		input  
		// Pattern
		rst_n,
		// Bridge
		C_addr, C_data_w, C_in_valid, C_r_wb, 
		// DRAM
		AR_READY, R_VALID, R_RESP, R_DATA, AW_READY, W_READY, B_VALID, B_RESP,
		output 
		// Bridge
		C_out_valid, C_data_r, 
		// DRAM
		AR_VALID, AR_ADDR, R_READY, AW_VALID, AW_ADDR, W_VALID, W_DATA, B_READY
	);
	
	//This setting will be used during demo
	//You can change the modport if you want to test the design independently
	modport PATTERN_OS(
	  input  rst_n, out_valid, err_msg,  complete, out_info, 
		C_addr, C_data_w, C_in_valid, C_r_wb,
		D, id_valid, act_valid, item_valid, num_valid, amnt_valid,
		C_out_valid, C_data_r
  );

	//This setting will be used during demo
	//You can change the modport if you want to test the design independently
	modport PATTERN_bridge(
	input  rst_n, C_in_valid,
		C_out_valid, C_data_r, AR_VALID, AR_ADDR, R_READY, AW_VALID, AW_ADDR, W_VALID, W_DATA, B_READY, 
		C_addr, C_data_w, C_r_wb,
	  	AR_READY, R_VALID, R_RESP, R_DATA, AW_READY, W_READY, B_VALID, B_RESP
  );
    modport CHECKER(
		input   out_valid, err_msg, complete, out_info,
			    rst_n, D, id_valid, act_valid, item_valid, num_valid, amnt_valid,
				C_in_valid,C_out_valid, C_data_r, AR_VALID, AR_ADDR, R_READY, AW_VALID, AW_ADDR, 
				W_VALID, W_DATA, B_READY, C_addr, C_data_w, C_r_wb,
	  	        AR_READY, R_VALID, R_RESP, R_DATA, AW_READY, W_READY, B_VALID, B_RESP
	);

endinterface