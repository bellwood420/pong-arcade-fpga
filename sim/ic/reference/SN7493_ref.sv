/*
 * Original version of SN7493 (4-bit ripple binary counter)
 * for simulation reference
 */
module SN7493_ref(
  input   logic CKA_N, CKB_N,   // clock negative edge
  input   logic R0, R1,         // reset positive asyncronous
  output  logic QA, QB, QC, QD  // 4 bit counter output
);
  logic RESET_N;
  assign RESET_N = ~(R0 & R1);

  always @(negedge CKA_N, negedge RESET_N) begin
    if (!RESET_N)
      QA <= 1'b0;
    else
      QA <= ~QA;
  end

  always @(negedge CKB_N, negedge RESET_N) begin
    if (!RESET_N)
      QB <= 1'b0;
    else
      QB <= ~QB;
  end

  always @(negedge QB, negedge RESET_N) begin
    if (!RESET_N)
      QC <= 1'b0;
    else
      QC <= ~QC;
  end

  always @(negedge QC, negedge RESET_N) begin
    if (!RESET_N)
      QD <= 1'b0;
    else
      QD <= ~QD;
  end

endmodule
