module test_clocked_srff();
  timeunit 1ns; timeprecision 1ns;

  logic CLK_DRV;
  logic CLK_N;
  logic PRE_N, CLR_N;
  logic S, R;
  logic Q, Q_N;
  logic Q_ref, Q_N_ref;

  clocked_srff dut (.*);
  clocked_srff_ref dut_ref (.Q(Q_ref), .Q_N(Q_N_ref), .*);

  initial begin
    CLK_DRV <= 0;
    CLK_N <= 0;
    forever #50  CLK_DRV <= ~CLK_DRV;
  end

  always @(posedge CLK_DRV) begin
    CLK_N <= ~CLK_N;
  end

  initial begin
                      S <= 0; R <= 0;
                      PRE_N <= 1;
                      CLR_N <= 1;
    #60               CLR_N <= 0;
    #140              CLR_N <= 1;
    @(posedge CLK_N)
    @(posedge CLK_N)  S <= 1; R <= 0;
    @(posedge CLK_N)  S <= 0; R <= 0;
    @(posedge CLK_N)  S <= 0; R <= 1;
    @(posedge CLK_N)  S <= 0; R <= 0;
    @(posedge CLK_N)
    @(posedge CLK_N)  PRE_N <= 0;
    @(posedge CLK_N)  S <= 0; R <= 1;
    @(posedge CLK_N)  S <= 0; R <= 0;
    @(posedge CLK_N)  PRE_N <= 1;
    @(posedge CLK_N)
    @(posedge CLK_N)  CLR_N <= 0;
    @(posedge CLK_N)  S <= 1; R <= 0;
    @(posedge CLK_N)  S <= 0; R <= 0;
    @(posedge CLK_N)  CLR_N <= 1;
    @(posedge CLK_N)
    $finish;
  end

endmodule
