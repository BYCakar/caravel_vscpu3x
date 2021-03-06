// Takes a one-hot bit vector and returns a mask
// which masks-off all bits less significant than the set bit.  

//`default_nettype none

module Thermometer_Mask
#(
    parameter       WORD_WIDTH          = 0
)
(
    input   wire    [WORD_WIDTH-1:0]    bitvector,
    output  reg     [WORD_WIDTH-1:0]    mask
);

    initial begin
        mask = 0;
    end

    localparam zero = {WORD_WIDTH{1'b0}};

    always @(*) begin
        // Outputs 1 at the first set bit and all less significant (leftmost) bits.
        // Outputs 0 for all more significant (rightmost) bits.
        // Outputs all 1's if no bit set.

        mask = bitvector ^ (bitvector - 1);

        // Invert mask to instead mask-off the set bit and the less significant bits
        // Don't invert mask if no bit set (don't want an all-zero mask)

        mask = (bitvector == zero) ? mask : ~mask;

        // Re-add set bit, so it and the more significant (rightmost) bits pass.

        mask = mask | bitvector;
    end

endmodule
