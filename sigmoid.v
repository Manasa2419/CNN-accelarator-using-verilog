module sigmoid #(parameter N = 16)(
    input wire [N-1:0] x,
    output wire [N-1:0] y
);
    assign y = 1 / (1 + (x >>> 4)); // Approximate sigmoid using bit-shift
endmodule

