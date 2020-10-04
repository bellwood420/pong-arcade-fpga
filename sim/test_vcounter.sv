module test_vcounter();
  timeunit 1ns; timeprecision 1ns;

  logic CLK_DRV;
  logic CLK;
  logic _256V_N;
  logic VRESET, VRESET_N;

  logic [8:0] vcnt;

  vcounter dut(._1V(vcnt[0]), ._2V(vcnt[1]), ._4V(vcnt[2]), ._8V(vcnt[3]),
               ._16V(vcnt[4]), ._32V(vcnt[5]), ._64V(vcnt[6]), ._128V(vcnt[7]),
               ._256V(vcnt[8]), .*);

  initial begin
    CLK_DRV <= 0;
    CLK <= 0;
    forever #50  CLK_DRV <= ~CLK_DRV;
  end

  always @(posedge CLK_DRV) begin
    CLK <= ~CLK;
  end

  initial begin
    // vreset_n ff should be initialized to run simulation
          force   dut.SN7474_E7a.CLR_N = 1;
    #10   force   dut.SN7474_E7a.CLR_N = 0;
    #100  force   dut.SN7474_E7a.CLR_N = 1;
          release dut.SN7474_E7a.CLR_N;

    // run until full counts
    #60000

    $finish;
  end

endmodule
