module test_nand_rsff();
  timeunit 1ns; timeprecision 1ns;

  logic CLK_DRV;
  logic S_N, R_N;
  logic Q, Q_N;
  logic Q_ref, Q_N_ref;

  nand_rsff dut (.*);
  nand_rsff_ref dut_ref (.Q(Q_ref), .Q_N(Q_N_ref), .*);

  initial begin
    CLK_DRV <= 0;
    forever #50  CLK_DRV <= ~CLK_DRV;
  end
  initial begin
                       S_N <= 1; R_N <= 1;
    @(negedge CLK_DRV)
    @(negedge CLK_DRV) S_N <= 0; R_N <= 1;
    @(negedge CLK_DRV) S_N <= 1; R_N <= 1;
    @(negedge CLK_DRV) S_N <= 1; R_N <= 0;
    @(negedge CLK_DRV) S_N <= 1; R_N <= 1;
    @(negedge CLK_DRV)
    $finish;
  end

endmodule
