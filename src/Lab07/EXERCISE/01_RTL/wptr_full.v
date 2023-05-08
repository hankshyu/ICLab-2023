module wptr_full #(parameter ASIZE = 4)(
	//Input Port
	wq2_rptr,
	wclk,
	rst_n,
	winc,

    //Output Port
	wptr,
	waddr,
	wfull
); 
input [ASIZE:0] wq2_rptr;
input wclk, winc, rst_n;

output reg [ASIZE:0] wptr;
output [ASIZE-1:0] waddr;
output reg wfull;
// gray code
reg [ASIZE:0] wbin;
wire [ASIZE:0] wgraynext, wbinnext;

always @(posedge wclk or negedge rst_n)begin
	if(!rst_n)
		{wbin, wptr} <= 0;
	else 
		{wbin, wptr} <= {wbinnext, wgraynext};
end

assign waddr = wbin[ASIZE-1:0];

assign wbinnext = wbin + (winc & ~wfull);
assign wgraynext = (wbinnext>>1) ^ wbinnext;

// full
wire wfull_val;
assign wfull_val = (wgraynext=={~wq2_rptr[ASIZE:ASIZE-1],wq2_rptr[ASIZE-2:0]});

always @(posedge wclk or negedge rst_n)begin
	if(!rst_n)
		wfull <= 1'b0;
	else 
		wfull <= wfull_val;
end



endmodule 