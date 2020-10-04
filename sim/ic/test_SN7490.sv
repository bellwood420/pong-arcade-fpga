module test_SN7490();
  timeunit 1ns; timeprecision 1ns;

  logic CLK_DRV;
  logic CLK_N;
  logic R01, R02, R91, R92;
  logic QA, QB, QC, QD;
  logic QA_ref, QB_ref, QC_ref, QD_ref;

  SN7490 dut(.CKA_N(CLK_N), .CKB_N(QA), .*);
  SN7490_ref dut_ref(.CKA_N(CLK_N),
                     .CKB_N(QA_ref),
                     .QA(QA_ref),
                     .QB(QB_ref),
                     .QC(QC_ref),
                     .QD(QD_ref), .*);

  initial begin
    CLK_DRV <= 0;
    CLK_N <= 0;
    forever #50  CLK_DRV <= ~CLK_DRV;
  end

  always @(posedge CLK_DRV) begin
    CLK_N <= ~CLK_N;
  end

  initial begin
          R01 <= 0; R02 <= 0;
          R91 <= 0; R92 <= 0;

    #50   R01 <= 1; R02 <= 1;
    #150  R01 <= 0; R02 <= 0;

    #3000 R91 <= 1; R92 <= 1;
    #150  R91 <= 0; R92 <= 0;

    #200
    $finish;
  end

endmodule
