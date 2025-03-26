`ifndef VERILATOR
module testbench;
  reg [4095:0] vcdfile;
  reg clock;
`else
module testbench(input clock, output reg genclock);
  initial genclock = 1;
`endif
  reg genclock = 1;
  reg [31:0] cycle = 0;
  wire [0:0] PI_clk = clock;
  reg [0:0] PI_rst;
  reg [0:0] PI_load;
  reg [63:0] PI_din;
  reg [0:0] PI_wen;
  counter_64_bit_formal UUT (
    .clk(PI_clk),
    .rst(PI_rst),
    .load(PI_load),
    .din(PI_din),
    .wen(PI_wen)
  );
`ifndef VERILATOR
  initial begin
    if ($value$plusargs("vcd=%s", vcdfile)) begin
      $dumpfile(vcdfile);
      $dumpvars(0, testbench);
    end
    #5 clock = 0;
    while (genclock) begin
      #5 clock = 0;
      #5 clock = 1;
    end
  end
`endif
  initial begin
`ifndef VERILATOR
    #1;
`endif
    // UUT.$auto$async2sync.\cc:101:execute$105  = 1'b0;
    // UUT.$auto$async2sync.\cc:101:execute$111  = 1'b0;
    // UUT.$auto$async2sync.\cc:101:execute$117  = 1'b0;
    // UUT.$auto$async2sync.\cc:101:execute$123  = 1'b0;
    // UUT.$auto$async2sync.\cc:101:execute$129  = 1'b0;
    // UUT.$auto$async2sync.\cc:110:execute$109  = 1'b1;
    // UUT.$auto$async2sync.\cc:110:execute$115  = 1'b1;
    // UUT.$auto$async2sync.\cc:110:execute$121  = 1'b1;
    // UUT.$auto$async2sync.\cc:110:execute$127  = 1'b1;
    // UUT.$auto$async2sync.\cc:110:execute$133  = 1'b1;
    // UUT.$auto$async2sync.\cc:110:execute$99  = 1'b1;
    UUT._witness_.anyinit_procdff_82 = 1'b0;
    UUT._witness_.anyinit_procdff_83 = 1'b0;
    UUT._witness_.anyinit_procdff_84 = 1'b0;
    UUT._witness_.anyinit_procdff_85 = 64'b0000000000000000000000000000000000000000000000000000000000000000;
    UUT._witness_.anyinit_procdff_86 = 1'b0;
    UUT._witness_.anyinit_procdff_87 = 1'b0;
    UUT._witness_.anyinit_procdff_88 = 1'b0;
    UUT._witness_.anyinit_procdff_89 = 64'b0000000000000000000000000000000000000000000000000000000000000000;
    UUT._witness_.anyinit_procdff_90 = 1'b0;
    UUT._witness_.anyinit_procdff_91 = 1'b0;
    UUT._witness_.anyinit_procdff_92 = 64'b0000000000000000000000000000000000000000000000000000000000000000;
    UUT._witness_.anyinit_procdff_93 = 1'b0;
    UUT.counter_64_bit.r = 64'b1101111010101101101111101110111111001010111111101011101010111110;
    UUT.past_valid = 1'b0;

    // state 0
    PI_rst = 1'b0;
    PI_load = 1'b0;
    PI_din = 64'b0000000000000000000000000000000000000000000000000000000000000000;
    PI_wen = 1'b0;
  end
  always @(posedge clock) begin
    // state 1
    if (cycle == 0) begin
      PI_rst <= 1'b0;
      PI_load <= 1'b0;
      PI_din <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
      PI_wen <= 1'b0;
    end

    genclock <= cycle < 1;
    cycle <= cycle + 1;
  end
endmodule
