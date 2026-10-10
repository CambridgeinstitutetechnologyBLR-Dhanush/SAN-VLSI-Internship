`timescale 1ns/1ps

module counter_tb;

reg clk = 0;
reg rst = 0;
reg en = 0;
reg clear = 0;
wire [3:0] count;

counter dut (
    .clk(clk),
    .rst(rst),
    .en(en),
    .clear(clear),
    .count(count)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("waveform/counter.vcd");
    $dumpvars(0, counter_tb);

    $monitor("time=%0t rst=%b clear=%b en=%b count=%0d",
             $time, rst, clear, en, count);

    // Test asynchronous reset
    rst = 1;
    #2;
    rst = 0;

    // Test counting
    en = 1;
    repeat (5) @(negedge clk);

    // Test hold behavior
    en = 0;
    repeat (2) @(negedge clk);

    // Test synchronous clear
    en = 1;
    repeat (2) @(negedge clk);
    clear = 1;
    @(negedge clk);
    clear = 0;

    // Verify counting resumes
    repeat (3) @(negedge clk);

    #1;
    $finish;
end

endmodule