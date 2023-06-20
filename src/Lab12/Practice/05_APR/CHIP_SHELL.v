module CHIP(
            clk,
            rst_n,
            IN_VALID,
            MODE,
            FFT2D_IN_R,
            FFT2D_IN_I,
            OUT_VALID,
            FFT2D_OUT_R,
            FFT2D_OUT_I
);
input         clk, rst_n, IN_VALID, MODE;
input  [18:0] FFT2D_IN_R, FFT2D_IN_I;

output        OUT_VALID;
output [18:0] FFT2D_OUT_R, FFT2D_OUT_I;


wire        C_clk, C_rst_n, C_IN_VALID, C_MODE;
wire [18:0] C_FFT2D_IN_R, C_FFT2D_IN_I;

wire        C_OUT_VALID;
wire [18:0] C_FFT2D_OUT_R, C_FFT2D_OUT_I;

wire BUF_clk;
CLKBUFX20 buf0(.A(C_clk),.Y(BUF_clk));

FFT2D u_FFT2D(
    .clk(BUF_clk),
    .rst_n(C_rst_n),
    .IN_VALID(C_IN_VALID),
    .MODE(C_MODE),
    .FFT2D_IN_R(C_FFT2D_IN_R),
    .FFT2D_IN_I(C_FFT2D_IN_I),
    .OUT_VALID(C_OUT_VALID),
    .FFT2D_OUT_R(C_FFT2D_OUT_R),
    .FFT2D_OUT_I(C_FFT2D_OUT_I)
    );

// Input Pads
P8C I_CLK      ( .Y(C_clk),        .P(clk),        .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b0), .CSEN(1'b1) );
P8C I_RESET    ( .Y(C_rst_n),      .P(rst_n),      .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_VALID    ( .Y(C_IN_VALID),   .P(IN_VALID),   .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );

P4C I_MODE     ( .Y(C_MODE), .P(MODE), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );

P4C I_FFT2D_IN_R_0     ( .Y(C_FFT2D_IN_R[0]), .P(FFT2D_IN_R[0]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_FFT2D_IN_R_1     ( .Y(C_FFT2D_IN_R[1]), .P(FFT2D_IN_R[1]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_FFT2D_IN_R_2     ( .Y(C_FFT2D_IN_R[2]), .P(FFT2D_IN_R[2]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_FFT2D_IN_R_3     ( .Y(C_FFT2D_IN_R[3]), .P(FFT2D_IN_R[3]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_FFT2D_IN_R_4     ( .Y(C_FFT2D_IN_R[4]), .P(FFT2D_IN_R[4]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_FFT2D_IN_R_5     ( .Y(C_FFT2D_IN_R[5]), .P(FFT2D_IN_R[5]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_FFT2D_IN_R_6     ( .Y(C_FFT2D_IN_R[6]), .P(FFT2D_IN_R[6]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_FFT2D_IN_R_7     ( .Y(C_FFT2D_IN_R[7]), .P(FFT2D_IN_R[7]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_FFT2D_IN_R_8     ( .Y(C_FFT2D_IN_R[8]), .P(FFT2D_IN_R[8]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_FFT2D_IN_R_9     ( .Y(C_FFT2D_IN_R[9]), .P(FFT2D_IN_R[9]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_FFT2D_IN_R_10     ( .Y(C_FFT2D_IN_R[10]), .P(FFT2D_IN_R[10]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_FFT2D_IN_R_11     ( .Y(C_FFT2D_IN_R[11]), .P(FFT2D_IN_R[11]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_FFT2D_IN_R_12     ( .Y(C_FFT2D_IN_R[12]), .P(FFT2D_IN_R[12]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_FFT2D_IN_R_13     ( .Y(C_FFT2D_IN_R[13]), .P(FFT2D_IN_R[13]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_FFT2D_IN_R_14     ( .Y(C_FFT2D_IN_R[14]), .P(FFT2D_IN_R[14]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_FFT2D_IN_R_15     ( .Y(C_FFT2D_IN_R[15]), .P(FFT2D_IN_R[15]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_FFT2D_IN_R_16     ( .Y(C_FFT2D_IN_R[16]), .P(FFT2D_IN_R[16]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_FFT2D_IN_R_17     ( .Y(C_FFT2D_IN_R[17]), .P(FFT2D_IN_R[17]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_FFT2D_IN_R_18     ( .Y(C_FFT2D_IN_R[18]), .P(FFT2D_IN_R[18]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );

P4C I_FFT2D_IN_I_0     ( .Y(C_FFT2D_IN_I[0]), .P(FFT2D_IN_I[0]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_FFT2D_IN_I_1     ( .Y(C_FFT2D_IN_I[1]), .P(FFT2D_IN_I[1]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_FFT2D_IN_I_2     ( .Y(C_FFT2D_IN_I[2]), .P(FFT2D_IN_I[2]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_FFT2D_IN_I_3     ( .Y(C_FFT2D_IN_I[3]), .P(FFT2D_IN_I[3]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_FFT2D_IN_I_4     ( .Y(C_FFT2D_IN_I[4]), .P(FFT2D_IN_I[4]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_FFT2D_IN_I_5     ( .Y(C_FFT2D_IN_I[5]), .P(FFT2D_IN_I[5]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_FFT2D_IN_I_6     ( .Y(C_FFT2D_IN_I[6]), .P(FFT2D_IN_I[6]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_FFT2D_IN_I_7     ( .Y(C_FFT2D_IN_I[7]), .P(FFT2D_IN_I[7]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_FFT2D_IN_I_8     ( .Y(C_FFT2D_IN_I[8]), .P(FFT2D_IN_I[8]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_FFT2D_IN_I_9     ( .Y(C_FFT2D_IN_I[9]), .P(FFT2D_IN_I[9]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_FFT2D_IN_I_10     ( .Y(C_FFT2D_IN_I[10]), .P(FFT2D_IN_I[10]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_FFT2D_IN_I_11     ( .Y(C_FFT2D_IN_I[11]), .P(FFT2D_IN_I[11]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_FFT2D_IN_I_12     ( .Y(C_FFT2D_IN_I[12]), .P(FFT2D_IN_I[12]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_FFT2D_IN_I_13     ( .Y(C_FFT2D_IN_I[13]), .P(FFT2D_IN_I[13]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_FFT2D_IN_I_14     ( .Y(C_FFT2D_IN_I[14]), .P(FFT2D_IN_I[14]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_FFT2D_IN_I_15     ( .Y(C_FFT2D_IN_I[15]), .P(FFT2D_IN_I[15]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_FFT2D_IN_I_16     ( .Y(C_FFT2D_IN_I[16]), .P(FFT2D_IN_I[16]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_FFT2D_IN_I_17     ( .Y(C_FFT2D_IN_I[17]), .P(FFT2D_IN_I[17]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_FFT2D_IN_I_18     ( .Y(C_FFT2D_IN_I[18]), .P(FFT2D_IN_I[18]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );

// Output Pads
P8C O_VALID    ( .A(C_OUT_VALID),   .P(OUT_VALID), .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );

P8C O_FFT2D_OUT_R_0     ( .A(C_FFT2D_OUT_R[0]), .P(FFT2D_OUT_R[0]), .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P8C O_FFT2D_OUT_R_1     ( .A(C_FFT2D_OUT_R[1]), .P(FFT2D_OUT_R[1]), .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P8C O_FFT2D_OUT_R_2     ( .A(C_FFT2D_OUT_R[2]), .P(FFT2D_OUT_R[2]), .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P8C O_FFT2D_OUT_R_3     ( .A(C_FFT2D_OUT_R[3]), .P(FFT2D_OUT_R[3]), .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P8C O_FFT2D_OUT_R_4     ( .A(C_FFT2D_OUT_R[4]), .P(FFT2D_OUT_R[4]), .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P8C O_FFT2D_OUT_R_5     ( .A(C_FFT2D_OUT_R[5]), .P(FFT2D_OUT_R[5]), .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P8C O_FFT2D_OUT_R_6     ( .A(C_FFT2D_OUT_R[6]), .P(FFT2D_OUT_R[6]), .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P8C O_FFT2D_OUT_R_7     ( .A(C_FFT2D_OUT_R[7]), .P(FFT2D_OUT_R[7]), .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P8C O_FFT2D_OUT_R_8     ( .A(C_FFT2D_OUT_R[8]), .P(FFT2D_OUT_R[8]), .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P8C O_FFT2D_OUT_R_9     ( .A(C_FFT2D_OUT_R[9]), .P(FFT2D_OUT_R[9]), .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P8C O_FFT2D_OUT_R_10     ( .A(C_FFT2D_OUT_R[10]), .P(FFT2D_OUT_R[10]), .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P8C O_FFT2D_OUT_R_11     ( .A(C_FFT2D_OUT_R[11]), .P(FFT2D_OUT_R[11]), .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P8C O_FFT2D_OUT_R_12     ( .A(C_FFT2D_OUT_R[12]), .P(FFT2D_OUT_R[12]), .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P8C O_FFT2D_OUT_R_13     ( .A(C_FFT2D_OUT_R[13]), .P(FFT2D_OUT_R[13]), .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P8C O_FFT2D_OUT_R_14     ( .A(C_FFT2D_OUT_R[14]), .P(FFT2D_OUT_R[14]), .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P8C O_FFT2D_OUT_R_15     ( .A(C_FFT2D_OUT_R[15]), .P(FFT2D_OUT_R[15]), .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P8C O_FFT2D_OUT_R_16     ( .A(C_FFT2D_OUT_R[16]), .P(FFT2D_OUT_R[16]), .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P8C O_FFT2D_OUT_R_17     ( .A(C_FFT2D_OUT_R[17]), .P(FFT2D_OUT_R[17]), .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P8C O_FFT2D_OUT_R_18     ( .A(C_FFT2D_OUT_R[18]), .P(FFT2D_OUT_R[18]), .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );

P8C O_FFT2D_OUT_I_0     ( .A(C_FFT2D_OUT_I[0]), .P(FFT2D_OUT_I[0]), .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P8C O_FFT2D_OUT_I_1     ( .A(C_FFT2D_OUT_I[1]), .P(FFT2D_OUT_I[1]), .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P8C O_FFT2D_OUT_I_2     ( .A(C_FFT2D_OUT_I[2]), .P(FFT2D_OUT_I[2]), .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P8C O_FFT2D_OUT_I_3     ( .A(C_FFT2D_OUT_I[3]), .P(FFT2D_OUT_I[3]), .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P8C O_FFT2D_OUT_I_4     ( .A(C_FFT2D_OUT_I[4]), .P(FFT2D_OUT_I[4]), .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P8C O_FFT2D_OUT_I_5     ( .A(C_FFT2D_OUT_I[5]), .P(FFT2D_OUT_I[5]), .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P8C O_FFT2D_OUT_I_6     ( .A(C_FFT2D_OUT_I[6]), .P(FFT2D_OUT_I[6]), .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P8C O_FFT2D_OUT_I_7     ( .A(C_FFT2D_OUT_I[7]), .P(FFT2D_OUT_I[7]), .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P8C O_FFT2D_OUT_I_8     ( .A(C_FFT2D_OUT_I[8]), .P(FFT2D_OUT_I[8]), .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P8C O_FFT2D_OUT_I_9     ( .A(C_FFT2D_OUT_I[9]), .P(FFT2D_OUT_I[9]), .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P8C O_FFT2D_OUT_I_10     ( .A(C_FFT2D_OUT_I[10]), .P(FFT2D_OUT_I[10]), .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P8C O_FFT2D_OUT_I_11     ( .A(C_FFT2D_OUT_I[11]), .P(FFT2D_OUT_I[11]), .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P8C O_FFT2D_OUT_I_12     ( .A(C_FFT2D_OUT_I[12]), .P(FFT2D_OUT_I[12]), .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P8C O_FFT2D_OUT_I_13     ( .A(C_FFT2D_OUT_I[13]), .P(FFT2D_OUT_I[13]), .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P8C O_FFT2D_OUT_I_14     ( .A(C_FFT2D_OUT_I[14]), .P(FFT2D_OUT_I[14]), .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P8C O_FFT2D_OUT_I_15     ( .A(C_FFT2D_OUT_I[15]), .P(FFT2D_OUT_I[15]), .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P8C O_FFT2D_OUT_I_16     ( .A(C_FFT2D_OUT_I[16]), .P(FFT2D_OUT_I[16]), .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P8C O_FFT2D_OUT_I_17     ( .A(C_FFT2D_OUT_I[17]), .P(FFT2D_OUT_I[17]), .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P8C O_FFT2D_OUT_I_18     ( .A(C_FFT2D_OUT_I[18]), .P(FFT2D_OUT_I[18]), .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );

// IO power 3.3V pads  (DVDD + DGND) 
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

// Core power 1.8V pads  (VDD + GND) 
PVDDC VDDC0 ();
PVSSC GNDC0 ();
PVDDC VDDC1 ();
PVSSC GNDC1 ();

endmodule
