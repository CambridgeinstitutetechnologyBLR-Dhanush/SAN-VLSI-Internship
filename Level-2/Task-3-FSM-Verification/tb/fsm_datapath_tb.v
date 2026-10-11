`timescale 1ns/1ps

module fsm_datapath_tb;

reg clk;
reg rst;
reg start;
reg [3:0] data_in;

wire [3:0] data_out;
wire done;
wire [1:0] state;

fsm_datapath uut (
    .clk(clk),
    .rst(rst),
    .start(start),
    .data_in(data_in),
    .data_out(data_out),
    .done(done),
    .state(state)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("Level-2/Task-3-FSM-Verification/waveform/fsm_datapath.vcd");
    $dumpvars(0, fsm_datapath_tb);

    clk = 0;
    rst = 1;
    start = 0;
    data_in = 4'd0;

    // Test reset
    #12;
    if (state !== 2'b00 || data_out !== 4'd0)
        $fatal(1, "FAIL: Reset test");

    rst = 0;

    // Start the transaction
    @(negedge clk);
    data_in = 4'd5;
    start = 1;

    @(negedge clk);
    start = 0;

    // LOAD
    @(negedge clk);
    if (data_out !== 4'd5)
        $fatal(1, "FAIL: LOAD test");

    // PROCESS
    @(negedge clk);
    if (data_out !== 4'd6)
        $fatal(1, "FAIL: PROCESS test");

    // DONE
    @(negedge clk);
    if (done !== 1'b1)
        $fatal(1, "FAIL: DONE test");

    $display("PASS: Reset, LOAD, PROCESS and DONE tests");

    // Invalid-state recovery test
   @(negedge clk);
force uut.state = 2'bxx;
@(negedge clk);
release uut.state;

// Allow the FSM to process the invalid state
@(negedge clk);
#1;

if (state !== 2'b00 || data_out !== 4'd0)
    $fatal(1, "FAIL: Invalid-state recovery");

$display("PASS: Invalid-state recovery test");

    $finish;
end

endmodule
