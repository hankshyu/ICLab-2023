module sync_r2w #(parameter ASIZE = 4)(
	//Input Port
	rptr,
	wclk,
	rst_n,

    //Output Port
	wq2_rptr
); 


input wclk, rst_n;
input [ASIZE:0] rptr;

output reg [ASIZE:0] wq2_rptr;

reg [ASIZE:0] wq1_rptr;

always @(posedge wclk or negedge rst_n)begin
	if(!rst_n)
		{wq2_rptr,wq1_rptr} <= 0;
	else 
		{wq2_rptr,wq1_rptr} <= {wq1_rptr,rptr};
end


endmodule