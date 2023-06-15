//############################################################################
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//   (C) Copyright Optimum Application-Specific Integrated System Laboratory
//   All Right Reserved
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   ICLAB 2023 Spring
//   Lab09  : Online Shopping Platform Simulation
//   Author : Zhi-Ting Dong (yjdzt918.ee11@nycu.edu.tw)
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   File Name   : Usertype_OS.sv
//   Module Name : usertype
//   Release version : V1.0 (Release Date: 2023-04)
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//############################################################################

`ifndef USERTYPE
`define USERTYPE

package usertype;

typedef enum logic [3:0] { 
	No_action	= 4'd0,
	Buy			= 4'd1,
	Check		= 4'd2,
	Deposit		= 4'd4, 
	Return		= 4'd8 
}	Action ;

typedef enum logic [3:0] { 
	No_Err			= 4'b0000, //	No error
	INV_Not_Enough	= 4'b0010, //	Seller's inventory is not enough
	Out_of_money	= 4'b0011, //	Out of money
	INV_Full		= 4'b0100, //	User's inventory is full 
	Wallet_is_Full	= 4'b1000, //	Wallet is full
	Wrong_ID		= 4'b1001, //	Wrong seller ID 
	Wrong_Num		= 4'b1100, //	Wrong number
	Wrong_Item		= 4'b1010, //	Wrong item
	Wrong_act		= 4'b1111  //	Wrong operation
}	Error_Msg ;

typedef enum logic [1:0]	{ 
	Platinum	= 2'b00,
	Gold		= 2'b01,
	Silver		= 2'b10,
	Copper		= 2'b11
}	User_Level ;				

typedef enum logic [1:0] {
	No_item	= 2'd0,
	Large	= 2'd1,
	Medium	= 2'd2,
	Small	= 2'd3
}	Item_id ;


typedef logic [7:0] User_id;
typedef logic [5:0] Item_num;
typedef logic [15:0] Money;
typedef logic [11:0] EXP;
typedef logic [15:0] Item_num_ext;

typedef struct packed {
	Item_id		item_ID;
	Item_num	item_num;
	User_id		seller_ID;
}	Shopping_His; // Shopping History

typedef struct packed {
	Item_num		large_num;
	Item_num		medium_num;
	Item_num		small_num;
	User_Level		level;
	EXP				exp;
}	Shop_Info; //Shop info

typedef struct packed {
	Money 			money; 
	Shopping_His 	shop_history;
}	User_Info; //User info

typedef union packed { 	
	Money			d_money;
	User_id	[1:0]	d_id;
	Action	[3:0]	d_act;
	Item_id	[7:0]	d_item;
	Item_num_ext	d_item_num;
} DATA;

//################################################## Don't revise the code above

typedef struct packed {
	Item_id		item_ID;
	Item_num	item_num;
	User_id		buyer_ID;
}	Selling_His; // Shopping History

//################################################## Don't revise the code below
endpackage
import usertype::*; //import usertype into $unit

`endif

