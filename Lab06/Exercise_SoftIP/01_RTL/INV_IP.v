//############################################################################
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//    (C) Copyright Optimum Application-Specific Integrated System Laboratory
//    All Right Reserved
//		Date		: 2023/03
//		Version		: v1.0
//   	File Name   : INV_IP.v
//   	Module Name : INV_IP
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//############################################################################

module INV_IP #(parameter IP_WIDTH = 6) (
    // Input signals
    IN_1, IN_2,
    // Output signals
    OUT_INV
);

// ===============================================================
// Declaration
// ===============================================================
	input  [IP_WIDTH-1:0] IN_1, IN_2;
	output reg [IP_WIDTH-1:0] OUT_INV;
// ===============================================================
// IN_WIDTH dependent parameters
// ===============================================================
		parameter LAYERS = (IP_WIDTH==7)? 9 : IP_WIDTH+1;
		parameter Q_LEN = IP_WIDTH-1;
		parameter T_LEN = IP_WIDTH;
		parameter NT_LEN = IP_WIDTH;
		parameter R_LEN = IP_WIDTH;
		parameter NR_LEN = IP_WIDTH-1;


	// if(IP_WIDTH == 5)begin
	// 	LAYERS	= 'd6;
	// 	Q_LEN		= 'd4; // unsigned,	+ 1 ~ +15
	// 	T_LEN		= 'd5; // signed,		- 9 ~ + 9
	// 	NT_LEN	= 'd5; // signed,		-15 ~ +15
	// 	R_LEN		= 'd5; // unsigned,	+ 2 ~ +30
	// 	NR_LEN	= 'd4; // unsigned,	+ 1 ~ +15 
	// end else if(IP_WIDTH == 6)begin
	// 	LAYERS	= 'd7;
	// 	Q_LEN		= 'd5; // unsigned,	+ 1 ~ +30
	// 	T_LEN		= 'd6; // signed,		- 19 ~ + 19
	// 	NT_LEN	= 'd6; // signed,		-30 ~ +30
	// 	R_LEN		= 'd6; // unsigned,	+ 2 ~ +60
	// 	NR_LEN	= 'd5; // unsigned,	+ 1 ~ +30
	
	// end else begin// IP_WIDTH == 7
	// 	LAYERS	= 'd9;
	// 	Q_LEN		= 'd6; // unsigned,	+ 1 ~ +63
	// 	T_LEN		= 'd7; // signed,		- 41 ~ +41
	// 	NT_LEN	= 'd7; // signed,		-63 ~ +63
	// 	R_LEN		= 'd7; // unsigned,	+ 2 ~ +126
	// 	NR_LEN	= 'd6; // unsigned,	+ 1 ~ +63

	// end
	
// ===============================================================
// Register, Integers and Parameters Declaration
// ===============================================================
	
	//in_a should be the smaller of IN_1 & IN_1, it could be a prime
	//number, in_n is the larger, definitely a prime.
	reg [IP_WIDTH-1 : 0] in_a, in_n;


	always@(*)begin
		if(IN_2 > IN_1)begin
			in_a = IN_1;
			in_n = IN_2;
		end else begin
			in_a = IN_2;
			in_n = IN_1;
		end
	end


	genvar layer_idx;
	genvar layer_idx2;
	generate
	if(IP_WIDTH == 6)begin:ii
		// generate
			for(layer_idx = 1; layer_idx <= LAYERS-1; layer_idx = layer_idx+1)begin:gen_layer
				if(layer_idx == 1)begin:if_1
					wire [5-1 : 0] 			quotient; //1-30
					wire 					t;
					wire signed [6-1 : 0] 	new_t; //-30 ~ -1
					wire [6-1 : 0] 			r; // 2 - 60
					wire [5-1 : 0]			new_r; // 1 - 30

					assign quotient = in_n / in_a;
					assign new_t = $signed({1'b0,quotient}) * -1;
					assign t = 1;
					// assign new_r = $signed({1'b0, in_n}) - $signed({1'b0, quotient}) * $signed({1'b0, in_a});
					assign new_r = in_n - quotient*in_a;
					assign r = in_a;
				end
				if(layer_idx == 2)begin:if_2
					wire 					l_t = ii.gen_layer[layer_idx-1].if_1.t;
					wire signed [6-1 : 0] 	l_new_t = ii.gen_layer[layer_idx-1].if_1.new_t;
					wire [6-1 : 0] 			l_r = ii.gen_layer[layer_idx-1].if_1.r;
					wire [5-1 : 0]			l_new_r = ii.gen_layer[layer_idx-1].if_1.new_r;

					wire [5-1 : 0] 			quotient; //1-29
					wire signed [6-1 : 0] 	t; //-19 - -1
					wire [5-1 : 0] 			new_t; //2-30
					wire [5-1 : 0] 			r; // 2-30
					wire [5-1 : 0] 			new_r; //1-19

					assign quotient = l_r/l_new_r;
					assign new_t = $signed({1'd0, l_t}) -  $signed({1'b0, quotient}) * l_new_t;
					assign t = (l_new_r == 0)? {5'b0, l_t} : l_new_t;
					assign new_r = (l_new_r == 0)? l_new_r : ($signed({1'b0, l_r}) - $signed({1'b0, quotient}) * $signed({1'b0, l_new_r}));
					assign r = l_new_r;
				end
				if(layer_idx == 3)begin:if_3
					wire signed [6-1 : 0]	l_t = ii.gen_layer[layer_idx-1].if_2.t;
					wire [5-1 : 0] 			l_new_t = ii.gen_layer[layer_idx-1].if_2.new_t;
					wire [5-1 : 0] 			l_r = ii.gen_layer[layer_idx-1].if_2.r;
					wire [5-1 : 0]			l_new_r = ii.gen_layer[layer_idx-1].if_2.new_r;

					wire [4-1 : 0] 			quotient; //1-9
					wire signed [6-1 : 0] 	t; // 2 - 19
					wire signed [6-1 : 0] 	new_t; //-29 - 3
					wire [5-1 : 0] 			r; //2-19
					wire [4-1 : 0] 			new_r; // 1 - 11

					assign quotient = l_r/l_new_r;
					assign new_t = l_t - $signed({1'b0, quotient}) * $signed({1'b0,l_new_t});
					assign t = (l_new_r == 0)? l_t : {1'b0, l_new_t};
					assign new_r = (l_new_r == 0)? l_new_r : ($signed({1'b0, l_r}) - $signed({1'b0, quotient}) * $signed({1'b0, l_new_r}));
					assign r = l_new_r;
				end
				if(layer_idx == 4)begin:if_4

					wire signed [6-1 : 0]	l_t = ii.gen_layer[layer_idx-1].if_3.t;
					wire signed [6-1 : 0] 	l_new_t = ii.gen_layer[layer_idx-1].if_3.new_t;
					wire [5-1 : 0] 			l_r = ii.gen_layer[layer_idx-1].if_3.r;
					wire [5-1 : 0]			l_new_r = ii.gen_layer[layer_idx-1].if_3.new_r;

					wire [4-1 : 0] quotient; //1-9
					wire signed [6-1 : 0] t; //-19 - -3
					wire [5-1 : 0] new_t; //5 - 29
					wire [4-1 : 0] r; //2 - 11
					wire [3-1 : 0] new_r; //1-7

					assign quotient = l_r/l_new_r;
					assign new_t = l_t - $signed({1'b0, quotient}) * l_new_t;
					assign t = (l_new_r == 0)? l_t : l_new_t;
					assign new_r = (l_new_r == 0)? l_new_r : ($signed({1'b0, l_r}) - $signed({1'b0, quotient}) * $signed({1'b0, l_new_r}));
					assign r = l_new_r;

				end
				if(layer_idx == 5)begin:if_5

					wire signed [6-1 : 0]	l_t = ii.gen_layer[layer_idx-1].if_4.t;
					wire [5-1 : 0] 			l_new_t = ii.gen_layer[layer_idx-1].if_4.new_t;
					wire [4-1 : 0] 			l_r = ii.gen_layer[layer_idx-1].if_4.r;
					wire [3-1 : 0]			l_new_r = ii.gen_layer[layer_idx-1].if_4.new_r;
				
					wire [3-1 : 0] quotient; //1-5
					wire signed [6-1 : 0] t; // 5 - 17
					wire signed [6-1 : 0] new_t; //-28 ~ -8
					wire [3-1 : 0] r; //2 - 7
					wire [2-1 : 0] new_r; // 1-3
					
					assign quotient = l_r/l_new_r;
					assign new_t = l_t - $signed({1'b0, quotient}) * $signed({1'b0, l_new_t});
					assign t = (l_new_r == 0)? l_t : {1'b0,l_new_t};
					assign new_r = (l_new_r == 0)? l_new_r : ($signed({1'b0, l_r}) - $signed({1'b0, quotient}) * $signed({1'b0, l_new_r}));
					assign r = l_new_r;


				end
				if(layer_idx == 6)begin:if_6

					wire signed [6-1 : 0]	l_t = ii.gen_layer[layer_idx-1].if_5.t;
					wire signed [6-1 : 0] 	l_new_t = ii.gen_layer[layer_idx-1].if_5.new_t;
					wire [3-1 : 0] 			l_r = ii.gen_layer[layer_idx-1].if_5.r;
					wire [2-1 : 0]			l_new_r = ii.gen_layer[layer_idx-1].if_5.new_r;

					wire [2-1 : 0]quotient; //==1
					wire signed [6-1 : 0] t; //-11 - -8
					wire [5-1 : 0] new_t; //13 - 18
					wire [2-1 : 0] r; //2-3
					wire new_r;

					assign quotient = l_r/l_new_r;
					assign new_t = l_t - $signed({1'b0, quotient}) * $signed({1'b0, l_new_t});
					assign t = (l_new_r == 0)? l_t : l_new_t;
					assign new_r = (l_new_r == 0)? l_new_r : ($signed({1'b0, l_r}) - $signed({1'b0, quotient}) * $signed({1'b0, l_new_r}));
				end
			
			end

			wire signed [6-1 : 0] last_t = (ii.gen_layer[LAYERS-1].if_6.new_r == 0)? ii.gen_layer[LAYERS-1].if_6.t : {1'b0, ii.gen_layer[LAYERS-1].if_6.new_t}; 
			always @(*)begin
				if(in_a == 1)begin
					OUT_INV = 1;
				end
				else if(last_t < 0)begin
					OUT_INV = last_t + $signed({1'b0,in_n});
				end else begin
					OUT_INV = last_t;
				end

			end

		// endgenerate
	end 
	if (IP_WIDTH == 5 || IP_WIDTH == 7)begin:im
			for(layer_idx = 1; layer_idx <= LAYERS-1; layer_idx = layer_idx+1)begin:gen_layer
				//Layers from 1 ~ Layers-1 are identical. 
				// wire [Q_LEN-1 : 0] quotient;
				wire [Q_LEN-1 : 0] quotient;
				wire signed [T_LEN-1 : 0] t;
				wire signed [NT_LEN-1 :0] new_t;
				wire [R_LEN-1 : 0] r;
				wire [NR_LEN-1 :0] new_r; 
				
				if(layer_idx == 1)begin
					// the first layer, special
					assign quotient = in_n / in_a;
					
					assign new_t = $signed({1'b0, quotient})* -1;
					assign t = 1;

					assign new_r = $signed({1'b0, in_n}) - $signed({1'b0, quotient}) * $signed({1'b0, in_a});	
					assign r = in_a; 
					
				end else begin
					// other layers
					// wire [Q_LEN-1 : 0] l_quotient = gen_layer[layer_idx-1].quotient;
					wire signed [T_LEN-1 : 0] l_t = im.gen_layer[layer_idx-1].t;
					wire signed [NT_LEN-1 :0] l_new_t = im.gen_layer[layer_idx-1].new_t;
					wire [R_LEN-1 : 0] l_r = im.gen_layer[layer_idx-1].r;
					wire [NR_LEN-1 :0] l_new_r = im.gen_layer[layer_idx-1].new_r; 

					assign quotient = l_r / l_new_r;				
					
					assign new_t = l_t - $signed({1'b0, quotient}) * l_new_t;
					assign t = (l_new_r == 0)? l_t : l_new_t;

					assign new_r = (l_new_r == 0)? l_new_r : $signed({1'b0, l_r}) - $signed({1'b0, quotient}) * $signed({1'b0, l_new_r});
					assign r = l_new_r;

				end 

		end
		// the last layer(output layer) is presented here:
		
		wire signed [T_LEN-1 : 0] last_t = (im.gen_layer[LAYERS-1].new_r == 0)? im.gen_layer[LAYERS-1].t : im.gen_layer[LAYERS-1].new_t; 
		always @(*)begin
			if(in_a == 1)begin
				OUT_INV = 1;
			end
			else if(last_t < 0)begin
				OUT_INV = last_t + $signed({1'b0,in_n});
			end else begin
				OUT_INV = last_t;
			end

		end

	end
	endgenerate
		

endmodule
