`timescale 1ns / 1ps


module LFSR_counter(
    input CLK,
    input RESET,
    output reg [7:0] out
);

always @(posedge CLK or posedge RESET) begin
    if (RESET)
        out <= 8'b11111111;  // All DFFs start at 1
    else begin
        out[7] <= out[6];
        out[6] <= out[5];
        out[5] <= out[4];
        out[4] <= out[3] ^ out[7];
        out[3] <= out[2] ^ out[7];
        out[2] <= out[1] ^ out[7];
        out[1] <= out[0];
        out[0] <= out[7];
    end
end

endmodule

