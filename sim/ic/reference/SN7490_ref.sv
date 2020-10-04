/*
 * Original version of SN7490 (ripple decade counter)
 * for simulation reference
 */
module SN7490_ref(
  input   logic CKA_N, CKB_N,     // clock negative edge
  input   logic R01, R02,         // reset to zero, positive asyncronous
  input   logic R91, R92,         // reset to nine, positive asyncronous
  output  logic QA, QB, QC, QD    // 4 bit counter output
);
  logic RESET_0_N, RESET_9_N, RESET_QB_QC_N;
  assign RESET_0_N = ~(R01 & R02);
  assign RESET_9_N = ~(R91 & R92);
  assign RESET_QB_QC_N = RESET_0_N & RESET_9_N;

  logic S, R, QD_N;
  assign S = QB & QC;
  assign R = QD;
  assign QD_N = ~QD;

  always @(negedge CKA_N, negedge RESET_0_N, negedge RESET_9_N) begin
    if (!RESET_9_N)
      QA <= 1'b1;
    else if (!RESET_0_N)
      QA <= 1'b0;
    else
      QA <= ~QA;
  end

  always @(negedge CKB_N, negedge RESET_QB_QC_N) begin
    if (!RESET_QB_QC_N)
      QB <= 1'b0;
    else if (QD_N)
      QB <= ~QB;
    else
      QB <= 1'b0;
  end

  always @(negedge QB, negedge RESET_QB_QC_N) begin
    if (!RESET_QB_QC_N)
      QC <= 1'b0;
    else
      QC <= ~QC;
  end

  always @(negedge CKB_N, negedge RESET_9_N, negedge RESET_0_N) begin
    if (!RESET_9_N)
      QD <= 1'b1;
    else if (!RESET_0_N)
      QD <= 1'b0;
    else begin
      unique case ({S, R})
        2'b00: QD <= QD;
        2'b01: QD <= 1'b0;
        2'b10: QD <= 1'b1;
        2'b11: QD <= QD; // Invalid but hold
      endcase
    end
  end

endmodule
