module test_SN74107();
  timeunit 1ns; timeprecision 1ns;

  logic CLK_DRV;
  logic CLK_N;
  logic CLR_N;
  logic J, K;
  logic Q, Q_N;
  logic Q_ref, Q_N_ref;

  SN74107 dut (.*);
  SN74107_ref dut_ref (.Q(Q_ref), .Q_N(Q_N_ref), .*);

  initial begin
    CLK_DRV <= 0;
    CLK_N <= 0;
    forever #50  CLK_DRV <= ~CLK_DRV;
  end

  always @(posedge CLK_DRV) begin
    CLK_N <= ~CLK_N;
  end

  initial begin
    J <= 0; K <= 0;
    CLR_N <= 1;

    #10 CLR_N <= 0;
    #200 CLR_N <= 1;
    @(posedge CLK_N)
    @(posedge CLK_N)

    @(posedge CLK_N) J <= 1; K <= 0;
    @(posedge CLK_N) J <= 0; K <= 1;
    @(posedge CLK_N) J <= 1; K <= 1;
    @(posedge CLK_N)
    @(posedge CLK_N) J <= 0; K <= 0;
    @(posedge CLK_N) J <= 0; K <= 1;
    @(posedge CLK_N) J <= 1; K <= 0;
    @(posedge CLK_N) J <= 1; K <= 1;
    @(posedge CLK_N)
    @(posedge CLK_N) J <= 0; K <= 0;

    CLR_N <= 1;
    #10 CLR_N <= 0;
    #200 CLR_N <= 1;
    @(posedge CLK_N)
    @(posedge CLK_N)
    @(posedge CLK_N) J <= 1; K <= 1;
    @(posedge CLK_N)

    CLR_N <= 1;
    #10 CLR_N <= 0;
    #300 CLR_N <= 1;
    @(posedge CLK_N)
    @(posedge CLK_N)

    $finish;
  end

endmodule