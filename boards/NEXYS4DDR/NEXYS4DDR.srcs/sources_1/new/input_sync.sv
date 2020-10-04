/*
 * Input synchronizer (Xilinx)
 */
module input_sync(
  input   logic   clk,
  input   logic   reset,
  input   logic   in,
  output  logic   out
);
  parameter RESETVAL = 1'b0;

  (* ASYNC_REG = "TRUE" *) logic q1;
  (* ASYNC_REG = "TRUE" *) logic q2;

  always @(posedge clk, posedge reset) begin
    if (reset) begin
      q1 <= RESETVAL;
      q2 <= RESETVAL;
    end else begin
      q1 <= in;
      q2 <= q1;
    end
  end

  assign out = q2;

endmodule
