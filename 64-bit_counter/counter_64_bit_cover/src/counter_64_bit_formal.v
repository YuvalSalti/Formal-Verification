// counter_64_bit_formal file

`default_nettype none
`timescale 1ns/1ps

`include "counter_64_bit.v"

module counter_64_bit_formal (
    input  logic clk,
    input  logic rst,
    input  logic wen,
    input  logic load,
    input  logic [63:0] din,
    output logic [63:0] count
); 

// Instantiate the 64-bit counter
counter_64_bit counter_64_bit(
.clk(clk),
.rst(rst),
.wen(wen),
.load(load),
.din(din),
.count(count)
);

// Track whether the clock has started
logic past_valid;
initial  assume(past_valid == 0);
always @(posedge clk) past_valid <= 1;

// BMC: Ensure reset sets count to 0
always @(posedge clk) begin
	if (past_valid && $past(rst))
	    assert(count == 64'b0);
end

// BMC: If load is active, count should take `din`
always @(posedge clk) begin
	if (past_valid && !$past(rst) && $past(load))    
	    assert(count == $past(din));
end

// BMC: If load is inactive and write enable (`wen`) is high, counter increments
always @(posedge clk) begin
	if (past_valid && !$past(rst) && !$past(load) && $past(wen))
	    assert(count == $past(count) + 1);
end

// BMC: If `wen` is low, counter should remain unchanged
    always @(posedge clk) begin
        if (past_valid && !$past(rst) && !$past(load) && !$past(wen))
            assert(count == $past(count));
    end

 // Cover Mode: Can the counter reach 64'hDEADBEEFCAFEBABE?
    //cover (count == 64'hDEADBEEFCAFEBABE);
    always @(posedge clk) begin
        cover  (count == 64'hDEADBEEFCAFEBABE);
    end
    
 // Prove Mode: Ensure the counter never exceeds its 64-bit limit
    always @(posedge clk) begin
        assert(count <= 64'hFFFFFFFFFFFFFFFF);
    end
endmodule
