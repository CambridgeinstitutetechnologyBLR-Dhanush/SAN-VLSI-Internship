
`timescale 1ns/1ps

module counter_register_tb;

    reg clk;
    reg rst;
    reg en;
    reg [3:0] d;

    wire [3:0] count;
    wire [3:0] q;

    // Instantiate the counter
    counter counter_inst (
        .clk(clk),
        .rst(rst),
        .en(en),
        .q(count)
    );

    // Instantiate the register
    register_4bit register_inst (
        .clk(clk),
        .rst(rst),
        .en(en),
        .d(d),
        .q(q)
    );

    // Generate a clock with a 10 ns period
    always #5 clk = ~clk;

    initial begin
        $dumpfile("waveform/counter_register.vcd");
        $dumpvars(0, counter_register_tb);

        clk = 0;
        rst = 1;
        en = 0;
        d = 4'd0;

        // Apply reset
        #12;
        rst = 0;

        // Enable counting and load register data
        en = 1;
        d = 4'd5;
        #20;

        // Disable both modules
        en = 0;
        d = 4'd9;
        #20;

        // Enable again
        en = 1;
        d = 4'd12;
        #20;

        // Test reset while simulation is running
        rst = 1;
        #10;
        rst = 0;

        // Test counter wraparound naturally
        rst = 1;
        #2;
        rst = 0;
        en = 1;
        d = 4'd0;

        repeat (16) begin
            @(posedge clk);
            #1;
            $display("Counter boundary test: count = %0d", count);
        end

@(posedge clk);
#1;
$display("Counter wraparound test: count = %0d", count);
    end

    initial begin
        $monitor(
            "time=%0t rst=%b en=%b d=%d count=%d q=%d",
            $time, rst, en, d, count, q
        );
    end

endmodule
