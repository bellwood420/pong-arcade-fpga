/*
 * Original version of clocked SR-FF with preset and clear
 * for simulation reference
 */
module clocked_srff_ref (
  input   logic   CLK_N,
  input   logic   PRE_N, CLR_N,
  input   logic   S, R,
  output  logic   Q, Q_N
);
  logic CLK, SCK_N, RCK_N, S_N, R_N;

  assign CLK = ~CLK_N;
  assign SCK_N = ~(S & CLK);
  assign RCK_N = ~(R & CLK);
  assign Q = ~(S_N & Q_N);
  assign Q_N = ~(R_N & Q);

  always_comb begin
    if (!PRE_N) begin
      S_N = PRE_N;
      R_N = ~PRE_N;
    end else if (!CLR_N) begin
      S_N = ~CLR_N;
      R_N = CLR_N;
    end else begin
      S_N = SCK_N;
      R_N = RCK_N;
    end
  end

endmodule
