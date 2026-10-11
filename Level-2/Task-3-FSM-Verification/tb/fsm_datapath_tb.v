
`timescale 1ns/1ps

module fsm_datapath_tb;

    reg clk;
    reg rst;
    reg start;
    reg [3:0] data_in;

    wire [3:0] data_out;
    wire done;
    wire [2:0] state;

    integer tests_passed;

    localparam IDLE    = 3'b000;
    localparam LOAD    = 3'b001;
    localparam PROCESS = 3'b010;
    localparam DONE    = 3'b011;

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
        clk = 0;
        rst = 0;
        start = 0;
        data_in = 0;
        tests_passed = 0;

        // Test 1: Reset
        rst = 1;
        #2;
        assert (state === IDLE && data_out === 4'd0 && done === 1'b0)
            else $fatal(1, "FAIL: Reset test");
        tests_passed = tests_passed + 1;
        $display("PASS: Reset test");

        @(negedge clk);
        rst = 0;

        // Test 2: IDLE -> LOAD
        start = 1;
        @(posedge clk);
        #1;
        assert (state === LOAD)
            else $fatal(1, "FAIL: IDLE to LOAD transition");
        tests_passed = tests_passed + 1;
        $display("PASS: IDLE to LOAD transition");

        // Test 3: LOAD -> PROCESS, load input data
        @(negedge clk);
        start = 0;
        data_in = 4'd5;

        @(posedge clk);
        #1;
        assert (state === PROCESS && data_out === 4'd5)
            else $fatal(1, "FAIL: LOAD state or data capture");
        tests_passed = tests_passed + 1;
        $display("PASS: LOAD state and data capture");

        // Test 4: PROCESS -> DONE, increment data
        @(posedge clk);
        #1;
        assert (state === DONE && data_out === 4'd6)
            else $fatal(1, "FAIL: PROCESS state or data increment");
        tests_passed = tests_passed + 1;
        $display("PASS: PROCESS state and data increment");

        // Test 5: DONE -> IDLE, assert done
        @(posedge clk);
        #1;
        assert (state === IDLE && done === 1'b1)
            else $fatal(1, "FAIL: DONE state or done signal");
        tests_passed = tests_passed + 1;
        $display("PASS: DONE state and done signal");

        // Test 6: Invalid-state recovery
        @(negedge clk);
        force uut.state = 3'b111;

        @(negedge clk);
        release uut.state;

        @(posedge clk);
        #1;
        assert (state === IDLE && data_out === 4'd0 && done === 1'b0)
            else $fatal(1, "FAIL: Invalid-state recovery");
        tests_passed = tests_passed + 1;
        $display("PASS: Invalid-state recovery");

        $display("Tests passed: %0d/6", tests_passed);
        $display("ALL FSM TESTS PASSED");

        $finish;
    end

    initial begin
        $dumpfile("Level-2/Task-3-FSM-Verification/waveform/fsm_datapath.vcd");
        $dumpvars(0, fsm_datapath_tb);
    end

    initial begin
        #500;
        $fatal(1, "FAIL: Testbench timeout");
    end

endmodule
