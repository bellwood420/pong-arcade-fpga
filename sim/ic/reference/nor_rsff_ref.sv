/*
 * Original version of RS-FF constructed from loops of SN7402 NOR
 * for simulation reference
 */
module nor_rsff_ref(
  input   logic  R, S,
  output  logic  Q, Q_N
);
  assign Q = ~(R | Q_N);
  assign Q_N = ~(S | Q);

endmodule
