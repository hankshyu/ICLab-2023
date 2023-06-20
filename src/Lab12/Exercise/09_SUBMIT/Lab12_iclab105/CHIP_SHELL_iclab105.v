module CHIP(    
	// Input signals
    clk,
    rst_n,
	in_valid,
    in_valid_num,
    col,
    row,
    in_num,
	
    // Output signals
	out_valid,
    out
);

// ===============================================================
// Input & Output Declaration
// ===============================================================
input           clk, rst_n, in_valid,in_valid_num;
input   [3:0]   col,row;
input   [2:0]   in_num;

output          out_valid;
output  [3:0]   out;

wire		    C_clk;
wire			C_rst_n;
wire			C_in_valid;
wire			C_in_valid_num;
wire	[3:0]	C_col;
wire	[3:0]	C_row;
wire	[2:0]	C_in_num;

wire			C_out_valid;
wire	[3:0]	C_out;


wire	        BUF_clk;
CLKBUFX20 buf0(.A(C_clk),.Y(BUF_clk));


QUEEN u_QUEEN(
    .clk(BUF_clk),
    .rst_n(C_rst_n),
    .in_valid(C_in_valid),
    .in_valid_num(C_in_valid_num),
    .col(C_col),
    .row(C_row),
    .in_num(C_in_num),

    .out_valid(C_out_valid),
    .out(C_out)
);

//////////////
P8C I_CLK      ( .Y(C_clk),        .P(clk),        .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b0), .CSEN(1'b1) );
P8C I_RESET    ( .Y(C_rst_n),      .P(rst_n),      .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_IN_VALID    ( .Y(C_in_valid),   .P(in_valid),   .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_IN_VALID_NUM    ( .Y(C_in_valid_num),   .P(in_valid_num),   .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_COL_0     ( .Y(C_col[0]), .P(col[0]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_COL_1     ( .Y(C_col[1]), .P(col[1]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_COL_2     ( .Y(C_col[2]), .P(col[2]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_COL_3     ( .Y(C_col[3]), .P(col[3]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_ROW_0     ( .Y(C_row[0]), .P(row[0]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_ROW_1     ( .Y(C_row[1]), .P(row[1]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_ROW_2     ( .Y(C_row[2]), .P(row[2]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_ROW_3     ( .Y(C_row[3]), .P(row[3]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_IN_NUM_0     ( .Y(C_in_num[0]), .P(in_num[0]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_IN_NUM_1     ( .Y(C_in_num[1]), .P(in_num[1]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_IN_NUM_2     ( .Y(C_in_num[2]), .P(in_num[2]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );

P8C O_OUT_VALID    ( .A(C_out_valid), 	.P(out_valid), 	 .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0));
P8C O_OUT_0     ( .A(C_out[0]),   	.P(out[0]), 	.ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0));
P8C O_OUT_1     ( .A(C_out[1]),   	.P(out[1]), 	.ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0));
P8C O_OUT_2     ( .A(C_out[2]),   	.P(out[2]), 	.ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0));
P8C O_OUT_3     ( .A(C_out[3]),   	.P(out[3]), 	.ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0));



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

//Core poweri 1.8V pads x8 (VDD + GND)
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