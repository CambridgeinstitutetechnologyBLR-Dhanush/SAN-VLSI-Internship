`timescale 1ns/1ps

module parameterized_counter_tb;

reg clk;
reg rst;
reg en;
wire [3:0] count;

parameterized_counter #(.WIDTH(4)) uut (
    .clk(clk),
    .rst(rst),
    .en(en),
    .count(count)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("Level-2/Task-1-Parameterized-Counter/waveform/parameterized_counter.vcd");
    $dumpvars(0, parameterized_counter_tb);

    clk = 0;
    rst = 1;
    en = 0;

    #10;
    rst = 0;
    en = 1;

    #100;
    en = 0;

    #20;
    rst = 1;

    #10;
    rst = 0;

    #10;
    $finish;
end

initial begin
    $monitor("Time=%0t rst=%b en=%b count=%d",
             $time, rst, en, count);
end

endmodule