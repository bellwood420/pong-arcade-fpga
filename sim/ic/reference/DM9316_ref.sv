/*
 * Original version of DM9316[SN74161] (Synchronous 4-Bit Counters)
 * for simulation reference
 */
module DM9316_ref(
  input   logic   CLK,            // clock positive edge
  input   logic   CLR_N,          // clear negative asynchronous
  input   logic   LOAD_N,         // load negative synchronous
  input   logic   ENP, ENT,       // count enable
  input   logic   A, B, C, D,     // load input
  output  logic   QA, QB, QC, QD, // 4 bit counter output
  output  logic   RCO             // ripple carry output
);
  logic [3:0] cnt;

  assign {QD, QC, QB, QA} = cnt;

  always_ff @(posedge CLK, negedge CLR_N) begin
    if (!CLR_N)
      cnt = '0;
    else if (!LOAD_N)
      cnt = {D, C, B, A};
    else if (ENP & ENT)
      cnt = cnt + 4'd1;
  end

  assign RCO = ~(~QA | ~QB | ~QC | ~QD | ~ENT);

endmodule
