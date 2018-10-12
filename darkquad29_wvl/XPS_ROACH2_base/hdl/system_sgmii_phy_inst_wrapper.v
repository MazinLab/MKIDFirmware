//-----------------------------------------------------------------------------
// system_sgmii_phy_inst_wrapper.v
//-----------------------------------------------------------------------------

module system_sgmii_phy_inst_wrapper
  (
    sgmii_txd,
    sgmii_txisk,
    sgmii_txdispmode,
    sgmii_txdispval,
    sgmii_txbuferr,
    sgmii_txreset,
    sgmii_rxd,
    sgmii_rxiscomma,
    sgmii_rxisk,
    sgmii_rxdisperr,
    sgmii_rxnotintable,
    sgmii_rxrundisp,
    sgmii_rxclkcorcnt,
    sgmii_rxbufstatus,
    sgmii_rxreset,
    sgmii_encommaalign,
    sgmii_pll_locked,
    sgmii_elecidle,
    sgmii_resetdone,
    sgmii_loopback,
    sgmii_powerdown,
    mgt_rx_n,
    mgt_rx_p,
    mgt_tx_n,
    mgt_tx_p,
    mgt_clk_n,
    mgt_clk_p,
    mgt_reset,
    clk_125,
    recclk_125
  );
  input [7:0] sgmii_txd;
  input sgmii_txisk;
  input sgmii_txdispmode;
  input sgmii_txdispval;
  input sgmii_txbuferr;
  input sgmii_txreset;
  output [7:0] sgmii_rxd;
  output sgmii_rxiscomma;
  output sgmii_rxisk;
  output sgmii_rxdisperr;
  output sgmii_rxnotintable;
  output sgmii_rxrundisp;
  output [2:0] sgmii_rxclkcorcnt;
  output sgmii_rxbufstatus;
  input sgmii_rxreset;
  input sgmii_encommaalign;
  output sgmii_pll_locked;
  output sgmii_elecidle;
  output sgmii_resetdone;
  input sgmii_loopback;
  input sgmii_powerdown;
  input mgt_rx_n;
  input mgt_rx_p;
  output mgt_tx_n;
  output mgt_tx_p;
  input mgt_clk_n;
  input mgt_clk_p;
  input mgt_reset;
  output clk_125;
  output recclk_125;

  sgmii_phy
    sgmii_phy_inst (
      .sgmii_txd ( sgmii_txd ),
      .sgmii_txisk ( sgmii_txisk ),
      .sgmii_txdispmode ( sgmii_txdispmode ),
      .sgmii_txdispval ( sgmii_txdispval ),
      .sgmii_txbuferr ( sgmii_txbuferr ),
      .sgmii_txreset ( sgmii_txreset ),
      .sgmii_rxd ( sgmii_rxd ),
      .sgmii_rxiscomma ( sgmii_rxiscomma ),
      .sgmii_rxisk ( sgmii_rxisk ),
      .sgmii_rxdisperr ( sgmii_rxdisperr ),
      .sgmii_rxnotintable ( sgmii_rxnotintable ),
      .sgmii_rxrundisp ( sgmii_rxrundisp ),
      .sgmii_rxclkcorcnt ( sgmii_rxclkcorcnt ),
      .sgmii_rxbufstatus ( sgmii_rxbufstatus ),
      .sgmii_rxreset ( sgmii_rxreset ),
      .sgmii_encommaalign ( sgmii_encommaalign ),
      .sgmii_pll_locked ( sgmii_pll_locked ),
      .sgmii_elecidle ( sgmii_elecidle ),
      .sgmii_resetdone ( sgmii_resetdone ),
      .sgmii_loopback ( sgmii_loopback ),
      .sgmii_powerdown ( sgmii_powerdown ),
      .mgt_rx_n ( mgt_rx_n ),
      .mgt_rx_p ( mgt_rx_p ),
      .mgt_tx_n ( mgt_tx_n ),
      .mgt_tx_p ( mgt_tx_p ),
      .mgt_clk_n ( mgt_clk_n ),
      .mgt_clk_p ( mgt_clk_p ),
      .mgt_reset ( mgt_reset ),
      .clk_125 ( clk_125 ),
      .recclk_125 ( recclk_125 )
    );

endmodule

