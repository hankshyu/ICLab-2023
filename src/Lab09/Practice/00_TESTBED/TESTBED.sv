`timescale 1ns/100ps

`include "Usertype_PKG.sv"
`include "INF.sv"
`include "PATTERN.sv"

`ifdef RTL
  `include "CM.sv"
`endif

`ifdef GATE
  `include "CM_SYN.v"
  `include "CM_Wrapper.sv"
`endif

// Connect interface here
module TESTBED;
  parameter simulation_cycle = 5;

  // import usertype::*;
  reg  SystemClock;

  INF  inf(SystemClock);
  PATTERN test_p(.clk(SystemClock), .inf(/*You need to fill this blank*/));
  
  `ifdef RTL
	CM dut(.clk(SystemClock), .inf(/*You need to fill this blank*/) );
  `endif
  
  `ifdef GATE
	CM_svsim dut(.clk(SystemClock), .inf(/*You need to fill this blank*/) );
  `endif

  
//------ Generate Clock ------------
  initial begin
    SystemClock = 0;
	#30
    forever begin
      #(simulation_cycle/2.0)
        SystemClock = ~SystemClock;
    end
  end
  
//------ Dump VCD File ------------  
initial begin
  `ifdef RTL
    $fsdbDumpfile("CM.fsdb");
    $fsdbDumpvars(0,"+all");
    $fsdbDumpSVA;
    // $fsdbDumpvars(0,"+struct"|"+mda");
    // $fsdbDumpvars(0,"+struct");
    // $fsdbDumpvars(0,"+mda");
  `elsif GATE
    $fsdbDumpfile("CM_SYN.fsdb");
    $sdf_annotate("CM_SYN.sdf",dut.CM);      
    $fsdbDumpvars(0,"+all");
    //	  $fsdbDumpvars();
  `endif
end
  
endmodule
