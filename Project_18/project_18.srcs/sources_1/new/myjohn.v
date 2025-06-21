/*module dff(input clk,din,rst,output q,q_bar);
reg [1:0]temp;
always@(posedge clk or posedge rst)begin
if(rst==1'b1)begin
temp[1]<=1'b0;
temp[0]<=1'b0;
end
else begin
temp[1]<=din;
temp[0]<=~din;
end
end
assign q=temp[1];
assign q_bar=temp[0];
endmodule

module john(input clk,rst,output [3:0]t);
wire [3:0]t_bar;
dff a(clk,t_bar[0],rst,t[3],t_bar[3]);
dff b(clk,t[3],rst,t[2],t_bar[2]);
dff c(clk,t[2],rst,t[1],t_bar[1]);
dff d(clk,t[1],rst,t[0],t_bar[0]);
endmodule*/

/*module dff(input clk, input din, output reg q, output q_bar);
  assign q_bar = ~q;
    initial begin
      q <= din;
  end
endmodule
module john(input clk, output [3:0] r);
  wire [3:0]t, t_bar;

  dff d3(clk, t_bar[0], t[3], t_bar[3]);
  dff d2(clk, t[3],t[2], t_bar[2]);
  dff d1(clk, t[2],t[1], t_bar[1]);
  dff d0(clk, t[1], t[0], t_bar[0]);

  assign r=t;
endmodule*/

module d_ff (output reg Q, input D, input clk, input rst);
  // D flip-flop

  

  always @(posedge clk or posedge rst) begin
    if (rst) Q <= 1'b0;  // Reset on rising edge of rst
    else Q <= D;
  end
endmodule

module four_bit_johnson_counter (output [3:0] Q, input clk, input rst);
  // 4-bit Johnson counter
  wire [3:0] D,Q_bar0,Q_bar1,Q_bar2,Q_bar3;
  // Instantiate four D flip-flops
  d_ff ff0 (Q[0], D[0], clk, rst);
  d_ff ff1 (Q[1], D[1], clk, rst);
  d_ff ff2 (Q[2], D[2], clk, rst);
  d_ff ff3 (Q[3], D[3], clk, rst);
  // Connect the D inputs for the Johnson sequence
  assign D[0] = ~Q[3]; // D0 = Q3 (inverted)
  assign D[1] = Q[0]; // D1 = Q0
  assign D[2] = Q[1]; // D2 = Q1
  assign D[3] = Q[2]; // D3 = Q2
endmodule
