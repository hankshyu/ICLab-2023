module OS(input clk, INF.OS_inf inf);
import usertype::*;

integer idx;

logic started;


//cache 1
User_id usr1_id;
logic usr1_dirty;
Shop_Info usr1_shop_info;
User_Info usr1_user_info;
logic [63 : 0] usr1_chache_w;
//cache 2
User_id usr2_id;
logic usr2_dirty;
Shop_Info usr2_shop_info;
User_Info usr2_user_info;
logic [63 : 0] usr2_chache_w;

always_comb begin

		{usr1_chache_w[ 7 :  0], usr1_chache_w[15 : 8]}	= {usr1_shop_info.large_num, usr1_shop_info.medium_num, usr1_shop_info.small_num[5:2]};
		{usr1_chache_w[23 : 16], usr1_chache_w[31 : 24]} = {usr1_shop_info.small_num[1:0], usr1_shop_info.level, usr1_shop_info.exp};
	
		{usr1_chache_w[39 : 32], usr1_chache_w[47 : 40]} = usr1_user_info.money;
		{usr1_chache_w[55 : 48], usr1_chache_w[63 : 56]} 
				= {usr1_user_info.shop_history.item_ID, usr1_user_info.shop_history.item_num, usr1_user_info.shop_history.seller_ID};


		{usr2_chache_w[ 7 :  0], usr2_chache_w[15 : 8]}	= {usr2_shop_info.large_num, usr2_shop_info.medium_num, usr2_shop_info.small_num[5:2]};
		{usr2_chache_w[23 : 16], usr2_chache_w[31 : 24]} = {usr2_shop_info.small_num[1:0], usr2_shop_info.level, usr2_shop_info.exp};
	
		{usr2_chache_w[39 : 32], usr2_chache_w[47 : 40]} = usr2_user_info.money;
		{usr2_chache_w[55 : 48], usr2_chache_w[63 : 56]} 
				= {usr2_user_info.shop_history.item_ID, usr2_user_info.shop_history.item_num, usr2_user_info.shop_history.seller_ID};
end

//latch the input
User_id user_id_reg1;
User_id user_id_reg2;
Money dep_reg;

Item_id bitmid_reg;
Item_num_ext bitnum_reg;
Error_Msg b_err_msg;

//this records who he operates with recently, update at operation
User_id histable [255: 0];
//this records if the operaton helds a valid buying history
logic histable_valid[255 : 0];
logic histable_bs[255 : 0]; // 0 for buy and 1 for sell

logic [7-1 : 0] bdelivery_fee;
logic [9-1 : 0] bitmprice;
logic [6-1 : 0] bitmexp;
logic b_err3;
logic [13-1 : 0] bexp_cal;

//this wire is for usr2 to calculate the money for selling is exceed
logic [17-1 : 0] sell_exceed;


always_comb begin
	case (usr1_shop_info.level)
		Platinum: bdelivery_fee = 10;
		Gold: bdelivery_fee = 30;
		Silver: bdelivery_fee = 50;
		Copper: bdelivery_fee = 70;
	endcase
end
always_comb begin
	case(bitmid_reg)
		No_item:begin
			bitmprice = 0;
			bitmexp = 0;
		end
		Large:begin
			bitmprice = 300;
			bitmexp = 60;
		end
		Medium:begin
			bitmprice = 200;
			bitmexp = 40;
		end
		Small:begin
			bitmprice = 100;
			bitmexp = 20;
		end
	endcase
end
always_comb begin
	//g_money[last_user] < (g_shippingfee[last_user] +(Itemprice(item_id)*item_num)
	b_err3 = (usr1_user_info.money < (bdelivery_fee+(bitmprice*bitnum_reg)));
end
always_comb begin
	bexp_cal = usr1_shop_info.exp + (bitmexp * bitnum_reg);
end

logic [17 -1 : 0] deposit_add;
logic deposit_cmp;
always_comb begin
	deposit_add = usr1_user_info.money + dep_reg;
end
always_comb begin
	deposit_cmp = deposit_add[16];
end

always_comb begin
	sell_exceed = (usr2_user_info.money + (bitmprice*bitnum_reg));
end

logic [6 : 0] cnt;
logic [9 : 0] roll_cnt;

//FSM
enum logic [5 : 0]{	S_INIT,
					S_MIN,
					
					S_CHECK,
					S_CHECK_SELF,
					S_CHECK_SELF_DONE,
					S_CHECK_SELF_DONE0,
					S_CHECK_OTHER1,
					S_CHECK_OTHER2,
					S_CHECK_OTHER_DONE,
					S_CHECK_OTHER_DONE0,

					S_DEPOSIT,
					S_DEPOSIT1,
					S_DEPOSIT_DONE,
					S_DEPOSIT_DONE0,

					S_BUY,
					S_BUYRNUM,
					S_BUYRSELLER,
					S_BUY1,
					S_BUY2,
					S_BUY3, // check for error
					S_BUY_ERR,
					S_BUY_DONE,
					S_BUY_EXIT,
					S_BUY_EXIT0,


					S_RETURN,
					S_RTNRNUM,
					S_RTNRSELLER,
					S_RTN1,
					S_RTN2,
					S_RTN3,
					S_RTN_ERR,
					S_RTN_DONE,
					S_RTN_EXIT,
					S_RTN_EXIT0,

					S_DRAM_R1,
					S_DRAM_W1,
					S_DRAM_R2,
					S_DRAM_W2,

					S_OUT	}	cs, ns, last_state;
always_ff @(posedge clk or negedge inf.rst_n) begin
	if(!inf.rst_n) cs <= S_INIT;
	else cs <= ns;
end
always_comb begin
	case (cs)
		S_INIT:begin
			if(inf.id_valid) begin
				ns = S_MIN;
			end else if(inf.act_valid)begin
				case(inf.D.d_act[0])
					Buy:	ns = S_BUY;
					Check:	ns = S_CHECK;
					Deposit:ns = S_DEPOSIT;
					Return:	ns = S_RETURN;
					default:ns = S_INIT;
				endcase
			end else begin
				ns = S_INIT;
			end
		end
		S_MIN:begin
			if(inf.act_valid)begin
				case(inf.D.d_act[0])
					Buy:	ns = S_BUY;
					Check:	ns = S_CHECK;
					Deposit:ns = S_DEPOSIT;
					Return:	ns = S_RETURN;
					default:ns = S_INIT;
				endcase
			end else begin
				ns = S_MIN;
			end
		end
		S_CHECK:begin
			if(inf.id_valid) ns = S_CHECK_OTHER1;
			else if(cnt == 5) ns = S_CHECK_SELF;
			else ns = S_CHECK;
		end
		S_CHECK_SELF:begin
			if((!started) || (usr1_id != user_id_reg1)) ns = S_DRAM_R1;
			else ns = S_CHECK_SELF_DONE0;
		end
		S_CHECK_SELF_DONE0: ns = (roll_cnt == 255)? S_CHECK_SELF_DONE : S_CHECK_SELF_DONE0;
		S_CHECK_SELF_DONE: ns = S_OUT;
		S_CHECK_OTHER1:begin
			if((!started) || (usr1_id != user_id_reg1)) ns = S_DRAM_R1;
			else ns = S_CHECK_OTHER2;
		end
		S_CHECK_OTHER2:begin
			if((usr2_id != user_id_reg2)) ns = S_DRAM_R2;
			else ns = S_CHECK_OTHER_DONE0;
		end
		S_CHECK_OTHER_DONE0: ns = (roll_cnt == 255)? S_CHECK_OTHER_DONE : S_CHECK_OTHER_DONE0;
		S_CHECK_OTHER_DONE: ns = S_OUT; 

		S_DEPOSIT:begin
			if(inf.amnt_valid) ns = S_DEPOSIT1;
			else ns = S_DEPOSIT;
		end
		S_DEPOSIT1:begin
			if((!started) || (usr1_id != user_id_reg1)) ns = S_DRAM_R1;
			else ns = S_DEPOSIT_DONE0;
		end
		S_DEPOSIT_DONE0: ns = (roll_cnt == 255)? S_DEPOSIT_DONE : S_DEPOSIT_DONE0;
		S_DEPOSIT_DONE: ns = S_OUT;

		S_BUY: ns = (inf.item_valid)? S_BUYRNUM: S_BUY;
		S_BUYRNUM: ns = (inf.num_valid)? S_BUYRSELLER : S_BUYRNUM;
		S_BUYRSELLER: ns = (inf.id_valid)? S_BUY1 : S_BUYRSELLER; // fill in user_id_reg2;
		S_BUY1: ns = (usr1_id != user_id_reg1)? S_DRAM_R1 : S_BUY2;
		S_BUY2: ns = (usr2_id != user_id_reg2)? S_DRAM_R2 : S_BUY3;
		S_BUY3:begin
			//Error state hunting
			case (bitmid_reg)
				Large:begin
					if((usr1_shop_info.large_num + bitnum_reg) > 63) ns =  S_BUY_ERR;
					else if(usr2_shop_info.large_num < bitnum_reg) ns = S_BUY_ERR;
					else if(b_err3) ns = S_BUY_ERR;
					else ns = S_BUY_DONE;
				end
				Medium:begin
					if((usr1_shop_info.medium_num + bitnum_reg) > 63) ns = S_BUY_ERR;
					else if(usr2_shop_info.medium_num < bitnum_reg) ns = S_BUY_ERR;
					else if(b_err3) ns = S_BUY_ERR;
					else ns = S_BUY_DONE;
				end
				default:begin //Small
					if((usr1_shop_info.small_num + bitnum_reg) > 63) ns = S_BUY_ERR;
					else if(usr2_shop_info.small_num < bitnum_reg) ns = S_BUY_ERR;
					else if(b_err3) ns = S_BUY_ERR;
					else ns = S_BUY_DONE;
				end 
			endcase
		end
		S_BUY_ERR: ns = S_OUT;
		S_BUY_DONE: ns = S_BUY_EXIT0;
		S_BUY_EXIT0: ns = (roll_cnt == 255)? S_BUY_EXIT: S_BUY_EXIT0;
		S_BUY_EXIT: ns = S_OUT;

		S_RETURN: ns = (inf.item_valid)? S_RTNRNUM : S_RETURN;
		S_RTNRNUM: ns = (inf.num_valid)? S_RTNRSELLER : S_RTNRNUM;
		S_RTNRSELLER: ns = (inf.id_valid)? S_RTN1 : S_RTNRSELLER;
		S_RTN1: ns = (usr1_id != user_id_reg1)? S_DRAM_R1 : S_RTN2;
		S_RTN2: ns = (usr2_id != user_id_reg2)? S_DRAM_R2 : S_RTN3;
		S_RTN3:begin
			//Error hunting state
			if(histable_valid[usr1_id]==1'b1 && histable_bs[usr1_id] == 0)begin
				if(usr1_user_info.shop_history.seller_ID != usr2_id) ns = S_RTN_ERR; //wrong seller ID
				else if(usr1_user_info.shop_history.item_num != bitnum_reg) ns = S_RTN_ERR; //wrong number
				else if(usr1_user_info.shop_history.item_ID != bitmid_reg) ns = S_RTN_ERR; // wrong item
				else if((histable[usr1_id]==usr2_id)&&(histable[usr2_id]==usr1_id)&&(histable_valid[usr1_id]==1'b1)&&(histable_valid[usr2_id]==1'b1))begin
					ns = S_RTN_DONE;
				end
				else ns = S_RTN_ERR; // wrong operation
			end else begin
				ns = S_RTN_ERR; // wrong operation
			end 
		end
		S_RTN_ERR: ns = S_OUT;
		S_RTN_DONE: ns = S_RTN_EXIT0;
		S_RTN_EXIT0: ns = (roll_cnt == 255)? S_RTN_EXIT : S_RTN_EXIT0;
		S_RTN_EXIT: ns = S_OUT;

		S_DRAM_R1:begin
			if(usr1_dirty) ns = S_DRAM_W1;
			else if(inf.C_out_valid) ns = last_state; // return back to last state
			else ns = S_DRAM_R1;
		end
		S_DRAM_W1:begin
			if(inf.C_out_valid) ns = S_DRAM_R1;
			else ns = S_DRAM_W1;
		end
		S_DRAM_R2:begin
			if(usr2_dirty) ns = S_DRAM_W2;
			else if(inf.C_out_valid) ns = last_state; // return back to last state
			else ns = S_DRAM_R2;
		end
		S_DRAM_W2:begin
			if(inf.C_out_valid) ns = S_DRAM_R2;
			else ns = S_DRAM_W2;
		end
		S_OUT: ns = S_INIT;
		default: ns = S_INIT; 
	endcase
end
always_ff @(posedge clk or negedge inf.rst_n) begin
	if(!inf.rst_n) cnt <= 0;
	else begin
		case (cs)
			S_INIT, S_MIN: cnt <= 0;
			S_CHECK: cnt <= (cnt == 5)? 0 : cnt + 1;
			S_CHECK_SELF: cnt <= 0;
			S_CHECK_OTHER1, S_CHECK_OTHER2: cnt <= 0;
			S_BUY, S_BUY1, S_BUY2: cnt <= 0;
			S_RETURN, S_RTN1, S_RTN2: cnt <= 0;
			S_DEPOSIT, S_DEPOSIT1: cnt <= 0;
			S_DRAM_R1, S_DRAM_R2: cnt <= (cnt == 1)? 1 : cnt + 1;
			S_DRAM_W1, S_DRAM_W2: cnt <= 0;
		endcase
	end
end
always_ff @(posedge clk or negedge inf.rst_n ) begin
	if(!inf.rst_n) started <= 0;
	else if(cs == S_OUT) started <= 1;
end

always_ff @(posedge clk or negedge inf.rst_n)begin
	if(!inf.rst_n) last_state <= S_INIT;
	else begin
		case (cs)
			// S_CHECK_SELF: if((!started) || (usr1_id != user_id_reg1)) last_state <=S_CHECK_SELF_DONE;
			S_CHECK_SELF: last_state <=S_CHECK_SELF_DONE0;
			S_CHECK_OTHER1: last_state <= S_CHECK_OTHER2;
			S_CHECK_OTHER2: last_state <= S_CHECK_OTHER_DONE0;
			S_DEPOSIT1: last_state <= S_DEPOSIT_DONE0;
			S_BUY1: last_state <= S_BUY2;
			S_BUY2: last_state <= S_BUY3;
			S_RTN1: last_state <= S_RTN2;
			S_RTN2: last_state <= S_RTN3;
		endcase
	end
end



//control DRAM related signals (transfer to bridge)

always_ff @(posedge clk or negedge inf.rst_n)begin
	if(!inf.rst_n)begin
		inf.C_in_valid <= 0;
		inf.C_r_wb <= 0;
		inf.C_addr <= 0;
		inf.C_data_w <= 0;
	end else begin
		case (cs)
			S_DRAM_R1: begin
				if(usr1_dirty)begin //would be transfer into S_DRAM_W1;
					inf.C_in_valid <= 1;
					inf.C_r_wb <= 0;// 1 for read, 0 for write
					inf.C_addr <= usr1_id;
					inf.C_data_w <= usr1_chache_w;
				end else if(cnt == 0)begin
					inf.C_in_valid <= 1;
					inf.C_r_wb <= 1;// 1 for read, 0 for write
					inf.C_addr <= user_id_reg1;
					inf.C_data_w <= 0;
				end else begin
					inf.C_in_valid <= 0;
					inf.C_r_wb <= 0;
					inf.C_addr <= 0;
					inf.C_data_w <= 0;
				end
			end
			S_DRAM_R2:begin
				if(usr2_dirty)begin
					inf.C_in_valid <= 1;
					inf.C_r_wb <= 0;// 1 for read, 0 for write
					inf.C_addr <= usr2_id;
					inf.C_data_w <= usr2_chache_w;
				end else if(cnt == 0)begin
					inf.C_in_valid <= 1;
					inf.C_r_wb <= 1;// 1 for read, 0 for write
					inf.C_addr <= user_id_reg2;
					inf.C_data_w <= 0;
				end else begin
					inf.C_in_valid <= 0;
					inf.C_r_wb <= 0;
					inf.C_addr <= 0;
					inf.C_data_w <= 0;
				end
			end
			S_DRAM_W1, S_DRAM_W2:begin
				inf.C_in_valid <= 0;
				inf.C_r_wb <= 0;
				inf.C_addr <= 0;
				inf.C_data_w <= 0;
			end
		endcase
	end
end

always_ff @(posedge clk or negedge inf.rst_n ) begin
	if(!inf.rst_n)begin
		usr1_dirty <= 0;
		usr1_id <= 0;
		usr1_shop_info.large_num <= 0;
		usr1_shop_info.medium_num <= 0;
		usr1_shop_info.small_num <= 0;
		usr1_shop_info.level <= Copper;
		usr1_shop_info.exp <= 0;
		
		usr1_user_info.money <= 0;
		usr1_user_info.shop_history.item_ID <= No_item;
		usr1_user_info.shop_history.item_num <= 0;
		usr1_user_info.shop_history.seller_ID <= 0;
	end else begin
		case (cs)
			S_DRAM_R1:begin
				if(inf.C_out_valid)begin
					usr1_dirty <= 0;
					usr1_id <= user_id_reg1;
			
					{usr1_shop_info.large_num, usr1_shop_info.medium_num, usr1_shop_info.small_num[5:2]} <= {inf.C_data_r[7 : 0], inf.C_data_r[15 : 8]};
					{usr1_shop_info.small_num[1:0], usr1_shop_info.level, usr1_shop_info.exp} <={inf.C_data_r[23 : 16], inf.C_data_r[31 : 24]};
			
					usr1_user_info.money		<= {inf.C_data_r[39 : 32], inf.C_data_r[47 : 40]};
					{usr1_user_info.shop_history.item_ID, usr1_user_info.shop_history.item_num, usr1_user_info.shop_history.seller_ID}
						<= {inf.C_data_r[55 : 48], inf.C_data_r[63 : 56]};
				end
			end
			S_DRAM_W1:begin
				usr1_dirty <= 0;
			end
			S_DEPOSIT_DONE:begin
				if(deposit_cmp == 0)begin
					usr1_dirty <= 1;
					usr1_user_info.money <= deposit_add[15:0];
				end
			end
			S_BUY_DONE:begin
				if(bitnum_reg > 0)begin
					usr1_dirty <= 1;
					case(bitmid_reg)
						Large:begin
							usr1_shop_info.large_num <= usr1_shop_info.large_num + bitnum_reg;
						end
						Medium:begin
							usr1_shop_info.medium_num <= usr1_shop_info.medium_num + bitnum_reg;
						end
						default:begin //Small
							usr1_shop_info.small_num <= usr1_shop_info.small_num + bitnum_reg;
						end
					endcase
					usr1_user_info.money <= usr1_user_info.money - (bdelivery_fee + (bitmprice*bitnum_reg));
					usr1_user_info.shop_history.item_ID <= bitmid_reg;
					usr1_user_info.shop_history.item_num <= bitnum_reg;
					usr1_user_info.shop_history.seller_ID <= user_id_reg2;

					case(usr1_shop_info.level)
						// Platinum:begin
							//dont change
						// end
						Gold:begin
							if(bexp_cal >= 4000)begin
								usr1_shop_info.level <= Platinum;
								usr1_shop_info.exp <= 0;
							end else begin
								usr1_shop_info.exp <= bexp_cal;
							end
						end
						Silver:begin
							if(bexp_cal >= 2500)begin
								usr1_shop_info.level <= Gold;
								usr1_shop_info.exp <= 0;
							end else begin
								usr1_shop_info.exp <= bexp_cal;
							end
						end
						Copper:begin
							if(bexp_cal >= 1000)begin
								usr1_shop_info.level <= Silver;
								usr1_shop_info.exp <= 0;
							end else begin
								usr1_shop_info.exp <= bexp_cal;
							end	
						end
					endcase
				end
			end
			S_RTN_DONE:begin
				usr1_dirty <= 1;
				case(bitmid_reg)
					Large:begin
						usr1_shop_info.large_num <= usr1_shop_info.large_num - bitnum_reg;
					end
					Medium:begin
						usr1_shop_info.medium_num <= usr1_shop_info.medium_num - bitnum_reg;
					end
					default:begin //Small
						usr1_shop_info.small_num <= usr1_shop_info.small_num - bitnum_reg;
					end
				endcase
				usr1_user_info.money <= usr1_user_info.money + (bitmprice*bitnum_reg);
			end
		endcase


	end
end
always_ff @(posedge clk or negedge inf.rst_n ) begin
	if(!inf.rst_n)begin
		usr2_dirty <= 0;
		usr2_id <= 0;
		usr2_shop_info.large_num <= 0;
		usr2_shop_info.medium_num <= 0;
		usr2_shop_info.small_num <= 0;
		usr2_shop_info.level <= Copper;
		usr2_shop_info.exp <= 0;
		
		usr2_user_info.money <= 0;
		usr2_user_info.shop_history.item_ID <= No_item;
		usr2_user_info.shop_history.item_num <= 0;
		usr2_user_info.shop_history.seller_ID <= 0;
	end else begin
		case (cs)
			S_DRAM_R2:begin
				if(inf.C_out_valid)begin
					usr2_dirty <= 0;
					usr2_id <= user_id_reg2;

					{usr2_shop_info.large_num, usr2_shop_info.medium_num, usr2_shop_info.small_num[5:2]} <= {inf.C_data_r[7 : 0], inf.C_data_r[15 : 8]};
					{usr2_shop_info.small_num[1:0], usr2_shop_info.level, usr2_shop_info.exp} <={inf.C_data_r[23 : 16], inf.C_data_r[31 : 24]};

					usr2_user_info.money <= {inf.C_data_r[39 : 32], inf.C_data_r[47 : 40]};
					{usr2_user_info.shop_history.item_ID, usr2_user_info.shop_history.item_num, usr2_user_info.shop_history.seller_ID}
						<= {inf.C_data_r[55 : 48], inf.C_data_r[63 : 56]};
				end
			end
			S_DRAM_W2:begin
				usr2_dirty <= 0;
			end
			S_BUY_DONE:begin
				if(bitnum_reg > 0)begin
					usr2_dirty <= 1;
					case(bitmid_reg)
						Large:begin
							usr2_shop_info.large_num <= usr2_shop_info.large_num - bitnum_reg;
						end
						Medium:begin
							usr2_shop_info.medium_num <= usr2_shop_info.medium_num - bitnum_reg;
						end
						default:begin //Small
							usr2_shop_info.small_num <= usr2_shop_info.small_num - bitnum_reg;
						end
					endcase
					usr2_user_info.money <= (sell_exceed >= 16'hFFFF)? 16'hFFFF : (usr2_user_info.money + (bitmprice*bitnum_reg));
				end
			end
			S_RTN_DONE:begin
				usr2_dirty <= 1;
				case(bitmid_reg)
					Large:begin
						usr2_shop_info.large_num <= usr2_shop_info.large_num + bitnum_reg;
					end
					Medium:begin
						usr2_shop_info.medium_num <= usr2_shop_info.medium_num + bitnum_reg;
					end
					default:begin //Small
						usr2_shop_info.small_num <= usr2_shop_info.small_num + bitnum_reg;
					end
				endcase
				usr2_user_info.money <= usr2_user_info.money - (bitmprice*bitnum_reg);
			end
		endcase

	end
end

//store the input data
always_ff @(posedge clk or negedge inf.rst_n ) begin
	if(!inf.rst_n) user_id_reg1 <= 0;
	else begin
		if(cs == S_INIT && inf.id_valid) user_id_reg1 <= inf.D.d_id[0];
	end
end
always_ff @(posedge clk or negedge inf.rst_n ) begin
	if(!inf.rst_n) user_id_reg2 <= 0;
	else begin
		if(cs == S_CHECK && inf.id_valid) user_id_reg2 <= inf.D.d_id[0];
		else if((cs == S_BUYRSELLER || cs == S_RTNRSELLER) && inf.id_valid) user_id_reg2 <= inf.D.d_id[0];
	end
end
always_ff @(posedge clk or negedge inf.rst_n ) begin
	if(!inf.rst_n) dep_reg <= 0;
	else begin
		if(cs == S_DEPOSIT && inf.amnt_valid) dep_reg <= inf.D.d_money;
	end
end
always_ff @(posedge clk or negedge inf.rst_n ) begin
	if(!inf.rst_n) bitmid_reg <= No_item;
	else begin
		if((cs == S_BUY || cs == S_RETURN) && inf.item_valid) bitmid_reg <= inf.D.d_item[0];
	end
end
always_ff @(posedge clk or negedge inf.rst_n ) begin
	if(!inf.rst_n) bitnum_reg <= 0;
	else begin
		if((cs == S_BUYRNUM || cs == S_RTNRNUM) && inf.num_valid) bitnum_reg <= inf.D.d_item_num;
	end
end

//internal registers
//buy stage needed storage
//error storing register
always_ff @(posedge clk or negedge inf.rst_n ) begin
	if(!inf.rst_n) b_err_msg <= No_Err;
	else begin
		if(cs == S_BUY3)begin
				case (bitmid_reg)
					Large:begin
						if((usr1_shop_info.large_num + bitnum_reg) > 63) b_err_msg <=  INV_Full;
						else if(usr2_shop_info.large_num < bitnum_reg) b_err_msg <= INV_Not_Enough;
						else if(b_err3) b_err_msg <= Out_of_money;
					end
					Medium:begin
						if((usr1_shop_info.medium_num + bitnum_reg) > 63) b_err_msg <= INV_Full;
						else if(usr2_shop_info.medium_num < bitnum_reg) b_err_msg <= INV_Not_Enough;
						else if(b_err3) b_err_msg <= Out_of_money;
					end
					default:begin //Small
						if((usr1_shop_info.small_num + bitnum_reg) > 63) b_err_msg <= INV_Full;
						else if(usr2_shop_info.small_num < bitnum_reg) b_err_msg <= INV_Not_Enough;
						else if(b_err3) b_err_msg <= Out_of_money;
					end 
				endcase
		end else if(cs == S_RTN3)begin

			if(histable_valid[usr1_id]==1'b1 && histable_bs[usr1_id] == 0)begin
				if(usr1_user_info.shop_history.seller_ID != usr2_id) b_err_msg <= Wrong_ID; //wrong seller ID
				else if(usr1_user_info.shop_history.item_num != bitnum_reg) b_err_msg <= Wrong_Num; //wrong number
				else if(usr1_user_info.shop_history.item_ID != bitmid_reg) b_err_msg <= Wrong_Item; // wrong item
				else b_err_msg <= Wrong_act; // wrong operation
			end else begin
				b_err_msg <= Wrong_act; // wrong operation
			end 	
 
		end
	end
end

//about histories
always_ff @(posedge clk or negedge inf.rst_n)begin
	if(!inf.rst_n)begin
		roll_cnt <= 0;
	end else begin
		case(cs)
			S_INIT: roll_cnt <= 0;
			S_CHECK_SELF_DONE0: roll_cnt <= roll_cnt + 1;
			S_CHECK_OTHER_DONE0: roll_cnt <= roll_cnt + 1;
			S_DEPOSIT_DONE0: roll_cnt <= roll_cnt + 1;
			S_BUY_EXIT0: roll_cnt <= roll_cnt + 1;
			S_RTN_EXIT0: roll_cnt <= roll_cnt + 1;
		endcase	
	end
end

always_ff @(posedge clk or negedge inf.rst_n ) begin
	if(!inf.rst_n)begin
		for(idx = 0; idx <= 255; idx = idx+1)begin
			histable[idx] <= 8'd0;
			histable_valid[idx] <= 1'd0;
			histable_bs[idx] <= 1'd0;
		end
	end else begin
		case (cs)
			S_CHECK_SELF_DONE0:begin
				// histable[roll_cnt]
				// for(idx = 0; idx <= 255; idx = idx+1)begin
				// 	if(histable[idx] == usr1_id || idx == usr1_id) histable_valid[idx] <= 0;
				// end
				if(histable[0] == usr1_id || roll_cnt == usr1_id)begin
					histable_valid[255] <= 0;
					histable[255] <= histable[0];
				end else begin
					histable_valid[255] <= histable_valid[0];
					histable[255] <= histable[0];
				end
				for(idx = 0; idx <= 254; idx = idx+1)begin
					histable_valid[idx] <= histable_valid[idx+1];
					histable[idx] <= histable[idx+1];
				end
			end
			S_CHECK_OTHER_DONE0:begin
				// for(idx = 0; idx <= 255; idx = idx+1)begin
				// 	if(histable[idx] == usr1_id || histable[idx] == usr2_id || idx == usr1_id || idx == usr2_id) histable_valid[idx] <= 0;
				// end
				
				if(histable[0] == usr1_id || roll_cnt == usr1_id || histable[0] == usr2_id || roll_cnt == usr2_id)begin
					histable_valid[255] <= 0;
					histable[255] <= histable[0];
				end else begin
					histable_valid[255] <= histable_valid[0];
					histable[255] <= histable[0];
				end
				for(idx = 0; idx <= 254; idx = idx+1)begin
					histable_valid[idx] <= histable_valid[idx+1];
					histable[idx] <= histable[idx+1];
				end

			end
			S_DEPOSIT_DONE0:begin
				if(deposit_cmp == 0)begin// make sure it's successful
					
					// for(idx = 0; idx <= 255; idx = idx+1)begin
					// 	if(histable[idx] == usr1_id || idx == usr1_id) histable_valid[idx] <= 0;
					// end
					
					if(histable[0] == usr1_id || roll_cnt == usr1_id)begin
						histable_valid[255] <= 0;
						histable[255] <= histable[0];
					end else begin
						histable_valid[255] <= histable_valid[0];	
						histable[255] <= histable[0];
					end
					for(idx = 0; idx <= 254; idx = idx+1)begin
						histable_valid[idx] <= histable_valid[idx+1];
						histable[idx] <= histable[idx+1];
					end

				end
			end
			S_BUY_EXIT0:begin
				// for(idx = 0; idx <= 255; idx = idx+1)begin
				// 	if(idx == usr1_id)begin
				// 		histable[usr1_id] <= usr2_id;
				// 		histable_valid[usr1_id] <= 1'b1; 
				// 		histable_bs[usr1_id] <= 1'b0;
				// 	end else if(idx == usr2_id)begin
				// 		histable[usr2_id] <= usr1_id;
				// 		histable_valid[usr2_id] <= 1'b1;
				// 		histable_bs[usr2_id] <= 1'b1;
				// 	end else if(histable[idx] == usr1_id || histable[idx] == usr2_id)begin
				// 		histable_valid[idx] <= 0;
				// 	end
				// end

				if(roll_cnt == usr1_id)begin
					histable[255] <=usr2_id;
					histable_valid[255] <= 1'b1;
					histable_bs[255] <= 1'b0;
				end else if(roll_cnt == usr2_id)begin
					histable[255] <=usr1_id;
					histable_valid[255] <= 1'b1;
					histable_bs[255] <= 1'b1;
				end else if(histable[0] == usr1_id || histable[0] == usr2_id)begin
					histable[255] <= histable[0];
					histable_valid[255] <= 1'b0;
					histable_bs[255] <= histable_bs[0];
				end else begin
					histable[255] <= histable[0];
					histable_valid[255] <= histable_valid[0];
					histable_bs[255] <= histable_bs[0];
				end

				for(idx = 0; idx <= 254; idx = idx+1)begin
					histable[idx] <= histable[idx+1];
					histable_valid[idx] <= histable_valid[idx+1];
					histable_bs[idx] <= histable_bs[idx+1];
				end

			end
			S_RTN_EXIT0:begin
				// for(idx = 0; idx <= 255; idx = idx+1)begin
				// 	if(histable[idx] == usr1_id || histable[idx] == usr2_id || idx == usr1_id || idx == usr2_id) histable_valid[idx] <= 0;
				// end
				if(histable[0] == usr1_id || roll_cnt == usr1_id || histable[0] == usr2_id || roll_cnt == usr2_id)begin
					histable_valid[255] <= 0;
					histable[255] <= histable[0];
				end else begin
					histable_valid[255] <= histable_valid[0];
					histable[255] <= histable[0];
				end
				for(idx = 0; idx <= 254; idx = idx+1)begin
					histable_valid[idx] <= histable_valid[idx+1];
					histable[idx] <= histable[idx+1];
				end
			end
		endcase
	end

end

// output logic
always_ff @(posedge clk or negedge inf.rst_n) begin
    if(!inf.rst_n) inf.out_valid <= 0;
	else begin
		case (cs)
			S_CHECK_SELF_DONE: inf.out_valid <= 1;
			S_CHECK_OTHER_DONE: inf.out_valid <= 1;
			S_DEPOSIT_DONE: inf.out_valid <= 1;
			S_BUY_ERR: inf.out_valid <= 1;
			S_BUY_EXIT: inf.out_valid <= 1;
			S_RTN_ERR: inf.out_valid <= 1;
			S_RTN_EXIT: inf.out_valid <= 1;
			default: inf.out_valid <= 0;
		endcase		
	end
end
always_ff @(posedge clk or negedge inf.rst_n) begin
    if(!inf.rst_n) inf.err_msg <= No_Err;
	else begin
		case (cs)
			S_CHECK_SELF_DONE: inf.err_msg <= No_Err;
			S_CHECK_OTHER_DONE: inf.err_msg <= No_Err;
			S_DEPOSIT_DONE: inf.err_msg <= (deposit_cmp)? Wallet_is_Full : No_Err;
			S_BUY_ERR: inf.err_msg <= b_err_msg;
			S_BUY_EXIT: inf.err_msg <= No_Err;
			S_RTN_ERR: inf.err_msg <= b_err_msg;
			S_RTN_EXIT: inf.err_msg <= No_Err;
			default: inf.err_msg <= No_Err;
		endcase	
	end
end
always_ff @(posedge clk or negedge inf.rst_n) begin
    if(!inf.rst_n) inf.complete <= 0;
	else begin
		case (cs)
			S_CHECK_SELF_DONE: inf.complete <= 1;
			S_CHECK_OTHER_DONE: inf.complete <= 1;
			S_DEPOSIT_DONE: inf.complete <= (deposit_cmp)? 1'b0 : 1'b1;
			S_BUY_ERR: inf.complete <= 0;
			S_BUY_EXIT: inf.complete <= 1;
			S_RTN_ERR: inf.complete <= 0;
			S_RTN_EXIT: inf.complete <= 1;
			default: inf.complete <= 0;
		endcase	
	end
end
always_ff @(posedge clk or negedge inf.rst_n) begin
    if(!inf.rst_n) inf.out_info <= 0;
	else begin
		case (cs)
			S_CHECK_SELF_DONE: inf.out_info <= (usr2_id == user_id_reg1)?{16'd0, usr2_user_info.money} : {16'd0, usr1_user_info.money};
			S_CHECK_OTHER_DONE: inf.out_info <= {14'd0, usr2_shop_info.large_num, usr2_shop_info.medium_num, usr2_shop_info.small_num};
			S_DEPOSIT_DONE:begin
				// if(deposit_cmp) inf.out_info <= {16'd0, usr1_user_info.money};
				if(deposit_cmp) inf.out_info <= 0;
				else inf.out_info <= {16'd0, deposit_add[15:0]};
			end
			S_BUY_ERR: inf.out_info <= 0;
			S_BUY_EXIT: inf.out_info <= usr1_user_info;

			S_RTN_ERR: inf.out_info <= 0; 
			S_RTN_EXIT: inf.out_info <= {14'd0, usr1_shop_info.large_num, usr1_shop_info.medium_num, usr1_shop_info.small_num};

			default: inf.out_info <= 0;
		endcase	
	end
end

endmodule