/*
 * Original version of SN74107 (J-K FF with CLEAR)
 * for simulation reference
 */
module SN74107_ref(
  input   logic CLK_N,  // clock negative edge
  input   logic CLR_N,  // clear negative asyncronous
  input   logic J, K,   // J-K FF input
  output  logic Q, Q_N  // J-K FF output
);
  assign Q_N = ~Q;

  always @(negedge CLK_N, negedge CLR_N) begin
    if (!CLR_N)
      Q <= 1'b0;
    else begin
      unique case ({J, K})
        2'b00: Q <= Q;
        2'b10: Q <= 1'b1;
        2'b01: Q <= 1'b0;
        2'b11: Q <= ~Q;
      endcase
    end
  end

endmodule
