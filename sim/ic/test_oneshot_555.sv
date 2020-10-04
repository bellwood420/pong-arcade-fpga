module test_oneshot_555();
  timeunit 1ns; timeprecision 1ns;

  logic CLK;
  logic TRG_N;
  logic OUT;

  oneshot_555 #(
    .BIT_WIDTH(4),
    .COUNTS(12)
  ) dut (
    .CLK, .TRG_N, .OUT
  );

  initial begin
    CLK <= 0;
    forever #50  CLK <= ~CLK;
  end

  initial begin
          TRG_N = 1;
    #500  TRG_N = 0;
    #100  TRG_N = 1;
    @(negedge CLK)
    @(negedge CLK)
    @(negedge CLK)
    @(negedge CLK)
    @(negedge CLK)
    @(negedge CLK)
    @(negedge CLK)
    @(negedge CLK)
    @(negedge CLK)
    @(negedge CLK)
    @(negedge CLK)
    @(negedge CLK)
    @(negedge CLK)
    @(negedge CLK)
    $finish;
  end

endmodule