//############################################################################
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//   (C) Copyright Laboratory System Integration and Silicon Implementation
//   All Right Reserved
//
//   File Name   : CHECKER.sv
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//############################################################################
//`include "Usertype_PKG.sv"

module Checker(input clk, INF.CHECKER inf);
import usertype::*;


//======================================
//      Covergroups
//======================================
//declare cover groups
// 10 * 5 = 50
covergroup Spec1 @(posedge clk iff inf.amnt_valid);
    option.at_least = 10;
    coverpoint inf.D.d_money{
        bins s1b1           = {[16'd0     : 16'd12000]};
        bins s1b2           = {[16'd12001 : 16'd24000]};
        bins s1b3           = {[16'd24001 : 16'd36000]};
        bins s1b4           = {[16'd36001 : 16'd48000]};
        bins s1b5           = {[16'd48001 : 16'd60000]};
    }
endgroup

//2 * 256 = 512
covergroup Spec2 @(posedge clk iff inf.id_valid);
    option.at_least = 2;
    coverpoint inf.D.d_id[0]{
        option.auto_bin_max = 256;
    }
endgroup

// 10 * 16 = 160
covergroup Spec3 @(posedge clk iff inf.act_valid);
    option.at_least = 10;
    coverpoint inf.D.d_act[0]{
        bins s3b0 [] = (Buy, Check, Deposit, Return => Buy, Check, Deposit, Return); 
    }
endgroup

//20 * 3 = 60
covergroup Spec4 @(posedge clk iff inf.item_valid);
    option.at_least = 20;
    coverpoint inf.D.d_item[0]{
        bins s4b1   = {Large};
        bins s4b2   = {Medium};
        bins s4b3   = {Small};
    }
endgroup

//20 * 8 = 160
covergroup Spec5 @(negedge clk iff inf.out_valid);
    option.at_least = 20;
    coverpoint inf.err_msg{
        bins s5b1   = {INV_Not_Enough};
        bins s5b2   = {Out_of_money};
        bins s5b3   = {INV_Full};
        bins s5b4   = {Wallet_is_Full};
        bins s5b5   = {Wrong_ID};
        bins s5b6   = {Wrong_Num};
        bins s5b7   = {Wrong_Item};
        bins s5b8   = {Wrong_act};
    }
endgroup

//200 * 2 = 400
covergroup Spec6 @(negedge clk iff inf.out_valid);
    option.at_least = 200;
    coverpoint inf.complete{
        bins s6b1 = {0};
        bins s6b2 = {1};
    }
endgroup

//Instantiate covergroups
Spec1 cvspec1 = new();
Spec2 cvspec2 = new();
Spec3 cvspec3 = new();
Spec4 cvspec4 = new();
Spec5 cvspec5 = new();
Spec6 cvspec6 = new();


//======================================
//      Assertions (SVA)
//======================================
//************************************ below assertion is to check your pattern ***************************************** 
//                                          Please finish and hand in it
// This is an example assertion given by TA, please write other assertions at the below
// assert_interval : assert property ( @(posedge clk)  inf.out_valid |=> inf.id_valid == 0)
// else
// begin
// 	$display("Assertion X is violated");
// 	$fatal; 
// end
Action act_store;
logic enable;
logic [3:0] cnt;
logic [5:0] valid_cnt;
logic valid_key;

always_ff @(posedge clk or inf.rst_n)begin
    if (~inf.rst_n) act_store <= No_action;
    else begin
        if(inf.act_valid) act_store <= inf.D.d_act[0];
        else if(inf.out_valid) act_store <= No_action;
    end
end

always_ff @(posedge clk or negedge inf.rst_n)begin
    if(!inf.rst_n) enable <= 1;
    else begin
        if(inf.out_valid) enable <= 1; //reset
        
        case(act_store)
            No_action: enable <= 1;
            Buy, Return: if(inf.id_valid) enable <= 0;
            Deposit: if(inf.amnt_valid) enable <= 0;
            Check: if(inf.id_valid || cnt == 6) enable <= 0;
        endcase

    end
end
always_ff @(posedge clk or negedge inf.rst_n)begin
    if(!inf.rst_n) cnt <= 0;
    else begin
        if(cnt == 0 || cnt == 6) cnt <= 0;
        else cnt <= cnt + 1;

        if(inf.act_valid ==1 && inf.D.d_act[0] == Check) cnt <= 1;
        if(inf.out_valid || inf.id_valid) cnt <= 0;
    end

end
always_ff @(posedge clk or negedge inf.rst_n)begin
    if(!inf.rst_n) valid_key <= 0;
    else if(inf.out_valid) valid_key <= 0;
    else if(inf.id_valid || inf.act_valid || inf.item_valid || inf.num_valid || inf.amnt_valid) valid_key <= 1;
end
always_ff @(posedge clk or negedge inf.rst_n)begin
    if(!inf.rst_n) valid_cnt <= 0;
    else begin
        if(inf.out_valid) valid_cnt <= 0;
        else if (inf.id_valid || inf.act_valid || inf.item_valid || inf.num_valid || inf.amnt_valid) valid_cnt <= 0;
        else if(valid_key) valid_cnt <= valid_cnt + 1;

    end
end

// Assertion 1: All outputs signals (including OS.sv and bridge.sv) should be zero after reset.
always @(negedge inf.rst_n)begin
    # (0.1);
    
    //Outputs from OS.v
    assert_1_OS0: assert(inf.out_valid===0 && inf.err_msg===0 && inf.complete===0 && inf.out_info===0)
    else begin
        $display("Assertion 1 is violated");
        $fatal;
    end
    assert_1_OS1: assert(inf.C_addr===0 && inf.C_data_w===0 && inf.C_in_valid===0 && inf.C_r_wb===0)
    else begin
        $display("Assertion 1 is violated");
        $fatal;
    end

    //Outputs from Bridge.sv
    assert_1_B0: assert(inf.C_out_valid===0 && inf.C_data_r===0)
    else begin
        $display("Assertion 1 is violated");
        $fatal;
    end
    assert_1_BAR: assert(inf.AR_VALID===0 && inf.AR_ADDR===0)
    else begin
        $display("Assertion 1 is violated");
        $fatal;
    end
    assert_1_BR: assert(inf.R_READY===0)
    else begin
        $display("Assertion 1 is violated");
        $fatal;
    end
    assert_1_BAW: assert(inf.AW_VALID===0 && inf.AW_ADDR===0)
    else begin
        $display("Assertion 1 is violated");
        $fatal;
    end
    assert_1_W: assert(inf.W_VALID===0 && inf.W_DATA===0)
    else begin
        $display("Assertion 1 is violated");
        $fatal;
    end
    assert_1_B: assert(inf.B_READY===0)
    else begin
        $display("Assertion 1 is violated");
        $fatal;
    end
end

//Assertion 2: If action is completed, err_msg must be 4'b0
assert_2: assert property(@(posedge clk) (inf.complete===1 && inf.out_valid===1) |-> (inf.err_msg===4'b0))
else begin
    # (0.2);
    $display("Assertion 2 is violated");
    $fatal;
end

//Assertion 3: If action is not completed, out_info should be 32'b0
assert_3: assert property(@(posedge clk) (inf.complete===0 && inf.out_valid===1) |-> (inf.out_info===32'b0))
else begin
    # (0.3);
    $display("Assertion 3 is violated");
    $fatal;
end

//Assertion 4: All input valid can only be high for exactly one cycle
assert_4_0: assert property(@(posedge clk) (inf.id_valid===1) |=> (inf.id_valid===0))
else begin
    # (0.4);
    $display("Assertion 4 is violated");
    $fatal;
end
assert_4_1: assert property(@(posedge clk) (inf.act_valid===1) |=> (inf.act_valid===0))
else begin
    # (0.4);
    $display("Assertion 4 is violated");
    $fatal;
end
assert_4_2: assert property(@(posedge clk) (inf.item_valid===1) |=> (inf.item_valid===0))
else begin
    # (0.4);
    $display("Assertion 4 is violated");
    $fatal;
end
assert_4_3: assert property(@(posedge clk) (inf.num_valid===1) |=> (inf.num_valid===0))
else begin
    # (0.4);
    $display("Assertion 4 is violated");
    $fatal;
end
assert_4_4: assert property(@(posedge clk) (inf.amnt_valid===1) |=> (inf.amnt_valid===0))
else begin
    #(0.4);
    $display("Assertion 4 is violated");
    $fatal;
end

//Assertion 5: The five valid signals won't overlap with each other
assert_5: assert property (
    @(posedge clk) 
    $onehot({inf.id_valid, inf.act_valid, inf.item_valid, inf.num_valid, inf.amnt_valid}) || 
    ({inf.id_valid, inf.act_valid, inf.item_valid, inf.num_valid, inf.amnt_valid} === 0))
else begin
    #(0.5);
    $display("Assertion 5 is violated");
    $fatal;
end


//Assertion 6: The grap between each input valid is at least 1 cycle and at most 5 cycles

// This is for the first Uid
assert_6_1: assert property (@(negedge clk) (act_store === No_action && inf.id_valid) |-> ##[2:6] (inf.act_valid))
else begin
    $display("Assertion 6 is violated");
    $fatal;
end
assert_6_1t: assert property(
    @(negedge clk iff (valid_cnt <5))
    disable iff (inf.act_valid)
    (act_store==No_action &&  inf.id_valid) |=> 
    $stable(inf.id_valid ===0|| inf.item_valid===0||inf.amnt_valid===0||inf.num_valid===0)[*5])
else begin
    $display("Assertion 6 is violated");
    $fatal;
end

assert_6_2: assert property (@(negedge clk) (act_store == No_action) |-> ((!inf.item_valid)&&(!inf.num_valid)&&(!inf.amnt_valid)))
else begin
    #(0.6);
    $display("Assertion 6 is violated");
    $fatal;
end

//Theses are for buys
assert_6_b1: assert property (
    @(negedge clk) 
    (inf.act_valid && inf.D.d_act === Buy) |-> ##[2:6] (inf.item_valid))
else begin
    $display("Assertion 6 is violated");
    $fatal;
end
assert_6_b1_t: assert property (
    @(negedge clk iff (valid_cnt < 5))
    disable iff (inf.item_valid)
    (inf.act_valid && inf.D.d_act === Buy) |-> $stable(inf.id_valid===0 || inf.act_valid===0 || inf.num_valid===0 || inf.amnt_valid===0))
else begin
    $display("Assertion 6 is violated");
    $fatal;
end

assert_6_b2: assert property(@(negedge clk) (act_store === Buy && inf.item_valid) |-> ##[2:6] (inf.num_valid))
else begin
    #(0.6);
    $display("Assertion 6 is violated");
    $fatal;
end
assert_6_b2_t: assert property (
    @(negedge clk iff (valid_cnt < 5))
    disable iff (inf.num_valid)
    (inf.item_valid && inf.D.d_act === Buy) |-> $stable(inf.id_valid===0 || inf.act_valid===0 || inf.item_valid===0 || inf.amnt_valid===0))
else begin
    $display("Assertion 6 is violated");
    $fatal;
end

assert_6_b3: assert property(@(negedge clk) (act_store === Buy && inf.num_valid) |-> ##[2:6] (inf.id_valid))
else begin
    #(0.6);
    $display("Assertion 6 is violated");
    $fatal;
end
assert_6_b3_t: assert property (
    @(negedge clk iff (valid_cnt < 5)) 
    disable iff (inf.id_valid)
    (inf.num_valid && inf.D.d_act === Buy) |-> $stable(inf.num_valid===0 || inf.act_valid===0 || inf.item_valid===0 || inf.amnt_valid===0))
else begin
    $display("Assertion 6 is violated");
    $fatal;
end

//Assertion for Check
assert_6_c1: assert property(@(negedge clk) (inf.act_valid && inf.D.d_act == Check) |=>  (!inf.id_valid))
else begin
    #(0.6);
    $display("Assertion 6 is violated");
    $fatal;
end

assert_6_c2: assert property (
    @(posedge clk) 
    enable==0 && inf.out_valid === 0 |=> 
    $stable(inf.num_valid===1 || inf.amnt_valid===1 ||inf.act_valid===1 || inf.item_valid===1 || inf.id_valid===1)
    )
else begin
    #(0.6);
    $display("Assertion 6 is violated");
    $fatal;
end

assert_6_c3: assert property(
    @(posedge clk)
    cnt !=0 |=>
    $stable(inf.num_valid || inf.amnt_valid || inf.act_valid || inf.item_valid)
    )
else begin
    #(0.6);
    $display("Assertion 6 is violated");
    $fatal;
end

//These are for Deposit
assert_6_d1: assert property (@(negedge clk) (inf.act_valid && inf.D.d_act === Deposit) |-> ##[2:6] (inf.amnt_valid))
else begin
    #(0.6);
    $display("Assertion 6 is violated");
    $fatal;
end
assert_6_d1_t: assert property (
    @(negedge clk iff (valid_cnt < 5)) 
    disable iff (inf.amnt_valid)
    (inf.act_valid && inf.D.d_act === Deposit) |-> $stable(inf.num_valid===0 || inf.act_valid===0 || inf.item_valid===0 || inf.id_valid===0))
else begin
    $display("Assertion 6 is violated");
    $fatal;
end

//These are for Return
assert_6_r1: assert property (@(negedge clk) (inf.act_valid && inf.D.d_act === Return) |-> ##[2:6] (inf.item_valid))
else begin
    #(0.6);
    $display("Assertion 6 is violated");
    $fatal;
end
assert_6_r1_t: assert property (
    @(negedge clk iff (valid_cnt < 5)) 
    disable iff (inf.item_valid)
    (inf.act_valid && inf.D.d_act === Return) |-> $stable(inf.id_valid===0 || inf.act_valid===0 || inf.num_valid===0 || inf.amnt_valid===0))
else begin
    $display("Assertion 6 is violated");
    $fatal;
end

assert_6_r2: assert property(@(negedge clk) (act_store === Return && inf.item_valid) |-> ##[2:6] (inf.num_valid))
else begin
    #(0.6);
    $display("Assertion 6 is violated");
    $fatal;
end
assert_6_r2_t: assert property (
    @(negedge clk iff (valid_cnt < 5)) 
    disable iff (inf.num_valid)
    (inf.item_valid && inf.D.d_act === Return) |-> $stable(inf.id_valid===0 || inf.act_valid===0 || inf.item_valid===0 || inf.amnt_valid===0))
else begin
    $display("Assertion 6 is violated");
    $fatal;
end
assert_6_r3: assert property(@(negedge clk) (act_store === Return && inf.num_valid) |-> ##[2:6] (inf.id_valid))
else begin
    #(0.6);
    $display("Assertion 6 is violated");
    $fatal;
end
assert_6_r3_t: assert property (
    @(negedge clk iff (valid_cnt < 5)) 
    disable iff (inf.id_valid)
    (inf.num_valid && inf.D.d_act === Return) |-> $stable(inf.num_valid===0 || inf.act_valid===0 || inf.item_valid===0 || inf.amnt_valid===0))
else begin
    $display("Assertion 6 is violated");
    $fatal;
end


//Assertion 7: Out_valid will be high for one cycle
assert_7: assert property(@(posedge clk) (inf.out_valid===1) |=> (inf.out_valid===0))
else begin
    #(0.7);
    $display("Assertion 7 is violated");
    $fatal;
end

// Assertion 8: Next operaton will be valid 2~10 cycles after out_valid fall
asert_8 : assert property(@(posedge clk) (inf.out_valid===1) |=> ##[2:10] (inf.id_valid===1 || inf.act_valid===1))
else begin
    #(0.8);
    $display("Assertion 8 is violated");
    $fatal;
end

//Assertion 9: Latency should be less than 10000 cycles for each operation
//Buy: (User ID) {item ID} {#of item} {Seller ID} 
assert_9_buy: assert property (@(negedge clk) (act_store === Buy && inf.id_valid) |-> ## [1 : 10000] inf.out_valid===1)
else begin
    #(0.9);
    $display("Assertion 9 is violated");
    $fatal;
end
//Check: (User ID) {item}
assert_9_check: assert property (
    @(negedge clk) 
    ((act_store === Check && inf.act_valid) |-> ##[1 : 10000] inf.out_valid ===1) or
    ((act_store === Check && inf.id_valid) |-> ##[1 : 10000] inf.out_valid === 1)
    )
    else begin
        #(0.9);
        $display("Assertion 9 is violated");
        $fatal;
    end

//Deposit: (User ID) {amount of money}
assert_9_deposit: assert property (@(negedge clk) (act_store === Deposit && inf.amnt_valid) |-> ## [1 : 10000] inf.out_valid===1)
else begin
    #(0.9);
    $display("Assertion 9 is violated");
    $fatal; 
end

//Return: (user ID) {item ID}, {# of item}, {Seller ID}
assert_9_Return: assert property (@(negedge clk) (act_store === Return && inf.id_valid) |-> ## [1 : 10000] inf.out_valid===1)
else begin
    #(0.9);
    $display("Assertion 9 is violated");
    $fatal; 
end

endmodule