`ifndef SYNTHESIS

//
// This is an automatically generated file from 
// dc_shell Version T-2022.03 -- Feb 22, 2022
//

// For simulation only. Do not modify.
module bridge_svsim(input clk, INF.bridge_inf inf);
    
        

  bridge bridge( {>>{ clk }}, {>>{ inf.rst_n }}, {>>{ inf.C_addr }}, 
        {>>{ inf.C_data_w }}, {>>{ inf.C_in_valid }}, {>>{ inf.C_r_wb }}, 
        {>>{ inf.AR_READY }}, {>>{ inf.R_VALID }}, {>>{ inf.R_RESP }}, 
        {>>{ inf.R_DATA }}, {>>{ inf.AW_READY }}, {>>{ inf.W_READY }}, 
        {>>{ inf.B_VALID }}, {>>{ inf.B_RESP }}, {>>{ inf.C_out_valid }}, 
        {>>{ inf.C_data_r }}, {>>{ inf.AR_VALID }}, {>>{ inf.AR_ADDR }}, 
        {>>{ inf.R_READY }}, {>>{ inf.AW_VALID }}, {>>{ inf.AW_ADDR }}, 
        {>>{ inf.W_VALID }}, {>>{ inf.W_DATA }}, {>>{ inf.B_READY }} );
endmodule
`endif
