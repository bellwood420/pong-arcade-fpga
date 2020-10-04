module test_SN7493();
  timeunit 1ns; timeprecision 1ns;

  logic CLK_DRV;
  logic CLK_N;
  logic R0, R1;
  logic QA, QB, QC, QD;
  logic QA_ref, QB_ref, QC_ref, QD_ref;

  SN7493 dut(.CKA_N(CLK_N), .CKB_N(QA), .*);
  SN7493_ref dut_ref(.CKA_N(CLK_N),
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
    R0 <= 0; R1 <= 0;
    #10
    R0 <= 1; R1 <= 1;
    #200
    R0 <= 0; R1 <= 0;
    #6000
    $finish;
  end

endmodule
