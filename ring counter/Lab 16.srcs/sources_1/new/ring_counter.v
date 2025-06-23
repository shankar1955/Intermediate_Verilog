`timescale 1ns / 1ps


module ring_counter
#(parameter N = 8)(
    input clk,
    input clear,    // Asynchronous clear
    input preset,   // Asynchronous preset
    output reg [N-1:0] q
);
    integer i;

    always @(posedge clk or posedge clear or posedge preset) begin
        if (clear && ~preset)
            q <= {N{1'b0}};   // Asynchronous clear
        else if (preset && ~clear)
            q <= {{(N-1){1'b0}}, 1'b1};  // Initialize with 00000001
        else if(preset && clear)
            q<={N{1'bx}};
        else begin
            q <= {q[N-2:0], q[N-1]};   // Ring shift: left shift with feedback
        end
    end
endmodule
