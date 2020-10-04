module NEXYS4DDR(
  //////////// CLOCK //////////
  input  logic    CLK100MHZ,

  //////////// SWITCHES //////////
  input  logic    SW1A,       // SW[0]
  input  logic    SW1B,       // SW[1]

  //////////// BUTTONS //////////
  input  logic    RESET_N,    // CPU_RESETN
  input  logic    COIN_SW,    // BTNC

  //////////// PMOD HEADERS //////////
  output logic    CSYNC,      // JA[0]
  output logic    VIDEO,      // JA[1]
  output logic    SCORE,      // JA[2]
  output logic    PAD_TRG_N,  // JA[3]
  input  logic    PAD1_OUT,   // JA[4]
  input  logic    PAD2_OUT,   // JA[5]
  output logic    SOUND       // JA[6]
);
  //
  // Reset synchronizer
  //
  logic RESET;
  reset_sync reset_sync(
    .clk(CLK100MHZ),
    .reset(~RESET_N),
    .out(RESET)
  );

  //
  // Drive clock
  // 14.318 MHz for synchronous driving whole circuit
  //
  logic CLK_DRV;
  mmcm mmcm(.clk_in1(CLK100MHZ), .reset(RESET), .clk_out1(CLK_DRV));

 //
  // PONG main clock
  // 7.159 Mhz for PONG main clock as pixel clock
  //
  logic CLK_PCK;
  always_ff @(posedge CLK_DRV, posedge RESET) begin
    if (RESET)
      CLK_PCK <= 1'b0;
    else
      CLK_PCK <= ~CLK_PCK;
  end

  //
  // Input synchronizer
  //
  logic PAD1_OUT_SYNC;
  input_sync PAD1_sync (
    .clk(CLK_DRV),
    .reset(RESET),
    .in(PAD1_OUT),
    .out(PAD1_OUT_SYNC)
  );

  logic PAD2_OUT_SYNC;
  input_sync PAD2_sync (
    .clk(CLK_DRV),
    .reset(RESET),
    .in(PAD2_OUT),
    .out(PAD2_OUT_SYNC)
  );

  logic COIN_SW_SYNC;
  input_sync COIN_SW_sync (
    .clk(CLK_DRV),
    .reset(RESET),
    .in(COIN_SW),
    .out(COIN_SW_SYNC)
  );

  //
  // Clip score signal to avoid exceeding the NTSC voltage standard
  // when a ball overlaps on the score
  //
  logic SCORE_ORG;
  assign SCORE = (VIDEO & SCORE_ORG) ? 1'b1 : SCORE_ORG;

  //
  // PONG Instance
  //
  pongtop pongtop(
    .CLK_DRV, .CLK(CLK_PCK),
    .FPGA_RESET(RESET),
    .COIN_SW(COIN_SW_SYNC),
    .SW1A, .SW1B,
    .PAD_TRG_N,
    .PAD1_OUT(PAD1_OUT_SYNC), .PAD2_OUT(PAD2_OUT_SYNC),
    .CSYNC, .VIDEO, .SCORE(SCORE_ORG),
    .SOUND
  );

endmodule
