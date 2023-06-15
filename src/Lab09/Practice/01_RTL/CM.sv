//############################################################################
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//   (C) Copyright Laboratory System Integration and Silicon Implementation
//   All Right Reserved
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   2018 ICLAB Spring Course
//   Lab09      : Coffee Maker
//   Author     : Chiang Wei
//   Editor			: Zhiting Dong            
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   File Name   : CM.sv
//   Module Name : CM
//   Release version : v2.0 (Release Date: Apr-2023)
//	 History version : v1.0 (Release Date: Nov-2018)
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//############################################################################


`include "Usertype_PKG.sv"
//synopsys translate_off
// `include "/usr/synthesis/dw/sim_ver/DW_div.v"
// `include "/usr/synthesis/dw/sim_ver/DW_div_pipe.v"
`include "DW_div_pipe.v"
`include "DW_div.v"
//synopsys translate_on


module CM(input clk, INF.DESIGN inf);
import usertype::*;

state current_state , next_state;

size coffee_size;
flavor coffee_flavor;

logic [2:0] counter;
logic [9:0] quotient;

logic [2:0] coffee_ratio[0:3];
logic [2:0]min_ratio;
logic divide2 , divide3 , divideother;
logic [4:0] dividemother;
integer i;
logic [9:0] volume;
logic [9:0] minus_ing_volume[0:3];

logic can_make_the_coffee;

window_led led_next_state[0:3];
logic signed [10:0] volume_next_state[0:3];


//-------------------------------state machine-----------------------------------------------------

always_ff@(posedge clk or negedge inf.rst_n)
begin
	if(!inf.rst_n)
	begin
		current_state <= MACHINE_READY;
	end
	else
	begin
		current_state <= next_state;
	end
end


always_comb
begin
	case(current_state)
		MACHINE_READY:
		begin
			if(inf.select_i != none)
			begin
				next_state = SUPPLY;
			end
			else if(inf.flavor_btn == user_define)
			begin
				next_state = USER_DEF;
			end
			else if(inf.flavor_btn == latte || inf.flavor_btn == cappuccino || inf.flavor_btn == mocha) 
			begin
				next_state = TYPE_DEF;
			end
			else
			begin
				next_state = MACHINE_READY;
			end
		end
		SUPPLY:
		begin
			if(inf.select_i != none)
			begin
				next_state = SUPPLY;
			end
			else
			begin
				next_state = OUTPUT;
			end
		end
		USER_DEF:
		begin
			if(counter == 3'b011 && min_ratio > 3'b001 && inf.ratio != 3'b001)
			begin
				next_state = REDUCE;
			end
			else if(counter == 3'b011)
			begin
				next_state = DIV;
			end
			else
			begin
				next_state = USER_DEF;
			end
		end
		TYPE_DEF , REDUCE:
		begin
			next_state = DIV;
		end
		DIV:
		begin
			if(counter == 3'b011)
			begin
				next_state = MUL;
			end
			else
			begin
				next_state = DIV;
			end
		end
		MUL:
		begin
			next_state = OUTPUT;
		end
		default:
		begin
			next_state = MACHINE_READY;
		end
	endcase
end




always_ff@(posedge clk or negedge inf.rst_n)
begin
	if(!inf.rst_n)
	begin
		inf.out_valid <= 1'b0;
	end
	else if(next_state == OUTPUT)
	begin
		inf.out_valid <= 1'b1;
	end
	else
	begin
		inf.out_valid <= 1'b0;
	end
end

always_ff@(posedge clk or negedge inf.rst_n)
begin
	if(!inf.rst_n)
	begin
		inf.flavor_out <= no_coffee;
	end
	else if(next_state == OUTPUT)
	begin
		inf.flavor_out <= (can_make_the_coffee == 1) ? coffee_flavor : no_coffee;
	end
	else
	begin
		inf.flavor_out <= no_coffee;
	end
end

		

always_ff@(posedge clk or negedge inf.rst_n)
begin
	if(!inf.rst_n)
	begin
		inf.window.espresso.led <= red;
		inf.window.espresso.monitor <= 10'b0;
	end
	else if(next_state == SUPPLY)
	begin
		case(inf.select_i)
			espresso:
			begin
				inf.window.espresso.monitor <= inf.window.espresso.monitor + inf.supply;
			end
			default:
			begin
				inf.window.espresso.monitor <= inf.window.espresso.monitor;
			end
		endcase
	end
	else if(current_state == SUPPLY && next_state == OUTPUT)
	begin
		inf.window.espresso.led <= (inf.window.espresso.monitor == 0) ? red : green;
	end
	else if(current_state != SUPPLY && next_state == OUTPUT && can_make_the_coffee == 1)
	begin
		inf.window.espresso.monitor <= volume_next_state[0][9:0];
		inf.window.espresso.led <= led_next_state[0];
	end
	else if(current_state != SUPPLY && next_state == OUTPUT && can_make_the_coffee == 0)
	begin
		inf.window.espresso.led <= led_next_state[0];
	end
	else
	begin
		inf.window.espresso.led <= inf.window.espresso.led;
		inf.window.espresso.monitor <= inf.window.espresso.monitor;
	end
end


always_ff@(posedge clk or negedge inf.rst_n)
begin
	if(!inf.rst_n)
	begin
		inf.window.milk.led <= red;
		inf.window.milk.monitor <= 10'b0;
	end
	else if(next_state == SUPPLY)
	begin
		case(inf.select_i)
			milk:
			begin
				inf.window.milk.monitor <= inf.window.milk.monitor + inf.supply;
			end
			default:
			begin
				inf.window.milk.monitor <= inf.window.milk.monitor;
			end
		endcase
	end
	else if(current_state == SUPPLY && next_state == OUTPUT)
	begin
		inf.window.milk.led <= (inf.window.milk.monitor == 0) ? red : green;
	end
	else if(current_state != SUPPLY && next_state == OUTPUT && can_make_the_coffee == 1)
	begin
		inf.window.milk.monitor <= volume_next_state[1][9:0];
		inf.window.milk.led <= led_next_state[1];
	end
	else if(current_state != SUPPLY && next_state == OUTPUT && can_make_the_coffee == 0)
	begin
		inf.window.milk.led <= led_next_state[1];
	end

	else
	begin
		inf.window.milk.led <= inf.window.milk.led ;
		inf.window.milk.monitor <= inf.window.milk.monitor;
	end
end

always_ff@(posedge clk or negedge inf.rst_n)
begin
	if(!inf.rst_n)
	begin
		inf.window.chocolate.led <= red;
		inf.window.chocolate.monitor <= 10'b0;
	end
	else if(next_state == SUPPLY)
	begin
		case(inf.select_i)
			chocolate:
			begin
				inf.window.chocolate.monitor <= inf.window.chocolate.monitor + inf.supply;
			end
			default:
			begin
				inf.window.chocolate.monitor <= inf.window.chocolate.monitor;
			end
		endcase
	end
	else if(current_state == SUPPLY && next_state == OUTPUT)
	begin
		inf.window.chocolate.led <= (inf.window.chocolate.monitor == 0) ? red : green;
	end
	else if(current_state != SUPPLY && next_state == OUTPUT && can_make_the_coffee == 1)
	begin
		inf.window.chocolate.monitor <= volume_next_state[2][9:0];
		inf.window.chocolate.led <= led_next_state[2];
	end
	else if(current_state != SUPPLY && next_state == OUTPUT && can_make_the_coffee == 0)
	begin
		inf.window.chocolate.led <= led_next_state[2];
	end

	else
	begin
		inf.window.chocolate.led <= inf.window.chocolate.led ;
		inf.window.chocolate.monitor <= inf.window.chocolate.monitor ;
	end
end

always_ff@(posedge clk or negedge inf.rst_n)
begin
	if(!inf.rst_n)
	begin
		inf.window.froth.led <= red;
		inf.window.froth.monitor <= 10'b0;
	end
	else if(next_state == SUPPLY)
	begin
		case(inf.select_i)
			froth:
			begin
				inf.window.froth.monitor <= inf.window.froth.monitor + inf.supply;
			end
			default:
			begin
				inf.window.froth.monitor <= inf.window.froth.monitor;
			end
		endcase
	end
	else if(current_state == SUPPLY && next_state == OUTPUT)
	begin
		inf.window.froth.led <= (inf.window.froth.monitor == 0) ? red : green;
	end
	else if(current_state != SUPPLY && next_state == OUTPUT && can_make_the_coffee == 1)
	begin
		inf.window.froth.monitor <= volume_next_state[3][9:0];
		inf.window.froth.led <= led_next_state[3];
	end
	else if(current_state != SUPPLY && next_state == OUTPUT && can_make_the_coffee == 0)
	begin
		inf.window.froth.led <= led_next_state[3];
	end

	else
	begin
		inf.window.froth.led <= inf.window.froth.led ;
		inf.window.froth.monitor <= inf.window.froth.monitor ;
	end
end


always_ff@(posedge clk or negedge inf.rst_n)       
begin
	if(!inf.rst_n)
	begin
		counter <= 0;
	end
	else if(current_state == MACHINE_READY || current_state != next_state)
	begin
		counter <= 0;
	end
	else
	begin
		counter <= counter + 1;
	end
end


always_ff@(posedge clk or negedge inf.rst_n) 
begin
	if(!inf.rst_n)
	begin
		coffee_size <= no_size_inf;
	end
	else if(current_state == MACHINE_READY && next_state != MACHINE_READY)
	begin
		coffee_size <= inf.required_size;
	end
end

always_comb 
begin
	case(coffee_size)
		s: volume = 10'd240;
		m: volume = 10'd360;
		l: volume = 10'd480;
		xl: volume = 10'd600;
		default: volume = 10'd0;
	endcase
end


always_ff@(posedge clk or negedge inf.rst_n) 
begin
	if(!inf.rst_n)
	begin
		coffee_flavor <= no_coffee;
	end
	else if(current_state == MACHINE_READY && next_state != MACHINE_READY)
	begin
		coffee_flavor <= inf.flavor_btn;
	end
end



always_ff@(posedge clk or negedge inf.rst_n) begin
	if(!inf.rst_n)
	begin
		for(i=0;i<4;i=i+1)
		begin
			coffee_ratio[i] <= 0;
		end
	end
	else if(next_state == USER_DEF) 
	begin
		coffee_ratio[3] <= inf.ratio;
		for(i=0;i<3;i=i+1)
		begin
			coffee_ratio[i] <= coffee_ratio[i+1];
		end
	end
	else if(current_state == REDUCE)
	begin
		case(min_ratio)
			3'b111, 3'b110, 3'b101:
			begin
				if(divideother == 1)
				begin
					for(i=0;i<4;i=i+1)
					begin
						if(coffee_ratio[i] != 0)
						begin
							coffee_ratio[i] <= 1;
						end
						/*else
						begin
							coffee_ratio[i] <= 0;
						end*/
					end
				end
			end
			3'b100:
			begin
				if(divideother == 1)
				begin
					for(i=0;i<4;i=i+1)
					begin
						coffee_ratio[i] <= coffee_ratio[i] >> 2;
					end
				end
				else if(divide2 == 1)
				begin
					for(i=0;i<4;i=i+1)
					begin
						coffee_ratio [i] <= coffee_ratio[i]>>1;
					end
				end
				/*else
				begin
					coffee_ratio[0] <= coffee_ratio[0];
					coffee_ratio[1] <= coffee_ratio[1];
					coffee_ratio[2] <= coffee_ratio[2];
					coffee_ratio[3] <= coffee_ratio[3];
				end*/		
			end
			3'b011:
			begin
				if(divide3 == 1)
				begin
					for(i=0;i<4;i=i+1)   
					begin
						if(coffee_ratio[i][0]==1)
						begin
							coffee_ratio[i] <= 3'b001;
						end
						else if(coffee_ratio[i][2]==1)
						begin
							coffee_ratio[i] <= 3'b010;
						end
					end
				end
				/*else
				begin
					coffee_ratio[0] <= coffee_ratio[0];
					coffee_ratio[1] <= coffee_ratio[1];
					coffee_ratio[2] <= coffee_ratio[2];
					coffee_ratio[3] <= coffee_ratio[3];
				end*/		
			end
			3'b010:
			begin
				if(divide2 == 1)
				begin
					for(i=0;i<4;i=i+1)
					begin
						coffee_ratio[i] <= coffee_ratio[i] >> 1;
					end
				end
				/*else
				begin
					coffee_ratio[0] <= coffee_ratio[0];
					coffee_ratio[1] <= coffee_ratio[1];
					coffee_ratio[2] <= coffee_ratio[2];
					coffee_ratio[3] <= coffee_ratio[3];
				end*/		
			end
			default:
			begin
				coffee_ratio[0] <= 0;
				coffee_ratio[1] <= 0;
				coffee_ratio[2] <= 0;
				coffee_ratio[3] <= 0;
			end
		endcase
	end
	else if(current_state == TYPE_DEF)
	begin
		case(coffee_flavor)
			latte: 
			begin
				coffee_ratio[0] <= 3'd2;
				coffee_ratio[1] <= 3'd1;
				coffee_ratio[2] <= 3'd0;
				coffee_ratio[3] <= 3'd2;
			end
			cappuccino: 
			begin
				coffee_ratio[0] <= 3'd2;
				coffee_ratio[1] <= 3'd1;
				coffee_ratio[2] <= 3'd0;
				coffee_ratio[3] <= 3'd1;
			end
			mocha: 
			begin  
				coffee_ratio[0] <= 3'd1;
				coffee_ratio[1] <= 3'd1;
				coffee_ratio[2] <= 3'd1;
				coffee_ratio[3] <= 3'd0;
			end
			default: 
			begin
				coffee_ratio[0] <= 3'd0;
				coffee_ratio[1] <= 3'd0;
				coffee_ratio[2] <= 3'd0;
				coffee_ratio[3] <= 3'd0;
			end
		endcase
	end
end



/*module MF(
	// Input signals
	clk,
	rst_n,
	invalid,
	image_in,
  // Output signals
	outvalid,
	image_out
);
input				clk,rst_n,invalid;
input [7:0]			image_in;
output	reg 		outvalid;
output	reg [7:0]	image_out;


			
reg [7:0] first_stage [8:0];
reg [7:0] second_stage [2:0];
reg [7:0] input_counter;

reg [7:0] image [11:0][11:0];

reg [7:0] mask [8:0];

wire [7:0]middle;




wire [7:0] group_1_max;
wire [7:0] group_2_max;
wire [7:0] group_3_max;
wire [7:0] group_1_mid;
wire [7:0] group_2_mid;
wire [7:0] group_3_mid;
wire [7:0] group_1_min;
wire [7:0] group_2_min;
wire [7:0] group_3_min;
wire [7:0] group_min;
wire [7:0] group_mid;
wire [7:0] group_max;






parameter IDLE = 1'b0,
	  EXE = 1'b1;


integer i;
integer j;


always@(posedge clk or negedge rst_n)
begin
	if(! rst_n)
	begin
		for ( i = 0 ; i < 12 ; i = i + 1)
		begin
			for(j = 0 ; j < 12 ; j = j + 1)
			begin
				image[i][j] <= 0;
			end
		end
	end
	else if(invalid == 1'b1)
	begin
		for ( i = 1 ; i < 11 ; i = i + 1)
		begin
				if(input_counter >= 0 && input_counter <= 9)
				begin
					if(i == input_counter + 1)
					begin
						image[1][i] <= image_in;
					end
				end
				else if(input_counter >= 10 && input_counter <= 19)
				begin
					if( i == input_counter - 9 )
					begin
						image[2][i] <= image_in;
					end
				end
				else if(input_counter >= 20 && input_counter <= 29)
				begin
					if( i == input_counter - 19 )
					begin
						image[3][i] <= image_in;
					end
				end
				else if(input_counter >= 30 && input_counter <= 39)
				begin
					if( i == input_counter - 29 )
					begin
						image[4][i] <= image_in;
					end
				end
				else if(input_counter >= 40 && input_counter <= 49)
				begin
					if( i == input_counter - 39 )
					begin
						image[5][i] <= image_in;
					end
				end
				else if(input_counter >= 50 && input_counter <= 59)
				begin
					if( i == input_counter - 49 )
					begin
						image[6][i] <= image_in;
					end
				end
				else if(input_counter >= 60 && input_counter <= 69)
				begin
					if( i == input_counter - 59 )
					begin
						image[7][i] <= image_in;
					end
				end
				else if(input_counter >= 70 && input_counter <= 79)
				begin
					if( i == input_counter - 69 )
					begin
						image[8][i] <= image_in;
					end
				end
				else if(input_counter >= 80 && input_counter <= 89)
				begin
					if( i == input_counter - 79 )
					begin
						image[9][i] <= image_in;
					end
				end
				else if(input_counter >= 90 && input_counter <= 99)
				begin
					if( i == input_counter - 89 )
					begin
						image[10][i] <= image_in;
					end
				end
		end


	end
	else
	begin
		for ( i = 0 ; i < 12 ; i = i + 1)
		begin
			for(j = 0 ; j < 12 ; j = j + 1)
			begin
					image[i][j] <= image[i][j];
			end
		end
	end

end







 







always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
	begin
		for(i=0;i<9;i=i+1)
		begin
			mask[i] <= 8'b0;
		end
	end
	else if(input_counter > 8'd96 && input_counter < 8'd197 )
	begin
		for( i = 1 ; i < 11 ; i = i + 1)
		begin
			for(j = 1 ; j < 11 ; j = j + 1)
			begin
				if(input_counter >= 97 && input_counter <= 106 )
				begin
					if(i == input_counter - 96 )
					begin
						mask[0] <= image[0][i-1];
						mask[1] <= image[1][i-1];
						mask[2] <= image[2][i-1];
						mask[3] <= image[0][i];
						mask[4] <= image[1][i];
						mask[5] <= image[2][i];
						mask[6] <= image[0][i+1];
						mask[7] <= image[1][i+1];
						mask[8] <= image[2][i+1];
					end
				end
				else if(input_counter >= 107 && input_counter <= 116 )
				begin
					if(i == input_counter - 106 )
					begin
						mask[0] <= image[1][i-1];
						mask[1] <= image[2][i-1];
						mask[2] <= image[3][i-1];
						mask[3] <= image[1][i];
						mask[4] <= image[2][i];
						mask[5] <= image[3][i];
						mask[6] <= image[1][i+1];
						mask[7] <= image[2][i+1];
						mask[8] <= image[3][i+1];
					end
				end
				else if(input_counter >= 117 && input_counter <= 126 )
				begin
					if(i == input_counter - 116 )
					begin
						mask[0] <= image[2][i-1];
						mask[1] <= image[3][i-1];
						mask[2] <= image[4][i-1];
						mask[3] <= image[2][i];
						mask[4] <= image[3][i];
						mask[5] <= image[4][i];
						mask[6] <= image[2][i+1];
						mask[7] <= image[3][i+1];
						mask[8] <= image[4][i+1];
					end
				end				
				else if(input_counter >= 127 && input_counter <= 136 )
				begin
					if(i == input_counter - 126 )
					begin
						mask[0] <= image[3][i-1];
						mask[1] <= image[4][i-1];
						mask[2] <= image[5][i-1];
						mask[3] <= image[3][i];
						mask[4] <= image[4][i];
						mask[5] <= image[5][i];
						mask[6] <= image[3][i+1];
						mask[7] <= image[4][i+1];
						mask[8] <= image[5][i+1];
					end
				end
				else if(input_counter >= 137 && input_counter <= 146 )
				begin
					if(i == input_counter - 136 )
					begin
						mask[0] <= image[4][i-1];
						mask[1] <= image[5][i-1];
						mask[2] <= image[6][i-1];
						mask[3] <= image[4][i];
						mask[4] <= image[5][i];
						mask[5] <= image[6][i];
						mask[6] <= image[4][i+1];
						mask[7] <= image[5][i+1];
						mask[8] <= image[6][i+1];
					end
				end				
				else if(input_counter >= 147 && input_counter <= 156 )
				begin
					if(i == input_counter - 146 )
					begin
						mask[0] <= image[5][i-1];
						mask[1] <= image[6][i-1];
						mask[2] <= image[7][i-1];
						mask[3] <= image[5][i];
						mask[4] <= image[6][i];
						mask[5] <= image[7][i];
						mask[6] <= image[5][i+1];
						mask[7] <= image[6][i+1];
						mask[8] <= image[7][i+1];
					end
				end
				else if(input_counter >= 157 && input_counter <= 166 )
				begin
					if(i == input_counter - 156 )
					begin
						mask[0] <= image[6][i-1];
						mask[1] <= image[7][i-1];
						mask[2] <= image[8][i-1];
						mask[3] <= image[6][i];
						mask[4] <= image[7][i];
						mask[5] <= image[8][i];
						mask[6] <= image[6][i+1];
						mask[7] <= image[7][i+1];
						mask[8] <= image[8][i+1];
					end
				end
				else if(input_counter >= 167 && input_counter <= 176 )
				begin
					if(i == input_counter - 166 )
					begin
						mask[0] <= image[7][i-1];
						mask[1] <= image[8][i-1];
						mask[2] <= image[9][i-1];
						mask[3] <= image[7][i];
						mask[4] <= image[8][i];
						mask[5] <= image[9][i];
						mask[6] <= image[7][i+1];
						mask[7] <= image[8][i+1];
						mask[8] <= image[9][i+1];
					end
				end
				else if(input_counter >= 177 && input_counter <= 186 )
				begin
					if(i == input_counter - 176 )
					begin
						mask[0] <= image[8][i-1];
						mask[1] <= image[9][i-1];
						mask[2] <= image[10][i-1];
						mask[3] <= image[8][i];
						mask[4] <= image[9][i];
						mask[5] <= image[10][i];
						mask[6] <= image[8][i+1];
						mask[7] <= image[9][i+1];
						mask[8] <= image[10][i+1];
					end
				end				
				else if(input_counter >= 187 && input_counter <= 196 )
				begin
					if(i == input_counter - 186 )
					begin
						mask[0] <= image[9][i-1];
						mask[1] <= image[10][i-1];
						mask[2] <= image[11][i-1];
						mask[3] <= image[9][i];
						mask[4] <= image[10][i];
						mask[5] <= image[11][i];
						mask[6] <= image[9][i+1];
						mask[7] <= image[10][i+1];
						mask[8] <= image[11][i+1];
					end
				end				
			end
		end
	end
	else 
	begin
		for(i=0;i<9;i=i+1)
		begin
			mask[i] <= mask[i];
		end
	end
end








always@(posedge clk or negedge rst_n)begin
	if(!rst_n)
	begin
		input_counter <= 8'b0;
	end
	else if(invalid==1'b1 || input_counter <= 8'd200 && input_counter >= 8'd100)
	begin
		input_counter <= input_counter + 1'b1;
	end 
	else
	begin 
		input_counter <= 8'b0;
	end
end










always@(posedge clk or negedge rst_n)begin
	if(!rst_n)
	begin
		for(i=0;i<9;i=i+1)
		begin
			first_stage[i] <= 8'b0;
		end
	end
	else if((input_counter > 8'd96)&&(input_counter < 8'd198))
	begin
		first_stage[0] <= group_1_max;
		first_stage[1] <= group_2_max;
		first_stage[2] <= group_3_max;
		first_stage[3] <= group_1_mid;
		first_stage[4] <= group_2_mid;
		first_stage[5] <= group_3_mid;
		first_stage[6] <= group_1_min;
		first_stage[7] <= group_2_min;
		first_stage[8] <= group_3_min;
	end
	else 
	begin
		for(i=0;i<9;i=i+1)
		begin
			first_stage[i] <= 8'b0;
		end
	end	
end

always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
	begin
		for(i=0;i<3;i=i+1)
		begin
			second_stage[i] <= 8'b0;
		end
	end
	else if((input_counter > 8'd96)&&(input_counter < 8'd198))
	begin
		second_stage[0] <= group_min;
		second_stage[1] <= group_mid;
		second_stage[2] <= group_max;
	end
	else 
	begin
		for(i=0;i<3;i=i+1)
		begin
			second_stage[i] <= 8'b0;
		end
	end	
end

always@(posedge clk or negedge rst_n)begin
	if(!rst_n)
	begin
		outvalid <= 1'b0;
	end
	else if(input_counter == 8'd100)
	begin
		outvalid <= 1'b1;
	end
	else if(input_counter == 8'd200)
	begin
		outvalid <= 1'b0;
	end
	else
	begin
		outvalid <= outvalid;
	end
end

always@(posedge clk or negedge rst_n)begin
	if(!rst_n)
	begin
		image_out <= 8'b0;
	end
	else if((input_counter >= 8'd100)&&(input_counter < 8'd200))
	begin
		image_out <= middle;
	end
	else 
	begin
		image_out <= 8'b0;
	end
end






sort m1(.a(mask[0]),.b(mask[1]),.c(mask[2]),.first(group_1_max),.second(group_1_mid),.third(group_1_min));
sort m2(.a(mask[3]),.b(mask[4]),.c(mask[5]),.first(group_2_max),.second(group_2_mid),.third(group_2_min));
sort m3(.a(mask[6]),.b(mask[7]),.c(mask[8]),.first(group_3_max),.second(group_3_mid),.third(group_3_min));
find_third m4(.a(first_stage[0]),.b(first_stage[1]),.c(first_stage[2]), .third(group_min));

find_second m5(.a(first_stage[3]),.b(first_stage[4]),.c(first_stage[5]),.second(group_mid));

find_first m6(.a(first_stage[6]),.b(first_stage[7]),.c(first_stage[8]),.first(group_max));

sort m7(.a(second_stage[0]),.b(second_stage[1]),.c(second_stage[2]),.first(),.second(middle),.third());



	

				 
endmodule*/
































always_ff@(posedge clk or negedge inf.rst_n) 
begin
	if(!inf.rst_n)
	begin
		min_ratio <= 0;
	end
	else if(next_state == USER_DEF && min_ratio == 0)
	begin
		min_ratio <= inf.ratio;
	end
	else if(next_state == USER_DEF &&  inf.ratio < min_ratio && inf.ratio != 0)
	begin
		min_ratio <= inf.ratio;
	end
	else if(next_state==MACHINE_READY)
	begin
		min_ratio <= 0;
	end
end


 

assign	divideother = (coffee_ratio[0]==0 || coffee_ratio[0] == min_ratio) && 																						           (coffee_ratio[1]==0 || coffee_ratio[1] == min_ratio) && 																						        (coffee_ratio[2] == 0 || coffee_ratio[2] == min_ratio) && 																					             (coffee_ratio[3] == 0 || coffee_ratio[3]== min_ratio);



assign	divide3 = (coffee_ratio[0]==3'd0||coffee_ratio[0]==3'd3||coffee_ratio[0]==3'd6)&&                                                           													       (coffee_ratio[1]==3'd0||coffee_ratio[1]==3'd3||coffee_ratio[1]==3'd6)&&																				            (coffee_ratio[2]==3'd0||coffee_ratio[2]==3'd3||coffee_ratio[2]==3'd6)&&																				         (coffee_ratio[3]==3'd0||coffee_ratio[3]==3'd3||coffee_ratio[3]==3'd6);



assign	divide2 = coffee_ratio[0][0] == 0 && coffee_ratio [1][0] == 0 && coffee_ratio [2][0] == 0 && coffee_ratio [3][0] == 0;





assign	dividemother = coffee_ratio[0] + coffee_ratio[1] + coffee_ratio[2] + coffee_ratio[3];





DW_div_pipe #(10,5,0,1,4,0,1) div1(.clk(clk), .rst_n(inf.rst_n), .en(1'b1), .a(volume), .b(dividemother),.quotient(quotient),.remainder(), .divide_by_0() );

assign minus_ing_volume[0] = quotient * coffee_ratio[0];
assign minus_ing_volume[1] = quotient * coffee_ratio[1];
assign minus_ing_volume[2] = quotient * coffee_ratio[2];
assign minus_ing_volume[3] = quotient * coffee_ratio[3];



assign volume_next_state[0] = inf.window.espresso.monitor - minus_ing_volume[0];




assign volume_next_state[1] = inf.window.milk.monitor - minus_ing_volume[1];




assign volume_next_state[2] = inf.window.chocolate.monitor - minus_ing_volume[2];

	
assign volume_next_state[3] = inf.window.froth.monitor - minus_ing_volume[3];



always_comb
begin
	if(!can_make_the_coffee)
	begin
		if((volume_next_state[0][10] == 1 || inf.window.espresso.monitor == 0))
		begin
			led_next_state[0] <= red;
		end
		else
		begin
			led_next_state[0] <= green;
		end	
	end
	else
	begin
		if((volume_next_state[0] == 0 ))
		begin
			led_next_state[0] <= red;
		end
		else
		begin
			led_next_state[0] <= green;
		end	
	end
end


always_comb
begin
	if(!can_make_the_coffee)
	begin
		if((volume_next_state[1][10] == 1 || inf.window.milk.monitor == 0))
		begin
			led_next_state[1] <= red;
		end
		else
		begin
			led_next_state[1] <= green;
		end	
	end
	else
	begin
		if((volume_next_state[1] == 0 ))
		begin
			led_next_state[1] <= red;
		end
		else
		begin
			led_next_state[1] <= green;
		end	
	end
end

always_comb
begin
	if(!can_make_the_coffee)
	begin
		if((volume_next_state[2][10] == 1 || inf.window.chocolate.monitor == 0))
		begin
			led_next_state[2] <= red;
		end
		else
		begin
			led_next_state[2] <= green;
		end	
	end
	else
	begin
		if((volume_next_state[2] == 0 ))
		begin
			led_next_state[2] <= red;
		end
		else
		begin
			led_next_state[2] <= green;
		end	
	end
end


always_comb
begin
	if(!can_make_the_coffee)
	begin
		if((volume_next_state[3][10] == 1 || inf.window.froth.monitor == 0))
		begin
			led_next_state[3] <= red;
		end
		else
		begin
			led_next_state[3] <= green;
		end	
	end
	else
	begin
		if((volume_next_state[3] == 0 ))
		begin
			led_next_state[3] <= red;
		end
		else
		begin
			led_next_state[3] <= green;
		end	
	end
end





assign can_make_the_coffee = (volume_next_state[0][10] != 1) && (volume_next_state[1][10] != 1) && (volume_next_state[2][10] != 1) && (volume_next_state[3][10] != 1);









endmodule
