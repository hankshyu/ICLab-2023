module sync_w2r #(parameter ASIZE = 4)(
	//Input Port
	wptr,
	rclk,
	rst_n,

    //Output Port
	rq2_wptr
); 


input rclk, rst_n;
input [ASIZE:0] wptr;

output reg [ASIZE:0] rq2_wptr;

reg [ASIZE:0] rq1_wptr;

always @(posedge rclk or negedge rst_n)begin
	if(!rst_n)
		{rq2_wptr,rq1_wptr} <= 0;
	else 
		{rq2_wptr,rq1_wptr} <= {rq1_wptr,wptr};
end


endmodule