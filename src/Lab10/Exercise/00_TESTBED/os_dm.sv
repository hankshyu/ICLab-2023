/*
============================================================================

Date   : 2023/04/26
Author : EECS Lab

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
TO DO :
    doReturn function

TO CHECK :
    When doing return action, does it need to clear the shop_history?

TO TEST :

============================================================================
*/
`include "Usertype_OS.sv"
import usertype::*;

//======================================
//      PARAMETERS & VARIABLES
//======================================
// User modification
parameter SEED             = 123;
parameter IS_DUMP_DRAM_DAT = 0;
// PATTERN operation
parameter DRAM_OFFSET      = 'h10000;
parameter DRAM_PATH        = "../00_TESTBED/DRAM/dram.dat";
parameter USER_NUM         = 256;
//
parameter L_MONEY = 300;
parameter M_MONEY = 200;
parameter S_MONEY = 100;
parameter L_EXP   = 60;
parameter M_EXP   = 40;
parameter S_EXP   = 20;
//
parameter P_FEE       = 10;
parameter G_FEE       = 30;
parameter S_FEE       = 50;
parameter C_FEE       = 70;
parameter G_EXP_RANGE = 4000;
parameter S_EXP_RANGE = 2500;
parameter C_EXP_RANGE = 1000;

// Index
integer i;
integer j;
integer k;
integer m;
integer addr;

// FILE CONTROL
integer file;

// String control
// Should use %0s
reg[9*8:1]  reset_color       = "\033[1;0m";
reg[9*8:1]  high_brightness   = "\033[1;1m";
reg[9*8:1]  flashing          = "\033[1;5m";

reg[10*8:1] txt_black_prefix  = "\033[1;30m";
reg[10*8:1] txt_red_prefix    = "\033[1;31m";
reg[10*8:1] txt_green_prefix  = "\033[1;32m";
reg[10*8:1] txt_yellow_prefix = "\033[1;33m";
reg[10*8:1] txt_blue_prefix   = "\033[1;34m";

reg[10*8:1] bkg_black_prefix  = "\033[40;1m";
reg[10*8:1] bkg_red_prefix    = "\033[41;1m";
reg[10*8:1] bkg_green_prefix  = "\033[42;1m";
reg[10*8:1] bkg_yellow_prefix = "\033[43;1m";
reg[10*8:1] bkg_blue_prefix   = "\033[44;1m";
reg[10*8:1] bkg_white_prefix  = "\033[47;1m";

//pragma protect
//pragma protect begin
//======================================
//      Radnom Class
//======================================
// Dram shop info
class dramShopRandMgr;
    rand Item_num   mLarge;
    rand Item_num   mMedium;
    rand Item_num   mSmall;
    rand User_Level mLevel;
    rand EXP        mExp;

    function new ( int seed );
        this.srandom(seed);
    endfunction

    constraint range{
        mLarge inside { [0:(2**$bits(Item_num)-1)] };
        mMedium inside { [0:(2**$bits(Item_num)-1)] };
        mSmall inside { [0:(2**$bits(Item_num)-1)] };
        mLevel inside { mLevel };
        mExp inside { [0:(2**$bits(EXP)-1)] };
    }
endclass

// Dram user info
class dramUserRandMgr;
    rand Money        mMoney;
    rand Shopping_His mShopHistory;

    function new ( int seed );
        this.srandom(seed);
    endfunction

    constraint range{
        mMoney inside { [0:(2**$bits(Money)-1)] };
        mShopHistory.item_ID inside { mShopHistory.item_ID };
        mShopHistory.item_num inside { [0:(2**$bits(Item_num)-1)] };
        mShopHistory.seller_ID inside { [0:(2**$bits(User_id)-1)] };
    }
endclass
//pragma protect end

// Input random mgr
class inputRandMgr;
    rand Money        mMoney;
    rand User_id      mUserId;
    rand Action       mAct;
    rand Item_id      mItemId;
    rand Item_num_ext mItemNum;
    rand User_id      mOtherId;
    User_id           mBypassId;
    logic             isCheckSeller;
    /*
        'dx => action is not "check"
        0 => check user
        1 => check seller
    */

    function new ( int seed );
        this.srandom(seed);
        // TO DO
        // This is a simple way to prevent the duplicate id
        // Should find other way to randomize the user id excluding from current user id
        mBypassId = 0;
        // Use a simple bit to check the action "check" is for seller/user.
        // Should find other way to get beautiful format
        isCheckSeller = 'dx;
    endfunction
    
    constraint rangeNormal{
        mMoney inside     { [0:(2**$bits(Money)-1)] };
        // !( mAct inside    { No_action } );
        mAct inside       { Return, Buy, Check, Deposit } ; // for test
        !(mItemId inside  { No_item });
        mItemNum inside   { [0:(2**$bits(Item_num)-1)] };
        !(mOtherId inside { mUserId });
        mOtherId inside   { [0:(2**$bits(User_id)-1)] };
    }
    constraint rangeId{
        !(mUserId inside { mBypassId });
        mUserId inside   { [0:(2**$bits(User_id)-1)] };
    }

    function void displayInfo();
        $display("%0s==============================%0s", bkg_red_prefix, reset_color);
        $display("%0s=     Random Input Class     =%0s", bkg_red_prefix, reset_color);
        $display("%0s==============================%0s", bkg_red_prefix, reset_color);
        $display("------------------------------");
        $display("[Info] : Money     : %9d", this.mMoney);
        $display("[Info] : User Id   : %9d", this.mUserId);
        $display("[Info] : Action    : %9s", this.mAct.name());
        $display("[Info] : Item Id   : %9s", this.mItemId.name());
        $display("[Info] : Item Num  : %9d", this.mItemNum);
        $display("[Info] : Other Id  : %9d", this.mOtherId);
        $display("------------------------------");
        $display("[Info] : Bypass Id : %9d", this.mBypassId);
        $display("[Info] : Check Seller : %6d", this.isCheckSeller);
        $display("------------------------------\n");
    endfunction
endclass

//======================================
//      DRAM Mgr
//======================================
class dramMgr;

    logic [7:0] golden_DRAM[ (DRAM_OFFSET+0) : ((DRAM_OFFSET+USER_NUM*8)-1) ];

    function new();
        ;
    endfunction

    // Main API
    // Random dram.dat, use the parameter in PATTERN to control this function
    function void randDramDat();
        // Initialize dram class
        dramShopRandMgr mDramShop = new(SEED);
        dramUserRandMgr mDramUser = new(SEED);
        // Dump dram.dat
        $display("[Info] : Randomize the DRAM data");
        $display("[Info] : File Path   : %0s", DRAM_PATH);
        $display("[Info] : Random SEED : %-1d", SEED);
        file = $fopen(DRAM_PATH,"w");
        for(i=0 ; i<USER_NUM ; i=i+1) begin
            // Shop info
            addr = DRAM_OFFSET + i*8;
            void'(mDramShop.randomize());
            if(mDramShop.mLevel == Platinum) mDramShop.mExp = 0;
            else if(mDramShop.mLevel == Gold) mDramShop.mExp = mDramShop.mExp%G_EXP_RANGE;
            else if(mDramShop.mLevel == Silver) mDramShop.mExp = mDramShop.mExp%S_EXP_RANGE;
            else if(mDramShop.mLevel == Copper) mDramShop.mExp = mDramShop.mExp%C_EXP_RANGE;
            $fwrite(file, "@%5h\n", addr);
            $fwrite(file, "%h %h %h %h\n",
                {mDramShop.mLarge, mDramShop.mMedium[5:4]},
                {mDramShop.mMedium[3:0], mDramShop.mSmall[5:2]},
                {mDramShop.mSmall[1:0], mDramShop.mLevel, mDramShop.mExp[11:8]},
                {mDramShop.mExp[7:0]}
            );
            // User info
            addr = DRAM_OFFSET + i*8 + 4;
            void'(mDramUser.randomize());
            $fwrite(file, "@%5h\n", addr);
            if(mDramUser.mShopHistory.item_ID == No_item) begin
                $fwrite(file, "00 00 00 00\n",);
            end
            else begin
                $fwrite(file, "%h %h %h %h\n",
                    mDramUser.mMoney[15:8],
                    mDramUser.mMoney[7:0],
                    mDramUser.mShopHistory[15:8],
                    mDramUser.mShopHistory[7:0]
                );
            end
        end
        $fclose(file);
    endfunction

//pragma protect
//pragma protect begin
    // Read the dram from dram.dat
    function void readDramFromDat();
        $readmemh( DRAM_PATH, golden_DRAM );
    endfunction

    // Accessor
    function Shop_Info getShopInfo(User_id u_id);
        Shop_Info s_info;
        s_info.large_num  =  this.golden_DRAM[ (DRAM_OFFSET+u_id*8)   ][7:2];
        s_info.medium_num = {this.golden_DRAM[ (DRAM_OFFSET+u_id*8)   ][1:0], this.golden_DRAM[ (DRAM_OFFSET+u_id*8+1) ][7:4]};
        s_info.small_num  = {this.golden_DRAM[ (DRAM_OFFSET+u_id*8+1) ][3:0], this.golden_DRAM[ (DRAM_OFFSET+u_id*8+2) ][7:6]};
        s_info.level      =  User_Level'(this.golden_DRAM[ (DRAM_OFFSET+u_id*8+2) ][5:4]);
        s_info.exp        = {this.golden_DRAM[ (DRAM_OFFSET+u_id*8+2) ][3:0], this.golden_DRAM[ (DRAM_OFFSET+u_id*8+3) ]};
        return s_info;
    endfunction

    function User_Info getUserInfo(User_id u_id);
        User_Info u_info;
        u_info.money        = {this.golden_DRAM[ (DRAM_OFFSET+u_id*8+4) ], this.golden_DRAM[ (DRAM_OFFSET+u_id*8+5) ]};
        u_info.shop_history = {this.golden_DRAM[ (DRAM_OFFSET+u_id*8+6) ], this.golden_DRAM[ (DRAM_OFFSET+u_id*8+7) ]};
        return u_info;
    endfunction

    // Modifier
    function void setShopInfo(User_id u_id, Shop_Info s_info);
        this.golden_DRAM[ (DRAM_OFFSET+u_id*8)   ][7:2]                                                    = s_info.large_num ;
        {this.golden_DRAM[ (DRAM_OFFSET+u_id*8)   ][1:0], this.golden_DRAM[ (DRAM_OFFSET+u_id*8+1) ][7:4]} = s_info.medium_num;
        {this.golden_DRAM[ (DRAM_OFFSET+u_id*8+1) ][3:0], this.golden_DRAM[ (DRAM_OFFSET+u_id*8+2) ][7:6]} = s_info.small_num ;
        this.golden_DRAM[ (DRAM_OFFSET+u_id*8+2) ][5:4]                                                    = s_info.level     ;
        {this.golden_DRAM[ (DRAM_OFFSET+u_id*8+2) ][3:0], this.golden_DRAM[ (DRAM_OFFSET+u_id*8+3) ]}      = s_info.exp       ;
    endfunction

    function void setUserInfo(User_id u_id, User_Info u_info);
        {this.golden_DRAM[ (DRAM_OFFSET+u_id*8+4) ], this.golden_DRAM[ (DRAM_OFFSET+u_id*8+5) ]} = u_info.money       ;
        {this.golden_DRAM[ (DRAM_OFFSET+u_id*8+6) ], this.golden_DRAM[ (DRAM_OFFSET+u_id*8+7) ]} = u_info.shop_history;
    endfunction
//pragma protect end
    // Display function
    function void displayDramInfo(User_id u_id);
        Shop_Info s_info;
        User_Info u_info;
        s_info = this.getShopInfo(u_id);
        u_info = this.getUserInfo(u_id);
        $display("[ Dram id] : %3d/@%5h\n", u_id,u_id);
        $display("[ Shop Info ]           | [ User Info ]");
        $display("[ %9h ]           | [ %9h ]", DRAM_OFFSET + u_id*8, DRAM_OFFSET + u_id*8 + 4);
        $display("[ Large  ] : %10d | [ Money ]     : %d", s_info.large_num, u_info.money);
        $display("[ Medium ] : %10d | < Shopping History >", s_info.medium_num);
        $display("[ Small  ] : %10d | < [Item Id]   : %10s >", s_info.small_num, u_info.shop_history.item_ID.name());
        $display("[ Level  ] : %10s | < [Item num]  : %10d >", s_info.level.name(), u_info.shop_history.item_num);
        $display("[ Exp    ] : %10d | < [Seller Id] : %10d >", s_info.exp, u_info.shop_history.seller_ID);
    endfunction

    function void dumpToFile();
        file = $fopen("dramCheck.txt","w");
        for(i=0 ; i<USER_NUM ; i=i+1) begin
            Shop_Info s_info;
            User_Info u_info;
            s_info = this.getShopInfo(i);
            u_info = this.getUserInfo(i);
            $fwrite(file, "======================================================\n");
            $fwrite(file, "[ Dram Id ] : %3d/@%5h\n", i,i);
            $fwrite(file, "[ Shop Info ]           | [ User Info ]\n");
            $fwrite(file, "[ %9h ]           | [ %9h ]\n", DRAM_OFFSET + i*8, DRAM_OFFSET + i*8 + 4);
            $fwrite(file, "[ Large  ] : %10d | [ Money ]     : %d\n", s_info.large_num, u_info.money);
            $fwrite(file, "[ Medium ] : %10d | < Shopping History >\n", s_info.medium_num);
            $fwrite(file, "[ Small  ] : %10d | < Item Id   > : %10s >\n", s_info.small_num, u_info.shop_history.item_ID.name());
            $fwrite(file, "[ Level  ] : %10s | < Item num  > : %10d >\n", s_info.level.name(), u_info.shop_history.item_num);
            $fwrite(file, "[ Exp    ] : %10d | < Seller Id > : %10d >\n", s_info.exp, u_info.shop_history.seller_ID);
            $fwrite(file, "======================================================\n");
        end
        $fclose(file);
    endfunction
endclass

//pragma protect
//pragma protect begin
//======================================
//      Input Data Mgr
//======================================
// TO DO
// Check the demand of this class
class inputRecordMgr;
    User_id      mCurUserId;
    User_id      mTargetUserId;
    Action       mCurAct;
    Item_id      mCurItemId;
    Item_num_ext mCurItemNum;
    Money        mCurMoney;
    
    function new();
        
    endfunction
endclass
//pragma protect end

//======================================
//      Message and Output Checker Mgr
//======================================
class inputInfoMgr;
    User_id   mId;
    Shop_Info old_shopInfo;
    Shop_Info new_shopInfo;
    User_Info old_userInfo;
    User_Info new_userInfo;

//pragma protect
//pragma protect begin
    function new();
        this.reset();
    endfunction

    function void reset();
        mId      = 0;
        // Shop
        old_shopInfo = 0;
        new_shopInfo = 0;
        // User
        old_userInfo = 0;
        new_userInfo = 0;
    endfunction

    // Modifier
    function void setId(User_id in_id);
        mId = in_id;
    endfunction

    function void setOldShopInfo(Shop_Info in_shopInfo);
        old_shopInfo = in_shopInfo;
    endfunction

    function void setNewShopInfo(Shop_Info in_shopInfo);
        new_shopInfo = in_shopInfo;
    endfunction

    function void setOldUserInfo(Shop_Info in_userInfo);
        old_userInfo = in_userInfo;
    endfunction

    function void setNewUserInfo(Shop_Info in_userInfo);
        new_userInfo = in_userInfo;
    endfunction
//pragma protect end
    function void display();
        $display("---------------------------------------------------------------------");
        $display("%0s=     Shop Info        =%0s", bkg_yellow_prefix,reset_color);
        $display("---------------------------------------------------------------------");
        $display("[Shop Id  ] : 0x%3h/%4d", this.mId, this.mId);
        $display("[Dram Addr] : %5h", this.mId*8 + DRAM_OFFSET);
        $display("---------------------------------------------------------------------");
        $display("        [# of Large] [# of Medium] [# of Small] | [   Level] | [ Exp]");
        $display("[Old] : [%10d] [%11d] [%10d] | [%8s] | [%4d]", 
            this.old_shopInfo.large_num, 
            this.old_shopInfo.medium_num,
            this.old_shopInfo.small_num,
            this.old_shopInfo.level.name(),
            this.old_shopInfo.exp
        );
        $display("[New] : [%10d] [%11d] [%10d] | [%8s] | [%4d]", 
            this.new_shopInfo.large_num, 
            this.new_shopInfo.medium_num,
            this.new_shopInfo.small_num,
            this.new_shopInfo.level.name(),
            this.new_shopInfo.exp
        );
        $display("---------------------------------------------------------------------");
        $display("%0s=     User Info        =%0s", bkg_green_prefix,reset_color);
        $display("---------------------------------------------------------------------");
        $display("[Dram Addr] : %5h", this.mId*8 + DRAM_OFFSET + 4);
        $display("---------------------------------------------------------------------");
        $display("                  <<           Shop History           >>");
        $display("        [Money] | [   Item] | [# of Item] | [ Seller Id]");
        $display("[Old] : [%5d] | [%7s] | [%9d] | [0x%3h/%4d]", 
            this.old_userInfo.money, 
            this.old_userInfo.shop_history.item_ID.name(), 
            this.old_userInfo.shop_history.item_num, 
            this.old_userInfo.shop_history.seller_ID, this.old_userInfo.shop_history.seller_ID
        );
        $display("[New] : [%5d] | [%7s] | [%9d] | [0x%3h/%4d]", 
            this.new_userInfo.money, 
            this.new_userInfo.shop_history.item_ID.name(), 
            this.new_userInfo.shop_history.item_num, 
            this.new_userInfo.shop_history.seller_ID, this.new_userInfo.shop_history.seller_ID
        );
        $display("---------------------------------------------------------------------\n");
    endfunction
endclass

class outputCheckMgr;
    logic        goldComplete;
    Error_Msg    goldErrMsg;
    logic [31:0] goldInfo;

    logic        yourComplete;
    Error_Msg    yourErrMsg;
    logic [31:0] yourInfo;
//pragma protect
//pragma protect begin
    function new();
        this.reset();
    endfunction

    function void reset();
        goldComplete = 0;
        goldErrMsg   = No_Err;
        goldInfo     = 0;
        yourComplete = 0;
        yourErrMsg   = No_Err;
        yourInfo     = 0;
    endfunction

    // Main API
    function bit checkIsCorrect();
        if ( yourComplete !== goldComplete || yourErrMsg !== goldErrMsg || yourInfo !== goldInfo) begin
            this.displayOutputInfo();
            return 0;
        end
        else return 1;
    endfunction

    // Modifter 
    function void setGoldOutput(logic complete_in, Error_Msg err_msg_in, logic[31:0] info_in);
        goldComplete = complete_in;
        goldErrMsg   = err_msg_in;
        goldInfo     = info_in;
    endfunction

    function void setYourOutput(logic complete_in, Error_Msg err_msg_in, logic[31:0] info_in);
        yourComplete = complete_in;
        yourErrMsg   = err_msg_in;
        yourInfo     = info_in;
    endfunction
//pragma protect end
    // Display function
    function void displayOutputInfo();
        $display("%0s==============================%0s", bkg_red_prefix, reset_color);
        $display("%0s=        Output Info         =%0s", bkg_red_prefix, reset_color);
        $display("%0s==============================%0s", bkg_red_prefix, reset_color);
        $display("----------------------------------------------------------------");
        $display("       [Complete] | [    Err Msg   ] | [  Info  ]");
        $display("[Gold] [%8d] | [%14s] | [%8h]", this.goldComplete, this.goldErrMsg.name(), this.goldInfo);
        $display("[Your] [%8d] | [%14s] | [%8h]", this.yourComplete, this.yourErrMsg.name(), this.yourInfo);
        $display("----------------------------------------------------------------\n");
    endfunction
endclass

//======================================
//      Online Shopping Mgr
//======================================
class onlineShopMgr;
    // Dram Mgr
    dramMgr m_dramMgr;

    // Input Random Mgr
    inputRandMgr m_inputRandMgr;

    // Message and Output Checker
    outputCheckMgr m_outCheckMgr;
    // Output
    logic gold_complete;
    Error_Msg gold_err_msg;
    logic[31:0] gold_info;

    // Main operator
    inputInfoMgr m_mainMgr;

    // Target
    inputInfoMgr m_targetMgr;

    // Action Record
    logic m_vAct[0:USER_NUM-1];
    logic errActMain, errActTarget;
    /*
        'dx : other
        'd0 : buy
        'd1 : sell
    */
    User_id m_vTradeId[0:USER_NUM-1];
    User_id errIdMain, errIdTarget;

//pragma protect
//pragma protect begin
    function new();
        // Initialize the mgr class
        m_dramMgr = new();
        m_inputRandMgr = new(SEED);
        m_outCheckMgr = new();
        m_mainMgr = new();
        m_targetMgr = new();
        for(i=0 ; i<USER_NUM ; i=i+1) begin
            m_vAct[i] = 'dx;
            m_vTradeId[i] = 'dx;
        end
        this.resetBuyerAndSeller();
    endfunction

    function void resetBuyerAndSeller();
        m_mainMgr.reset();
        m_targetMgr.reset();
    endfunction
//pragma protect end

    // Main API
    // Randomize dram.dat
    function void runDram(bit isReRandomize);
        if(isReRandomize) this.m_dramMgr.randDramDat();
        this.m_dramMgr.readDramFromDat();
        if(IS_DUMP_DRAM_DAT) this.m_dramMgr.dumpToFile();
    endfunction


    // Randomize input
    function void runInputRandom(bit isNewId);
        m_inputRandMgr.isCheckSeller = 'dx;
        if(isNewId) begin
            m_inputRandMgr.rangeId.constraint_mode(1);
            m_inputRandMgr.mUserId.rand_mode(1);
        end
        else begin
            m_inputRandMgr.rangeId.constraint_mode(0);
            m_inputRandMgr.mUserId.rand_mode(0);
        end
        void'(m_inputRandMgr.randomize());
        if(isNewId) m_inputRandMgr.mBypassId = m_inputRandMgr.mUserId;
    endfunction

//pragma protect
//pragma protect begin
    // Run action
    function void runAction();
        this.setDataForCurAction();
        // this.m_mainMgr.display();
        // this.m_targetMgr.display();
        if(this.m_inputRandMgr.mAct == Buy)          this.doBuy();
        else if(this.m_inputRandMgr.mAct == Check)   this.doCheck();
        else if(this.m_inputRandMgr.mAct == Deposit) this.doDeposit();
        else if(this.m_inputRandMgr.mAct == Return)  this.doReturn();
        else begin
            $display("[Error] : This action in runAction shouldn't be happened. Please consult the PATTERN owner...");
        end
    endfunction

    // Check the correctness
    function bit checkIsCorrect(logic u_complete, Error_Msg u_err_msg, logic[31:0] u_info);
        bit isCorrect;
        this.m_outCheckMgr.setYourOutput(u_complete, u_err_msg, u_info);
        // this.m_mainMgr.display();
        // this.m_targetMgr.display();
        // this.m_outCheckMgr.displayOutputInfo();
        isCorrect = this.m_outCheckMgr.checkIsCorrect();
        if(!isCorrect) begin
            this.displayAction();
            if(this.m_inputRandMgr.mAct == Buy) begin
                $display("%0s%0s<<     Buyer Info     >>%0s", bkg_white_prefix, txt_black_prefix, reset_color);
                this.m_mainMgr.display();
                $display("%0s%0s<<     Seller Info    >>%0s", bkg_white_prefix, txt_black_prefix, reset_color);
                this.m_targetMgr.display();
            end
            else if(this.m_inputRandMgr.mAct == Check) begin
                if(this.m_inputRandMgr.isCheckSeller == 1) begin
                    $display("%0s%0s<<     Seller Info    >>%0s", bkg_white_prefix, txt_black_prefix, reset_color);
                    this.m_targetMgr.display();
                end
                else if(this.m_inputRandMgr.isCheckSeller == 0) begin
                    $display("%0s%0s<<     Buyer Info     >>%0s", bkg_white_prefix, txt_black_prefix, reset_color);
                    this.m_mainMgr.display();
                end
                else begin
                    $display("[Error] : Invalid isCheckSeller. Please consult the PATTERN owner...");
                    $finish;
                end
            end
            else if(this.m_inputRandMgr.mAct == Deposit) begin
                this.m_mainMgr.display();
            end
            else if(this.m_inputRandMgr.mAct == Return) begin
                $display("%0s%0s<<     Buyer Info     >>%0s", bkg_white_prefix, txt_black_prefix, reset_color); 
                if(errActMain == 1'd0) $display("[Pre-act  ] :    Buy");
                else if(errActMain == 1'd1) $display("[Pre-act  ] : Seller");
                else $display("[Pre-act  ] :  Other");
                $display("[Act Id   ] : %6d", errIdMain);
                this.m_mainMgr.display();

                $display("%0s%0s<<     Seller Info    >>%0s", bkg_white_prefix, txt_black_prefix, reset_color);
                if(errActTarget == 1'd0) $display("[Pre-act  ] :    Buy");
                else if(errActTarget == 1'd1) $display("[Pre-act  ] : Seller");
                else $display("[Pre-act  ] :  Other");
                $display("[Act Id   ] : %6d", errIdTarget);
                this.m_targetMgr.display();
            end
            else begin
                $display("[Error] : This action in checkIsCorrect shouldn't be happened. Please consult the PATTERN owner...");
                $finish;
            end

            $display("%0s%0s[Error] : Fail! Stop Running!%0s", flashing, txt_red_prefix, reset_color);
            $display("%0s%0s[Error] : Debug info is shown above!%0s", flashing, txt_red_prefix, reset_color);
            return 0;
        end
        return 1;
    endfunction

    // For specific action "Return"
    function void reGenForReturn();
        User_Info m_userInfo = m_dramMgr.getUserInfo(this.m_inputRandMgr.mUserId);
        this.m_inputRandMgr.mItemId  = m_userInfo.shop_history.item_ID;
        this.m_inputRandMgr.mItemNum = m_userInfo.shop_history.item_num;
        this.m_inputRandMgr.mOtherId = m_userInfo.shop_history.seller_ID;
    endfunction

    // Action API
    function void setDataForCurAction();
        Shop_Info m_shopInfo;
        User_Info m_userInfo;
        this.resetBuyerAndSeller();
        m_shopInfo = m_dramMgr.getShopInfo(this.m_inputRandMgr.mUserId);
        m_userInfo = m_dramMgr.getUserInfo(this.m_inputRandMgr.mUserId);
        this.m_mainMgr.setId(this.m_inputRandMgr.mUserId);
        this.m_mainMgr.setOldShopInfo(m_shopInfo);
        this.m_mainMgr.setNewShopInfo(m_shopInfo);
        this.m_mainMgr.setOldUserInfo(m_userInfo);
        this.m_mainMgr.setNewUserInfo(m_userInfo);
        if(this.m_inputRandMgr.mAct == Buy || this.m_inputRandMgr.mAct == Return || this.m_inputRandMgr.mAct == Check) begin
            m_shopInfo = m_dramMgr.getShopInfo(this.m_inputRandMgr.mOtherId);
            m_userInfo = m_dramMgr.getUserInfo(this.m_inputRandMgr.mOtherId);
            this.m_targetMgr.setId(this.m_inputRandMgr.mOtherId);
            this.m_targetMgr.setOldShopInfo(m_shopInfo);
            this.m_targetMgr.setNewShopInfo(m_shopInfo);
            this.m_targetMgr.setOldUserInfo(m_userInfo);
            this.m_targetMgr.setNewUserInfo(m_userInfo);
        end
        else if(this.m_inputRandMgr.mAct == Deposit) begin
            ;
        end
        else begin
            $display("[Error] : This action in setDataForCurAction shouldn't be happened. Please consult the PATTERN owner...");
        end
    endfunction

    function void doBuy();
        // User & Shop
        Shop_Info m_buyShopInfo  = this.m_mainMgr.old_shopInfo;
        User_Info m_buyUserInfo  = this.m_mainMgr.old_userInfo;
        Shop_Info m_sellShopInfo = this.m_targetMgr.old_shopInfo;
        User_Info m_sellUserInfo = this.m_targetMgr.old_userInfo;
        // Action 
        Item_id m_curItem     = this.m_inputRandMgr.mItemId;
        Item_num m_curItemNum = this.m_inputRandMgr.mItemNum;
        Money m_moneyItem;
        Money m_fee;
        EXP m_expItem;
        // Determine parameter
        if(m_curItem == Large) begin
            m_moneyItem = L_MONEY;
            m_expItem = L_EXP;
        end
        else if(m_curItem == Medium) begin
            m_moneyItem = M_MONEY;
            m_expItem = M_EXP;
        end
        else if(m_curItem == Small) begin
            m_moneyItem = S_MONEY;
            m_expItem = S_EXP;
        end

        if(m_buyShopInfo.level == Platinum) m_fee = P_FEE;
        else if(m_buyShopInfo.level == Gold) m_fee = G_FEE;
        else if(m_buyShopInfo.level == Silver) m_fee = S_FEE;
        else if(m_buyShopInfo.level == Copper) m_fee = C_FEE;

        if(
            ( m_curItem == Large && (m_buyShopInfo.large_num + m_curItemNum) > ((2**$bits(Item_num))-1) ) ||
            ( m_curItem == Medium && (m_buyShopInfo.medium_num + m_curItemNum) > ((2**$bits(Item_num))-1) )||
            ( m_curItem == Small && (m_buyShopInfo.small_num + m_curItemNum) > ((2**$bits(Item_num))-1) )
        ) begin
            gold_complete = 0;
            gold_err_msg = INV_Full;
            gold_info = 0;
        end
        else if(
            ( m_curItem == Large && (m_sellShopInfo.large_num < m_curItemNum) ) ||
            ( m_curItem == Medium && (m_sellShopInfo.medium_num < m_curItemNum) ) ||
            ( m_curItem == Small && (m_sellShopInfo.small_num < m_curItemNum) )
        ) begin
            gold_complete = 0;
            gold_err_msg = INV_Not_Enough;
            gold_info = 0;
        end
        else if( (m_buyUserInfo.money < m_curItemNum*m_moneyItem + m_fee) ) begin
            gold_complete = 0;
            gold_err_msg = Out_of_money;
            gold_info = 0;
        end
        else begin
            gold_complete = 1;
            gold_err_msg = No_Err;
            gold_info = 0;
            // Money
            m_buyUserInfo.money = m_buyUserInfo.money - m_curItemNum*m_moneyItem - m_fee;
            if(m_sellUserInfo.money + m_curItemNum*m_moneyItem < ((2**$bits(Money))-1))
                m_sellUserInfo.money = m_sellUserInfo.money + m_curItemNum*m_moneyItem;
            else
                m_sellUserInfo.money = ((2**$bits(Money))-1);
            // Item
            if(m_curItem == Large) begin
                m_buyShopInfo.large_num = m_buyShopInfo.large_num + m_curItemNum;
                m_sellShopInfo.large_num = m_sellShopInfo.large_num - m_curItemNum;
            end
            else if(m_curItem == Medium) begin
                m_buyShopInfo.medium_num = m_buyShopInfo.medium_num + m_curItemNum;
                m_sellShopInfo.medium_num = m_sellShopInfo.medium_num - m_curItemNum;
                
            end
            else if(m_curItem == Small) begin
                m_buyShopInfo.small_num = m_buyShopInfo.small_num + m_curItemNum;
                m_sellShopInfo.small_num = m_sellShopInfo.small_num - m_curItemNum;
                
            end
            // Exp
            if(m_buyShopInfo.exp + m_curItemNum*m_expItem < ((2**$bits(EXP))-1))
                m_buyShopInfo.exp = m_buyShopInfo.exp + m_curItemNum*m_expItem;
            else
                m_buyShopInfo.exp = ((2**$bits(EXP))-1);
            // Evolve
            if(m_buyShopInfo.level == Copper) begin
                if(m_buyShopInfo.exp >= C_EXP_RANGE) begin
                    m_buyShopInfo.exp = 0;
                    m_buyShopInfo.level = Silver;
                end
            end
            else if(m_buyShopInfo.level == Silver) begin
                if(m_buyShopInfo.exp >= S_EXP_RANGE) begin
                    m_buyShopInfo.exp = 0;
                    m_buyShopInfo.level = Gold;
                end
            end
            else if(m_buyShopInfo.level == Gold) begin
                if(m_buyShopInfo.exp >= G_EXP_RANGE) begin
                    m_buyShopInfo.exp = 0;
                    m_buyShopInfo.level = Platinum;
                end
            end
            else if(m_buyShopInfo.level == Platinum) begin
                m_buyShopInfo.exp = 0;
            end
            // Buy History
            m_buyUserInfo.shop_history.item_ID = m_curItem;
            m_buyUserInfo.shop_history.item_num = m_curItemNum;
            m_buyUserInfo.shop_history.seller_ID = m_targetMgr.mId;
            // Record the previous action
            errActMain = this.m_vAct[this.m_mainMgr.mId];
            errIdMain = this.m_vTradeId[this.m_mainMgr.mId];
            errActTarget = this.m_vAct[this.m_targetMgr.mId];
            errIdTarget = this.m_vTradeId[this.m_targetMgr.mId];
            this.m_vAct[this.m_mainMgr.mId] = 1'd0;
            this.m_vTradeId[this.m_mainMgr.mId] = this.m_targetMgr.mId;
            this.m_vAct[this.m_targetMgr.mId] = 1'd1;
            this.m_vTradeId[this.m_targetMgr.mId] = this.m_mainMgr.mId;
            // Output Info
            gold_info = m_buyUserInfo;
        end
        // Output
        this.m_mainMgr.setNewShopInfo(m_buyShopInfo);
        this.m_mainMgr.setNewUserInfo(m_buyUserInfo);
        this.m_targetMgr.setNewShopInfo(m_sellShopInfo);
        this.m_targetMgr.setNewUserInfo(m_sellUserInfo);
        // Dram
        this.m_dramMgr.setShopInfo(this.m_mainMgr.mId ,this.m_mainMgr.new_shopInfo);
        this.m_dramMgr.setUserInfo(this.m_mainMgr.mId ,this.m_mainMgr.new_userInfo);
        this.m_dramMgr.setShopInfo(this.m_targetMgr.mId ,this.m_targetMgr.new_shopInfo);
        this.m_dramMgr.setUserInfo(this.m_targetMgr.mId ,this.m_targetMgr.new_userInfo);
        // Output info
        this.m_outCheckMgr.setGoldOutput(gold_complete, gold_err_msg, gold_info);
    endfunction

    function void doCheck();
        gold_complete = 1;
        gold_err_msg = No_Err;
        gold_info = 0;
        if(this.m_inputRandMgr.isCheckSeller == 1) begin
            gold_info = {this.m_targetMgr.old_shopInfo.large_num ,this.m_targetMgr.old_shopInfo.medium_num ,this.m_targetMgr.old_shopInfo.small_num };
            // Record the previous action
            errActTarget = this.m_vAct[this.m_targetMgr.mId];
            errIdTarget = this.m_vTradeId[this.m_targetMgr.mId];
            this.m_vAct[this.m_targetMgr.mId] = 'dx;
            this.m_vTradeId[this.m_targetMgr.mId] = 'dx;
        end
        else if(this.m_inputRandMgr.isCheckSeller == 0) begin
            gold_info = this.m_mainMgr.old_userInfo.money;
        end
        else begin
            $display("[Error] : Invalid isCheckSeller. Please consult the PATTERN owner...");
        end
        // Record the previous action
        errActMain = this.m_vAct[this.m_mainMgr.mId];
        errIdMain = this.m_vTradeId[this.m_mainMgr.mId];
        this.m_vAct[this.m_mainMgr.mId] = 'dx;
        this.m_vTradeId[this.m_mainMgr.mId] = 'dx;
        // Output info
        this.m_outCheckMgr.setGoldOutput(gold_complete, gold_err_msg, gold_info);
    endfunction

    function void doDeposit();
        User_Info m_buyUserInfo  = this.m_mainMgr.old_userInfo;
        Money m_curMoney = this.m_inputRandMgr.mMoney;
        if( (m_buyUserInfo.money + m_curMoney) > ((2**$bits(Money))-1) ) begin
            gold_complete = 0;
            gold_err_msg = Wallet_is_Full;
            gold_info = 0;
        end
        else begin
            // Output
            m_buyUserInfo.money = m_buyUserInfo.money + m_curMoney;
            // Output Info
            gold_complete = 1;
            gold_err_msg = No_Err;
            gold_info = m_buyUserInfo.money;
            // Record the previous action
            errActMain = this.m_vAct[this.m_mainMgr.mId];
            errIdMain = this.m_vTradeId[this.m_mainMgr.mId];
            this.m_vAct[this.m_mainMgr.mId] = 'dx;
            this.m_vTradeId[this.m_mainMgr.mId] = 'dx;
        end
        // Output
        this.m_mainMgr.setNewUserInfo(m_buyUserInfo);
        // Dram
        this.m_dramMgr.setUserInfo(this.m_mainMgr.mId ,this.m_mainMgr.new_userInfo);
        // Output Info
        this.m_outCheckMgr.setGoldOutput(gold_complete, gold_err_msg, gold_info);
    endfunction

    function void doReturn();
        // User & Shop
        Shop_Info m_buyShopInfo  = this.m_mainMgr.old_shopInfo;
        User_Info m_buyUserInfo  = this.m_mainMgr.old_userInfo;
        Shop_Info m_sellShopInfo = this.m_targetMgr.old_shopInfo;
        User_Info m_sellUserInfo = this.m_targetMgr.old_userInfo;
        // Action
        Item_id m_curItem     = this.m_inputRandMgr.mItemId;
        Item_num m_curItemNum = this.m_inputRandMgr.mItemNum;
        User_id m_curSellerId = this.m_inputRandMgr.mOtherId;
        Money m_moneyItem;
        // Determine parameter
        if(m_curItem == Large) m_moneyItem = L_MONEY;
        else if(m_curItem == Medium) m_moneyItem = M_MONEY;
        else if(m_curItem == Small) m_moneyItem = S_MONEY;

        if(
            this.m_vAct[this.m_mainMgr.mId] !== 'd0 || // A do other action
            this.m_vAct[m_buyUserInfo.shop_history.seller_ID] !== 'd1 || // History seller do other action
            (this.m_vAct[m_buyUserInfo.shop_history.seller_ID] === 'd1 && this.m_vTradeId[m_buyUserInfo.shop_history.seller_ID] !== this.m_mainMgr.mId) // History seller do other sell to another Id => wrong action
        ) begin
            gold_complete = 0;
            gold_err_msg = Wrong_act;
            gold_info = 0;
        end
        else if(m_buyUserInfo.shop_history.seller_ID !== m_curSellerId) begin
            gold_complete = 0;
            gold_err_msg = Wrong_ID;
            gold_info = 0;
        end
        else if(m_buyUserInfo.shop_history.item_num !== m_curItemNum) begin
            gold_complete = 0;
            gold_err_msg = Wrong_Num;
            gold_info = 0;
        end
        else if(m_buyUserInfo.shop_history.item_ID !== m_curItem) begin
            gold_complete = 0;
            gold_err_msg = Wrong_Item;
            gold_info = 0;
        end
        else begin
            // User
            m_buyUserInfo.money = m_buyUserInfo.money + m_moneyItem*m_curItemNum;
            if(m_curItem == Large) m_buyShopInfo.large_num = m_buyShopInfo.large_num - m_curItemNum;
            else if(m_curItem == Medium) m_buyShopInfo.medium_num = m_buyShopInfo.medium_num - m_curItemNum;
            else if(m_curItem == Small) m_buyShopInfo.small_num = m_buyShopInfo.small_num - m_curItemNum;
            // Seller
            m_sellUserInfo.money = m_sellUserInfo.money - m_moneyItem*m_curItemNum;
            if(m_curItem == Large) m_sellShopInfo.large_num = m_sellShopInfo.large_num + m_curItemNum;
            else if(m_curItem == Medium) m_sellShopInfo.medium_num = m_sellShopInfo.medium_num + m_curItemNum;
            else if(m_curItem == Small) m_sellShopInfo.small_num = m_sellShopInfo.small_num + m_curItemNum;
            // Record the previous action
            errActMain = this.m_vAct[this.m_mainMgr.mId];
            errIdMain = this.m_vTradeId[this.m_mainMgr.mId];
            errActTarget = this.m_vAct[this.m_targetMgr.mId];
            errIdTarget = this.m_vTradeId[this.m_targetMgr.mId];
            this.m_vAct[this.m_mainMgr.mId] = 'dx;
            this.m_vTradeId[this.m_mainMgr.mId] = 'dx;
            this.m_vAct[this.m_targetMgr.mId] = 'dx;
            this.m_vTradeId[this.m_targetMgr.mId] = 'dx;
            // Output Info
            gold_complete = 1;
            gold_err_msg = No_Err;
            gold_info = {m_buyShopInfo.large_num ,m_buyShopInfo.medium_num ,m_buyShopInfo.small_num };
        end
        // Output
        this.m_mainMgr.setNewShopInfo(m_buyShopInfo);
        this.m_mainMgr.setNewUserInfo(m_buyUserInfo);
        this.m_targetMgr.setNewShopInfo(m_sellShopInfo);
        this.m_targetMgr.setNewUserInfo(m_sellUserInfo);
        // Dram
        this.m_dramMgr.setShopInfo(this.m_mainMgr.mId ,this.m_mainMgr.new_shopInfo);
        this.m_dramMgr.setUserInfo(this.m_mainMgr.mId ,this.m_mainMgr.new_userInfo);
        this.m_dramMgr.setShopInfo(this.m_targetMgr.mId ,this.m_targetMgr.new_shopInfo);
        this.m_dramMgr.setUserInfo(this.m_targetMgr.mId ,this.m_targetMgr.new_userInfo);
        // Output Info
        this.m_outCheckMgr.setGoldOutput(gold_complete, gold_err_msg, gold_info);
    endfunction

    // Accessor
    function inputRandMgr getInputRandMgr();
        return this.m_inputRandMgr;
    endfunction

    // Modifier
//pragma protect end
    // Display function
    function void displayAction();
        $display("%0s==============================%0s", bkg_blue_prefix, reset_color);
        $display("%0s=        Action Info         =%0s", bkg_blue_prefix, reset_color);
        $display("%0s==============================%0s", bkg_blue_prefix, reset_color);
        $display("------------------------------");
        $display("[Action] : [%10s]", this.m_inputRandMgr.mAct.name());
        $display("------------------------------");
        if(this.m_inputRandMgr.mAct == Buy) begin
            $display(" [User Id  ] : 0x%3h/%4d", this.m_inputRandMgr.mUserId, this.m_inputRandMgr.mUserId);
            $display(" [Item     ] : %10s",  this.m_inputRandMgr.mItemId.name());
            $display(" [# of Item] : %10d",  this.m_inputRandMgr.mItemNum);
            $display(" [Shop Id  ] : 0x%3h/%4d", this.m_inputRandMgr.mOtherId, this.m_inputRandMgr.mOtherId);
        end
        else if(this.m_inputRandMgr.mAct == Check) begin
            if(this.m_inputRandMgr.isCheckSeller == 1) begin
                $display(" [Shop Id] : 0x%3h/%4d", this.m_inputRandMgr.mOtherId, this.m_inputRandMgr.mOtherId);
            end
            else if(this.m_inputRandMgr.isCheckSeller == 0) begin
                $display(" [User Id] : 0x%3h/%4d", this.m_inputRandMgr.mUserId, this.m_inputRandMgr.mUserId);
            end
            else begin
                $display("[Error] : Invalid isCheckSeller. Please consult the PATTERN owner...");
                $finish;
            end
        end
        else if(this.m_inputRandMgr.mAct == Deposit) begin
            $display(" [User Id   ] : 0x%3h/%4d", this.m_inputRandMgr.mUserId, this.m_inputRandMgr.mUserId);
            $display(" [# of Money] : %10d", this.m_inputRandMgr.mMoney);
        end
        else if(this.m_inputRandMgr.mAct == Return) begin
            $display(" [User Id  ] : 0x%3h/%4d", this.m_inputRandMgr.mUserId, this.m_inputRandMgr.mUserId);
            $display(" [Item     ] : %10s",  this.m_inputRandMgr.mItemId.name());
            $display(" [# of Item] : %10d",  this.m_inputRandMgr.mItemNum);
            $display(" [Shop Id  ] : 0x%3h/%4d", this.m_inputRandMgr.mOtherId, this.m_inputRandMgr.mOtherId);
        end
        else begin
            $display("[Error] : This action in input_task shouldn't be happened. Please consult the PATTERN owner...");
            $finish;
        end
        $display("------------------------------\n");
    endfunction
endclass