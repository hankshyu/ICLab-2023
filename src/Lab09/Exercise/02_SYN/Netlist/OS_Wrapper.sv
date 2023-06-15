`ifndef SYNTHESIS

//
// This is an automatically generated file from 
// dc_shell Version T-2022.03 -- Feb 22, 2022
//

// For simulation only. Do not modify.
module OS_svsim(input clk, INF.OS_inf inf);


  OS OS( {>>{ clk }}, {>>{ inf.rst_n }}, {>>{ inf.D }}, {>>{ inf.id_valid }}, 
        {>>{ inf.act_valid }}, {>>{ inf.item_valid }}, {>>{ inf.amnt_valid }}, 
        {>>{ inf.num_valid }}, {>>{ inf.C_out_valid }}, {>>{ inf.C_data_r }}, 
        {>>{ inf.out_valid }}, {>>{ inf.err_msg }}, {>>{ inf.complete }}, 
        {>>{ inf.out_info }}, {>>{ inf.C_addr }}, {>>{ inf.C_data_w }}, 
        {>>{ inf.C_in_valid }}, {>>{ inf.C_r_wb }} );
endmodule
`endif
