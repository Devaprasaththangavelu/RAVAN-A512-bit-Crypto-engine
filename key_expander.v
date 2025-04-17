module key_expander_32to256 (
    input  wire [31:0] key,
    input  wire [31:0] stage,
    output wire [255:0] expanded_key
);

    assign expanded_key = {
        key,                                   // Chunk 0
        key ^ stage,                           // Chunk 1
        key ^ {stage[15:0], stage[31:16]},     // Chunk 2 - swapped halves
        key ^ ~stage,                          // Chunk 3 - inverted stage
        key ^ {stage[23:0], stage[31:24]},     // Chunk 4 - rotated left 8
        key ^ (stage << 1),                    // Chunk 5 - stage left shift
        key ^ (stage >> 3),                    // Chunk 6 - stage right shift
        key ^ (stage ^ 32'hA5A5A5A5)           // Chunk 7 - stage mixed with constant
    };

endmodule
