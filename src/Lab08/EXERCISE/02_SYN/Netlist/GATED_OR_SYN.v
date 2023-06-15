/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03
// Date      : Sun Apr 23 20:49:47 2023
/////////////////////////////////////////////////////////////


module GATED_OR ( CLOCK, SLEEP_CTRL, RST_N, CLOCK_GATED );
  input CLOCK, SLEEP_CTRL, RST_N;
  output CLOCK_GATED;
  wire   latch_or_sleep;

  TLATRX1 latch_or_sleep_reg ( .G(CLOCK), .D(SLEEP_CTRL), .RN(RST_N), .Q(
        latch_or_sleep) );
  OR2X1 U4 ( .A(CLOCK), .B(latch_or_sleep), .Y(CLOCK_GATED) );
endmodule

