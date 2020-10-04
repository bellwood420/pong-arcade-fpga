module test_SN7474();
  timeunit 1ns; timeprecision 1ns;

  logic CLK_DRV;
  logic CLK;
  logic PRE_N;
  logic CLR_N;
  logic D;
  logic Q, Q_N;
  logic Q_ref, Q_N_ref;

  SN7474 dut (.*);
  SN7474_ref dut_ref (.Q(Q_ref), .Q_N(Q_N_ref), .*);

  initial begin
    CLK_DRV <= 0;
    CLK <= 0;
    forever #50  CLK_DRV <= ~CLK_DRV;
  end

  always @(posedge CLK_DRV) begin
    CLK <= ~CLK;
  end

  initial begin
    D <= 0;
    CLR_N <= 1;
    PRE_N <= 1;

    #10  PRE_N <= 0;
    #200 PRE_N <= 1;

    @(negedge CLK) D <= 0;
    @(negedge CLK) D <= 1;
    @(negedge CLK)

         CLR_N <= 1;
    #10  CLR_N <= 0;
    #200 CLR_N <= 1;

    @(negedge CLK) D <= 1;
    @(negedge CLK) D <= 0;
    @(negedge CLK)

         CLR_N <= 1;
    #10  CLR_N <= 0; D <= 1;
    #200 CLR_N <= 1;

    @(negedge CLK)
    @(negedge CLK)

    $finish;
  end

endmodule
