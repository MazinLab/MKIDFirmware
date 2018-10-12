//-----------------------------------------------------------------------------
// system_darkquad29_wvl_gbe64_one_gbe_wrapper.v
//-----------------------------------------------------------------------------

module system_darkquad29_wvl_gbe64_one_gbe_wrapper
  (
    app_clk,
    app_tx_rst,
    app_rx_rst,
    mac_tx_rst,
    mac_rx_rst,
    app_tx_data,
    app_tx_dvld,
    app_tx_eof,
    app_tx_destip,
    app_tx_destport,
    app_tx_afull,
    app_tx_overflow,
    app_rx_data,
    app_rx_dvld,
    app_rx_eof,
    app_rx_srcip,
    app_rx_srcport,
    app_rx_badframe,
    app_rx_overrun,
    app_rx_ack,
    app_dbg_data,
    app_dbg_dvld,
    mac_rx_clk,
    mac_rx_data,
    mac_rx_dvld,
    mac_rx_goodframe,
    mac_rx_badframe,
    mac_tx_clk,
    mac_tx_data,
    mac_tx_dvld,
    mac_tx_ack,
    mac_syncacquired,
    OPB_Clk,
    OPB_Rst,
    OPB_RNW,
    OPB_select,
    OPB_ABus,
    OPB_BE,
    OPB_DBus,
    Sl_DBus,
    Sl_errAck,
    Sl_retry,
    Sl_toutSup,
    Sl_xferAck
  );
  input app_clk;
  input app_tx_rst;
  input app_rx_rst;
  input mac_tx_rst;
  input mac_rx_rst;
  input [7:0] app_tx_data;
  input app_tx_dvld;
  input app_tx_eof;
  input [31:0] app_tx_destip;
  input [15:0] app_tx_destport;
  output app_tx_afull;
  output app_tx_overflow;
  output [7:0] app_rx_data;
  output app_rx_dvld;
  output app_rx_eof;
  output [31:0] app_rx_srcip;
  output [15:0] app_rx_srcport;
  output app_rx_badframe;
  output app_rx_overrun;
  input app_rx_ack;
  output [31:0] app_dbg_data;
  output app_dbg_dvld;
  input mac_rx_clk;
  input [7:0] mac_rx_data;
  input mac_rx_dvld;
  input mac_rx_goodframe;
  input mac_rx_badframe;
  input mac_tx_clk;
  output [7:0] mac_tx_data;
  output mac_tx_dvld;
  input mac_tx_ack;
  input mac_syncacquired;
  input OPB_Clk;
  input OPB_Rst;
  input OPB_RNW;
  input OPB_select;
  input [0:31] OPB_ABus;
  input [0:3] OPB_BE;
  input [0:31] OPB_DBus;
  output [0:31] Sl_DBus;
  output Sl_errAck;
  output Sl_retry;
  output Sl_toutSup;
  output Sl_xferAck;

  gbe_udp
    #(
      .LOCAL_ENABLE ( 1 ),
      .DIS_CPU_RX ( 0 ),
      .DIS_CPU_TX ( 0 ),
      .CPU_PROMISCUOUS ( 1 ),
      .LOCAL_MAC ( 48'h123456789ABC ),
      .LOCAL_IP ( 32'h0a0000d3 ),
      .LOCAL_PORT ( 16'hC350 ),
      .LOCAL_GATEWAY ( 8'h01 ),
      .C_BASEADDR ( 32'h01184000 ),
      .C_HIGHADDR ( 32'h01187FFF ),
      .C_OPB_AWIDTH ( 32 ),
      .C_OPB_DWIDTH ( 32 )
    )
    darkquad29_wvl_gbe64_one_gbe (
      .app_clk ( app_clk ),
      .app_tx_rst ( app_tx_rst ),
      .app_rx_rst ( app_rx_rst ),
      .mac_tx_rst ( mac_tx_rst ),
      .mac_rx_rst ( mac_rx_rst ),
      .app_tx_data ( app_tx_data ),
      .app_tx_dvld ( app_tx_dvld ),
      .app_tx_eof ( app_tx_eof ),
      .app_tx_destip ( app_tx_destip ),
      .app_tx_destport ( app_tx_destport ),
      .app_tx_afull ( app_tx_afull ),
      .app_tx_overflow ( app_tx_overflow ),
      .app_rx_data ( app_rx_data ),
      .app_rx_dvld ( app_rx_dvld ),
      .app_rx_eof ( app_rx_eof ),
      .app_rx_srcip ( app_rx_srcip ),
      .app_rx_srcport ( app_rx_srcport ),
      .app_rx_badframe ( app_rx_badframe ),
      .app_rx_overrun ( app_rx_overrun ),
      .app_rx_ack ( app_rx_ack ),
      .app_dbg_data ( app_dbg_data ),
      .app_dbg_dvld ( app_dbg_dvld ),
      .mac_rx_clk ( mac_rx_clk ),
      .mac_rx_data ( mac_rx_data ),
      .mac_rx_dvld ( mac_rx_dvld ),
      .mac_rx_goodframe ( mac_rx_goodframe ),
      .mac_rx_badframe ( mac_rx_badframe ),
      .mac_tx_clk ( mac_tx_clk ),
      .mac_tx_data ( mac_tx_data ),
      .mac_tx_dvld ( mac_tx_dvld ),
      .mac_tx_ack ( mac_tx_ack ),
      .mac_syncacquired ( mac_syncacquired ),
      .OPB_Clk ( OPB_Clk ),
      .OPB_Rst ( OPB_Rst ),
      .OPB_RNW ( OPB_RNW ),
      .OPB_select ( OPB_select ),
      .OPB_ABus ( OPB_ABus ),
      .OPB_BE ( OPB_BE ),
      .OPB_DBus ( OPB_DBus ),
      .Sl_DBus ( Sl_DBus ),
      .Sl_errAck ( Sl_errAck ),
      .Sl_retry ( Sl_retry ),
      .Sl_toutSup ( Sl_toutSup ),
      .Sl_xferAck ( Sl_xferAck )
    );

endmodule

