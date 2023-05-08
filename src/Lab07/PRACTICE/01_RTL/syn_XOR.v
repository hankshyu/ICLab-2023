`include "synchronizer.v"
module syn_XOR (IN,OUT,TX_CLK,RX_CLK,RST_N);
input IN;
input TX_CLK;
input RX_CLK;
input RST_N;
output OUT;
wire Y;
wire a;
reg P; 
reg Q;

xor g2 (a,IN,P);

always@(posedge TX_CLK or negedge RST_N)
begin
  if(!RST_N)
    P <= 0;
  else
    P <= a;  
end

synchronizer x1(.D(P),.Q(Y),.clk(RX_CLK),.rst_n(RST_N));

always@(posedge RX_CLK or negedge RST_N)
begin
  if(!RST_N)
    Q <= 0;
  else
    Q <= Y;  
end
xor g1 (OUT,Q,Y);


endmodule