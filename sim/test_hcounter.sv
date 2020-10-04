module test_hcounter();
  timeunit 1ns; timeprecision 1ns;

  logic CLK_DRV;
  logic CLK;
  logic _256H_N;
  logic HRESET, HRESET_N;

  logic [8:0] hcnt;

  hcounter dut(._1H(hcnt[0]), ._2H(hcnt[1]), ._4H(hcnt[2]), ._8H(hcnt[3]),
               ._16H(hcnt[4]), ._32H(hcnt[5]), ._64H(hcnt[6]), ._128H(hcnt[7]),
               ._256H(hcnt[8]), .*);

  initial begin
    CLK_DRV <= 0;
    CLK <= 0;
    forever #50  CLK_DRV <= ~CLK_DRV;
  end

  always @(posedge CLK_DRV) begin
    CLK <= ~CLK;
  end

  initial begin
    // HRESET_N ff should be initialized to run simulation
          force   dut.SN7474_E7b.CLR_N = 1;
    #10   force   dut.SN7474_E7b.CLR_N = 0;
    #100  force   dut.SN7474_E7b.CLR_N = 1;
          release dut.SN7474_E7b.CLR_N;

    // run until full counts
    #92000

    $finish;
  end

endmodule
