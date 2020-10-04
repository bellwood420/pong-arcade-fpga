/*
 * Reset synchronizer (Xilinx)
 * Assert asynchronously, deassert synchronously
 */
module reset_sync(
  input   logic   clk,
  input   logic   reset,
  output  logic   out
);
  (* ASYNC_REG = "TRUE" *) logic q1;
  (* ASYNC_REG = "TRUE" *) logic q2;

  always @(posedge clk, posedge reset) begin
    if (reset) begin
      q1 <= 1'b1;
      q2 <= 1'b1;
    end else begin
      q1 <= 1'b0;
      q2 <= q1;
    end
  end

  assign out = q2;

endmodule
