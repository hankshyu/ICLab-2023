//############################################################################
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//   (C) Copyright Laboratory System Integration and Silicon Implementation
//   All Right Reserved
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   2018 ICLAB Fall Course
//   Lab09      : Coffee Maker
//   Author     : Wei chiang
//                
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   File Name   : Usertype_PKG.sv
//   Module Name : usertype
//   Release version : v1.0 (Release Date: Nov-2018)
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//############################################################################

`ifndef USERTYPE
`define USERTYPE

package usertype;

typedef enum logic [2:0] {no_coffee=3'b000, latte=3'b001, cappuccino=3'b010, mocha=3'b011,
	user_define=3'b100} flavor;
typedef enum logic [2:0] {no_size_inf=3'b000, s=3'b001, m=3'b010, l=3'b011, xl=3'b100} size;

typedef enum logic [2:0] {none=3'b000, espresso=3'b001, milk=3'b010, chocolate=3'b011,
	froth=3'b100} ingredient;
typedef enum logic {red=1'b0, green=1'b1} window_led;

typedef struct packed {
    window_led	led;
    logic[9:0]  monitor;
} ingredient_info;

typedef struct packed {
    ingredient_info  espresso;
    ingredient_info  milk;
    ingredient_info  chocolate;
    ingredient_info  froth;
} ingredient_window;

// Add data type here



endpackage

import usertype::*; //import usertype into $unit

`endif
