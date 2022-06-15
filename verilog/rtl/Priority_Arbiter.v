// Simple priority arbiter.
// Returns the LSB set, where bit 0 has highest priority

//`default_nettype none

module Priority_Arbiter
#(
    parameter       WORD_WIDTH          = 0
)
(
    input   wire    [WORD_WIDTH-1:0]    requests,
    output  reg     [WORD_WIDTH-1:0]    grant
);

    initial begin
        grant = 0;
    end

    always @(*) begin
        grant = requests & -requests;
    end

endmodule
