module bridge(input clk, INF.bridge_inf inf);
    
    //FSM
    enum logic [2 : 0] {S_INIT, 
                        SR_READY, 
                        SR_VALID, 
                        SW_READY,
                        SW_DREADY, 
                        SW_RESP, 
                        S_OUT} cs, ns;
    
    //input reg

    logic [ 8 -1 : 0] addr_reg;
    logic [64 -1 : 0] data_reg;

    always_ff @(posedge clk or negedge inf.rst_n) begin
        if(!inf.rst_n) cs <= S_INIT;
        else cs <= ns;
    end
    always_comb begin
        case (cs)
            S_INIT:begin
                //C_r_wb == 0 signals Write DRAM
                //C_r_wb == 1 signals READ DRAM

                if(inf.C_in_valid && inf.C_r_wb) ns = SR_READY;
                else if(inf.C_in_valid && (!inf.C_r_wb)) ns = SW_READY;
                else ns = S_INIT;
            end 
            SR_READY: ns = (inf.AR_READY)? SR_VALID: SR_READY;
            SR_VALID: ns = (inf.R_VALID)? S_OUT : SR_VALID;
            
            SW_READY: ns = (inf.AW_READY)? SW_DREADY : SW_READY;
            SW_DREADY: ns = (inf.W_READY)?  SW_RESP: SW_DREADY;
            SW_RESP: ns = (inf.B_VALID)? S_OUT : SW_RESP;
            S_OUT: ns = S_INIT;
            default: ns = S_INIT;
        endcase
    end

    //store input in registers
    always_ff @(posedge clk or negedge inf.rst_n) begin
        if(!inf.rst_n) addr_reg <= 0;
        else begin
            if(inf.C_in_valid) addr_reg <= inf.C_addr;
        end
    end
    always_ff @(posedge clk or negedge inf.rst_n) begin
        if(!inf.rst_n) data_reg <= 0;
        else begin
            if(inf.C_in_valid && (!inf.C_r_wb)) data_reg <= inf.C_data_w;
        end
    end


    // output AXI-Lite signals to DRAM   
    assign inf.AR_VALID = (cs == SR_READY)? 1'b1 : 1'b0;
    assign inf.AR_ADDR = (cs == SR_READY)? {6'b1_0000_0,addr_reg,3'd0} : 0;
        
    assign inf.R_READY = (cs == SR_VALID)? 1'b1 : 1'b0;
        
    assign inf.AW_VALID = (cs == SW_READY)? 1'b1 : 1'b0;
    assign inf.AW_ADDR = (cs == SW_READY)? {6'b1_0000_0,addr_reg,3'd0} : 0;

    assign inf.W_DATA = (cs == SW_DREADY)? data_reg : 0;
    assign inf.W_VALID = (cs == SW_DREADY)? 1'b1 : 1'b0;

    assign inf.B_READY = (cs == SW_DREADY || cs == SW_RESP)? 1'b1 : 1'b0;

    // output logic toward OS
    always_ff @(posedge clk or negedge inf.rst_n) begin
        if(!inf.rst_n) inf.C_out_valid <= 0;
        else begin
            inf.C_out_valid <= (ns == S_OUT)? 1'b1 : 1'b0;
        end
    end
    always_ff @(posedge clk or negedge inf.rst_n) begin
        if(!inf.rst_n) inf.C_data_r <= 0;
        else begin
            inf.C_data_r <= (inf.R_VALID)? inf.R_DATA : 0;
        end
    end

endmodule