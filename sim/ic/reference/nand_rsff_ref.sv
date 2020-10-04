/*
 * Original version of RS-FF constructed from loops of SN7400 NAND
 * for simulation reference
 */
module nand_rsff_ref(
  input   logic  S_N, R_N,
  output  logic  Q, Q_N
);
  assign Q = ~(S_N & Q_N);
  assign Q_N = ~(R_N & Q);

endmodule
