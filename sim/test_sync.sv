module test_sync();
  timeunit 1ns; timeprecision 1ps;

  logic CLK_DRV;
  logic CLK;

  logic HRESET, HRESET_N;
  logic VRESET, VRESET_N;
  logic HBLANK, HBLANK_N, HSYNC_N;
  logic VBLANK, VBLANK_N, VSYNC_N;

  logic [8:0] hcnt;
  logic [8:0] vcnt;

  hcounter hcounter(._1H(hcnt[0]), ._2H(hcnt[1]), ._4H(hcnt[2]), ._8H(hcnt[3]),
                    ._16H(hcnt[4]), ._32H(hcnt[5]), ._64H(hcnt[6]), ._128H(hcnt[7]),
                    ._256H(hcnt[8]), ._256H_N(), .*);

  vcounter vcounter(.CLK(HRESET),
                    ._1V(vcnt[0]), ._2V(vcnt[1]), ._4V(vcnt[2]), ._8V(vcnt[3]),
                    ._16V(vcnt[4]), ._32V(vcnt[5]), ._64V(vcnt[6]), ._128V(vcnt[7]),
                    ._256V(vcnt[8]), ._256V_N(), .*);

  sync dut(._16H(hcnt[4]), ._32H(hcnt[5]), ._64H(hcnt[6]),
           ._4V(vcnt[2]), ._8V(vcnt[3]), ._16V(vcnt[4]), .*);

  initial begin
    CLK_DRV <= 0;
    CLK <= 0;
    forever #34.921  CLK_DRV <= ~CLK_DRV;
  end

  always @(posedge CLK_DRV) begin
    CLK <= ~CLK;
  end

  initial begin
    #34000000
    $finish;
  end

  initial begin
    // HRESET_N ff should be initialized to run simulation
          force   hcounter.SN7474_E7b.CLR_N = 1;
    #10   force   hcounter.SN7474_E7b.CLR_N = 0;
    #100  force   hcounter.SN7474_E7b.CLR_N = 1;
          release hcounter.SN7474_E7b.CLR_N;
  end

  initial begin
    // VRESET_N ff should be initialized to run simulation
          force   vcounter.SN7474_E7a.CLR_N = 1;
    #10   force   vcounter.SN7474_E7a.CLR_N = 0;
    #100  force   vcounter.SN7474_E7a.CLR_N = 1;
          release vcounter.SN7474_E7a.CLR_N;
  end

endmodule
