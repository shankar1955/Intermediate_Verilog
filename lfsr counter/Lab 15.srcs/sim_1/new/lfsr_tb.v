`timescale 1ns / 1ps

module lfsr_tb();

reg CLK, RESET;
wire [7:0] out;

LFSR_counter uut(CLK, RESET, out);

initial begin
  CLK = 0;
  RESET = 1;
  #10 RESET = 0;       // Deassert reset after 10ns
  #100 $finish;
end

always #5 CLK = ~CLK;

initial begin
  $monitor("Time = %0t | out = %b", $time, out);
end

endmodule