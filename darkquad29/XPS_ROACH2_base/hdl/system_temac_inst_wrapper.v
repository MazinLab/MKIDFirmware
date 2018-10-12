//-----------------------------------------------------------------------------
// system_temac_inst_wrapper.v
//-----------------------------------------------------------------------------

module system_temac_inst_wrapper
  (
    clk_125,
    reset,
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
    mac_rx_clk,
    mac_rx_data,
    mac_rx_dvld,
    mac_rx_goodframe,
    mac_rx_badframe,
    mac_tx_clk,
    mac_tx_data,
    mac_tx_dvld,
    mac_tx_ack,
    mac_syncacquired
  );
  input clk_125;
  input reset;
  output [7:0] sgmii_txd;
  output sgmii_txisk;
  output sgmii_txdispmode;
  output sgmii_txdispval;
  output sgmii_txbuferr;
  output sgmii_txreset;
  input [7:0] sgmii_rxd;
  input sgmii_rxiscomma;
  input sgmii_rxisk;
  input sgmii_rxdisperr;
  input sgmii_rxnotintable;
  input sgmii_rxrundisp;
  input [2:0] sgmii_rxclkcorcnt;
  input sgmii_rxbufstatus;
  output sgmii_rxreset;
  output sgmii_encommaalign;
  input sgmii_pll_locked;
  input sgmii_elecidle;
  input sgmii_resetdone;
  output sgmii_loopback;
  output sgmii_powerdown;
  output mac_rx_clk;
  output [7:0] mac_rx_data;
  output mac_rx_dvld;
  output mac_rx_goodframe;
  output mac_rx_badframe;
  output mac_tx_clk;
  input [7:0] mac_tx_data;
  input mac_tx_dvld;
  output mac_tx_ack;
  output mac_syncacquired;

  temac
    #(
      .REG_SGMII ( 1 ),
      .PHY_ADR ( 0 )
    )
    temac_inst (
      .clk_125 ( clk_125 ),
      .reset ( reset ),
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
      .mac_rx_clk ( mac_rx_clk ),
      .mac_rx_data ( mac_rx_data ),
      .mac_rx_dvld ( mac_rx_dvld ),
      .mac_rx_goodframe ( mac_rx_goodframe ),
      .mac_rx_badframe ( mac_rx_badframe ),
      .mac_tx_clk ( mac_tx_clk ),
      .mac_tx_data ( mac_tx_data ),
      .mac_tx_dvld ( mac_tx_dvld ),
      .mac_tx_ack ( mac_tx_ack ),
      .mac_syncacquired ( mac_syncacquired )
    );

endmodule

