module CHIP(
	clk,
	rst_n,
	in_valid,
	in_data,
	ending,
	busy,
	full,
	out_valid,
	out_data
);
input 		clk;
input 		rst_n;
input 		in_valid, ending;
input [7:0] in_data;

output 	 busy, full, out_valid;
output [7:0] out_data;

wire 		C_clk, BUF_CLK;
wire 		C_rst_n;
wire 		C_in_valid, C_ending;
wire [7:0]  C_in_data;
wire  	    C_busy, C_full, C_out_valid;
wire [7:0]  C_out_data;
//TA has already defined for you
//core module
CORE CORE(
	.clk(BUF_CLK),
	.rst_n(C_rst_n),
	.in_valid(C_in_valid),
	.in_data(C_in_data),
	.ending(C_ending),
	
	.busy(C_busy),
	.full(C_full),
	.out_valid(C_out_valid),
	.out_data(C_out_data)
);

CLKBUFX20 buf0(.A(C_clk),.Y(BUF_CLK));

P8C I_CLK      ( .Y(C_clk),        .P(clk),        .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b0), .CSEN(1'b1) );
P8C I_RESET    ( .Y(C_rst_n),      .P(rst_n),      .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_VALID    ( .Y(C_in_valid),   .P(in_valid),   .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_ENDING   ( .Y(C_ending),     .P(ending),     .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_IN_0     ( .Y(C_in_data[0]), .P(in_data[0]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_IN_1     ( .Y(C_in_data[1]), .P(in_data[1]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_IN_2     ( .Y(C_in_data[2]), .P(in_data[2]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_IN_3     ( .Y(C_in_data[3]), .P(in_data[3]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_IN_4     ( .Y(C_in_data[4]), .P(in_data[4]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_IN_5     ( .Y(C_in_data[5]), .P(in_data[5]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_IN_6     ( .Y(C_in_data[6]), .P(in_data[6]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );
P4C I_IN_7     ( .Y(C_in_data[7]), .P(in_data[7]), .A(1'b0), .ODEN(1'b0), .OCEN(1'b0), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0) );

P8C O_BUSY     ( .A(C_busy),   		.P(busy), 		 .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0));
P8C O_FULL     ( .A(C_full),   		.P(full), 		 .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0));
P8C O_VALID    ( .A(C_out_valid), 	.P(out_valid), 	 .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0));
P8C O_OUT_0    ( .A(C_out_data[0]), .P(out_data[0]), .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0));
P8C O_OUT_1    ( .A(C_out_data[1]), .P(out_data[1]), .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0));
P8C O_OUT_2    ( .A(C_out_data[2]), .P(out_data[2]), .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0));
P8C O_OUT_3    ( .A(C_out_data[3]), .P(out_data[3]), .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0));
P8C O_OUT_4    ( .A(C_out_data[4]), .P(out_data[4]), .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0));
P8C O_OUT_5    ( .A(C_out_data[5]), .P(out_data[5]), .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0));
P8C O_OUT_6    ( .A(C_out_data[6]), .P(out_data[6]), .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0));
P8C O_OUT_7    ( .A(C_out_data[7]), .P(out_data[7]), .ODEN(1'b1), .OCEN(1'b1), .PU(1'b1), .PD(1'b0), .CEN(1'b1), .CSEN(1'b0));


//I/O power 3.3V pads x? (DVDD + DGND)
PVDDR VDDP0 ();
PVSSR GNDP0 ();
PVDDR VDDP1 ();
PVSSR GNDP1 ();
PVDDR VDDP2 ();
PVSSR GNDP2 ();
PVDDR VDDP3 ();
PVSSR GNDP3 ();

//...

//Core poweri 1.8V pads x? (VDD + GND)
PVDDC VDDC0 ();
PVSSC GNDC0 ();
PVDDC VDDC1 ();
PVSSC GNDC1 ();
PVDDC VDDC2 ();
PVSSC GNDC2 ();
PVDDC VDDC3 ();
PVSSC GNDC3 ();
//...



endmodule

