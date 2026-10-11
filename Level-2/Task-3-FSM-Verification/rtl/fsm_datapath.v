`timescale 1ns/1ps

module fsm_datapath (
    input clk,
    input rst,
    input start,
    input [3:0] data_in,
    output reg [3:0] data_out,
    output reg done,
    output reg [1:0] state
);

localparam IDLE    = 2'b00;
localparam LOAD    = 2'b01;
localparam PROCESS = 2'b10;
localparam DONE    = 2'b11;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        state    <= IDLE;
        data_out <= 4'b0000;
        done     <= 1'b0;
    end else begin
        done <= 1'b0;

        case (state)
            IDLE: begin
                if (start)
                    state <= LOAD;
            end

            LOAD: begin
                data_out <= data_in;
                state <= PROCESS;
            end

            PROCESS: begin
                data_out <= data_out + 1'b1;
                state <= DONE;
            end

            DONE: begin
                done <= 1'b1;
                state <= IDLE;
            end

            default: begin
                state    <= IDLE;
                data_out <= 4'b0000;
                done     <= 1'b0;
            end
        endcase
    end
end

endmodule
