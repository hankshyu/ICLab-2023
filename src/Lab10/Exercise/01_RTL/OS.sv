module OS(input clk, INF.OS_inf inf);
import usertype::*;

enum logic [3:0] {S_IDLE, S_Change_user, S_Buy, S_Buy1, S_B_fin,
				S_Check, S_Check1, S_Check2, S_Deposit0, S_Deposit,
				S_Deposit_fin, S_Return, S_Return1, S_R_fin, S_WB,
				S_OUT} ns, cs;

logic [7:0] c_user, t_user, wb_user;
logic [7:0] buy_his [255:0];
logic [1:0] buy_first [255:0];
logic [2:0] cnt;
logic [31:0] o_info;
logic bridge_flag;//, pro_flag;

Shop_Info shop_info_0, shop_info_1;
User_Info user_info_0, user_info_1;
Item_id item0;
Item_num item_num0;
Money money0;
Error_Msg err_msg0;

always_ff@(posedge clk or negedge inf.rst_n)begin
if(!inf.rst_n) 	cs <= S_IDLE;
else	 	cs <= ns;
end
always_comb begin
case(cs)
	S_IDLE:begin
		if(inf.id_valid) 		ns = S_Change_user;
		else if(inf.act_valid)begin
			ns = S_IDLE;
			case(inf.D.d_act[0])
				No_action:		ns = S_IDLE;
				Buy:			ns = S_Buy;
				Check:			ns = S_Check;
				Deposit:		ns = S_Deposit0;
				Return:			ns = S_Return;
				default:		ns = S_IDLE;
			endcase
		end
		else 					ns = S_IDLE;
	end
	S_Change_user:				ns = S_IDLE;
	S_Buy:begin
		if(inf.id_valid)		ns = S_Buy1;
		else 					ns = cs;
	end
	S_Buy1:begin
		if(cnt==2)				ns = S_B_fin;
		else					ns = cs;
	end
	S_B_fin:begin
		if(err_msg0==0)			ns = S_WB;
		else					ns = S_OUT;
	end
	S_Check:begin
		if(inf.id_valid)		ns = S_Check1;
		else if(cnt==5)			ns = S_Check2;
		else 					ns = cs;
	end
	S_Check1:begin
		if(cnt==2)				ns = S_OUT;
		else					ns = cs;
	end
	S_Check2:begin
		if(cnt==1)				ns = S_OUT;
		else					ns = cs;
	end
	S_Deposit0:begin
		if(inf.amnt_valid)		ns = S_Deposit;
		else					ns = cs;
	end
	S_Deposit:begin
		if(cnt==1)				ns = S_Deposit_fin;
		else					ns = cs;
	end
	S_Deposit_fin:begin
		if(err_msg0==0)			ns = S_WB;
		else					ns = S_OUT;
	end
	S_Return:begin
		if(inf.id_valid)		ns = S_Return1;
		else 					ns = cs;
	end
	S_Return1:begin
		if(cnt==2)				ns = S_R_fin;
		else					ns = cs;
	end
	S_R_fin:begin
		if(err_msg0==0)			ns = S_WB;
		else					ns = S_OUT;
	end
	S_WB:begin
		if(cnt==0)				ns = S_OUT;
		else					ns = cs;
	end
	S_OUT:						ns = S_IDLE;
	default: 					ns = S_IDLE;
endcase
end

always_ff@(posedge clk or negedge inf.rst_n)begin
if(!inf.rst_n)begin
	cnt<=0;
end else begin
	case(cs)
	S_IDLE:cnt<=0;
	S_Buy:cnt<=0;
	S_Buy1, S_Check1, S_Check2, S_Deposit, S_Return1:begin
		if(inf.C_out_valid)
			cnt<=cnt+1;
		if(cnt==0&&bridge_flag==0)
			cnt<=1;
	end
	S_Check:begin
		cnt<=cnt+1;
		if(cnt==5)
			cnt<=0;
		if(inf.id_valid)
			cnt<=0;
	end
	S_WB:begin
		if(inf.C_out_valid)
			cnt<=cnt-1;
	end

	endcase
end
end

always_ff@(posedge clk or negedge inf.rst_n)begin
if(!inf.rst_n)begin
	c_user<=0;
end else begin
	if(cs==S_IDLE)
		if(inf.id_valid)
			c_user <= inf.D.d_id[0];
end
end

always_ff@(posedge clk or negedge inf.rst_n)begin
if(!inf.rst_n)begin
	item0<=No_item;
	item_num0<=0;
	t_user<=0;
end else begin
	case(cs)
	S_Buy, S_Return:begin
		if(inf.item_valid)
			item0<=inf.D.d_item[0];
		if(inf.num_valid)
			item_num0<=inf.D.d_item_num[5:0];
		if(inf.id_valid)
			t_user<=inf.D.d_id[0];
	end
	S_Check:begin
		if(inf.id_valid)
			t_user<=inf.D.d_id[0];
	end
	S_Deposit0:begin
		t_user<=c_user;
	end
	endcase
end
end
always_ff@(posedge clk or negedge inf.rst_n)begin
if(!inf.rst_n)begin
	money0<=0;
end else begin
	if(cs==S_Deposit0)
		if(inf.amnt_valid)
			money0 <= inf.D.d_money;
end
end

always_ff@(posedge clk or negedge inf.rst_n)begin
if(!inf.rst_n)begin
	shop_info_0<=0;
	user_info_0<=0;
	shop_info_1<=0;
	user_info_1<=0;
end else begin
	if(inf.C_out_valid&&inf.C_r_wb)begin
		//shop_info_1 <= inf.C_data_r[31:0];
		shop_info_1.exp<={inf.C_data_r[19:16], inf.C_data_r[31:24]};
		shop_info_1.level<=inf.C_data_r[21:20];
		shop_info_1.large_num<=inf.C_data_r[7:2];
		shop_info_1.medium_num<={inf.C_data_r[1:0], inf.C_data_r[15:12]};
		shop_info_1.small_num<={inf.C_data_r[11:8], inf.C_data_r[23:22]};
		user_info_1.money <= {inf.C_data_r[39:32], inf.C_data_r[47:40]};
		user_info_1.shop_history.item_ID <= {inf.C_data_r[55:54]};
		user_info_1.shop_history.item_num <= {inf.C_data_r[53:48]};
		user_info_1.shop_history.seller_ID <= {inf.C_data_r[63:56]};
	end
	case(cs)
	S_Buy1:begin
		if(cnt==1)begin
			shop_info_0<=shop_info_1;
			user_info_0<=user_info_1;
		end
		if(cnt==2)begin
			case(item0)
			Large:begin
				if(63-shop_info_0.large_num>=item_num0 && shop_info_1.large_num>=item_num0)begin
					case(shop_info_0.level)
					Platinum:
						if(user_info_0.money>=300*item_num0 + 10)begin
							shop_info_0.large_num<=shop_info_0.large_num+item_num0;
							shop_info_1.large_num<=shop_info_1.large_num-item_num0;
							user_info_0.money<=user_info_0.money-300*item_num0 - 10;
							if(65535-user_info_1.money>=300*item_num0)
								user_info_1.money<=user_info_1.money+300*item_num0;
							else
								user_info_1.money<=65535;
							
							user_info_0.shop_history.item_ID<=Large;
							user_info_0.shop_history.item_num<=item_num0;
							user_info_0.shop_history.seller_ID<=t_user;
						end
					Gold:
						if(user_info_0.money>=300*item_num0 + 30)begin
							shop_info_0.large_num<=shop_info_0.large_num+item_num0;
							shop_info_1.large_num<=shop_info_1.large_num-item_num0;
							user_info_0.money<=user_info_0.money-300*item_num0 - 30;
							if(65535-user_info_1.money>=300*item_num0)
								user_info_1.money<=user_info_1.money+300*item_num0;
							else
								user_info_1.money<=65535;
							if(shop_info_0.exp + 60*item_num0 >=4000)begin
								shop_info_0.exp<=0;
								shop_info_0.level<=Platinum;
							end else 
								shop_info_0.exp<=shop_info_0.exp + 60*item_num0;
								
							user_info_0.shop_history.item_ID<=Large;
							user_info_0.shop_history.item_num<=item_num0;
							user_info_0.shop_history.seller_ID<=t_user;
						end					
					Silver:	
						if(user_info_0.money>=300*item_num0 + 50)begin
							shop_info_0.large_num<=shop_info_0.large_num+item_num0;
							shop_info_1.large_num<=shop_info_1.large_num-item_num0;
							user_info_0.money<=user_info_0.money-300*item_num0 - 50;
							if(65535-user_info_1.money>=300*item_num0)
								user_info_1.money<=user_info_1.money+300*item_num0;
							else
								user_info_1.money<=65535;
							if(shop_info_0.exp + 60*item_num0 >=2500)begin
								shop_info_0.exp<=0;
								shop_info_0.level<=Gold;
							end else 
								shop_info_0.exp<=shop_info_0.exp + 60*item_num0;
								
							user_info_0.shop_history.item_ID<=Large;
							user_info_0.shop_history.item_num<=item_num0;
							user_info_0.shop_history.seller_ID<=t_user;
						end
					Copper:
						if(user_info_0.money>=300*item_num0 + 70)begin
							shop_info_0.large_num<=shop_info_0.large_num+item_num0;
							shop_info_1.large_num<=shop_info_1.large_num-item_num0;
							user_info_0.money<=user_info_0.money-300*item_num0 - 70;
							if(65535-user_info_1.money>=300*item_num0)
								user_info_1.money<=user_info_1.money+300*item_num0;
							else
								user_info_1.money<=65535;
							if(shop_info_0.exp + 60*item_num0 >=1000)begin
								shop_info_0.exp<=0;
								shop_info_0.level<=Silver;
							end else 
								shop_info_0.exp<=shop_info_0.exp + 60*item_num0;
								
							user_info_0.shop_history.item_ID<=Large;
							user_info_0.shop_history.item_num<=item_num0;
							user_info_0.shop_history.seller_ID<=t_user;
						end
					endcase
				end
			end
			Medium:begin
				if(63-shop_info_0.medium_num>=item_num0 && shop_info_1.medium_num>=item_num0)begin
					case(shop_info_0.level)
					Platinum:
						if(user_info_0.money>=200*item_num0 + 10)begin
							shop_info_0.medium_num<=shop_info_0.medium_num+item_num0;
							shop_info_1.medium_num<=shop_info_1.medium_num-item_num0;
							user_info_0.money<=user_info_0.money-200*item_num0 - 10;
							if(65535-user_info_1.money>=200*item_num0)
								user_info_1.money<=user_info_1.money+200*item_num0;
							else
								user_info_1.money<=65535;
							
							user_info_0.shop_history.item_ID<=Medium;
							user_info_0.shop_history.item_num<=item_num0;
							user_info_0.shop_history.seller_ID<=t_user;
						end
					Gold:
						if(user_info_0.money>=200*item_num0 + 30)begin
							shop_info_0.medium_num<=shop_info_0.medium_num+item_num0;
							shop_info_1.medium_num<=shop_info_1.medium_num-item_num0;
							user_info_0.money<=user_info_0.money-200*item_num0 - 30;
							if(65535-user_info_1.money>=200*item_num0)
								user_info_1.money<=user_info_1.money+200*item_num0;
							else
								user_info_1.money<=65535;
							if(shop_info_0.exp + 40*item_num0 >=4000)begin
								shop_info_0.exp<=0;
								shop_info_0.level<=Platinum;
							end else 
								shop_info_0.exp<=shop_info_0.exp + 40*item_num0;
								
							user_info_0.shop_history.item_ID<=Medium;
							user_info_0.shop_history.item_num<=item_num0;
							user_info_0.shop_history.seller_ID<=t_user;
						end					
					Silver:	
						if(user_info_0.money>=200*item_num0 + 50)begin
							shop_info_0.medium_num<=shop_info_0.medium_num+item_num0;
							shop_info_1.medium_num<=shop_info_1.medium_num-item_num0;
							user_info_0.money<=user_info_0.money-200*item_num0 - 50;
							if(65535-user_info_1.money>=200*item_num0)
								user_info_1.money<=user_info_1.money+200*item_num0;
							else
								user_info_1.money<=65535;
							if(shop_info_0.exp + 40*item_num0 >=2500)begin
								shop_info_0.exp<=0;
								shop_info_0.level<=Gold;
							end else 
								shop_info_0.exp<=shop_info_0.exp + 40*item_num0;
								
							user_info_0.shop_history.item_ID<=Medium;
							user_info_0.shop_history.item_num<=item_num0;
							user_info_0.shop_history.seller_ID<=t_user;
						end
					Copper:
						if(user_info_0.money>=200*item_num0 + 70)begin
							shop_info_0.medium_num<=shop_info_0.medium_num+item_num0;
							shop_info_1.medium_num<=shop_info_1.medium_num-item_num0;
							user_info_0.money<=user_info_0.money-200*item_num0 - 70;
							if(65535-user_info_1.money>=200*item_num0)
								user_info_1.money<=user_info_1.money+200*item_num0;
							else
								user_info_1.money<=65535;
							if(shop_info_0.exp + 40*item_num0 >=1000)begin
								shop_info_0.exp<=0;
								shop_info_0.level<=Silver;
							end else 
								shop_info_0.exp<=shop_info_0.exp + 40*item_num0;
								
							user_info_0.shop_history.item_ID<=Medium;
							user_info_0.shop_history.item_num<=item_num0;
							user_info_0.shop_history.seller_ID<=t_user;
						end
					endcase
				end
			end
			Small:begin
				if(63-shop_info_0.small_num>=item_num0 && shop_info_1.small_num>=item_num0)begin
					case(shop_info_0.level)
					Platinum:
						if(user_info_0.money>=100*item_num0 + 10)begin
							shop_info_0.small_num<=shop_info_0.small_num+item_num0;
							shop_info_1.small_num<=shop_info_1.small_num-item_num0;
							user_info_0.money<=user_info_0.money-100*item_num0 - 10;
							if(65535-user_info_1.money>=100*item_num0)
								user_info_1.money<=user_info_1.money+100*item_num0;
							else
								user_info_1.money<=65535;
							
							user_info_0.shop_history.item_ID<=Small;
							user_info_0.shop_history.item_num<=item_num0;
							user_info_0.shop_history.seller_ID<=t_user;
						end
					Gold:
						if(user_info_0.money>=100*item_num0 + 30)begin
							shop_info_0.small_num<=shop_info_0.small_num+item_num0;
							shop_info_1.small_num<=shop_info_1.small_num-item_num0;
							user_info_0.money<=user_info_0.money-100*item_num0 - 30;
							if(65535-user_info_1.money>=100*item_num0)
								user_info_1.money<=user_info_1.money+100*item_num0;
							else
								user_info_1.money<=65535;
							if(shop_info_0.exp + 20*item_num0 >=4000)begin
								shop_info_0.exp<=0;
								shop_info_0.level<=Platinum;
							end else 
								shop_info_0.exp<=shop_info_0.exp + 20*item_num0;
								
							user_info_0.shop_history.item_ID<=Small;
							user_info_0.shop_history.item_num<=item_num0;
							user_info_0.shop_history.seller_ID<=t_user;
						end					
					Silver:	
						if(user_info_0.money>=100*item_num0 + 50)begin
							shop_info_0.small_num<=shop_info_0.small_num+item_num0;
							shop_info_1.small_num<=shop_info_1.small_num-item_num0;
							user_info_0.money<=user_info_0.money-100*item_num0 - 50;
							if(65535-user_info_1.money>=100*item_num0)
								user_info_1.money<=user_info_1.money+100*item_num0;
							else
								user_info_1.money<=65535;
							if(shop_info_0.exp + 20*item_num0 >=2500)begin
								shop_info_0.exp<=0;
								shop_info_0.level<=Gold;
							end else 
								shop_info_0.exp<=shop_info_0.exp + 20*item_num0;
								
							user_info_0.shop_history.item_ID<=Small;
							user_info_0.shop_history.item_num<=item_num0;
							user_info_0.shop_history.seller_ID<=t_user;
						end
					Copper:
						if(user_info_0.money>=100*item_num0 + 70)begin
							shop_info_0.small_num<=shop_info_0.small_num+item_num0;
							shop_info_1.small_num<=shop_info_1.small_num-item_num0;
							user_info_0.money<=user_info_0.money-100*item_num0 - 70;
							if(65535-user_info_1.money>=100*item_num0)
								user_info_1.money<=user_info_1.money+100*item_num0;
							else
								user_info_1.money<=65535;
							if(shop_info_0.exp + 20*item_num0 >=1000)begin
								shop_info_0.exp<=0;
								shop_info_0.level<=Silver;
							end else 
								shop_info_0.exp<=shop_info_0.exp + 20*item_num0;
								
							user_info_0.shop_history.item_ID<=Small;
							user_info_0.shop_history.item_num<=item_num0;
							user_info_0.shop_history.seller_ID<=t_user;
						end
					endcase
				end
			end
			endcase//ITEM
			
		end
	end
	S_Deposit:begin
		if(cnt==1)begin
			if(65535-user_info_1.money>=money0)
				user_info_1.money<=user_info_1.money+money0;
		end
	end
	S_Return1:begin
		if(cnt==1)begin
			shop_info_0<=shop_info_1;
			user_info_0<=user_info_1;
		end
		if(cnt==2)begin
			if(buy_first[c_user]==1&&buy_first[t_user]==2)
			if(buy_his[user_info_0.shop_history.seller_ID]==c_user&&buy_first[user_info_0.shop_history.seller_ID]==2)
			if(buy_his[c_user]==t_user&&buy_his[t_user]==c_user)begin
				if(user_info_0.shop_history.seller_ID==t_user)begin
					if(user_info_0.shop_history.item_num==item_num0)begin
						if(user_info_0.shop_history.item_ID==item0)begin
							case(item0)
							Large:begin
								shop_info_0.large_num<=shop_info_0.large_num-item_num0;
								shop_info_1.large_num<=shop_info_1.large_num+item_num0;
								user_info_0.money<=user_info_0.money+300*item_num0;
								user_info_1.money<=user_info_1.money-300*item_num0;
							end
							Medium:begin
								shop_info_0.medium_num<=shop_info_0.medium_num-item_num0;
								shop_info_1.medium_num<=shop_info_1.medium_num+item_num0;
								user_info_0.money<=user_info_0.money+200*item_num0;
								user_info_1.money<=user_info_1.money-200*item_num0;
							end
							Small:begin
								shop_info_0.small_num<=shop_info_0.small_num-item_num0;
								shop_info_1.small_num<=shop_info_1.small_num+item_num0;
								user_info_0.money<=user_info_0.money+100*item_num0;
								user_info_1.money<=user_info_1.money-100*item_num0;
							end
							endcase
						end
					end
				end
			end
		end
	end
	endcase//Current_state
end
end

integer i;
always_ff@(posedge clk or negedge inf.rst_n)begin
if(!inf.rst_n) 	
	for(i=0; i<256; i=i+1)begin
		buy_his[i] <= 0;
		buy_first[i]<=0;
	end
else begin
	if(cs==S_B_fin&&err_msg0==0)begin
		buy_his[c_user]<=t_user;
		buy_his[t_user]<=c_user;
		buy_first[c_user]<=1;
		buy_first[t_user]<=2;
	end
	/*if(cs==S_Check)
		buy_his[c_user]<=buy_his[c_user]+1;
	if(cs==S_Check1)
		buy_his[t_user]<=buy_his[t_user]+1;
	if(cs==S_Deposit_fin&&err_msg0==0)
		buy_his[c_user]<=buy_his[c_user]+1;
	if(cs==S_R_fin&&err_msg0==0)
		buy_his[c_user]<=buy_his[c_user]+1;*/
		
	if(cs==S_Check)
		buy_first[c_user]<=0;
	if(cs==S_Check1)
		buy_first[t_user]<=0;
	if(cs==S_Deposit_fin&&err_msg0==0)
		buy_first[c_user]<=0;
	if(cs==S_R_fin&&err_msg0==0)
		buy_first[c_user]<=0;
end
end

always_ff@(posedge clk or negedge inf.rst_n)begin
if(!inf.rst_n) 	err_msg0 <= No_Err;
else begin
	if(cs==S_Buy1&&cnt==2)begin
		err_msg0<=No_Err;
		case(item0)
		Large:begin
			if(63-shop_info_0.large_num<item_num0)
				err_msg0<=INV_Full;
			else if(shop_info_1.large_num<item_num0)
				err_msg0<=INV_Not_Enough;
			else begin
				case(shop_info_0.level)
				Platinum:
					if(user_info_0.money<300*item_num0 + 10)
						err_msg0<=Out_of_money;
				Gold:
					if(user_info_0.money<300*item_num0 + 30)
						err_msg0<=Out_of_money;
				Silver:
					if(user_info_0.money<300*item_num0 + 50)
						err_msg0<=Out_of_money;
				Copper:
					if(user_info_0.money<300*item_num0 + 70)
						err_msg0<=Out_of_money;
				endcase
			end
		end
		Medium:begin
			if(63-shop_info_0.medium_num<item_num0)
				err_msg0<=INV_Full;
			else if(shop_info_1.medium_num<item_num0)
				err_msg0<=INV_Not_Enough;
			else begin
				case(shop_info_0.level)
				Platinum:
					if(user_info_0.money<200*item_num0 + 10)
						err_msg0<=Out_of_money;
				Gold:
					if(user_info_0.money<200*item_num0 + 30)
						err_msg0<=Out_of_money;
				Silver:
					if(user_info_0.money<200*item_num0 + 50)
						err_msg0<=Out_of_money;
				Copper:
					if(user_info_0.money<200*item_num0 + 70)
						err_msg0<=Out_of_money;
				endcase
			end
		end
		Small:begin
			if(63-shop_info_0.small_num<item_num0)
				err_msg0<=INV_Full;
			else if(shop_info_1.small_num<item_num0)
				err_msg0<=INV_Not_Enough;
			else begin
				case(shop_info_0.level)
				Platinum:
					if(user_info_0.money<100*item_num0 + 10)
						err_msg0<=Out_of_money;
				Gold:
					if(user_info_0.money<100*item_num0 + 30)
						err_msg0<=Out_of_money;
				Silver:
					if(user_info_0.money<100*item_num0 + 50)
						err_msg0<=Out_of_money;
				Copper:
					if(user_info_0.money<100*item_num0 + 70)
						err_msg0<=Out_of_money;
				endcase
			end
		end
		endcase
	end
	if(cs==S_Check)
		err_msg0<=No_Err;
	if(cs==S_Deposit)begin
		if(cnt==1)begin
			if(65535-user_info_1.money<money0)
				err_msg0<=Wallet_is_Full;
			else	
				err_msg0<=No_Err;
		end
	end
	if(cs==S_Return1&&cnt==2)begin
		err_msg0<=No_Err;
		if(buy_first[c_user]!=1)
			err_msg0<=Wrong_act;
		else if(buy_his[user_info_0.shop_history.seller_ID]!=c_user||buy_first[user_info_0.shop_history.seller_ID]!=2)
			err_msg0<=Wrong_act;
		else if(buy_his[c_user]!=t_user)
			err_msg0<=Wrong_ID;
		else if(buy_his[t_user]!=c_user||buy_first[t_user]!=2)
			err_msg0<=Wrong_act;
		else if(!(user_info_0.shop_history.item_num==item_num0))
			err_msg0<=Wrong_Num;
		else if(!(user_info_0.shop_history.item_ID==item0))
			err_msg0<=Wrong_Item;
	end
end
end

always_ff@(posedge clk or negedge inf.rst_n)begin
if(!inf.rst_n) 	o_info <= 0;
else begin
	case(cs)
	S_B_fin:begin
		o_info<=user_info_0;
	end
	S_Check1:begin
		if(cnt==2)
			o_info<={14'd0, shop_info_1[31:14]};
	end
	S_Check2:begin
		if(cnt==1)
			o_info<={16'd0, user_info_1.money};
	end
	S_Deposit_fin:begin
		o_info<={16'd0, user_info_1.money};
	end
	S_R_fin:begin
		o_info<={14'd0, shop_info_0[31:14]};
	end
	S_OUT:begin
		o_info<=0;
	end
	endcase
end
end

always_ff@(posedge clk or negedge inf.rst_n)begin
if(!inf.rst_n)begin
 	inf.out_info <= 0;
	inf.out_valid<=0;
	inf.err_msg<=No_Err;
	inf.complete<=0;
end else begin
	inf.out_info <= 0;
	inf.out_valid<=0;
	inf.err_msg<=No_Err;
	inf.complete<=0;
	if(cs==S_OUT)begin
		inf.out_valid<=1;
		inf.err_msg<=err_msg0;
		if(err_msg0==No_Err)begin
			inf.complete<=1;
			inf.out_info <= o_info;
		end else begin
			inf.complete<=0;
			inf.out_info <= 0;
		end
	end
end
end

//------------bridge control------------
always_ff@(posedge clk or negedge inf.rst_n)begin
if(!inf.rst_n) 	bridge_flag <= 0;
else begin
	if(inf.C_in_valid)	bridge_flag<=1;
	if(inf.C_out_valid) bridge_flag<=0;
	//if(cs == S_Change_user) bridge_flag<=1;
	//if(cs==S_Buy1&&cnt==1&&bridge_flag==0) bridge_flag<=1;
end
end
always_ff@(posedge clk or negedge inf.rst_n)begin
if(!inf.rst_n)begin
	inf.C_in_valid <= 0;
	inf.C_data_w <= 0;
	inf.C_addr <= 0;
	inf.C_r_wb <= 0;
end else begin
	inf.C_in_valid <= 0;
	inf.C_data_w <= 0;
	inf.C_addr <= 0;
	if(cs == S_IDLE&&inf.act_valid&&inf.D.d_act[0]!=No_action)begin
		inf.C_in_valid <= 1;
		inf.C_addr <= c_user;
		inf.C_data_w <= 0;
		inf.C_r_wb <= 1;
	end
	if(cs==S_Buy1&&cnt==1&&bridge_flag==0&&inf.C_in_valid==0)begin
		inf.C_in_valid <= 1;
		inf.C_addr <= t_user;
		inf.C_data_w <= 0;
		inf.C_r_wb <= 1;
	end
	if(cs==S_Check1&&cnt==1&&bridge_flag==0&&inf.C_in_valid==0)begin
		inf.C_in_valid <= 1;
		inf.C_addr <= t_user;
		inf.C_data_w <= 0;
		inf.C_r_wb <= 1;
	end
	if(cs==S_Return1&&cnt==1&&bridge_flag==0&&inf.C_in_valid==0)begin
		inf.C_in_valid <= 1;
		inf.C_addr <= t_user;
		inf.C_data_w <= 0;
		inf.C_r_wb <= 1;
	end
	if(cs==S_WB&&bridge_flag==0&&inf.C_in_valid==0)begin
		if(cnt==2)begin
			inf.C_in_valid <= 1;
			inf.C_addr <= c_user;
			inf.C_data_w <= {user_info_0.shop_history.seller_ID, user_info_0.shop_history.item_ID, user_info_0.shop_history.item_num,
							 user_info_0.money[7:0], user_info_0.money[15:8],
							shop_info_0.exp[7:0], shop_info_0.small_num[1:0], shop_info_0.level, shop_info_0.exp[11:8],
							shop_info_0.medium_num[3:0], shop_info_0.small_num[5:2],
							shop_info_0.large_num, shop_info_0.medium_num[5:4]};
			inf.C_r_wb <= 0;
		end
		if(cnt==1)begin
			inf.C_in_valid <= 1;
			inf.C_addr <= t_user;
			inf.C_data_w <= {user_info_1.shop_history.seller_ID, user_info_1.shop_history.item_ID, user_info_1.shop_history.item_num,
							 user_info_1.money[7:0],user_info_1.money[15:8], 
							shop_info_1.exp[7:0], shop_info_1.small_num[1:0], shop_info_1.level, shop_info_1.exp[11:8],
							shop_info_1.medium_num[3:0], shop_info_1.small_num[5:2],
							shop_info_1.large_num, shop_info_1.medium_num[5:4]};
			inf.C_r_wb <= 0;
		end
	end
	if(cs==S_OUT)begin
		inf.C_in_valid <= 0;
		inf.C_data_w <= 0;
		inf.C_addr <= 0;
		inf.C_r_wb <= 0;
	end
end
end
/*always_ff@(posedge clk or negedge inf.rst_n)begin
if(!inf.rst_n)begin
	shop_info_1<=32'd0;
	user_info_1<=32'd0;
end else begin
	if(inf.C_out_valid&&inf.C_r_wb)begin
		shop_info_1 <= inf.C_data_r[31:0];
		user_info_1 <= inf.C_data_r[63:32];
	end
end
end*/

endmodule

		/*input  
		// Pattern
		rst_n, D, id_valid, act_valid, item_valid, amnt_valid, num_valid, 
		// Bridge
		C_out_valid, C_data_r,
		output 
		// Pattern
		out_valid, err_msg,  complete, out_info, 
		// Bridge
		C_addr, C_data_w, C_in_valid, C_r_wb
		*/