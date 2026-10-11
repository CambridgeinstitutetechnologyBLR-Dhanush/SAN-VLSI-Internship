`timescale 1ns/1ps

module counter (
    input clk,
    input rst,
    input en,
    input clear,
    input load,
    input [3:0] load_data,
    output reg [3:0] count
);

always @(posedge clk or posedge rst) begin
    if (rst)
        count <= 4'b0000;
    else if (clear)
        count <= 4'b0000;
    else if (load)
        count <= load_data;
    else if (en)
        count <= count + 1'b1;
end

endmodule
