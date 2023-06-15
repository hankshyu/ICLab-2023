`include "../00_TESTBED/pseudo_DRAM.sv"
`include "Usertype_OS.sv"

program automatic PATTERN(input clk, INF.PATTERN inf);
import usertype::*;

reg[9*8:1]  reset_color       = "\033[1;0m";
reg[9*8:1]  high_brightness   = "\033[1;1m";
reg[9*8:1]  flashing          = "\033[1;5m";
reg[10*8:1] txt_black_prefix  = "\033[1;30m";
reg[10*8:1] txt_red_prefix    = "\033[1;31m";
reg[10*8:1] txt_green_prefix  = "\033[1;32m";
reg[10*8:1] txt_yellow_prefix = "\033[1;33m";
reg[10*8:1] txt_blue_prefix   = "\033[1;34m";


//======================================
//      Control Switches for PATTERN
//====================================== 
parameter PATNUM               = 743;
integer   SEED                 = 197;
parameter MAX_DELAY       = 10000;


parameter CHANGEID_RATIO        = 65; // n/100
parameter CHECK_SELLER_RATIO    = 60; // n/100
parameter CORRECT_RETURN_RATIO  = 18; // n/100


integer i,j,k,m;
integer pat;
integer exe_lat, out_lat;
integer input_delay, each_delay;
integer out_check_idx;
integer stop;

//file IO

//======================================
//      Control Switches for OOP
//====================================== 


// PATTERN operation
parameter DRAM_OFFSET      = 'h10000;
parameter DRAM_LINK        = "../00_TESTBED/DRAM/dram.dat";
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
//
parameter G_EXP_RANGE = 4000;
parameter S_EXP_RANGE = 2500;
parameter C_EXP_RANGE = 1000;
//
integer addr;
//
integer file;
//
bit changeID;
bit automode;
bit CheckSeller;
bit isCorrectReturn;

//======================================
//      OOP constructions
//======================================
class Dice;
    integer dice_num;
    
    function new ();
        this.dice_num = 0;
    endfunction

    function integer getdice();
        return this.dice_num;
    endfunction

    // provide a random of 0 ~ upper
    function integer roll1(int upper);
        this.dice_num = $random(SEED);
        this.dice_num = this.dice_num % ($unsigned(upper) + 1);
        return this.dice_num;
    endfunction

    //provide a random of lower ~ upper
    function integer roll2(int lower, int upper);
        this.dice_num = $random(SEED);
        this.dice_num = (this.dice_num % ($unsigned(upper - lower + 1))) + $unsigned(lower);
        return this.dice_num;
    endfunction

endclass


//Input Initialize Class
class inputRandomizer;
    rand Money        mMoney;
    rand User_id      mUserId;
    rand Action       mAct;
    rand Item_id      mItemId;
    rand Item_num_ext mItemNum;
    rand User_id      mOtherId;
    User_id           mBypassId;
    
    //    'dx => action is not "check", 0: check user, 1: check seller
    logic             isCheckSeller;

    function new (int seed);
        this.srandom(seed);
        mBypassId = 0;
        isCheckSeller = 'dx;
    endfunction

    function void setMoney (Money data);
        this.mMoney = data;
    endfunction
    
    function void setUser_id (User_id data);
        this.mUserId = data;
    endfunction
    
    function void setAction (Action data);
        this.mAct = data;
    endfunction
    
    function void setItem_id (Item_id data);
        this.mItemId = data;
    endfunction

    function void setItem_num (Item_num_ext data);
        this.mItemNum = data;
    endfunction

    function void setOtherId (User_id data);
        this.mOtherId = data;
    endfunction

    function void setBypassID (User_id data);
        this.mBypassId = data;
    endfunction


    function void qnewUser(User_id data);
        changeID = 1;
        setUser_id(data);
        setBypassID(data);
    endfunction

    function void qoldUser();
        changeID = 0;
    endfunction

    function void qCheckSelf();
        setAction(Check);
        CheckSeller = 0;
        this.isCheckSeller = 0;
    endfunction

    function void qCheckSeller(User_id seller);
        setAction(Check);
        setOtherId(seller);
        CheckSeller = 1;
        this.isCheckSeller = 1;
    endfunction

    function void qBuy(Item_id buyitemid, Item_num_ext buyitemnum, User_id seller);
        setAction(Buy);
        setItem_id(buyitemid);
        setItem_num(buyitemnum);
        setOtherId(seller);
    endfunction

    function void qDeposit(Money cash);
        setAction(Deposit);
        setMoney(cash);
    endfunction

    function void qReturn(Item_id rtitemid, Item_num_ext rtitemnum, User_id rtseller);
        setAction(Return);
        setItem_id(rtitemid);
        setItem_num(rtitemnum);
        setOtherId(rtseller);
    endfunction

    // function void setDeopsit()
    
    constraint rangeNormal{
        mMoney inside     { [0:60_000] };
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

endclass

//DRAM Management Class
class DRAManager;

    logic [7:0] golden_DRAM [DRAM_OFFSET : (DRAM_OFFSET + USER_NUM*8 - 1)];

    // Read the dram from dram.dat file
    function void readFromDRAMdat();
        $readmemh(DRAM_LINK, golden_DRAM);
    endfunction

    //Shop Info 
    function Shop_Info getShop(User_id u_id);
        Shop_Info s_info;
        s_info.large_num  =  this.golden_DRAM[ (DRAM_OFFSET + u_id*8 )   ][7:2];
        s_info.medium_num = {this.golden_DRAM[ (DRAM_OFFSET + u_id*8 )   ][1:0], this.golden_DRAM[ (DRAM_OFFSET+u_id*8+1) ][7:4]};
        s_info.small_num  = {this.golden_DRAM[ (DRAM_OFFSET + u_id*8 +1) ][3:0], this.golden_DRAM[ (DRAM_OFFSET+u_id*8+2) ][7:6]};
        s_info.level      =  User_Level'(this.golden_DRAM[ (DRAM_OFFSET+u_id*8+2) ][5:4]);
        s_info.exp        = {this.golden_DRAM[ (DRAM_OFFSET+u_id*8+2) ][3:0], this.golden_DRAM[ (DRAM_OFFSET+u_id*8+3) ]};
        return s_info;
    endfunction

    function void setShop(User_id u_id, Shop_Info s_info);
        this.golden_DRAM[ (DRAM_OFFSET+u_id*8)   ][7:2]                                                    = s_info.large_num ;
        {this.golden_DRAM[ (DRAM_OFFSET+u_id*8)   ][1:0], this.golden_DRAM[ (DRAM_OFFSET+u_id*8+1) ][7:4]} = s_info.medium_num;
        {this.golden_DRAM[ (DRAM_OFFSET+u_id*8+1) ][3:0], this.golden_DRAM[ (DRAM_OFFSET+u_id*8+2) ][7:6]} = s_info.small_num ;
        this.golden_DRAM[ (DRAM_OFFSET+u_id*8+2) ][5:4]                                                    = s_info.level     ;
        {this.golden_DRAM[ (DRAM_OFFSET+u_id*8+2) ][3:0], this.golden_DRAM[ (DRAM_OFFSET+u_id*8+3) ]}      = s_info.exp       ;
    endfunction

    //User Info
    function User_Info getUser(User_id u_id);
        User_Info u_info;
        u_info.money        = {this.golden_DRAM[ (DRAM_OFFSET+u_id*8+4) ], this.golden_DRAM[ (DRAM_OFFSET+u_id*8+5) ]};
        u_info.shop_history = {this.golden_DRAM[ (DRAM_OFFSET+u_id*8+6) ], this.golden_DRAM[ (DRAM_OFFSET+u_id*8+7) ]};
        return u_info;
    endfunction

    function void setUser(User_id u_id, User_Info u_info);
        {this.golden_DRAM[ (DRAM_OFFSET+u_id*8+4) ], this.golden_DRAM[ (DRAM_OFFSET+u_id*8+5) ]} = u_info.money       ;
        {this.golden_DRAM[ (DRAM_OFFSET+u_id*8+6) ], this.golden_DRAM[ (DRAM_OFFSET+u_id*8+7) ]} = u_info.shop_history;
    endfunction
endclass

class InfoManager;
    User_id   mId;
    Shop_Info old_shopInfo;
    Shop_Info new_shopInfo;
    User_Info old_userInfo;
    User_Info new_userInfo;

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

endclass

class outputChecker;
    logic        goldComplete;
    Error_Msg    goldErrMsg;
    logic [31:0] goldInfo;

    logic        yourComplete;
    Error_Msg    yourErrMsg;
    logic [31:0] yourInfo;

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

endclass

class MainShopDB;
    // Dram Mgr
    DRAManager Shop_DRAM;

    // Input Random Mgr
    inputRandomizer inRandizer;

    // Message and Output Checker
    outputChecker outChecker;
    
    // Output
    logic gold_complete;
    Error_Msg gold_err_msg;
    logic[31:0] gold_info;

    InfoManager player1MG, player2MG;

    // Action Record
    logic m_vAct[0:USER_NUM-1];
    logic errActMain, errActTarget; //(x, 0, 1) = (others, buy, sell)


    User_id m_vTradeId[0:USER_NUM-1];
    User_id errIdMain, errIdTarget;


    function new();
        // Initialize the mgr class
        Shop_DRAM = new();
        
        inRandizer = new(SEED);
        outChecker = new();
        player1MG = new();
        player2MG = new();
        for(i=0 ; i<USER_NUM ; i=i+1) begin
            m_vAct[i] = 'dx;
            m_vTradeId[i] = 'dx;
        end
        this.resetBuyerAndSeller();
    endfunction

    function void resetBuyerAndSeller();
        player1MG.reset();
        player2MG.reset();
    endfunction


    //Read DRAM Data from DRAM.dat
    function void DRAM_read();
        this.Shop_DRAM.readFromDRAMdat();
    endfunction


    // Randomize input
    function void genRANDinput(bit NewId, integer pat_number);

        inRandizer.isCheckSeller = 'dx; // not check

        case (pat_number)
            0:begin
                automode = 0;
                inRandizer.qnewUser(0);
                inRandizer.qBuy(Small, 2, 255);
            end 
            1:begin
                automode = 0;
                inRandizer.qnewUser(1);
                inRandizer.qBuy(Medium, 3, 254);
            end
            2:begin
                automode = 0;
                inRandizer.qnewUser(2);
                inRandizer.qBuy(Large, 4, 253);
                // inRandizer.mBypassId = inRandizer.mUserId;
            end
            3:begin
                automode = 0;
                inRandizer.qnewUser(3);
                inRandizer.qBuy(Medium, 5, 252);
            end 
            4:begin
                automode = 0;
                inRandizer.qnewUser(4);
                inRandizer.qBuy(Small, 6, 251);
            end
            5:begin
                automode = 0;
                inRandizer.qnewUser(5);
                inRandizer.qBuy(Medium, 7, 250);
            end
            6:begin
                automode = 0;
                inRandizer.qnewUser(6);
                inRandizer.qBuy(Large, 6, 249);
            end
            7:begin
                automode = 0;
                inRandizer.qnewUser(7);
                inRandizer.qBuy(Medium, 5, 248);
            end

            8:begin
                automode = 0;
                inRandizer.qnewUser(8);
                inRandizer.qBuy(Small, 4, 247);
            end
            9:begin
                automode = 0;
                inRandizer.qnewUser(9);
                inRandizer.qBuy(Large, 3, 246);
            end
            //intended for Wrong ID
            10:begin
                automode = 0;
                inRandizer.qnewUser(1);
                inRandizer.qReturn(Medium, 3, 130);
            end
            11:begin
                automode = 0;
                inRandizer.qoldUser();
                inRandizer.qReturn(Medium, 3, 131);
            end
            12:begin
                automode = 0;
                inRandizer.qoldUser();
                inRandizer.qReturn(Medium, 3, 132);
            end 
            13:begin
                automode = 0;
                inRandizer.qoldUser();
                inRandizer.qReturn(Medium, 3, 133);
            end
            14:begin
                automode = 0;
                inRandizer.qoldUser();
                inRandizer.qReturn(Medium, 3, 134);
            end
            //
            15:begin
                automode = 0;
                inRandizer.qnewUser(2);
                inRandizer.qReturn(Large, 4, 140);
            end
            16:begin
                automode = 0;
                inRandizer.qoldUser();
                inRandizer.qReturn(Large, 4, 141);
            end
            17:begin
                automode = 0;
                inRandizer.qoldUser();
                inRandizer.qReturn(Large, 4, 142);
            end 
            18:begin
                automode = 0;
                inRandizer.qoldUser();
                inRandizer.qReturn(Large, 4, 143);
            end
            19:begin
                automode = 0;
                inRandizer.qoldUser();
                inRandizer.qReturn(Large, 4, 144);
            end
            
            20:begin
                automode = 0;
                inRandizer.qnewUser(3);
                inRandizer.qReturn(Medium, 5, 150);
            end
            21:begin
                automode = 0;
                inRandizer.qoldUser();
                inRandizer.qReturn(Medium, 5, 151);
            end
            22:begin
                automode = 0;
                inRandizer.qoldUser();
                inRandizer.qReturn(Medium, 5, 152);
            end 
            23:begin
                automode = 0;
                inRandizer.qoldUser();
                inRandizer.qReturn(Medium, 5, 153);
            end
            24:begin
                automode = 0;
                inRandizer.qoldUser();
                inRandizer.qReturn(Medium, 5, 154);
            end
            //
            25:begin
                automode = 0;
                inRandizer.qnewUser(4);
                inRandizer.qReturn(Small, 6, 160);
            end
            26:begin
                automode = 0;
                inRandizer.qoldUser();
                inRandizer.qReturn(Small, 6, 161);
            end
            27:begin
                automode = 0;
                inRandizer.qoldUser();
                inRandizer.qReturn(Small, 6, 162);
            end 
            28:begin
                automode = 0;
                inRandizer.qoldUser();
                inRandizer.qReturn(Small, 6, 163);
            end
            29:begin
                automode = 0;
                inRandizer.qoldUser();
                inRandizer.qReturn(Small, 6, 164);
            end
            //Intended for Wrong Number
            30:begin
                automode = 0;
                inRandizer.qnewUser(0);
                inRandizer.qReturn(Small, 3, 255);
            end
            31:begin
                automode = 0;
                inRandizer.qoldUser();
                inRandizer.qReturn(Small, 4, 255);
            end
            32:begin
                automode = 0;
                inRandizer.qoldUser();
                inRandizer.qReturn(Small, 5, 255);
            end 
            33:begin
                automode = 0;
                inRandizer.qoldUser();
                inRandizer.qReturn(Small, 6, 255);
            end
            34:begin
                automode = 0;
                inRandizer.qoldUser();
                inRandizer.qReturn(Small, 7, 255);
            end
            //
            35:begin
                automode = 0;
                inRandizer.qnewUser(1);
                inRandizer.qReturn(Medium, 4, 254);
            end
            36:begin
                automode = 0;
                inRandizer.qoldUser();
                inRandizer.qReturn(Medium, 5, 254);
            end
            37:begin
                automode = 0;
                inRandizer.qoldUser();
                inRandizer.qReturn(Medium, 6, 254);
            end 
            38:begin
                automode = 0;
                inRandizer.qoldUser();
                inRandizer.qReturn(Medium, 7, 254);
            end
            39:begin
                automode = 0;
                inRandizer.qoldUser();
                inRandizer.qReturn(Medium, 1, 254);
            end
            //
            40:begin
                automode = 0;
                inRandizer.qnewUser(3);
                inRandizer.qReturn(Medium, 4, 252);
            end
            41:begin
                automode = 0;
                inRandizer.qoldUser();
                inRandizer.qReturn(Medium, 3, 252);
            end
            42:begin
                automode = 0;
                inRandizer.qoldUser();
                inRandizer.qReturn(Medium, 2, 252);
            end 
            43:begin
                automode = 0;
                inRandizer.qoldUser();
                inRandizer.qReturn(Medium, 8, 252);
            end
            44:begin
                automode = 0;
                inRandizer.qoldUser();
                inRandizer.qReturn(Medium, 9, 252);
            end
            //
            45:begin
                automode = 0;
                inRandizer.qnewUser(5);
                inRandizer.qReturn(Medium, 6, 250);
            end
            46:begin
                automode = 0;
                inRandizer.qoldUser();
                inRandizer.qReturn(Medium, 8, 250);
            end
            47:begin
                automode = 0;
                inRandizer.qoldUser();
                inRandizer.qReturn(Medium,56, 250);
            end 
            48:begin
                automode = 0;
                inRandizer.qoldUser();
                inRandizer.qReturn(Medium, 9, 250);
            end
            49:begin
                automode = 0;
                inRandizer.qoldUser();
                inRandizer.qReturn(Medium, 2, 250);
            end
            //Intended for Wrong Item
            50:begin
                automode = 0;
                inRandizer.qnewUser(0);
                inRandizer.qReturn(Medium, 2, 255);
            end
            60:begin
                automode = 0;
                inRandizer.qnewUser(0);
                inRandizer.qReturn(Large, 2, 255);
            end 
            51:begin
                automode = 0;
                inRandizer.qnewUser(1);
                inRandizer.qReturn(Small, 3, 254);
            end
            61:begin
                automode = 0;
                inRandizer.qnewUser(1);
                inRandizer.qReturn(Large, 3, 254);
            end
            52:begin
                automode = 0;
                inRandizer.qnewUser(2);
                inRandizer.qReturn(Small, 4, 253);
            end
            62:begin
                automode = 0;
                inRandizer.qnewUser(2);
                inRandizer.qReturn(Medium, 4, 253);
            end
            53:begin
                automode = 0;
                inRandizer.qnewUser(3);
                inRandizer.qReturn(Small, 5, 252);
            end 
            63:begin
                automode = 0;
                inRandizer.qnewUser(3);
                inRandizer.qReturn(Large, 5, 252);
            end 
            54:begin
                automode = 0;
                inRandizer.qnewUser(4);
                inRandizer.qReturn(Medium, 6, 251);
            end
            64:begin
                automode = 0;
                inRandizer.qnewUser(4);
                inRandizer.qReturn(Large, 6, 251);
            end
            55:begin
                automode = 0;
                inRandizer.qnewUser(5);
                inRandizer.qReturn(Small, 7, 250);
            end
            65:begin
                automode = 0;
                inRandizer.qnewUser(5);
                inRandizer.qReturn(Large, 7, 250);
            end
            56:begin
                automode = 0;
                inRandizer.qnewUser(6);
                inRandizer.qReturn(Medium, 6, 249);
            end
            66:begin
                automode = 0;
                inRandizer.qnewUser(6);
                inRandizer.qReturn(Small, 6, 249);
            end
            57:begin
                automode = 0;
                inRandizer.qnewUser(7);
                inRandizer.qReturn(Small, 5, 248);
            end
            67:begin
                automode = 0;
                inRandizer.qnewUser(7);
                inRandizer.qReturn(Large, 5, 248);
            end
            58:begin
                automode = 0;
                inRandizer.qnewUser(8);
                inRandizer.qReturn(Medium, 4, 247);
            end
            68:begin
                automode = 0;
                inRandizer.qnewUser(8);
                inRandizer.qReturn(Large, 4, 247);
            end
            59:begin
                automode = 0;
                inRandizer.qnewUser(9);
                inRandizer.qReturn(Small, 3, 246);
            end
            69:begin
                automode = 0;
                inRandizer.qnewUser(9);
                inRandizer.qReturn(Medium, 3, 246);
            end
            70:begin
                automode = 0;
                inRandizer.qnewUser(129);
                inRandizer.qBuy(Large, 5, 254);
            end
            71:begin
                automode = 0;
                inRandizer.qoldUser();
                inRandizer.qBuy(Medium, 10, 253);
            end
            72:begin
                automode = 0;
                inRandizer.qoldUser();
                inRandizer.qBuy(Small, 5, 252);
            end
            73:begin
                automode = 0;
                inRandizer.qoldUser();
                inRandizer.qBuy(Large, 3, 251);
            end
            74:begin
                automode = 0;
                inRandizer.qoldUser();
                inRandizer.qBuy(Medium, 10, 250);
            end
            75:begin
                automode = 0;
                inRandizer.qoldUser();
                inRandizer.qBuy(Medium, 10, 245);
            end
            76:begin
                automode = 0;
                inRandizer.qoldUser();
                inRandizer.qBuy(Large, 4, 246);
            end
            77:begin
                automode = 0;
                inRandizer.qoldUser();
                inRandizer.qBuy(Medium, 3, 247);
            end
            78:begin
                automode = 0;
                inRandizer.qoldUser();
                inRandizer.qBuy(Small, 6, 248);
            end
            79:begin
                automode = 0;
                inRandizer.qoldUser();
                inRandizer.qBuy(Medium, 9, 249);
            end
            80:begin
                automode = 0;
                inRandizer.qoldUser();
                inRandizer.qBuy(Medium, 10, 230);       
            end
            81:begin
                automode = 0;
                inRandizer.qoldUser();
                inRandizer.qBuy(Medium, 10, 231);
            end
            82:begin
                automode = 0;
                inRandizer.qoldUser();
                inRandizer.qBuy(Small, 5, 232);
            end
            83:begin
                automode = 0;
                inRandizer.qoldUser();
                inRandizer.qBuy(Large, 3, 233);
            end
            84:begin
                automode = 0;
                inRandizer.qoldUser();
                inRandizer.qBuy(Medium, 10, 234);
            end
            85:begin
                automode = 0;
                inRandizer.qoldUser();
                inRandizer.qBuy(Medium, 7, 235);
            end
            86:begin
                automode = 0;
                inRandizer.qoldUser();
                inRandizer.qBuy(Medium, 4, 236);
            end
            87:begin
                automode = 0;
                inRandizer.qoldUser();
                inRandizer.qBuy(Medium, 3, 237);
            end
            88:begin
                automode = 0;
                inRandizer.qoldUser();
                inRandizer.qBuy(Small, 6, 238);
            end
            89:begin
                automode = 0;
                inRandizer.qoldUser();
                inRandizer.qBuy(Large, 9, 249);
            end
            //
            701:begin
                automode = 0;
                inRandizer.qnewUser(13);
                inRandizer.qCheckSelf();
            end
            702:begin
                automode = 0;
                inRandizer.qnewUser(26);
                inRandizer.qCheckSelf();
            end
            703:begin
                automode = 0;
                inRandizer.qnewUser(29);
                inRandizer.qCheckSelf();
            end
            704:begin
                automode = 0;
                inRandizer.qnewUser(48);
                inRandizer.qCheckSelf();
            end
            705:begin
             automode = 0;
                inRandizer.qnewUser(56);
                inRandizer.qCheckSelf();
            end
            706:begin
                automode = 0;
                inRandizer.qnewUser(48);
                inRandizer.qCheckSelf();
            end
            707:begin
             automode = 0;
                inRandizer.qnewUser(58);
                inRandizer.qCheckSelf();
            end
            708:begin
                automode = 0;
                inRandizer.qnewUser(61);
                inRandizer.qCheckSelf();
            end
            709:begin
             automode = 0;
                inRandizer.qnewUser(58);
                inRandizer.qCheckSelf();
            end
            710:begin
                automode = 0;
                inRandizer.qnewUser(61);
                inRandizer.qCheckSelf();
            end
            711:begin
                automode = 0;
                inRandizer.qnewUser(101);
                inRandizer.qCheckSelf();
            end
            712:begin
                automode = 0;
                inRandizer.qnewUser(107);
                inRandizer.qCheckSelf();
            end
            713:begin
                automode = 0;
                inRandizer.qnewUser(108);
                inRandizer.qCheckSelf();
            end
            714:begin
                automode = 0;
                inRandizer.qnewUser(110);
                inRandizer.qCheckSelf();
            end
            715, 719:begin
                automode = 0;
                inRandizer.qnewUser(120);
                inRandizer.qCheckSelf();
            end
            716, 720:begin
                automode = 0;
                inRandizer.qnewUser(121);
                inRandizer.qCheckSelf();
            end
            717, 721:begin
                automode = 0;
                inRandizer.qnewUser(122);
                inRandizer.qCheckSelf();
            end
            718, 723:begin
                automode = 0;
                inRandizer.qnewUser(123);
                inRandizer.qCheckSelf();
            end
            724:begin
                automode = 0;
                inRandizer.qnewUser(154);
                inRandizer.qCheckSelf();
            end
            725:begin
                automode = 0;
                inRandizer.qnewUser(166);
                inRandizer.qCheckSelf();
            end
            726,728:begin
                automode = 0;
                inRandizer.qnewUser(172);
                inRandizer.qCheckSelf();
            end
            727:begin
                automode = 0;
                inRandizer.qnewUser(178);
                inRandizer.qCheckSelf();
            end
            729:begin
                automode = 0;
                inRandizer.qnewUser(195);
                inRandizer.qCheckSelf();
            end
            730:begin
                automode = 0;
                inRandizer.qnewUser(198);
                inRandizer.qCheckSelf();
            end
            731:begin
                automode = 0;
                inRandizer.qnewUser(203);
                inRandizer.qCheckSelf();
            end
            732:begin
                automode = 0;
                inRandizer.qnewUser(198);
                inRandizer.qCheckSelf();
            end
            733:begin
                automode = 0;
                inRandizer.qnewUser(208);
                inRandizer.qCheckSelf();
            end
            734, 736:begin
                automode = 0;
                inRandizer.qnewUser(210);
                inRandizer.qCheckSelf();
            end
            735, 737:begin
                automode = 0;
                inRandizer.qnewUser(216);
                inRandizer.qCheckSelf();
            end
            738:begin
                automode = 0;
                inRandizer.qnewUser(218);
                inRandizer.qCheckSelf();
            end
            739:begin
                automode = 0;
                inRandizer.qnewUser(234);
                inRandizer.qCheckSelf();
            end
            //second round
            740:begin
                automode = 0;
                inRandizer.qnewUser(56);
                inRandizer.qCheckSeller(199);
            end
            741:begin
                automode = 0;
                inRandizer.qnewUser(68);
                inRandizer.qCheckSeller(201);
            end
            742:begin
                automode = 0;
                inRandizer.qnewUser(84);
                inRandizer.qCheckSeller(203);
            end
            default:begin
                if(NewId) begin
                    inRandizer.rangeId.constraint_mode(1);
                    inRandizer.mUserId.rand_mode(1);
                end else begin
                    inRandizer.rangeId.constraint_mode(0);
                    inRandizer.mUserId.rand_mode(0);
                end
                void'(inRandizer.randomize());
                if(NewId) inRandizer.mBypassId = inRandizer.mUserId;
            end
        endcase
    endfunction

    // Run action
    function void calculate();
        this.setDataForCurAction();

        if(this.inRandizer.mAct == Buy)          this.doBuy();
        else if(this.inRandizer.mAct == Check)   this.doCheck();
        else if(this.inRandizer.mAct == Deposit) this.doDeposit();
        else if(this.inRandizer.mAct == Return)  this.doReturn();
    endfunction

    // Check the correctness
    function bit checkIsCorrect(logic u_complete, Error_Msg u_err_msg, logic[31:0] u_info);
        bit isCorrect;
        this.outChecker.setYourOutput(u_complete, u_err_msg, u_info);

        isCorrect = this.outChecker.checkIsCorrect();
        
        if(!isCorrect) return 0;
        else return 1; 
    endfunction

    // For specific action "Return"
    function void reGenForReturn();
        User_Info m_userInfo = Shop_DRAM.getUser(this.inRandizer.mUserId);
        this.inRandizer.mItemId  = m_userInfo.shop_history.item_ID;
        this.inRandizer.mItemNum = m_userInfo.shop_history.item_num;
        this.inRandizer.mOtherId = m_userInfo.shop_history.seller_ID;
    endfunction

    // Action API
    function void setDataForCurAction();
        Shop_Info m_shopInfo;
        User_Info m_userInfo;
        this.resetBuyerAndSeller();
        m_shopInfo = Shop_DRAM.getShop(this.inRandizer.mUserId);
        m_userInfo = Shop_DRAM.getUser(this.inRandizer.mUserId);
        this.player1MG.setId(this.inRandizer.mUserId);
        this.player1MG.setOldShopInfo(m_shopInfo);
        this.player1MG.setNewShopInfo(m_shopInfo);
        this.player1MG.setOldUserInfo(m_userInfo);
        this.player1MG.setNewUserInfo(m_userInfo);
        if(this.inRandizer.mAct == Buy || this.inRandizer.mAct == Return || this.inRandizer.mAct == Check) begin
            m_shopInfo = Shop_DRAM.getShop(this.inRandizer.mOtherId);
            m_userInfo = Shop_DRAM.getUser(this.inRandizer.mOtherId);
            this.player2MG.setId(this.inRandizer.mOtherId);
            this.player2MG.setOldShopInfo(m_shopInfo);
            this.player2MG.setNewShopInfo(m_shopInfo);
            this.player2MG.setOldUserInfo(m_userInfo);
            this.player2MG.setNewUserInfo(m_userInfo);
        end
        else if(this.inRandizer.mAct == Deposit) begin
            ;
        end

    endfunction

    function void doBuy();
        // User & Shop
        Shop_Info m_buyShopInfo  = this.player1MG.old_shopInfo;
        User_Info m_buyUserInfo  = this.player1MG.old_userInfo;
        Shop_Info m_sellShopInfo = this.player2MG.old_shopInfo;
        User_Info m_sellUserInfo = this.player2MG.old_userInfo;
        // Action 
        Item_id m_curItem     = this.inRandizer.mItemId;
        Item_num m_curItemNum = this.inRandizer.mItemNum;
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
            m_buyUserInfo.shop_history.seller_ID = player2MG.mId;
            // Record the previous action
            errActMain = this.m_vAct[this.player1MG.mId];
            errIdMain = this.m_vTradeId[this.player1MG.mId];
            errActTarget = this.m_vAct[this.player2MG.mId];
            errIdTarget = this.m_vTradeId[this.player2MG.mId];
            this.m_vAct[this.player1MG.mId] = 1'd0;
            this.m_vTradeId[this.player1MG.mId] = this.player2MG.mId;
            this.m_vAct[this.player2MG.mId] = 1'd1;
            this.m_vTradeId[this.player2MG.mId] = this.player1MG.mId;
            // Output Info
            gold_info = m_buyUserInfo;
        end
        // Output
        this.player1MG.setNewShopInfo(m_buyShopInfo);
        this.player1MG.setNewUserInfo(m_buyUserInfo);
        this.player2MG.setNewShopInfo(m_sellShopInfo);
        this.player2MG.setNewUserInfo(m_sellUserInfo);
        // Dram
        this.Shop_DRAM.setShop(this.player1MG.mId ,this.player1MG.new_shopInfo);
        this.Shop_DRAM.setUser(this.player1MG.mId ,this.player1MG.new_userInfo);
        this.Shop_DRAM.setShop(this.player2MG.mId ,this.player2MG.new_shopInfo);
        this.Shop_DRAM.setUser(this.player2MG.mId ,this.player2MG.new_userInfo);
        // Output info
        this.outChecker.setGoldOutput(gold_complete, gold_err_msg, gold_info);
    endfunction

    function void doCheck();
        gold_complete = 1;
        gold_err_msg = No_Err;
        gold_info = 0;
        if(this.inRandizer.isCheckSeller == 1) begin
            gold_info = {this.player2MG.old_shopInfo.large_num ,this.player2MG.old_shopInfo.medium_num ,this.player2MG.old_shopInfo.small_num };
            // Record the previous action
            errActTarget = this.m_vAct[this.player2MG.mId];
            errIdTarget = this.m_vTradeId[this.player2MG.mId];
            this.m_vAct[this.player2MG.mId] = 'dx;
            this.m_vTradeId[this.player2MG.mId] = 'dx;
        end
        else if(this.inRandizer.isCheckSeller == 0) begin
            gold_info = this.player1MG.old_userInfo.money;
        end
        // Record the previous action
        errActMain = this.m_vAct[this.player1MG.mId];
        errIdMain = this.m_vTradeId[this.player1MG.mId];
        this.m_vAct[this.player1MG.mId] = 'dx;
        this.m_vTradeId[this.player1MG.mId] = 'dx;
        // Output info
        this.outChecker.setGoldOutput(gold_complete, gold_err_msg, gold_info);
    endfunction

    function void doDeposit();
        User_Info m_buyUserInfo  = this.player1MG.old_userInfo;
        Money m_curMoney = this.inRandizer.mMoney;
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
            errActMain = this.m_vAct[this.player1MG.mId];
            errIdMain = this.m_vTradeId[this.player1MG.mId];
            this.m_vAct[this.player1MG.mId] = 'dx;
            this.m_vTradeId[this.player1MG.mId] = 'dx;
        end
        // Output
        this.player1MG.setNewUserInfo(m_buyUserInfo);
        // Dram
        this.Shop_DRAM.setUser(this.player1MG.mId ,this.player1MG.new_userInfo);
        // Output Info
        this.outChecker.setGoldOutput(gold_complete, gold_err_msg, gold_info);
    endfunction

    function void doReturn();
        // User & Shop
        Shop_Info m_buyShopInfo  = this.player1MG.old_shopInfo;
        User_Info m_buyUserInfo  = this.player1MG.old_userInfo;
        Shop_Info m_sellShopInfo = this.player2MG.old_shopInfo;
        User_Info m_sellUserInfo = this.player2MG.old_userInfo;
        // Action
        Item_id m_curItem     = this.inRandizer.mItemId;
        Item_num m_curItemNum = this.inRandizer.mItemNum;
        User_id m_curSellerId = this.inRandizer.mOtherId;
        Money m_moneyItem;
        // Determine parameter
        if(m_curItem == Large) m_moneyItem = L_MONEY;
        else if(m_curItem == Medium) m_moneyItem = M_MONEY;
        else if(m_curItem == Small) m_moneyItem = S_MONEY;

        if(
            this.m_vAct[this.player1MG.mId] !== 'd0 || // A do other action
            this.m_vAct[m_buyUserInfo.shop_history.seller_ID] !== 'd1 || // History seller do other action
            (this.m_vAct[m_buyUserInfo.shop_history.seller_ID] === 'd1 && this.m_vTradeId[m_buyUserInfo.shop_history.seller_ID] !== this.player1MG.mId) // History seller do other sell to another Id => wrong action
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
            errActMain = this.m_vAct[this.player1MG.mId];
            errIdMain = this.m_vTradeId[this.player1MG.mId];
            errActTarget = this.m_vAct[this.player2MG.mId];
            errIdTarget = this.m_vTradeId[this.player2MG.mId];
            this.m_vAct[this.player1MG.mId] = 'dx;
            this.m_vTradeId[this.player1MG.mId] = 'dx;
            this.m_vAct[this.player2MG.mId] = 'dx;
            this.m_vTradeId[this.player2MG.mId] = 'dx;
            // Output Info
            gold_complete = 1;
            gold_err_msg = No_Err;
            gold_info = {m_buyShopInfo.large_num ,m_buyShopInfo.medium_num ,m_buyShopInfo.small_num };
        end
        // Output
        this.player1MG.setNewShopInfo(m_buyShopInfo);
        this.player1MG.setNewUserInfo(m_buyUserInfo);
        this.player2MG.setNewShopInfo(m_sellShopInfo);
        this.player2MG.setNewUserInfo(m_sellUserInfo);
        // Dram
        this.Shop_DRAM.setShop(this.player1MG.mId ,this.player1MG.new_shopInfo);
        this.Shop_DRAM.setUser(this.player1MG.mId ,this.player1MG.new_userInfo);
        this.Shop_DRAM.setShop(this.player2MG.mId ,this.player2MG.new_shopInfo);
        this.Shop_DRAM.setUser(this.player2MG.mId ,this.player2MG.new_userInfo);
        // Output Info
        this.outChecker.setGoldOutput(gold_complete, gold_err_msg, gold_info);
    endfunction


    function inputRandomizer getinRandizer();
        return this.inRandizer;
    endfunction

endclass


//======================================
//      MAIN to initialize task
//======================================
Dice dice;
Action Action_store;
MainShopDB ICLabee;

initial begin
    dice = new ();

    //reset Objects
    ICLabee = new();
    Action_store = No_action;
    //reset signals
    inf.rst_n      = 1;
    inf.D          = 'dx;
    inf.id_valid   = 0;
    inf.act_valid  = 0;
    inf.item_valid = 0;
    inf.num_valid  = 0;
    inf.amnt_valid = 0;

    #(3) inf.rst_n = 0;
    #(17) inf.rst_n = 1;

    //Read DRAM data from dat file
    ICLabee.DRAM_read(); 

    for (pat=0 ; pat < PATNUM; pat = pat+1) begin
        input_task;
        
        ICLabee.calculate();
        
        while(inf.out_valid !== 1)  @(negedge clk);

        //check the answer
        if(!ICLabee.checkIsCorrect(inf.complete, inf.err_msg, inf.out_info)) begin
            $display("Wrong Answer");
            $finish;
        end else begin
            @(negedge clk);
        end
    end

    $finish;
end
//======================================
//              TASKS
//======================================

task input_task; begin

    automode = 1;
    //60 % delay: 2, 15 %: delay: 9, 25% random
    if(dice.roll1(100) < 60) repeat(2) @(negedge clk);
    else if(dice.getdice() < 75) repeat(9) @(negedge clk);
    // else repeat( ({$random(SEED)} % 8 + 2) ) @(negedge clk);
    else repeat(dice.roll2(2, 9)) @(negedge clk);


    changeID = (( pat==0 ) || (dice.roll1(100-1) < CHANGEID_RATIO));
    ICLabee.genRANDinput(changeID, pat);
    
    Action_store = ICLabee.getinRandizer().mAct;

    // Change Id's input 
    if(changeID) begin
        inf.id_valid = 1'b1;
        inf.D = ICLabee.getinRandizer().mUserId;
        @(negedge clk);
        inf.id_valid = 1'b0;
        inf.D = 'dx;

        if(dice.roll1(100) < 60) @(negedge clk);
        else if(dice.getdice() < 80) repeat(5) @(negedge clk);
        else repeat(dice.roll2(1,5)) @(negedge clk);

    end


    inf.act_valid = 1'b1;
    inf.D = ICLabee.getinRandizer().mAct;
    @(negedge clk);
    inf.act_valid = 1'b0;
    inf.D = 'dx;
        
    if(dice.roll1(100) < 60) @(negedge clk);
    else if(dice.getdice() < 80) repeat(5) @(negedge clk);
    else repeat(dice.roll2(1,5)) @(negedge clk);


    
    case(ICLabee.getinRandizer().mAct)
        Buy : begin
            // Item
            inf.item_valid = 1'b1;
            inf.D = ICLabee.getinRandizer().mItemId;
            @(negedge clk);
            inf.item_valid = 1'b0;
            inf.D = 'dx;
            
            if(dice.roll1(100) < 60) @(negedge clk);
            else if(dice.getdice() < 80) repeat(5) @(negedge clk);
            else repeat(dice.roll2(1,5)) @(negedge clk);

            // Num
            inf.num_valid = 1'b1;
            inf.D = ICLabee.getinRandizer().mItemNum;
            @(negedge clk);
            inf.num_valid = 1'b0;
            inf.D = 'dx;
            
            if(dice.roll1(100) < 60) @(negedge clk);
            else if(dice.getdice() < 80) repeat(5) @(negedge clk);
            else repeat(dice.roll2(1,5)) @(negedge clk);

            // Seller's id
            inf.id_valid = 1'b1;
            inf.D = ICLabee.getinRandizer().mOtherId;
            @(negedge clk);
            inf.id_valid = 1'b0;
            inf.D = 'dx;
        end
        Check : begin
            if(automode)begin
                CheckSeller = (dice.roll1(100-1) < CHECK_SELLER_RATIO);
                ICLabee.getinRandizer().isCheckSeller = CheckSeller;
            end

            if(CheckSeller) begin
                // Seller's stock
                inf.id_valid = 1'b1;
                inf.D = ICLabee.getinRandizer().mOtherId;
                @(negedge clk);
                inf.id_valid = 1'b0;
                inf.D = 'dx;
            end

        end
        Deposit : begin
            // Money
            inf.amnt_valid = 1'b1;
            inf.D = ICLabee.getinRandizer().mMoney;
            @(negedge clk);
            inf.amnt_valid = 1'b0;
            inf.D = 'dx;
        end
        Return : begin

            if(automode)begin
                isCorrectReturn = (dice.roll1(100-1) < CORRECT_RETURN_RATIO);
                if(isCorrectReturn) begin
                    ICLabee.reGenForReturn();
                end
            end

            // Item
            inf.item_valid = 1'b1;
            inf.D = ICLabee.getinRandizer().mItemId;
            @(negedge clk);
            inf.item_valid = 1'b0;
            inf.D = 'dx;
            
            if(dice.roll1(100) < 60) @(negedge clk);
            else if(dice.getdice() < 80) repeat(5) @(negedge clk);
            else repeat(dice.roll2(1,5)) @(negedge clk);

            // Num
            inf.num_valid = 1'b1;
            inf.D = ICLabee.getinRandizer().mItemNum;
            @(negedge clk);
            inf.num_valid = 1'b0;
            inf.D = 'dx;
            
            if(dice.roll1(100) < 60) @(negedge clk);
            else if(dice.getdice() < 80) repeat(5) @(negedge clk);
            else repeat(dice.roll2(1,5)) @(negedge clk);

            // Id
            inf.id_valid = 1'b1;
            inf.D = ICLabee.getinRandizer().mOtherId;
            @(negedge clk);
            inf.id_valid = 1'b0;
            inf.D = 'dx;
        end
    endcase

end endtask


endprogram
