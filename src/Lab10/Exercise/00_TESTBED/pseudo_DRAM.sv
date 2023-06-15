//############################################################################
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//   (C) Copyright Laboratory System Integration and Silicon Implementation
//   All Right Reserved
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   2022 ICLAB Spring Course
//   Lab08    : PSG
//   Author   : Tzu-Yun Huang
//	 Editor		: Chih-Wei Peng
//                
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   File Name   : pseudo_DRAM.sv
//   Module Name : pseudo_DRAM
//   Release version : v2.0 (Release Date: Apr-2022)
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//############################################################################

`include "Usertype_OS.sv"

module pseudo_DRAM(input clk, INF.DRAM inf);
import usertype::*;


//================================================================
// parameters & integer
//================================================================

parameter DRAM_p_r = "../00_TESTBED/DRAM/dram.dat";

parameter DRAM_R_latency = 15;
parameter DRAM_W_latency = 15;
parameter DRAM_B_latency = 15;

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
tBcUttuuAChBW/PvzVUDoYDJZRxzv4NZaJinqym1chKtxjkSI+YVRB9aiB1K69SI
cMH//9+weB/puo4ieEf6mzSfE0OkoM+j1BlGXa+Jv/Py1imiHX4UhW8dKeTIA8ys
16yLbxCxyn/nn3eFnSJJAo/hbTXOQEce//KQn/CoyF4ZjHHEsvIZjQ==
//pragma protect end_key_block
//pragma protect digest_block
DUMNRMX75knTehwkY4XcSxwQ7dw=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
g9h0/QY59ZKOsAxAG2CaaPFhsMI=
//pragma protect end_digest_block
//pragma protect end_protected
