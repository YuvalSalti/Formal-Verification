// substructor formal file

`default_nettype none
`timescale 1us/100 ns

`include "substructor.v"

module substructor_formal(
    input logic [63:0] a,
    input logic [63:0] b,
    output logic [63:0] y
);

substructor substructor(
    .a(a),
    .b(b),
    .y(y)
);

always @(*) begin
    assert(y == a - b);
    cover( y == 64'hAAAA);
end

endmodule
