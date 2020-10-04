module test_DM9316();
  timeunit 1ns; timeprecision 1ns;

  logic CLK_DRV;
  logic CLK;
  logic CLR_N;
  logic LOAD_N;
  logic ENP, ENT;
  logic A, B, C, D;
  logic QA, QB, QC, QD;
  logic QA_ref, QB_ref, QC_ref, QD_ref;
  logic RCO, RCO_ref;

  DM9316 dut(.*);
  DM9316_ref dut_ref(
    .QA(QA_ref), .QB(QB_ref), .QC(QC_ref), .QD(QD_ref),
    .RCO(RCO_ref), .*);

  initial begin
    CLK_DRV <= 0;
    CLK <= 0;
    forever #50  CLK_DRV <= ~CLK_DRV;
  end

  always @(posedge CLK_DRV) begin
    CLK <= ~CLK;
  end

  initial begin
    CLR_N = 1; LOAD_N = 1;
    ENP = 0; ENT = 0;
    A = 0; B = 0; C = 1; D = 1;
    
    #30   CLR_N = 0;
    #100  CLR_N = 1;
    #30   LOAD_N = 0;
    #100  LOAD_N = 1;
    #30   ENP = 1; ENT = 1;
    @(negedge CLK)
    @(negedge CLK)
    @(negedge CLK)
    @(negedge CLK)
    @(negedge CLK)
    @(negedge CLK)
    @(negedge CLK)
    #30   ENP = 0;
    #200  ENP = 1; ENT = 0;
    #200  ENT = 1;
    #50
    $finish;
  end

endmodule
