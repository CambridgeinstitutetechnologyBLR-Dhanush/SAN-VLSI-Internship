
`timescale 1ns/1ps

module alu_tb;

reg [3:0] A;
reg [3:0] B;
reg [1:0] sel;
wire [3:0] Y;

integer tests_passed;

alu uut (
    .A(A),
    .B(B),
    .sel(sel),
    .Y(Y)
);

task check_result;
    input [3:0] expected;
    input [127:0] test_name;
    begin
        #1;
        if (Y !== expected) begin
            $display("FAIL: %0s | A=%0d B=%0d sel=%b Y=%0d expected=%0d",
                     test_name, A, B, sel, Y, expected);
            $fatal(1, "ALU verification failed");
        end else begin
            $display("PASS: %0s", test_name);
            tests_passed = tests_passed + 1;
        end
    end
endtask

initial begin
    $dumpfile("Level-2/Task-2-RTL-to-Synthesis/waveform/alu_tb.vcd");
    $dumpvars(0, alu_tb);

    tests_passed = 0;

    // Addition: 3 + 2 = 5
    A = 4'd3; B = 4'd2; sel = 2'b00;
    check_result(4'd5, "Addition");

    // Addition overflow: 15 + 1 wraps to 0
    A = 4'd15; B = 4'd1; sel = 2'b00;
    check_result(4'd0, "Addition overflow");

    // Subtraction: 7 - 3 = 4
    A = 4'd7; B = 4'd3; sel = 2'b01;
    check_result(4'd4, "Subtraction");

    // Subtraction underflow: 2 - 5 wraps to 13
    A = 4'd2; B = 4'd5; sel = 2'b01;
    check_result(4'd13, "Subtraction underflow");

    // AND: 1100 & 1010 = 1000
    A = 4'b1100; B = 4'b1010; sel = 2'b10;
    check_result(4'b1000, "Bitwise AND");

    // XOR: 1100 ^ 1010 = 0110
    A = 4'b1100; B = 4'b1010; sel = 2'b11;
    check_result(4'b0110, "Bitwise XOR");

    $display("--------------------------------");
    $display("Tests passed: %0d/6", tests_passed);
    $display("ALL ALU TESTS PASSED");
    $finish;
end

endmodule
