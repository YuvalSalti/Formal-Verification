// counter_64_bit file

`ifndef _counter_64_bit_
`define _counter_64_bit_

`default_nettype none
`timescale 1ns/1ps

module counter_64_bit (
    input  logic clk,
    input  logic rst,
    input  logic wen,             // Write Enable
    input  logic load,            // Load Enable
    input  logic [63:0] din,      // Data input for loading
    output logic [63:0] count     // Counter output
);

    logic [63:0] r;
    assign count = r;
    always @(posedge clk) begin
        if (rst)
            r <= 64'b0;        // Reset the counter to 0
        else if (load)
            r <= din;          // Load external value
        else if (wen)
            r <= count + 1;    // Increment only when write enabled
    end
endmodule

`endif // _counter_64_bit_