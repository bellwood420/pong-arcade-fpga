/*
 * Original version of SN7474 (D-FF with PRESET and CLEAR)
 * for simulation reference
 */
module SN7474_ref(
  input   logic CLK,    // clock positive edge
  input   logic PRE_N,  // preset negative asynchronous
  input   logic CLR_N,  // clear negative asynchronous
  input   logic D,      // D-FF input
  output  logic Q, Q_N  // D-FF output
);
  assign Q_N = ~Q;

  always @(posedge CLK, negedge PRE_N, negedge CLR_N) begin
    if (!PRE_N)
      Q <= 1'b1;
    else if (!CLR_N)
      Q <= 1'b0;
    else
      Q <= D;
  end

endmodule
