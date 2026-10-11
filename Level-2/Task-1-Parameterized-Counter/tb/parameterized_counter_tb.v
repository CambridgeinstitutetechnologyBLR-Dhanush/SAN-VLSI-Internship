
`timescale 1ns/1ps

module parameterized_counter_tb;

reg clk;
reg rst;
reg en;

wire [3:0] count4;
wire [7:0] count8;

// 4-bit counter instance
parameterized_counter #(
    .WIDTH(4)
) uut4 (
    .clk(clk),
    .rst(rst),
    .en(en),
    .count(count4)
);

// 8-bit counter instance
parameterized_counter #(
    .WIDTH(8)
) uut8 (
    .clk(clk),
    .rst(rst),
    .en(en),
    .count(count8)
);

// 10 ns clock period
always #5 clk = ~clk;

initial begin
    $dumpfile("Level-2/Task-1-Parameterized-Counter/waveform/parameterized_counter.vcd");
    $dumpvars(0, parameterized_counter_tb);

    clk = 0;
    rst = 1;
    en = 0;

    // Test asynchronous reset
    #2;
    if (count4 !== 4'd0 || count8 !== 8'd0)
        $fatal(1, "FAIL: Reset test");

    $display("PASS: Reset test");

    // Release reset and enable counting
    @(negedge clk);
    rst = 0;
    en = 1;

    // Check first increment
    @(posedge clk);
    #1;
    if (count4 !== 4'd1 || count8 !== 8'd1)
        $fatal(1, "FAIL: First increment");

    $display("PASS: WIDTH=4 and WIDTH=8 first increment");

    // Count for additional clock cycles
    repeat (9) begin
        @(posedge clk);
        #1;
    end

    if (count4 !== 4'd10 || count8 !== 8'd10)
        $fatal(1, "FAIL: Counting test");

    $display("PASS: WIDTH=4 and WIDTH=8 counting");

    // Verify enable hold
    @(negedge clk);
    en = 0;

    repeat (2) @(posedge clk);
    #1;

    if (count4 !== 4'd10 || count8 !== 8'd10)
        $fatal(1, "FAIL: Enable hold test");

    $display("PASS: Enable hold test");

    // Verify reset clears both counters
    @(negedge clk);
    rst = 1;
    #1;

    if (count4 !== 4'd0 || count8 !== 8'd0)
        $fatal(1, "FAIL: Reset after counting");

    $display("PASS: Reset after counting");

    $display("ALL TESTS PASSED");
    $finish;
end

endmodule
