// substructor file

`ifndef _substructor_vh_
`define _substructor_vh_

`default_nettype none
`timescale 1us/100 ns

module substructor(
    input logic [63:0] a,
    input logic [63:0] b,
    output logic [63:0] y
);

	// subtruct: y = a - b
	assign y = a + (~b + 1);
	//assign y = a + (~b); // error line exmp
endmodule

`endif // _substructor_vh_

