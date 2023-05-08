module rptr_empty #(parameter ASIZE = 4)(
	//Input Port
	rq2_wptr,
	rclk,
	rst_n,
	rinc,

    //Output Port
	rptr,
	raddr,
	rempty
); 

input [ASIZE:0] rq2_wptr;
input rclk, rinc, rst_n;

output reg [ASIZE:0] rptr;
output [ASIZE-1:0] raddr;
output reg rempty;
// gray code
reg [ASIZE:0] rbin;
wire [ASIZE:0] rgraynext, rbinnext;

always @(posedge rclk or negedge rst_n)begin
	if(!rst_n)
		{rbin, rptr} <= 0;
	else 
		{rbin, rptr} <= {rbinnext, rgraynext};
end

assign raddr = rbin[ASIZE-1:0];

assign rbinnext = rbin + (rinc & ~rempty);
assign rgraynext = (rbinnext>>1) ^ rbinnext;

// empty
wire rempty_val;
assign rempty_val = (rgraynext == rq2_wptr);

always @(posedge rclk or negedge rst_n)begin
	if(!rst_n)
		rempty <= 1'b1;
	else 
		rempty <= rempty_val;
end



endmodule