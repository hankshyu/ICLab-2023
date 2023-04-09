/*
============================================================================

Date   : 2023/03/15
Author : EECS Lab

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Debuggging mode  :
    Dump file for Debuging

TO Solve :
    error calculation when golden is zero
    NaN in IEEE 754 problem check
============================================================================
*/

`ifdef RTL
    `include "NN.v"
    `define CYCLE_TIME 14.6
`endif
`ifdef GATE
    `include "NN_SYN.v"
    `define CYCLE_TIME 14.6
`endif

//synopsys translate_off
`include "/RAID2/cad/synopsys/synthesis/2022.03/dw/sim_ver/DW_fp_mac.v"
`include "/RAID2/cad/synopsys/synthesis/2022.03/dw/sim_ver/DW_fp_recip.v"
`include "/RAID2/cad/synopsys/synthesis/2022.03/dw/sim_ver/DW_fp_exp.v"
//synopsys translate_on

module PATTERN(
    // Output signals
    clk,
    rst_n,
    in_valid,
    weight_u,
    weight_w,
    weight_v,
    data_x,
    data_h,
    // Input signals
    out_valid,
    out
);
//======================================
//      PARAMETER FOR PORT
//======================================
parameter inst_sig_width       = 23;
parameter inst_exp_width       = 8;
parameter inst_ieee_compliance = 1;
parameter inst_arch            = 0;

parameter ts_num  = 3; // RNN time series num
parameter vec_len = 3; // length of vector

//======================================
//          I/O PORTS
//======================================
output reg                                    clk, rst_n;
output reg                                      in_valid;
output reg [inst_sig_width+inst_exp_width: 0]   weight_u;
output reg [inst_sig_width+inst_exp_width: 0]   weight_w;
output reg [inst_sig_width+inst_exp_width: 0]   weight_v;
output reg [inst_sig_width+inst_exp_width: 0]     data_x;
output reg [inst_sig_width+inst_exp_width: 0]     data_h;
input                                          out_valid;
input      [inst_sig_width+inst_exp_width: 0]        out;

//======================================
//      PARAMETERS & VARIABLES
//======================================
parameter PATNUM  = 70;
parameter CYCLE   = `CYCLE_TIME;
parameter DELAY   = 100;
parameter IN_NUM  = 9;
parameter OUT_NUM = 9;
integer   SEED    = 122;
real      ERR_VAL = 0.0005;

// PATTERN CONTROL
integer       i;
integer       j;
integer       k;
integer       m;
integer    stop;
integer     pat;
integer exe_lat;
integer out_lat;
integer tot_lat;

// FILE CONTROL
integer file_tot;
integer file_idx1;
integer file_idx2;
integer file_idx3;
integer file_out;
real temp;

//======================================
//      DATA MODEL
//======================================
// INPUT INFO
reg [inst_sig_width+inst_exp_width:0] U_in[0:vec_len-1][0:vec_len-1]; // Weight Matrix size : 3x3
reg [inst_sig_width+inst_exp_width:0] W_in[0:vec_len-1][0:vec_len-1]; // Weight Matrix size : 3x3
reg [inst_sig_width+inst_exp_width:0] V_in[0:vec_len-1][0:vec_len-1]; // Weight Matrix size : 3x3
reg [inst_sig_width+inst_exp_width:0] X_in[1:ts_num   ][0:vec_len-1]; // X vector num : 3, One vector size : 3x1 // X1, X2, X3
reg [inst_sig_width+inst_exp_width:0] H_in[0:vec_len-1];              // H vector num : 1, One vector size : 3x1 // H0

// OUTPUT INFO
reg [inst_sig_width+inst_exp_width:0] U_gold  [1:ts_num][0:vec_len-1]; // U_in*X_in[1]
reg [inst_sig_width+inst_exp_width:0] W_gold  [1:ts_num][0:vec_len-1]; // W_in*H_gold[0]
reg [inst_sig_width+inst_exp_width:0] U_W_gold[1:ts_num][0:vec_len-1]; // U_in*X_in[1] + W_in*H_gold[0]
reg [inst_sig_width+inst_exp_width:0] H_gold  [0:ts_num][0:vec_len-1]; // f(U_W_gold[1])
reg [inst_sig_width+inst_exp_width:0] V_gold  [1:ts_num][0:vec_len-1]; // V_in*H_gold[1]
reg [inst_sig_width+inst_exp_width:0] Y_gold  [1:ts_num][0:vec_len-1]; // g(V_gold[1])

reg [inst_sig_width+inst_exp_width:0] your_vec[1:ts_num][0:vec_len-1];
reg [inst_sig_width+inst_exp_width:0] out_check;

// TEMP RESULT FOR CALCULATION
wire [inst_sig_width+inst_exp_width:0] U_out_w  [1:ts_num][0:vec_len-1];
wire [inst_sig_width+inst_exp_width:0] W_out_w  [1:ts_num][0:vec_len-1];
wire [inst_sig_width+inst_exp_width:0] U_W_out_w[1:ts_num][0:vec_len-1];
wire [inst_sig_width+inst_exp_width:0] H_out_w  [0:ts_num][0:vec_len-1];
wire [inst_sig_width+inst_exp_width:0] V_out_w  [1:ts_num][0:vec_len-1];
wire [inst_sig_width+inst_exp_width:0] Y_out_w  [1:ts_num][0:vec_len-1];

// ERROR CHECK -0.0005~0.0005
wire [inst_sig_width+inst_exp_width:0] error_lim_pos = 32'h3A03126F;
wire [inst_sig_width+inst_exp_width:0] error_lim_neg = 32'hBA03126F;

wire [inst_sig_width+inst_exp_width:0] up_bound ;
wire [inst_sig_width+inst_exp_width:0] low_bound;

wire [inst_sig_width+inst_exp_width:0] error_diff;
wire up_flag, low_flag;

// DISPLAY 
real err_real;
real your_real;
real gold_real;

// Data Model task
// Display float
integer exp;
real    frac;
real    float;
task display_float;
    input reg[inst_sig_width+inst_exp_width:0] x;
begin
    // Exponent
    exp = -127;
    for(i=0 ; i<inst_exp_width ; i=i+1) begin
        exp = exp + (2**i)*x[inst_sig_width+i];
        //$display("%d %d %d\n", exp, x[inst_sig_width+i], inst_sig_width+i);
    end
    // Fraction
    frac = 1;
    for(i=0 ; i<inst_sig_width ; i=i+1) begin
        frac = frac + 2.0**(i-inst_sig_width)*x[i];
        //$display("%.31f %d %d\n", frac, x[i], i);
    end
    // Float
    float = 0;
    float = x[inst_sig_width+inst_exp_width] ? -frac * (2.0**exp) : frac * (2.0**exp);

    //Display
    $display("Original : %-b , %-b , %-b", x[inst_sig_width+inst_exp_width], x[inst_sig_width+:inst_exp_width], x[0+:inst_sig_width]);
    $display("Sign     : %-d", x[inst_sig_width+inst_exp_width]);
    $display("Exponet  : %-d", exp);
    $display("Fraction : %-.31f", frac);
    $display("Value    : %-.31f", float);
end endtask

// Convert float
integer i_conv;
task convert_float;
    input reg[inst_sig_width+inst_exp_width:0] x;
    output real y;
begin
    // Exponent
    exp = -127;
    for(i_conv=0 ; i_conv<inst_exp_width ; i_conv=i_conv+1) begin
        exp = exp + (2**i_conv)*x[inst_sig_width+i_conv];
        //$display("%d %d %d\n", exp, x[inst_sig_width+i_conv], inst_sig_width+i_conv);
    end
    // Fraction
    frac = 1;
    for(i_conv=0 ; i_conv<inst_sig_width ; i_conv=i_conv+1) begin
        frac = frac + 2.0**(i_conv-inst_sig_width)*x[i_conv];
        //$display("%.31f %d %d\n", frac, x[i_conv], i_conv);
    end
    // Float
    float = 0;
    float = x[inst_sig_width+inst_exp_width] ? -frac * (2.0**exp) : frac * (2.0**exp);

    y = float;
end endtask

// Dump hex
task dump_hex_task; begin

    file_out = $fopen("Weight and Input hex.txt", "w");
    
    //=========================
    // Dump weight & input
    //=========================
    $fwrite(file_out, "[ Weight U ]\n\n");
    for(j=0 ; j<vec_len ; j=j+1) begin
        for(k=0 ; k<vec_len ; k=k+1) begin
            $fwrite(file_out, "%-1h ", U_in[j][k]);
        end
        $fwrite(file_out, "\n\n");
    end

    $fwrite(file_out, "[ Weight W ]\n\n");
    for(j=0 ; j<vec_len ; j=j+1) begin
        for(k=0 ; k<vec_len ; k=k+1) begin
            $fwrite(file_out, "%-1h ", W_in[j][k]);
        end
        $fwrite(file_out, "\n\n");
    end

    $fwrite(file_out, "[ Weight V ]\n\n");
    for(j=0 ; j<vec_len ; j=j+1) begin
        for(k=0 ; k<vec_len ; k=k+1) begin
            $fwrite(file_out, "%-1h ", V_in[j][k]);
        end
        $fwrite(file_out, "\n\n");
    end

    $fwrite(file_out, "[ Input ]\n\n");
    for(i=1 ; i<=ts_num ; i=i+1) begin
        
        $fwrite(file_out, "X_%-1d : ", i);
        for(k=0 ; k<vec_len ; k=k+1) begin
            $fwrite(file_out, "%-1h ", X_in[i][k]);
        end
        $fwrite(file_out, "\n\n");
    end

    $fwrite(file_out, "H_0 : ");
    for(k=0 ; k<vec_len ; k=k+1) begin
        $fwrite(file_out, "%-1h ", H_in[k]);
    end
    $fwrite(file_out, "\n\n");
    $fclose(file_out);

    file_out = $fopen("RNN Output hex.txt", "w");
    for(i=1 ; i<=ts_num ; i=i+1) begin
        //=========================
        // Dump U*x
        //=========================
        $fwrite(file_out, "[ Layer %-1d U*x ]\n\n", i);
        for(k=0 ; k<vec_len ; k=k+1) begin
            $fwrite(file_out, "%-1h ", U_gold[i][k]);
        end
        $fwrite(file_out, "\n\n");

        //=========================
        // Dump W*h
        //=========================
        $fwrite(file_out, "[ Layer %-1d->%-1d W*h ]\n\n", i-1, i);
        for(k=0 ; k<vec_len ; k=k+1) begin
            $fwrite(file_out, "%-1h ", W_gold[i][k]);
        end
        $fwrite(file_out, "\n\n");

        //=========================
        // Dump U*x+W*h
        //=========================
        $fwrite(file_out, "[ Layer %-1d U*x+W*h ]\n\n", i);
        for(k=0 ; k<vec_len ; k=k+1) begin
            $fwrite(file_out, "%-1h ", U_W_gold[i][k]);
        end
        $fwrite(file_out, "\n\n");

        //=========================
        // Dump h
        //=========================
        $fwrite(file_out, "[ Layer %-1d h ]\n\n", i);
        for(k=0 ; k<vec_len ; k=k+1) begin
            $fwrite(file_out, "%-1h ", H_gold[i][k]);
        end
        $fwrite(file_out, "\n\n");

        //=========================
        // Dump V*h
        //=========================
        $fwrite(file_out, "[ Layer %-1d V*h ]\n\n", i);
        for(k=0 ; k<vec_len ; k=k+1) begin
            $fwrite(file_out, "%-1h ", V_gold[i][k]);
        end
        $fwrite(file_out, "\n\n");

        //=========================
        // Dump y
        //=========================
        $fwrite(file_out, "[ Layer %-1d y ]\n\n", i);
        for(k=0 ; k<vec_len ; k=k+1) begin
            $fwrite(file_out, "%-1h ", Y_gold[i][k]);
        end
        $fwrite(file_out, "\n==============================================\n");
    end
    $fclose(file_out);
end endtask

// Dump float
task dump_float_task; begin
    file_out = $fopen("Weight and Input float.txt", "w");
    
    //=========================
    // Dump weight & input
    //=========================
    $fwrite(file_out, "[ Weight U ]\n\n");
    for(j=0 ; j<vec_len ; j=j+1) begin
        for(k=0 ; k<vec_len ; k=k+1) begin
            convert_float(U_in[j][k], temp);
            $fwrite(file_out, "%10.10f ", temp);
        end
        $fwrite(file_out, "\n\n");
    end

    $fwrite(file_out, "[ Weight W ]\n\n");
    for(j=0 ; j<vec_len ; j=j+1) begin
        for(k=0 ; k<vec_len ; k=k+1) begin
            convert_float(W_in[j][k], temp);
            $fwrite(file_out, "%10.10f ", temp);
        end
        $fwrite(file_out, "\n\n");
    end

    $fwrite(file_out, "[ Weight V ]\n\n");
    for(j=0 ; j<vec_len ; j=j+1) begin
        for(k=0 ; k<vec_len ; k=k+1) begin
            convert_float(V_in[j][k], temp);
            $fwrite(file_out, "%10.10f ", temp);
        end
        $fwrite(file_out, "\n\n");
    end

    $fwrite(file_out, "[ Input ]\n\n");
    for(i=1 ; i<=ts_num ; i=i+1) begin
        $fwrite(file_out, "X_%-1d : ", i);
        for(k=0 ; k<vec_len ; k=k+1) begin
            convert_float(X_in[i][k], temp);
            $fwrite(file_out, "%10.10f ", temp);
        end
        $fwrite(file_out, "\n\n");
    end
    $fwrite(file_out, "H_0 : ");
    for(k=0 ; k<vec_len ; k=k+1) begin
        convert_float(H_in[k], temp);
        $fwrite(file_out, "%10.10f ", temp);
    end
    $fwrite(file_out, "\n\n");
    $fclose(file_out);

    file_out = $fopen("RNN Output float.txt", "w");
    for(i=1 ; i<=ts_num ; i=i+1) begin
        //=========================
        // Dump U*x
        //=========================
        $fwrite(file_out, "[ Layer %-1d U*x ]\n\n", i);
        for(k=0 ; k<vec_len ; k=k+1) begin
            convert_float(U_gold[i][k], temp);
            $fwrite(file_out, "%10.10f ", temp);
        end
        $fwrite(file_out, "\n\n");

        //=========================
        // Dump W*h
        //=========================
        $fwrite(file_out, "[ Layer %-1d->%-1d W*h ]\n\n", i-1, i);
        for(k=0 ; k<vec_len ; k=k+1) begin
            convert_float(W_gold[i][k], temp);
            $fwrite(file_out, "%10.10f ", temp);
        end
        $fwrite(file_out, "\n\n");

        //=========================
        // Dump U*x+W*h
        //=========================
        $fwrite(file_out, "[ Layer %-1d U*x+W*h ]\n\n", i);
        for(k=0 ; k<vec_len ; k=k+1) begin
            convert_float(U_W_gold[i][k], temp);
            $fwrite(file_out, "%10.10f ", temp);
        end
        $fwrite(file_out, "\n\n");

        //=========================
        // Dump h
        //=========================
        $fwrite(file_out, "[ Layer %-1d h ]\n\n", i);
        for(k=0 ; k<vec_len ; k=k+1) begin
            convert_float(H_gold[i][k], temp);
            $fwrite(file_out, "%10.10f ", temp);
        end
        $fwrite(file_out, "\n\n");

        //=========================
        // Dump V*h
        //=========================
        $fwrite(file_out, "[ Layer %-1d V*h ]\n\n", i);
        for(k=0 ; k<vec_len ; k=k+1) begin
            convert_float(V_gold[i][k], temp);
            $fwrite(file_out, "%10.10f ", temp);
        end
        $fwrite(file_out, "\n\n");

        //=========================
        // Dump y
        //=========================
        $fwrite(file_out, "[ Layer %-1d y ]\n\n", i);
        for(k=0 ; k<vec_len ; k=k+1) begin
            convert_float(Y_gold[i][k], temp);
            $fwrite(file_out, "%10.10f ", temp);
        end
        $fwrite(file_out, "\n==============================================\n");
    end
    $fclose(file_out);
end endtask

//======================================
//      RNN
//======================================
// Initialize H
genvar i_h;
generate
    for(i_h=0 ; i_h<vec_len ; i_h=i_h+1) begin
        assign H_out_w[0][i_h] = H_in[i_h];
    end
endgenerate

// Generate for IP
genvar i_ts, i_row, i_col;
generate
    for(i_ts=1 ; i_ts<=ts_num ; i_ts=i_ts+1) begin
        wire [inst_sig_width+inst_exp_width:0] out_u0, out_u1, out_u2;
        wire [inst_sig_width+inst_exp_width:0] out_w0, out_w1, out_w2;
        wire [inst_sig_width+inst_exp_width:0] out_uw0, out_uw1, out_uw2;
        wire [inst_sig_width+inst_exp_width:0] out_h0, out_h1, out_h2;
        wire [inst_sig_width+inst_exp_width:0] out_v0, out_v1, out_v2;
        wire [inst_sig_width+inst_exp_width:0] out_y0, out_y1, out_y2;

        // U_in * X_in
        Multi_float #(inst_sig_width, inst_exp_width, inst_ieee_compliance)
        U(
            // Weight
            U_in[0][0], U_in[0][1], U_in[0][2],
            U_in[1][0], U_in[1][1], U_in[1][2],
            U_in[2][0], U_in[2][1], U_in[2][2],
            // Input
            X_in[i_ts][0], X_in[i_ts][1], X_in[i_ts][2],
            // Output
            out_u0, out_u1, out_u2
        );
        assign U_out_w[i_ts][0] = out_u0;
        assign U_out_w[i_ts][1] = out_u1;
        assign U_out_w[i_ts][2] = out_u2;

        // W_in * H_gold
        Multi_float #(inst_sig_width, inst_exp_width, inst_ieee_compliance)
        W(
            // Weight
            W_in[0][0], W_in[0][1], W_in[0][2],
            W_in[1][0], W_in[1][1], W_in[1][2],
            W_in[2][0], W_in[2][1], W_in[2][2],
            // Input
            H_out_w[i_ts-1][0], H_out_w[i_ts-1][1], H_out_w[i_ts-1][2],
            // Output
            out_w0, out_w1, out_w2
        );
        assign W_out_w[i_ts][0] = out_w0;
        assign W_out_w[i_ts][1] = out_w1;
        assign W_out_w[i_ts][2] = out_w2;

        // U_in * X_in + W_in * H_gold
        DW_fp_addsub#(inst_sig_width,inst_exp_width,inst_ieee_compliance)
            A0 (.a(out_u0), .b(out_w0), .op(1'd0), .rnd(3'd0), .z(out_uw0));
        DW_fp_addsub#(inst_sig_width,inst_exp_width,inst_ieee_compliance)
            A1 (.a(out_u1), .b(out_w1), .op(1'd0), .rnd(3'd0), .z(out_uw1));
        DW_fp_addsub#(inst_sig_width,inst_exp_width,inst_ieee_compliance)
            A2 (.a(out_u2), .b(out_w2), .op(1'd0), .rnd(3'd0), .z(out_uw2));
        assign U_W_out_w[i_ts][0] = out_uw0;
        assign U_W_out_w[i_ts][1] = out_uw1;
        assign U_W_out_w[i_ts][2] = out_uw2;

        // f(U_W_gold)
        ReLu #(inst_sig_width, inst_exp_width, inst_ieee_compliance, inst_arch)
            S0 (out_uw0, out_h0);
        ReLu #(inst_sig_width, inst_exp_width, inst_ieee_compliance, inst_arch)
            S1 (out_uw1, out_h1);
        ReLu #(inst_sig_width, inst_exp_width, inst_ieee_compliance, inst_arch)
            S2 (out_uw2, out_h2);
        assign H_out_w[i_ts][0] = out_h0;
        assign H_out_w[i_ts][1] = out_h1;
        assign H_out_w[i_ts][2] = out_h2;

        // V_in * H_gold
        Multi_float #(inst_sig_width, inst_exp_width, inst_ieee_compliance)
        V(
            // Weight
            V_in[0][0], V_in[0][1], V_in[0][2],
            V_in[1][0], V_in[1][1], V_in[1][2],
            V_in[2][0], V_in[2][1], V_in[2][2],
            // Input
            out_h0, out_h1, out_h2,
            // Output
            out_v0, out_v1, out_v2
        );
        assign V_out_w[i_ts][0] = out_v0;
        assign V_out_w[i_ts][1] = out_v1;
        assign V_out_w[i_ts][2] = out_v2;

        // g(V_gold)
        Sigmoid #(inst_sig_width, inst_exp_width, inst_ieee_compliance, inst_arch)
            R0 (out_v0, out_y0);
        Sigmoid #(inst_sig_width, inst_exp_width, inst_ieee_compliance, inst_arch)
            R1 (out_v1, out_y1);
        Sigmoid #(inst_sig_width, inst_exp_width, inst_ieee_compliance, inst_arch)
            R2 (out_v2, out_y2);
        assign Y_out_w[i_ts][0] = out_y0;
        assign Y_out_w[i_ts][1] = out_y1;
        assign Y_out_w[i_ts][2] = out_y2;
    end
endgenerate

//======================================
//      Error Calculation
//======================================
// gold - ans
DW_fp_sub
#(inst_sig_width,inst_exp_width,inst_ieee_compliance) 
    Err_S0 (.a(out_check), .b(out), .z(error_diff), .rnd(3'd0));

// ans * error_lim_pos
DW_fp_mult
#(inst_sig_width,inst_exp_width,inst_ieee_compliance) 
    Err_M0 (.a(error_lim_pos), .b(out_check), .z(up_bound), .rnd(3'd0));

// ans * error_lim_neg
DW_fp_mult
#(inst_sig_width,inst_exp_width,inst_ieee_compliance) 
    Err_M1 (.a(error_lim_neg), .b(out_check), .z(low_bound), .rnd(3'd0));

// check (gold - ans) ? error_lim_pos * ans
DW_fp_cmp
#(inst_sig_width,inst_exp_width,inst_ieee_compliance) 
    Err_C0 (.a(error_diff), .b(up_bound), .agtb(up_flag), .zctr(1'd0));

// check (gold - ans) ? error_lim_neg*ans
DW_fp_cmp
#(inst_sig_width,inst_exp_width,inst_ieee_compliance) 
    Err_C1 (.a(error_diff), .b(low_bound), .agtb(low_flag), .zctr(1'd0));

//======================================
//              MAIN
//======================================
initial exe_task;

//======================================
//              Clock
//======================================
initial clk = 1'b0;
always #(CYCLE/2.0) clk = ~clk;

//======================================
//              TASKS
//======================================
task exe_task; begin
    reset_task;
    for (pat=0 ; pat<PATNUM ; pat=pat+1) begin
        input_task;
        cal_task;
        wait_task;
        check_task;
        // Print Pass Info and accumulate the total latency
        $display("\033[0;34mPASS PATTERN NO.%4d,\033[m \033[0;32m Cycles: %3d\033[m", pat ,exe_lat);
    end
    pass_task;
end endtask

//**************************************
//      Reset Task
//**************************************
task reset_task; begin

    force clk = 0;
    rst_n     = 1;

    in_valid  = 'd0;

    weight_u  = 'dx;
    weight_w  = 'dx;
    weight_v  = 'dx;
    data_x    = 'dx;
    data_h    = 'dx;

    tot_lat = 0;

    #(CYCLE/2.0) rst_n = 0;
    #(CYCLE/2.0) rst_n = 1;
    if (out_valid !== 0 || out !== 0) begin
        $display("                                           `:::::`                                                       ");
        $display("                                          .+-----++                                                      ");
        $display("                .--.`                    o:------/o                                                      ");
        $display("              /+:--:o/                   //-------y.          -//:::-        `.`                         ");
        $display("            `/:------y:                  `o:--::::s/..``    `/:-----s-    .:/:::+:                       ");
        $display("            +:-------:y                `.-:+///::-::::://:-.o-------:o  `/:------s-                      ");
        $display("            y---------y-        ..--:::::------------------+/-------/+ `+:-------/s                      ");
        $display("           `s---------/s       +:/++/----------------------/+-------s.`o:--------/s                      ");
        $display("           .s----------y-      o-:----:---------------------/------o: +:---------o:                      ");
        $display("           `y----------:y      /:----:/-------/o+----------------:+- //----------y`                      ");
        $display("            y-----------o/ `.--+--/:-/+--------:+o--------------:o: :+----------/o                       ");
        $display("            s:----------:y/-::::::my-/:----------/---------------+:-o-----------y.                       ");
        $display("            -o----------s/-:hmmdy/o+/:---------------------------++o-----------/o                        ");
        $display("             s:--------/o--hMMMMMh---------:ho-------------------yo-----------:s`                        ");
        $display("             :o--------s/--hMMMMNs---------:hs------------------+s------------s-                         ");
        $display("              y:-------o+--oyhyo/-----------------------------:o+------------o-                          ");
        $display("              -o-------:y--/s--------------------------------/o:------------o/                           ");
        $display("               +/-------o+--++-----------:+/---------------:o/-------------+/                            ");
        $display("               `o:-------s:--/+:-------/o+-:------------::+d:-------------o/                             ");
        $display("                `o-------:s:---ohsoosyhh+----------:/+ooyhhh-------------o:                              ");
        $display("                 .o-------/d/--:h++ohy/---------:osyyyyhhyyd-----------:o-                               ");
        $display("                 .dy::/+syhhh+-::/::---------/osyyysyhhysssd+---------/o`                                ");
        $display("                  /shhyyyymhyys://-------:/oyyysyhyydysssssyho-------od:                                 ");
        $display("                    `:hhysymmhyhs/:://+osyyssssydyydyssssssssyyo+//+ymo`                                 ");
        $display("                      `+hyydyhdyyyyyyyyyyssssshhsshyssssssssssssyyyo:`                                   ");
        $display("                        -shdssyyyyyhhhhhyssssyyssshssssssssssssyy+.    Output signal should be 0         ");
        $display("                         `hysssyyyysssssssssssssssyssssssssssshh+                                        ");
        $display("                        :yysssssssssssssssssssssssssssssssssyhysh-     after the reset signal is asserted");
        $display("                      .yyhhdo++oosyyyyssssssssssssssssssssssyyssyh/                                      ");
        $display("                      .dhyh/--------/+oyyyssssssssssssssssssssssssy:   at %4d ps                         ", $time*1000);
        $display("                       .+h/-------------:/osyyysssssssssssssssyyh/.                                      ");
        $display("                        :+------------------::+oossyyyyyyyysso+/s-                                       ");
        $display("                       `s--------------------------::::::::-----:o                                       ");
        $display("                       +:----------------------------------------y`                                      ");
        repeat(5) #(CYCLE);
        $finish;
    end
    #(CYCLE/2.0) release clk;
end endtask

//**************************************
//      Input Task
//**************************************
task input_task; begin
    //----------------------
    // Initialize H0
    //----------------------
    for(i=0 ; i<vec_len ; i=i+1) begin
        H_gold[0][i] = 0;
    end

    //----------------------
    // For easy pattern
    //----------------------
    if(pat < 100) begin
        // Weight Random
        for(i=0 ; i<vec_len ; i=i+1) begin
            for(j=0 ; j<vec_len ; j=j+1) begin
                // 1. value
                // 2. signed bit
                U_in[i][j] = 0;
                U_in[i][j][inst_sig_width+:inst_exp_width] = {$random(SEED)} % 3 + 127;
                U_in[i][j][inst_sig_width+inst_exp_width]  = {$random(SEED)} % 2;

                W_in[i][j] = 0;
                W_in[i][j][inst_sig_width+:inst_exp_width] = {$random(SEED)} % 3 + 127;
                W_in[i][j][inst_sig_width+inst_exp_width]  = {$random(SEED)} % 2;

                V_in[i][j] = 0;
                V_in[i][j][inst_sig_width+:inst_exp_width] = {$random(SEED)} % 3 + 127;
                V_in[i][j][inst_sig_width+inst_exp_width]  = {$random(SEED)} % 2;
            end
        end

        // Data Random
        for(i=1 ; i<=ts_num ; i=i+1) begin
            for(j=0 ; j<vec_len ; j=j+1) begin
                // 1. value
                // 2. signed bit
                X_in[i][j] = 0;
                X_in[i][j][inst_sig_width+:inst_exp_width] = {$random(SEED)} % 3 + 127;
                X_in[i][j][inst_sig_width+inst_exp_width]  = {$random(SEED)} % 2;
            end
        end

        for(j=0 ; j<vec_len ; j=j+1) begin
            // 1. value
            // 2. signed bit
            H_in[j] = 0;
            H_in[j][inst_sig_width+:inst_exp_width] = {$random(SEED)} % 3 + 127;
            H_in[j][inst_sig_width+inst_exp_width]  = {$random(SEED)} % 2;
        end
    end
    //----------------------
    // For normal pattern
    //----------------------
    else begin
        // Weight Random
        for(i=0 ; i<vec_len ; i=i+1) begin
            for(j=0 ; j<vec_len ; j=j+1) begin
                // Avoid overflow random
                U_in[i][j][0             +:inst_sig_width] = $random(SEED);
                U_in[i][j][inst_sig_width+:inst_exp_width] = {$random(SEED)} % 120 + 60;

                W_in[i][j][inst_sig_width+:inst_exp_width] = $random(SEED);
                W_in[i][j][inst_sig_width+inst_exp_width]  = {$random(SEED)} % 120 + 60;

                V_in[i][j][inst_sig_width+:inst_exp_width] = $random(SEED);
                V_in[i][j][inst_sig_width+inst_exp_width]  = {$random(SEED)} % 120 + 60;
            end
        end

        // Data Random
        for(i=1 ; i<=ts_num ; i=i+1) begin
            for(j=0 ; j<vec_len ; j=j+1) begin
                // Avoid overflow random
                X_in[i][j][0             +:inst_sig_width] = $random(SEED);
                X_in[i][j][inst_sig_width+:inst_exp_width] = {$random(SEED)} % 3 + 127;
            end
        end

        for(j=0 ; j<vec_len ; j=j+1) begin
            // 1. value
            // 2. signed bit
            H_in[j] = 0;
            H_in[j][inst_sig_width+:inst_exp_width] = {$random(SEED)} % 3 + 127;
            H_in[j][inst_sig_width+inst_exp_width]  = {$random(SEED)} % 2;
        end
    end

    //-----------------
    // Transfer input
    //-----------------
    repeat(({$random(SEED)} % 3 + 2)) @(negedge clk);

    repeat(2)@(negedge clk);
    for(i=0 ; i<IN_NUM ; i=i+1) begin
        in_valid = 1'b1;
        weight_u = U_in[i/3  ][i%3];
        weight_w = W_in[i/3  ][i%3];
        weight_v = V_in[i/3  ][i%3];
        data_x   = X_in[i/3+1][i%3];
        if(i<vec_len) data_h = H_in[i];
        else          data_h = 'dx;
        @(negedge clk);
    end

    in_valid = 1'b0;
    weight_u = 'dx;
    weight_w = 'dx;
    weight_v = 'dx;
    data_x   = 'dx;
    data_h   = 'dx;
end endtask

//**************************************
//      Calculation Task
//**************************************
task cal_task; begin
    for(j=0 ; j<vec_len ; j=j+1) begin
        H_gold[0][j] = H_out_w[0][j];
    end
    for(i=1 ; i<=ts_num ; i=i+1) begin
        for(j=0 ; j<vec_len ; j=j+1) begin
            U_gold[i][j]   = U_out_w[i][j];
            W_gold[i][j]   = W_out_w[i][j];
            U_W_gold[i][j] = U_W_out_w[i][j];
            H_gold[i][j]   = H_out_w[i][j];
            V_gold[i][j]   = V_out_w[i][j];
            Y_gold[i][j]   = Y_out_w[i][j];
        end
    end
    dump_hex_task;
    dump_float_task;
end endtask

//**************************************
//      Wait Task
//**************************************
task wait_task; begin
    exe_lat = -1;
    while (out_valid !== 1) begin
        if (out !== 0) begin
            $display("                                           `:::::`                                                       ");
            $display("                                          .+-----++                                                      ");
            $display("                .--.`                    o:------/o                                                      ");
            $display("              /+:--:o/                   //-------y.          -//:::-        `.`                         ");
            $display("            `/:------y:                  `o:--::::s/..``    `/:-----s-    .:/:::+:                       ");
            $display("            +:-------:y                `.-:+///::-::::://:-.o-------:o  `/:------s-                      ");
            $display("            y---------y-        ..--:::::------------------+/-------/+ `+:-------/s                      ");
            $display("           `s---------/s       +:/++/----------------------/+-------s.`o:--------/s                      ");
            $display("           .s----------y-      o-:----:---------------------/------o: +:---------o:                      ");
            $display("           `y----------:y      /:----:/-------/o+----------------:+- //----------y`                      ");
            $display("            y-----------o/ `.--+--/:-/+--------:+o--------------:o: :+----------/o                       ");
            $display("            s:----------:y/-::::::my-/:----------/---------------+:-o-----------y.                       ");
            $display("            -o----------s/-:hmmdy/o+/:---------------------------++o-----------/o                        ");
            $display("             s:--------/o--hMMMMMh---------:ho-------------------yo-----------:s`                        ");
            $display("             :o--------s/--hMMMMNs---------:hs------------------+s------------s-                         ");
            $display("              y:-------o+--oyhyo/-----------------------------:o+------------o-                          ");
            $display("              -o-------:y--/s--------------------------------/o:------------o/                           ");
            $display("               +/-------o+--++-----------:+/---------------:o/-------------+/                            ");
            $display("               `o:-------s:--/+:-------/o+-:------------::+d:-------------o/                             ");
            $display("                `o-------:s:---ohsoosyhh+----------:/+ooyhhh-------------o:                              ");
            $display("                 .o-------/d/--:h++ohy/---------:osyyyyhhyyd-----------:o-                               ");
            $display("                 .dy::/+syhhh+-::/::---------/osyyysyhhysssd+---------/o`                                ");
            $display("                  /shhyyyymhyys://-------:/oyyysyhyydysssssyho-------od:                                 ");
            $display("                    `:hhysymmhyhs/:://+osyyssssydyydyssssssssyyo+//+ymo`                                 ");
            $display("                      `+hyydyhdyyyyyyyyyyssssshhsshyssssssssssssyyyo:`                                   ");
            $display("                        -shdssyyyyyhhhhhyssssyyssshssssssssssssyy+.    Output signal should be 0         ");
            $display("                         `hysssyyyysssssssssssssssyssssssssssshh+                                        ");
            $display("                        :yysssssssssssssssssssssssssssssssssyhysh-     when the out_valid is pulled down ");
            $display("                      .yyhhdo++oosyyyyssssssssssssssssssssssyyssyh/                                      ");
            $display("                      .dhyh/--------/+oyyyssssssssssssssssssssssssy:   at %4d ps                         ", $time*1000);
            $display("                       .+h/-------------:/osyyysssssssssssssssyyh/.                                      ");
            $display("                        :+------------------::+oossyyyyyyyysso+/s-                                       ");
            $display("                       `s--------------------------::::::::-----:o                                       ");
            $display("                       +:----------------------------------------y`                                      ");
            repeat(5) #(CYCLE);
            $finish;
        end
        if (exe_lat == DELAY) begin
            $display("                                   ..--.                                ");
            $display("                                `:/:-:::/-                              ");
            $display("                                `/:-------o                             ");
            $display("                                /-------:o:                             "); 
            $display("                                +-:////+s/::--..                        ");
            $display("    The execution latency      .o+/:::::----::::/:-.       at %-12d ps  ", $time*1000);
            $display("    is over %5d   cycles    `:::--:/++:----------::/:.                ", DELAY);
            $display("                            -+:--:++////-------------::/-               ");
            $display("                            .+---------------------------:/--::::::.`   ");
            $display("                          `.+-----------------------------:o/------::.  ");
            $display("                       .-::-----------------------------:--:o:-------:  ");
            $display("                     -:::--------:/yy------------------/y/--/o------/-  ");
            $display("                    /:-----------:+y+:://:--------------+y--:o//:://-   ");
            $display("                   //--------------:-:+ssoo+/------------s--/. ````     ");
            $display("                   o---------:/:------dNNNmds+:----------/-//           ");
            $display("                   s--------/o+:------yNNNNNd/+--+y:------/+            ");
            $display("                 .-y---------o:-------:+sso+/-:-:yy:------o`            ");
            $display("              `:oosh/--------++-----------------:--:------/.            ");
            $display("              +ssssyy--------:y:---------------------------/            ");
            $display("              +ssssyd/--------/s/-------------++-----------/`           ");
            $display("              `/yyssyso/:------:+o/::----:::/+//:----------+`           ");
            $display("             ./osyyyysssso/------:/++o+++///:-------------/:            ");
            $display("           -osssssssssssssso/---------------------------:/.             ");
            $display("         `/sssshyssssssssssss+:---------------------:/+ss               ");
            $display("        ./ssssyysssssssssssssso:--------------:::/+syyys+               ");
            $display("     `-+sssssyssssssssssssssssso-----::/++ooooossyyssyy:                ");
            $display("     -syssssyssssssssssssssssssso::+ossssssssssssyyyyyss+`              ");
            $display("     .hsyssyssssssssssssssssssssyssssssssssyhhhdhhsssyssso`             ");
            $display("     +/yyshsssssssssssssssssssysssssssssyhhyyyyssssshysssso             ");
            $display("    ./-:+hsssssssssssssssssssssyyyyyssssssssssssssssshsssss:`           ");
            $display("    /---:hsyysyssssssssssssssssssssssssssssssssssssssshssssy+           ");
            $display("    o----oyy:-:/+oyysssssssssssssssssssssssssssssssssshssssy+-          ");
            $display("    s-----++-------/+sysssssssssssssssssssssssssssssyssssyo:-:-         ");
            $display("    o/----s-----------:+syyssssssssssssssssssssssyso:--os:----/.        ");
            $display("    `o/--:o---------------:+ossyysssssssssssyyso+:------o:-----:        ");
            $display("      /+:/+---------------------:/++ooooo++/:------------s:---::        ");
            $display("       `/o+----------------------------------------------:o---+`        ");
            $display("         `+-----------------------------------------------o::+.         ");
            $display("          +-----------------------------------------------/o/`          ");
            $display("          ::----------------------------------------------:-            ");
            repeat(5) @(negedge clk);
            $finish; 
        end
        exe_lat = exe_lat + 1;
        @(negedge clk);
    end
end endtask

task check_task; begin
    out_lat = 0;
    i = 1;
    j = 0;
    while (out_valid === 1) begin
        if (out_lat == OUT_NUM) begin
            $display("                                                                                ");
            $display("                                                   ./+oo+/.                     ");
            $display("    Out cycles is more than %-2d                    /s:-----+s`     at %-12d ps ", OUT_NUM, $time*1000);
            $display("                                                  y/-------:y                   ");
            $display("                                             `.-:/od+/------y`                  ");
            $display("                               `:///+++ooooooo+//::::-----:/y+:`                ");
            $display("                              -m+:::::::---------------------::o+.              ");
            $display("                             `hod-------------------------------:o+             ");
            $display("                       ./++/:s/-o/--------------------------------/s///::.      ");
            $display("                      /s::-://--:--------------------------------:oo/::::o+     ");
            $display("                    -+ho++++//hh:-------------------------------:s:-------+/    ");
            $display("                  -s+shdh+::+hm+--------------------------------+/--------:s    ");
            $display("                 -s:hMMMMNy---+y/-------------------------------:---------//    ");
            $display("                 y:/NMMMMMN:---:s-/o:-------------------------------------+`    ");
            $display("                 h--sdmmdy/-------:hyssoo++:----------------------------:/`     ");
            $display("                 h---::::----------+oo+/::/+o:---------------------:+++s-`      ");
            $display("                 s:----------------/s+///------------------------------o`       ");
            $display("           ``..../s------------------::--------------------------------o        ");
            $display("       -/oyhyyyyyym:----------------://////:--------------------------:/        ");
            $display("      /dyssyyyssssyh:-------------/o+/::::/+o/------------------------+`        ");
            $display("    -+o/---:/oyyssshd/-----------+o:--------:oo---------------------:/.         ");
            $display("  `++--------:/sysssddy+:-------/+------------s/------------------://`          ");
            $display(" .s:---------:+ooyysyyddoo++os-:s-------------/y----------------:++.            ");
            $display(" s:------------/yyhssyshy:---/:o:-------------:dsoo++//:::::-::+syh`            ");
            $display("`h--------------shyssssyyms+oyo:--------------/hyyyyyyyyyyyysyhyyyy`            ");
            $display("`h--------------:yyssssyyhhyy+----------------+dyyyysssssssyyyhs+/.             ");
            $display(" s:--------------/yysssssyhy:-----------------shyyyyyhyyssssyyh.                ");
            $display(" .s---------------+sooosyyo------------------/yssssssyyyyssssyo                 ");
            $display("  /+-------------------:++------------------:ysssssssssssssssy-                 ");
            $display("  `s+--------------------------------------:syssssssssssssssyo                  ");
            $display("`+yhdo--------------------:/--------------:syssssssssssssssyy.                  ");
            $display("+yysyhh:-------------------+o------------/ysyssssssssssssssy/                   ");
            $display(" /hhysyds:------------------y-----------/+yyssssssssssssssyh`                   ");
            $display(" .h-+yysyds:---------------:s----------:--/yssssssssssssssym:                   ");
            $display(" y/---oyyyyhyo:-----------:o:-------------:ysssssssssyyyssyyd-                  ");
            $display("`h------+syyyyhhsoo+///+osh---------------:ysssyysyyyyysssssyd:                 ");
            $display("/s--------:+syyyyyyyyyyyyyyhso/:-------::+oyyyyhyyyysssssssyy+-                 ");
            $display("+s-----------:/osyyysssssssyyyyhyyyyyyyydhyyyyyyssssssssyys/`                   ");
            $display("+s---------------:/osyyyysssssssssssssssyyhyyssssssyyyyso/y`                    ");
            $display("/s--------------------:/+ossyyyyyyssssssssyyyyyyysso+:----:+                    ");
            $display(".h--------------------------:::/++oooooooo+++/:::----------o`                   ");
            repeat(5) @(negedge clk);
            $finish;
        end

        //====================
        // Check
        //====================
        your_vec[i][j] = out;
        out_check      = Y_gold[i][j];
        //convert_float(error_diff,       err_real);
        convert_float(out_check,  gold_real);
        convert_float(out, your_real);
        if(out_check !== 0) err_real = (your_real - gold_real) / gold_real;
        else                err_real = (your_real - gold_real);
        //if(error_diff !== 0 && up_flag == low_flag) begin
        if(err_real >= ERR_VAL || err_real <= -ERR_VAL) begin

            $display("Err is too large!!!                            /s:-----+s`     at %-12d ps   ", $time*1000);
            $display("The index of pixel is ( %-1d, %-1d )", i, j);
            $display("Your pixel is         %-50f", your_real);
            $display("Gold pixel is         %-50f", gold_real);
            $display("The value of error is %-10f", err_real);
            // repeat(5) @(negedge clk);
            // $finish;
        end

        if ( i<=ts_num && j<vec_len ) begin
            // Update index
            if ( i<=ts_num )  j=j+1;
            if ( j==vec_len ) begin
                i=i+1;
                j=0;
            end
        end
        out_lat = out_lat + 1;
        @(negedge clk);
    end

    if (out_lat<OUT_NUM) begin     
        $display("                                                                                ");
        $display("                                                   ./+oo+/.                     ");
        $display("    Out cycles is less than %-2d                    /s:-----+s`     at %-12d ps ", OUT_NUM, $time*1000);
        $display("                                                  y/-------:y                   ");
        $display("                                             `.-:/od+/------y`                  ");
        $display("                               `:///+++ooooooo+//::::-----:/y+:`                ");
        $display("                              -m+:::::::---------------------::o+.              ");
        $display("                             `hod-------------------------------:o+             ");
        $display("                       ./++/:s/-o/--------------------------------/s///::.      ");
        $display("                      /s::-://--:--------------------------------:oo/::::o+     ");
        $display("                    -+ho++++//hh:-------------------------------:s:-------+/    ");
        $display("                  -s+shdh+::+hm+--------------------------------+/--------:s    ");
        $display("                 -s:hMMMMNy---+y/-------------------------------:---------//    ");
        $display("                 y:/NMMMMMN:---:s-/o:-------------------------------------+`    ");
        $display("                 h--sdmmdy/-------:hyssoo++:----------------------------:/`     ");
        $display("                 h---::::----------+oo+/::/+o:---------------------:+++s-`      ");
        $display("                 s:----------------/s+///------------------------------o`       ");
        $display("           ``..../s------------------::--------------------------------o        ");
        $display("       -/oyhyyyyyym:----------------://////:--------------------------:/        ");
        $display("      /dyssyyyssssyh:-------------/o+/::::/+o/------------------------+`        ");
        $display("    -+o/---:/oyyssshd/-----------+o:--------:oo---------------------:/.         ");
        $display("  `++--------:/sysssddy+:-------/+------------s/------------------://`          ");
        $display(" .s:---------:+ooyysyyddoo++os-:s-------------/y----------------:++.            ");
        $display(" s:------------/yyhssyshy:---/:o:-------------:dsoo++//:::::-::+syh`            ");
        $display("`h--------------shyssssyyms+oyo:--------------/hyyyyyyyyyyyysyhyyyy`            ");
        $display("`h--------------:yyssssyyhhyy+----------------+dyyyysssssssyyyhs+/.             ");
        $display(" s:--------------/yysssssyhy:-----------------shyyyyyhyyssssyyh.                ");
        $display(" .s---------------+sooosyyo------------------/yssssssyyyyssssyo                 ");
        $display("  /+-------------------:++------------------:ysssssssssssssssy-                 ");
        $display("  `s+--------------------------------------:syssssssssssssssyo                  ");
        $display("`+yhdo--------------------:/--------------:syssssssssssssssyy.                  ");
        $display("+yysyhh:-------------------+o------------/ysyssssssssssssssy/                   ");
        $display(" /hhysyds:------------------y-----------/+yyssssssssssssssyh`                   ");
        $display(" .h-+yysyds:---------------:s----------:--/yssssssssssssssym:                   ");
        $display(" y/---oyyyyhyo:-----------:o:-------------:ysssssssssyyyssyyd-                  ");
        $display("`h------+syyyyhhsoo+///+osh---------------:ysssyysyyyyysssssyd:                 ");
        $display("/s--------:+syyyyyyyyyyyyyyhso/:-------::+oyyyyhyyyysssssssyy+-                 ");
        $display("+s-----------:/osyyysssssssyyyyhyyyyyyyydhyyyyyyssssssssyys/`                   ");
        $display("+s---------------:/osyyyysssssssssssssssyyhyyssssssyyyyso/y`                    ");
        $display("/s--------------------:/+ossyyyyyyssssssssyyyyyyysso+:----:+                    ");
        $display(".h--------------------------:::/++oooooooo+++/:::----------o`                   "); 
        // repeat(5) @(negedge clk);
        // $finish;
    end
    tot_lat = tot_lat + exe_lat;
end endtask

//**************************************
//      PASS Task
//**************************************
task pass_task; begin
    $display("Congratulation!!! \033[1;0m                                   ");
    $display("PASS This Lab........Maybe \033[1;0m                          ");
    $display("Total Latency : %-10d\033[1;0m                                ", tot_lat);

    repeat(5) @(negedge clk);
    $finish;
end endtask

endmodule


/*
    a0 a1 a2 | b0 | c0
    a3 a4 a5 | b1 | c1
    a6 a7 a8 | b2 | c2
*/

module Multi_float
#(  parameter inst_sig_width       = 23,
    parameter inst_exp_width       = 8,
    parameter inst_ieee_compliance = 1
)
(
    input  [inst_sig_width+inst_exp_width:0] a0, a1, a2, a3, a4, a5, a6, a7, a8,
    input  [inst_sig_width+inst_exp_width:0] b0, b1, b2,
    output [inst_sig_width+inst_exp_width:0] c0, c1, c2
);
    // Multiplication
    wire [inst_sig_width+inst_exp_width:0] pixel0, pixel1, pixel2, pixel3, pixel4, pixel5, pixel6, pixel7, pixel8;

    // a0 * b0
    DW_fp_mult#(inst_sig_width, inst_exp_width, inst_ieee_compliance)
        M0 (.a(a0), .b(b0), .rnd(3'd0), .z(pixel0));

    // a1 * b1
    DW_fp_mult#(inst_sig_width, inst_exp_width, inst_ieee_compliance)
        M1 (.a(a1), .b(b1), .rnd(3'd0), .z(pixel1));

    // a2 * b2
    DW_fp_mult#(inst_sig_width, inst_exp_width, inst_ieee_compliance)
        M2 (.a(a2), .b(b2), .rnd(3'd0), .z(pixel2));

    // a3 * b0
    DW_fp_mult#(inst_sig_width, inst_exp_width, inst_ieee_compliance)
        M3 (.a(a3), .b(b0), .rnd(3'd0), .z(pixel3));

    // a4 * b1
    DW_fp_mult#(inst_sig_width, inst_exp_width, inst_ieee_compliance)
        M4 (.a(a4), .b(b1), .rnd(3'd0), .z(pixel4));

    // a5 * b2
    DW_fp_mult#(inst_sig_width, inst_exp_width, inst_ieee_compliance)
        M5 (.a(a5), .b(b2), .rnd(3'd0), .z(pixel5));

    // a6 * b0
    DW_fp_mult#(inst_sig_width, inst_exp_width, inst_ieee_compliance)
        M6 (.a(a6), .b(b0), .rnd(3'd0), .z(pixel6));

    // a7 * b0
    DW_fp_mult#(inst_sig_width, inst_exp_width, inst_ieee_compliance)
        M7 (.a(a7), .b(b1), .rnd(3'd0), .z(pixel7));

    // a8 * b2
    DW_fp_mult#(inst_sig_width, inst_exp_width, inst_ieee_compliance)
        M8 (.a(a8), .b(b2), .rnd(3'd0), .z(pixel8));

    // Addition
    wire [inst_sig_width+inst_exp_width:0] add0, add1, add2;

    DW_fp_addsub#(inst_sig_width,inst_exp_width,inst_ieee_compliance)
        A0 (.a(pixel0), .b(pixel1), .op(1'd0), .rnd(3'd0), .z(add0));

    DW_fp_addsub#(inst_sig_width,inst_exp_width,inst_ieee_compliance)
        A1 (.a(add0), .b(pixel2), .op(1'd0), .rnd(3'd0), .z(c0));

    DW_fp_addsub#(inst_sig_width,inst_exp_width,inst_ieee_compliance)
        A2 (.a(pixel3), .b(pixel4), .op(1'd0), .rnd(3'd0), .z(add1));

    DW_fp_addsub#(inst_sig_width,inst_exp_width,inst_ieee_compliance)
        A3 (.a(add1), .b(pixel5), .op(1'd0), .rnd(3'd0), .z(c1));

    DW_fp_addsub#(inst_sig_width,inst_exp_width,inst_ieee_compliance)
        A4 (.a(pixel6), .b(pixel7), .op(1'd0), .rnd(3'd0), .z(add2));

    DW_fp_addsub#(inst_sig_width,inst_exp_width,inst_ieee_compliance)
        A5 (.a(add2), .b(pixel8), .op(1'd0), .rnd(3'd0), .z(c2));
endmodule

module ReLu
#(  parameter inst_sig_width       = 23,
    parameter inst_exp_width       = 8,
    parameter inst_ieee_compliance = 1,
    parameter inst_arch            = 0
)
(
    input  [inst_sig_width+inst_exp_width:0] in,
    output [inst_sig_width+inst_exp_width:0] out
);
    wire [inst_sig_width+inst_exp_width:0] float_0_1 = 32'h3DCCCCCD; // Actual value : 1.00000001490116119384765625E-1
    wire [inst_sig_width+inst_exp_width:0] neg_val;
    DW_fp_mult // 0.1x
    #(inst_sig_width,inst_exp_width,inst_ieee_compliance)
        M0 (.a(in), .b(float_0_1), .rnd(3'd0), .z(neg_val));
    assign out = in[inst_sig_width+inst_exp_width] ? neg_val : in;
endmodule

module Sigmoid
#(  parameter inst_sig_width       = 23,
    parameter inst_exp_width       = 8,
    parameter inst_ieee_compliance = 1,
    parameter inst_arch            = 0
)
(
    input  [inst_sig_width+inst_exp_width:0] in,
    output [inst_sig_width+inst_exp_width:0] out
);
    wire [inst_sig_width+inst_exp_width:0] float_gain1 = 32'h3F800000; // Activation 1.0
    wire [inst_sig_width+inst_exp_width:0] float_gain2 = 32'hBF800000; // Activation -1.0
    wire [inst_sig_width+inst_exp_width:0] x_neg;
    wire [inst_sig_width+inst_exp_width:0] exp;
    wire [inst_sig_width+inst_exp_width:0] deno;

    DW_fp_mult // -x
    #(inst_sig_width,inst_exp_width,inst_ieee_compliance)
        M0 (.a(in), .b(float_gain2), .rnd(3'd0), .z(x_neg));
    
    DW_fp_exp // exp(-x)
    #(inst_sig_width,inst_exp_width,inst_ieee_compliance, inst_arch)
        E0 (.a(x_neg), .z(exp));
    
    DW_fp_addsub // 1+exp(-x)
    #(inst_sig_width,inst_exp_width,inst_ieee_compliance)
        A0 (.a(float_gain1), .b(exp), .op(1'd0), .rnd(3'd0), .z(deno));
    
    DW_fp_div // 1 / [1+exp(-x)]
    #(inst_sig_width,inst_exp_width,inst_ieee_compliance, 0)
        D0 (.a(float_gain1), .b(deno), .rnd(3'd0), .z(out));
endmodule
