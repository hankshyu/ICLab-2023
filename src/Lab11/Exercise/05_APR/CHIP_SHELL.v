module CHIP(
  // input signals

  clk,
  rst_n,
  in_valid,
  in_valid2,
  matrix,
  matrix_size,
  i_mat_idx,
  w_mat_idx,

  // output signals

  out_valid,
  out_value 
);

input clk, rst_n;
input in_valid, in_valid2;
input matrix;
input [1:0] matrix_size;
input i_mat_idx, w_mat_idx;

output out_valid;
output out_value;

//input wires
wire C_clk, BUF_CLK;
wire C_rst_n;
wire C_in_valid, C_in_valid2;
wire C_matrix;
wire [1:0] C_matrix_size;
wire C_i_mat_idx;
wire C_w_mat_idx;
//output wires
wire C_out_valid;
wire C_out_value;


MMSA CORE(                                                                                                                                                                    
  .clk        (BUF_CLK),
  .rst_n      (C_rst_n),
  .in_valid   (C_in_valid),
  .in_valid2  (C_in_valid2),
  .matrix     (C_matrix),
  .matrix_size(C_matrix_size),
  .i_mat_idx  (C_i_mat_idx),
  .w_mat_idx  (C_w_mat_idx),

  .out_valid  (C_out_valid),
  .out_value  (C_out_value)
);

CLKBUFX20 buf0(.A(C_clk),.Y(BUF_CLK));
P8C I_CLK             ( .Y(C_clk),            .P(clk),            .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b0), .CSEN(1'b1) );
P8C I_RESET           ( .Y(C_rst_n),          .P(rst_n),          .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );

P4C I_IN_VALID        ( .Y(C_in_valid),       .P(in_valid),       .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_IN_VALID2       ( .Y(C_in_valid2),      .P(in_valid2),      .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_MATRIX          ( .Y(C_matrix),         .P(matrix),         .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_MATRIX_SIZE_0   ( .Y(C_matrix_size[0]), .P(matrix_size[0]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_MATRIX_SIZE_1   ( .Y(C_matrix_size[1]), .P(matrix_size[1]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_I_MAT_IDX       ( .Y(C_i_mat_idx),      .P(i_mat_idx),      .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_W_MAT_IDX       ( .Y(C_w_mat_idx),      .P(w_mat_idx),      .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );


P8C O_OUT_VALID       ( .A(C_out_valid), 	.P(out_valid), 	 .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0));
P8C O_OUT_VALUE       ( .A(C_out_value), 	.P(out_value), 	 .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0));

//I/O power 3.3V pads x8 (DVDD + DGND)
PVDDR VDDP0 ();
PVSSR GNDP0 ();
PVDDR VDDP1 ();
PVSSR GNDP1 ();
PVDDR VDDP2 ();
PVSSR GNDP2 ();
PVDDR VDDP3 ();
PVSSR GNDP3 ();
PVDDR VDDP4 ();
PVSSR GNDP4 ();
PVDDR VDDP5 ();
PVSSR GNDP5 ();
PVDDR VDDP6 ();
PVSSR GNDP6 ();
PVDDR VDDP7 ();
PVSSR GNDP7 ();

//Core poweri 1.8V pads x? (VDD + GND)
PVDDC VDDC0 ();
PVSSC GNDC0 ();
PVDDC VDDC1 ();
PVSSC GNDC1 ();
PVDDC VDDC2 ();
PVSSC GNDC2 ();
PVDDC VDDC3 ();
PVSSC GNDC3 ();
PVDDC VDDC4 ();
PVSSC GNDC4 ();
PVDDC VDDC5 ();
PVSSC GNDC5 ();
PVDDC VDDC6 ();
PVSSC GNDC6 ();
PVDDC VDDC7 ();
PVSSC GNDC7 ();

endmodule

