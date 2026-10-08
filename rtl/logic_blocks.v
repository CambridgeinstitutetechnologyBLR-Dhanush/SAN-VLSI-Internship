module and_gate(
    input a,
    input b,
    output y
);

assign y = a & b;

endmodule

module or_gate(
    input a,
    input b,
    output y
);

assign y = a | b;

endmodule

module xor_gate(
    input a,
    input b,
    output y
);

assign y = a ^ b;

endmodule

module nand_gate(
    input a,
    input b,
    output y
);

assign y = ~(a & b);

endmodule

module mux_2to1(
    input i0,
    input i1,
    input s,
    output y
);

assign y = s ? i1 : i0;

endmodule