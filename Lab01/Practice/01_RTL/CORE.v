module CORE (
    in_n0,
    in_n1,
    opt,
    out_n
);
//--------------------------------------------------------------
//Input, Output Declaration
//--------------------------------------------------------------
input [2:0] in_n0, in_n1;
input opt;
output [3:0] out_n;

//-----write your code here-----

wire [2:0] carry;

FA full_adder0(
    .a(in_n0[0]),
    .b(opt^in_n1[0]),
    .c_in(opt),
    .sum(out_n[0]),
    .c_out(carry[0])
);

FA full_adder1(
    .a(in_n0[1]),
    .b(opt^in_n1[1]),
    .c_in(carry[0]),
    .sum(out_n[1]),
    .c_out(carry[1])
);

FA full_adder2(
    .a(in_n0[2]),
    .b(opt^in_n1[2]),
    .c_in(carry[1]),
    .sum(out_n[2]),
    .c_out(carry[2])
);
xor (out_n[3],opt,carry[2]);

// HA full_adder3(
//     .a(opt),
//     .b(carry[2]),
//     .sum(out_n[3]),
//     .c_out()
// );


//-----write your code here-----


endmodule 
//--------------------------------------------------------------
//Module Half Adder & Full Adder provided by TA
//--------------------------------------------------------------
module HA(
		a, 
		b, 
		sum, 
		c_out
);
  input wire a, b;
  output wire sum, c_out;
  xor (sum, a, b);
  and (c_out, a, b);
endmodule


module FA(
		a, 
		b, 
		c_in, 
		sum, 
		c_out
);
  input   a, b, c_in;
  output  sum, c_out;
  wire   w1, w2, w3;
  HA M1(.a(a), .b(b), .sum(w1), .c_out(w2));
  HA M2(.a(w1), .b(c_in), .sum(sum), .c_out(w3));
  or (c_out, w2, w3);
endmodule