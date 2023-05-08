module fifomem #(parameter DSIZE = 8,
				 parameter ASIZE = 4)(
	//Input Port
	wclk,
	wclken,
	wfull,
	wdata,
	waddr,
	raddr,

    //Output Port
	rdata
); 

input	wclk, wclken, wfull;
input [DSIZE-1:0] wdata;
input [ASIZE-1:0] waddr, raddr;

output [DSIZE-1:0] rdata;


localparam DEPTH = 1<<ASIZE;
reg [DSIZE-1:0] mem [DEPTH-1:0];

assign rdata = mem[raddr];

always @(posedge wclk)
	if(wclken && !wfull) mem[waddr] <= wdata;
	
endmodule