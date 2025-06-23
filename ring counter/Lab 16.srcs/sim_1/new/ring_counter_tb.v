`timescale 1ns / 1ps



module ring_counter_tb;

reg clk,clear,preset; wire [7:0]q;
ring_counter dut(clk,clear,preset,q);
initial begin
clk=0;
clear=0;preset=1;
#10 clear=0;preset=0;
#100 clear=1;preset=0;
#10 clear=1;preset=1;
#10 ;
$finish;
end


always begin
#5 clk=~clk;
end
endmodule
