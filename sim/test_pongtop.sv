module test_pongtop();
  timeunit 1ns; timeprecision 1ps;

  logic   CLK_DRV, CLK;
  logic   FPGA_RESET;
  logic   COIN_SW;
  logic   SW1A, SW1B;
  logic   PAD_TRG_N;
  logic   PAD1_OUT, PAD2_OUT;
  logic   CSYNC, VIDEO, SCORE;
  logic   SOUND;


  // --- PROBING ---

  // --- PROBING ---

  pongtop dut(.*);

  initial begin
    CLK_DRV <= 0;
    CLK <= 0;
    FPGA_RESET <= 0;
    COIN_SW <= 0;
    SW1A <= 0;
    SW1B <= 0;
    PAD1_OUT <= 0;
    PAD2_OUT <= 0;
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
    #10   FPGA_RESET <= 1;
    #100  FPGA_RESET <= 0;
    #10   COIN_SW <= 1;
    #100  COIN_SW <= 0;
  end

  initial begin
    // hreset_n ff should be initialized to run simulation
          force   dut.hcounter.SN7474_E7b.CLR_N = 1;
    #10   force   dut.hcounter.SN7474_E7b.CLR_N = 0;
    #100  force   dut.hcounter.SN7474_E7b.CLR_N = 1;
          release dut.hcounter.SN7474_E7b.CLR_N;
  end

  initial begin
    // vreset_n ff should be initialized to run simulation
          force   dut.vcounter.SN7474_E7a.CLR_N = 1;
    #10   force   dut.vcounter.SN7474_E7a.CLR_N = 0;
    #100  force   dut.vcounter.SN7474_E7a.CLR_N = 1;
          release dut.vcounter.SN7474_E7a.CLR_N;
  end

  initial begin
    // B8 counter should be initialized to run simulation
          force   dut.pad.SN7493_B8.RESET_N = 1;
    #10   force   dut.pad.SN7493_B8.RESET_N = 0;
    #100  force   dut.pad.SN7493_B8.RESET_N = 1;
          release dut.pad.SN7493_B8.RESET_N;
  end

  initial begin
    // A8 counter should be initialized to run simulation
          force   dut.pad.SN7493_A8.RESET_N = 1;
    #10   force   dut.pad.SN7493_A8.RESET_N = 0;
    #100  force   dut.pad.SN7493_A8.RESET_N = 1;
          release dut.pad.SN7493_A8.RESET_N;
  end

  initial begin
    // H3b FF should be initialized to run simulation
          force   dut.hball.SN7474_H3b.CLR_N = 1;
    #10   force   dut.hball.SN7474_H3b.CLR_N = 0;
    #100  force   dut.hball.SN7474_H3b.CLR_N = 1;
          release dut.hball.SN7474_H3b.CLR_N;
  end

  initial begin
    // F1 counter should be initialized to run simulation
          force   dut.hball.SN7493_F1.RESET_N = 1;
    #10   force   dut.hball.SN7493_F1.RESET_N = 0;
    #100  force   dut.hball.SN7493_F1.RESET_N = 1;
          release dut.hball.SN7493_F1.RESET_N;
  end

  initial begin
    // A2a FF should be initialized to run simulation
          force   dut.vball.SN74107_A2a.CLR_N = 1;
    #10   force   dut.vball.SN74107_A2a.CLR_N = 0;
    #100  force   dut.vball.SN74107_A2a.CLR_N = 1;
          release dut.vball.SN74107_A2a.CLR_N;
  end

  initial begin
    // B3 counter should be initialized to run simulation
          force   dut.vball.DM9316_B3.LOAD_N = 1;
    #10   force   dut.vball.DM9316_B3.LOAD_N = 0;
    #100  force   dut.vball.DM9316_B3.LOAD_N = 1;
          release dut.vball.DM9316_B3.LOAD_N;
  end

  initial begin
    // A3 counter should be initialized to run simulation
          force   dut.vball.DM9316_A3.LOAD_N = 1;
    #10   force   dut.vball.DM9316_A3.LOAD_N = 0;
    #100  force   dut.vball.DM9316_A3.LOAD_N = 1;
          release dut.vball.DM9316_A3.LOAD_N;
  end

  initial begin
    // C2a FF should be initialized to run simulation
          force   dut.sound.SN7474_C2a.PRE_N = 1;
    #10   force   dut.sound.SN7474_C2a.PRE_N = 0;
    #100  force   dut.sound.SN7474_C2a.PRE_N = 1;
          release dut.sound.SN7474_C2a.PRE_N;
  end


endmodule
