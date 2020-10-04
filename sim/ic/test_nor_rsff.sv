module test_nor_rsff();
  timeunit 1ns; timeprecision 1ns;

  logic CLK_DRV;
  logic R, S;
  logic Q, Q_N;
  logic Q_ref, Q_N_ref;

  nor_rsff dut (.*);
  nor_rsff_ref dut_ref (.Q(Q_ref), .Q_N(Q_N_ref), .*);

  initial begin
    CLK_DRV <= 0;
    forever #50  CLK_DRV <= ~CLK_DRV;
  end
  initial begin
                       R <= 0; S <= 0;
    @(negedge CLK_DRV)
    @(negedge CLK_DRV) R <= 0; S <= 1;
    @(negedge CLK_DRV) R <= 0; S <= 0;
    @(negedge CLK_DRV) R <= 1; S <= 0;
    @(negedge CLK_DRV) R <= 0; S <= 0;
    @(negedge CLK_DRV)
    $finish;
  end

endmodule
