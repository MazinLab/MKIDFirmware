//-----------------------------------------------------------------------------
// system_darkquad29_a2g_ctrl_adcdac_2g_ctrl_wrapper.v
//-----------------------------------------------------------------------------

module system_darkquad29_a2g_ctrl_adcdac_2g_ctrl_wrapper
  (
    zdok_tx_data_p,
    zdok_tx_data_n,
    zdok_rx_data_p,
    zdok_rx_data_n,
    fpga_clk,
    user_tx_rst,
    user_rx_rst,
    user_tx_data,
    user_tx_val,
    user_tx_full,
    user_rx_full,
    user_rx_data,
    user_rx_val
  );
  output zdok_tx_data_p;
  output zdok_tx_data_n;
  input zdok_rx_data_p;
  input zdok_rx_data_n;
  input fpga_clk;
  input user_tx_rst;
  input user_rx_rst;
  input [7:0] user_tx_data;
  input user_tx_val;
  output user_tx_full;
  output user_rx_full;
  output [7:0] user_rx_data;
  output user_rx_val;

  adcdac_2g_ctrl
    darkquad29_a2g_ctrl_adcdac_2g_ctrl (
      .zdok_tx_data_p ( zdok_tx_data_p ),
      .zdok_tx_data_n ( zdok_tx_data_n ),
      .zdok_rx_data_p ( zdok_rx_data_p ),
      .zdok_rx_data_n ( zdok_rx_data_n ),
      .fpga_clk ( fpga_clk ),
      .user_tx_rst ( user_tx_rst ),
      .user_rx_rst ( user_rx_rst ),
      .user_tx_data ( user_tx_data ),
      .user_tx_val ( user_tx_val ),
      .user_tx_full ( user_tx_full ),
      .user_rx_full ( user_rx_full ),
      .user_rx_data ( user_rx_data ),
      .user_rx_val ( user_rx_val )
    );

endmodule

