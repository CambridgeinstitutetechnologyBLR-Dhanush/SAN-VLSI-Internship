module logic_blocks_tb;

reg a;
reg b;

reg i0;
reg i1;
reg s;

wire and_y;
wire or_y;
wire xor_y;
wire nand_y;
wire mux_y;

and_gate dut_and (
    .a(a),
    .b(b),
    .y(and_y)
);

or_gate dut_or (
    .a(a),
    .b(b),
    .y(or_y)
);

xor_gate dut_xor (
    .a(a),
    .b(b),
    .y(xor_y)
);

nand_gate dut_nand (
    .a(a),
    .b(b),
    .y(nand_y)
);

mux_2to1 dut_mux (
    .i0(i0),
    .i1(i1),
    .s(s),
    .y(mux_y)
);

initial begin

    $dumpfile("waveform/logic_blocks.vcd");
    $dumpvars(0, logic_blocks_tb);

    $monitor("Time=%0t | a=%b b=%b | AND=%b OR=%b XOR=%b NAND=%b | i0=%b i1=%b s=%b MUX=%b",
             $time, a, b, and_y, or_y, xor_y, nand_y, i0, i1, s, mux_y);

    // Initialize MUX inputs
    i0 = 0;
    i1 = 1;
    s = 0;

    // Test AND, OR, XOR, NAND
    a = 0;
    b = 0;
    #10;

    a = 0;
    b = 1;
    #10;

    a = 1;
    b = 0;
    #10;

    a = 1;
    b = 1;
    #10;

    // Test 2:1 MUX
    s = 0;
    #10;

    s = 1;
    #10;

    $finish;

end

endmodule