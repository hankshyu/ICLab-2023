`include "sync_r2w.v" 
`include "sync_w2r.v" 
`include "fifomem.v" 
`include "rptr_empty.v" 
`include "wptr_full.v" 

module AFIFO #(parameter DSIZE = 8,
			   parameter ASIZE = 4)(
	//Input Port
	rst_n,
    //Input Port (read)
    rclk,
    rinc,
	//Input Port (write)
    wclk,
    winc,
	wdata,

    //Output Port (read)
    rempty,
	rdata,
    //Output Port (write)
    wfull
); 

//-----------------------------------------------------------------------------------------------------------------
//   PORT DECLARATION                                                  
//-----------------------------------------------------------------------------------------------------------------
input 				rst_n, rclk, rinc, wclk, winc;
input [DSIZE-1:0] 	wdata;

output 				rempty, wfull;
output [DSIZE-1:0] 	rdata;

//-----------------------------------------------------------------------------------------------------------------
//   LOGIC DECLARATION                                                 
//-----------------------------------------------------------------------------------------------------------------
wire [ASIZE-1:0] 	waddr, raddr;
wire [ASIZE:0] 		wptr, rptr, wq2_rptr, rq2_wptr;

//-----------------------------------------------------------------------------------------------------------------
//   Design                                                            
//-----------------------------------------------------------------------------------------------------------------
sync_r2w sync_r2w_m0 (.wq2_rptr(wq2_rptr), .rptr(rptr), .wclk(wclk), .rst_n(rst_n));

sync_w2r sync_w2r_m0 (.rq2_wptr(rq2_wptr), .wptr(wptr), .rclk(rclk), .rst_n(rst_n));

fifomem #(DSIZE, ASIZE) fifomem_m0 (.rdata(rdata), .wdata(wdata), .waddr(waddr), .raddr(raddr), .wclken(winc), .wfull(wfull), .wclk(wclk));

rptr_empty #(ASIZE) rptr_empty_m0 (.rempty(rempty), .raddr(raddr), .rptr(rptr), .rq2_wptr(rq2_wptr), .rinc(rinc), .rclk(rclk), .rst_n(rst_n));

wptr_full #(ASIZE) wptr_full_m0 (.wfull(wfull), .waddr(waddr), .wptr(wptr), .wq2_rptr(wq2_rptr), .winc(winc), .wclk(wclk), .rst_n(rst_n));



endmodule

