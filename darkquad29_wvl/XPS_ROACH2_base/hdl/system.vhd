-------------------------------------------------------------------------------
-- system.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity system is
  port (
    sys_clk_n : in std_logic;
    sys_clk_p : in std_logic;
    aux_clk_n : in std_logic;
    aux_clk_p : in std_logic;
    epb_clk_in : in std_logic;
    epb_data : inout std_logic_vector(0 to 31);
    epb_addr : in std_logic_vector(5 to 29);
    epb_cs_n : in std_logic;
    epb_be_n : in std_logic_vector(0 to 3);
    epb_r_w_n : in std_logic;
    epb_oe_n : in std_logic;
    epb_doe_n : out std_logic;
    epb_rdy : out std_logic;
    ppc_irq_n : out std_logic;
    sgmii_rx_n : in std_logic;
    sgmii_rx_p : in std_logic;
    sgmii_tx_n : out std_logic;
    sgmii_tx_p : out std_logic;
    sgmii_clkref_n : in std_logic;
    sgmii_clkref_p : in std_logic;
    adc_ctrl_tx_data_p : out std_logic;
    adc_ctrl_tx_data_n : out std_logic;
    adc_ctrl_rx_data_p : in std_logic;
    adc_ctrl_rx_data_n : in std_logic;
    adc_valid_p : in std_logic;
    adc_valid_n : in std_logic;
    adc_data0_p : in std_logic_vector(11 downto 0);
    adc_data0_n : in std_logic_vector(11 downto 0);
    adc_info0_p : in std_logic_vector(1 downto 0);
    adc_info0_n : in std_logic_vector(1 downto 0);
    adc_data1_p : in std_logic_vector(11 downto 0);
    adc_data1_n : in std_logic_vector(11 downto 0);
    adc_info1_p : in std_logic_vector(1 downto 0);
    adc_info1_n : in std_logic_vector(1 downto 0);
    adc_data2z0_p : in std_logic_vector(11 downto 0);
    adc_data2z0_n : in std_logic_vector(11 downto 0);
    adc_info2_p : in std_logic_vector(1 downto 0);
    adc_info2_n : in std_logic_vector(1 downto 0);
    adc_data3_p : in std_logic_vector(11 downto 0);
    adc_data3_n : in std_logic_vector(11 downto 0);
    adc_info3_p : in std_logic_vector(1 downto 0);
    adc_info3_n : in std_logic_vector(1 downto 0);
    adc_data0_smpl_clk_p : in std_logic;
    adc_data0_smpl_clk_n : in std_logic;
    adc_sync_pps_p : in std_logic;
    adc_sync_pps_n : in std_logic;
    adc_data0_rdy_p : out std_logic;
    adc_data0_rdy_n : out std_logic;
    adc_sync_out_p : out std_logic;
    adc_sync_out_n : out std_logic;
    qdr0_k_n : out std_logic;
    qdr0_k : out std_logic;
    qdr0_d : out std_logic_vector(35 downto 0);
    qdr0_sa : out std_logic_vector(20 downto 0);
    qdr0_w_n : out std_logic;
    qdr0_r_n : out std_logic;
    qdr0_q : in std_logic_vector(35 downto 0);
    qdr0_dll_off_n : out std_logic;
    qdr1_k_n : out std_logic;
    qdr1_k : out std_logic;
    qdr1_d : out std_logic_vector(35 downto 0);
    qdr1_sa : out std_logic_vector(20 downto 0);
    qdr1_w_n : out std_logic;
    qdr1_r_n : out std_logic;
    qdr1_q : in std_logic_vector(35 downto 0);
    qdr1_dll_off_n : out std_logic;
    qdr2_k_n : out std_logic;
    qdr2_k : out std_logic;
    qdr2_d : out std_logic_vector(35 downto 0);
    qdr2_sa : out std_logic_vector(20 downto 0);
    qdr2_w_n : out std_logic;
    qdr2_r_n : out std_logic;
    qdr2_q : in std_logic_vector(35 downto 0);
    qdr2_dll_off_n : out std_logic;
    qdr3_k_n : out std_logic;
    qdr3_k : out std_logic;
    qdr3_d : out std_logic_vector(35 downto 0);
    qdr3_sa : out std_logic_vector(20 downto 0);
    qdr3_w_n : out std_logic;
    qdr3_r_n : out std_logic;
    qdr3_q : in std_logic_vector(35 downto 0);
    qdr3_dll_off_n : out std_logic
  );
end system;

architecture STRUCTURE of system is

  component system_temac_inst_wrapper is
    port (
      clk_125 : in std_logic;
      reset : in std_logic;
      sgmii_txd : out std_logic_vector(7 downto 0);
      sgmii_txisk : out std_logic;
      sgmii_txdispmode : out std_logic;
      sgmii_txdispval : out std_logic;
      sgmii_txbuferr : out std_logic;
      sgmii_txreset : out std_logic;
      sgmii_rxd : in std_logic_vector(7 downto 0);
      sgmii_rxiscomma : in std_logic;
      sgmii_rxisk : in std_logic;
      sgmii_rxdisperr : in std_logic;
      sgmii_rxnotintable : in std_logic;
      sgmii_rxrundisp : in std_logic;
      sgmii_rxclkcorcnt : in std_logic_vector(2 downto 0);
      sgmii_rxbufstatus : in std_logic;
      sgmii_rxreset : out std_logic;
      sgmii_encommaalign : out std_logic;
      sgmii_pll_locked : in std_logic;
      sgmii_elecidle : in std_logic;
      sgmii_resetdone : in std_logic;
      sgmii_loopback : out std_logic;
      sgmii_powerdown : out std_logic;
      mac_rx_clk : out std_logic;
      mac_rx_data : out std_logic_vector(7 downto 0);
      mac_rx_dvld : out std_logic;
      mac_rx_goodframe : out std_logic;
      mac_rx_badframe : out std_logic;
      mac_tx_clk : out std_logic;
      mac_tx_data : in std_logic_vector(7 downto 0);
      mac_tx_dvld : in std_logic;
      mac_tx_ack : out std_logic;
      mac_syncacquired : out std_logic
    );
  end component;

  component system_sgmii_phy_inst_wrapper is
    port (
      sgmii_txd : in std_logic_vector(7 downto 0);
      sgmii_txisk : in std_logic;
      sgmii_txdispmode : in std_logic;
      sgmii_txdispval : in std_logic;
      sgmii_txbuferr : in std_logic;
      sgmii_txreset : in std_logic;
      sgmii_rxd : out std_logic_vector(7 downto 0);
      sgmii_rxiscomma : out std_logic;
      sgmii_rxisk : out std_logic;
      sgmii_rxdisperr : out std_logic;
      sgmii_rxnotintable : out std_logic;
      sgmii_rxrundisp : out std_logic;
      sgmii_rxclkcorcnt : out std_logic_vector(2 downto 0);
      sgmii_rxbufstatus : out std_logic;
      sgmii_rxreset : in std_logic;
      sgmii_encommaalign : in std_logic;
      sgmii_pll_locked : out std_logic;
      sgmii_elecidle : out std_logic;
      sgmii_resetdone : out std_logic;
      sgmii_loopback : in std_logic;
      sgmii_powerdown : in std_logic;
      mgt_rx_n : in std_logic;
      mgt_rx_p : in std_logic;
      mgt_tx_n : out std_logic;
      mgt_tx_p : out std_logic;
      mgt_clk_n : in std_logic;
      mgt_clk_p : in std_logic;
      mgt_reset : in std_logic;
      clk_125 : out std_logic;
      recclk_125 : out std_logic
    );
  end component;

  component system_infrastructure_inst_wrapper is
    port (
      sys_clk_n : in std_logic;
      sys_clk_p : in std_logic;
      aux_clk_n : in std_logic;
      aux_clk_p : in std_logic;
      epb_clk_in : in std_logic;
      sys_clk : out std_logic;
      sys_clk90 : out std_logic;
      sys_clk180 : out std_logic;
      sys_clk270 : out std_logic;
      sys_clk_lock : out std_logic;
      sys_clk2x : out std_logic;
      sys_clk2x90 : out std_logic;
      sys_clk2x180 : out std_logic;
      sys_clk2x270 : out std_logic;
      aux_clk : out std_logic;
      aux_clk90 : out std_logic;
      aux_clk180 : out std_logic;
      aux_clk270 : out std_logic;
      aux_clk2x : out std_logic;
      aux_clk2x90 : out std_logic;
      aux_clk2x180 : out std_logic;
      aux_clk2x270 : out std_logic;
      epb_clk : out std_logic;
      idelay_rst : in std_logic;
      idelay_rdy : out std_logic;
      op_power_on_rst : out std_logic;
      clk_200 : out std_logic;
      clk_100 : out std_logic
    );
  end component;

  component system_reset_block_inst_wrapper is
    port (
      clk : in std_logic;
      ip_async_reset_i : in std_logic;
      ip_reset_i : in std_logic;
      op_reset_o : out std_logic
    );
  end component;

  component system_opb0_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : out std_logic;
      SYS_Rst : in std_logic;
      Debug_SYS_Rst : in std_logic;
      WDT_Rst : in std_logic;
      M_ABus : in std_logic_vector(0 to 31);
      M_BE : in std_logic_vector(0 to 3);
      M_beXfer : in std_logic_vector(0 to 0);
      M_busLock : in std_logic_vector(0 to 0);
      M_DBus : in std_logic_vector(0 to 31);
      M_DBusEn : in std_logic_vector(0 to 0);
      M_DBusEn32_63 : in std_logic_vector(0 to 0);
      M_dwXfer : in std_logic_vector(0 to 0);
      M_fwXfer : in std_logic_vector(0 to 0);
      M_hwXfer : in std_logic_vector(0 to 0);
      M_request : in std_logic_vector(0 to 0);
      M_RNW : in std_logic_vector(0 to 0);
      M_select : in std_logic_vector(0 to 0);
      M_seqAddr : in std_logic_vector(0 to 0);
      Sl_beAck : in std_logic_vector(0 to 30);
      Sl_DBus : in std_logic_vector(0 to 991);
      Sl_DBusEn : in std_logic_vector(0 to 30);
      Sl_DBusEn32_63 : in std_logic_vector(0 to 30);
      Sl_errAck : in std_logic_vector(0 to 30);
      Sl_dwAck : in std_logic_vector(0 to 30);
      Sl_fwAck : in std_logic_vector(0 to 30);
      Sl_hwAck : in std_logic_vector(0 to 30);
      Sl_retry : in std_logic_vector(0 to 30);
      Sl_toutSup : in std_logic_vector(0 to 30);
      Sl_xferAck : in std_logic_vector(0 to 30);
      OPB_MRequest : out std_logic_vector(0 to 0);
      OPB_ABus : out std_logic_vector(0 to 31);
      OPB_BE : out std_logic_vector(0 to 3);
      OPB_beXfer : out std_logic;
      OPB_beAck : out std_logic;
      OPB_busLock : out std_logic;
      OPB_rdDBus : out std_logic_vector(0 to 31);
      OPB_wrDBus : out std_logic_vector(0 to 31);
      OPB_DBus : out std_logic_vector(0 to 31);
      OPB_errAck : out std_logic;
      OPB_dwAck : out std_logic;
      OPB_dwXfer : out std_logic;
      OPB_fwAck : out std_logic;
      OPB_fwXfer : out std_logic;
      OPB_hwAck : out std_logic;
      OPB_hwXfer : out std_logic;
      OPB_MGrant : out std_logic_vector(0 to 0);
      OPB_pendReq : out std_logic_vector(0 to 0);
      OPB_retry : out std_logic;
      OPB_RNW : out std_logic;
      OPB_select : out std_logic;
      OPB_seqAddr : out std_logic;
      OPB_timeout : out std_logic;
      OPB_toutSup : out std_logic;
      OPB_xferAck : out std_logic
    );
  end component;

  component system_epb_opb_bridge_inst_wrapper is
    port (
      epb_clk : in std_logic;
      epb_doe_n : out std_logic;
      epb_data_oe_n : out std_logic;
      epb_cs_n : in std_logic;
      epb_oe_n : in std_logic;
      epb_r_w_n : in std_logic;
      epb_be_n : in std_logic_vector(3 downto 0);
      epb_addr : in std_logic_vector(5 to 29);
      epb_data_i : in std_logic_vector(0 to 31);
      epb_data_o : out std_logic_vector(0 to 31);
      epb_rdy : out std_logic;
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      M_request : out std_logic;
      M_busLock : out std_logic;
      M_select : out std_logic;
      M_RNW : out std_logic;
      M_BE : out std_logic_vector(0 to 3);
      M_seqAddr : out std_logic;
      M_DBus : out std_logic_vector(0 to 31);
      M_ABus : out std_logic_vector(0 to 31);
      OPB_MGrant : in std_logic;
      OPB_xferAck : in std_logic;
      OPB_errAck : in std_logic;
      OPB_retry : in std_logic;
      OPB_timeout : in std_logic;
      OPB_DBus : in std_logic_vector(0 to 31)
    );
  end component;

  component system_epb_infrastructure_inst_wrapper is
    port (
      epb_data_buf : inout std_logic_vector(31 downto 0);
      epb_data_oe_n_i : in std_logic;
      epb_data_out_i : in std_logic_vector(31 downto 0);
      epb_data_in_o : out std_logic_vector(31 downto 0)
    );
  end component;

  component system_sys_block_inst_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      soft_reset : out std_logic;
      irq_n : out std_logic;
      app_irq : in std_logic_vector(15 downto 0);
      fab_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_xsg_core_config_wrapper is
    port (
      clk : in std_logic;
      darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_data : in std_logic_vector(7 downto 0);
      darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_full : in std_logic;
      darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_val : in std_logic;
      darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_full : in std_logic;
      darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_rst : out std_logic;
      darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_data : out std_logic_vector(7 downto 0);
      darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_rst : out std_logic;
      darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_val : out std_logic;
      darkquad29_wvl_a2g_ctrl_en_bram_dump_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_a2g_ctrl_in_val_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_a2g_ctrl_last_tx_data_user_data_in : out std_logic_vector(31 downto 0);
      darkquad29_wvl_a2g_ctrl_lut_dump_buffer_size_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_data_out : in std_logic_vector(7 downto 0);
      darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_addr : out std_logic_vector(11 downto 0);
      darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_data_in : out std_logic_vector(7 downto 0);
      darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_we : out std_logic;
      darkquad29_wvl_a2g_ctrl_lut_dump_data_period_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_a2g_ctrl_lut_dump_sending_data_user_data_in : out std_logic_vector(31 downto 0);
      darkquad29_wvl_a2g_ctrl_reg_rx_full_user_data_in : out std_logic_vector(31 downto 0);
      darkquad29_wvl_a2g_ctrl_reg_tx_full_user_data_in : out std_logic_vector(31 downto 0);
      darkquad29_wvl_a2g_ctrl_rst_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_a2g_ctrl_tx_en_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_a2g_ctrl_v7_ready_user_data_in : out std_logic_vector(31 downto 0);
      darkquad29_wvl_acc_iq_avg0_ss_bram_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_acc_iq_avg0_ss_bram_addr : out std_logic_vector(9 downto 0);
      darkquad29_wvl_acc_iq_avg0_ss_bram_data_in : out std_logic_vector(31 downto 0);
      darkquad29_wvl_acc_iq_avg0_ss_bram_we : out std_logic;
      darkquad29_wvl_acc_iq_avg0_ss_ctrl_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_acc_iq_avg0_ss_status_user_data_in : out std_logic_vector(31 downto 0);
      darkquad29_wvl_acc_iq_avg1_ss_bram_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_acc_iq_avg1_ss_bram_addr : out std_logic_vector(9 downto 0);
      darkquad29_wvl_acc_iq_avg1_ss_bram_data_in : out std_logic_vector(31 downto 0);
      darkquad29_wvl_acc_iq_avg1_ss_bram_we : out std_logic;
      darkquad29_wvl_acc_iq_avg1_ss_ctrl_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_acc_iq_avg1_ss_status_user_data_in : out std_logic_vector(31 downto 0);
      darkquad29_wvl_acc_iq_avg2_ss_bram_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_acc_iq_avg2_ss_bram_addr : out std_logic_vector(9 downto 0);
      darkquad29_wvl_acc_iq_avg2_ss_bram_data_in : out std_logic_vector(31 downto 0);
      darkquad29_wvl_acc_iq_avg2_ss_bram_we : out std_logic;
      darkquad29_wvl_acc_iq_avg2_ss_ctrl_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_acc_iq_avg2_ss_status_user_data_in : out std_logic_vector(31 downto 0);
      darkquad29_wvl_acc_iq_avg3_ss_bram_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_acc_iq_avg3_ss_bram_addr : out std_logic_vector(9 downto 0);
      darkquad29_wvl_acc_iq_avg3_ss_bram_data_in : out std_logic_vector(31 downto 0);
      darkquad29_wvl_acc_iq_avg3_ss_bram_we : out std_logic;
      darkquad29_wvl_acc_iq_avg3_ss_ctrl_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_acc_iq_avg3_ss_status_user_data_in : out std_logic_vector(31 downto 0);
      darkquad29_wvl_acc_iq_start_acc_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_adc_in_adcdac_2g_user_data_i0 : in std_logic_vector(11 downto 0);
      darkquad29_wvl_adc_in_adcdac_2g_user_data_i1 : in std_logic_vector(11 downto 0);
      darkquad29_wvl_adc_in_adcdac_2g_user_data_i2 : in std_logic_vector(11 downto 0);
      darkquad29_wvl_adc_in_adcdac_2g_user_data_i3 : in std_logic_vector(11 downto 0);
      darkquad29_wvl_adc_in_adcdac_2g_user_data_i4 : in std_logic_vector(11 downto 0);
      darkquad29_wvl_adc_in_adcdac_2g_user_data_i5 : in std_logic_vector(11 downto 0);
      darkquad29_wvl_adc_in_adcdac_2g_user_data_i6 : in std_logic_vector(11 downto 0);
      darkquad29_wvl_adc_in_adcdac_2g_user_data_i7 : in std_logic_vector(11 downto 0);
      darkquad29_wvl_adc_in_adcdac_2g_user_data_q0 : in std_logic_vector(11 downto 0);
      darkquad29_wvl_adc_in_adcdac_2g_user_data_q1 : in std_logic_vector(11 downto 0);
      darkquad29_wvl_adc_in_adcdac_2g_user_data_q2 : in std_logic_vector(11 downto 0);
      darkquad29_wvl_adc_in_adcdac_2g_user_data_q3 : in std_logic_vector(11 downto 0);
      darkquad29_wvl_adc_in_adcdac_2g_user_data_q4 : in std_logic_vector(11 downto 0);
      darkquad29_wvl_adc_in_adcdac_2g_user_data_q5 : in std_logic_vector(11 downto 0);
      darkquad29_wvl_adc_in_adcdac_2g_user_data_q6 : in std_logic_vector(11 downto 0);
      darkquad29_wvl_adc_in_adcdac_2g_user_data_q7 : in std_logic_vector(11 downto 0);
      darkquad29_wvl_adc_in_adcdac_2g_user_info_i0 : in std_logic_vector(1 downto 0);
      darkquad29_wvl_adc_in_adcdac_2g_user_info_i1 : in std_logic_vector(1 downto 0);
      darkquad29_wvl_adc_in_adcdac_2g_user_info_i2 : in std_logic_vector(1 downto 0);
      darkquad29_wvl_adc_in_adcdac_2g_user_info_i3 : in std_logic_vector(1 downto 0);
      darkquad29_wvl_adc_in_adcdac_2g_user_info_i4 : in std_logic_vector(1 downto 0);
      darkquad29_wvl_adc_in_adcdac_2g_user_info_i5 : in std_logic_vector(1 downto 0);
      darkquad29_wvl_adc_in_adcdac_2g_user_info_i6 : in std_logic_vector(1 downto 0);
      darkquad29_wvl_adc_in_adcdac_2g_user_info_i7 : in std_logic_vector(1 downto 0);
      darkquad29_wvl_adc_in_adcdac_2g_user_info_q0 : in std_logic_vector(1 downto 0);
      darkquad29_wvl_adc_in_adcdac_2g_user_info_q1 : in std_logic_vector(1 downto 0);
      darkquad29_wvl_adc_in_adcdac_2g_user_info_q2 : in std_logic_vector(1 downto 0);
      darkquad29_wvl_adc_in_adcdac_2g_user_info_q3 : in std_logic_vector(1 downto 0);
      darkquad29_wvl_adc_in_adcdac_2g_user_info_q4 : in std_logic_vector(1 downto 0);
      darkquad29_wvl_adc_in_adcdac_2g_user_info_q5 : in std_logic_vector(1 downto 0);
      darkquad29_wvl_adc_in_adcdac_2g_user_info_q6 : in std_logic_vector(1 downto 0);
      darkquad29_wvl_adc_in_adcdac_2g_user_info_q7 : in std_logic_vector(1 downto 0);
      darkquad29_wvl_adc_in_adcdac_2g_user_mmcm_locked : in std_logic;
      darkquad29_wvl_adc_in_adcdac_2g_user_sync : in std_logic;
      darkquad29_wvl_adc_in_adcdac_2g_user_valid : in std_logic;
      darkquad29_wvl_adc_in_adcdac_2g_user_dly_val : out std_logic_vector(4 downto 0);
      darkquad29_wvl_adc_in_adcdac_2g_user_inc_mmcm_phs : out std_logic;
      darkquad29_wvl_adc_in_adcdac_2g_user_load_dly0 : out std_logic_vector(5 downto 0);
      darkquad29_wvl_adc_in_adcdac_2g_user_pos_mmcm_phs : out std_logic;
      darkquad29_wvl_adc_in_adcdac_2g_user_rdy_i0 : out std_logic;
      darkquad29_wvl_adc_in_dly_val_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_adc_in_i_scale_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_adc_in_inc_phs_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_adc_in_load_dly_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_adc_in_locked_user_data_in : out std_logic_vector(31 downto 0);
      darkquad29_wvl_adc_in_n_miss_pps_user_data_in : out std_logic_vector(31 downto 0);
      darkquad29_wvl_adc_in_pos_phs_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_adc_in_raw_pps_user_data_in : out std_logic_vector(31 downto 0);
      darkquad29_wvl_adc_in_snp_cal0_ss_bram_data_out : in std_logic_vector(63 downto 0);
      darkquad29_wvl_adc_in_snp_cal0_ss_bram_addr : out std_logic_vector(8 downto 0);
      darkquad29_wvl_adc_in_snp_cal0_ss_bram_data_in : out std_logic_vector(63 downto 0);
      darkquad29_wvl_adc_in_snp_cal0_ss_bram_we : out std_logic;
      darkquad29_wvl_adc_in_snp_cal0_ss_ctrl_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_adc_in_snp_cal0_ss_status_user_data_in : out std_logic_vector(31 downto 0);
      darkquad29_wvl_adc_in_snp_cal1_ss_bram_data_out : in std_logic_vector(63 downto 0);
      darkquad29_wvl_adc_in_snp_cal1_ss_bram_addr : out std_logic_vector(8 downto 0);
      darkquad29_wvl_adc_in_snp_cal1_ss_bram_data_in : out std_logic_vector(63 downto 0);
      darkquad29_wvl_adc_in_snp_cal1_ss_bram_we : out std_logic;
      darkquad29_wvl_adc_in_snp_cal1_ss_ctrl_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_adc_in_snp_cal1_ss_status_user_data_in : out std_logic_vector(31 downto 0);
      darkquad29_wvl_adc_in_snp_cal2_ss_bram_data_out : in std_logic_vector(63 downto 0);
      darkquad29_wvl_adc_in_snp_cal2_ss_bram_addr : out std_logic_vector(8 downto 0);
      darkquad29_wvl_adc_in_snp_cal2_ss_bram_data_in : out std_logic_vector(63 downto 0);
      darkquad29_wvl_adc_in_snp_cal2_ss_bram_we : out std_logic;
      darkquad29_wvl_adc_in_snp_cal2_ss_ctrl_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_adc_in_snp_cal2_ss_status_user_data_in : out std_logic_vector(31 downto 0);
      darkquad29_wvl_adc_in_snp_cal3_ss_bram_data_out : in std_logic_vector(63 downto 0);
      darkquad29_wvl_adc_in_snp_cal3_ss_bram_addr : out std_logic_vector(8 downto 0);
      darkquad29_wvl_adc_in_snp_cal3_ss_bram_data_in : out std_logic_vector(63 downto 0);
      darkquad29_wvl_adc_in_snp_cal3_ss_bram_we : out std_logic;
      darkquad29_wvl_adc_in_snp_cal3_ss_ctrl_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_adc_in_snp_cal3_ss_status_user_data_in : out std_logic_vector(31 downto 0);
      darkquad29_wvl_adc_in_trig_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_adc_in_ts0_user_data_in : out std_logic_vector(31 downto 0);
      darkquad29_wvl_adc_in_ts1_user_data_in : out std_logic_vector(31 downto 0);
      darkquad29_wvl_adc_in_ts2_user_data_in : out std_logic_vector(31 downto 0);
      darkquad29_wvl_adc_in_ts3_user_data_in : out std_logic_vector(31 downto 0);
      darkquad29_wvl_adc_in_valid_user_data_in : out std_logic_vector(31 downto 0);
      darkquad29_wvl_board_num_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_capture0_base_kf_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_capture0_base_kq_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_capture0_cps_lim_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_data_out : in std_logic_vector(63 downto 0);
      darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_addr : out std_logic_vector(9 downto 0);
      darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_data_in : out std_logic_vector(63 downto 0);
      darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_we : out std_logic;
      darkquad29_wvl_capture0_load_thresh_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_capture0_pix_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_capture0_pix_addr : out std_logic_vector(9 downto 0);
      darkquad29_wvl_capture0_pix_data_in : out std_logic_vector(31 downto 0);
      darkquad29_wvl_capture0_pix_we : out std_logic;
      darkquad29_wvl_capture0_threshold_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_capture0_use_energy_cal_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_capture1_base_kf_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_capture1_base_kq_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_capture1_cps_lim_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_data_out : in std_logic_vector(63 downto 0);
      darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_addr : out std_logic_vector(9 downto 0);
      darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_data_in : out std_logic_vector(63 downto 0);
      darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_we : out std_logic;
      darkquad29_wvl_capture1_load_thresh_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_capture1_pix_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_capture1_pix_addr : out std_logic_vector(9 downto 0);
      darkquad29_wvl_capture1_pix_data_in : out std_logic_vector(31 downto 0);
      darkquad29_wvl_capture1_pix_we : out std_logic;
      darkquad29_wvl_capture1_threshold_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_capture1_use_energy_cal_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_capture2_base_kf_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_capture2_base_kq_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_capture2_cps_lim_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_data_out : in std_logic_vector(63 downto 0);
      darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_addr : out std_logic_vector(9 downto 0);
      darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_data_in : out std_logic_vector(63 downto 0);
      darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_we : out std_logic;
      darkquad29_wvl_capture2_load_thresh_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_capture2_pix_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_capture2_pix_addr : out std_logic_vector(9 downto 0);
      darkquad29_wvl_capture2_pix_data_in : out std_logic_vector(31 downto 0);
      darkquad29_wvl_capture2_pix_we : out std_logic;
      darkquad29_wvl_capture2_threshold_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_capture2_use_energy_cal_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_capture3_base_kf_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_capture3_base_kq_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_capture3_cps_lim_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_data_out : in std_logic_vector(63 downto 0);
      darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_addr : out std_logic_vector(9 downto 0);
      darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_data_in : out std_logic_vector(63 downto 0);
      darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_we : out std_logic;
      darkquad29_wvl_capture3_load_thresh_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_capture3_pix_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_capture3_pix_addr : out std_logic_vector(9 downto 0);
      darkquad29_wvl_capture3_pix_data_in : out std_logic_vector(31 downto 0);
      darkquad29_wvl_capture3_pix_we : out std_logic;
      darkquad29_wvl_capture3_threshold_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_capture3_use_energy_cal_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_chan_sel_ch_bin0_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_chan_sel_ch_bin1_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_chan_sel_ch_bin2_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_chan_sel_ch_bin3_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_chan_sel_load_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_check_lag_data_ch_user_data_in : out std_logic_vector(31 downto 0);
      darkquad29_wvl_check_lag_dds_ch_user_data_in : out std_logic_vector(31 downto 0);
      darkquad29_wvl_check_lag_latch_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_conv_phase0_centers_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_conv_phase0_load_centers_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_conv_phase1_centers_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_conv_phase1_load_centers_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_conv_phase2_centers_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_conv_phase2_load_centers_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_conv_phase3_centers_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_conv_phase3_load_centers_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_dds_lut_qdr0_ack : in std_logic;
      darkquad29_wvl_dds_lut_qdr0_cal_fail : in std_logic;
      darkquad29_wvl_dds_lut_qdr0_data_out : in std_logic_vector(71 downto 0);
      darkquad29_wvl_dds_lut_qdr0_data_valid : in std_logic;
      darkquad29_wvl_dds_lut_qdr0_phy_ready : in std_logic;
      darkquad29_wvl_dds_lut_qdr0_address : out std_logic_vector(31 downto 0);
      darkquad29_wvl_dds_lut_qdr0_be : out std_logic_vector(7 downto 0);
      darkquad29_wvl_dds_lut_qdr0_data_in : out std_logic_vector(71 downto 0);
      darkquad29_wvl_dds_lut_qdr0_rd_en : out std_logic;
      darkquad29_wvl_dds_lut_qdr0_wr_en : out std_logic;
      darkquad29_wvl_dds_lut_qdr1_ack : in std_logic;
      darkquad29_wvl_dds_lut_qdr1_cal_fail : in std_logic;
      darkquad29_wvl_dds_lut_qdr1_data_out : in std_logic_vector(71 downto 0);
      darkquad29_wvl_dds_lut_qdr1_data_valid : in std_logic;
      darkquad29_wvl_dds_lut_qdr1_phy_ready : in std_logic;
      darkquad29_wvl_dds_lut_qdr1_address : out std_logic_vector(31 downto 0);
      darkquad29_wvl_dds_lut_qdr1_be : out std_logic_vector(7 downto 0);
      darkquad29_wvl_dds_lut_qdr1_data_in : out std_logic_vector(71 downto 0);
      darkquad29_wvl_dds_lut_qdr1_rd_en : out std_logic;
      darkquad29_wvl_dds_lut_qdr1_wr_en : out std_logic;
      darkquad29_wvl_dds_lut_qdr2_ack : in std_logic;
      darkquad29_wvl_dds_lut_qdr2_cal_fail : in std_logic;
      darkquad29_wvl_dds_lut_qdr2_data_out : in std_logic_vector(71 downto 0);
      darkquad29_wvl_dds_lut_qdr2_data_valid : in std_logic;
      darkquad29_wvl_dds_lut_qdr2_phy_ready : in std_logic;
      darkquad29_wvl_dds_lut_qdr2_address : out std_logic_vector(31 downto 0);
      darkquad29_wvl_dds_lut_qdr2_be : out std_logic_vector(7 downto 0);
      darkquad29_wvl_dds_lut_qdr2_data_in : out std_logic_vector(71 downto 0);
      darkquad29_wvl_dds_lut_qdr2_rd_en : out std_logic;
      darkquad29_wvl_dds_lut_qdr2_wr_en : out std_logic;
      darkquad29_wvl_dds_lut_qdr3_ack : in std_logic;
      darkquad29_wvl_dds_lut_qdr3_cal_fail : in std_logic;
      darkquad29_wvl_dds_lut_qdr3_data_out : in std_logic_vector(71 downto 0);
      darkquad29_wvl_dds_lut_qdr3_data_valid : in std_logic;
      darkquad29_wvl_dds_lut_qdr3_phy_ready : in std_logic;
      darkquad29_wvl_dds_lut_qdr3_address : out std_logic_vector(31 downto 0);
      darkquad29_wvl_dds_lut_qdr3_be : out std_logic_vector(7 downto 0);
      darkquad29_wvl_dds_lut_qdr3_data_in : out std_logic_vector(71 downto 0);
      darkquad29_wvl_dds_lut_qdr3_rd_en : out std_logic;
      darkquad29_wvl_dds_lut_qdr3_wr_en : out std_logic;
      darkquad29_wvl_dds_lut_run_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_dds_shift_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_gbe64_dest_ip_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_gbe64_one_gbe_app_dbg_data : in std_logic_vector(31 downto 0);
      darkquad29_wvl_gbe64_one_gbe_app_dbg_dvld : in std_logic;
      darkquad29_wvl_gbe64_one_gbe_app_rx_badframe : in std_logic;
      darkquad29_wvl_gbe64_one_gbe_app_rx_data : in std_logic_vector(7 downto 0);
      darkquad29_wvl_gbe64_one_gbe_app_rx_dvld : in std_logic;
      darkquad29_wvl_gbe64_one_gbe_app_rx_eof : in std_logic;
      darkquad29_wvl_gbe64_one_gbe_app_rx_overrun : in std_logic;
      darkquad29_wvl_gbe64_one_gbe_app_rx_srcip : in std_logic_vector(31 downto 0);
      darkquad29_wvl_gbe64_one_gbe_app_rx_srcport : in std_logic_vector(15 downto 0);
      darkquad29_wvl_gbe64_one_gbe_app_tx_afull : in std_logic;
      darkquad29_wvl_gbe64_one_gbe_app_tx_overflow : in std_logic;
      darkquad29_wvl_gbe64_one_gbe_app_rx_ack : out std_logic;
      darkquad29_wvl_gbe64_one_gbe_app_rx_rst : out std_logic;
      darkquad29_wvl_gbe64_one_gbe_app_tx_data : out std_logic_vector(7 downto 0);
      darkquad29_wvl_gbe64_one_gbe_app_tx_destip : out std_logic_vector(31 downto 0);
      darkquad29_wvl_gbe64_one_gbe_app_tx_destport : out std_logic_vector(15 downto 0);
      darkquad29_wvl_gbe64_one_gbe_app_tx_dvld : out std_logic;
      darkquad29_wvl_gbe64_one_gbe_app_tx_eof : out std_logic;
      darkquad29_wvl_gbe64_one_gbe_app_tx_rst : out std_logic;
      darkquad29_wvl_gbe64_rst_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_gbe64_tx_afull_user_data_in : out std_logic_vector(31 downto 0);
      darkquad29_wvl_gbe64_tx_overrun_user_data_in : out std_logic_vector(31 downto 0);
      darkquad29_wvl_gbe64_words_per_frame_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_n_eof_sent_user_data_in : out std_logic_vector(31 downto 0);
      darkquad29_wvl_n_photons_user_data_in : out std_logic_vector(31 downto 0);
      darkquad29_wvl_pfb_fft_check_fft_oflow_user_data_in : out std_logic_vector(31 downto 0);
      darkquad29_wvl_phase_dmp_ch_we_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_phase_dmp_on_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_phase_port_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_photon_port_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_prog_fir0_load_chan_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_prog_fir0_single_chan_coeffs_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_prog_fir0_single_chan_coeffs_addr : out std_logic_vector(9 downto 0);
      darkquad29_wvl_prog_fir0_single_chan_coeffs_data_in : out std_logic_vector(31 downto 0);
      darkquad29_wvl_prog_fir0_single_chan_coeffs_we : out std_logic;
      darkquad29_wvl_prog_fir1_load_chan_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_prog_fir1_single_chan_coeffs_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_prog_fir1_single_chan_coeffs_addr : out std_logic_vector(9 downto 0);
      darkquad29_wvl_prog_fir1_single_chan_coeffs_data_in : out std_logic_vector(31 downto 0);
      darkquad29_wvl_prog_fir1_single_chan_coeffs_we : out std_logic;
      darkquad29_wvl_prog_fir2_load_chan_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_prog_fir2_single_chan_coeffs_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_prog_fir2_single_chan_coeffs_addr : out std_logic_vector(9 downto 0);
      darkquad29_wvl_prog_fir2_single_chan_coeffs_data_in : out std_logic_vector(31 downto 0);
      darkquad29_wvl_prog_fir2_single_chan_coeffs_we : out std_logic;
      darkquad29_wvl_prog_fir3_load_chan_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_prog_fir3_single_chan_coeffs_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_prog_fir3_single_chan_coeffs_addr : out std_logic_vector(9 downto 0);
      darkquad29_wvl_prog_fir3_single_chan_coeffs_data_in : out std_logic_vector(31 downto 0);
      darkquad29_wvl_prog_fir3_single_chan_coeffs_we : out std_logic;
      darkquad29_wvl_run_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_sel_ch_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_snp_phs_ss_bram_data_out : in std_logic_vector(63 downto 0);
      darkquad29_wvl_snp_phs_ss_bram_addr : out std_logic_vector(8 downto 0);
      darkquad29_wvl_snp_phs_ss_bram_data_in : out std_logic_vector(63 downto 0);
      darkquad29_wvl_snp_phs_ss_bram_we : out std_logic;
      darkquad29_wvl_snp_phs_ss_ctrl_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_snp_phs_ss_status_user_data_in : out std_logic_vector(31 downto 0);
      darkquad29_wvl_start_cap_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_timekeeper_base_ts_user_data_out : in std_logic_vector(31 downto 0);
      darkquad29_wvl_timekeeper_sec_now_user_data_in : out std_logic_vector(31 downto 0);
      darkquad29_wvl_trig_snp_user_data_out : in std_logic_vector(31 downto 0)
    );
  end component;

  component system_darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_wrapper is
    port (
      zdok_tx_data_p : out std_logic;
      zdok_tx_data_n : out std_logic;
      zdok_rx_data_p : in std_logic;
      zdok_rx_data_n : in std_logic;
      fpga_clk : in std_logic;
      user_tx_rst : in std_logic;
      user_rx_rst : in std_logic;
      user_tx_data : in std_logic_vector(7 downto 0);
      user_tx_val : in std_logic;
      user_tx_full : out std_logic;
      user_rx_full : out std_logic;
      user_rx_data : out std_logic_vector(7 downto 0);
      user_rx_val : out std_logic
    );
  end component;

  component system_darkquad29_wvl_a2g_ctrl_en_bram_dump_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_a2g_ctrl_in_val_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_a2g_ctrl_last_tx_data_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_in : in std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_a2g_ctrl_lut_dump_buffer_size_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_ramblk_wrapper is
    port (
      clk : in std_logic;
      bram_we : in std_logic;
      bram_en_a : in std_logic;
      bram_addr : in std_logic_vector(11 downto 0);
      bram_rd_data : out std_logic_vector(7 downto 0);
      bram_wr_data : in std_logic_vector(7 downto 0);
      BRAM_Rst_B : in std_logic;
      BRAM_Clk_B : in std_logic;
      BRAM_EN_B : in std_logic;
      BRAM_WEN_B : in std_logic_vector(0 to 3);
      BRAM_Addr_B : in std_logic_vector(0 to 31);
      BRAM_Din_B : out std_logic_vector(0 to 31);
      BRAM_Dout_B : in std_logic_vector(0 to 31)
    );
  end component;

  component system_darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_wrapper is
    port (
      opb_clk : in std_logic;
      opb_rst : in std_logic;
      opb_abus : in std_logic_vector(0 to 31);
      opb_dbus : in std_logic_vector(0 to 31);
      sln_dbus : out std_logic_vector(0 to 31);
      opb_select : in std_logic;
      opb_rnw : in std_logic;
      opb_seqaddr : in std_logic;
      opb_be : in std_logic_vector(0 to 3);
      sln_xferack : out std_logic;
      sln_errack : out std_logic;
      sln_toutsup : out std_logic;
      sln_retry : out std_logic;
      bram_rst : out std_logic;
      bram_clk : out std_logic;
      bram_en : out std_logic;
      bram_wen : out std_logic_vector(0 to 3);
      bram_addr : out std_logic_vector(0 to 31);
      bram_din : in std_logic_vector(0 to 31);
      bram_dout : out std_logic_vector(0 to 31)
    );
  end component;

  component system_darkquad29_wvl_a2g_ctrl_lut_dump_data_period_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_a2g_ctrl_lut_dump_sending_data_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_in : in std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_a2g_ctrl_reg_rx_full_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_in : in std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_a2g_ctrl_reg_tx_full_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_in : in std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_a2g_ctrl_rst_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_a2g_ctrl_tx_en_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_a2g_ctrl_v7_ready_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_in : in std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_acc_iq_avg0_ss_bram_ramblk_wrapper is
    port (
      clk : in std_logic;
      bram_we : in std_logic;
      bram_en_a : in std_logic;
      bram_addr : in std_logic_vector(9 downto 0);
      bram_rd_data : out std_logic_vector(31 downto 0);
      bram_wr_data : in std_logic_vector(31 downto 0);
      BRAM_Rst_B : in std_logic;
      BRAM_Clk_B : in std_logic;
      BRAM_EN_B : in std_logic;
      BRAM_WEN_B : in std_logic_vector(0 to 3);
      BRAM_Addr_B : in std_logic_vector(0 to 31);
      BRAM_Din_B : out std_logic_vector(0 to 31);
      BRAM_Dout_B : in std_logic_vector(0 to 31)
    );
  end component;

  component system_darkquad29_wvl_acc_iq_avg0_ss_bram_wrapper is
    port (
      opb_clk : in std_logic;
      opb_rst : in std_logic;
      opb_abus : in std_logic_vector(0 to 31);
      opb_dbus : in std_logic_vector(0 to 31);
      sln_dbus : out std_logic_vector(0 to 31);
      opb_select : in std_logic;
      opb_rnw : in std_logic;
      opb_seqaddr : in std_logic;
      opb_be : in std_logic_vector(0 to 3);
      sln_xferack : out std_logic;
      sln_errack : out std_logic;
      sln_toutsup : out std_logic;
      sln_retry : out std_logic;
      bram_rst : out std_logic;
      bram_clk : out std_logic;
      bram_en : out std_logic;
      bram_wen : out std_logic_vector(0 to 3);
      bram_addr : out std_logic_vector(0 to 31);
      bram_din : in std_logic_vector(0 to 31);
      bram_dout : out std_logic_vector(0 to 31)
    );
  end component;

  component system_darkquad29_wvl_acc_iq_avg0_ss_ctrl_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_acc_iq_avg0_ss_status_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_in : in std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_acc_iq_avg1_ss_bram_ramblk_wrapper is
    port (
      clk : in std_logic;
      bram_we : in std_logic;
      bram_en_a : in std_logic;
      bram_addr : in std_logic_vector(9 downto 0);
      bram_rd_data : out std_logic_vector(31 downto 0);
      bram_wr_data : in std_logic_vector(31 downto 0);
      BRAM_Rst_B : in std_logic;
      BRAM_Clk_B : in std_logic;
      BRAM_EN_B : in std_logic;
      BRAM_WEN_B : in std_logic_vector(0 to 3);
      BRAM_Addr_B : in std_logic_vector(0 to 31);
      BRAM_Din_B : out std_logic_vector(0 to 31);
      BRAM_Dout_B : in std_logic_vector(0 to 31)
    );
  end component;

  component system_darkquad29_wvl_acc_iq_avg1_ss_bram_wrapper is
    port (
      opb_clk : in std_logic;
      opb_rst : in std_logic;
      opb_abus : in std_logic_vector(0 to 31);
      opb_dbus : in std_logic_vector(0 to 31);
      sln_dbus : out std_logic_vector(0 to 31);
      opb_select : in std_logic;
      opb_rnw : in std_logic;
      opb_seqaddr : in std_logic;
      opb_be : in std_logic_vector(0 to 3);
      sln_xferack : out std_logic;
      sln_errack : out std_logic;
      sln_toutsup : out std_logic;
      sln_retry : out std_logic;
      bram_rst : out std_logic;
      bram_clk : out std_logic;
      bram_en : out std_logic;
      bram_wen : out std_logic_vector(0 to 3);
      bram_addr : out std_logic_vector(0 to 31);
      bram_din : in std_logic_vector(0 to 31);
      bram_dout : out std_logic_vector(0 to 31)
    );
  end component;

  component system_darkquad29_wvl_acc_iq_avg1_ss_ctrl_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_acc_iq_avg1_ss_status_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_in : in std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_acc_iq_avg2_ss_bram_ramblk_wrapper is
    port (
      clk : in std_logic;
      bram_we : in std_logic;
      bram_en_a : in std_logic;
      bram_addr : in std_logic_vector(9 downto 0);
      bram_rd_data : out std_logic_vector(31 downto 0);
      bram_wr_data : in std_logic_vector(31 downto 0);
      BRAM_Rst_B : in std_logic;
      BRAM_Clk_B : in std_logic;
      BRAM_EN_B : in std_logic;
      BRAM_WEN_B : in std_logic_vector(0 to 3);
      BRAM_Addr_B : in std_logic_vector(0 to 31);
      BRAM_Din_B : out std_logic_vector(0 to 31);
      BRAM_Dout_B : in std_logic_vector(0 to 31)
    );
  end component;

  component system_darkquad29_wvl_acc_iq_avg2_ss_bram_wrapper is
    port (
      opb_clk : in std_logic;
      opb_rst : in std_logic;
      opb_abus : in std_logic_vector(0 to 31);
      opb_dbus : in std_logic_vector(0 to 31);
      sln_dbus : out std_logic_vector(0 to 31);
      opb_select : in std_logic;
      opb_rnw : in std_logic;
      opb_seqaddr : in std_logic;
      opb_be : in std_logic_vector(0 to 3);
      sln_xferack : out std_logic;
      sln_errack : out std_logic;
      sln_toutsup : out std_logic;
      sln_retry : out std_logic;
      bram_rst : out std_logic;
      bram_clk : out std_logic;
      bram_en : out std_logic;
      bram_wen : out std_logic_vector(0 to 3);
      bram_addr : out std_logic_vector(0 to 31);
      bram_din : in std_logic_vector(0 to 31);
      bram_dout : out std_logic_vector(0 to 31)
    );
  end component;

  component system_darkquad29_wvl_acc_iq_avg2_ss_ctrl_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_acc_iq_avg2_ss_status_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_in : in std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_acc_iq_avg3_ss_bram_ramblk_wrapper is
    port (
      clk : in std_logic;
      bram_we : in std_logic;
      bram_en_a : in std_logic;
      bram_addr : in std_logic_vector(9 downto 0);
      bram_rd_data : out std_logic_vector(31 downto 0);
      bram_wr_data : in std_logic_vector(31 downto 0);
      BRAM_Rst_B : in std_logic;
      BRAM_Clk_B : in std_logic;
      BRAM_EN_B : in std_logic;
      BRAM_WEN_B : in std_logic_vector(0 to 3);
      BRAM_Addr_B : in std_logic_vector(0 to 31);
      BRAM_Din_B : out std_logic_vector(0 to 31);
      BRAM_Dout_B : in std_logic_vector(0 to 31)
    );
  end component;

  component system_darkquad29_wvl_acc_iq_avg3_ss_bram_wrapper is
    port (
      opb_clk : in std_logic;
      opb_rst : in std_logic;
      opb_abus : in std_logic_vector(0 to 31);
      opb_dbus : in std_logic_vector(0 to 31);
      sln_dbus : out std_logic_vector(0 to 31);
      opb_select : in std_logic;
      opb_rnw : in std_logic;
      opb_seqaddr : in std_logic;
      opb_be : in std_logic_vector(0 to 3);
      sln_xferack : out std_logic;
      sln_errack : out std_logic;
      sln_toutsup : out std_logic;
      sln_retry : out std_logic;
      bram_rst : out std_logic;
      bram_clk : out std_logic;
      bram_en : out std_logic;
      bram_wen : out std_logic_vector(0 to 3);
      bram_addr : out std_logic_vector(0 to 31);
      bram_din : in std_logic_vector(0 to 31);
      bram_dout : out std_logic_vector(0 to 31)
    );
  end component;

  component system_darkquad29_wvl_acc_iq_avg3_ss_ctrl_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_acc_iq_avg3_ss_status_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_in : in std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_acc_iq_start_acc_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_adc_in_adcdac_2g_wrapper is
    port (
      data0_p : in std_logic_vector(11 downto 0);
      data0_n : in std_logic_vector(11 downto 0);
      data1_p : in std_logic_vector(11 downto 0);
      data1_n : in std_logic_vector(11 downto 0);
      data2_p : in std_logic_vector(11 downto 0);
      data2_n : in std_logic_vector(11 downto 0);
      data3_p : in std_logic_vector(11 downto 0);
      data3_n : in std_logic_vector(11 downto 0);
      info0_p : in std_logic_vector(1 downto 0);
      info0_n : in std_logic_vector(1 downto 0);
      info1_p : in std_logic_vector(1 downto 0);
      info1_n : in std_logic_vector(1 downto 0);
      info2_p : in std_logic_vector(1 downto 0);
      info2_n : in std_logic_vector(1 downto 0);
      info3_p : in std_logic_vector(1 downto 0);
      info3_n : in std_logic_vector(1 downto 0);
      valid_p : in std_logic;
      valid_n : in std_logic;
      data0_smpl_clk_p : in std_logic;
      data0_smpl_clk_n : in std_logic;
      data0_rdy_p : out std_logic;
      data0_rdy_n : out std_logic;
      sync_out_p : out std_logic;
      sync_out_n : out std_logic;
      sync_pps_p : in std_logic;
      sync_pps_n : in std_logic;
      adc_clk_out : out std_logic;
      adc_clk90_out : out std_logic;
      adc_clk180_out : out std_logic;
      adc_clk270_out : out std_logic;
      sys_clk : in std_logic;
      adc_mmcm_locked : out std_logic;
      user_data_i0 : out std_logic_vector(11 downto 0);
      user_data_i1 : out std_logic_vector(11 downto 0);
      user_data_i2 : out std_logic_vector(11 downto 0);
      user_data_i3 : out std_logic_vector(11 downto 0);
      user_data_i4 : out std_logic_vector(11 downto 0);
      user_data_i5 : out std_logic_vector(11 downto 0);
      user_data_i6 : out std_logic_vector(11 downto 0);
      user_data_i7 : out std_logic_vector(11 downto 0);
      user_data_q0 : out std_logic_vector(11 downto 0);
      user_data_q1 : out std_logic_vector(11 downto 0);
      user_data_q2 : out std_logic_vector(11 downto 0);
      user_data_q3 : out std_logic_vector(11 downto 0);
      user_data_q4 : out std_logic_vector(11 downto 0);
      user_data_q5 : out std_logic_vector(11 downto 0);
      user_data_q6 : out std_logic_vector(11 downto 0);
      user_data_q7 : out std_logic_vector(11 downto 0);
      user_info_i0 : out std_logic_vector(1 downto 0);
      user_info_i1 : out std_logic_vector(1 downto 0);
      user_info_i2 : out std_logic_vector(1 downto 0);
      user_info_i3 : out std_logic_vector(1 downto 0);
      user_info_i4 : out std_logic_vector(1 downto 0);
      user_info_i5 : out std_logic_vector(1 downto 0);
      user_info_i6 : out std_logic_vector(1 downto 0);
      user_info_i7 : out std_logic_vector(1 downto 0);
      user_info_q0 : out std_logic_vector(1 downto 0);
      user_info_q1 : out std_logic_vector(1 downto 0);
      user_info_q2 : out std_logic_vector(1 downto 0);
      user_info_q3 : out std_logic_vector(1 downto 0);
      user_info_q4 : out std_logic_vector(1 downto 0);
      user_info_q5 : out std_logic_vector(1 downto 0);
      user_info_q6 : out std_logic_vector(1 downto 0);
      user_info_q7 : out std_logic_vector(1 downto 0);
      user_valid : out std_logic;
      user_rdy_i0 : in std_logic;
      user_dly_val : in std_logic_vector(4 downto 0);
      user_load_dly0 : in std_logic_vector(5 downto 0);
      user_pos_mmcm_phs : in std_logic;
      user_inc_mmcm_phs : in std_logic;
      user_sync : out std_logic;
      user_mmcm_locked : out std_logic
    );
  end component;

  component system_darkquad29_wvl_adc_in_dly_val_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_adc_in_i_scale_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_adc_in_inc_phs_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_adc_in_load_dly_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_adc_in_locked_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_in : in std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_adc_in_n_miss_pps_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_in : in std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_adc_in_pos_phs_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_adc_in_raw_pps_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_in : in std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_adc_in_snp_cal0_ss_bram_ramblk_wrapper is
    port (
      clk : in std_logic;
      bram_we : in std_logic;
      bram_en_a : in std_logic;
      bram_addr : in std_logic_vector(8 downto 0);
      bram_rd_data : out std_logic_vector(63 downto 0);
      bram_wr_data : in std_logic_vector(63 downto 0);
      BRAM_Rst_B : in std_logic;
      BRAM_Clk_B : in std_logic;
      BRAM_EN_B : in std_logic;
      BRAM_WEN_B : in std_logic_vector(0 to 3);
      BRAM_Addr_B : in std_logic_vector(0 to 31);
      BRAM_Din_B : out std_logic_vector(0 to 31);
      BRAM_Dout_B : in std_logic_vector(0 to 31)
    );
  end component;

  component system_darkquad29_wvl_adc_in_snp_cal0_ss_bram_wrapper is
    port (
      opb_clk : in std_logic;
      opb_rst : in std_logic;
      opb_abus : in std_logic_vector(0 to 31);
      opb_dbus : in std_logic_vector(0 to 31);
      sln_dbus : out std_logic_vector(0 to 31);
      opb_select : in std_logic;
      opb_rnw : in std_logic;
      opb_seqaddr : in std_logic;
      opb_be : in std_logic_vector(0 to 3);
      sln_xferack : out std_logic;
      sln_errack : out std_logic;
      sln_toutsup : out std_logic;
      sln_retry : out std_logic;
      bram_rst : out std_logic;
      bram_clk : out std_logic;
      bram_en : out std_logic;
      bram_wen : out std_logic_vector(0 to 3);
      bram_addr : out std_logic_vector(0 to 31);
      bram_din : in std_logic_vector(0 to 31);
      bram_dout : out std_logic_vector(0 to 31)
    );
  end component;

  component system_darkquad29_wvl_adc_in_snp_cal0_ss_ctrl_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_adc_in_snp_cal0_ss_status_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_in : in std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_adc_in_snp_cal1_ss_bram_ramblk_wrapper is
    port (
      clk : in std_logic;
      bram_we : in std_logic;
      bram_en_a : in std_logic;
      bram_addr : in std_logic_vector(8 downto 0);
      bram_rd_data : out std_logic_vector(63 downto 0);
      bram_wr_data : in std_logic_vector(63 downto 0);
      BRAM_Rst_B : in std_logic;
      BRAM_Clk_B : in std_logic;
      BRAM_EN_B : in std_logic;
      BRAM_WEN_B : in std_logic_vector(0 to 3);
      BRAM_Addr_B : in std_logic_vector(0 to 31);
      BRAM_Din_B : out std_logic_vector(0 to 31);
      BRAM_Dout_B : in std_logic_vector(0 to 31)
    );
  end component;

  component system_darkquad29_wvl_adc_in_snp_cal1_ss_bram_wrapper is
    port (
      opb_clk : in std_logic;
      opb_rst : in std_logic;
      opb_abus : in std_logic_vector(0 to 31);
      opb_dbus : in std_logic_vector(0 to 31);
      sln_dbus : out std_logic_vector(0 to 31);
      opb_select : in std_logic;
      opb_rnw : in std_logic;
      opb_seqaddr : in std_logic;
      opb_be : in std_logic_vector(0 to 3);
      sln_xferack : out std_logic;
      sln_errack : out std_logic;
      sln_toutsup : out std_logic;
      sln_retry : out std_logic;
      bram_rst : out std_logic;
      bram_clk : out std_logic;
      bram_en : out std_logic;
      bram_wen : out std_logic_vector(0 to 3);
      bram_addr : out std_logic_vector(0 to 31);
      bram_din : in std_logic_vector(0 to 31);
      bram_dout : out std_logic_vector(0 to 31)
    );
  end component;

  component system_darkquad29_wvl_adc_in_snp_cal1_ss_ctrl_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_adc_in_snp_cal1_ss_status_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_in : in std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_adc_in_snp_cal2_ss_bram_ramblk_wrapper is
    port (
      clk : in std_logic;
      bram_we : in std_logic;
      bram_en_a : in std_logic;
      bram_addr : in std_logic_vector(8 downto 0);
      bram_rd_data : out std_logic_vector(63 downto 0);
      bram_wr_data : in std_logic_vector(63 downto 0);
      BRAM_Rst_B : in std_logic;
      BRAM_Clk_B : in std_logic;
      BRAM_EN_B : in std_logic;
      BRAM_WEN_B : in std_logic_vector(0 to 3);
      BRAM_Addr_B : in std_logic_vector(0 to 31);
      BRAM_Din_B : out std_logic_vector(0 to 31);
      BRAM_Dout_B : in std_logic_vector(0 to 31)
    );
  end component;

  component system_darkquad29_wvl_adc_in_snp_cal2_ss_bram_wrapper is
    port (
      opb_clk : in std_logic;
      opb_rst : in std_logic;
      opb_abus : in std_logic_vector(0 to 31);
      opb_dbus : in std_logic_vector(0 to 31);
      sln_dbus : out std_logic_vector(0 to 31);
      opb_select : in std_logic;
      opb_rnw : in std_logic;
      opb_seqaddr : in std_logic;
      opb_be : in std_logic_vector(0 to 3);
      sln_xferack : out std_logic;
      sln_errack : out std_logic;
      sln_toutsup : out std_logic;
      sln_retry : out std_logic;
      bram_rst : out std_logic;
      bram_clk : out std_logic;
      bram_en : out std_logic;
      bram_wen : out std_logic_vector(0 to 3);
      bram_addr : out std_logic_vector(0 to 31);
      bram_din : in std_logic_vector(0 to 31);
      bram_dout : out std_logic_vector(0 to 31)
    );
  end component;

  component system_darkquad29_wvl_adc_in_snp_cal2_ss_ctrl_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_adc_in_snp_cal2_ss_status_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_in : in std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_adc_in_snp_cal3_ss_bram_ramblk_wrapper is
    port (
      clk : in std_logic;
      bram_we : in std_logic;
      bram_en_a : in std_logic;
      bram_addr : in std_logic_vector(8 downto 0);
      bram_rd_data : out std_logic_vector(63 downto 0);
      bram_wr_data : in std_logic_vector(63 downto 0);
      BRAM_Rst_B : in std_logic;
      BRAM_Clk_B : in std_logic;
      BRAM_EN_B : in std_logic;
      BRAM_WEN_B : in std_logic_vector(0 to 3);
      BRAM_Addr_B : in std_logic_vector(0 to 31);
      BRAM_Din_B : out std_logic_vector(0 to 31);
      BRAM_Dout_B : in std_logic_vector(0 to 31)
    );
  end component;

  component system_darkquad29_wvl_adc_in_snp_cal3_ss_bram_wrapper is
    port (
      opb_clk : in std_logic;
      opb_rst : in std_logic;
      opb_abus : in std_logic_vector(0 to 31);
      opb_dbus : in std_logic_vector(0 to 31);
      sln_dbus : out std_logic_vector(0 to 31);
      opb_select : in std_logic;
      opb_rnw : in std_logic;
      opb_seqaddr : in std_logic;
      opb_be : in std_logic_vector(0 to 3);
      sln_xferack : out std_logic;
      sln_errack : out std_logic;
      sln_toutsup : out std_logic;
      sln_retry : out std_logic;
      bram_rst : out std_logic;
      bram_clk : out std_logic;
      bram_en : out std_logic;
      bram_wen : out std_logic_vector(0 to 3);
      bram_addr : out std_logic_vector(0 to 31);
      bram_din : in std_logic_vector(0 to 31);
      bram_dout : out std_logic_vector(0 to 31)
    );
  end component;

  component system_darkquad29_wvl_adc_in_snp_cal3_ss_ctrl_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_adc_in_snp_cal3_ss_status_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_in : in std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_adc_in_trig_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_adc_in_ts0_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_in : in std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_adc_in_ts1_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_in : in std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_adc_in_ts2_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_in : in std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_adc_in_ts3_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_in : in std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_adc_in_valid_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_in : in std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_board_num_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_capture0_base_kf_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_capture0_base_kq_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_capture0_cps_lim_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_ramblk_wrapper is
    port (
      clk : in std_logic;
      bram_we : in std_logic;
      bram_en_a : in std_logic;
      bram_addr : in std_logic_vector(9 downto 0);
      bram_rd_data : out std_logic_vector(63 downto 0);
      bram_wr_data : in std_logic_vector(63 downto 0);
      BRAM_Rst_B : in std_logic;
      BRAM_Clk_B : in std_logic;
      BRAM_EN_B : in std_logic;
      BRAM_WEN_B : in std_logic_vector(0 to 3);
      BRAM_Addr_B : in std_logic_vector(0 to 31);
      BRAM_Din_B : out std_logic_vector(0 to 31);
      BRAM_Dout_B : in std_logic_vector(0 to 31)
    );
  end component;

  component system_darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_wrapper is
    port (
      opb_clk : in std_logic;
      opb_rst : in std_logic;
      opb_abus : in std_logic_vector(0 to 31);
      opb_dbus : in std_logic_vector(0 to 31);
      sln_dbus : out std_logic_vector(0 to 31);
      opb_select : in std_logic;
      opb_rnw : in std_logic;
      opb_seqaddr : in std_logic;
      opb_be : in std_logic_vector(0 to 3);
      sln_xferack : out std_logic;
      sln_errack : out std_logic;
      sln_toutsup : out std_logic;
      sln_retry : out std_logic;
      bram_rst : out std_logic;
      bram_clk : out std_logic;
      bram_en : out std_logic;
      bram_wen : out std_logic_vector(0 to 3);
      bram_addr : out std_logic_vector(0 to 31);
      bram_din : in std_logic_vector(0 to 31);
      bram_dout : out std_logic_vector(0 to 31)
    );
  end component;

  component system_darkquad29_wvl_capture0_load_thresh_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_capture0_pix_ramblk_wrapper is
    port (
      clk : in std_logic;
      bram_we : in std_logic;
      bram_en_a : in std_logic;
      bram_addr : in std_logic_vector(9 downto 0);
      bram_rd_data : out std_logic_vector(31 downto 0);
      bram_wr_data : in std_logic_vector(31 downto 0);
      BRAM_Rst_B : in std_logic;
      BRAM_Clk_B : in std_logic;
      BRAM_EN_B : in std_logic;
      BRAM_WEN_B : in std_logic_vector(0 to 3);
      BRAM_Addr_B : in std_logic_vector(0 to 31);
      BRAM_Din_B : out std_logic_vector(0 to 31);
      BRAM_Dout_B : in std_logic_vector(0 to 31)
    );
  end component;

  component system_darkquad29_wvl_capture0_pix_wrapper is
    port (
      opb_clk : in std_logic;
      opb_rst : in std_logic;
      opb_abus : in std_logic_vector(0 to 31);
      opb_dbus : in std_logic_vector(0 to 31);
      sln_dbus : out std_logic_vector(0 to 31);
      opb_select : in std_logic;
      opb_rnw : in std_logic;
      opb_seqaddr : in std_logic;
      opb_be : in std_logic_vector(0 to 3);
      sln_xferack : out std_logic;
      sln_errack : out std_logic;
      sln_toutsup : out std_logic;
      sln_retry : out std_logic;
      bram_rst : out std_logic;
      bram_clk : out std_logic;
      bram_en : out std_logic;
      bram_wen : out std_logic_vector(0 to 3);
      bram_addr : out std_logic_vector(0 to 31);
      bram_din : in std_logic_vector(0 to 31);
      bram_dout : out std_logic_vector(0 to 31)
    );
  end component;

  component system_darkquad29_wvl_capture0_threshold_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_capture0_use_energy_cal_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_capture1_base_kf_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_capture1_base_kq_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_capture1_cps_lim_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_ramblk_wrapper is
    port (
      clk : in std_logic;
      bram_we : in std_logic;
      bram_en_a : in std_logic;
      bram_addr : in std_logic_vector(9 downto 0);
      bram_rd_data : out std_logic_vector(63 downto 0);
      bram_wr_data : in std_logic_vector(63 downto 0);
      BRAM_Rst_B : in std_logic;
      BRAM_Clk_B : in std_logic;
      BRAM_EN_B : in std_logic;
      BRAM_WEN_B : in std_logic_vector(0 to 3);
      BRAM_Addr_B : in std_logic_vector(0 to 31);
      BRAM_Din_B : out std_logic_vector(0 to 31);
      BRAM_Dout_B : in std_logic_vector(0 to 31)
    );
  end component;

  component system_darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_wrapper is
    port (
      opb_clk : in std_logic;
      opb_rst : in std_logic;
      opb_abus : in std_logic_vector(0 to 31);
      opb_dbus : in std_logic_vector(0 to 31);
      sln_dbus : out std_logic_vector(0 to 31);
      opb_select : in std_logic;
      opb_rnw : in std_logic;
      opb_seqaddr : in std_logic;
      opb_be : in std_logic_vector(0 to 3);
      sln_xferack : out std_logic;
      sln_errack : out std_logic;
      sln_toutsup : out std_logic;
      sln_retry : out std_logic;
      bram_rst : out std_logic;
      bram_clk : out std_logic;
      bram_en : out std_logic;
      bram_wen : out std_logic_vector(0 to 3);
      bram_addr : out std_logic_vector(0 to 31);
      bram_din : in std_logic_vector(0 to 31);
      bram_dout : out std_logic_vector(0 to 31)
    );
  end component;

  component system_darkquad29_wvl_capture1_load_thresh_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_capture1_pix_ramblk_wrapper is
    port (
      clk : in std_logic;
      bram_we : in std_logic;
      bram_en_a : in std_logic;
      bram_addr : in std_logic_vector(9 downto 0);
      bram_rd_data : out std_logic_vector(31 downto 0);
      bram_wr_data : in std_logic_vector(31 downto 0);
      BRAM_Rst_B : in std_logic;
      BRAM_Clk_B : in std_logic;
      BRAM_EN_B : in std_logic;
      BRAM_WEN_B : in std_logic_vector(0 to 3);
      BRAM_Addr_B : in std_logic_vector(0 to 31);
      BRAM_Din_B : out std_logic_vector(0 to 31);
      BRAM_Dout_B : in std_logic_vector(0 to 31)
    );
  end component;

  component system_darkquad29_wvl_capture1_pix_wrapper is
    port (
      opb_clk : in std_logic;
      opb_rst : in std_logic;
      opb_abus : in std_logic_vector(0 to 31);
      opb_dbus : in std_logic_vector(0 to 31);
      sln_dbus : out std_logic_vector(0 to 31);
      opb_select : in std_logic;
      opb_rnw : in std_logic;
      opb_seqaddr : in std_logic;
      opb_be : in std_logic_vector(0 to 3);
      sln_xferack : out std_logic;
      sln_errack : out std_logic;
      sln_toutsup : out std_logic;
      sln_retry : out std_logic;
      bram_rst : out std_logic;
      bram_clk : out std_logic;
      bram_en : out std_logic;
      bram_wen : out std_logic_vector(0 to 3);
      bram_addr : out std_logic_vector(0 to 31);
      bram_din : in std_logic_vector(0 to 31);
      bram_dout : out std_logic_vector(0 to 31)
    );
  end component;

  component system_darkquad29_wvl_capture1_threshold_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_capture1_use_energy_cal_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_capture2_base_kf_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_capture2_base_kq_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_capture2_cps_lim_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_ramblk_wrapper is
    port (
      clk : in std_logic;
      bram_we : in std_logic;
      bram_en_a : in std_logic;
      bram_addr : in std_logic_vector(9 downto 0);
      bram_rd_data : out std_logic_vector(63 downto 0);
      bram_wr_data : in std_logic_vector(63 downto 0);
      BRAM_Rst_B : in std_logic;
      BRAM_Clk_B : in std_logic;
      BRAM_EN_B : in std_logic;
      BRAM_WEN_B : in std_logic_vector(0 to 3);
      BRAM_Addr_B : in std_logic_vector(0 to 31);
      BRAM_Din_B : out std_logic_vector(0 to 31);
      BRAM_Dout_B : in std_logic_vector(0 to 31)
    );
  end component;

  component system_darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_wrapper is
    port (
      opb_clk : in std_logic;
      opb_rst : in std_logic;
      opb_abus : in std_logic_vector(0 to 31);
      opb_dbus : in std_logic_vector(0 to 31);
      sln_dbus : out std_logic_vector(0 to 31);
      opb_select : in std_logic;
      opb_rnw : in std_logic;
      opb_seqaddr : in std_logic;
      opb_be : in std_logic_vector(0 to 3);
      sln_xferack : out std_logic;
      sln_errack : out std_logic;
      sln_toutsup : out std_logic;
      sln_retry : out std_logic;
      bram_rst : out std_logic;
      bram_clk : out std_logic;
      bram_en : out std_logic;
      bram_wen : out std_logic_vector(0 to 3);
      bram_addr : out std_logic_vector(0 to 31);
      bram_din : in std_logic_vector(0 to 31);
      bram_dout : out std_logic_vector(0 to 31)
    );
  end component;

  component system_darkquad29_wvl_capture2_load_thresh_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_capture2_pix_ramblk_wrapper is
    port (
      clk : in std_logic;
      bram_we : in std_logic;
      bram_en_a : in std_logic;
      bram_addr : in std_logic_vector(9 downto 0);
      bram_rd_data : out std_logic_vector(31 downto 0);
      bram_wr_data : in std_logic_vector(31 downto 0);
      BRAM_Rst_B : in std_logic;
      BRAM_Clk_B : in std_logic;
      BRAM_EN_B : in std_logic;
      BRAM_WEN_B : in std_logic_vector(0 to 3);
      BRAM_Addr_B : in std_logic_vector(0 to 31);
      BRAM_Din_B : out std_logic_vector(0 to 31);
      BRAM_Dout_B : in std_logic_vector(0 to 31)
    );
  end component;

  component system_darkquad29_wvl_capture2_pix_wrapper is
    port (
      opb_clk : in std_logic;
      opb_rst : in std_logic;
      opb_abus : in std_logic_vector(0 to 31);
      opb_dbus : in std_logic_vector(0 to 31);
      sln_dbus : out std_logic_vector(0 to 31);
      opb_select : in std_logic;
      opb_rnw : in std_logic;
      opb_seqaddr : in std_logic;
      opb_be : in std_logic_vector(0 to 3);
      sln_xferack : out std_logic;
      sln_errack : out std_logic;
      sln_toutsup : out std_logic;
      sln_retry : out std_logic;
      bram_rst : out std_logic;
      bram_clk : out std_logic;
      bram_en : out std_logic;
      bram_wen : out std_logic_vector(0 to 3);
      bram_addr : out std_logic_vector(0 to 31);
      bram_din : in std_logic_vector(0 to 31);
      bram_dout : out std_logic_vector(0 to 31)
    );
  end component;

  component system_darkquad29_wvl_capture2_threshold_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_capture2_use_energy_cal_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_capture3_base_kf_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_capture3_base_kq_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_capture3_cps_lim_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_ramblk_wrapper is
    port (
      clk : in std_logic;
      bram_we : in std_logic;
      bram_en_a : in std_logic;
      bram_addr : in std_logic_vector(9 downto 0);
      bram_rd_data : out std_logic_vector(63 downto 0);
      bram_wr_data : in std_logic_vector(63 downto 0);
      BRAM_Rst_B : in std_logic;
      BRAM_Clk_B : in std_logic;
      BRAM_EN_B : in std_logic;
      BRAM_WEN_B : in std_logic_vector(0 to 3);
      BRAM_Addr_B : in std_logic_vector(0 to 31);
      BRAM_Din_B : out std_logic_vector(0 to 31);
      BRAM_Dout_B : in std_logic_vector(0 to 31)
    );
  end component;

  component system_darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_wrapper is
    port (
      opb_clk : in std_logic;
      opb_rst : in std_logic;
      opb_abus : in std_logic_vector(0 to 31);
      opb_dbus : in std_logic_vector(0 to 31);
      sln_dbus : out std_logic_vector(0 to 31);
      opb_select : in std_logic;
      opb_rnw : in std_logic;
      opb_seqaddr : in std_logic;
      opb_be : in std_logic_vector(0 to 3);
      sln_xferack : out std_logic;
      sln_errack : out std_logic;
      sln_toutsup : out std_logic;
      sln_retry : out std_logic;
      bram_rst : out std_logic;
      bram_clk : out std_logic;
      bram_en : out std_logic;
      bram_wen : out std_logic_vector(0 to 3);
      bram_addr : out std_logic_vector(0 to 31);
      bram_din : in std_logic_vector(0 to 31);
      bram_dout : out std_logic_vector(0 to 31)
    );
  end component;

  component system_darkquad29_wvl_capture3_load_thresh_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_capture3_pix_ramblk_wrapper is
    port (
      clk : in std_logic;
      bram_we : in std_logic;
      bram_en_a : in std_logic;
      bram_addr : in std_logic_vector(9 downto 0);
      bram_rd_data : out std_logic_vector(31 downto 0);
      bram_wr_data : in std_logic_vector(31 downto 0);
      BRAM_Rst_B : in std_logic;
      BRAM_Clk_B : in std_logic;
      BRAM_EN_B : in std_logic;
      BRAM_WEN_B : in std_logic_vector(0 to 3);
      BRAM_Addr_B : in std_logic_vector(0 to 31);
      BRAM_Din_B : out std_logic_vector(0 to 31);
      BRAM_Dout_B : in std_logic_vector(0 to 31)
    );
  end component;

  component system_darkquad29_wvl_capture3_pix_wrapper is
    port (
      opb_clk : in std_logic;
      opb_rst : in std_logic;
      opb_abus : in std_logic_vector(0 to 31);
      opb_dbus : in std_logic_vector(0 to 31);
      sln_dbus : out std_logic_vector(0 to 31);
      opb_select : in std_logic;
      opb_rnw : in std_logic;
      opb_seqaddr : in std_logic;
      opb_be : in std_logic_vector(0 to 3);
      sln_xferack : out std_logic;
      sln_errack : out std_logic;
      sln_toutsup : out std_logic;
      sln_retry : out std_logic;
      bram_rst : out std_logic;
      bram_clk : out std_logic;
      bram_en : out std_logic;
      bram_wen : out std_logic_vector(0 to 3);
      bram_addr : out std_logic_vector(0 to 31);
      bram_din : in std_logic_vector(0 to 31);
      bram_dout : out std_logic_vector(0 to 31)
    );
  end component;

  component system_darkquad29_wvl_capture3_threshold_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_capture3_use_energy_cal_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_chan_sel_ch_bin0_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_chan_sel_ch_bin1_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_chan_sel_ch_bin2_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_chan_sel_ch_bin3_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_chan_sel_load_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_check_lag_data_ch_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_in : in std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_check_lag_dds_ch_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_in : in std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_check_lag_latch_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_conv_phase0_centers_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_conv_phase0_load_centers_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_conv_phase1_centers_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_conv_phase1_load_centers_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_conv_phase2_centers_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_conv_phase2_load_centers_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_conv_phase3_centers_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_conv_phase3_load_centers_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_qdr0_controller_wrapper is
    port (
      clk0 : in std_logic;
      clk180 : in std_logic;
      clk270 : in std_logic;
      dly_clk : in std_logic;
      reset : in std_logic;
      idelay_rdy : in std_logic;
      qdr_k_n : out std_logic;
      qdr_k : out std_logic;
      qdr_d : out std_logic_vector(35 downto 0);
      qdr_sa : out std_logic_vector(20 downto 0);
      qdr_w_n : out std_logic;
      qdr_r_n : out std_logic;
      qdr_q : in std_logic_vector(35 downto 0);
      qdr_dll_off_n : out std_logic;
      phy_rdy : out std_logic;
      cal_fail : out std_logic;
      dly_extra_clk : in std_logic;
      dly_en_i : in std_logic_vector(35 downto 0);
      dly_en_o : in std_logic_vector(36 downto 0);
      dly_inc_dec : in std_logic;
      dly_cntrs : out std_logic_vector(364 downto 0);
      usr_addr : in std_logic_vector(20 downto 0);
      usr_wr_strb : in std_logic;
      usr_wr_data : in std_logic_vector(71 downto 0);
      usr_wr_be : in std_logic_vector(7 downto 0);
      usr_rd_strb : in std_logic;
      usr_rd_data : out std_logic_vector(71 downto 0);
      usr_rd_dvld : out std_logic
    );
  end component;

  component system_qdr0_sniffer_wrapper is
    port (
      OPB_Clk_config : in std_logic;
      OPB_Rst_config : in std_logic;
      Sl_DBus_config : out std_logic_vector(0 to 31);
      Sl_errAck_config : out std_logic;
      Sl_retry_config : out std_logic;
      Sl_toutSup_config : out std_logic;
      Sl_xferAck_config : out std_logic;
      OPB_ABus_config : in std_logic_vector(0 to 31);
      OPB_BE_config : in std_logic_vector(0 to 3);
      OPB_DBus_config : in std_logic_vector(0 to 31);
      OPB_RNW_config : in std_logic;
      OPB_select_config : in std_logic;
      OPB_seqAddr_config : in std_logic;
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      qdr_clk : in std_logic;
      master_addr : out std_logic_vector(20 downto 0);
      master_wr_strb : out std_logic;
      master_wr_data : out std_logic_vector(71 downto 0);
      master_wr_be : out std_logic_vector(7 downto 0);
      master_rd_strb : out std_logic;
      master_rd_data : in std_logic_vector(71 downto 0);
      master_rd_dvld : in std_logic;
      slave_addr : in std_logic_vector(31 downto 0);
      slave_wr_strb : in std_logic;
      slave_wr_data : in std_logic_vector(71 downto 0);
      slave_wr_be : in std_logic_vector(7 downto 0);
      slave_rd_strb : in std_logic;
      slave_rd_data : out std_logic_vector(71 downto 0);
      slave_rd_dvld : out std_logic;
      slave_ack : out std_logic;
      dly_clk : in std_logic;
      dly_en_i : out std_logic_vector(35 downto 0);
      dly_en_o : out std_logic_vector(36 downto 0);
      dly_inc_dec : out std_logic;
      dly_cntrs : in std_logic_vector(364 downto 0);
      dly_extra_clk : out std_logic;
      phy_rdy : in std_logic;
      cal_fail : in std_logic;
      qdr_reset : out std_logic
    );
  end component;

  component system_qdr1_controller_wrapper is
    port (
      clk0 : in std_logic;
      clk180 : in std_logic;
      clk270 : in std_logic;
      dly_clk : in std_logic;
      reset : in std_logic;
      idelay_rdy : in std_logic;
      qdr_k_n : out std_logic;
      qdr_k : out std_logic;
      qdr_d : out std_logic_vector(35 downto 0);
      qdr_sa : out std_logic_vector(20 downto 0);
      qdr_w_n : out std_logic;
      qdr_r_n : out std_logic;
      qdr_q : in std_logic_vector(35 downto 0);
      qdr_dll_off_n : out std_logic;
      phy_rdy : out std_logic;
      cal_fail : out std_logic;
      dly_extra_clk : in std_logic;
      dly_en_i : in std_logic_vector(35 downto 0);
      dly_en_o : in std_logic_vector(36 downto 0);
      dly_inc_dec : in std_logic;
      dly_cntrs : out std_logic_vector(364 downto 0);
      usr_addr : in std_logic_vector(20 downto 0);
      usr_wr_strb : in std_logic;
      usr_wr_data : in std_logic_vector(71 downto 0);
      usr_wr_be : in std_logic_vector(7 downto 0);
      usr_rd_strb : in std_logic;
      usr_rd_data : out std_logic_vector(71 downto 0);
      usr_rd_dvld : out std_logic
    );
  end component;

  component system_qdr1_sniffer_wrapper is
    port (
      OPB_Clk_config : in std_logic;
      OPB_Rst_config : in std_logic;
      Sl_DBus_config : out std_logic_vector(0 to 31);
      Sl_errAck_config : out std_logic;
      Sl_retry_config : out std_logic;
      Sl_toutSup_config : out std_logic;
      Sl_xferAck_config : out std_logic;
      OPB_ABus_config : in std_logic_vector(0 to 31);
      OPB_BE_config : in std_logic_vector(0 to 3);
      OPB_DBus_config : in std_logic_vector(0 to 31);
      OPB_RNW_config : in std_logic;
      OPB_select_config : in std_logic;
      OPB_seqAddr_config : in std_logic;
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      qdr_clk : in std_logic;
      master_addr : out std_logic_vector(20 downto 0);
      master_wr_strb : out std_logic;
      master_wr_data : out std_logic_vector(71 downto 0);
      master_wr_be : out std_logic_vector(7 downto 0);
      master_rd_strb : out std_logic;
      master_rd_data : in std_logic_vector(71 downto 0);
      master_rd_dvld : in std_logic;
      slave_addr : in std_logic_vector(31 downto 0);
      slave_wr_strb : in std_logic;
      slave_wr_data : in std_logic_vector(71 downto 0);
      slave_wr_be : in std_logic_vector(7 downto 0);
      slave_rd_strb : in std_logic;
      slave_rd_data : out std_logic_vector(71 downto 0);
      slave_rd_dvld : out std_logic;
      slave_ack : out std_logic;
      dly_clk : in std_logic;
      dly_en_i : out std_logic_vector(35 downto 0);
      dly_en_o : out std_logic_vector(36 downto 0);
      dly_inc_dec : out std_logic;
      dly_cntrs : in std_logic_vector(364 downto 0);
      dly_extra_clk : out std_logic;
      phy_rdy : in std_logic;
      cal_fail : in std_logic;
      qdr_reset : out std_logic
    );
  end component;

  component system_qdr2_controller_wrapper is
    port (
      clk0 : in std_logic;
      clk180 : in std_logic;
      clk270 : in std_logic;
      dly_clk : in std_logic;
      reset : in std_logic;
      idelay_rdy : in std_logic;
      qdr_k_n : out std_logic;
      qdr_k : out std_logic;
      qdr_d : out std_logic_vector(35 downto 0);
      qdr_sa : out std_logic_vector(20 downto 0);
      qdr_w_n : out std_logic;
      qdr_r_n : out std_logic;
      qdr_q : in std_logic_vector(35 downto 0);
      qdr_dll_off_n : out std_logic;
      phy_rdy : out std_logic;
      cal_fail : out std_logic;
      dly_extra_clk : in std_logic;
      dly_en_i : in std_logic_vector(35 downto 0);
      dly_en_o : in std_logic_vector(36 downto 0);
      dly_inc_dec : in std_logic;
      dly_cntrs : out std_logic_vector(364 downto 0);
      usr_addr : in std_logic_vector(20 downto 0);
      usr_wr_strb : in std_logic;
      usr_wr_data : in std_logic_vector(71 downto 0);
      usr_wr_be : in std_logic_vector(7 downto 0);
      usr_rd_strb : in std_logic;
      usr_rd_data : out std_logic_vector(71 downto 0);
      usr_rd_dvld : out std_logic
    );
  end component;

  component system_qdr2_sniffer_wrapper is
    port (
      OPB_Clk_config : in std_logic;
      OPB_Rst_config : in std_logic;
      Sl_DBus_config : out std_logic_vector(0 to 31);
      Sl_errAck_config : out std_logic;
      Sl_retry_config : out std_logic;
      Sl_toutSup_config : out std_logic;
      Sl_xferAck_config : out std_logic;
      OPB_ABus_config : in std_logic_vector(0 to 31);
      OPB_BE_config : in std_logic_vector(0 to 3);
      OPB_DBus_config : in std_logic_vector(0 to 31);
      OPB_RNW_config : in std_logic;
      OPB_select_config : in std_logic;
      OPB_seqAddr_config : in std_logic;
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      qdr_clk : in std_logic;
      master_addr : out std_logic_vector(20 downto 0);
      master_wr_strb : out std_logic;
      master_wr_data : out std_logic_vector(71 downto 0);
      master_wr_be : out std_logic_vector(7 downto 0);
      master_rd_strb : out std_logic;
      master_rd_data : in std_logic_vector(71 downto 0);
      master_rd_dvld : in std_logic;
      slave_addr : in std_logic_vector(31 downto 0);
      slave_wr_strb : in std_logic;
      slave_wr_data : in std_logic_vector(71 downto 0);
      slave_wr_be : in std_logic_vector(7 downto 0);
      slave_rd_strb : in std_logic;
      slave_rd_data : out std_logic_vector(71 downto 0);
      slave_rd_dvld : out std_logic;
      slave_ack : out std_logic;
      dly_clk : in std_logic;
      dly_en_i : out std_logic_vector(35 downto 0);
      dly_en_o : out std_logic_vector(36 downto 0);
      dly_inc_dec : out std_logic;
      dly_cntrs : in std_logic_vector(364 downto 0);
      dly_extra_clk : out std_logic;
      phy_rdy : in std_logic;
      cal_fail : in std_logic;
      qdr_reset : out std_logic
    );
  end component;

  component system_qdr3_controller_wrapper is
    port (
      clk0 : in std_logic;
      clk180 : in std_logic;
      clk270 : in std_logic;
      dly_clk : in std_logic;
      reset : in std_logic;
      idelay_rdy : in std_logic;
      qdr_k_n : out std_logic;
      qdr_k : out std_logic;
      qdr_d : out std_logic_vector(35 downto 0);
      qdr_sa : out std_logic_vector(20 downto 0);
      qdr_w_n : out std_logic;
      qdr_r_n : out std_logic;
      qdr_q : in std_logic_vector(35 downto 0);
      qdr_dll_off_n : out std_logic;
      phy_rdy : out std_logic;
      cal_fail : out std_logic;
      dly_extra_clk : in std_logic;
      dly_en_i : in std_logic_vector(35 downto 0);
      dly_en_o : in std_logic_vector(36 downto 0);
      dly_inc_dec : in std_logic;
      dly_cntrs : out std_logic_vector(364 downto 0);
      usr_addr : in std_logic_vector(20 downto 0);
      usr_wr_strb : in std_logic;
      usr_wr_data : in std_logic_vector(71 downto 0);
      usr_wr_be : in std_logic_vector(7 downto 0);
      usr_rd_strb : in std_logic;
      usr_rd_data : out std_logic_vector(71 downto 0);
      usr_rd_dvld : out std_logic
    );
  end component;

  component system_qdr3_sniffer_wrapper is
    port (
      OPB_Clk_config : in std_logic;
      OPB_Rst_config : in std_logic;
      Sl_DBus_config : out std_logic_vector(0 to 31);
      Sl_errAck_config : out std_logic;
      Sl_retry_config : out std_logic;
      Sl_toutSup_config : out std_logic;
      Sl_xferAck_config : out std_logic;
      OPB_ABus_config : in std_logic_vector(0 to 31);
      OPB_BE_config : in std_logic_vector(0 to 3);
      OPB_DBus_config : in std_logic_vector(0 to 31);
      OPB_RNW_config : in std_logic;
      OPB_select_config : in std_logic;
      OPB_seqAddr_config : in std_logic;
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      qdr_clk : in std_logic;
      master_addr : out std_logic_vector(20 downto 0);
      master_wr_strb : out std_logic;
      master_wr_data : out std_logic_vector(71 downto 0);
      master_wr_be : out std_logic_vector(7 downto 0);
      master_rd_strb : out std_logic;
      master_rd_data : in std_logic_vector(71 downto 0);
      master_rd_dvld : in std_logic;
      slave_addr : in std_logic_vector(31 downto 0);
      slave_wr_strb : in std_logic;
      slave_wr_data : in std_logic_vector(71 downto 0);
      slave_wr_be : in std_logic_vector(7 downto 0);
      slave_rd_strb : in std_logic;
      slave_rd_data : out std_logic_vector(71 downto 0);
      slave_rd_dvld : out std_logic;
      slave_ack : out std_logic;
      dly_clk : in std_logic;
      dly_en_i : out std_logic_vector(35 downto 0);
      dly_en_o : out std_logic_vector(36 downto 0);
      dly_inc_dec : out std_logic;
      dly_cntrs : in std_logic_vector(364 downto 0);
      dly_extra_clk : out std_logic;
      phy_rdy : in std_logic;
      cal_fail : in std_logic;
      qdr_reset : out std_logic
    );
  end component;

  component system_darkquad29_wvl_dds_lut_run_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_dds_shift_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_gbe64_dest_ip_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_gbe64_one_gbe_wrapper is
    port (
      app_clk : in std_logic;
      app_tx_rst : in std_logic;
      app_rx_rst : in std_logic;
      mac_tx_rst : in std_logic;
      mac_rx_rst : in std_logic;
      app_tx_data : in std_logic_vector(7 downto 0);
      app_tx_dvld : in std_logic;
      app_tx_eof : in std_logic;
      app_tx_destip : in std_logic_vector(31 downto 0);
      app_tx_destport : in std_logic_vector(15 downto 0);
      app_tx_afull : out std_logic;
      app_tx_overflow : out std_logic;
      app_rx_data : out std_logic_vector(7 downto 0);
      app_rx_dvld : out std_logic;
      app_rx_eof : out std_logic;
      app_rx_srcip : out std_logic_vector(31 downto 0);
      app_rx_srcport : out std_logic_vector(15 downto 0);
      app_rx_badframe : out std_logic;
      app_rx_overrun : out std_logic;
      app_rx_ack : in std_logic;
      app_dbg_data : out std_logic_vector(31 downto 0);
      app_dbg_dvld : out std_logic;
      mac_rx_clk : in std_logic;
      mac_rx_data : in std_logic_vector(7 downto 0);
      mac_rx_dvld : in std_logic;
      mac_rx_goodframe : in std_logic;
      mac_rx_badframe : in std_logic;
      mac_tx_clk : in std_logic;
      mac_tx_data : out std_logic_vector(7 downto 0);
      mac_tx_dvld : out std_logic;
      mac_tx_ack : in std_logic;
      mac_syncacquired : in std_logic;
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic
    );
  end component;

  component system_darkquad29_wvl_gbe64_rst_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_gbe64_tx_afull_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_in : in std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_gbe64_tx_overrun_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_in : in std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_gbe64_words_per_frame_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_n_eof_sent_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_in : in std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_n_photons_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_in : in std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_pfb_fft_check_fft_oflow_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_in : in std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_phase_dmp_ch_we_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_phase_dmp_on_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_phase_port_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_photon_port_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_prog_fir0_load_chan_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_prog_fir0_single_chan_coeffs_ramblk_wrapper is
    port (
      clk : in std_logic;
      bram_we : in std_logic;
      bram_en_a : in std_logic;
      bram_addr : in std_logic_vector(9 downto 0);
      bram_rd_data : out std_logic_vector(31 downto 0);
      bram_wr_data : in std_logic_vector(31 downto 0);
      BRAM_Rst_B : in std_logic;
      BRAM_Clk_B : in std_logic;
      BRAM_EN_B : in std_logic;
      BRAM_WEN_B : in std_logic_vector(0 to 3);
      BRAM_Addr_B : in std_logic_vector(0 to 31);
      BRAM_Din_B : out std_logic_vector(0 to 31);
      BRAM_Dout_B : in std_logic_vector(0 to 31)
    );
  end component;

  component system_darkquad29_wvl_prog_fir0_single_chan_coeffs_wrapper is
    port (
      opb_clk : in std_logic;
      opb_rst : in std_logic;
      opb_abus : in std_logic_vector(0 to 31);
      opb_dbus : in std_logic_vector(0 to 31);
      sln_dbus : out std_logic_vector(0 to 31);
      opb_select : in std_logic;
      opb_rnw : in std_logic;
      opb_seqaddr : in std_logic;
      opb_be : in std_logic_vector(0 to 3);
      sln_xferack : out std_logic;
      sln_errack : out std_logic;
      sln_toutsup : out std_logic;
      sln_retry : out std_logic;
      bram_rst : out std_logic;
      bram_clk : out std_logic;
      bram_en : out std_logic;
      bram_wen : out std_logic_vector(0 to 3);
      bram_addr : out std_logic_vector(0 to 31);
      bram_din : in std_logic_vector(0 to 31);
      bram_dout : out std_logic_vector(0 to 31)
    );
  end component;

  component system_darkquad29_wvl_prog_fir1_load_chan_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_prog_fir1_single_chan_coeffs_ramblk_wrapper is
    port (
      clk : in std_logic;
      bram_we : in std_logic;
      bram_en_a : in std_logic;
      bram_addr : in std_logic_vector(9 downto 0);
      bram_rd_data : out std_logic_vector(31 downto 0);
      bram_wr_data : in std_logic_vector(31 downto 0);
      BRAM_Rst_B : in std_logic;
      BRAM_Clk_B : in std_logic;
      BRAM_EN_B : in std_logic;
      BRAM_WEN_B : in std_logic_vector(0 to 3);
      BRAM_Addr_B : in std_logic_vector(0 to 31);
      BRAM_Din_B : out std_logic_vector(0 to 31);
      BRAM_Dout_B : in std_logic_vector(0 to 31)
    );
  end component;

  component system_darkquad29_wvl_prog_fir1_single_chan_coeffs_wrapper is
    port (
      opb_clk : in std_logic;
      opb_rst : in std_logic;
      opb_abus : in std_logic_vector(0 to 31);
      opb_dbus : in std_logic_vector(0 to 31);
      sln_dbus : out std_logic_vector(0 to 31);
      opb_select : in std_logic;
      opb_rnw : in std_logic;
      opb_seqaddr : in std_logic;
      opb_be : in std_logic_vector(0 to 3);
      sln_xferack : out std_logic;
      sln_errack : out std_logic;
      sln_toutsup : out std_logic;
      sln_retry : out std_logic;
      bram_rst : out std_logic;
      bram_clk : out std_logic;
      bram_en : out std_logic;
      bram_wen : out std_logic_vector(0 to 3);
      bram_addr : out std_logic_vector(0 to 31);
      bram_din : in std_logic_vector(0 to 31);
      bram_dout : out std_logic_vector(0 to 31)
    );
  end component;

  component system_darkquad29_wvl_prog_fir2_load_chan_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_prog_fir2_single_chan_coeffs_ramblk_wrapper is
    port (
      clk : in std_logic;
      bram_we : in std_logic;
      bram_en_a : in std_logic;
      bram_addr : in std_logic_vector(9 downto 0);
      bram_rd_data : out std_logic_vector(31 downto 0);
      bram_wr_data : in std_logic_vector(31 downto 0);
      BRAM_Rst_B : in std_logic;
      BRAM_Clk_B : in std_logic;
      BRAM_EN_B : in std_logic;
      BRAM_WEN_B : in std_logic_vector(0 to 3);
      BRAM_Addr_B : in std_logic_vector(0 to 31);
      BRAM_Din_B : out std_logic_vector(0 to 31);
      BRAM_Dout_B : in std_logic_vector(0 to 31)
    );
  end component;

  component system_darkquad29_wvl_prog_fir2_single_chan_coeffs_wrapper is
    port (
      opb_clk : in std_logic;
      opb_rst : in std_logic;
      opb_abus : in std_logic_vector(0 to 31);
      opb_dbus : in std_logic_vector(0 to 31);
      sln_dbus : out std_logic_vector(0 to 31);
      opb_select : in std_logic;
      opb_rnw : in std_logic;
      opb_seqaddr : in std_logic;
      opb_be : in std_logic_vector(0 to 3);
      sln_xferack : out std_logic;
      sln_errack : out std_logic;
      sln_toutsup : out std_logic;
      sln_retry : out std_logic;
      bram_rst : out std_logic;
      bram_clk : out std_logic;
      bram_en : out std_logic;
      bram_wen : out std_logic_vector(0 to 3);
      bram_addr : out std_logic_vector(0 to 31);
      bram_din : in std_logic_vector(0 to 31);
      bram_dout : out std_logic_vector(0 to 31)
    );
  end component;

  component system_darkquad29_wvl_prog_fir3_load_chan_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_prog_fir3_single_chan_coeffs_ramblk_wrapper is
    port (
      clk : in std_logic;
      bram_we : in std_logic;
      bram_en_a : in std_logic;
      bram_addr : in std_logic_vector(9 downto 0);
      bram_rd_data : out std_logic_vector(31 downto 0);
      bram_wr_data : in std_logic_vector(31 downto 0);
      BRAM_Rst_B : in std_logic;
      BRAM_Clk_B : in std_logic;
      BRAM_EN_B : in std_logic;
      BRAM_WEN_B : in std_logic_vector(0 to 3);
      BRAM_Addr_B : in std_logic_vector(0 to 31);
      BRAM_Din_B : out std_logic_vector(0 to 31);
      BRAM_Dout_B : in std_logic_vector(0 to 31)
    );
  end component;

  component system_darkquad29_wvl_prog_fir3_single_chan_coeffs_wrapper is
    port (
      opb_clk : in std_logic;
      opb_rst : in std_logic;
      opb_abus : in std_logic_vector(0 to 31);
      opb_dbus : in std_logic_vector(0 to 31);
      sln_dbus : out std_logic_vector(0 to 31);
      opb_select : in std_logic;
      opb_rnw : in std_logic;
      opb_seqaddr : in std_logic;
      opb_be : in std_logic_vector(0 to 3);
      sln_xferack : out std_logic;
      sln_errack : out std_logic;
      sln_toutsup : out std_logic;
      sln_retry : out std_logic;
      bram_rst : out std_logic;
      bram_clk : out std_logic;
      bram_en : out std_logic;
      bram_wen : out std_logic_vector(0 to 3);
      bram_addr : out std_logic_vector(0 to 31);
      bram_din : in std_logic_vector(0 to 31);
      bram_dout : out std_logic_vector(0 to 31)
    );
  end component;

  component system_darkquad29_wvl_run_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_sel_ch_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_snp_phs_ss_bram_ramblk_wrapper is
    port (
      clk : in std_logic;
      bram_we : in std_logic;
      bram_en_a : in std_logic;
      bram_addr : in std_logic_vector(8 downto 0);
      bram_rd_data : out std_logic_vector(63 downto 0);
      bram_wr_data : in std_logic_vector(63 downto 0);
      BRAM_Rst_B : in std_logic;
      BRAM_Clk_B : in std_logic;
      BRAM_EN_B : in std_logic;
      BRAM_WEN_B : in std_logic_vector(0 to 3);
      BRAM_Addr_B : in std_logic_vector(0 to 31);
      BRAM_Din_B : out std_logic_vector(0 to 31);
      BRAM_Dout_B : in std_logic_vector(0 to 31)
    );
  end component;

  component system_darkquad29_wvl_snp_phs_ss_bram_wrapper is
    port (
      opb_clk : in std_logic;
      opb_rst : in std_logic;
      opb_abus : in std_logic_vector(0 to 31);
      opb_dbus : in std_logic_vector(0 to 31);
      sln_dbus : out std_logic_vector(0 to 31);
      opb_select : in std_logic;
      opb_rnw : in std_logic;
      opb_seqaddr : in std_logic;
      opb_be : in std_logic_vector(0 to 3);
      sln_xferack : out std_logic;
      sln_errack : out std_logic;
      sln_toutsup : out std_logic;
      sln_retry : out std_logic;
      bram_rst : out std_logic;
      bram_clk : out std_logic;
      bram_en : out std_logic;
      bram_wen : out std_logic_vector(0 to 3);
      bram_addr : out std_logic_vector(0 to 31);
      bram_din : in std_logic_vector(0 to 31);
      bram_dout : out std_logic_vector(0 to 31)
    );
  end component;

  component system_darkquad29_wvl_snp_phs_ss_ctrl_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_snp_phs_ss_status_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_in : in std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_start_cap_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_timekeeper_base_ts_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_timekeeper_sec_now_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_in : in std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_darkquad29_wvl_trig_snp_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      OPB_ABus : in std_logic_vector(0 to 31);
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_DBus : in std_logic_vector(0 to 31);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      user_data_out : out std_logic_vector(31 downto 0);
      user_clk : in std_logic
    );
  end component;

  component system_opb1_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : out std_logic;
      SYS_Rst : in std_logic;
      Debug_SYS_Rst : in std_logic;
      WDT_Rst : in std_logic;
      M_ABus : in std_logic_vector(0 to 31);
      M_BE : in std_logic_vector(0 to 3);
      M_beXfer : in std_logic_vector(0 to 0);
      M_busLock : in std_logic_vector(0 to 0);
      M_DBus : in std_logic_vector(0 to 31);
      M_DBusEn : in std_logic_vector(0 to 0);
      M_DBusEn32_63 : in std_logic_vector(0 to 0);
      M_dwXfer : in std_logic_vector(0 to 0);
      M_fwXfer : in std_logic_vector(0 to 0);
      M_hwXfer : in std_logic_vector(0 to 0);
      M_request : in std_logic_vector(0 to 0);
      M_RNW : in std_logic_vector(0 to 0);
      M_select : in std_logic_vector(0 to 0);
      M_seqAddr : in std_logic_vector(0 to 0);
      Sl_beAck : in std_logic_vector(0 to 31);
      Sl_DBus : in std_logic_vector(0 to 1023);
      Sl_DBusEn : in std_logic_vector(0 to 31);
      Sl_DBusEn32_63 : in std_logic_vector(0 to 31);
      Sl_errAck : in std_logic_vector(0 to 31);
      Sl_dwAck : in std_logic_vector(0 to 31);
      Sl_fwAck : in std_logic_vector(0 to 31);
      Sl_hwAck : in std_logic_vector(0 to 31);
      Sl_retry : in std_logic_vector(0 to 31);
      Sl_toutSup : in std_logic_vector(0 to 31);
      Sl_xferAck : in std_logic_vector(0 to 31);
      OPB_MRequest : out std_logic_vector(0 to 0);
      OPB_ABus : out std_logic_vector(0 to 31);
      OPB_BE : out std_logic_vector(0 to 3);
      OPB_beXfer : out std_logic;
      OPB_beAck : out std_logic;
      OPB_busLock : out std_logic;
      OPB_rdDBus : out std_logic_vector(0 to 31);
      OPB_wrDBus : out std_logic_vector(0 to 31);
      OPB_DBus : out std_logic_vector(0 to 31);
      OPB_errAck : out std_logic;
      OPB_dwAck : out std_logic;
      OPB_dwXfer : out std_logic;
      OPB_fwAck : out std_logic;
      OPB_fwXfer : out std_logic;
      OPB_hwAck : out std_logic;
      OPB_hwXfer : out std_logic;
      OPB_MGrant : out std_logic_vector(0 to 0);
      OPB_pendReq : out std_logic_vector(0 to 0);
      OPB_retry : out std_logic;
      OPB_RNW : out std_logic;
      OPB_select : out std_logic;
      OPB_seqAddr : out std_logic;
      OPB_timeout : out std_logic;
      OPB_toutSup : out std_logic;
      OPB_xferAck : out std_logic
    );
  end component;

  component system_opb2opb_bridge_opb1_wrapper is
    port (
      MOPB_Clk : in std_logic;
      SOPB_Clk : in std_logic;
      MOPB_Rst : in std_logic;
      SOPB_Rst : in std_logic;
      SOPB_ABus : in std_logic_vector(0 to 31);
      SOPB_BE : in std_logic_vector(0 to 3);
      SOPB_DBus : in std_logic_vector(0 to 31);
      SOPB_RNW : in std_logic;
      SOPB_select : in std_logic;
      SOPB_seqAddr : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      M_ABus : out std_logic_vector(0 to 31);
      M_BE : out std_logic_vector(0 to 3);
      M_busLock : out std_logic;
      M_DBus : out std_logic_vector(0 to 31);
      M_request : out std_logic;
      M_RNW : out std_logic;
      M_select : out std_logic;
      M_seqAddr : out std_logic;
      MOPB_DBus : in std_logic_vector(0 to 31);
      MOPB_errAck : in std_logic;
      MOPB_MGrant : in std_logic;
      MOPB_retry : in std_logic;
      MOPB_timeout : in std_logic;
      MOPB_xferAck : in std_logic
    );
  end component;

  component system_opb2_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : out std_logic;
      SYS_Rst : in std_logic;
      Debug_SYS_Rst : in std_logic;
      WDT_Rst : in std_logic;
      M_ABus : in std_logic_vector(0 to 31);
      M_BE : in std_logic_vector(0 to 3);
      M_beXfer : in std_logic_vector(0 to 0);
      M_busLock : in std_logic_vector(0 to 0);
      M_DBus : in std_logic_vector(0 to 31);
      M_DBusEn : in std_logic_vector(0 to 0);
      M_DBusEn32_63 : in std_logic_vector(0 to 0);
      M_dwXfer : in std_logic_vector(0 to 0);
      M_fwXfer : in std_logic_vector(0 to 0);
      M_hwXfer : in std_logic_vector(0 to 0);
      M_request : in std_logic_vector(0 to 0);
      M_RNW : in std_logic_vector(0 to 0);
      M_select : in std_logic_vector(0 to 0);
      M_seqAddr : in std_logic_vector(0 to 0);
      Sl_beAck : in std_logic_vector(0 to 31);
      Sl_DBus : in std_logic_vector(0 to 1023);
      Sl_DBusEn : in std_logic_vector(0 to 31);
      Sl_DBusEn32_63 : in std_logic_vector(0 to 31);
      Sl_errAck : in std_logic_vector(0 to 31);
      Sl_dwAck : in std_logic_vector(0 to 31);
      Sl_fwAck : in std_logic_vector(0 to 31);
      Sl_hwAck : in std_logic_vector(0 to 31);
      Sl_retry : in std_logic_vector(0 to 31);
      Sl_toutSup : in std_logic_vector(0 to 31);
      Sl_xferAck : in std_logic_vector(0 to 31);
      OPB_MRequest : out std_logic_vector(0 to 0);
      OPB_ABus : out std_logic_vector(0 to 31);
      OPB_BE : out std_logic_vector(0 to 3);
      OPB_beXfer : out std_logic;
      OPB_beAck : out std_logic;
      OPB_busLock : out std_logic;
      OPB_rdDBus : out std_logic_vector(0 to 31);
      OPB_wrDBus : out std_logic_vector(0 to 31);
      OPB_DBus : out std_logic_vector(0 to 31);
      OPB_errAck : out std_logic;
      OPB_dwAck : out std_logic;
      OPB_dwXfer : out std_logic;
      OPB_fwAck : out std_logic;
      OPB_fwXfer : out std_logic;
      OPB_hwAck : out std_logic;
      OPB_hwXfer : out std_logic;
      OPB_MGrant : out std_logic_vector(0 to 0);
      OPB_pendReq : out std_logic_vector(0 to 0);
      OPB_retry : out std_logic;
      OPB_RNW : out std_logic;
      OPB_select : out std_logic;
      OPB_seqAddr : out std_logic;
      OPB_timeout : out std_logic;
      OPB_toutSup : out std_logic;
      OPB_xferAck : out std_logic
    );
  end component;

  component system_opb2opb_bridge_opb2_wrapper is
    port (
      MOPB_Clk : in std_logic;
      SOPB_Clk : in std_logic;
      MOPB_Rst : in std_logic;
      SOPB_Rst : in std_logic;
      SOPB_ABus : in std_logic_vector(0 to 31);
      SOPB_BE : in std_logic_vector(0 to 3);
      SOPB_DBus : in std_logic_vector(0 to 31);
      SOPB_RNW : in std_logic;
      SOPB_select : in std_logic;
      SOPB_seqAddr : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      M_ABus : out std_logic_vector(0 to 31);
      M_BE : out std_logic_vector(0 to 3);
      M_busLock : out std_logic;
      M_DBus : out std_logic_vector(0 to 31);
      M_request : out std_logic;
      M_RNW : out std_logic;
      M_select : out std_logic;
      M_seqAddr : out std_logic;
      MOPB_DBus : in std_logic_vector(0 to 31);
      MOPB_errAck : in std_logic;
      MOPB_MGrant : in std_logic;
      MOPB_retry : in std_logic;
      MOPB_timeout : in std_logic;
      MOPB_xferAck : in std_logic
    );
  end component;

  component system_opb3_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : out std_logic;
      SYS_Rst : in std_logic;
      Debug_SYS_Rst : in std_logic;
      WDT_Rst : in std_logic;
      M_ABus : in std_logic_vector(0 to 31);
      M_BE : in std_logic_vector(0 to 3);
      M_beXfer : in std_logic_vector(0 to 0);
      M_busLock : in std_logic_vector(0 to 0);
      M_DBus : in std_logic_vector(0 to 31);
      M_DBusEn : in std_logic_vector(0 to 0);
      M_DBusEn32_63 : in std_logic_vector(0 to 0);
      M_dwXfer : in std_logic_vector(0 to 0);
      M_fwXfer : in std_logic_vector(0 to 0);
      M_hwXfer : in std_logic_vector(0 to 0);
      M_request : in std_logic_vector(0 to 0);
      M_RNW : in std_logic_vector(0 to 0);
      M_select : in std_logic_vector(0 to 0);
      M_seqAddr : in std_logic_vector(0 to 0);
      Sl_beAck : in std_logic_vector(0 to 31);
      Sl_DBus : in std_logic_vector(0 to 1023);
      Sl_DBusEn : in std_logic_vector(0 to 31);
      Sl_DBusEn32_63 : in std_logic_vector(0 to 31);
      Sl_errAck : in std_logic_vector(0 to 31);
      Sl_dwAck : in std_logic_vector(0 to 31);
      Sl_fwAck : in std_logic_vector(0 to 31);
      Sl_hwAck : in std_logic_vector(0 to 31);
      Sl_retry : in std_logic_vector(0 to 31);
      Sl_toutSup : in std_logic_vector(0 to 31);
      Sl_xferAck : in std_logic_vector(0 to 31);
      OPB_MRequest : out std_logic_vector(0 to 0);
      OPB_ABus : out std_logic_vector(0 to 31);
      OPB_BE : out std_logic_vector(0 to 3);
      OPB_beXfer : out std_logic;
      OPB_beAck : out std_logic;
      OPB_busLock : out std_logic;
      OPB_rdDBus : out std_logic_vector(0 to 31);
      OPB_wrDBus : out std_logic_vector(0 to 31);
      OPB_DBus : out std_logic_vector(0 to 31);
      OPB_errAck : out std_logic;
      OPB_dwAck : out std_logic;
      OPB_dwXfer : out std_logic;
      OPB_fwAck : out std_logic;
      OPB_fwXfer : out std_logic;
      OPB_hwAck : out std_logic;
      OPB_hwXfer : out std_logic;
      OPB_MGrant : out std_logic_vector(0 to 0);
      OPB_pendReq : out std_logic_vector(0 to 0);
      OPB_retry : out std_logic;
      OPB_RNW : out std_logic;
      OPB_select : out std_logic;
      OPB_seqAddr : out std_logic;
      OPB_timeout : out std_logic;
      OPB_toutSup : out std_logic;
      OPB_xferAck : out std_logic
    );
  end component;

  component system_opb2opb_bridge_opb3_wrapper is
    port (
      MOPB_Clk : in std_logic;
      SOPB_Clk : in std_logic;
      MOPB_Rst : in std_logic;
      SOPB_Rst : in std_logic;
      SOPB_ABus : in std_logic_vector(0 to 31);
      SOPB_BE : in std_logic_vector(0 to 3);
      SOPB_DBus : in std_logic_vector(0 to 31);
      SOPB_RNW : in std_logic;
      SOPB_select : in std_logic;
      SOPB_seqAddr : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      M_ABus : out std_logic_vector(0 to 31);
      M_BE : out std_logic_vector(0 to 3);
      M_busLock : out std_logic;
      M_DBus : out std_logic_vector(0 to 31);
      M_request : out std_logic;
      M_RNW : out std_logic;
      M_select : out std_logic;
      M_seqAddr : out std_logic;
      MOPB_DBus : in std_logic_vector(0 to 31);
      MOPB_errAck : in std_logic;
      MOPB_MGrant : in std_logic;
      MOPB_retry : in std_logic;
      MOPB_timeout : in std_logic;
      MOPB_xferAck : in std_logic
    );
  end component;

  component system_opb4_wrapper is
    port (
      OPB_Clk : in std_logic;
      OPB_Rst : out std_logic;
      SYS_Rst : in std_logic;
      Debug_SYS_Rst : in std_logic;
      WDT_Rst : in std_logic;
      M_ABus : in std_logic_vector(0 to 31);
      M_BE : in std_logic_vector(0 to 3);
      M_beXfer : in std_logic_vector(0 to 0);
      M_busLock : in std_logic_vector(0 to 0);
      M_DBus : in std_logic_vector(0 to 31);
      M_DBusEn : in std_logic_vector(0 to 0);
      M_DBusEn32_63 : in std_logic_vector(0 to 0);
      M_dwXfer : in std_logic_vector(0 to 0);
      M_fwXfer : in std_logic_vector(0 to 0);
      M_hwXfer : in std_logic_vector(0 to 0);
      M_request : in std_logic_vector(0 to 0);
      M_RNW : in std_logic_vector(0 to 0);
      M_select : in std_logic_vector(0 to 0);
      M_seqAddr : in std_logic_vector(0 to 0);
      Sl_beAck : in std_logic_vector(0 to 17);
      Sl_DBus : in std_logic_vector(0 to 575);
      Sl_DBusEn : in std_logic_vector(0 to 17);
      Sl_DBusEn32_63 : in std_logic_vector(0 to 17);
      Sl_errAck : in std_logic_vector(0 to 17);
      Sl_dwAck : in std_logic_vector(0 to 17);
      Sl_fwAck : in std_logic_vector(0 to 17);
      Sl_hwAck : in std_logic_vector(0 to 17);
      Sl_retry : in std_logic_vector(0 to 17);
      Sl_toutSup : in std_logic_vector(0 to 17);
      Sl_xferAck : in std_logic_vector(0 to 17);
      OPB_MRequest : out std_logic_vector(0 to 0);
      OPB_ABus : out std_logic_vector(0 to 31);
      OPB_BE : out std_logic_vector(0 to 3);
      OPB_beXfer : out std_logic;
      OPB_beAck : out std_logic;
      OPB_busLock : out std_logic;
      OPB_rdDBus : out std_logic_vector(0 to 31);
      OPB_wrDBus : out std_logic_vector(0 to 31);
      OPB_DBus : out std_logic_vector(0 to 31);
      OPB_errAck : out std_logic;
      OPB_dwAck : out std_logic;
      OPB_dwXfer : out std_logic;
      OPB_fwAck : out std_logic;
      OPB_fwXfer : out std_logic;
      OPB_hwAck : out std_logic;
      OPB_hwXfer : out std_logic;
      OPB_MGrant : out std_logic_vector(0 to 0);
      OPB_pendReq : out std_logic_vector(0 to 0);
      OPB_retry : out std_logic;
      OPB_RNW : out std_logic;
      OPB_select : out std_logic;
      OPB_seqAddr : out std_logic;
      OPB_timeout : out std_logic;
      OPB_toutSup : out std_logic;
      OPB_xferAck : out std_logic
    );
  end component;

  component system_opb2opb_bridge_opb4_wrapper is
    port (
      MOPB_Clk : in std_logic;
      SOPB_Clk : in std_logic;
      MOPB_Rst : in std_logic;
      SOPB_Rst : in std_logic;
      SOPB_ABus : in std_logic_vector(0 to 31);
      SOPB_BE : in std_logic_vector(0 to 3);
      SOPB_DBus : in std_logic_vector(0 to 31);
      SOPB_RNW : in std_logic;
      SOPB_select : in std_logic;
      SOPB_seqAddr : in std_logic;
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_errAck : out std_logic;
      Sl_retry : out std_logic;
      Sl_toutSup : out std_logic;
      Sl_xferAck : out std_logic;
      M_ABus : out std_logic_vector(0 to 31);
      M_BE : out std_logic_vector(0 to 3);
      M_busLock : out std_logic;
      M_DBus : out std_logic_vector(0 to 31);
      M_request : out std_logic;
      M_RNW : out std_logic;
      M_select : out std_logic;
      M_seqAddr : out std_logic;
      MOPB_DBus : in std_logic_vector(0 to 31);
      MOPB_errAck : in std_logic;
      MOPB_MGrant : in std_logic;
      MOPB_retry : in std_logic;
      MOPB_timeout : in std_logic;
      MOPB_xferAck : in std_logic
    );
  end component;

  -- Internal signals

  signal adc0_clk : std_logic;
  signal adc0_clk180 : std_logic;
  signal adc0_clk270 : std_logic;
  signal clk_125 : std_logic;
  signal darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_data : std_logic_vector(7 downto 0);
  signal darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_full : std_logic;
  signal darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_rst : std_logic;
  signal darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_val : std_logic;
  signal darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_data : std_logic_vector(7 downto 0);
  signal darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_full : std_logic;
  signal darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_rst : std_logic;
  signal darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_val : std_logic;
  signal darkquad29_wvl_a2g_ctrl_en_bram_dump_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_a2g_ctrl_in_val_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_a2g_ctrl_last_tx_data_user_data_in : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_a2g_ctrl_lut_dump_buffer_size_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_addr : std_logic_vector(11 downto 0);
  signal darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_data_in : std_logic_vector(7 downto 0);
  signal darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_data_out : std_logic_vector(7 downto 0);
  signal darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_ramblk_portb_BRAM_Addr : std_logic_vector(0 to 31);
  signal darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_ramblk_portb_BRAM_Clk : std_logic;
  signal darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_ramblk_portb_BRAM_Din : std_logic_vector(0 to 31);
  signal darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_ramblk_portb_BRAM_Dout : std_logic_vector(0 to 31);
  signal darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_ramblk_portb_BRAM_EN : std_logic;
  signal darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_ramblk_portb_BRAM_Rst : std_logic;
  signal darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_ramblk_portb_BRAM_WEN : std_logic_vector(0 to 3);
  signal darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_we : std_logic;
  signal darkquad29_wvl_a2g_ctrl_lut_dump_data_period_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_a2g_ctrl_lut_dump_sending_data_user_data_in : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_a2g_ctrl_reg_rx_full_user_data_in : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_a2g_ctrl_reg_tx_full_user_data_in : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_a2g_ctrl_rst_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_a2g_ctrl_tx_en_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_a2g_ctrl_v7_ready_user_data_in : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_acc_iq_avg0_ss_bram_addr : std_logic_vector(9 downto 0);
  signal darkquad29_wvl_acc_iq_avg0_ss_bram_data_in : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_acc_iq_avg0_ss_bram_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_acc_iq_avg0_ss_bram_ramblk_portb_BRAM_Addr : std_logic_vector(0 to 31);
  signal darkquad29_wvl_acc_iq_avg0_ss_bram_ramblk_portb_BRAM_Clk : std_logic;
  signal darkquad29_wvl_acc_iq_avg0_ss_bram_ramblk_portb_BRAM_Din : std_logic_vector(0 to 31);
  signal darkquad29_wvl_acc_iq_avg0_ss_bram_ramblk_portb_BRAM_Dout : std_logic_vector(0 to 31);
  signal darkquad29_wvl_acc_iq_avg0_ss_bram_ramblk_portb_BRAM_EN : std_logic;
  signal darkquad29_wvl_acc_iq_avg0_ss_bram_ramblk_portb_BRAM_Rst : std_logic;
  signal darkquad29_wvl_acc_iq_avg0_ss_bram_ramblk_portb_BRAM_WEN : std_logic_vector(0 to 3);
  signal darkquad29_wvl_acc_iq_avg0_ss_bram_we : std_logic;
  signal darkquad29_wvl_acc_iq_avg0_ss_ctrl_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_acc_iq_avg0_ss_status_user_data_in : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_acc_iq_avg1_ss_bram_addr : std_logic_vector(9 downto 0);
  signal darkquad29_wvl_acc_iq_avg1_ss_bram_data_in : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_acc_iq_avg1_ss_bram_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_acc_iq_avg1_ss_bram_ramblk_portb_BRAM_Addr : std_logic_vector(0 to 31);
  signal darkquad29_wvl_acc_iq_avg1_ss_bram_ramblk_portb_BRAM_Clk : std_logic;
  signal darkquad29_wvl_acc_iq_avg1_ss_bram_ramblk_portb_BRAM_Din : std_logic_vector(0 to 31);
  signal darkquad29_wvl_acc_iq_avg1_ss_bram_ramblk_portb_BRAM_Dout : std_logic_vector(0 to 31);
  signal darkquad29_wvl_acc_iq_avg1_ss_bram_ramblk_portb_BRAM_EN : std_logic;
  signal darkquad29_wvl_acc_iq_avg1_ss_bram_ramblk_portb_BRAM_Rst : std_logic;
  signal darkquad29_wvl_acc_iq_avg1_ss_bram_ramblk_portb_BRAM_WEN : std_logic_vector(0 to 3);
  signal darkquad29_wvl_acc_iq_avg1_ss_bram_we : std_logic;
  signal darkquad29_wvl_acc_iq_avg1_ss_ctrl_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_acc_iq_avg1_ss_status_user_data_in : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_acc_iq_avg2_ss_bram_addr : std_logic_vector(9 downto 0);
  signal darkquad29_wvl_acc_iq_avg2_ss_bram_data_in : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_acc_iq_avg2_ss_bram_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_acc_iq_avg2_ss_bram_ramblk_portb_BRAM_Addr : std_logic_vector(0 to 31);
  signal darkquad29_wvl_acc_iq_avg2_ss_bram_ramblk_portb_BRAM_Clk : std_logic;
  signal darkquad29_wvl_acc_iq_avg2_ss_bram_ramblk_portb_BRAM_Din : std_logic_vector(0 to 31);
  signal darkquad29_wvl_acc_iq_avg2_ss_bram_ramblk_portb_BRAM_Dout : std_logic_vector(0 to 31);
  signal darkquad29_wvl_acc_iq_avg2_ss_bram_ramblk_portb_BRAM_EN : std_logic;
  signal darkquad29_wvl_acc_iq_avg2_ss_bram_ramblk_portb_BRAM_Rst : std_logic;
  signal darkquad29_wvl_acc_iq_avg2_ss_bram_ramblk_portb_BRAM_WEN : std_logic_vector(0 to 3);
  signal darkquad29_wvl_acc_iq_avg2_ss_bram_we : std_logic;
  signal darkquad29_wvl_acc_iq_avg2_ss_ctrl_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_acc_iq_avg2_ss_status_user_data_in : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_acc_iq_avg3_ss_bram_addr : std_logic_vector(9 downto 0);
  signal darkquad29_wvl_acc_iq_avg3_ss_bram_data_in : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_acc_iq_avg3_ss_bram_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_acc_iq_avg3_ss_bram_ramblk_portb_BRAM_Addr : std_logic_vector(0 to 31);
  signal darkquad29_wvl_acc_iq_avg3_ss_bram_ramblk_portb_BRAM_Clk : std_logic;
  signal darkquad29_wvl_acc_iq_avg3_ss_bram_ramblk_portb_BRAM_Din : std_logic_vector(0 to 31);
  signal darkquad29_wvl_acc_iq_avg3_ss_bram_ramblk_portb_BRAM_Dout : std_logic_vector(0 to 31);
  signal darkquad29_wvl_acc_iq_avg3_ss_bram_ramblk_portb_BRAM_EN : std_logic;
  signal darkquad29_wvl_acc_iq_avg3_ss_bram_ramblk_portb_BRAM_Rst : std_logic;
  signal darkquad29_wvl_acc_iq_avg3_ss_bram_ramblk_portb_BRAM_WEN : std_logic_vector(0 to 3);
  signal darkquad29_wvl_acc_iq_avg3_ss_bram_we : std_logic;
  signal darkquad29_wvl_acc_iq_avg3_ss_ctrl_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_acc_iq_avg3_ss_status_user_data_in : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_acc_iq_start_acc_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_data_i0 : std_logic_vector(11 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_data_i1 : std_logic_vector(11 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_data_i2 : std_logic_vector(11 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_data_i3 : std_logic_vector(11 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_data_i4 : std_logic_vector(11 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_data_i5 : std_logic_vector(11 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_data_i6 : std_logic_vector(11 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_data_i7 : std_logic_vector(11 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_data_q0 : std_logic_vector(11 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_data_q1 : std_logic_vector(11 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_data_q2 : std_logic_vector(11 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_data_q3 : std_logic_vector(11 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_data_q4 : std_logic_vector(11 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_data_q5 : std_logic_vector(11 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_data_q6 : std_logic_vector(11 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_data_q7 : std_logic_vector(11 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_dly_val : std_logic_vector(4 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_inc_mmcm_phs : std_logic;
  signal darkquad29_wvl_adc_in_adcdac_2g_user_info_i0 : std_logic_vector(1 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_info_i1 : std_logic_vector(1 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_info_i2 : std_logic_vector(1 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_info_i3 : std_logic_vector(1 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_info_i4 : std_logic_vector(1 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_info_i5 : std_logic_vector(1 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_info_i6 : std_logic_vector(1 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_info_i7 : std_logic_vector(1 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_info_q0 : std_logic_vector(1 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_info_q1 : std_logic_vector(1 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_info_q2 : std_logic_vector(1 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_info_q3 : std_logic_vector(1 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_info_q4 : std_logic_vector(1 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_info_q5 : std_logic_vector(1 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_info_q6 : std_logic_vector(1 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_info_q7 : std_logic_vector(1 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_load_dly0 : std_logic_vector(5 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_mmcm_locked : std_logic;
  signal darkquad29_wvl_adc_in_adcdac_2g_user_pos_mmcm_phs : std_logic;
  signal darkquad29_wvl_adc_in_adcdac_2g_user_rdy_i0 : std_logic;
  signal darkquad29_wvl_adc_in_adcdac_2g_user_sync : std_logic;
  signal darkquad29_wvl_adc_in_adcdac_2g_user_valid : std_logic;
  signal darkquad29_wvl_adc_in_dly_val_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_adc_in_i_scale_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_adc_in_inc_phs_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_adc_in_load_dly_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_adc_in_locked_user_data_in : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_adc_in_n_miss_pps_user_data_in : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_adc_in_pos_phs_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_adc_in_raw_pps_user_data_in : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_adc_in_snp_cal0_ss_bram_addr : std_logic_vector(8 downto 0);
  signal darkquad29_wvl_adc_in_snp_cal0_ss_bram_data_in : std_logic_vector(63 downto 0);
  signal darkquad29_wvl_adc_in_snp_cal0_ss_bram_data_out : std_logic_vector(63 downto 0);
  signal darkquad29_wvl_adc_in_snp_cal0_ss_bram_ramblk_portb_BRAM_Addr : std_logic_vector(0 to 31);
  signal darkquad29_wvl_adc_in_snp_cal0_ss_bram_ramblk_portb_BRAM_Clk : std_logic;
  signal darkquad29_wvl_adc_in_snp_cal0_ss_bram_ramblk_portb_BRAM_Din : std_logic_vector(0 to 31);
  signal darkquad29_wvl_adc_in_snp_cal0_ss_bram_ramblk_portb_BRAM_Dout : std_logic_vector(0 to 31);
  signal darkquad29_wvl_adc_in_snp_cal0_ss_bram_ramblk_portb_BRAM_EN : std_logic;
  signal darkquad29_wvl_adc_in_snp_cal0_ss_bram_ramblk_portb_BRAM_Rst : std_logic;
  signal darkquad29_wvl_adc_in_snp_cal0_ss_bram_ramblk_portb_BRAM_WEN : std_logic_vector(0 to 3);
  signal darkquad29_wvl_adc_in_snp_cal0_ss_bram_we : std_logic;
  signal darkquad29_wvl_adc_in_snp_cal0_ss_ctrl_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_adc_in_snp_cal0_ss_status_user_data_in : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_adc_in_snp_cal1_ss_bram_addr : std_logic_vector(8 downto 0);
  signal darkquad29_wvl_adc_in_snp_cal1_ss_bram_data_in : std_logic_vector(63 downto 0);
  signal darkquad29_wvl_adc_in_snp_cal1_ss_bram_data_out : std_logic_vector(63 downto 0);
  signal darkquad29_wvl_adc_in_snp_cal1_ss_bram_ramblk_portb_BRAM_Addr : std_logic_vector(0 to 31);
  signal darkquad29_wvl_adc_in_snp_cal1_ss_bram_ramblk_portb_BRAM_Clk : std_logic;
  signal darkquad29_wvl_adc_in_snp_cal1_ss_bram_ramblk_portb_BRAM_Din : std_logic_vector(0 to 31);
  signal darkquad29_wvl_adc_in_snp_cal1_ss_bram_ramblk_portb_BRAM_Dout : std_logic_vector(0 to 31);
  signal darkquad29_wvl_adc_in_snp_cal1_ss_bram_ramblk_portb_BRAM_EN : std_logic;
  signal darkquad29_wvl_adc_in_snp_cal1_ss_bram_ramblk_portb_BRAM_Rst : std_logic;
  signal darkquad29_wvl_adc_in_snp_cal1_ss_bram_ramblk_portb_BRAM_WEN : std_logic_vector(0 to 3);
  signal darkquad29_wvl_adc_in_snp_cal1_ss_bram_we : std_logic;
  signal darkquad29_wvl_adc_in_snp_cal1_ss_ctrl_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_adc_in_snp_cal1_ss_status_user_data_in : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_adc_in_snp_cal2_ss_bram_addr : std_logic_vector(8 downto 0);
  signal darkquad29_wvl_adc_in_snp_cal2_ss_bram_data_in : std_logic_vector(63 downto 0);
  signal darkquad29_wvl_adc_in_snp_cal2_ss_bram_data_out : std_logic_vector(63 downto 0);
  signal darkquad29_wvl_adc_in_snp_cal2_ss_bram_ramblk_portb_BRAM_Addr : std_logic_vector(0 to 31);
  signal darkquad29_wvl_adc_in_snp_cal2_ss_bram_ramblk_portb_BRAM_Clk : std_logic;
  signal darkquad29_wvl_adc_in_snp_cal2_ss_bram_ramblk_portb_BRAM_Din : std_logic_vector(0 to 31);
  signal darkquad29_wvl_adc_in_snp_cal2_ss_bram_ramblk_portb_BRAM_Dout : std_logic_vector(0 to 31);
  signal darkquad29_wvl_adc_in_snp_cal2_ss_bram_ramblk_portb_BRAM_EN : std_logic;
  signal darkquad29_wvl_adc_in_snp_cal2_ss_bram_ramblk_portb_BRAM_Rst : std_logic;
  signal darkquad29_wvl_adc_in_snp_cal2_ss_bram_ramblk_portb_BRAM_WEN : std_logic_vector(0 to 3);
  signal darkquad29_wvl_adc_in_snp_cal2_ss_bram_we : std_logic;
  signal darkquad29_wvl_adc_in_snp_cal2_ss_ctrl_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_adc_in_snp_cal2_ss_status_user_data_in : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_adc_in_snp_cal3_ss_bram_addr : std_logic_vector(8 downto 0);
  signal darkquad29_wvl_adc_in_snp_cal3_ss_bram_data_in : std_logic_vector(63 downto 0);
  signal darkquad29_wvl_adc_in_snp_cal3_ss_bram_data_out : std_logic_vector(63 downto 0);
  signal darkquad29_wvl_adc_in_snp_cal3_ss_bram_ramblk_portb_BRAM_Addr : std_logic_vector(0 to 31);
  signal darkquad29_wvl_adc_in_snp_cal3_ss_bram_ramblk_portb_BRAM_Clk : std_logic;
  signal darkquad29_wvl_adc_in_snp_cal3_ss_bram_ramblk_portb_BRAM_Din : std_logic_vector(0 to 31);
  signal darkquad29_wvl_adc_in_snp_cal3_ss_bram_ramblk_portb_BRAM_Dout : std_logic_vector(0 to 31);
  signal darkquad29_wvl_adc_in_snp_cal3_ss_bram_ramblk_portb_BRAM_EN : std_logic;
  signal darkquad29_wvl_adc_in_snp_cal3_ss_bram_ramblk_portb_BRAM_Rst : std_logic;
  signal darkquad29_wvl_adc_in_snp_cal3_ss_bram_ramblk_portb_BRAM_WEN : std_logic_vector(0 to 3);
  signal darkquad29_wvl_adc_in_snp_cal3_ss_bram_we : std_logic;
  signal darkquad29_wvl_adc_in_snp_cal3_ss_ctrl_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_adc_in_snp_cal3_ss_status_user_data_in : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_adc_in_trig_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_adc_in_ts0_user_data_in : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_adc_in_ts1_user_data_in : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_adc_in_ts2_user_data_in : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_adc_in_ts3_user_data_in : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_adc_in_valid_user_data_in : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_board_num_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture0_base_kf_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture0_base_kq_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture0_cps_lim_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_addr : std_logic_vector(9 downto 0);
  signal darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_data_in : std_logic_vector(63 downto 0);
  signal darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_data_out : std_logic_vector(63 downto 0);
  signal darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Addr : std_logic_vector(0 to 31);
  signal darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Clk : std_logic;
  signal darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Din : std_logic_vector(0 to 31);
  signal darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Dout : std_logic_vector(0 to 31);
  signal darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_EN : std_logic;
  signal darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Rst : std_logic;
  signal darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_WEN : std_logic_vector(0 to 3);
  signal darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_we : std_logic;
  signal darkquad29_wvl_capture0_load_thresh_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture0_pix_addr : std_logic_vector(9 downto 0);
  signal darkquad29_wvl_capture0_pix_data_in : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture0_pix_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture0_pix_ramblk_portb_BRAM_Addr : std_logic_vector(0 to 31);
  signal darkquad29_wvl_capture0_pix_ramblk_portb_BRAM_Clk : std_logic;
  signal darkquad29_wvl_capture0_pix_ramblk_portb_BRAM_Din : std_logic_vector(0 to 31);
  signal darkquad29_wvl_capture0_pix_ramblk_portb_BRAM_Dout : std_logic_vector(0 to 31);
  signal darkquad29_wvl_capture0_pix_ramblk_portb_BRAM_EN : std_logic;
  signal darkquad29_wvl_capture0_pix_ramblk_portb_BRAM_Rst : std_logic;
  signal darkquad29_wvl_capture0_pix_ramblk_portb_BRAM_WEN : std_logic_vector(0 to 3);
  signal darkquad29_wvl_capture0_pix_we : std_logic;
  signal darkquad29_wvl_capture0_threshold_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture0_use_energy_cal_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture1_base_kf_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture1_base_kq_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture1_cps_lim_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_addr : std_logic_vector(9 downto 0);
  signal darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_data_in : std_logic_vector(63 downto 0);
  signal darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_data_out : std_logic_vector(63 downto 0);
  signal darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Addr : std_logic_vector(0 to 31);
  signal darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Clk : std_logic;
  signal darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Din : std_logic_vector(0 to 31);
  signal darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Dout : std_logic_vector(0 to 31);
  signal darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_EN : std_logic;
  signal darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Rst : std_logic;
  signal darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_WEN : std_logic_vector(0 to 3);
  signal darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_we : std_logic;
  signal darkquad29_wvl_capture1_load_thresh_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture1_pix_addr : std_logic_vector(9 downto 0);
  signal darkquad29_wvl_capture1_pix_data_in : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture1_pix_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture1_pix_ramblk_portb_BRAM_Addr : std_logic_vector(0 to 31);
  signal darkquad29_wvl_capture1_pix_ramblk_portb_BRAM_Clk : std_logic;
  signal darkquad29_wvl_capture1_pix_ramblk_portb_BRAM_Din : std_logic_vector(0 to 31);
  signal darkquad29_wvl_capture1_pix_ramblk_portb_BRAM_Dout : std_logic_vector(0 to 31);
  signal darkquad29_wvl_capture1_pix_ramblk_portb_BRAM_EN : std_logic;
  signal darkquad29_wvl_capture1_pix_ramblk_portb_BRAM_Rst : std_logic;
  signal darkquad29_wvl_capture1_pix_ramblk_portb_BRAM_WEN : std_logic_vector(0 to 3);
  signal darkquad29_wvl_capture1_pix_we : std_logic;
  signal darkquad29_wvl_capture1_threshold_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture1_use_energy_cal_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture2_base_kf_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture2_base_kq_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture2_cps_lim_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_addr : std_logic_vector(9 downto 0);
  signal darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_data_in : std_logic_vector(63 downto 0);
  signal darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_data_out : std_logic_vector(63 downto 0);
  signal darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Addr : std_logic_vector(0 to 31);
  signal darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Clk : std_logic;
  signal darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Din : std_logic_vector(0 to 31);
  signal darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Dout : std_logic_vector(0 to 31);
  signal darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_EN : std_logic;
  signal darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Rst : std_logic;
  signal darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_WEN : std_logic_vector(0 to 3);
  signal darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_we : std_logic;
  signal darkquad29_wvl_capture2_load_thresh_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture2_pix_addr : std_logic_vector(9 downto 0);
  signal darkquad29_wvl_capture2_pix_data_in : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture2_pix_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture2_pix_ramblk_portb_BRAM_Addr : std_logic_vector(0 to 31);
  signal darkquad29_wvl_capture2_pix_ramblk_portb_BRAM_Clk : std_logic;
  signal darkquad29_wvl_capture2_pix_ramblk_portb_BRAM_Din : std_logic_vector(0 to 31);
  signal darkquad29_wvl_capture2_pix_ramblk_portb_BRAM_Dout : std_logic_vector(0 to 31);
  signal darkquad29_wvl_capture2_pix_ramblk_portb_BRAM_EN : std_logic;
  signal darkquad29_wvl_capture2_pix_ramblk_portb_BRAM_Rst : std_logic;
  signal darkquad29_wvl_capture2_pix_ramblk_portb_BRAM_WEN : std_logic_vector(0 to 3);
  signal darkquad29_wvl_capture2_pix_we : std_logic;
  signal darkquad29_wvl_capture2_threshold_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture2_use_energy_cal_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture3_base_kf_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture3_base_kq_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture3_cps_lim_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_addr : std_logic_vector(9 downto 0);
  signal darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_data_in : std_logic_vector(63 downto 0);
  signal darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_data_out : std_logic_vector(63 downto 0);
  signal darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Addr : std_logic_vector(0 to 31);
  signal darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Clk : std_logic;
  signal darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Din : std_logic_vector(0 to 31);
  signal darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Dout : std_logic_vector(0 to 31);
  signal darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_EN : std_logic;
  signal darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Rst : std_logic;
  signal darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_WEN : std_logic_vector(0 to 3);
  signal darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_we : std_logic;
  signal darkquad29_wvl_capture3_load_thresh_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture3_pix_addr : std_logic_vector(9 downto 0);
  signal darkquad29_wvl_capture3_pix_data_in : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture3_pix_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture3_pix_ramblk_portb_BRAM_Addr : std_logic_vector(0 to 31);
  signal darkquad29_wvl_capture3_pix_ramblk_portb_BRAM_Clk : std_logic;
  signal darkquad29_wvl_capture3_pix_ramblk_portb_BRAM_Din : std_logic_vector(0 to 31);
  signal darkquad29_wvl_capture3_pix_ramblk_portb_BRAM_Dout : std_logic_vector(0 to 31);
  signal darkquad29_wvl_capture3_pix_ramblk_portb_BRAM_EN : std_logic;
  signal darkquad29_wvl_capture3_pix_ramblk_portb_BRAM_Rst : std_logic;
  signal darkquad29_wvl_capture3_pix_ramblk_portb_BRAM_WEN : std_logic_vector(0 to 3);
  signal darkquad29_wvl_capture3_pix_we : std_logic;
  signal darkquad29_wvl_capture3_threshold_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture3_use_energy_cal_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_chan_sel_ch_bin0_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_chan_sel_ch_bin1_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_chan_sel_ch_bin2_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_chan_sel_ch_bin3_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_chan_sel_load_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_check_lag_data_ch_user_data_in : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_check_lag_dds_ch_user_data_in : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_check_lag_latch_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_conv_phase0_centers_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_conv_phase0_load_centers_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_conv_phase1_centers_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_conv_phase1_load_centers_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_conv_phase2_centers_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_conv_phase2_load_centers_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_conv_phase3_centers_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_conv_phase3_load_centers_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_dds_lut_qdr0_ack : std_logic;
  signal darkquad29_wvl_dds_lut_qdr0_address : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_dds_lut_qdr0_be : std_logic_vector(7 downto 0);
  signal darkquad29_wvl_dds_lut_qdr0_cal_fail : std_logic;
  signal darkquad29_wvl_dds_lut_qdr0_data_in : std_logic_vector(71 downto 0);
  signal darkquad29_wvl_dds_lut_qdr0_data_out : std_logic_vector(71 downto 0);
  signal darkquad29_wvl_dds_lut_qdr0_data_valid : std_logic;
  signal darkquad29_wvl_dds_lut_qdr0_dly_cntrs : std_logic_vector(364 downto 0);
  signal darkquad29_wvl_dds_lut_qdr0_dly_en_i : std_logic_vector(35 downto 0);
  signal darkquad29_wvl_dds_lut_qdr0_dly_en_o : std_logic_vector(36 downto 0);
  signal darkquad29_wvl_dds_lut_qdr0_dly_extra_clk : std_logic;
  signal darkquad29_wvl_dds_lut_qdr0_dly_inc_dec : std_logic;
  signal darkquad29_wvl_dds_lut_qdr0_phy_ready : std_logic;
  signal darkquad29_wvl_dds_lut_qdr0_qdr_addr : std_logic_vector(20 downto 0);
  signal darkquad29_wvl_dds_lut_qdr0_qdr_rd_data : std_logic_vector(71 downto 0);
  signal darkquad29_wvl_dds_lut_qdr0_qdr_rd_dvld : std_logic;
  signal darkquad29_wvl_dds_lut_qdr0_qdr_rd_strb : std_logic;
  signal darkquad29_wvl_dds_lut_qdr0_qdr_wr_be : std_logic_vector(7 downto 0);
  signal darkquad29_wvl_dds_lut_qdr0_qdr_wr_data : std_logic_vector(71 downto 0);
  signal darkquad29_wvl_dds_lut_qdr0_qdr_wr_strb : std_logic;
  signal darkquad29_wvl_dds_lut_qdr0_rd_en : std_logic;
  signal darkquad29_wvl_dds_lut_qdr0_reset : std_logic;
  signal darkquad29_wvl_dds_lut_qdr0_wr_en : std_logic;
  signal darkquad29_wvl_dds_lut_qdr1_ack : std_logic;
  signal darkquad29_wvl_dds_lut_qdr1_address : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_dds_lut_qdr1_be : std_logic_vector(7 downto 0);
  signal darkquad29_wvl_dds_lut_qdr1_cal_fail : std_logic;
  signal darkquad29_wvl_dds_lut_qdr1_data_in : std_logic_vector(71 downto 0);
  signal darkquad29_wvl_dds_lut_qdr1_data_out : std_logic_vector(71 downto 0);
  signal darkquad29_wvl_dds_lut_qdr1_data_valid : std_logic;
  signal darkquad29_wvl_dds_lut_qdr1_dly_cntrs : std_logic_vector(364 downto 0);
  signal darkquad29_wvl_dds_lut_qdr1_dly_en_i : std_logic_vector(35 downto 0);
  signal darkquad29_wvl_dds_lut_qdr1_dly_en_o : std_logic_vector(36 downto 0);
  signal darkquad29_wvl_dds_lut_qdr1_dly_extra_clk : std_logic;
  signal darkquad29_wvl_dds_lut_qdr1_dly_inc_dec : std_logic;
  signal darkquad29_wvl_dds_lut_qdr1_phy_ready : std_logic;
  signal darkquad29_wvl_dds_lut_qdr1_qdr_addr : std_logic_vector(20 downto 0);
  signal darkquad29_wvl_dds_lut_qdr1_qdr_rd_data : std_logic_vector(71 downto 0);
  signal darkquad29_wvl_dds_lut_qdr1_qdr_rd_dvld : std_logic;
  signal darkquad29_wvl_dds_lut_qdr1_qdr_rd_strb : std_logic;
  signal darkquad29_wvl_dds_lut_qdr1_qdr_wr_be : std_logic_vector(7 downto 0);
  signal darkquad29_wvl_dds_lut_qdr1_qdr_wr_data : std_logic_vector(71 downto 0);
  signal darkquad29_wvl_dds_lut_qdr1_qdr_wr_strb : std_logic;
  signal darkquad29_wvl_dds_lut_qdr1_rd_en : std_logic;
  signal darkquad29_wvl_dds_lut_qdr1_reset : std_logic;
  signal darkquad29_wvl_dds_lut_qdr1_wr_en : std_logic;
  signal darkquad29_wvl_dds_lut_qdr2_ack : std_logic;
  signal darkquad29_wvl_dds_lut_qdr2_address : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_dds_lut_qdr2_be : std_logic_vector(7 downto 0);
  signal darkquad29_wvl_dds_lut_qdr2_cal_fail : std_logic;
  signal darkquad29_wvl_dds_lut_qdr2_data_in : std_logic_vector(71 downto 0);
  signal darkquad29_wvl_dds_lut_qdr2_data_out : std_logic_vector(71 downto 0);
  signal darkquad29_wvl_dds_lut_qdr2_data_valid : std_logic;
  signal darkquad29_wvl_dds_lut_qdr2_dly_cntrs : std_logic_vector(364 downto 0);
  signal darkquad29_wvl_dds_lut_qdr2_dly_en_i : std_logic_vector(35 downto 0);
  signal darkquad29_wvl_dds_lut_qdr2_dly_en_o : std_logic_vector(36 downto 0);
  signal darkquad29_wvl_dds_lut_qdr2_dly_extra_clk : std_logic;
  signal darkquad29_wvl_dds_lut_qdr2_dly_inc_dec : std_logic;
  signal darkquad29_wvl_dds_lut_qdr2_phy_ready : std_logic;
  signal darkquad29_wvl_dds_lut_qdr2_qdr_addr : std_logic_vector(20 downto 0);
  signal darkquad29_wvl_dds_lut_qdr2_qdr_rd_data : std_logic_vector(71 downto 0);
  signal darkquad29_wvl_dds_lut_qdr2_qdr_rd_dvld : std_logic;
  signal darkquad29_wvl_dds_lut_qdr2_qdr_rd_strb : std_logic;
  signal darkquad29_wvl_dds_lut_qdr2_qdr_wr_be : std_logic_vector(7 downto 0);
  signal darkquad29_wvl_dds_lut_qdr2_qdr_wr_data : std_logic_vector(71 downto 0);
  signal darkquad29_wvl_dds_lut_qdr2_qdr_wr_strb : std_logic;
  signal darkquad29_wvl_dds_lut_qdr2_rd_en : std_logic;
  signal darkquad29_wvl_dds_lut_qdr2_reset : std_logic;
  signal darkquad29_wvl_dds_lut_qdr2_wr_en : std_logic;
  signal darkquad29_wvl_dds_lut_qdr3_ack : std_logic;
  signal darkquad29_wvl_dds_lut_qdr3_address : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_dds_lut_qdr3_be : std_logic_vector(7 downto 0);
  signal darkquad29_wvl_dds_lut_qdr3_cal_fail : std_logic;
  signal darkquad29_wvl_dds_lut_qdr3_data_in : std_logic_vector(71 downto 0);
  signal darkquad29_wvl_dds_lut_qdr3_data_out : std_logic_vector(71 downto 0);
  signal darkquad29_wvl_dds_lut_qdr3_data_valid : std_logic;
  signal darkquad29_wvl_dds_lut_qdr3_dly_cntrs : std_logic_vector(364 downto 0);
  signal darkquad29_wvl_dds_lut_qdr3_dly_en_i : std_logic_vector(35 downto 0);
  signal darkquad29_wvl_dds_lut_qdr3_dly_en_o : std_logic_vector(36 downto 0);
  signal darkquad29_wvl_dds_lut_qdr3_dly_extra_clk : std_logic;
  signal darkquad29_wvl_dds_lut_qdr3_dly_inc_dec : std_logic;
  signal darkquad29_wvl_dds_lut_qdr3_phy_ready : std_logic;
  signal darkquad29_wvl_dds_lut_qdr3_qdr_addr : std_logic_vector(20 downto 0);
  signal darkquad29_wvl_dds_lut_qdr3_qdr_rd_data : std_logic_vector(71 downto 0);
  signal darkquad29_wvl_dds_lut_qdr3_qdr_rd_dvld : std_logic;
  signal darkquad29_wvl_dds_lut_qdr3_qdr_rd_strb : std_logic;
  signal darkquad29_wvl_dds_lut_qdr3_qdr_wr_be : std_logic_vector(7 downto 0);
  signal darkquad29_wvl_dds_lut_qdr3_qdr_wr_data : std_logic_vector(71 downto 0);
  signal darkquad29_wvl_dds_lut_qdr3_qdr_wr_strb : std_logic;
  signal darkquad29_wvl_dds_lut_qdr3_rd_en : std_logic;
  signal darkquad29_wvl_dds_lut_qdr3_reset : std_logic;
  signal darkquad29_wvl_dds_lut_qdr3_wr_en : std_logic;
  signal darkquad29_wvl_dds_lut_run_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_dds_shift_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_gbe64_dest_ip_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_gbe64_one_gbe_app_dbg_data : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_gbe64_one_gbe_app_dbg_dvld : std_logic;
  signal darkquad29_wvl_gbe64_one_gbe_app_rx_ack : std_logic;
  signal darkquad29_wvl_gbe64_one_gbe_app_rx_badframe : std_logic;
  signal darkquad29_wvl_gbe64_one_gbe_app_rx_data : std_logic_vector(7 downto 0);
  signal darkquad29_wvl_gbe64_one_gbe_app_rx_dvld : std_logic;
  signal darkquad29_wvl_gbe64_one_gbe_app_rx_eof : std_logic;
  signal darkquad29_wvl_gbe64_one_gbe_app_rx_overrun : std_logic;
  signal darkquad29_wvl_gbe64_one_gbe_app_rx_rst : std_logic;
  signal darkquad29_wvl_gbe64_one_gbe_app_rx_srcip : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_gbe64_one_gbe_app_rx_srcport : std_logic_vector(15 downto 0);
  signal darkquad29_wvl_gbe64_one_gbe_app_tx_afull : std_logic;
  signal darkquad29_wvl_gbe64_one_gbe_app_tx_data : std_logic_vector(7 downto 0);
  signal darkquad29_wvl_gbe64_one_gbe_app_tx_destip : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_gbe64_one_gbe_app_tx_destport : std_logic_vector(15 downto 0);
  signal darkquad29_wvl_gbe64_one_gbe_app_tx_dvld : std_logic;
  signal darkquad29_wvl_gbe64_one_gbe_app_tx_eof : std_logic;
  signal darkquad29_wvl_gbe64_one_gbe_app_tx_overflow : std_logic;
  signal darkquad29_wvl_gbe64_one_gbe_app_tx_rst : std_logic;
  signal darkquad29_wvl_gbe64_rst_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_gbe64_tx_afull_user_data_in : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_gbe64_tx_overrun_user_data_in : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_gbe64_words_per_frame_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_n_eof_sent_user_data_in : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_n_photons_user_data_in : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_pfb_fft_check_fft_oflow_user_data_in : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_phase_dmp_ch_we_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_phase_dmp_on_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_phase_port_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_photon_port_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_prog_fir0_load_chan_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_prog_fir0_single_chan_coeffs_addr : std_logic_vector(9 downto 0);
  signal darkquad29_wvl_prog_fir0_single_chan_coeffs_data_in : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_prog_fir0_single_chan_coeffs_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_prog_fir0_single_chan_coeffs_ramblk_portb_BRAM_Addr : std_logic_vector(0 to 31);
  signal darkquad29_wvl_prog_fir0_single_chan_coeffs_ramblk_portb_BRAM_Clk : std_logic;
  signal darkquad29_wvl_prog_fir0_single_chan_coeffs_ramblk_portb_BRAM_Din : std_logic_vector(0 to 31);
  signal darkquad29_wvl_prog_fir0_single_chan_coeffs_ramblk_portb_BRAM_Dout : std_logic_vector(0 to 31);
  signal darkquad29_wvl_prog_fir0_single_chan_coeffs_ramblk_portb_BRAM_EN : std_logic;
  signal darkquad29_wvl_prog_fir0_single_chan_coeffs_ramblk_portb_BRAM_Rst : std_logic;
  signal darkquad29_wvl_prog_fir0_single_chan_coeffs_ramblk_portb_BRAM_WEN : std_logic_vector(0 to 3);
  signal darkquad29_wvl_prog_fir0_single_chan_coeffs_we : std_logic;
  signal darkquad29_wvl_prog_fir1_load_chan_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_prog_fir1_single_chan_coeffs_addr : std_logic_vector(9 downto 0);
  signal darkquad29_wvl_prog_fir1_single_chan_coeffs_data_in : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_prog_fir1_single_chan_coeffs_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_prog_fir1_single_chan_coeffs_ramblk_portb_BRAM_Addr : std_logic_vector(0 to 31);
  signal darkquad29_wvl_prog_fir1_single_chan_coeffs_ramblk_portb_BRAM_Clk : std_logic;
  signal darkquad29_wvl_prog_fir1_single_chan_coeffs_ramblk_portb_BRAM_Din : std_logic_vector(0 to 31);
  signal darkquad29_wvl_prog_fir1_single_chan_coeffs_ramblk_portb_BRAM_Dout : std_logic_vector(0 to 31);
  signal darkquad29_wvl_prog_fir1_single_chan_coeffs_ramblk_portb_BRAM_EN : std_logic;
  signal darkquad29_wvl_prog_fir1_single_chan_coeffs_ramblk_portb_BRAM_Rst : std_logic;
  signal darkquad29_wvl_prog_fir1_single_chan_coeffs_ramblk_portb_BRAM_WEN : std_logic_vector(0 to 3);
  signal darkquad29_wvl_prog_fir1_single_chan_coeffs_we : std_logic;
  signal darkquad29_wvl_prog_fir2_load_chan_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_prog_fir2_single_chan_coeffs_addr : std_logic_vector(9 downto 0);
  signal darkquad29_wvl_prog_fir2_single_chan_coeffs_data_in : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_prog_fir2_single_chan_coeffs_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_prog_fir2_single_chan_coeffs_ramblk_portb_BRAM_Addr : std_logic_vector(0 to 31);
  signal darkquad29_wvl_prog_fir2_single_chan_coeffs_ramblk_portb_BRAM_Clk : std_logic;
  signal darkquad29_wvl_prog_fir2_single_chan_coeffs_ramblk_portb_BRAM_Din : std_logic_vector(0 to 31);
  signal darkquad29_wvl_prog_fir2_single_chan_coeffs_ramblk_portb_BRAM_Dout : std_logic_vector(0 to 31);
  signal darkquad29_wvl_prog_fir2_single_chan_coeffs_ramblk_portb_BRAM_EN : std_logic;
  signal darkquad29_wvl_prog_fir2_single_chan_coeffs_ramblk_portb_BRAM_Rst : std_logic;
  signal darkquad29_wvl_prog_fir2_single_chan_coeffs_ramblk_portb_BRAM_WEN : std_logic_vector(0 to 3);
  signal darkquad29_wvl_prog_fir2_single_chan_coeffs_we : std_logic;
  signal darkquad29_wvl_prog_fir3_load_chan_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_prog_fir3_single_chan_coeffs_addr : std_logic_vector(9 downto 0);
  signal darkquad29_wvl_prog_fir3_single_chan_coeffs_data_in : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_prog_fir3_single_chan_coeffs_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_prog_fir3_single_chan_coeffs_ramblk_portb_BRAM_Addr : std_logic_vector(0 to 31);
  signal darkquad29_wvl_prog_fir3_single_chan_coeffs_ramblk_portb_BRAM_Clk : std_logic;
  signal darkquad29_wvl_prog_fir3_single_chan_coeffs_ramblk_portb_BRAM_Din : std_logic_vector(0 to 31);
  signal darkquad29_wvl_prog_fir3_single_chan_coeffs_ramblk_portb_BRAM_Dout : std_logic_vector(0 to 31);
  signal darkquad29_wvl_prog_fir3_single_chan_coeffs_ramblk_portb_BRAM_EN : std_logic;
  signal darkquad29_wvl_prog_fir3_single_chan_coeffs_ramblk_portb_BRAM_Rst : std_logic;
  signal darkquad29_wvl_prog_fir3_single_chan_coeffs_ramblk_portb_BRAM_WEN : std_logic_vector(0 to 3);
  signal darkquad29_wvl_prog_fir3_single_chan_coeffs_we : std_logic;
  signal darkquad29_wvl_run_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_sel_ch_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_snp_phs_ss_bram_addr : std_logic_vector(8 downto 0);
  signal darkquad29_wvl_snp_phs_ss_bram_data_in : std_logic_vector(63 downto 0);
  signal darkquad29_wvl_snp_phs_ss_bram_data_out : std_logic_vector(63 downto 0);
  signal darkquad29_wvl_snp_phs_ss_bram_ramblk_portb_BRAM_Addr : std_logic_vector(0 to 31);
  signal darkquad29_wvl_snp_phs_ss_bram_ramblk_portb_BRAM_Clk : std_logic;
  signal darkquad29_wvl_snp_phs_ss_bram_ramblk_portb_BRAM_Din : std_logic_vector(0 to 31);
  signal darkquad29_wvl_snp_phs_ss_bram_ramblk_portb_BRAM_Dout : std_logic_vector(0 to 31);
  signal darkquad29_wvl_snp_phs_ss_bram_ramblk_portb_BRAM_EN : std_logic;
  signal darkquad29_wvl_snp_phs_ss_bram_ramblk_portb_BRAM_Rst : std_logic;
  signal darkquad29_wvl_snp_phs_ss_bram_ramblk_portb_BRAM_WEN : std_logic_vector(0 to 3);
  signal darkquad29_wvl_snp_phs_ss_bram_we : std_logic;
  signal darkquad29_wvl_snp_phs_ss_ctrl_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_snp_phs_ss_status_user_data_in : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_start_cap_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_timekeeper_base_ts_user_data_out : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_timekeeper_sec_now_user_data_in : std_logic_vector(31 downto 0);
  signal darkquad29_wvl_trig_snp_user_data_out : std_logic_vector(31 downto 0);
  signal epb_clk : std_logic;
  signal epb_data_i : std_logic_vector(0 to 31);
  signal epb_data_o : std_logic_vector(31 downto 0);
  signal epb_data_oe_n : std_logic;
  signal idelay_rdy : std_logic;
  signal mac_mac_rx_badframe : std_logic;
  signal mac_mac_rx_clk : std_logic;
  signal mac_mac_rx_data : std_logic_vector(7 downto 0);
  signal mac_mac_rx_dvld : std_logic;
  signal mac_mac_rx_goodframe : std_logic;
  signal mac_mac_syncacquired : std_logic;
  signal mac_mac_tx_ack : std_logic;
  signal mac_mac_tx_clk : std_logic;
  signal mac_mac_tx_data : std_logic_vector(7 downto 0);
  signal mac_mac_tx_dvld : std_logic;
  signal net_gnd0 : std_logic;
  signal net_gnd1 : std_logic_vector(0 to 0);
  signal net_gnd18 : std_logic_vector(0 to 17);
  signal net_gnd31 : std_logic_vector(0 to 30);
  signal net_gnd32 : std_logic_vector(0 to 31);
  signal net_vcc1 : std_logic_vector(0 to 0);
  signal net_vcc18 : std_logic_vector(0 to 17);
  signal net_vcc31 : std_logic_vector(0 to 30);
  signal net_vcc32 : std_logic_vector(0 to 31);
  signal opb0_M_ABus : std_logic_vector(0 to 31);
  signal opb0_M_BE : std_logic_vector(0 to 3);
  signal opb0_M_DBus : std_logic_vector(0 to 31);
  signal opb0_M_RNW : std_logic_vector(0 to 0);
  signal opb0_M_busLock : std_logic_vector(0 to 0);
  signal opb0_M_request : std_logic_vector(0 to 0);
  signal opb0_M_select : std_logic_vector(0 to 0);
  signal opb0_M_seqAddr : std_logic_vector(0 to 0);
  signal opb0_OPB_ABus : std_logic_vector(0 to 31);
  signal opb0_OPB_BE : std_logic_vector(0 to 3);
  signal opb0_OPB_DBus : std_logic_vector(0 to 31);
  signal opb0_OPB_MGrant : std_logic_vector(0 to 0);
  signal opb0_OPB_RNW : std_logic;
  signal opb0_OPB_Rst : std_logic;
  signal opb0_OPB_errAck : std_logic;
  signal opb0_OPB_retry : std_logic;
  signal opb0_OPB_select : std_logic;
  signal opb0_OPB_seqAddr : std_logic;
  signal opb0_OPB_timeout : std_logic;
  signal opb0_OPB_xferAck : std_logic;
  signal opb0_Sl_DBus : std_logic_vector(0 to 991);
  signal opb0_Sl_errAck : std_logic_vector(0 to 30);
  signal opb0_Sl_retry : std_logic_vector(0 to 30);
  signal opb0_Sl_toutSup : std_logic_vector(0 to 30);
  signal opb0_Sl_xferAck : std_logic_vector(0 to 30);
  signal opb1_M_ABus : std_logic_vector(0 to 31);
  signal opb1_M_BE : std_logic_vector(0 to 3);
  signal opb1_M_DBus : std_logic_vector(0 to 31);
  signal opb1_M_RNW : std_logic_vector(0 to 0);
  signal opb1_M_busLock : std_logic_vector(0 to 0);
  signal opb1_M_request : std_logic_vector(0 to 0);
  signal opb1_M_select : std_logic_vector(0 to 0);
  signal opb1_M_seqAddr : std_logic_vector(0 to 0);
  signal opb1_OPB_ABus : std_logic_vector(0 to 31);
  signal opb1_OPB_BE : std_logic_vector(0 to 3);
  signal opb1_OPB_DBus : std_logic_vector(0 to 31);
  signal opb1_OPB_MGrant : std_logic_vector(0 to 0);
  signal opb1_OPB_RNW : std_logic;
  signal opb1_OPB_Rst : std_logic;
  signal opb1_OPB_errAck : std_logic;
  signal opb1_OPB_retry : std_logic;
  signal opb1_OPB_select : std_logic;
  signal opb1_OPB_seqAddr : std_logic;
  signal opb1_OPB_timeout : std_logic;
  signal opb1_OPB_xferAck : std_logic;
  signal opb1_Sl_DBus : std_logic_vector(0 to 1023);
  signal opb1_Sl_errAck : std_logic_vector(0 to 31);
  signal opb1_Sl_retry : std_logic_vector(0 to 31);
  signal opb1_Sl_toutSup : std_logic_vector(0 to 31);
  signal opb1_Sl_xferAck : std_logic_vector(0 to 31);
  signal opb2_M_ABus : std_logic_vector(0 to 31);
  signal opb2_M_BE : std_logic_vector(0 to 3);
  signal opb2_M_DBus : std_logic_vector(0 to 31);
  signal opb2_M_RNW : std_logic_vector(0 to 0);
  signal opb2_M_busLock : std_logic_vector(0 to 0);
  signal opb2_M_request : std_logic_vector(0 to 0);
  signal opb2_M_select : std_logic_vector(0 to 0);
  signal opb2_M_seqAddr : std_logic_vector(0 to 0);
  signal opb2_OPB_ABus : std_logic_vector(0 to 31);
  signal opb2_OPB_BE : std_logic_vector(0 to 3);
  signal opb2_OPB_DBus : std_logic_vector(0 to 31);
  signal opb2_OPB_MGrant : std_logic_vector(0 to 0);
  signal opb2_OPB_RNW : std_logic;
  signal opb2_OPB_Rst : std_logic;
  signal opb2_OPB_errAck : std_logic;
  signal opb2_OPB_retry : std_logic;
  signal opb2_OPB_select : std_logic;
  signal opb2_OPB_seqAddr : std_logic;
  signal opb2_OPB_timeout : std_logic;
  signal opb2_OPB_xferAck : std_logic;
  signal opb2_Sl_DBus : std_logic_vector(0 to 1023);
  signal opb2_Sl_errAck : std_logic_vector(0 to 31);
  signal opb2_Sl_retry : std_logic_vector(0 to 31);
  signal opb2_Sl_toutSup : std_logic_vector(0 to 31);
  signal opb2_Sl_xferAck : std_logic_vector(0 to 31);
  signal opb3_M_ABus : std_logic_vector(0 to 31);
  signal opb3_M_BE : std_logic_vector(0 to 3);
  signal opb3_M_DBus : std_logic_vector(0 to 31);
  signal opb3_M_RNW : std_logic_vector(0 to 0);
  signal opb3_M_busLock : std_logic_vector(0 to 0);
  signal opb3_M_request : std_logic_vector(0 to 0);
  signal opb3_M_select : std_logic_vector(0 to 0);
  signal opb3_M_seqAddr : std_logic_vector(0 to 0);
  signal opb3_OPB_ABus : std_logic_vector(0 to 31);
  signal opb3_OPB_BE : std_logic_vector(0 to 3);
  signal opb3_OPB_DBus : std_logic_vector(0 to 31);
  signal opb3_OPB_MGrant : std_logic_vector(0 to 0);
  signal opb3_OPB_RNW : std_logic;
  signal opb3_OPB_Rst : std_logic;
  signal opb3_OPB_errAck : std_logic;
  signal opb3_OPB_retry : std_logic;
  signal opb3_OPB_select : std_logic;
  signal opb3_OPB_seqAddr : std_logic;
  signal opb3_OPB_timeout : std_logic;
  signal opb3_OPB_xferAck : std_logic;
  signal opb3_Sl_DBus : std_logic_vector(0 to 1023);
  signal opb3_Sl_errAck : std_logic_vector(0 to 31);
  signal opb3_Sl_retry : std_logic_vector(0 to 31);
  signal opb3_Sl_toutSup : std_logic_vector(0 to 31);
  signal opb3_Sl_xferAck : std_logic_vector(0 to 31);
  signal opb4_M_ABus : std_logic_vector(0 to 31);
  signal opb4_M_BE : std_logic_vector(0 to 3);
  signal opb4_M_DBus : std_logic_vector(0 to 31);
  signal opb4_M_RNW : std_logic_vector(0 to 0);
  signal opb4_M_busLock : std_logic_vector(0 to 0);
  signal opb4_M_request : std_logic_vector(0 to 0);
  signal opb4_M_select : std_logic_vector(0 to 0);
  signal opb4_M_seqAddr : std_logic_vector(0 to 0);
  signal opb4_OPB_ABus : std_logic_vector(0 to 31);
  signal opb4_OPB_BE : std_logic_vector(0 to 3);
  signal opb4_OPB_DBus : std_logic_vector(0 to 31);
  signal opb4_OPB_MGrant : std_logic_vector(0 to 0);
  signal opb4_OPB_RNW : std_logic;
  signal opb4_OPB_Rst : std_logic;
  signal opb4_OPB_errAck : std_logic;
  signal opb4_OPB_retry : std_logic;
  signal opb4_OPB_select : std_logic;
  signal opb4_OPB_seqAddr : std_logic;
  signal opb4_OPB_timeout : std_logic;
  signal opb4_OPB_xferAck : std_logic;
  signal opb4_Sl_DBus : std_logic_vector(0 to 575);
  signal opb4_Sl_errAck : std_logic_vector(0 to 17);
  signal opb4_Sl_retry : std_logic_vector(0 to 17);
  signal opb4_Sl_toutSup : std_logic_vector(0 to 17);
  signal opb4_Sl_xferAck : std_logic_vector(0 to 17);
  signal pgassign1 : std_logic_vector(15 downto 0);
  signal power_on_rst : std_logic;
  signal sgmii_clkref_n_i : std_logic;
  signal sgmii_clkref_p_i : std_logic;
  signal sgmii_rx_n_i : std_logic;
  signal sgmii_rx_p_i : std_logic;
  signal sgmii_sgmii_elecidle : std_logic;
  signal sgmii_sgmii_encommaalign : std_logic;
  signal sgmii_sgmii_loopback : std_logic;
  signal sgmii_sgmii_pll_locked : std_logic;
  signal sgmii_sgmii_powerdown : std_logic;
  signal sgmii_sgmii_resetdone : std_logic;
  signal sgmii_sgmii_rxbufstatus : std_logic;
  signal sgmii_sgmii_rxclkcorcnt : std_logic_vector(2 downto 0);
  signal sgmii_sgmii_rxd : std_logic_vector(7 downto 0);
  signal sgmii_sgmii_rxdisperr : std_logic;
  signal sgmii_sgmii_rxiscomma : std_logic;
  signal sgmii_sgmii_rxisk : std_logic;
  signal sgmii_sgmii_rxnotintable : std_logic;
  signal sgmii_sgmii_rxreset : std_logic;
  signal sgmii_sgmii_rxrundisp : std_logic;
  signal sgmii_sgmii_txbuferr : std_logic;
  signal sgmii_sgmii_txd : std_logic_vector(7 downto 0);
  signal sgmii_sgmii_txdispmode : std_logic;
  signal sgmii_sgmii_txdispval : std_logic;
  signal sgmii_sgmii_txisk : std_logic;
  signal sgmii_sgmii_txreset : std_logic;
  signal sgmii_tx_n_i : std_logic;
  signal sgmii_tx_p_i : std_logic;
  signal sys_clk : std_logic;
  signal sys_clk2x : std_logic;
  signal sys_reset : std_logic;

  attribute BOX_TYPE : STRING;
  attribute BOX_TYPE of system_temac_inst_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_sgmii_phy_inst_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_infrastructure_inst_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_reset_block_inst_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_opb0_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_epb_opb_bridge_inst_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_epb_infrastructure_inst_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_sys_block_inst_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_xsg_core_config_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_a2g_ctrl_en_bram_dump_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_a2g_ctrl_in_val_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_a2g_ctrl_last_tx_data_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_a2g_ctrl_lut_dump_buffer_size_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_ramblk_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_a2g_ctrl_lut_dump_data_period_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_a2g_ctrl_lut_dump_sending_data_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_a2g_ctrl_reg_rx_full_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_a2g_ctrl_reg_tx_full_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_a2g_ctrl_rst_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_a2g_ctrl_tx_en_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_a2g_ctrl_v7_ready_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_acc_iq_avg0_ss_bram_ramblk_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_acc_iq_avg0_ss_bram_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_acc_iq_avg0_ss_ctrl_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_acc_iq_avg0_ss_status_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_acc_iq_avg1_ss_bram_ramblk_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_acc_iq_avg1_ss_bram_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_acc_iq_avg1_ss_ctrl_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_acc_iq_avg1_ss_status_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_acc_iq_avg2_ss_bram_ramblk_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_acc_iq_avg2_ss_bram_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_acc_iq_avg2_ss_ctrl_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_acc_iq_avg2_ss_status_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_acc_iq_avg3_ss_bram_ramblk_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_acc_iq_avg3_ss_bram_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_acc_iq_avg3_ss_ctrl_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_acc_iq_avg3_ss_status_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_acc_iq_start_acc_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_adc_in_adcdac_2g_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_adc_in_dly_val_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_adc_in_i_scale_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_adc_in_inc_phs_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_adc_in_load_dly_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_adc_in_locked_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_adc_in_n_miss_pps_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_adc_in_pos_phs_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_adc_in_raw_pps_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_adc_in_snp_cal0_ss_bram_ramblk_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_adc_in_snp_cal0_ss_bram_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_adc_in_snp_cal0_ss_ctrl_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_adc_in_snp_cal0_ss_status_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_adc_in_snp_cal1_ss_bram_ramblk_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_adc_in_snp_cal1_ss_bram_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_adc_in_snp_cal1_ss_ctrl_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_adc_in_snp_cal1_ss_status_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_adc_in_snp_cal2_ss_bram_ramblk_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_adc_in_snp_cal2_ss_bram_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_adc_in_snp_cal2_ss_ctrl_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_adc_in_snp_cal2_ss_status_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_adc_in_snp_cal3_ss_bram_ramblk_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_adc_in_snp_cal3_ss_bram_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_adc_in_snp_cal3_ss_ctrl_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_adc_in_snp_cal3_ss_status_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_adc_in_trig_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_adc_in_ts0_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_adc_in_ts1_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_adc_in_ts2_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_adc_in_ts3_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_adc_in_valid_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_board_num_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_capture0_base_kf_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_capture0_base_kq_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_capture0_cps_lim_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_ramblk_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_capture0_load_thresh_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_capture0_pix_ramblk_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_capture0_pix_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_capture0_threshold_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_capture0_use_energy_cal_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_capture1_base_kf_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_capture1_base_kq_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_capture1_cps_lim_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_ramblk_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_capture1_load_thresh_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_capture1_pix_ramblk_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_capture1_pix_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_capture1_threshold_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_capture1_use_energy_cal_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_capture2_base_kf_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_capture2_base_kq_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_capture2_cps_lim_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_ramblk_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_capture2_load_thresh_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_capture2_pix_ramblk_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_capture2_pix_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_capture2_threshold_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_capture2_use_energy_cal_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_capture3_base_kf_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_capture3_base_kq_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_capture3_cps_lim_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_ramblk_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_capture3_load_thresh_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_capture3_pix_ramblk_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_capture3_pix_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_capture3_threshold_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_capture3_use_energy_cal_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_chan_sel_ch_bin0_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_chan_sel_ch_bin1_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_chan_sel_ch_bin2_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_chan_sel_ch_bin3_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_chan_sel_load_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_check_lag_data_ch_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_check_lag_dds_ch_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_check_lag_latch_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_conv_phase0_centers_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_conv_phase0_load_centers_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_conv_phase1_centers_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_conv_phase1_load_centers_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_conv_phase2_centers_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_conv_phase2_load_centers_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_conv_phase3_centers_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_conv_phase3_load_centers_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_qdr0_controller_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_qdr0_sniffer_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_qdr1_controller_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_qdr1_sniffer_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_qdr2_controller_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_qdr2_sniffer_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_qdr3_controller_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_qdr3_sniffer_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_dds_lut_run_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_dds_shift_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_gbe64_dest_ip_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_gbe64_one_gbe_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_gbe64_rst_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_gbe64_tx_afull_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_gbe64_tx_overrun_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_gbe64_words_per_frame_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_n_eof_sent_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_n_photons_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_pfb_fft_check_fft_oflow_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_phase_dmp_ch_we_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_phase_dmp_on_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_phase_port_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_photon_port_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_prog_fir0_load_chan_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_prog_fir0_single_chan_coeffs_ramblk_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_prog_fir0_single_chan_coeffs_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_prog_fir1_load_chan_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_prog_fir1_single_chan_coeffs_ramblk_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_prog_fir1_single_chan_coeffs_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_prog_fir2_load_chan_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_prog_fir2_single_chan_coeffs_ramblk_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_prog_fir2_single_chan_coeffs_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_prog_fir3_load_chan_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_prog_fir3_single_chan_coeffs_ramblk_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_prog_fir3_single_chan_coeffs_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_run_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_sel_ch_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_snp_phs_ss_bram_ramblk_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_snp_phs_ss_bram_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_snp_phs_ss_ctrl_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_snp_phs_ss_status_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_start_cap_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_timekeeper_base_ts_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_timekeeper_sec_now_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_darkquad29_wvl_trig_snp_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_opb1_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_opb2opb_bridge_opb1_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_opb2_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_opb2opb_bridge_opb2_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_opb3_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_opb2opb_bridge_opb3_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_opb4_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_opb2opb_bridge_opb4_wrapper : component is "user_black_box";

begin

  -- Internal assignments

  sgmii_rx_n_i <= sgmii_rx_n;
  sgmii_rx_p_i <= sgmii_rx_p;
  sgmii_tx_n <= sgmii_tx_n_i;
  sgmii_tx_p <= sgmii_tx_p_i;
  sgmii_clkref_n_i <= sgmii_clkref_n;
  sgmii_clkref_p_i <= sgmii_clkref_p;
  pgassign1(15 downto 0) <= X"0000";
  net_gnd0 <= '0';
  net_gnd1(0 to 0) <= B"0";
  net_gnd18(0 to 17) <= B"000000000000000000";
  net_gnd31(0 to 30) <= B"0000000000000000000000000000000";
  net_gnd32(0 to 31) <= B"00000000000000000000000000000000";
  net_vcc1(0 to 0) <= B"1";
  net_vcc18(0 to 17) <= B"111111111111111111";
  net_vcc31(0 to 30) <= B"1111111111111111111111111111111";
  net_vcc32(0 to 31) <= B"11111111111111111111111111111111";

  temac_inst : system_temac_inst_wrapper
    port map (
      clk_125 => clk_125,
      reset => sys_reset,
      sgmii_txd => sgmii_sgmii_txd,
      sgmii_txisk => sgmii_sgmii_txisk,
      sgmii_txdispmode => sgmii_sgmii_txdispmode,
      sgmii_txdispval => sgmii_sgmii_txdispval,
      sgmii_txbuferr => sgmii_sgmii_txbuferr,
      sgmii_txreset => sgmii_sgmii_txreset,
      sgmii_rxd => sgmii_sgmii_rxd,
      sgmii_rxiscomma => sgmii_sgmii_rxiscomma,
      sgmii_rxisk => sgmii_sgmii_rxisk,
      sgmii_rxdisperr => sgmii_sgmii_rxdisperr,
      sgmii_rxnotintable => sgmii_sgmii_rxnotintable,
      sgmii_rxrundisp => sgmii_sgmii_rxrundisp,
      sgmii_rxclkcorcnt => sgmii_sgmii_rxclkcorcnt,
      sgmii_rxbufstatus => sgmii_sgmii_rxbufstatus,
      sgmii_rxreset => sgmii_sgmii_rxreset,
      sgmii_encommaalign => sgmii_sgmii_encommaalign,
      sgmii_pll_locked => sgmii_sgmii_pll_locked,
      sgmii_elecidle => sgmii_sgmii_elecidle,
      sgmii_resetdone => sgmii_sgmii_resetdone,
      sgmii_loopback => sgmii_sgmii_loopback,
      sgmii_powerdown => sgmii_sgmii_powerdown,
      mac_rx_clk => mac_mac_rx_clk,
      mac_rx_data => mac_mac_rx_data,
      mac_rx_dvld => mac_mac_rx_dvld,
      mac_rx_goodframe => mac_mac_rx_goodframe,
      mac_rx_badframe => mac_mac_rx_badframe,
      mac_tx_clk => mac_mac_tx_clk,
      mac_tx_data => mac_mac_tx_data,
      mac_tx_dvld => mac_mac_tx_dvld,
      mac_tx_ack => mac_mac_tx_ack,
      mac_syncacquired => mac_mac_syncacquired
    );

  sgmii_phy_inst : system_sgmii_phy_inst_wrapper
    port map (
      sgmii_txd => sgmii_sgmii_txd,
      sgmii_txisk => sgmii_sgmii_txisk,
      sgmii_txdispmode => sgmii_sgmii_txdispmode,
      sgmii_txdispval => sgmii_sgmii_txdispval,
      sgmii_txbuferr => sgmii_sgmii_txbuferr,
      sgmii_txreset => sgmii_sgmii_txreset,
      sgmii_rxd => sgmii_sgmii_rxd,
      sgmii_rxiscomma => sgmii_sgmii_rxiscomma,
      sgmii_rxisk => sgmii_sgmii_rxisk,
      sgmii_rxdisperr => sgmii_sgmii_rxdisperr,
      sgmii_rxnotintable => sgmii_sgmii_rxnotintable,
      sgmii_rxrundisp => sgmii_sgmii_rxrundisp,
      sgmii_rxclkcorcnt => sgmii_sgmii_rxclkcorcnt,
      sgmii_rxbufstatus => sgmii_sgmii_rxbufstatus,
      sgmii_rxreset => sgmii_sgmii_rxreset,
      sgmii_encommaalign => sgmii_sgmii_encommaalign,
      sgmii_pll_locked => sgmii_sgmii_pll_locked,
      sgmii_elecidle => sgmii_sgmii_elecidle,
      sgmii_resetdone => sgmii_sgmii_resetdone,
      sgmii_loopback => sgmii_sgmii_loopback,
      sgmii_powerdown => sgmii_sgmii_powerdown,
      mgt_rx_n => sgmii_rx_n_i,
      mgt_rx_p => sgmii_rx_p_i,
      mgt_tx_n => sgmii_tx_n_i,
      mgt_tx_p => sgmii_tx_p_i,
      mgt_clk_n => sgmii_clkref_n_i,
      mgt_clk_p => sgmii_clkref_p_i,
      mgt_reset => sys_reset,
      clk_125 => clk_125,
      recclk_125 => open
    );

  infrastructure_inst : system_infrastructure_inst_wrapper
    port map (
      sys_clk_n => sys_clk_n,
      sys_clk_p => sys_clk_p,
      aux_clk_n => aux_clk_n,
      aux_clk_p => aux_clk_p,
      epb_clk_in => epb_clk_in,
      sys_clk => sys_clk,
      sys_clk90 => open,
      sys_clk180 => open,
      sys_clk270 => open,
      sys_clk_lock => open,
      sys_clk2x => sys_clk2x,
      sys_clk2x90 => open,
      sys_clk2x180 => open,
      sys_clk2x270 => open,
      aux_clk => open,
      aux_clk90 => open,
      aux_clk180 => open,
      aux_clk270 => open,
      aux_clk2x => open,
      aux_clk2x90 => open,
      aux_clk2x180 => open,
      aux_clk2x270 => open,
      epb_clk => epb_clk,
      idelay_rst => power_on_rst,
      idelay_rdy => idelay_rdy,
      op_power_on_rst => power_on_rst,
      clk_200 => open,
      clk_100 => open
    );

  reset_block_inst : system_reset_block_inst_wrapper
    port map (
      clk => sys_clk,
      ip_async_reset_i => power_on_rst,
      ip_reset_i => power_on_rst,
      op_reset_o => sys_reset
    );

  opb0 : system_opb0_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb0_OPB_Rst,
      SYS_Rst => power_on_rst,
      Debug_SYS_Rst => net_gnd0,
      WDT_Rst => net_gnd0,
      M_ABus => opb0_M_ABus,
      M_BE => opb0_M_BE,
      M_beXfer => net_gnd1(0 to 0),
      M_busLock => opb0_M_busLock(0 to 0),
      M_DBus => opb0_M_DBus,
      M_DBusEn => net_gnd1(0 to 0),
      M_DBusEn32_63 => net_vcc1(0 to 0),
      M_dwXfer => net_gnd1(0 to 0),
      M_fwXfer => net_gnd1(0 to 0),
      M_hwXfer => net_gnd1(0 to 0),
      M_request => opb0_M_request(0 to 0),
      M_RNW => opb0_M_RNW(0 to 0),
      M_select => opb0_M_select(0 to 0),
      M_seqAddr => opb0_M_seqAddr(0 to 0),
      Sl_beAck => net_gnd31,
      Sl_DBus => opb0_Sl_DBus,
      Sl_DBusEn => net_vcc31,
      Sl_DBusEn32_63 => net_vcc31,
      Sl_errAck => opb0_Sl_errAck,
      Sl_dwAck => net_gnd31,
      Sl_fwAck => net_gnd31,
      Sl_hwAck => net_gnd31,
      Sl_retry => opb0_Sl_retry,
      Sl_toutSup => opb0_Sl_toutSup,
      Sl_xferAck => opb0_Sl_xferAck,
      OPB_MRequest => open,
      OPB_ABus => opb0_OPB_ABus,
      OPB_BE => opb0_OPB_BE,
      OPB_beXfer => open,
      OPB_beAck => open,
      OPB_busLock => open,
      OPB_rdDBus => open,
      OPB_wrDBus => open,
      OPB_DBus => opb0_OPB_DBus,
      OPB_errAck => opb0_OPB_errAck,
      OPB_dwAck => open,
      OPB_dwXfer => open,
      OPB_fwAck => open,
      OPB_fwXfer => open,
      OPB_hwAck => open,
      OPB_hwXfer => open,
      OPB_MGrant => opb0_OPB_MGrant(0 to 0),
      OPB_pendReq => open,
      OPB_retry => opb0_OPB_retry,
      OPB_RNW => opb0_OPB_RNW,
      OPB_select => opb0_OPB_select,
      OPB_seqAddr => opb0_OPB_seqAddr,
      OPB_timeout => opb0_OPB_timeout,
      OPB_toutSup => open,
      OPB_xferAck => opb0_OPB_xferAck
    );

  epb_opb_bridge_inst : system_epb_opb_bridge_inst_wrapper
    port map (
      epb_clk => epb_clk,
      epb_doe_n => epb_doe_n,
      epb_data_oe_n => epb_data_oe_n,
      epb_cs_n => epb_cs_n,
      epb_oe_n => epb_oe_n,
      epb_r_w_n => epb_r_w_n,
      epb_be_n => epb_be_n(0 to 3),
      epb_addr => epb_addr,
      epb_data_i => epb_data_i,
      epb_data_o => epb_data_o(31 downto 0),
      epb_rdy => epb_rdy,
      OPB_Clk => epb_clk,
      OPB_Rst => opb0_OPB_Rst,
      M_request => opb0_M_request(0),
      M_busLock => opb0_M_busLock(0),
      M_select => opb0_M_select(0),
      M_RNW => opb0_M_RNW(0),
      M_BE => opb0_M_BE,
      M_seqAddr => opb0_M_seqAddr(0),
      M_DBus => opb0_M_DBus,
      M_ABus => opb0_M_ABus,
      OPB_MGrant => opb0_OPB_MGrant(0),
      OPB_xferAck => opb0_OPB_xferAck,
      OPB_errAck => opb0_OPB_errAck,
      OPB_retry => opb0_OPB_retry,
      OPB_timeout => opb0_OPB_timeout,
      OPB_DBus => opb0_OPB_DBus
    );

  epb_infrastructure_inst : system_epb_infrastructure_inst_wrapper
    port map (
      epb_data_buf => epb_data(0 to 31),
      epb_data_oe_n_i => epb_data_oe_n,
      epb_data_out_i => epb_data_o,
      epb_data_in_o => epb_data_i(0 to 31)
    );

  sys_block_inst : system_sys_block_inst_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb0_OPB_Rst,
      Sl_DBus => opb0_Sl_DBus(0 to 31),
      Sl_errAck => opb0_Sl_errAck(0),
      Sl_retry => opb0_Sl_retry(0),
      Sl_toutSup => opb0_Sl_toutSup(0),
      Sl_xferAck => opb0_Sl_xferAck(0),
      OPB_ABus => opb0_OPB_ABus,
      OPB_BE => opb0_OPB_BE,
      OPB_DBus => opb0_OPB_DBus,
      OPB_RNW => opb0_OPB_RNW,
      OPB_select => opb0_OPB_select,
      OPB_seqAddr => opb0_OPB_seqAddr,
      soft_reset => open,
      irq_n => ppc_irq_n,
      app_irq => pgassign1,
      fab_clk => adc0_clk
    );

  darkquad29_wvl_XSG_core_config : system_darkquad29_wvl_xsg_core_config_wrapper
    port map (
      clk => adc0_clk,
      darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_data => darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_data,
      darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_full => darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_full,
      darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_val => darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_val,
      darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_full => darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_full,
      darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_rst => darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_rst,
      darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_data => darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_data,
      darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_rst => darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_rst,
      darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_val => darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_val,
      darkquad29_wvl_a2g_ctrl_en_bram_dump_user_data_out => darkquad29_wvl_a2g_ctrl_en_bram_dump_user_data_out,
      darkquad29_wvl_a2g_ctrl_in_val_user_data_out => darkquad29_wvl_a2g_ctrl_in_val_user_data_out,
      darkquad29_wvl_a2g_ctrl_last_tx_data_user_data_in => darkquad29_wvl_a2g_ctrl_last_tx_data_user_data_in,
      darkquad29_wvl_a2g_ctrl_lut_dump_buffer_size_user_data_out => darkquad29_wvl_a2g_ctrl_lut_dump_buffer_size_user_data_out,
      darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_data_out => darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_data_out,
      darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_addr => darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_addr,
      darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_data_in => darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_data_in,
      darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_we => darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_we,
      darkquad29_wvl_a2g_ctrl_lut_dump_data_period_user_data_out => darkquad29_wvl_a2g_ctrl_lut_dump_data_period_user_data_out,
      darkquad29_wvl_a2g_ctrl_lut_dump_sending_data_user_data_in => darkquad29_wvl_a2g_ctrl_lut_dump_sending_data_user_data_in,
      darkquad29_wvl_a2g_ctrl_reg_rx_full_user_data_in => darkquad29_wvl_a2g_ctrl_reg_rx_full_user_data_in,
      darkquad29_wvl_a2g_ctrl_reg_tx_full_user_data_in => darkquad29_wvl_a2g_ctrl_reg_tx_full_user_data_in,
      darkquad29_wvl_a2g_ctrl_rst_user_data_out => darkquad29_wvl_a2g_ctrl_rst_user_data_out,
      darkquad29_wvl_a2g_ctrl_tx_en_user_data_out => darkquad29_wvl_a2g_ctrl_tx_en_user_data_out,
      darkquad29_wvl_a2g_ctrl_v7_ready_user_data_in => darkquad29_wvl_a2g_ctrl_v7_ready_user_data_in,
      darkquad29_wvl_acc_iq_avg0_ss_bram_data_out => darkquad29_wvl_acc_iq_avg0_ss_bram_data_out,
      darkquad29_wvl_acc_iq_avg0_ss_bram_addr => darkquad29_wvl_acc_iq_avg0_ss_bram_addr,
      darkquad29_wvl_acc_iq_avg0_ss_bram_data_in => darkquad29_wvl_acc_iq_avg0_ss_bram_data_in,
      darkquad29_wvl_acc_iq_avg0_ss_bram_we => darkquad29_wvl_acc_iq_avg0_ss_bram_we,
      darkquad29_wvl_acc_iq_avg0_ss_ctrl_user_data_out => darkquad29_wvl_acc_iq_avg0_ss_ctrl_user_data_out,
      darkquad29_wvl_acc_iq_avg0_ss_status_user_data_in => darkquad29_wvl_acc_iq_avg0_ss_status_user_data_in,
      darkquad29_wvl_acc_iq_avg1_ss_bram_data_out => darkquad29_wvl_acc_iq_avg1_ss_bram_data_out,
      darkquad29_wvl_acc_iq_avg1_ss_bram_addr => darkquad29_wvl_acc_iq_avg1_ss_bram_addr,
      darkquad29_wvl_acc_iq_avg1_ss_bram_data_in => darkquad29_wvl_acc_iq_avg1_ss_bram_data_in,
      darkquad29_wvl_acc_iq_avg1_ss_bram_we => darkquad29_wvl_acc_iq_avg1_ss_bram_we,
      darkquad29_wvl_acc_iq_avg1_ss_ctrl_user_data_out => darkquad29_wvl_acc_iq_avg1_ss_ctrl_user_data_out,
      darkquad29_wvl_acc_iq_avg1_ss_status_user_data_in => darkquad29_wvl_acc_iq_avg1_ss_status_user_data_in,
      darkquad29_wvl_acc_iq_avg2_ss_bram_data_out => darkquad29_wvl_acc_iq_avg2_ss_bram_data_out,
      darkquad29_wvl_acc_iq_avg2_ss_bram_addr => darkquad29_wvl_acc_iq_avg2_ss_bram_addr,
      darkquad29_wvl_acc_iq_avg2_ss_bram_data_in => darkquad29_wvl_acc_iq_avg2_ss_bram_data_in,
      darkquad29_wvl_acc_iq_avg2_ss_bram_we => darkquad29_wvl_acc_iq_avg2_ss_bram_we,
      darkquad29_wvl_acc_iq_avg2_ss_ctrl_user_data_out => darkquad29_wvl_acc_iq_avg2_ss_ctrl_user_data_out,
      darkquad29_wvl_acc_iq_avg2_ss_status_user_data_in => darkquad29_wvl_acc_iq_avg2_ss_status_user_data_in,
      darkquad29_wvl_acc_iq_avg3_ss_bram_data_out => darkquad29_wvl_acc_iq_avg3_ss_bram_data_out,
      darkquad29_wvl_acc_iq_avg3_ss_bram_addr => darkquad29_wvl_acc_iq_avg3_ss_bram_addr,
      darkquad29_wvl_acc_iq_avg3_ss_bram_data_in => darkquad29_wvl_acc_iq_avg3_ss_bram_data_in,
      darkquad29_wvl_acc_iq_avg3_ss_bram_we => darkquad29_wvl_acc_iq_avg3_ss_bram_we,
      darkquad29_wvl_acc_iq_avg3_ss_ctrl_user_data_out => darkquad29_wvl_acc_iq_avg3_ss_ctrl_user_data_out,
      darkquad29_wvl_acc_iq_avg3_ss_status_user_data_in => darkquad29_wvl_acc_iq_avg3_ss_status_user_data_in,
      darkquad29_wvl_acc_iq_start_acc_user_data_out => darkquad29_wvl_acc_iq_start_acc_user_data_out,
      darkquad29_wvl_adc_in_adcdac_2g_user_data_i0 => darkquad29_wvl_adc_in_adcdac_2g_user_data_i0,
      darkquad29_wvl_adc_in_adcdac_2g_user_data_i1 => darkquad29_wvl_adc_in_adcdac_2g_user_data_i1,
      darkquad29_wvl_adc_in_adcdac_2g_user_data_i2 => darkquad29_wvl_adc_in_adcdac_2g_user_data_i2,
      darkquad29_wvl_adc_in_adcdac_2g_user_data_i3 => darkquad29_wvl_adc_in_adcdac_2g_user_data_i3,
      darkquad29_wvl_adc_in_adcdac_2g_user_data_i4 => darkquad29_wvl_adc_in_adcdac_2g_user_data_i4,
      darkquad29_wvl_adc_in_adcdac_2g_user_data_i5 => darkquad29_wvl_adc_in_adcdac_2g_user_data_i5,
      darkquad29_wvl_adc_in_adcdac_2g_user_data_i6 => darkquad29_wvl_adc_in_adcdac_2g_user_data_i6,
      darkquad29_wvl_adc_in_adcdac_2g_user_data_i7 => darkquad29_wvl_adc_in_adcdac_2g_user_data_i7,
      darkquad29_wvl_adc_in_adcdac_2g_user_data_q0 => darkquad29_wvl_adc_in_adcdac_2g_user_data_q0,
      darkquad29_wvl_adc_in_adcdac_2g_user_data_q1 => darkquad29_wvl_adc_in_adcdac_2g_user_data_q1,
      darkquad29_wvl_adc_in_adcdac_2g_user_data_q2 => darkquad29_wvl_adc_in_adcdac_2g_user_data_q2,
      darkquad29_wvl_adc_in_adcdac_2g_user_data_q3 => darkquad29_wvl_adc_in_adcdac_2g_user_data_q3,
      darkquad29_wvl_adc_in_adcdac_2g_user_data_q4 => darkquad29_wvl_adc_in_adcdac_2g_user_data_q4,
      darkquad29_wvl_adc_in_adcdac_2g_user_data_q5 => darkquad29_wvl_adc_in_adcdac_2g_user_data_q5,
      darkquad29_wvl_adc_in_adcdac_2g_user_data_q6 => darkquad29_wvl_adc_in_adcdac_2g_user_data_q6,
      darkquad29_wvl_adc_in_adcdac_2g_user_data_q7 => darkquad29_wvl_adc_in_adcdac_2g_user_data_q7,
      darkquad29_wvl_adc_in_adcdac_2g_user_info_i0 => darkquad29_wvl_adc_in_adcdac_2g_user_info_i0,
      darkquad29_wvl_adc_in_adcdac_2g_user_info_i1 => darkquad29_wvl_adc_in_adcdac_2g_user_info_i1,
      darkquad29_wvl_adc_in_adcdac_2g_user_info_i2 => darkquad29_wvl_adc_in_adcdac_2g_user_info_i2,
      darkquad29_wvl_adc_in_adcdac_2g_user_info_i3 => darkquad29_wvl_adc_in_adcdac_2g_user_info_i3,
      darkquad29_wvl_adc_in_adcdac_2g_user_info_i4 => darkquad29_wvl_adc_in_adcdac_2g_user_info_i4,
      darkquad29_wvl_adc_in_adcdac_2g_user_info_i5 => darkquad29_wvl_adc_in_adcdac_2g_user_info_i5,
      darkquad29_wvl_adc_in_adcdac_2g_user_info_i6 => darkquad29_wvl_adc_in_adcdac_2g_user_info_i6,
      darkquad29_wvl_adc_in_adcdac_2g_user_info_i7 => darkquad29_wvl_adc_in_adcdac_2g_user_info_i7,
      darkquad29_wvl_adc_in_adcdac_2g_user_info_q0 => darkquad29_wvl_adc_in_adcdac_2g_user_info_q0,
      darkquad29_wvl_adc_in_adcdac_2g_user_info_q1 => darkquad29_wvl_adc_in_adcdac_2g_user_info_q1,
      darkquad29_wvl_adc_in_adcdac_2g_user_info_q2 => darkquad29_wvl_adc_in_adcdac_2g_user_info_q2,
      darkquad29_wvl_adc_in_adcdac_2g_user_info_q3 => darkquad29_wvl_adc_in_adcdac_2g_user_info_q3,
      darkquad29_wvl_adc_in_adcdac_2g_user_info_q4 => darkquad29_wvl_adc_in_adcdac_2g_user_info_q4,
      darkquad29_wvl_adc_in_adcdac_2g_user_info_q5 => darkquad29_wvl_adc_in_adcdac_2g_user_info_q5,
      darkquad29_wvl_adc_in_adcdac_2g_user_info_q6 => darkquad29_wvl_adc_in_adcdac_2g_user_info_q6,
      darkquad29_wvl_adc_in_adcdac_2g_user_info_q7 => darkquad29_wvl_adc_in_adcdac_2g_user_info_q7,
      darkquad29_wvl_adc_in_adcdac_2g_user_mmcm_locked => darkquad29_wvl_adc_in_adcdac_2g_user_mmcm_locked,
      darkquad29_wvl_adc_in_adcdac_2g_user_sync => darkquad29_wvl_adc_in_adcdac_2g_user_sync,
      darkquad29_wvl_adc_in_adcdac_2g_user_valid => darkquad29_wvl_adc_in_adcdac_2g_user_valid,
      darkquad29_wvl_adc_in_adcdac_2g_user_dly_val => darkquad29_wvl_adc_in_adcdac_2g_user_dly_val,
      darkquad29_wvl_adc_in_adcdac_2g_user_inc_mmcm_phs => darkquad29_wvl_adc_in_adcdac_2g_user_inc_mmcm_phs,
      darkquad29_wvl_adc_in_adcdac_2g_user_load_dly0 => darkquad29_wvl_adc_in_adcdac_2g_user_load_dly0,
      darkquad29_wvl_adc_in_adcdac_2g_user_pos_mmcm_phs => darkquad29_wvl_adc_in_adcdac_2g_user_pos_mmcm_phs,
      darkquad29_wvl_adc_in_adcdac_2g_user_rdy_i0 => darkquad29_wvl_adc_in_adcdac_2g_user_rdy_i0,
      darkquad29_wvl_adc_in_dly_val_user_data_out => darkquad29_wvl_adc_in_dly_val_user_data_out,
      darkquad29_wvl_adc_in_i_scale_user_data_out => darkquad29_wvl_adc_in_i_scale_user_data_out,
      darkquad29_wvl_adc_in_inc_phs_user_data_out => darkquad29_wvl_adc_in_inc_phs_user_data_out,
      darkquad29_wvl_adc_in_load_dly_user_data_out => darkquad29_wvl_adc_in_load_dly_user_data_out,
      darkquad29_wvl_adc_in_locked_user_data_in => darkquad29_wvl_adc_in_locked_user_data_in,
      darkquad29_wvl_adc_in_n_miss_pps_user_data_in => darkquad29_wvl_adc_in_n_miss_pps_user_data_in,
      darkquad29_wvl_adc_in_pos_phs_user_data_out => darkquad29_wvl_adc_in_pos_phs_user_data_out,
      darkquad29_wvl_adc_in_raw_pps_user_data_in => darkquad29_wvl_adc_in_raw_pps_user_data_in,
      darkquad29_wvl_adc_in_snp_cal0_ss_bram_data_out => darkquad29_wvl_adc_in_snp_cal0_ss_bram_data_out,
      darkquad29_wvl_adc_in_snp_cal0_ss_bram_addr => darkquad29_wvl_adc_in_snp_cal0_ss_bram_addr,
      darkquad29_wvl_adc_in_snp_cal0_ss_bram_data_in => darkquad29_wvl_adc_in_snp_cal0_ss_bram_data_in,
      darkquad29_wvl_adc_in_snp_cal0_ss_bram_we => darkquad29_wvl_adc_in_snp_cal0_ss_bram_we,
      darkquad29_wvl_adc_in_snp_cal0_ss_ctrl_user_data_out => darkquad29_wvl_adc_in_snp_cal0_ss_ctrl_user_data_out,
      darkquad29_wvl_adc_in_snp_cal0_ss_status_user_data_in => darkquad29_wvl_adc_in_snp_cal0_ss_status_user_data_in,
      darkquad29_wvl_adc_in_snp_cal1_ss_bram_data_out => darkquad29_wvl_adc_in_snp_cal1_ss_bram_data_out,
      darkquad29_wvl_adc_in_snp_cal1_ss_bram_addr => darkquad29_wvl_adc_in_snp_cal1_ss_bram_addr,
      darkquad29_wvl_adc_in_snp_cal1_ss_bram_data_in => darkquad29_wvl_adc_in_snp_cal1_ss_bram_data_in,
      darkquad29_wvl_adc_in_snp_cal1_ss_bram_we => darkquad29_wvl_adc_in_snp_cal1_ss_bram_we,
      darkquad29_wvl_adc_in_snp_cal1_ss_ctrl_user_data_out => darkquad29_wvl_adc_in_snp_cal1_ss_ctrl_user_data_out,
      darkquad29_wvl_adc_in_snp_cal1_ss_status_user_data_in => darkquad29_wvl_adc_in_snp_cal1_ss_status_user_data_in,
      darkquad29_wvl_adc_in_snp_cal2_ss_bram_data_out => darkquad29_wvl_adc_in_snp_cal2_ss_bram_data_out,
      darkquad29_wvl_adc_in_snp_cal2_ss_bram_addr => darkquad29_wvl_adc_in_snp_cal2_ss_bram_addr,
      darkquad29_wvl_adc_in_snp_cal2_ss_bram_data_in => darkquad29_wvl_adc_in_snp_cal2_ss_bram_data_in,
      darkquad29_wvl_adc_in_snp_cal2_ss_bram_we => darkquad29_wvl_adc_in_snp_cal2_ss_bram_we,
      darkquad29_wvl_adc_in_snp_cal2_ss_ctrl_user_data_out => darkquad29_wvl_adc_in_snp_cal2_ss_ctrl_user_data_out,
      darkquad29_wvl_adc_in_snp_cal2_ss_status_user_data_in => darkquad29_wvl_adc_in_snp_cal2_ss_status_user_data_in,
      darkquad29_wvl_adc_in_snp_cal3_ss_bram_data_out => darkquad29_wvl_adc_in_snp_cal3_ss_bram_data_out,
      darkquad29_wvl_adc_in_snp_cal3_ss_bram_addr => darkquad29_wvl_adc_in_snp_cal3_ss_bram_addr,
      darkquad29_wvl_adc_in_snp_cal3_ss_bram_data_in => darkquad29_wvl_adc_in_snp_cal3_ss_bram_data_in,
      darkquad29_wvl_adc_in_snp_cal3_ss_bram_we => darkquad29_wvl_adc_in_snp_cal3_ss_bram_we,
      darkquad29_wvl_adc_in_snp_cal3_ss_ctrl_user_data_out => darkquad29_wvl_adc_in_snp_cal3_ss_ctrl_user_data_out,
      darkquad29_wvl_adc_in_snp_cal3_ss_status_user_data_in => darkquad29_wvl_adc_in_snp_cal3_ss_status_user_data_in,
      darkquad29_wvl_adc_in_trig_user_data_out => darkquad29_wvl_adc_in_trig_user_data_out,
      darkquad29_wvl_adc_in_ts0_user_data_in => darkquad29_wvl_adc_in_ts0_user_data_in,
      darkquad29_wvl_adc_in_ts1_user_data_in => darkquad29_wvl_adc_in_ts1_user_data_in,
      darkquad29_wvl_adc_in_ts2_user_data_in => darkquad29_wvl_adc_in_ts2_user_data_in,
      darkquad29_wvl_adc_in_ts3_user_data_in => darkquad29_wvl_adc_in_ts3_user_data_in,
      darkquad29_wvl_adc_in_valid_user_data_in => darkquad29_wvl_adc_in_valid_user_data_in,
      darkquad29_wvl_board_num_user_data_out => darkquad29_wvl_board_num_user_data_out,
      darkquad29_wvl_capture0_base_kf_user_data_out => darkquad29_wvl_capture0_base_kf_user_data_out,
      darkquad29_wvl_capture0_base_kq_user_data_out => darkquad29_wvl_capture0_base_kq_user_data_out,
      darkquad29_wvl_capture0_cps_lim_user_data_out => darkquad29_wvl_capture0_cps_lim_user_data_out,
      darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_data_out => darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_data_out,
      darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_addr => darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_addr,
      darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_data_in => darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_data_in,
      darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_we => darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_we,
      darkquad29_wvl_capture0_load_thresh_user_data_out => darkquad29_wvl_capture0_load_thresh_user_data_out,
      darkquad29_wvl_capture0_pix_data_out => darkquad29_wvl_capture0_pix_data_out,
      darkquad29_wvl_capture0_pix_addr => darkquad29_wvl_capture0_pix_addr,
      darkquad29_wvl_capture0_pix_data_in => darkquad29_wvl_capture0_pix_data_in,
      darkquad29_wvl_capture0_pix_we => darkquad29_wvl_capture0_pix_we,
      darkquad29_wvl_capture0_threshold_user_data_out => darkquad29_wvl_capture0_threshold_user_data_out,
      darkquad29_wvl_capture0_use_energy_cal_user_data_out => darkquad29_wvl_capture0_use_energy_cal_user_data_out,
      darkquad29_wvl_capture1_base_kf_user_data_out => darkquad29_wvl_capture1_base_kf_user_data_out,
      darkquad29_wvl_capture1_base_kq_user_data_out => darkquad29_wvl_capture1_base_kq_user_data_out,
      darkquad29_wvl_capture1_cps_lim_user_data_out => darkquad29_wvl_capture1_cps_lim_user_data_out,
      darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_data_out => darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_data_out,
      darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_addr => darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_addr,
      darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_data_in => darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_data_in,
      darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_we => darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_we,
      darkquad29_wvl_capture1_load_thresh_user_data_out => darkquad29_wvl_capture1_load_thresh_user_data_out,
      darkquad29_wvl_capture1_pix_data_out => darkquad29_wvl_capture1_pix_data_out,
      darkquad29_wvl_capture1_pix_addr => darkquad29_wvl_capture1_pix_addr,
      darkquad29_wvl_capture1_pix_data_in => darkquad29_wvl_capture1_pix_data_in,
      darkquad29_wvl_capture1_pix_we => darkquad29_wvl_capture1_pix_we,
      darkquad29_wvl_capture1_threshold_user_data_out => darkquad29_wvl_capture1_threshold_user_data_out,
      darkquad29_wvl_capture1_use_energy_cal_user_data_out => darkquad29_wvl_capture1_use_energy_cal_user_data_out,
      darkquad29_wvl_capture2_base_kf_user_data_out => darkquad29_wvl_capture2_base_kf_user_data_out,
      darkquad29_wvl_capture2_base_kq_user_data_out => darkquad29_wvl_capture2_base_kq_user_data_out,
      darkquad29_wvl_capture2_cps_lim_user_data_out => darkquad29_wvl_capture2_cps_lim_user_data_out,
      darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_data_out => darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_data_out,
      darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_addr => darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_addr,
      darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_data_in => darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_data_in,
      darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_we => darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_we,
      darkquad29_wvl_capture2_load_thresh_user_data_out => darkquad29_wvl_capture2_load_thresh_user_data_out,
      darkquad29_wvl_capture2_pix_data_out => darkquad29_wvl_capture2_pix_data_out,
      darkquad29_wvl_capture2_pix_addr => darkquad29_wvl_capture2_pix_addr,
      darkquad29_wvl_capture2_pix_data_in => darkquad29_wvl_capture2_pix_data_in,
      darkquad29_wvl_capture2_pix_we => darkquad29_wvl_capture2_pix_we,
      darkquad29_wvl_capture2_threshold_user_data_out => darkquad29_wvl_capture2_threshold_user_data_out,
      darkquad29_wvl_capture2_use_energy_cal_user_data_out => darkquad29_wvl_capture2_use_energy_cal_user_data_out,
      darkquad29_wvl_capture3_base_kf_user_data_out => darkquad29_wvl_capture3_base_kf_user_data_out,
      darkquad29_wvl_capture3_base_kq_user_data_out => darkquad29_wvl_capture3_base_kq_user_data_out,
      darkquad29_wvl_capture3_cps_lim_user_data_out => darkquad29_wvl_capture3_cps_lim_user_data_out,
      darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_data_out => darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_data_out,
      darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_addr => darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_addr,
      darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_data_in => darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_data_in,
      darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_we => darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_we,
      darkquad29_wvl_capture3_load_thresh_user_data_out => darkquad29_wvl_capture3_load_thresh_user_data_out,
      darkquad29_wvl_capture3_pix_data_out => darkquad29_wvl_capture3_pix_data_out,
      darkquad29_wvl_capture3_pix_addr => darkquad29_wvl_capture3_pix_addr,
      darkquad29_wvl_capture3_pix_data_in => darkquad29_wvl_capture3_pix_data_in,
      darkquad29_wvl_capture3_pix_we => darkquad29_wvl_capture3_pix_we,
      darkquad29_wvl_capture3_threshold_user_data_out => darkquad29_wvl_capture3_threshold_user_data_out,
      darkquad29_wvl_capture3_use_energy_cal_user_data_out => darkquad29_wvl_capture3_use_energy_cal_user_data_out,
      darkquad29_wvl_chan_sel_ch_bin0_user_data_out => darkquad29_wvl_chan_sel_ch_bin0_user_data_out,
      darkquad29_wvl_chan_sel_ch_bin1_user_data_out => darkquad29_wvl_chan_sel_ch_bin1_user_data_out,
      darkquad29_wvl_chan_sel_ch_bin2_user_data_out => darkquad29_wvl_chan_sel_ch_bin2_user_data_out,
      darkquad29_wvl_chan_sel_ch_bin3_user_data_out => darkquad29_wvl_chan_sel_ch_bin3_user_data_out,
      darkquad29_wvl_chan_sel_load_user_data_out => darkquad29_wvl_chan_sel_load_user_data_out,
      darkquad29_wvl_check_lag_data_ch_user_data_in => darkquad29_wvl_check_lag_data_ch_user_data_in,
      darkquad29_wvl_check_lag_dds_ch_user_data_in => darkquad29_wvl_check_lag_dds_ch_user_data_in,
      darkquad29_wvl_check_lag_latch_user_data_out => darkquad29_wvl_check_lag_latch_user_data_out,
      darkquad29_wvl_conv_phase0_centers_user_data_out => darkquad29_wvl_conv_phase0_centers_user_data_out,
      darkquad29_wvl_conv_phase0_load_centers_user_data_out => darkquad29_wvl_conv_phase0_load_centers_user_data_out,
      darkquad29_wvl_conv_phase1_centers_user_data_out => darkquad29_wvl_conv_phase1_centers_user_data_out,
      darkquad29_wvl_conv_phase1_load_centers_user_data_out => darkquad29_wvl_conv_phase1_load_centers_user_data_out,
      darkquad29_wvl_conv_phase2_centers_user_data_out => darkquad29_wvl_conv_phase2_centers_user_data_out,
      darkquad29_wvl_conv_phase2_load_centers_user_data_out => darkquad29_wvl_conv_phase2_load_centers_user_data_out,
      darkquad29_wvl_conv_phase3_centers_user_data_out => darkquad29_wvl_conv_phase3_centers_user_data_out,
      darkquad29_wvl_conv_phase3_load_centers_user_data_out => darkquad29_wvl_conv_phase3_load_centers_user_data_out,
      darkquad29_wvl_dds_lut_qdr0_ack => darkquad29_wvl_dds_lut_qdr0_ack,
      darkquad29_wvl_dds_lut_qdr0_cal_fail => darkquad29_wvl_dds_lut_qdr0_cal_fail,
      darkquad29_wvl_dds_lut_qdr0_data_out => darkquad29_wvl_dds_lut_qdr0_data_out,
      darkquad29_wvl_dds_lut_qdr0_data_valid => darkquad29_wvl_dds_lut_qdr0_data_valid,
      darkquad29_wvl_dds_lut_qdr0_phy_ready => darkquad29_wvl_dds_lut_qdr0_phy_ready,
      darkquad29_wvl_dds_lut_qdr0_address => darkquad29_wvl_dds_lut_qdr0_address,
      darkquad29_wvl_dds_lut_qdr0_be => darkquad29_wvl_dds_lut_qdr0_be,
      darkquad29_wvl_dds_lut_qdr0_data_in => darkquad29_wvl_dds_lut_qdr0_data_in,
      darkquad29_wvl_dds_lut_qdr0_rd_en => darkquad29_wvl_dds_lut_qdr0_rd_en,
      darkquad29_wvl_dds_lut_qdr0_wr_en => darkquad29_wvl_dds_lut_qdr0_wr_en,
      darkquad29_wvl_dds_lut_qdr1_ack => darkquad29_wvl_dds_lut_qdr1_ack,
      darkquad29_wvl_dds_lut_qdr1_cal_fail => darkquad29_wvl_dds_lut_qdr1_cal_fail,
      darkquad29_wvl_dds_lut_qdr1_data_out => darkquad29_wvl_dds_lut_qdr1_data_out,
      darkquad29_wvl_dds_lut_qdr1_data_valid => darkquad29_wvl_dds_lut_qdr1_data_valid,
      darkquad29_wvl_dds_lut_qdr1_phy_ready => darkquad29_wvl_dds_lut_qdr1_phy_ready,
      darkquad29_wvl_dds_lut_qdr1_address => darkquad29_wvl_dds_lut_qdr1_address,
      darkquad29_wvl_dds_lut_qdr1_be => darkquad29_wvl_dds_lut_qdr1_be,
      darkquad29_wvl_dds_lut_qdr1_data_in => darkquad29_wvl_dds_lut_qdr1_data_in,
      darkquad29_wvl_dds_lut_qdr1_rd_en => darkquad29_wvl_dds_lut_qdr1_rd_en,
      darkquad29_wvl_dds_lut_qdr1_wr_en => darkquad29_wvl_dds_lut_qdr1_wr_en,
      darkquad29_wvl_dds_lut_qdr2_ack => darkquad29_wvl_dds_lut_qdr2_ack,
      darkquad29_wvl_dds_lut_qdr2_cal_fail => darkquad29_wvl_dds_lut_qdr2_cal_fail,
      darkquad29_wvl_dds_lut_qdr2_data_out => darkquad29_wvl_dds_lut_qdr2_data_out,
      darkquad29_wvl_dds_lut_qdr2_data_valid => darkquad29_wvl_dds_lut_qdr2_data_valid,
      darkquad29_wvl_dds_lut_qdr2_phy_ready => darkquad29_wvl_dds_lut_qdr2_phy_ready,
      darkquad29_wvl_dds_lut_qdr2_address => darkquad29_wvl_dds_lut_qdr2_address,
      darkquad29_wvl_dds_lut_qdr2_be => darkquad29_wvl_dds_lut_qdr2_be,
      darkquad29_wvl_dds_lut_qdr2_data_in => darkquad29_wvl_dds_lut_qdr2_data_in,
      darkquad29_wvl_dds_lut_qdr2_rd_en => darkquad29_wvl_dds_lut_qdr2_rd_en,
      darkquad29_wvl_dds_lut_qdr2_wr_en => darkquad29_wvl_dds_lut_qdr2_wr_en,
      darkquad29_wvl_dds_lut_qdr3_ack => darkquad29_wvl_dds_lut_qdr3_ack,
      darkquad29_wvl_dds_lut_qdr3_cal_fail => darkquad29_wvl_dds_lut_qdr3_cal_fail,
      darkquad29_wvl_dds_lut_qdr3_data_out => darkquad29_wvl_dds_lut_qdr3_data_out,
      darkquad29_wvl_dds_lut_qdr3_data_valid => darkquad29_wvl_dds_lut_qdr3_data_valid,
      darkquad29_wvl_dds_lut_qdr3_phy_ready => darkquad29_wvl_dds_lut_qdr3_phy_ready,
      darkquad29_wvl_dds_lut_qdr3_address => darkquad29_wvl_dds_lut_qdr3_address,
      darkquad29_wvl_dds_lut_qdr3_be => darkquad29_wvl_dds_lut_qdr3_be,
      darkquad29_wvl_dds_lut_qdr3_data_in => darkquad29_wvl_dds_lut_qdr3_data_in,
      darkquad29_wvl_dds_lut_qdr3_rd_en => darkquad29_wvl_dds_lut_qdr3_rd_en,
      darkquad29_wvl_dds_lut_qdr3_wr_en => darkquad29_wvl_dds_lut_qdr3_wr_en,
      darkquad29_wvl_dds_lut_run_user_data_out => darkquad29_wvl_dds_lut_run_user_data_out,
      darkquad29_wvl_dds_shift_user_data_out => darkquad29_wvl_dds_shift_user_data_out,
      darkquad29_wvl_gbe64_dest_ip_user_data_out => darkquad29_wvl_gbe64_dest_ip_user_data_out,
      darkquad29_wvl_gbe64_one_gbe_app_dbg_data => darkquad29_wvl_gbe64_one_gbe_app_dbg_data,
      darkquad29_wvl_gbe64_one_gbe_app_dbg_dvld => darkquad29_wvl_gbe64_one_gbe_app_dbg_dvld,
      darkquad29_wvl_gbe64_one_gbe_app_rx_badframe => darkquad29_wvl_gbe64_one_gbe_app_rx_badframe,
      darkquad29_wvl_gbe64_one_gbe_app_rx_data => darkquad29_wvl_gbe64_one_gbe_app_rx_data,
      darkquad29_wvl_gbe64_one_gbe_app_rx_dvld => darkquad29_wvl_gbe64_one_gbe_app_rx_dvld,
      darkquad29_wvl_gbe64_one_gbe_app_rx_eof => darkquad29_wvl_gbe64_one_gbe_app_rx_eof,
      darkquad29_wvl_gbe64_one_gbe_app_rx_overrun => darkquad29_wvl_gbe64_one_gbe_app_rx_overrun,
      darkquad29_wvl_gbe64_one_gbe_app_rx_srcip => darkquad29_wvl_gbe64_one_gbe_app_rx_srcip,
      darkquad29_wvl_gbe64_one_gbe_app_rx_srcport => darkquad29_wvl_gbe64_one_gbe_app_rx_srcport,
      darkquad29_wvl_gbe64_one_gbe_app_tx_afull => darkquad29_wvl_gbe64_one_gbe_app_tx_afull,
      darkquad29_wvl_gbe64_one_gbe_app_tx_overflow => darkquad29_wvl_gbe64_one_gbe_app_tx_overflow,
      darkquad29_wvl_gbe64_one_gbe_app_rx_ack => darkquad29_wvl_gbe64_one_gbe_app_rx_ack,
      darkquad29_wvl_gbe64_one_gbe_app_rx_rst => darkquad29_wvl_gbe64_one_gbe_app_rx_rst,
      darkquad29_wvl_gbe64_one_gbe_app_tx_data => darkquad29_wvl_gbe64_one_gbe_app_tx_data,
      darkquad29_wvl_gbe64_one_gbe_app_tx_destip => darkquad29_wvl_gbe64_one_gbe_app_tx_destip,
      darkquad29_wvl_gbe64_one_gbe_app_tx_destport => darkquad29_wvl_gbe64_one_gbe_app_tx_destport,
      darkquad29_wvl_gbe64_one_gbe_app_tx_dvld => darkquad29_wvl_gbe64_one_gbe_app_tx_dvld,
      darkquad29_wvl_gbe64_one_gbe_app_tx_eof => darkquad29_wvl_gbe64_one_gbe_app_tx_eof,
      darkquad29_wvl_gbe64_one_gbe_app_tx_rst => darkquad29_wvl_gbe64_one_gbe_app_tx_rst,
      darkquad29_wvl_gbe64_rst_user_data_out => darkquad29_wvl_gbe64_rst_user_data_out,
      darkquad29_wvl_gbe64_tx_afull_user_data_in => darkquad29_wvl_gbe64_tx_afull_user_data_in,
      darkquad29_wvl_gbe64_tx_overrun_user_data_in => darkquad29_wvl_gbe64_tx_overrun_user_data_in,
      darkquad29_wvl_gbe64_words_per_frame_user_data_out => darkquad29_wvl_gbe64_words_per_frame_user_data_out,
      darkquad29_wvl_n_eof_sent_user_data_in => darkquad29_wvl_n_eof_sent_user_data_in,
      darkquad29_wvl_n_photons_user_data_in => darkquad29_wvl_n_photons_user_data_in,
      darkquad29_wvl_pfb_fft_check_fft_oflow_user_data_in => darkquad29_wvl_pfb_fft_check_fft_oflow_user_data_in,
      darkquad29_wvl_phase_dmp_ch_we_user_data_out => darkquad29_wvl_phase_dmp_ch_we_user_data_out,
      darkquad29_wvl_phase_dmp_on_user_data_out => darkquad29_wvl_phase_dmp_on_user_data_out,
      darkquad29_wvl_phase_port_user_data_out => darkquad29_wvl_phase_port_user_data_out,
      darkquad29_wvl_photon_port_user_data_out => darkquad29_wvl_photon_port_user_data_out,
      darkquad29_wvl_prog_fir0_load_chan_user_data_out => darkquad29_wvl_prog_fir0_load_chan_user_data_out,
      darkquad29_wvl_prog_fir0_single_chan_coeffs_data_out => darkquad29_wvl_prog_fir0_single_chan_coeffs_data_out,
      darkquad29_wvl_prog_fir0_single_chan_coeffs_addr => darkquad29_wvl_prog_fir0_single_chan_coeffs_addr,
      darkquad29_wvl_prog_fir0_single_chan_coeffs_data_in => darkquad29_wvl_prog_fir0_single_chan_coeffs_data_in,
      darkquad29_wvl_prog_fir0_single_chan_coeffs_we => darkquad29_wvl_prog_fir0_single_chan_coeffs_we,
      darkquad29_wvl_prog_fir1_load_chan_user_data_out => darkquad29_wvl_prog_fir1_load_chan_user_data_out,
      darkquad29_wvl_prog_fir1_single_chan_coeffs_data_out => darkquad29_wvl_prog_fir1_single_chan_coeffs_data_out,
      darkquad29_wvl_prog_fir1_single_chan_coeffs_addr => darkquad29_wvl_prog_fir1_single_chan_coeffs_addr,
      darkquad29_wvl_prog_fir1_single_chan_coeffs_data_in => darkquad29_wvl_prog_fir1_single_chan_coeffs_data_in,
      darkquad29_wvl_prog_fir1_single_chan_coeffs_we => darkquad29_wvl_prog_fir1_single_chan_coeffs_we,
      darkquad29_wvl_prog_fir2_load_chan_user_data_out => darkquad29_wvl_prog_fir2_load_chan_user_data_out,
      darkquad29_wvl_prog_fir2_single_chan_coeffs_data_out => darkquad29_wvl_prog_fir2_single_chan_coeffs_data_out,
      darkquad29_wvl_prog_fir2_single_chan_coeffs_addr => darkquad29_wvl_prog_fir2_single_chan_coeffs_addr,
      darkquad29_wvl_prog_fir2_single_chan_coeffs_data_in => darkquad29_wvl_prog_fir2_single_chan_coeffs_data_in,
      darkquad29_wvl_prog_fir2_single_chan_coeffs_we => darkquad29_wvl_prog_fir2_single_chan_coeffs_we,
      darkquad29_wvl_prog_fir3_load_chan_user_data_out => darkquad29_wvl_prog_fir3_load_chan_user_data_out,
      darkquad29_wvl_prog_fir3_single_chan_coeffs_data_out => darkquad29_wvl_prog_fir3_single_chan_coeffs_data_out,
      darkquad29_wvl_prog_fir3_single_chan_coeffs_addr => darkquad29_wvl_prog_fir3_single_chan_coeffs_addr,
      darkquad29_wvl_prog_fir3_single_chan_coeffs_data_in => darkquad29_wvl_prog_fir3_single_chan_coeffs_data_in,
      darkquad29_wvl_prog_fir3_single_chan_coeffs_we => darkquad29_wvl_prog_fir3_single_chan_coeffs_we,
      darkquad29_wvl_run_user_data_out => darkquad29_wvl_run_user_data_out,
      darkquad29_wvl_sel_ch_user_data_out => darkquad29_wvl_sel_ch_user_data_out,
      darkquad29_wvl_snp_phs_ss_bram_data_out => darkquad29_wvl_snp_phs_ss_bram_data_out,
      darkquad29_wvl_snp_phs_ss_bram_addr => darkquad29_wvl_snp_phs_ss_bram_addr,
      darkquad29_wvl_snp_phs_ss_bram_data_in => darkquad29_wvl_snp_phs_ss_bram_data_in,
      darkquad29_wvl_snp_phs_ss_bram_we => darkquad29_wvl_snp_phs_ss_bram_we,
      darkquad29_wvl_snp_phs_ss_ctrl_user_data_out => darkquad29_wvl_snp_phs_ss_ctrl_user_data_out,
      darkquad29_wvl_snp_phs_ss_status_user_data_in => darkquad29_wvl_snp_phs_ss_status_user_data_in,
      darkquad29_wvl_start_cap_user_data_out => darkquad29_wvl_start_cap_user_data_out,
      darkquad29_wvl_timekeeper_base_ts_user_data_out => darkquad29_wvl_timekeeper_base_ts_user_data_out,
      darkquad29_wvl_timekeeper_sec_now_user_data_in => darkquad29_wvl_timekeeper_sec_now_user_data_in,
      darkquad29_wvl_trig_snp_user_data_out => darkquad29_wvl_trig_snp_user_data_out
    );

  darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl : system_darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_wrapper
    port map (
      zdok_tx_data_p => adc_ctrl_tx_data_p,
      zdok_tx_data_n => adc_ctrl_tx_data_n,
      zdok_rx_data_p => adc_ctrl_rx_data_p,
      zdok_rx_data_n => adc_ctrl_rx_data_n,
      fpga_clk => adc0_clk,
      user_tx_rst => darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_rst,
      user_rx_rst => darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_rst,
      user_tx_data => darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_data,
      user_tx_val => darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_val,
      user_tx_full => darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_full,
      user_rx_full => darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_full,
      user_rx_data => darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_data,
      user_rx_val => darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_val
    );

  darkquad29_wvl_a2g_ctrl_en_bram_dump : system_darkquad29_wvl_a2g_ctrl_en_bram_dump_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb0_OPB_Rst,
      Sl_DBus => opb0_Sl_DBus(32 to 63),
      Sl_errAck => opb0_Sl_errAck(1),
      Sl_retry => opb0_Sl_retry(1),
      Sl_toutSup => opb0_Sl_toutSup(1),
      Sl_xferAck => opb0_Sl_xferAck(1),
      OPB_ABus => opb0_OPB_ABus,
      OPB_BE => opb0_OPB_BE,
      OPB_DBus => opb0_OPB_DBus,
      OPB_RNW => opb0_OPB_RNW,
      OPB_select => opb0_OPB_select,
      OPB_seqAddr => opb0_OPB_seqAddr,
      user_data_out => darkquad29_wvl_a2g_ctrl_en_bram_dump_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_a2g_ctrl_in_val : system_darkquad29_wvl_a2g_ctrl_in_val_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb0_OPB_Rst,
      Sl_DBus => opb0_Sl_DBus(64 to 95),
      Sl_errAck => opb0_Sl_errAck(2),
      Sl_retry => opb0_Sl_retry(2),
      Sl_toutSup => opb0_Sl_toutSup(2),
      Sl_xferAck => opb0_Sl_xferAck(2),
      OPB_ABus => opb0_OPB_ABus,
      OPB_BE => opb0_OPB_BE,
      OPB_DBus => opb0_OPB_DBus,
      OPB_RNW => opb0_OPB_RNW,
      OPB_select => opb0_OPB_select,
      OPB_seqAddr => opb0_OPB_seqAddr,
      user_data_out => darkquad29_wvl_a2g_ctrl_in_val_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_a2g_ctrl_last_tx_data : system_darkquad29_wvl_a2g_ctrl_last_tx_data_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb0_OPB_Rst,
      Sl_DBus => opb0_Sl_DBus(96 to 127),
      Sl_errAck => opb0_Sl_errAck(3),
      Sl_retry => opb0_Sl_retry(3),
      Sl_toutSup => opb0_Sl_toutSup(3),
      Sl_xferAck => opb0_Sl_xferAck(3),
      OPB_ABus => opb0_OPB_ABus,
      OPB_BE => opb0_OPB_BE,
      OPB_DBus => opb0_OPB_DBus,
      OPB_RNW => opb0_OPB_RNW,
      OPB_select => opb0_OPB_select,
      OPB_seqAddr => opb0_OPB_seqAddr,
      user_data_in => darkquad29_wvl_a2g_ctrl_last_tx_data_user_data_in,
      user_clk => adc0_clk
    );

  darkquad29_wvl_a2g_ctrl_lut_dump_buffer_size : system_darkquad29_wvl_a2g_ctrl_lut_dump_buffer_size_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb0_OPB_Rst,
      Sl_DBus => opb0_Sl_DBus(128 to 159),
      Sl_errAck => opb0_Sl_errAck(4),
      Sl_retry => opb0_Sl_retry(4),
      Sl_toutSup => opb0_Sl_toutSup(4),
      Sl_xferAck => opb0_Sl_xferAck(4),
      OPB_ABus => opb0_OPB_ABus,
      OPB_BE => opb0_OPB_BE,
      OPB_DBus => opb0_OPB_DBus,
      OPB_RNW => opb0_OPB_RNW,
      OPB_select => opb0_OPB_select,
      OPB_seqAddr => opb0_OPB_seqAddr,
      user_data_out => darkquad29_wvl_a2g_ctrl_lut_dump_buffer_size_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_ramblk : system_darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_ramblk_wrapper
    port map (
      clk => adc0_clk,
      bram_we => darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_we,
      bram_en_a => net_gnd0,
      bram_addr => darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_addr,
      bram_rd_data => darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_data_out,
      bram_wr_data => darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_data_in,
      BRAM_Rst_B => darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_ramblk_portb_BRAM_Rst,
      BRAM_Clk_B => darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_ramblk_portb_BRAM_Clk,
      BRAM_EN_B => darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_ramblk_portb_BRAM_EN,
      BRAM_WEN_B => darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_ramblk_portb_BRAM_WEN,
      BRAM_Addr_B => darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_ramblk_portb_BRAM_Addr,
      BRAM_Din_B => darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_ramblk_portb_BRAM_Din,
      BRAM_Dout_B => darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_ramblk_portb_BRAM_Dout
    );

  darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer : system_darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_wrapper
    port map (
      opb_clk => epb_clk,
      opb_rst => opb0_OPB_Rst,
      opb_abus => opb0_OPB_ABus,
      opb_dbus => opb0_OPB_DBus,
      sln_dbus => opb0_Sl_DBus(160 to 191),
      opb_select => opb0_OPB_select,
      opb_rnw => opb0_OPB_RNW,
      opb_seqaddr => opb0_OPB_seqAddr,
      opb_be => opb0_OPB_BE,
      sln_xferack => opb0_Sl_xferAck(5),
      sln_errack => opb0_Sl_errAck(5),
      sln_toutsup => opb0_Sl_toutSup(5),
      sln_retry => opb0_Sl_retry(5),
      bram_rst => darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_ramblk_portb_BRAM_Rst,
      bram_clk => darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_ramblk_portb_BRAM_Clk,
      bram_en => darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_ramblk_portb_BRAM_EN,
      bram_wen => darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_ramblk_portb_BRAM_WEN,
      bram_addr => darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_ramblk_portb_BRAM_Addr,
      bram_din => darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_ramblk_portb_BRAM_Din,
      bram_dout => darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_ramblk_portb_BRAM_Dout
    );

  darkquad29_wvl_a2g_ctrl_lut_dump_data_period : system_darkquad29_wvl_a2g_ctrl_lut_dump_data_period_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb0_OPB_Rst,
      Sl_DBus => opb0_Sl_DBus(192 to 223),
      Sl_errAck => opb0_Sl_errAck(6),
      Sl_retry => opb0_Sl_retry(6),
      Sl_toutSup => opb0_Sl_toutSup(6),
      Sl_xferAck => opb0_Sl_xferAck(6),
      OPB_ABus => opb0_OPB_ABus,
      OPB_BE => opb0_OPB_BE,
      OPB_DBus => opb0_OPB_DBus,
      OPB_RNW => opb0_OPB_RNW,
      OPB_select => opb0_OPB_select,
      OPB_seqAddr => opb0_OPB_seqAddr,
      user_data_out => darkquad29_wvl_a2g_ctrl_lut_dump_data_period_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_a2g_ctrl_lut_dump_sending_data : system_darkquad29_wvl_a2g_ctrl_lut_dump_sending_data_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb0_OPB_Rst,
      Sl_DBus => opb0_Sl_DBus(224 to 255),
      Sl_errAck => opb0_Sl_errAck(7),
      Sl_retry => opb0_Sl_retry(7),
      Sl_toutSup => opb0_Sl_toutSup(7),
      Sl_xferAck => opb0_Sl_xferAck(7),
      OPB_ABus => opb0_OPB_ABus,
      OPB_BE => opb0_OPB_BE,
      OPB_DBus => opb0_OPB_DBus,
      OPB_RNW => opb0_OPB_RNW,
      OPB_select => opb0_OPB_select,
      OPB_seqAddr => opb0_OPB_seqAddr,
      user_data_in => darkquad29_wvl_a2g_ctrl_lut_dump_sending_data_user_data_in,
      user_clk => adc0_clk
    );

  darkquad29_wvl_a2g_ctrl_reg_rx_full : system_darkquad29_wvl_a2g_ctrl_reg_rx_full_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb0_OPB_Rst,
      Sl_DBus => opb0_Sl_DBus(256 to 287),
      Sl_errAck => opb0_Sl_errAck(8),
      Sl_retry => opb0_Sl_retry(8),
      Sl_toutSup => opb0_Sl_toutSup(8),
      Sl_xferAck => opb0_Sl_xferAck(8),
      OPB_ABus => opb0_OPB_ABus,
      OPB_BE => opb0_OPB_BE,
      OPB_DBus => opb0_OPB_DBus,
      OPB_RNW => opb0_OPB_RNW,
      OPB_select => opb0_OPB_select,
      OPB_seqAddr => opb0_OPB_seqAddr,
      user_data_in => darkquad29_wvl_a2g_ctrl_reg_rx_full_user_data_in,
      user_clk => adc0_clk
    );

  darkquad29_wvl_a2g_ctrl_reg_tx_full : system_darkquad29_wvl_a2g_ctrl_reg_tx_full_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb0_OPB_Rst,
      Sl_DBus => opb0_Sl_DBus(288 to 319),
      Sl_errAck => opb0_Sl_errAck(9),
      Sl_retry => opb0_Sl_retry(9),
      Sl_toutSup => opb0_Sl_toutSup(9),
      Sl_xferAck => opb0_Sl_xferAck(9),
      OPB_ABus => opb0_OPB_ABus,
      OPB_BE => opb0_OPB_BE,
      OPB_DBus => opb0_OPB_DBus,
      OPB_RNW => opb0_OPB_RNW,
      OPB_select => opb0_OPB_select,
      OPB_seqAddr => opb0_OPB_seqAddr,
      user_data_in => darkquad29_wvl_a2g_ctrl_reg_tx_full_user_data_in,
      user_clk => adc0_clk
    );

  darkquad29_wvl_a2g_ctrl_rst : system_darkquad29_wvl_a2g_ctrl_rst_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb0_OPB_Rst,
      Sl_DBus => opb0_Sl_DBus(320 to 351),
      Sl_errAck => opb0_Sl_errAck(10),
      Sl_retry => opb0_Sl_retry(10),
      Sl_toutSup => opb0_Sl_toutSup(10),
      Sl_xferAck => opb0_Sl_xferAck(10),
      OPB_ABus => opb0_OPB_ABus,
      OPB_BE => opb0_OPB_BE,
      OPB_DBus => opb0_OPB_DBus,
      OPB_RNW => opb0_OPB_RNW,
      OPB_select => opb0_OPB_select,
      OPB_seqAddr => opb0_OPB_seqAddr,
      user_data_out => darkquad29_wvl_a2g_ctrl_rst_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_a2g_ctrl_tx_en : system_darkquad29_wvl_a2g_ctrl_tx_en_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb0_OPB_Rst,
      Sl_DBus => opb0_Sl_DBus(352 to 383),
      Sl_errAck => opb0_Sl_errAck(11),
      Sl_retry => opb0_Sl_retry(11),
      Sl_toutSup => opb0_Sl_toutSup(11),
      Sl_xferAck => opb0_Sl_xferAck(11),
      OPB_ABus => opb0_OPB_ABus,
      OPB_BE => opb0_OPB_BE,
      OPB_DBus => opb0_OPB_DBus,
      OPB_RNW => opb0_OPB_RNW,
      OPB_select => opb0_OPB_select,
      OPB_seqAddr => opb0_OPB_seqAddr,
      user_data_out => darkquad29_wvl_a2g_ctrl_tx_en_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_a2g_ctrl_v7_ready : system_darkquad29_wvl_a2g_ctrl_v7_ready_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb0_OPB_Rst,
      Sl_DBus => opb0_Sl_DBus(384 to 415),
      Sl_errAck => opb0_Sl_errAck(12),
      Sl_retry => opb0_Sl_retry(12),
      Sl_toutSup => opb0_Sl_toutSup(12),
      Sl_xferAck => opb0_Sl_xferAck(12),
      OPB_ABus => opb0_OPB_ABus,
      OPB_BE => opb0_OPB_BE,
      OPB_DBus => opb0_OPB_DBus,
      OPB_RNW => opb0_OPB_RNW,
      OPB_select => opb0_OPB_select,
      OPB_seqAddr => opb0_OPB_seqAddr,
      user_data_in => darkquad29_wvl_a2g_ctrl_v7_ready_user_data_in,
      user_clk => adc0_clk
    );

  darkquad29_wvl_acc_iq_avg0_ss_bram_ramblk : system_darkquad29_wvl_acc_iq_avg0_ss_bram_ramblk_wrapper
    port map (
      clk => adc0_clk,
      bram_we => darkquad29_wvl_acc_iq_avg0_ss_bram_we,
      bram_en_a => net_gnd0,
      bram_addr => darkquad29_wvl_acc_iq_avg0_ss_bram_addr,
      bram_rd_data => darkquad29_wvl_acc_iq_avg0_ss_bram_data_out,
      bram_wr_data => darkquad29_wvl_acc_iq_avg0_ss_bram_data_in,
      BRAM_Rst_B => darkquad29_wvl_acc_iq_avg0_ss_bram_ramblk_portb_BRAM_Rst,
      BRAM_Clk_B => darkquad29_wvl_acc_iq_avg0_ss_bram_ramblk_portb_BRAM_Clk,
      BRAM_EN_B => darkquad29_wvl_acc_iq_avg0_ss_bram_ramblk_portb_BRAM_EN,
      BRAM_WEN_B => darkquad29_wvl_acc_iq_avg0_ss_bram_ramblk_portb_BRAM_WEN,
      BRAM_Addr_B => darkquad29_wvl_acc_iq_avg0_ss_bram_ramblk_portb_BRAM_Addr,
      BRAM_Din_B => darkquad29_wvl_acc_iq_avg0_ss_bram_ramblk_portb_BRAM_Din,
      BRAM_Dout_B => darkquad29_wvl_acc_iq_avg0_ss_bram_ramblk_portb_BRAM_Dout
    );

  darkquad29_wvl_acc_iq_avg0_ss_bram : system_darkquad29_wvl_acc_iq_avg0_ss_bram_wrapper
    port map (
      opb_clk => epb_clk,
      opb_rst => opb0_OPB_Rst,
      opb_abus => opb0_OPB_ABus,
      opb_dbus => opb0_OPB_DBus,
      sln_dbus => opb0_Sl_DBus(416 to 447),
      opb_select => opb0_OPB_select,
      opb_rnw => opb0_OPB_RNW,
      opb_seqaddr => opb0_OPB_seqAddr,
      opb_be => opb0_OPB_BE,
      sln_xferack => opb0_Sl_xferAck(13),
      sln_errack => opb0_Sl_errAck(13),
      sln_toutsup => opb0_Sl_toutSup(13),
      sln_retry => opb0_Sl_retry(13),
      bram_rst => darkquad29_wvl_acc_iq_avg0_ss_bram_ramblk_portb_BRAM_Rst,
      bram_clk => darkquad29_wvl_acc_iq_avg0_ss_bram_ramblk_portb_BRAM_Clk,
      bram_en => darkquad29_wvl_acc_iq_avg0_ss_bram_ramblk_portb_BRAM_EN,
      bram_wen => darkquad29_wvl_acc_iq_avg0_ss_bram_ramblk_portb_BRAM_WEN,
      bram_addr => darkquad29_wvl_acc_iq_avg0_ss_bram_ramblk_portb_BRAM_Addr,
      bram_din => darkquad29_wvl_acc_iq_avg0_ss_bram_ramblk_portb_BRAM_Din,
      bram_dout => darkquad29_wvl_acc_iq_avg0_ss_bram_ramblk_portb_BRAM_Dout
    );

  darkquad29_wvl_acc_iq_avg0_ss_ctrl : system_darkquad29_wvl_acc_iq_avg0_ss_ctrl_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb0_OPB_Rst,
      Sl_DBus => opb0_Sl_DBus(448 to 479),
      Sl_errAck => opb0_Sl_errAck(14),
      Sl_retry => opb0_Sl_retry(14),
      Sl_toutSup => opb0_Sl_toutSup(14),
      Sl_xferAck => opb0_Sl_xferAck(14),
      OPB_ABus => opb0_OPB_ABus,
      OPB_BE => opb0_OPB_BE,
      OPB_DBus => opb0_OPB_DBus,
      OPB_RNW => opb0_OPB_RNW,
      OPB_select => opb0_OPB_select,
      OPB_seqAddr => opb0_OPB_seqAddr,
      user_data_out => darkquad29_wvl_acc_iq_avg0_ss_ctrl_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_acc_iq_avg0_ss_status : system_darkquad29_wvl_acc_iq_avg0_ss_status_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb0_OPB_Rst,
      Sl_DBus => opb0_Sl_DBus(480 to 511),
      Sl_errAck => opb0_Sl_errAck(15),
      Sl_retry => opb0_Sl_retry(15),
      Sl_toutSup => opb0_Sl_toutSup(15),
      Sl_xferAck => opb0_Sl_xferAck(15),
      OPB_ABus => opb0_OPB_ABus,
      OPB_BE => opb0_OPB_BE,
      OPB_DBus => opb0_OPB_DBus,
      OPB_RNW => opb0_OPB_RNW,
      OPB_select => opb0_OPB_select,
      OPB_seqAddr => opb0_OPB_seqAddr,
      user_data_in => darkquad29_wvl_acc_iq_avg0_ss_status_user_data_in,
      user_clk => adc0_clk
    );

  darkquad29_wvl_acc_iq_avg1_ss_bram_ramblk : system_darkquad29_wvl_acc_iq_avg1_ss_bram_ramblk_wrapper
    port map (
      clk => adc0_clk,
      bram_we => darkquad29_wvl_acc_iq_avg1_ss_bram_we,
      bram_en_a => net_gnd0,
      bram_addr => darkquad29_wvl_acc_iq_avg1_ss_bram_addr,
      bram_rd_data => darkquad29_wvl_acc_iq_avg1_ss_bram_data_out,
      bram_wr_data => darkquad29_wvl_acc_iq_avg1_ss_bram_data_in,
      BRAM_Rst_B => darkquad29_wvl_acc_iq_avg1_ss_bram_ramblk_portb_BRAM_Rst,
      BRAM_Clk_B => darkquad29_wvl_acc_iq_avg1_ss_bram_ramblk_portb_BRAM_Clk,
      BRAM_EN_B => darkquad29_wvl_acc_iq_avg1_ss_bram_ramblk_portb_BRAM_EN,
      BRAM_WEN_B => darkquad29_wvl_acc_iq_avg1_ss_bram_ramblk_portb_BRAM_WEN,
      BRAM_Addr_B => darkquad29_wvl_acc_iq_avg1_ss_bram_ramblk_portb_BRAM_Addr,
      BRAM_Din_B => darkquad29_wvl_acc_iq_avg1_ss_bram_ramblk_portb_BRAM_Din,
      BRAM_Dout_B => darkquad29_wvl_acc_iq_avg1_ss_bram_ramblk_portb_BRAM_Dout
    );

  darkquad29_wvl_acc_iq_avg1_ss_bram : system_darkquad29_wvl_acc_iq_avg1_ss_bram_wrapper
    port map (
      opb_clk => epb_clk,
      opb_rst => opb0_OPB_Rst,
      opb_abus => opb0_OPB_ABus,
      opb_dbus => opb0_OPB_DBus,
      sln_dbus => opb0_Sl_DBus(512 to 543),
      opb_select => opb0_OPB_select,
      opb_rnw => opb0_OPB_RNW,
      opb_seqaddr => opb0_OPB_seqAddr,
      opb_be => opb0_OPB_BE,
      sln_xferack => opb0_Sl_xferAck(16),
      sln_errack => opb0_Sl_errAck(16),
      sln_toutsup => opb0_Sl_toutSup(16),
      sln_retry => opb0_Sl_retry(16),
      bram_rst => darkquad29_wvl_acc_iq_avg1_ss_bram_ramblk_portb_BRAM_Rst,
      bram_clk => darkquad29_wvl_acc_iq_avg1_ss_bram_ramblk_portb_BRAM_Clk,
      bram_en => darkquad29_wvl_acc_iq_avg1_ss_bram_ramblk_portb_BRAM_EN,
      bram_wen => darkquad29_wvl_acc_iq_avg1_ss_bram_ramblk_portb_BRAM_WEN,
      bram_addr => darkquad29_wvl_acc_iq_avg1_ss_bram_ramblk_portb_BRAM_Addr,
      bram_din => darkquad29_wvl_acc_iq_avg1_ss_bram_ramblk_portb_BRAM_Din,
      bram_dout => darkquad29_wvl_acc_iq_avg1_ss_bram_ramblk_portb_BRAM_Dout
    );

  darkquad29_wvl_acc_iq_avg1_ss_ctrl : system_darkquad29_wvl_acc_iq_avg1_ss_ctrl_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb0_OPB_Rst,
      Sl_DBus => opb0_Sl_DBus(544 to 575),
      Sl_errAck => opb0_Sl_errAck(17),
      Sl_retry => opb0_Sl_retry(17),
      Sl_toutSup => opb0_Sl_toutSup(17),
      Sl_xferAck => opb0_Sl_xferAck(17),
      OPB_ABus => opb0_OPB_ABus,
      OPB_BE => opb0_OPB_BE,
      OPB_DBus => opb0_OPB_DBus,
      OPB_RNW => opb0_OPB_RNW,
      OPB_select => opb0_OPB_select,
      OPB_seqAddr => opb0_OPB_seqAddr,
      user_data_out => darkquad29_wvl_acc_iq_avg1_ss_ctrl_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_acc_iq_avg1_ss_status : system_darkquad29_wvl_acc_iq_avg1_ss_status_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb0_OPB_Rst,
      Sl_DBus => opb0_Sl_DBus(576 to 607),
      Sl_errAck => opb0_Sl_errAck(18),
      Sl_retry => opb0_Sl_retry(18),
      Sl_toutSup => opb0_Sl_toutSup(18),
      Sl_xferAck => opb0_Sl_xferAck(18),
      OPB_ABus => opb0_OPB_ABus,
      OPB_BE => opb0_OPB_BE,
      OPB_DBus => opb0_OPB_DBus,
      OPB_RNW => opb0_OPB_RNW,
      OPB_select => opb0_OPB_select,
      OPB_seqAddr => opb0_OPB_seqAddr,
      user_data_in => darkquad29_wvl_acc_iq_avg1_ss_status_user_data_in,
      user_clk => adc0_clk
    );

  darkquad29_wvl_acc_iq_avg2_ss_bram_ramblk : system_darkquad29_wvl_acc_iq_avg2_ss_bram_ramblk_wrapper
    port map (
      clk => adc0_clk,
      bram_we => darkquad29_wvl_acc_iq_avg2_ss_bram_we,
      bram_en_a => net_gnd0,
      bram_addr => darkquad29_wvl_acc_iq_avg2_ss_bram_addr,
      bram_rd_data => darkquad29_wvl_acc_iq_avg2_ss_bram_data_out,
      bram_wr_data => darkquad29_wvl_acc_iq_avg2_ss_bram_data_in,
      BRAM_Rst_B => darkquad29_wvl_acc_iq_avg2_ss_bram_ramblk_portb_BRAM_Rst,
      BRAM_Clk_B => darkquad29_wvl_acc_iq_avg2_ss_bram_ramblk_portb_BRAM_Clk,
      BRAM_EN_B => darkquad29_wvl_acc_iq_avg2_ss_bram_ramblk_portb_BRAM_EN,
      BRAM_WEN_B => darkquad29_wvl_acc_iq_avg2_ss_bram_ramblk_portb_BRAM_WEN,
      BRAM_Addr_B => darkquad29_wvl_acc_iq_avg2_ss_bram_ramblk_portb_BRAM_Addr,
      BRAM_Din_B => darkquad29_wvl_acc_iq_avg2_ss_bram_ramblk_portb_BRAM_Din,
      BRAM_Dout_B => darkquad29_wvl_acc_iq_avg2_ss_bram_ramblk_portb_BRAM_Dout
    );

  darkquad29_wvl_acc_iq_avg2_ss_bram : system_darkquad29_wvl_acc_iq_avg2_ss_bram_wrapper
    port map (
      opb_clk => epb_clk,
      opb_rst => opb1_OPB_Rst,
      opb_abus => opb1_OPB_ABus,
      opb_dbus => opb1_OPB_DBus,
      sln_dbus => opb1_Sl_DBus(0 to 31),
      opb_select => opb1_OPB_select,
      opb_rnw => opb1_OPB_RNW,
      opb_seqaddr => opb1_OPB_seqAddr,
      opb_be => opb1_OPB_BE,
      sln_xferack => opb1_Sl_xferAck(0),
      sln_errack => opb1_Sl_errAck(0),
      sln_toutsup => opb1_Sl_toutSup(0),
      sln_retry => opb1_Sl_retry(0),
      bram_rst => darkquad29_wvl_acc_iq_avg2_ss_bram_ramblk_portb_BRAM_Rst,
      bram_clk => darkquad29_wvl_acc_iq_avg2_ss_bram_ramblk_portb_BRAM_Clk,
      bram_en => darkquad29_wvl_acc_iq_avg2_ss_bram_ramblk_portb_BRAM_EN,
      bram_wen => darkquad29_wvl_acc_iq_avg2_ss_bram_ramblk_portb_BRAM_WEN,
      bram_addr => darkquad29_wvl_acc_iq_avg2_ss_bram_ramblk_portb_BRAM_Addr,
      bram_din => darkquad29_wvl_acc_iq_avg2_ss_bram_ramblk_portb_BRAM_Din,
      bram_dout => darkquad29_wvl_acc_iq_avg2_ss_bram_ramblk_portb_BRAM_Dout
    );

  darkquad29_wvl_acc_iq_avg2_ss_ctrl : system_darkquad29_wvl_acc_iq_avg2_ss_ctrl_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb1_OPB_Rst,
      Sl_DBus => opb1_Sl_DBus(32 to 63),
      Sl_errAck => opb1_Sl_errAck(1),
      Sl_retry => opb1_Sl_retry(1),
      Sl_toutSup => opb1_Sl_toutSup(1),
      Sl_xferAck => opb1_Sl_xferAck(1),
      OPB_ABus => opb1_OPB_ABus,
      OPB_BE => opb1_OPB_BE,
      OPB_DBus => opb1_OPB_DBus,
      OPB_RNW => opb1_OPB_RNW,
      OPB_select => opb1_OPB_select,
      OPB_seqAddr => opb1_OPB_seqAddr,
      user_data_out => darkquad29_wvl_acc_iq_avg2_ss_ctrl_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_acc_iq_avg2_ss_status : system_darkquad29_wvl_acc_iq_avg2_ss_status_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb1_OPB_Rst,
      Sl_DBus => opb1_Sl_DBus(64 to 95),
      Sl_errAck => opb1_Sl_errAck(2),
      Sl_retry => opb1_Sl_retry(2),
      Sl_toutSup => opb1_Sl_toutSup(2),
      Sl_xferAck => opb1_Sl_xferAck(2),
      OPB_ABus => opb1_OPB_ABus,
      OPB_BE => opb1_OPB_BE,
      OPB_DBus => opb1_OPB_DBus,
      OPB_RNW => opb1_OPB_RNW,
      OPB_select => opb1_OPB_select,
      OPB_seqAddr => opb1_OPB_seqAddr,
      user_data_in => darkquad29_wvl_acc_iq_avg2_ss_status_user_data_in,
      user_clk => adc0_clk
    );

  darkquad29_wvl_acc_iq_avg3_ss_bram_ramblk : system_darkquad29_wvl_acc_iq_avg3_ss_bram_ramblk_wrapper
    port map (
      clk => adc0_clk,
      bram_we => darkquad29_wvl_acc_iq_avg3_ss_bram_we,
      bram_en_a => net_gnd0,
      bram_addr => darkquad29_wvl_acc_iq_avg3_ss_bram_addr,
      bram_rd_data => darkquad29_wvl_acc_iq_avg3_ss_bram_data_out,
      bram_wr_data => darkquad29_wvl_acc_iq_avg3_ss_bram_data_in,
      BRAM_Rst_B => darkquad29_wvl_acc_iq_avg3_ss_bram_ramblk_portb_BRAM_Rst,
      BRAM_Clk_B => darkquad29_wvl_acc_iq_avg3_ss_bram_ramblk_portb_BRAM_Clk,
      BRAM_EN_B => darkquad29_wvl_acc_iq_avg3_ss_bram_ramblk_portb_BRAM_EN,
      BRAM_WEN_B => darkquad29_wvl_acc_iq_avg3_ss_bram_ramblk_portb_BRAM_WEN,
      BRAM_Addr_B => darkquad29_wvl_acc_iq_avg3_ss_bram_ramblk_portb_BRAM_Addr,
      BRAM_Din_B => darkquad29_wvl_acc_iq_avg3_ss_bram_ramblk_portb_BRAM_Din,
      BRAM_Dout_B => darkquad29_wvl_acc_iq_avg3_ss_bram_ramblk_portb_BRAM_Dout
    );

  darkquad29_wvl_acc_iq_avg3_ss_bram : system_darkquad29_wvl_acc_iq_avg3_ss_bram_wrapper
    port map (
      opb_clk => epb_clk,
      opb_rst => opb1_OPB_Rst,
      opb_abus => opb1_OPB_ABus,
      opb_dbus => opb1_OPB_DBus,
      sln_dbus => opb1_Sl_DBus(96 to 127),
      opb_select => opb1_OPB_select,
      opb_rnw => opb1_OPB_RNW,
      opb_seqaddr => opb1_OPB_seqAddr,
      opb_be => opb1_OPB_BE,
      sln_xferack => opb1_Sl_xferAck(3),
      sln_errack => opb1_Sl_errAck(3),
      sln_toutsup => opb1_Sl_toutSup(3),
      sln_retry => opb1_Sl_retry(3),
      bram_rst => darkquad29_wvl_acc_iq_avg3_ss_bram_ramblk_portb_BRAM_Rst,
      bram_clk => darkquad29_wvl_acc_iq_avg3_ss_bram_ramblk_portb_BRAM_Clk,
      bram_en => darkquad29_wvl_acc_iq_avg3_ss_bram_ramblk_portb_BRAM_EN,
      bram_wen => darkquad29_wvl_acc_iq_avg3_ss_bram_ramblk_portb_BRAM_WEN,
      bram_addr => darkquad29_wvl_acc_iq_avg3_ss_bram_ramblk_portb_BRAM_Addr,
      bram_din => darkquad29_wvl_acc_iq_avg3_ss_bram_ramblk_portb_BRAM_Din,
      bram_dout => darkquad29_wvl_acc_iq_avg3_ss_bram_ramblk_portb_BRAM_Dout
    );

  darkquad29_wvl_acc_iq_avg3_ss_ctrl : system_darkquad29_wvl_acc_iq_avg3_ss_ctrl_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb1_OPB_Rst,
      Sl_DBus => opb1_Sl_DBus(128 to 159),
      Sl_errAck => opb1_Sl_errAck(4),
      Sl_retry => opb1_Sl_retry(4),
      Sl_toutSup => opb1_Sl_toutSup(4),
      Sl_xferAck => opb1_Sl_xferAck(4),
      OPB_ABus => opb1_OPB_ABus,
      OPB_BE => opb1_OPB_BE,
      OPB_DBus => opb1_OPB_DBus,
      OPB_RNW => opb1_OPB_RNW,
      OPB_select => opb1_OPB_select,
      OPB_seqAddr => opb1_OPB_seqAddr,
      user_data_out => darkquad29_wvl_acc_iq_avg3_ss_ctrl_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_acc_iq_avg3_ss_status : system_darkquad29_wvl_acc_iq_avg3_ss_status_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb1_OPB_Rst,
      Sl_DBus => opb1_Sl_DBus(160 to 191),
      Sl_errAck => opb1_Sl_errAck(5),
      Sl_retry => opb1_Sl_retry(5),
      Sl_toutSup => opb1_Sl_toutSup(5),
      Sl_xferAck => opb1_Sl_xferAck(5),
      OPB_ABus => opb1_OPB_ABus,
      OPB_BE => opb1_OPB_BE,
      OPB_DBus => opb1_OPB_DBus,
      OPB_RNW => opb1_OPB_RNW,
      OPB_select => opb1_OPB_select,
      OPB_seqAddr => opb1_OPB_seqAddr,
      user_data_in => darkquad29_wvl_acc_iq_avg3_ss_status_user_data_in,
      user_clk => adc0_clk
    );

  darkquad29_wvl_acc_iq_start_acc : system_darkquad29_wvl_acc_iq_start_acc_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb1_OPB_Rst,
      Sl_DBus => opb1_Sl_DBus(192 to 223),
      Sl_errAck => opb1_Sl_errAck(6),
      Sl_retry => opb1_Sl_retry(6),
      Sl_toutSup => opb1_Sl_toutSup(6),
      Sl_xferAck => opb1_Sl_xferAck(6),
      OPB_ABus => opb1_OPB_ABus,
      OPB_BE => opb1_OPB_BE,
      OPB_DBus => opb1_OPB_DBus,
      OPB_RNW => opb1_OPB_RNW,
      OPB_select => opb1_OPB_select,
      OPB_seqAddr => opb1_OPB_seqAddr,
      user_data_out => darkquad29_wvl_acc_iq_start_acc_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_adc_in_adcdac_2g : system_darkquad29_wvl_adc_in_adcdac_2g_wrapper
    port map (
      data0_p => adc_data0_p,
      data0_n => adc_data0_n,
      data1_p => adc_data1_p,
      data1_n => adc_data1_n,
      data2_p => adc_data2z0_p,
      data2_n => adc_data2z0_n,
      data3_p => adc_data3_p,
      data3_n => adc_data3_n,
      info0_p => adc_info0_p,
      info0_n => adc_info0_n,
      info1_p => adc_info1_p,
      info1_n => adc_info1_n,
      info2_p => adc_info2_p,
      info2_n => adc_info2_n,
      info3_p => adc_info3_p,
      info3_n => adc_info3_n,
      valid_p => adc_valid_p,
      valid_n => adc_valid_n,
      data0_smpl_clk_p => adc_data0_smpl_clk_p,
      data0_smpl_clk_n => adc_data0_smpl_clk_n,
      data0_rdy_p => adc_data0_rdy_p,
      data0_rdy_n => adc_data0_rdy_n,
      sync_out_p => adc_sync_out_p,
      sync_out_n => adc_sync_out_n,
      sync_pps_p => adc_sync_pps_p,
      sync_pps_n => adc_sync_pps_n,
      adc_clk_out => adc0_clk,
      adc_clk90_out => open,
      adc_clk180_out => adc0_clk180,
      adc_clk270_out => adc0_clk270,
      sys_clk => sys_clk,
      adc_mmcm_locked => open,
      user_data_i0 => darkquad29_wvl_adc_in_adcdac_2g_user_data_i0,
      user_data_i1 => darkquad29_wvl_adc_in_adcdac_2g_user_data_i1,
      user_data_i2 => darkquad29_wvl_adc_in_adcdac_2g_user_data_i2,
      user_data_i3 => darkquad29_wvl_adc_in_adcdac_2g_user_data_i3,
      user_data_i4 => darkquad29_wvl_adc_in_adcdac_2g_user_data_i4,
      user_data_i5 => darkquad29_wvl_adc_in_adcdac_2g_user_data_i5,
      user_data_i6 => darkquad29_wvl_adc_in_adcdac_2g_user_data_i6,
      user_data_i7 => darkquad29_wvl_adc_in_adcdac_2g_user_data_i7,
      user_data_q0 => darkquad29_wvl_adc_in_adcdac_2g_user_data_q0,
      user_data_q1 => darkquad29_wvl_adc_in_adcdac_2g_user_data_q1,
      user_data_q2 => darkquad29_wvl_adc_in_adcdac_2g_user_data_q2,
      user_data_q3 => darkquad29_wvl_adc_in_adcdac_2g_user_data_q3,
      user_data_q4 => darkquad29_wvl_adc_in_adcdac_2g_user_data_q4,
      user_data_q5 => darkquad29_wvl_adc_in_adcdac_2g_user_data_q5,
      user_data_q6 => darkquad29_wvl_adc_in_adcdac_2g_user_data_q6,
      user_data_q7 => darkquad29_wvl_adc_in_adcdac_2g_user_data_q7,
      user_info_i0 => darkquad29_wvl_adc_in_adcdac_2g_user_info_i0,
      user_info_i1 => darkquad29_wvl_adc_in_adcdac_2g_user_info_i1,
      user_info_i2 => darkquad29_wvl_adc_in_adcdac_2g_user_info_i2,
      user_info_i3 => darkquad29_wvl_adc_in_adcdac_2g_user_info_i3,
      user_info_i4 => darkquad29_wvl_adc_in_adcdac_2g_user_info_i4,
      user_info_i5 => darkquad29_wvl_adc_in_adcdac_2g_user_info_i5,
      user_info_i6 => darkquad29_wvl_adc_in_adcdac_2g_user_info_i6,
      user_info_i7 => darkquad29_wvl_adc_in_adcdac_2g_user_info_i7,
      user_info_q0 => darkquad29_wvl_adc_in_adcdac_2g_user_info_q0,
      user_info_q1 => darkquad29_wvl_adc_in_adcdac_2g_user_info_q1,
      user_info_q2 => darkquad29_wvl_adc_in_adcdac_2g_user_info_q2,
      user_info_q3 => darkquad29_wvl_adc_in_adcdac_2g_user_info_q3,
      user_info_q4 => darkquad29_wvl_adc_in_adcdac_2g_user_info_q4,
      user_info_q5 => darkquad29_wvl_adc_in_adcdac_2g_user_info_q5,
      user_info_q6 => darkquad29_wvl_adc_in_adcdac_2g_user_info_q6,
      user_info_q7 => darkquad29_wvl_adc_in_adcdac_2g_user_info_q7,
      user_valid => darkquad29_wvl_adc_in_adcdac_2g_user_valid,
      user_rdy_i0 => darkquad29_wvl_adc_in_adcdac_2g_user_rdy_i0,
      user_dly_val => darkquad29_wvl_adc_in_adcdac_2g_user_dly_val,
      user_load_dly0 => darkquad29_wvl_adc_in_adcdac_2g_user_load_dly0,
      user_pos_mmcm_phs => darkquad29_wvl_adc_in_adcdac_2g_user_pos_mmcm_phs,
      user_inc_mmcm_phs => darkquad29_wvl_adc_in_adcdac_2g_user_inc_mmcm_phs,
      user_sync => darkquad29_wvl_adc_in_adcdac_2g_user_sync,
      user_mmcm_locked => darkquad29_wvl_adc_in_adcdac_2g_user_mmcm_locked
    );

  darkquad29_wvl_adc_in_dly_val : system_darkquad29_wvl_adc_in_dly_val_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb1_OPB_Rst,
      Sl_DBus => opb1_Sl_DBus(224 to 255),
      Sl_errAck => opb1_Sl_errAck(7),
      Sl_retry => opb1_Sl_retry(7),
      Sl_toutSup => opb1_Sl_toutSup(7),
      Sl_xferAck => opb1_Sl_xferAck(7),
      OPB_ABus => opb1_OPB_ABus,
      OPB_BE => opb1_OPB_BE,
      OPB_DBus => opb1_OPB_DBus,
      OPB_RNW => opb1_OPB_RNW,
      OPB_select => opb1_OPB_select,
      OPB_seqAddr => opb1_OPB_seqAddr,
      user_data_out => darkquad29_wvl_adc_in_dly_val_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_adc_in_i_scale : system_darkquad29_wvl_adc_in_i_scale_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb1_OPB_Rst,
      Sl_DBus => opb1_Sl_DBus(256 to 287),
      Sl_errAck => opb1_Sl_errAck(8),
      Sl_retry => opb1_Sl_retry(8),
      Sl_toutSup => opb1_Sl_toutSup(8),
      Sl_xferAck => opb1_Sl_xferAck(8),
      OPB_ABus => opb1_OPB_ABus,
      OPB_BE => opb1_OPB_BE,
      OPB_DBus => opb1_OPB_DBus,
      OPB_RNW => opb1_OPB_RNW,
      OPB_select => opb1_OPB_select,
      OPB_seqAddr => opb1_OPB_seqAddr,
      user_data_out => darkquad29_wvl_adc_in_i_scale_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_adc_in_inc_phs : system_darkquad29_wvl_adc_in_inc_phs_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb1_OPB_Rst,
      Sl_DBus => opb1_Sl_DBus(288 to 319),
      Sl_errAck => opb1_Sl_errAck(9),
      Sl_retry => opb1_Sl_retry(9),
      Sl_toutSup => opb1_Sl_toutSup(9),
      Sl_xferAck => opb1_Sl_xferAck(9),
      OPB_ABus => opb1_OPB_ABus,
      OPB_BE => opb1_OPB_BE,
      OPB_DBus => opb1_OPB_DBus,
      OPB_RNW => opb1_OPB_RNW,
      OPB_select => opb1_OPB_select,
      OPB_seqAddr => opb1_OPB_seqAddr,
      user_data_out => darkquad29_wvl_adc_in_inc_phs_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_adc_in_load_dly : system_darkquad29_wvl_adc_in_load_dly_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb1_OPB_Rst,
      Sl_DBus => opb1_Sl_DBus(320 to 351),
      Sl_errAck => opb1_Sl_errAck(10),
      Sl_retry => opb1_Sl_retry(10),
      Sl_toutSup => opb1_Sl_toutSup(10),
      Sl_xferAck => opb1_Sl_xferAck(10),
      OPB_ABus => opb1_OPB_ABus,
      OPB_BE => opb1_OPB_BE,
      OPB_DBus => opb1_OPB_DBus,
      OPB_RNW => opb1_OPB_RNW,
      OPB_select => opb1_OPB_select,
      OPB_seqAddr => opb1_OPB_seqAddr,
      user_data_out => darkquad29_wvl_adc_in_load_dly_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_adc_in_locked : system_darkquad29_wvl_adc_in_locked_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb1_OPB_Rst,
      Sl_DBus => opb1_Sl_DBus(352 to 383),
      Sl_errAck => opb1_Sl_errAck(11),
      Sl_retry => opb1_Sl_retry(11),
      Sl_toutSup => opb1_Sl_toutSup(11),
      Sl_xferAck => opb1_Sl_xferAck(11),
      OPB_ABus => opb1_OPB_ABus,
      OPB_BE => opb1_OPB_BE,
      OPB_DBus => opb1_OPB_DBus,
      OPB_RNW => opb1_OPB_RNW,
      OPB_select => opb1_OPB_select,
      OPB_seqAddr => opb1_OPB_seqAddr,
      user_data_in => darkquad29_wvl_adc_in_locked_user_data_in,
      user_clk => adc0_clk
    );

  darkquad29_wvl_adc_in_n_miss_pps : system_darkquad29_wvl_adc_in_n_miss_pps_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb1_OPB_Rst,
      Sl_DBus => opb1_Sl_DBus(384 to 415),
      Sl_errAck => opb1_Sl_errAck(12),
      Sl_retry => opb1_Sl_retry(12),
      Sl_toutSup => opb1_Sl_toutSup(12),
      Sl_xferAck => opb1_Sl_xferAck(12),
      OPB_ABus => opb1_OPB_ABus,
      OPB_BE => opb1_OPB_BE,
      OPB_DBus => opb1_OPB_DBus,
      OPB_RNW => opb1_OPB_RNW,
      OPB_select => opb1_OPB_select,
      OPB_seqAddr => opb1_OPB_seqAddr,
      user_data_in => darkquad29_wvl_adc_in_n_miss_pps_user_data_in,
      user_clk => adc0_clk
    );

  darkquad29_wvl_adc_in_pos_phs : system_darkquad29_wvl_adc_in_pos_phs_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb1_OPB_Rst,
      Sl_DBus => opb1_Sl_DBus(416 to 447),
      Sl_errAck => opb1_Sl_errAck(13),
      Sl_retry => opb1_Sl_retry(13),
      Sl_toutSup => opb1_Sl_toutSup(13),
      Sl_xferAck => opb1_Sl_xferAck(13),
      OPB_ABus => opb1_OPB_ABus,
      OPB_BE => opb1_OPB_BE,
      OPB_DBus => opb1_OPB_DBus,
      OPB_RNW => opb1_OPB_RNW,
      OPB_select => opb1_OPB_select,
      OPB_seqAddr => opb1_OPB_seqAddr,
      user_data_out => darkquad29_wvl_adc_in_pos_phs_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_adc_in_raw_pps : system_darkquad29_wvl_adc_in_raw_pps_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb1_OPB_Rst,
      Sl_DBus => opb1_Sl_DBus(448 to 479),
      Sl_errAck => opb1_Sl_errAck(14),
      Sl_retry => opb1_Sl_retry(14),
      Sl_toutSup => opb1_Sl_toutSup(14),
      Sl_xferAck => opb1_Sl_xferAck(14),
      OPB_ABus => opb1_OPB_ABus,
      OPB_BE => opb1_OPB_BE,
      OPB_DBus => opb1_OPB_DBus,
      OPB_RNW => opb1_OPB_RNW,
      OPB_select => opb1_OPB_select,
      OPB_seqAddr => opb1_OPB_seqAddr,
      user_data_in => darkquad29_wvl_adc_in_raw_pps_user_data_in,
      user_clk => adc0_clk
    );

  darkquad29_wvl_adc_in_snp_cal0_ss_bram_ramblk : system_darkquad29_wvl_adc_in_snp_cal0_ss_bram_ramblk_wrapper
    port map (
      clk => adc0_clk,
      bram_we => darkquad29_wvl_adc_in_snp_cal0_ss_bram_we,
      bram_en_a => net_gnd0,
      bram_addr => darkquad29_wvl_adc_in_snp_cal0_ss_bram_addr,
      bram_rd_data => darkquad29_wvl_adc_in_snp_cal0_ss_bram_data_out,
      bram_wr_data => darkquad29_wvl_adc_in_snp_cal0_ss_bram_data_in,
      BRAM_Rst_B => darkquad29_wvl_adc_in_snp_cal0_ss_bram_ramblk_portb_BRAM_Rst,
      BRAM_Clk_B => darkquad29_wvl_adc_in_snp_cal0_ss_bram_ramblk_portb_BRAM_Clk,
      BRAM_EN_B => darkquad29_wvl_adc_in_snp_cal0_ss_bram_ramblk_portb_BRAM_EN,
      BRAM_WEN_B => darkquad29_wvl_adc_in_snp_cal0_ss_bram_ramblk_portb_BRAM_WEN,
      BRAM_Addr_B => darkquad29_wvl_adc_in_snp_cal0_ss_bram_ramblk_portb_BRAM_Addr,
      BRAM_Din_B => darkquad29_wvl_adc_in_snp_cal0_ss_bram_ramblk_portb_BRAM_Din,
      BRAM_Dout_B => darkquad29_wvl_adc_in_snp_cal0_ss_bram_ramblk_portb_BRAM_Dout
    );

  darkquad29_wvl_adc_in_snp_cal0_ss_bram : system_darkquad29_wvl_adc_in_snp_cal0_ss_bram_wrapper
    port map (
      opb_clk => epb_clk,
      opb_rst => opb1_OPB_Rst,
      opb_abus => opb1_OPB_ABus,
      opb_dbus => opb1_OPB_DBus,
      sln_dbus => opb1_Sl_DBus(480 to 511),
      opb_select => opb1_OPB_select,
      opb_rnw => opb1_OPB_RNW,
      opb_seqaddr => opb1_OPB_seqAddr,
      opb_be => opb1_OPB_BE,
      sln_xferack => opb1_Sl_xferAck(15),
      sln_errack => opb1_Sl_errAck(15),
      sln_toutsup => opb1_Sl_toutSup(15),
      sln_retry => opb1_Sl_retry(15),
      bram_rst => darkquad29_wvl_adc_in_snp_cal0_ss_bram_ramblk_portb_BRAM_Rst,
      bram_clk => darkquad29_wvl_adc_in_snp_cal0_ss_bram_ramblk_portb_BRAM_Clk,
      bram_en => darkquad29_wvl_adc_in_snp_cal0_ss_bram_ramblk_portb_BRAM_EN,
      bram_wen => darkquad29_wvl_adc_in_snp_cal0_ss_bram_ramblk_portb_BRAM_WEN,
      bram_addr => darkquad29_wvl_adc_in_snp_cal0_ss_bram_ramblk_portb_BRAM_Addr,
      bram_din => darkquad29_wvl_adc_in_snp_cal0_ss_bram_ramblk_portb_BRAM_Din,
      bram_dout => darkquad29_wvl_adc_in_snp_cal0_ss_bram_ramblk_portb_BRAM_Dout
    );

  darkquad29_wvl_adc_in_snp_cal0_ss_ctrl : system_darkquad29_wvl_adc_in_snp_cal0_ss_ctrl_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb1_OPB_Rst,
      Sl_DBus => opb1_Sl_DBus(512 to 543),
      Sl_errAck => opb1_Sl_errAck(16),
      Sl_retry => opb1_Sl_retry(16),
      Sl_toutSup => opb1_Sl_toutSup(16),
      Sl_xferAck => opb1_Sl_xferAck(16),
      OPB_ABus => opb1_OPB_ABus,
      OPB_BE => opb1_OPB_BE,
      OPB_DBus => opb1_OPB_DBus,
      OPB_RNW => opb1_OPB_RNW,
      OPB_select => opb1_OPB_select,
      OPB_seqAddr => opb1_OPB_seqAddr,
      user_data_out => darkquad29_wvl_adc_in_snp_cal0_ss_ctrl_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_adc_in_snp_cal0_ss_status : system_darkquad29_wvl_adc_in_snp_cal0_ss_status_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb1_OPB_Rst,
      Sl_DBus => opb1_Sl_DBus(544 to 575),
      Sl_errAck => opb1_Sl_errAck(17),
      Sl_retry => opb1_Sl_retry(17),
      Sl_toutSup => opb1_Sl_toutSup(17),
      Sl_xferAck => opb1_Sl_xferAck(17),
      OPB_ABus => opb1_OPB_ABus,
      OPB_BE => opb1_OPB_BE,
      OPB_DBus => opb1_OPB_DBus,
      OPB_RNW => opb1_OPB_RNW,
      OPB_select => opb1_OPB_select,
      OPB_seqAddr => opb1_OPB_seqAddr,
      user_data_in => darkquad29_wvl_adc_in_snp_cal0_ss_status_user_data_in,
      user_clk => adc0_clk
    );

  darkquad29_wvl_adc_in_snp_cal1_ss_bram_ramblk : system_darkquad29_wvl_adc_in_snp_cal1_ss_bram_ramblk_wrapper
    port map (
      clk => adc0_clk,
      bram_we => darkquad29_wvl_adc_in_snp_cal1_ss_bram_we,
      bram_en_a => net_gnd0,
      bram_addr => darkquad29_wvl_adc_in_snp_cal1_ss_bram_addr,
      bram_rd_data => darkquad29_wvl_adc_in_snp_cal1_ss_bram_data_out,
      bram_wr_data => darkquad29_wvl_adc_in_snp_cal1_ss_bram_data_in,
      BRAM_Rst_B => darkquad29_wvl_adc_in_snp_cal1_ss_bram_ramblk_portb_BRAM_Rst,
      BRAM_Clk_B => darkquad29_wvl_adc_in_snp_cal1_ss_bram_ramblk_portb_BRAM_Clk,
      BRAM_EN_B => darkquad29_wvl_adc_in_snp_cal1_ss_bram_ramblk_portb_BRAM_EN,
      BRAM_WEN_B => darkquad29_wvl_adc_in_snp_cal1_ss_bram_ramblk_portb_BRAM_WEN,
      BRAM_Addr_B => darkquad29_wvl_adc_in_snp_cal1_ss_bram_ramblk_portb_BRAM_Addr,
      BRAM_Din_B => darkquad29_wvl_adc_in_snp_cal1_ss_bram_ramblk_portb_BRAM_Din,
      BRAM_Dout_B => darkquad29_wvl_adc_in_snp_cal1_ss_bram_ramblk_portb_BRAM_Dout
    );

  darkquad29_wvl_adc_in_snp_cal1_ss_bram : system_darkquad29_wvl_adc_in_snp_cal1_ss_bram_wrapper
    port map (
      opb_clk => epb_clk,
      opb_rst => opb1_OPB_Rst,
      opb_abus => opb1_OPB_ABus,
      opb_dbus => opb1_OPB_DBus,
      sln_dbus => opb1_Sl_DBus(576 to 607),
      opb_select => opb1_OPB_select,
      opb_rnw => opb1_OPB_RNW,
      opb_seqaddr => opb1_OPB_seqAddr,
      opb_be => opb1_OPB_BE,
      sln_xferack => opb1_Sl_xferAck(18),
      sln_errack => opb1_Sl_errAck(18),
      sln_toutsup => opb1_Sl_toutSup(18),
      sln_retry => opb1_Sl_retry(18),
      bram_rst => darkquad29_wvl_adc_in_snp_cal1_ss_bram_ramblk_portb_BRAM_Rst,
      bram_clk => darkquad29_wvl_adc_in_snp_cal1_ss_bram_ramblk_portb_BRAM_Clk,
      bram_en => darkquad29_wvl_adc_in_snp_cal1_ss_bram_ramblk_portb_BRAM_EN,
      bram_wen => darkquad29_wvl_adc_in_snp_cal1_ss_bram_ramblk_portb_BRAM_WEN,
      bram_addr => darkquad29_wvl_adc_in_snp_cal1_ss_bram_ramblk_portb_BRAM_Addr,
      bram_din => darkquad29_wvl_adc_in_snp_cal1_ss_bram_ramblk_portb_BRAM_Din,
      bram_dout => darkquad29_wvl_adc_in_snp_cal1_ss_bram_ramblk_portb_BRAM_Dout
    );

  darkquad29_wvl_adc_in_snp_cal1_ss_ctrl : system_darkquad29_wvl_adc_in_snp_cal1_ss_ctrl_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb1_OPB_Rst,
      Sl_DBus => opb1_Sl_DBus(608 to 639),
      Sl_errAck => opb1_Sl_errAck(19),
      Sl_retry => opb1_Sl_retry(19),
      Sl_toutSup => opb1_Sl_toutSup(19),
      Sl_xferAck => opb1_Sl_xferAck(19),
      OPB_ABus => opb1_OPB_ABus,
      OPB_BE => opb1_OPB_BE,
      OPB_DBus => opb1_OPB_DBus,
      OPB_RNW => opb1_OPB_RNW,
      OPB_select => opb1_OPB_select,
      OPB_seqAddr => opb1_OPB_seqAddr,
      user_data_out => darkquad29_wvl_adc_in_snp_cal1_ss_ctrl_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_adc_in_snp_cal1_ss_status : system_darkquad29_wvl_adc_in_snp_cal1_ss_status_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb1_OPB_Rst,
      Sl_DBus => opb1_Sl_DBus(640 to 671),
      Sl_errAck => opb1_Sl_errAck(20),
      Sl_retry => opb1_Sl_retry(20),
      Sl_toutSup => opb1_Sl_toutSup(20),
      Sl_xferAck => opb1_Sl_xferAck(20),
      OPB_ABus => opb1_OPB_ABus,
      OPB_BE => opb1_OPB_BE,
      OPB_DBus => opb1_OPB_DBus,
      OPB_RNW => opb1_OPB_RNW,
      OPB_select => opb1_OPB_select,
      OPB_seqAddr => opb1_OPB_seqAddr,
      user_data_in => darkquad29_wvl_adc_in_snp_cal1_ss_status_user_data_in,
      user_clk => adc0_clk
    );

  darkquad29_wvl_adc_in_snp_cal2_ss_bram_ramblk : system_darkquad29_wvl_adc_in_snp_cal2_ss_bram_ramblk_wrapper
    port map (
      clk => adc0_clk,
      bram_we => darkquad29_wvl_adc_in_snp_cal2_ss_bram_we,
      bram_en_a => net_gnd0,
      bram_addr => darkquad29_wvl_adc_in_snp_cal2_ss_bram_addr,
      bram_rd_data => darkquad29_wvl_adc_in_snp_cal2_ss_bram_data_out,
      bram_wr_data => darkquad29_wvl_adc_in_snp_cal2_ss_bram_data_in,
      BRAM_Rst_B => darkquad29_wvl_adc_in_snp_cal2_ss_bram_ramblk_portb_BRAM_Rst,
      BRAM_Clk_B => darkquad29_wvl_adc_in_snp_cal2_ss_bram_ramblk_portb_BRAM_Clk,
      BRAM_EN_B => darkquad29_wvl_adc_in_snp_cal2_ss_bram_ramblk_portb_BRAM_EN,
      BRAM_WEN_B => darkquad29_wvl_adc_in_snp_cal2_ss_bram_ramblk_portb_BRAM_WEN,
      BRAM_Addr_B => darkquad29_wvl_adc_in_snp_cal2_ss_bram_ramblk_portb_BRAM_Addr,
      BRAM_Din_B => darkquad29_wvl_adc_in_snp_cal2_ss_bram_ramblk_portb_BRAM_Din,
      BRAM_Dout_B => darkquad29_wvl_adc_in_snp_cal2_ss_bram_ramblk_portb_BRAM_Dout
    );

  darkquad29_wvl_adc_in_snp_cal2_ss_bram : system_darkquad29_wvl_adc_in_snp_cal2_ss_bram_wrapper
    port map (
      opb_clk => epb_clk,
      opb_rst => opb1_OPB_Rst,
      opb_abus => opb1_OPB_ABus,
      opb_dbus => opb1_OPB_DBus,
      sln_dbus => opb1_Sl_DBus(672 to 703),
      opb_select => opb1_OPB_select,
      opb_rnw => opb1_OPB_RNW,
      opb_seqaddr => opb1_OPB_seqAddr,
      opb_be => opb1_OPB_BE,
      sln_xferack => opb1_Sl_xferAck(21),
      sln_errack => opb1_Sl_errAck(21),
      sln_toutsup => opb1_Sl_toutSup(21),
      sln_retry => opb1_Sl_retry(21),
      bram_rst => darkquad29_wvl_adc_in_snp_cal2_ss_bram_ramblk_portb_BRAM_Rst,
      bram_clk => darkquad29_wvl_adc_in_snp_cal2_ss_bram_ramblk_portb_BRAM_Clk,
      bram_en => darkquad29_wvl_adc_in_snp_cal2_ss_bram_ramblk_portb_BRAM_EN,
      bram_wen => darkquad29_wvl_adc_in_snp_cal2_ss_bram_ramblk_portb_BRAM_WEN,
      bram_addr => darkquad29_wvl_adc_in_snp_cal2_ss_bram_ramblk_portb_BRAM_Addr,
      bram_din => darkquad29_wvl_adc_in_snp_cal2_ss_bram_ramblk_portb_BRAM_Din,
      bram_dout => darkquad29_wvl_adc_in_snp_cal2_ss_bram_ramblk_portb_BRAM_Dout
    );

  darkquad29_wvl_adc_in_snp_cal2_ss_ctrl : system_darkquad29_wvl_adc_in_snp_cal2_ss_ctrl_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb1_OPB_Rst,
      Sl_DBus => opb1_Sl_DBus(704 to 735),
      Sl_errAck => opb1_Sl_errAck(22),
      Sl_retry => opb1_Sl_retry(22),
      Sl_toutSup => opb1_Sl_toutSup(22),
      Sl_xferAck => opb1_Sl_xferAck(22),
      OPB_ABus => opb1_OPB_ABus,
      OPB_BE => opb1_OPB_BE,
      OPB_DBus => opb1_OPB_DBus,
      OPB_RNW => opb1_OPB_RNW,
      OPB_select => opb1_OPB_select,
      OPB_seqAddr => opb1_OPB_seqAddr,
      user_data_out => darkquad29_wvl_adc_in_snp_cal2_ss_ctrl_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_adc_in_snp_cal2_ss_status : system_darkquad29_wvl_adc_in_snp_cal2_ss_status_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb1_OPB_Rst,
      Sl_DBus => opb1_Sl_DBus(736 to 767),
      Sl_errAck => opb1_Sl_errAck(23),
      Sl_retry => opb1_Sl_retry(23),
      Sl_toutSup => opb1_Sl_toutSup(23),
      Sl_xferAck => opb1_Sl_xferAck(23),
      OPB_ABus => opb1_OPB_ABus,
      OPB_BE => opb1_OPB_BE,
      OPB_DBus => opb1_OPB_DBus,
      OPB_RNW => opb1_OPB_RNW,
      OPB_select => opb1_OPB_select,
      OPB_seqAddr => opb1_OPB_seqAddr,
      user_data_in => darkquad29_wvl_adc_in_snp_cal2_ss_status_user_data_in,
      user_clk => adc0_clk
    );

  darkquad29_wvl_adc_in_snp_cal3_ss_bram_ramblk : system_darkquad29_wvl_adc_in_snp_cal3_ss_bram_ramblk_wrapper
    port map (
      clk => adc0_clk,
      bram_we => darkquad29_wvl_adc_in_snp_cal3_ss_bram_we,
      bram_en_a => net_gnd0,
      bram_addr => darkquad29_wvl_adc_in_snp_cal3_ss_bram_addr,
      bram_rd_data => darkquad29_wvl_adc_in_snp_cal3_ss_bram_data_out,
      bram_wr_data => darkquad29_wvl_adc_in_snp_cal3_ss_bram_data_in,
      BRAM_Rst_B => darkquad29_wvl_adc_in_snp_cal3_ss_bram_ramblk_portb_BRAM_Rst,
      BRAM_Clk_B => darkquad29_wvl_adc_in_snp_cal3_ss_bram_ramblk_portb_BRAM_Clk,
      BRAM_EN_B => darkquad29_wvl_adc_in_snp_cal3_ss_bram_ramblk_portb_BRAM_EN,
      BRAM_WEN_B => darkquad29_wvl_adc_in_snp_cal3_ss_bram_ramblk_portb_BRAM_WEN,
      BRAM_Addr_B => darkquad29_wvl_adc_in_snp_cal3_ss_bram_ramblk_portb_BRAM_Addr,
      BRAM_Din_B => darkquad29_wvl_adc_in_snp_cal3_ss_bram_ramblk_portb_BRAM_Din,
      BRAM_Dout_B => darkquad29_wvl_adc_in_snp_cal3_ss_bram_ramblk_portb_BRAM_Dout
    );

  darkquad29_wvl_adc_in_snp_cal3_ss_bram : system_darkquad29_wvl_adc_in_snp_cal3_ss_bram_wrapper
    port map (
      opb_clk => epb_clk,
      opb_rst => opb1_OPB_Rst,
      opb_abus => opb1_OPB_ABus,
      opb_dbus => opb1_OPB_DBus,
      sln_dbus => opb1_Sl_DBus(768 to 799),
      opb_select => opb1_OPB_select,
      opb_rnw => opb1_OPB_RNW,
      opb_seqaddr => opb1_OPB_seqAddr,
      opb_be => opb1_OPB_BE,
      sln_xferack => opb1_Sl_xferAck(24),
      sln_errack => opb1_Sl_errAck(24),
      sln_toutsup => opb1_Sl_toutSup(24),
      sln_retry => opb1_Sl_retry(24),
      bram_rst => darkquad29_wvl_adc_in_snp_cal3_ss_bram_ramblk_portb_BRAM_Rst,
      bram_clk => darkquad29_wvl_adc_in_snp_cal3_ss_bram_ramblk_portb_BRAM_Clk,
      bram_en => darkquad29_wvl_adc_in_snp_cal3_ss_bram_ramblk_portb_BRAM_EN,
      bram_wen => darkquad29_wvl_adc_in_snp_cal3_ss_bram_ramblk_portb_BRAM_WEN,
      bram_addr => darkquad29_wvl_adc_in_snp_cal3_ss_bram_ramblk_portb_BRAM_Addr,
      bram_din => darkquad29_wvl_adc_in_snp_cal3_ss_bram_ramblk_portb_BRAM_Din,
      bram_dout => darkquad29_wvl_adc_in_snp_cal3_ss_bram_ramblk_portb_BRAM_Dout
    );

  darkquad29_wvl_adc_in_snp_cal3_ss_ctrl : system_darkquad29_wvl_adc_in_snp_cal3_ss_ctrl_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb1_OPB_Rst,
      Sl_DBus => opb1_Sl_DBus(800 to 831),
      Sl_errAck => opb1_Sl_errAck(25),
      Sl_retry => opb1_Sl_retry(25),
      Sl_toutSup => opb1_Sl_toutSup(25),
      Sl_xferAck => opb1_Sl_xferAck(25),
      OPB_ABus => opb1_OPB_ABus,
      OPB_BE => opb1_OPB_BE,
      OPB_DBus => opb1_OPB_DBus,
      OPB_RNW => opb1_OPB_RNW,
      OPB_select => opb1_OPB_select,
      OPB_seqAddr => opb1_OPB_seqAddr,
      user_data_out => darkquad29_wvl_adc_in_snp_cal3_ss_ctrl_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_adc_in_snp_cal3_ss_status : system_darkquad29_wvl_adc_in_snp_cal3_ss_status_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb1_OPB_Rst,
      Sl_DBus => opb1_Sl_DBus(832 to 863),
      Sl_errAck => opb1_Sl_errAck(26),
      Sl_retry => opb1_Sl_retry(26),
      Sl_toutSup => opb1_Sl_toutSup(26),
      Sl_xferAck => opb1_Sl_xferAck(26),
      OPB_ABus => opb1_OPB_ABus,
      OPB_BE => opb1_OPB_BE,
      OPB_DBus => opb1_OPB_DBus,
      OPB_RNW => opb1_OPB_RNW,
      OPB_select => opb1_OPB_select,
      OPB_seqAddr => opb1_OPB_seqAddr,
      user_data_in => darkquad29_wvl_adc_in_snp_cal3_ss_status_user_data_in,
      user_clk => adc0_clk
    );

  darkquad29_wvl_adc_in_trig : system_darkquad29_wvl_adc_in_trig_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb1_OPB_Rst,
      Sl_DBus => opb1_Sl_DBus(864 to 895),
      Sl_errAck => opb1_Sl_errAck(27),
      Sl_retry => opb1_Sl_retry(27),
      Sl_toutSup => opb1_Sl_toutSup(27),
      Sl_xferAck => opb1_Sl_xferAck(27),
      OPB_ABus => opb1_OPB_ABus,
      OPB_BE => opb1_OPB_BE,
      OPB_DBus => opb1_OPB_DBus,
      OPB_RNW => opb1_OPB_RNW,
      OPB_select => opb1_OPB_select,
      OPB_seqAddr => opb1_OPB_seqAddr,
      user_data_out => darkquad29_wvl_adc_in_trig_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_adc_in_ts0 : system_darkquad29_wvl_adc_in_ts0_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb1_OPB_Rst,
      Sl_DBus => opb1_Sl_DBus(896 to 927),
      Sl_errAck => opb1_Sl_errAck(28),
      Sl_retry => opb1_Sl_retry(28),
      Sl_toutSup => opb1_Sl_toutSup(28),
      Sl_xferAck => opb1_Sl_xferAck(28),
      OPB_ABus => opb1_OPB_ABus,
      OPB_BE => opb1_OPB_BE,
      OPB_DBus => opb1_OPB_DBus,
      OPB_RNW => opb1_OPB_RNW,
      OPB_select => opb1_OPB_select,
      OPB_seqAddr => opb1_OPB_seqAddr,
      user_data_in => darkquad29_wvl_adc_in_ts0_user_data_in,
      user_clk => adc0_clk
    );

  darkquad29_wvl_adc_in_ts1 : system_darkquad29_wvl_adc_in_ts1_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb1_OPB_Rst,
      Sl_DBus => opb1_Sl_DBus(928 to 959),
      Sl_errAck => opb1_Sl_errAck(29),
      Sl_retry => opb1_Sl_retry(29),
      Sl_toutSup => opb1_Sl_toutSup(29),
      Sl_xferAck => opb1_Sl_xferAck(29),
      OPB_ABus => opb1_OPB_ABus,
      OPB_BE => opb1_OPB_BE,
      OPB_DBus => opb1_OPB_DBus,
      OPB_RNW => opb1_OPB_RNW,
      OPB_select => opb1_OPB_select,
      OPB_seqAddr => opb1_OPB_seqAddr,
      user_data_in => darkquad29_wvl_adc_in_ts1_user_data_in,
      user_clk => adc0_clk
    );

  darkquad29_wvl_adc_in_ts2 : system_darkquad29_wvl_adc_in_ts2_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb1_OPB_Rst,
      Sl_DBus => opb1_Sl_DBus(960 to 991),
      Sl_errAck => opb1_Sl_errAck(30),
      Sl_retry => opb1_Sl_retry(30),
      Sl_toutSup => opb1_Sl_toutSup(30),
      Sl_xferAck => opb1_Sl_xferAck(30),
      OPB_ABus => opb1_OPB_ABus,
      OPB_BE => opb1_OPB_BE,
      OPB_DBus => opb1_OPB_DBus,
      OPB_RNW => opb1_OPB_RNW,
      OPB_select => opb1_OPB_select,
      OPB_seqAddr => opb1_OPB_seqAddr,
      user_data_in => darkquad29_wvl_adc_in_ts2_user_data_in,
      user_clk => adc0_clk
    );

  darkquad29_wvl_adc_in_ts3 : system_darkquad29_wvl_adc_in_ts3_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb1_OPB_Rst,
      Sl_DBus => opb1_Sl_DBus(992 to 1023),
      Sl_errAck => opb1_Sl_errAck(31),
      Sl_retry => opb1_Sl_retry(31),
      Sl_toutSup => opb1_Sl_toutSup(31),
      Sl_xferAck => opb1_Sl_xferAck(31),
      OPB_ABus => opb1_OPB_ABus,
      OPB_BE => opb1_OPB_BE,
      OPB_DBus => opb1_OPB_DBus,
      OPB_RNW => opb1_OPB_RNW,
      OPB_select => opb1_OPB_select,
      OPB_seqAddr => opb1_OPB_seqAddr,
      user_data_in => darkquad29_wvl_adc_in_ts3_user_data_in,
      user_clk => adc0_clk
    );

  darkquad29_wvl_adc_in_valid : system_darkquad29_wvl_adc_in_valid_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb2_OPB_Rst,
      Sl_DBus => opb2_Sl_DBus(0 to 31),
      Sl_errAck => opb2_Sl_errAck(0),
      Sl_retry => opb2_Sl_retry(0),
      Sl_toutSup => opb2_Sl_toutSup(0),
      Sl_xferAck => opb2_Sl_xferAck(0),
      OPB_ABus => opb2_OPB_ABus,
      OPB_BE => opb2_OPB_BE,
      OPB_DBus => opb2_OPB_DBus,
      OPB_RNW => opb2_OPB_RNW,
      OPB_select => opb2_OPB_select,
      OPB_seqAddr => opb2_OPB_seqAddr,
      user_data_in => darkquad29_wvl_adc_in_valid_user_data_in,
      user_clk => adc0_clk
    );

  darkquad29_wvl_board_num : system_darkquad29_wvl_board_num_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb2_OPB_Rst,
      Sl_DBus => opb2_Sl_DBus(32 to 63),
      Sl_errAck => opb2_Sl_errAck(1),
      Sl_retry => opb2_Sl_retry(1),
      Sl_toutSup => opb2_Sl_toutSup(1),
      Sl_xferAck => opb2_Sl_xferAck(1),
      OPB_ABus => opb2_OPB_ABus,
      OPB_BE => opb2_OPB_BE,
      OPB_DBus => opb2_OPB_DBus,
      OPB_RNW => opb2_OPB_RNW,
      OPB_select => opb2_OPB_select,
      OPB_seqAddr => opb2_OPB_seqAddr,
      user_data_out => darkquad29_wvl_board_num_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_capture0_base_kf : system_darkquad29_wvl_capture0_base_kf_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb2_OPB_Rst,
      Sl_DBus => opb2_Sl_DBus(64 to 95),
      Sl_errAck => opb2_Sl_errAck(2),
      Sl_retry => opb2_Sl_retry(2),
      Sl_toutSup => opb2_Sl_toutSup(2),
      Sl_xferAck => opb2_Sl_xferAck(2),
      OPB_ABus => opb2_OPB_ABus,
      OPB_BE => opb2_OPB_BE,
      OPB_DBus => opb2_OPB_DBus,
      OPB_RNW => opb2_OPB_RNW,
      OPB_select => opb2_OPB_select,
      OPB_seqAddr => opb2_OPB_seqAddr,
      user_data_out => darkquad29_wvl_capture0_base_kf_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_capture0_base_kq : system_darkquad29_wvl_capture0_base_kq_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb2_OPB_Rst,
      Sl_DBus => opb2_Sl_DBus(96 to 127),
      Sl_errAck => opb2_Sl_errAck(3),
      Sl_retry => opb2_Sl_retry(3),
      Sl_toutSup => opb2_Sl_toutSup(3),
      Sl_xferAck => opb2_Sl_xferAck(3),
      OPB_ABus => opb2_OPB_ABus,
      OPB_BE => opb2_OPB_BE,
      OPB_DBus => opb2_OPB_DBus,
      OPB_RNW => opb2_OPB_RNW,
      OPB_select => opb2_OPB_select,
      OPB_seqAddr => opb2_OPB_seqAddr,
      user_data_out => darkquad29_wvl_capture0_base_kq_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_capture0_cps_lim : system_darkquad29_wvl_capture0_cps_lim_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb2_OPB_Rst,
      Sl_DBus => opb2_Sl_DBus(128 to 159),
      Sl_errAck => opb2_Sl_errAck(4),
      Sl_retry => opb2_Sl_retry(4),
      Sl_toutSup => opb2_Sl_toutSup(4),
      Sl_xferAck => opb2_Sl_xferAck(4),
      OPB_ABus => opb2_OPB_ABus,
      OPB_BE => opb2_OPB_BE,
      OPB_DBus => opb2_OPB_DBus,
      OPB_RNW => opb2_OPB_RNW,
      OPB_select => opb2_OPB_select,
      OPB_seqAddr => opb2_OPB_seqAddr,
      user_data_out => darkquad29_wvl_capture0_cps_lim_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_ramblk : system_darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_ramblk_wrapper
    port map (
      clk => adc0_clk,
      bram_we => darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_we,
      bram_en_a => net_gnd0,
      bram_addr => darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_addr,
      bram_rd_data => darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_data_out,
      bram_wr_data => darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_data_in,
      BRAM_Rst_B => darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Rst,
      BRAM_Clk_B => darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Clk,
      BRAM_EN_B => darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_EN,
      BRAM_WEN_B => darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_WEN,
      BRAM_Addr_B => darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Addr,
      BRAM_Din_B => darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Din,
      BRAM_Dout_B => darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Dout
    );

  darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs : system_darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_wrapper
    port map (
      opb_clk => epb_clk,
      opb_rst => opb2_OPB_Rst,
      opb_abus => opb2_OPB_ABus,
      opb_dbus => opb2_OPB_DBus,
      sln_dbus => opb2_Sl_DBus(160 to 191),
      opb_select => opb2_OPB_select,
      opb_rnw => opb2_OPB_RNW,
      opb_seqaddr => opb2_OPB_seqAddr,
      opb_be => opb2_OPB_BE,
      sln_xferack => opb2_Sl_xferAck(5),
      sln_errack => opb2_Sl_errAck(5),
      sln_toutsup => opb2_Sl_toutSup(5),
      sln_retry => opb2_Sl_retry(5),
      bram_rst => darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Rst,
      bram_clk => darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Clk,
      bram_en => darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_EN,
      bram_wen => darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_WEN,
      bram_addr => darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Addr,
      bram_din => darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Din,
      bram_dout => darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Dout
    );

  darkquad29_wvl_capture0_load_thresh : system_darkquad29_wvl_capture0_load_thresh_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb2_OPB_Rst,
      Sl_DBus => opb2_Sl_DBus(192 to 223),
      Sl_errAck => opb2_Sl_errAck(6),
      Sl_retry => opb2_Sl_retry(6),
      Sl_toutSup => opb2_Sl_toutSup(6),
      Sl_xferAck => opb2_Sl_xferAck(6),
      OPB_ABus => opb2_OPB_ABus,
      OPB_BE => opb2_OPB_BE,
      OPB_DBus => opb2_OPB_DBus,
      OPB_RNW => opb2_OPB_RNW,
      OPB_select => opb2_OPB_select,
      OPB_seqAddr => opb2_OPB_seqAddr,
      user_data_out => darkquad29_wvl_capture0_load_thresh_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_capture0_pix_ramblk : system_darkquad29_wvl_capture0_pix_ramblk_wrapper
    port map (
      clk => adc0_clk,
      bram_we => darkquad29_wvl_capture0_pix_we,
      bram_en_a => net_gnd0,
      bram_addr => darkquad29_wvl_capture0_pix_addr,
      bram_rd_data => darkquad29_wvl_capture0_pix_data_out,
      bram_wr_data => darkquad29_wvl_capture0_pix_data_in,
      BRAM_Rst_B => darkquad29_wvl_capture0_pix_ramblk_portb_BRAM_Rst,
      BRAM_Clk_B => darkquad29_wvl_capture0_pix_ramblk_portb_BRAM_Clk,
      BRAM_EN_B => darkquad29_wvl_capture0_pix_ramblk_portb_BRAM_EN,
      BRAM_WEN_B => darkquad29_wvl_capture0_pix_ramblk_portb_BRAM_WEN,
      BRAM_Addr_B => darkquad29_wvl_capture0_pix_ramblk_portb_BRAM_Addr,
      BRAM_Din_B => darkquad29_wvl_capture0_pix_ramblk_portb_BRAM_Din,
      BRAM_Dout_B => darkquad29_wvl_capture0_pix_ramblk_portb_BRAM_Dout
    );

  darkquad29_wvl_capture0_pix : system_darkquad29_wvl_capture0_pix_wrapper
    port map (
      opb_clk => epb_clk,
      opb_rst => opb2_OPB_Rst,
      opb_abus => opb2_OPB_ABus,
      opb_dbus => opb2_OPB_DBus,
      sln_dbus => opb2_Sl_DBus(224 to 255),
      opb_select => opb2_OPB_select,
      opb_rnw => opb2_OPB_RNW,
      opb_seqaddr => opb2_OPB_seqAddr,
      opb_be => opb2_OPB_BE,
      sln_xferack => opb2_Sl_xferAck(7),
      sln_errack => opb2_Sl_errAck(7),
      sln_toutsup => opb2_Sl_toutSup(7),
      sln_retry => opb2_Sl_retry(7),
      bram_rst => darkquad29_wvl_capture0_pix_ramblk_portb_BRAM_Rst,
      bram_clk => darkquad29_wvl_capture0_pix_ramblk_portb_BRAM_Clk,
      bram_en => darkquad29_wvl_capture0_pix_ramblk_portb_BRAM_EN,
      bram_wen => darkquad29_wvl_capture0_pix_ramblk_portb_BRAM_WEN,
      bram_addr => darkquad29_wvl_capture0_pix_ramblk_portb_BRAM_Addr,
      bram_din => darkquad29_wvl_capture0_pix_ramblk_portb_BRAM_Din,
      bram_dout => darkquad29_wvl_capture0_pix_ramblk_portb_BRAM_Dout
    );

  darkquad29_wvl_capture0_threshold : system_darkquad29_wvl_capture0_threshold_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb2_OPB_Rst,
      Sl_DBus => opb2_Sl_DBus(256 to 287),
      Sl_errAck => opb2_Sl_errAck(8),
      Sl_retry => opb2_Sl_retry(8),
      Sl_toutSup => opb2_Sl_toutSup(8),
      Sl_xferAck => opb2_Sl_xferAck(8),
      OPB_ABus => opb2_OPB_ABus,
      OPB_BE => opb2_OPB_BE,
      OPB_DBus => opb2_OPB_DBus,
      OPB_RNW => opb2_OPB_RNW,
      OPB_select => opb2_OPB_select,
      OPB_seqAddr => opb2_OPB_seqAddr,
      user_data_out => darkquad29_wvl_capture0_threshold_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_capture0_use_energy_cal : system_darkquad29_wvl_capture0_use_energy_cal_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb2_OPB_Rst,
      Sl_DBus => opb2_Sl_DBus(288 to 319),
      Sl_errAck => opb2_Sl_errAck(9),
      Sl_retry => opb2_Sl_retry(9),
      Sl_toutSup => opb2_Sl_toutSup(9),
      Sl_xferAck => opb2_Sl_xferAck(9),
      OPB_ABus => opb2_OPB_ABus,
      OPB_BE => opb2_OPB_BE,
      OPB_DBus => opb2_OPB_DBus,
      OPB_RNW => opb2_OPB_RNW,
      OPB_select => opb2_OPB_select,
      OPB_seqAddr => opb2_OPB_seqAddr,
      user_data_out => darkquad29_wvl_capture0_use_energy_cal_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_capture1_base_kf : system_darkquad29_wvl_capture1_base_kf_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb2_OPB_Rst,
      Sl_DBus => opb2_Sl_DBus(320 to 351),
      Sl_errAck => opb2_Sl_errAck(10),
      Sl_retry => opb2_Sl_retry(10),
      Sl_toutSup => opb2_Sl_toutSup(10),
      Sl_xferAck => opb2_Sl_xferAck(10),
      OPB_ABus => opb2_OPB_ABus,
      OPB_BE => opb2_OPB_BE,
      OPB_DBus => opb2_OPB_DBus,
      OPB_RNW => opb2_OPB_RNW,
      OPB_select => opb2_OPB_select,
      OPB_seqAddr => opb2_OPB_seqAddr,
      user_data_out => darkquad29_wvl_capture1_base_kf_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_capture1_base_kq : system_darkquad29_wvl_capture1_base_kq_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb2_OPB_Rst,
      Sl_DBus => opb2_Sl_DBus(352 to 383),
      Sl_errAck => opb2_Sl_errAck(11),
      Sl_retry => opb2_Sl_retry(11),
      Sl_toutSup => opb2_Sl_toutSup(11),
      Sl_xferAck => opb2_Sl_xferAck(11),
      OPB_ABus => opb2_OPB_ABus,
      OPB_BE => opb2_OPB_BE,
      OPB_DBus => opb2_OPB_DBus,
      OPB_RNW => opb2_OPB_RNW,
      OPB_select => opb2_OPB_select,
      OPB_seqAddr => opb2_OPB_seqAddr,
      user_data_out => darkquad29_wvl_capture1_base_kq_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_capture1_cps_lim : system_darkquad29_wvl_capture1_cps_lim_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb2_OPB_Rst,
      Sl_DBus => opb2_Sl_DBus(384 to 415),
      Sl_errAck => opb2_Sl_errAck(12),
      Sl_retry => opb2_Sl_retry(12),
      Sl_toutSup => opb2_Sl_toutSup(12),
      Sl_xferAck => opb2_Sl_xferAck(12),
      OPB_ABus => opb2_OPB_ABus,
      OPB_BE => opb2_OPB_BE,
      OPB_DBus => opb2_OPB_DBus,
      OPB_RNW => opb2_OPB_RNW,
      OPB_select => opb2_OPB_select,
      OPB_seqAddr => opb2_OPB_seqAddr,
      user_data_out => darkquad29_wvl_capture1_cps_lim_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_ramblk : system_darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_ramblk_wrapper
    port map (
      clk => adc0_clk,
      bram_we => darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_we,
      bram_en_a => net_gnd0,
      bram_addr => darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_addr,
      bram_rd_data => darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_data_out,
      bram_wr_data => darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_data_in,
      BRAM_Rst_B => darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Rst,
      BRAM_Clk_B => darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Clk,
      BRAM_EN_B => darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_EN,
      BRAM_WEN_B => darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_WEN,
      BRAM_Addr_B => darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Addr,
      BRAM_Din_B => darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Din,
      BRAM_Dout_B => darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Dout
    );

  darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs : system_darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_wrapper
    port map (
      opb_clk => epb_clk,
      opb_rst => opb2_OPB_Rst,
      opb_abus => opb2_OPB_ABus,
      opb_dbus => opb2_OPB_DBus,
      sln_dbus => opb2_Sl_DBus(416 to 447),
      opb_select => opb2_OPB_select,
      opb_rnw => opb2_OPB_RNW,
      opb_seqaddr => opb2_OPB_seqAddr,
      opb_be => opb2_OPB_BE,
      sln_xferack => opb2_Sl_xferAck(13),
      sln_errack => opb2_Sl_errAck(13),
      sln_toutsup => opb2_Sl_toutSup(13),
      sln_retry => opb2_Sl_retry(13),
      bram_rst => darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Rst,
      bram_clk => darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Clk,
      bram_en => darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_EN,
      bram_wen => darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_WEN,
      bram_addr => darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Addr,
      bram_din => darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Din,
      bram_dout => darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Dout
    );

  darkquad29_wvl_capture1_load_thresh : system_darkquad29_wvl_capture1_load_thresh_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb2_OPB_Rst,
      Sl_DBus => opb2_Sl_DBus(448 to 479),
      Sl_errAck => opb2_Sl_errAck(14),
      Sl_retry => opb2_Sl_retry(14),
      Sl_toutSup => opb2_Sl_toutSup(14),
      Sl_xferAck => opb2_Sl_xferAck(14),
      OPB_ABus => opb2_OPB_ABus,
      OPB_BE => opb2_OPB_BE,
      OPB_DBus => opb2_OPB_DBus,
      OPB_RNW => opb2_OPB_RNW,
      OPB_select => opb2_OPB_select,
      OPB_seqAddr => opb2_OPB_seqAddr,
      user_data_out => darkquad29_wvl_capture1_load_thresh_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_capture1_pix_ramblk : system_darkquad29_wvl_capture1_pix_ramblk_wrapper
    port map (
      clk => adc0_clk,
      bram_we => darkquad29_wvl_capture1_pix_we,
      bram_en_a => net_gnd0,
      bram_addr => darkquad29_wvl_capture1_pix_addr,
      bram_rd_data => darkquad29_wvl_capture1_pix_data_out,
      bram_wr_data => darkquad29_wvl_capture1_pix_data_in,
      BRAM_Rst_B => darkquad29_wvl_capture1_pix_ramblk_portb_BRAM_Rst,
      BRAM_Clk_B => darkquad29_wvl_capture1_pix_ramblk_portb_BRAM_Clk,
      BRAM_EN_B => darkquad29_wvl_capture1_pix_ramblk_portb_BRAM_EN,
      BRAM_WEN_B => darkquad29_wvl_capture1_pix_ramblk_portb_BRAM_WEN,
      BRAM_Addr_B => darkquad29_wvl_capture1_pix_ramblk_portb_BRAM_Addr,
      BRAM_Din_B => darkquad29_wvl_capture1_pix_ramblk_portb_BRAM_Din,
      BRAM_Dout_B => darkquad29_wvl_capture1_pix_ramblk_portb_BRAM_Dout
    );

  darkquad29_wvl_capture1_pix : system_darkquad29_wvl_capture1_pix_wrapper
    port map (
      opb_clk => epb_clk,
      opb_rst => opb2_OPB_Rst,
      opb_abus => opb2_OPB_ABus,
      opb_dbus => opb2_OPB_DBus,
      sln_dbus => opb2_Sl_DBus(480 to 511),
      opb_select => opb2_OPB_select,
      opb_rnw => opb2_OPB_RNW,
      opb_seqaddr => opb2_OPB_seqAddr,
      opb_be => opb2_OPB_BE,
      sln_xferack => opb2_Sl_xferAck(15),
      sln_errack => opb2_Sl_errAck(15),
      sln_toutsup => opb2_Sl_toutSup(15),
      sln_retry => opb2_Sl_retry(15),
      bram_rst => darkquad29_wvl_capture1_pix_ramblk_portb_BRAM_Rst,
      bram_clk => darkquad29_wvl_capture1_pix_ramblk_portb_BRAM_Clk,
      bram_en => darkquad29_wvl_capture1_pix_ramblk_portb_BRAM_EN,
      bram_wen => darkquad29_wvl_capture1_pix_ramblk_portb_BRAM_WEN,
      bram_addr => darkquad29_wvl_capture1_pix_ramblk_portb_BRAM_Addr,
      bram_din => darkquad29_wvl_capture1_pix_ramblk_portb_BRAM_Din,
      bram_dout => darkquad29_wvl_capture1_pix_ramblk_portb_BRAM_Dout
    );

  darkquad29_wvl_capture1_threshold : system_darkquad29_wvl_capture1_threshold_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb2_OPB_Rst,
      Sl_DBus => opb2_Sl_DBus(512 to 543),
      Sl_errAck => opb2_Sl_errAck(16),
      Sl_retry => opb2_Sl_retry(16),
      Sl_toutSup => opb2_Sl_toutSup(16),
      Sl_xferAck => opb2_Sl_xferAck(16),
      OPB_ABus => opb2_OPB_ABus,
      OPB_BE => opb2_OPB_BE,
      OPB_DBus => opb2_OPB_DBus,
      OPB_RNW => opb2_OPB_RNW,
      OPB_select => opb2_OPB_select,
      OPB_seqAddr => opb2_OPB_seqAddr,
      user_data_out => darkquad29_wvl_capture1_threshold_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_capture1_use_energy_cal : system_darkquad29_wvl_capture1_use_energy_cal_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb2_OPB_Rst,
      Sl_DBus => opb2_Sl_DBus(544 to 575),
      Sl_errAck => opb2_Sl_errAck(17),
      Sl_retry => opb2_Sl_retry(17),
      Sl_toutSup => opb2_Sl_toutSup(17),
      Sl_xferAck => opb2_Sl_xferAck(17),
      OPB_ABus => opb2_OPB_ABus,
      OPB_BE => opb2_OPB_BE,
      OPB_DBus => opb2_OPB_DBus,
      OPB_RNW => opb2_OPB_RNW,
      OPB_select => opb2_OPB_select,
      OPB_seqAddr => opb2_OPB_seqAddr,
      user_data_out => darkquad29_wvl_capture1_use_energy_cal_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_capture2_base_kf : system_darkquad29_wvl_capture2_base_kf_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb2_OPB_Rst,
      Sl_DBus => opb2_Sl_DBus(576 to 607),
      Sl_errAck => opb2_Sl_errAck(18),
      Sl_retry => opb2_Sl_retry(18),
      Sl_toutSup => opb2_Sl_toutSup(18),
      Sl_xferAck => opb2_Sl_xferAck(18),
      OPB_ABus => opb2_OPB_ABus,
      OPB_BE => opb2_OPB_BE,
      OPB_DBus => opb2_OPB_DBus,
      OPB_RNW => opb2_OPB_RNW,
      OPB_select => opb2_OPB_select,
      OPB_seqAddr => opb2_OPB_seqAddr,
      user_data_out => darkquad29_wvl_capture2_base_kf_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_capture2_base_kq : system_darkquad29_wvl_capture2_base_kq_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb2_OPB_Rst,
      Sl_DBus => opb2_Sl_DBus(608 to 639),
      Sl_errAck => opb2_Sl_errAck(19),
      Sl_retry => opb2_Sl_retry(19),
      Sl_toutSup => opb2_Sl_toutSup(19),
      Sl_xferAck => opb2_Sl_xferAck(19),
      OPB_ABus => opb2_OPB_ABus,
      OPB_BE => opb2_OPB_BE,
      OPB_DBus => opb2_OPB_DBus,
      OPB_RNW => opb2_OPB_RNW,
      OPB_select => opb2_OPB_select,
      OPB_seqAddr => opb2_OPB_seqAddr,
      user_data_out => darkquad29_wvl_capture2_base_kq_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_capture2_cps_lim : system_darkquad29_wvl_capture2_cps_lim_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb2_OPB_Rst,
      Sl_DBus => opb2_Sl_DBus(640 to 671),
      Sl_errAck => opb2_Sl_errAck(20),
      Sl_retry => opb2_Sl_retry(20),
      Sl_toutSup => opb2_Sl_toutSup(20),
      Sl_xferAck => opb2_Sl_xferAck(20),
      OPB_ABus => opb2_OPB_ABus,
      OPB_BE => opb2_OPB_BE,
      OPB_DBus => opb2_OPB_DBus,
      OPB_RNW => opb2_OPB_RNW,
      OPB_select => opb2_OPB_select,
      OPB_seqAddr => opb2_OPB_seqAddr,
      user_data_out => darkquad29_wvl_capture2_cps_lim_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_ramblk : system_darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_ramblk_wrapper
    port map (
      clk => adc0_clk,
      bram_we => darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_we,
      bram_en_a => net_gnd0,
      bram_addr => darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_addr,
      bram_rd_data => darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_data_out,
      bram_wr_data => darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_data_in,
      BRAM_Rst_B => darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Rst,
      BRAM_Clk_B => darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Clk,
      BRAM_EN_B => darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_EN,
      BRAM_WEN_B => darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_WEN,
      BRAM_Addr_B => darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Addr,
      BRAM_Din_B => darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Din,
      BRAM_Dout_B => darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Dout
    );

  darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs : system_darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_wrapper
    port map (
      opb_clk => epb_clk,
      opb_rst => opb2_OPB_Rst,
      opb_abus => opb2_OPB_ABus,
      opb_dbus => opb2_OPB_DBus,
      sln_dbus => opb2_Sl_DBus(672 to 703),
      opb_select => opb2_OPB_select,
      opb_rnw => opb2_OPB_RNW,
      opb_seqaddr => opb2_OPB_seqAddr,
      opb_be => opb2_OPB_BE,
      sln_xferack => opb2_Sl_xferAck(21),
      sln_errack => opb2_Sl_errAck(21),
      sln_toutsup => opb2_Sl_toutSup(21),
      sln_retry => opb2_Sl_retry(21),
      bram_rst => darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Rst,
      bram_clk => darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Clk,
      bram_en => darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_EN,
      bram_wen => darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_WEN,
      bram_addr => darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Addr,
      bram_din => darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Din,
      bram_dout => darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Dout
    );

  darkquad29_wvl_capture2_load_thresh : system_darkquad29_wvl_capture2_load_thresh_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb2_OPB_Rst,
      Sl_DBus => opb2_Sl_DBus(704 to 735),
      Sl_errAck => opb2_Sl_errAck(22),
      Sl_retry => opb2_Sl_retry(22),
      Sl_toutSup => opb2_Sl_toutSup(22),
      Sl_xferAck => opb2_Sl_xferAck(22),
      OPB_ABus => opb2_OPB_ABus,
      OPB_BE => opb2_OPB_BE,
      OPB_DBus => opb2_OPB_DBus,
      OPB_RNW => opb2_OPB_RNW,
      OPB_select => opb2_OPB_select,
      OPB_seqAddr => opb2_OPB_seqAddr,
      user_data_out => darkquad29_wvl_capture2_load_thresh_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_capture2_pix_ramblk : system_darkquad29_wvl_capture2_pix_ramblk_wrapper
    port map (
      clk => adc0_clk,
      bram_we => darkquad29_wvl_capture2_pix_we,
      bram_en_a => net_gnd0,
      bram_addr => darkquad29_wvl_capture2_pix_addr,
      bram_rd_data => darkquad29_wvl_capture2_pix_data_out,
      bram_wr_data => darkquad29_wvl_capture2_pix_data_in,
      BRAM_Rst_B => darkquad29_wvl_capture2_pix_ramblk_portb_BRAM_Rst,
      BRAM_Clk_B => darkquad29_wvl_capture2_pix_ramblk_portb_BRAM_Clk,
      BRAM_EN_B => darkquad29_wvl_capture2_pix_ramblk_portb_BRAM_EN,
      BRAM_WEN_B => darkquad29_wvl_capture2_pix_ramblk_portb_BRAM_WEN,
      BRAM_Addr_B => darkquad29_wvl_capture2_pix_ramblk_portb_BRAM_Addr,
      BRAM_Din_B => darkquad29_wvl_capture2_pix_ramblk_portb_BRAM_Din,
      BRAM_Dout_B => darkquad29_wvl_capture2_pix_ramblk_portb_BRAM_Dout
    );

  darkquad29_wvl_capture2_pix : system_darkquad29_wvl_capture2_pix_wrapper
    port map (
      opb_clk => epb_clk,
      opb_rst => opb2_OPB_Rst,
      opb_abus => opb2_OPB_ABus,
      opb_dbus => opb2_OPB_DBus,
      sln_dbus => opb2_Sl_DBus(736 to 767),
      opb_select => opb2_OPB_select,
      opb_rnw => opb2_OPB_RNW,
      opb_seqaddr => opb2_OPB_seqAddr,
      opb_be => opb2_OPB_BE,
      sln_xferack => opb2_Sl_xferAck(23),
      sln_errack => opb2_Sl_errAck(23),
      sln_toutsup => opb2_Sl_toutSup(23),
      sln_retry => opb2_Sl_retry(23),
      bram_rst => darkquad29_wvl_capture2_pix_ramblk_portb_BRAM_Rst,
      bram_clk => darkquad29_wvl_capture2_pix_ramblk_portb_BRAM_Clk,
      bram_en => darkquad29_wvl_capture2_pix_ramblk_portb_BRAM_EN,
      bram_wen => darkquad29_wvl_capture2_pix_ramblk_portb_BRAM_WEN,
      bram_addr => darkquad29_wvl_capture2_pix_ramblk_portb_BRAM_Addr,
      bram_din => darkquad29_wvl_capture2_pix_ramblk_portb_BRAM_Din,
      bram_dout => darkquad29_wvl_capture2_pix_ramblk_portb_BRAM_Dout
    );

  darkquad29_wvl_capture2_threshold : system_darkquad29_wvl_capture2_threshold_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb2_OPB_Rst,
      Sl_DBus => opb2_Sl_DBus(768 to 799),
      Sl_errAck => opb2_Sl_errAck(24),
      Sl_retry => opb2_Sl_retry(24),
      Sl_toutSup => opb2_Sl_toutSup(24),
      Sl_xferAck => opb2_Sl_xferAck(24),
      OPB_ABus => opb2_OPB_ABus,
      OPB_BE => opb2_OPB_BE,
      OPB_DBus => opb2_OPB_DBus,
      OPB_RNW => opb2_OPB_RNW,
      OPB_select => opb2_OPB_select,
      OPB_seqAddr => opb2_OPB_seqAddr,
      user_data_out => darkquad29_wvl_capture2_threshold_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_capture2_use_energy_cal : system_darkquad29_wvl_capture2_use_energy_cal_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb2_OPB_Rst,
      Sl_DBus => opb2_Sl_DBus(800 to 831),
      Sl_errAck => opb2_Sl_errAck(25),
      Sl_retry => opb2_Sl_retry(25),
      Sl_toutSup => opb2_Sl_toutSup(25),
      Sl_xferAck => opb2_Sl_xferAck(25),
      OPB_ABus => opb2_OPB_ABus,
      OPB_BE => opb2_OPB_BE,
      OPB_DBus => opb2_OPB_DBus,
      OPB_RNW => opb2_OPB_RNW,
      OPB_select => opb2_OPB_select,
      OPB_seqAddr => opb2_OPB_seqAddr,
      user_data_out => darkquad29_wvl_capture2_use_energy_cal_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_capture3_base_kf : system_darkquad29_wvl_capture3_base_kf_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb2_OPB_Rst,
      Sl_DBus => opb2_Sl_DBus(832 to 863),
      Sl_errAck => opb2_Sl_errAck(26),
      Sl_retry => opb2_Sl_retry(26),
      Sl_toutSup => opb2_Sl_toutSup(26),
      Sl_xferAck => opb2_Sl_xferAck(26),
      OPB_ABus => opb2_OPB_ABus,
      OPB_BE => opb2_OPB_BE,
      OPB_DBus => opb2_OPB_DBus,
      OPB_RNW => opb2_OPB_RNW,
      OPB_select => opb2_OPB_select,
      OPB_seqAddr => opb2_OPB_seqAddr,
      user_data_out => darkquad29_wvl_capture3_base_kf_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_capture3_base_kq : system_darkquad29_wvl_capture3_base_kq_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb2_OPB_Rst,
      Sl_DBus => opb2_Sl_DBus(864 to 895),
      Sl_errAck => opb2_Sl_errAck(27),
      Sl_retry => opb2_Sl_retry(27),
      Sl_toutSup => opb2_Sl_toutSup(27),
      Sl_xferAck => opb2_Sl_xferAck(27),
      OPB_ABus => opb2_OPB_ABus,
      OPB_BE => opb2_OPB_BE,
      OPB_DBus => opb2_OPB_DBus,
      OPB_RNW => opb2_OPB_RNW,
      OPB_select => opb2_OPB_select,
      OPB_seqAddr => opb2_OPB_seqAddr,
      user_data_out => darkquad29_wvl_capture3_base_kq_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_capture3_cps_lim : system_darkquad29_wvl_capture3_cps_lim_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb2_OPB_Rst,
      Sl_DBus => opb2_Sl_DBus(896 to 927),
      Sl_errAck => opb2_Sl_errAck(28),
      Sl_retry => opb2_Sl_retry(28),
      Sl_toutSup => opb2_Sl_toutSup(28),
      Sl_xferAck => opb2_Sl_xferAck(28),
      OPB_ABus => opb2_OPB_ABus,
      OPB_BE => opb2_OPB_BE,
      OPB_DBus => opb2_OPB_DBus,
      OPB_RNW => opb2_OPB_RNW,
      OPB_select => opb2_OPB_select,
      OPB_seqAddr => opb2_OPB_seqAddr,
      user_data_out => darkquad29_wvl_capture3_cps_lim_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_ramblk : system_darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_ramblk_wrapper
    port map (
      clk => adc0_clk,
      bram_we => darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_we,
      bram_en_a => net_gnd0,
      bram_addr => darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_addr,
      bram_rd_data => darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_data_out,
      bram_wr_data => darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_data_in,
      BRAM_Rst_B => darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Rst,
      BRAM_Clk_B => darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Clk,
      BRAM_EN_B => darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_EN,
      BRAM_WEN_B => darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_WEN,
      BRAM_Addr_B => darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Addr,
      BRAM_Din_B => darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Din,
      BRAM_Dout_B => darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Dout
    );

  darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs : system_darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_wrapper
    port map (
      opb_clk => epb_clk,
      opb_rst => opb2_OPB_Rst,
      opb_abus => opb2_OPB_ABus,
      opb_dbus => opb2_OPB_DBus,
      sln_dbus => opb2_Sl_DBus(928 to 959),
      opb_select => opb2_OPB_select,
      opb_rnw => opb2_OPB_RNW,
      opb_seqaddr => opb2_OPB_seqAddr,
      opb_be => opb2_OPB_BE,
      sln_xferack => opb2_Sl_xferAck(29),
      sln_errack => opb2_Sl_errAck(29),
      sln_toutsup => opb2_Sl_toutSup(29),
      sln_retry => opb2_Sl_retry(29),
      bram_rst => darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Rst,
      bram_clk => darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Clk,
      bram_en => darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_EN,
      bram_wen => darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_WEN,
      bram_addr => darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Addr,
      bram_din => darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Din,
      bram_dout => darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_ramblk_portb_BRAM_Dout
    );

  darkquad29_wvl_capture3_load_thresh : system_darkquad29_wvl_capture3_load_thresh_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb2_OPB_Rst,
      Sl_DBus => opb2_Sl_DBus(960 to 991),
      Sl_errAck => opb2_Sl_errAck(30),
      Sl_retry => opb2_Sl_retry(30),
      Sl_toutSup => opb2_Sl_toutSup(30),
      Sl_xferAck => opb2_Sl_xferAck(30),
      OPB_ABus => opb2_OPB_ABus,
      OPB_BE => opb2_OPB_BE,
      OPB_DBus => opb2_OPB_DBus,
      OPB_RNW => opb2_OPB_RNW,
      OPB_select => opb2_OPB_select,
      OPB_seqAddr => opb2_OPB_seqAddr,
      user_data_out => darkquad29_wvl_capture3_load_thresh_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_capture3_pix_ramblk : system_darkquad29_wvl_capture3_pix_ramblk_wrapper
    port map (
      clk => adc0_clk,
      bram_we => darkquad29_wvl_capture3_pix_we,
      bram_en_a => net_gnd0,
      bram_addr => darkquad29_wvl_capture3_pix_addr,
      bram_rd_data => darkquad29_wvl_capture3_pix_data_out,
      bram_wr_data => darkquad29_wvl_capture3_pix_data_in,
      BRAM_Rst_B => darkquad29_wvl_capture3_pix_ramblk_portb_BRAM_Rst,
      BRAM_Clk_B => darkquad29_wvl_capture3_pix_ramblk_portb_BRAM_Clk,
      BRAM_EN_B => darkquad29_wvl_capture3_pix_ramblk_portb_BRAM_EN,
      BRAM_WEN_B => darkquad29_wvl_capture3_pix_ramblk_portb_BRAM_WEN,
      BRAM_Addr_B => darkquad29_wvl_capture3_pix_ramblk_portb_BRAM_Addr,
      BRAM_Din_B => darkquad29_wvl_capture3_pix_ramblk_portb_BRAM_Din,
      BRAM_Dout_B => darkquad29_wvl_capture3_pix_ramblk_portb_BRAM_Dout
    );

  darkquad29_wvl_capture3_pix : system_darkquad29_wvl_capture3_pix_wrapper
    port map (
      opb_clk => epb_clk,
      opb_rst => opb2_OPB_Rst,
      opb_abus => opb2_OPB_ABus,
      opb_dbus => opb2_OPB_DBus,
      sln_dbus => opb2_Sl_DBus(992 to 1023),
      opb_select => opb2_OPB_select,
      opb_rnw => opb2_OPB_RNW,
      opb_seqaddr => opb2_OPB_seqAddr,
      opb_be => opb2_OPB_BE,
      sln_xferack => opb2_Sl_xferAck(31),
      sln_errack => opb2_Sl_errAck(31),
      sln_toutsup => opb2_Sl_toutSup(31),
      sln_retry => opb2_Sl_retry(31),
      bram_rst => darkquad29_wvl_capture3_pix_ramblk_portb_BRAM_Rst,
      bram_clk => darkquad29_wvl_capture3_pix_ramblk_portb_BRAM_Clk,
      bram_en => darkquad29_wvl_capture3_pix_ramblk_portb_BRAM_EN,
      bram_wen => darkquad29_wvl_capture3_pix_ramblk_portb_BRAM_WEN,
      bram_addr => darkquad29_wvl_capture3_pix_ramblk_portb_BRAM_Addr,
      bram_din => darkquad29_wvl_capture3_pix_ramblk_portb_BRAM_Din,
      bram_dout => darkquad29_wvl_capture3_pix_ramblk_portb_BRAM_Dout
    );

  darkquad29_wvl_capture3_threshold : system_darkquad29_wvl_capture3_threshold_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb3_OPB_Rst,
      Sl_DBus => opb3_Sl_DBus(0 to 31),
      Sl_errAck => opb3_Sl_errAck(0),
      Sl_retry => opb3_Sl_retry(0),
      Sl_toutSup => opb3_Sl_toutSup(0),
      Sl_xferAck => opb3_Sl_xferAck(0),
      OPB_ABus => opb3_OPB_ABus,
      OPB_BE => opb3_OPB_BE,
      OPB_DBus => opb3_OPB_DBus,
      OPB_RNW => opb3_OPB_RNW,
      OPB_select => opb3_OPB_select,
      OPB_seqAddr => opb3_OPB_seqAddr,
      user_data_out => darkquad29_wvl_capture3_threshold_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_capture3_use_energy_cal : system_darkquad29_wvl_capture3_use_energy_cal_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb3_OPB_Rst,
      Sl_DBus => opb3_Sl_DBus(32 to 63),
      Sl_errAck => opb3_Sl_errAck(1),
      Sl_retry => opb3_Sl_retry(1),
      Sl_toutSup => opb3_Sl_toutSup(1),
      Sl_xferAck => opb3_Sl_xferAck(1),
      OPB_ABus => opb3_OPB_ABus,
      OPB_BE => opb3_OPB_BE,
      OPB_DBus => opb3_OPB_DBus,
      OPB_RNW => opb3_OPB_RNW,
      OPB_select => opb3_OPB_select,
      OPB_seqAddr => opb3_OPB_seqAddr,
      user_data_out => darkquad29_wvl_capture3_use_energy_cal_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_chan_sel_ch_bin0 : system_darkquad29_wvl_chan_sel_ch_bin0_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb3_OPB_Rst,
      Sl_DBus => opb3_Sl_DBus(64 to 95),
      Sl_errAck => opb3_Sl_errAck(2),
      Sl_retry => opb3_Sl_retry(2),
      Sl_toutSup => opb3_Sl_toutSup(2),
      Sl_xferAck => opb3_Sl_xferAck(2),
      OPB_ABus => opb3_OPB_ABus,
      OPB_BE => opb3_OPB_BE,
      OPB_DBus => opb3_OPB_DBus,
      OPB_RNW => opb3_OPB_RNW,
      OPB_select => opb3_OPB_select,
      OPB_seqAddr => opb3_OPB_seqAddr,
      user_data_out => darkquad29_wvl_chan_sel_ch_bin0_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_chan_sel_ch_bin1 : system_darkquad29_wvl_chan_sel_ch_bin1_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb3_OPB_Rst,
      Sl_DBus => opb3_Sl_DBus(96 to 127),
      Sl_errAck => opb3_Sl_errAck(3),
      Sl_retry => opb3_Sl_retry(3),
      Sl_toutSup => opb3_Sl_toutSup(3),
      Sl_xferAck => opb3_Sl_xferAck(3),
      OPB_ABus => opb3_OPB_ABus,
      OPB_BE => opb3_OPB_BE,
      OPB_DBus => opb3_OPB_DBus,
      OPB_RNW => opb3_OPB_RNW,
      OPB_select => opb3_OPB_select,
      OPB_seqAddr => opb3_OPB_seqAddr,
      user_data_out => darkquad29_wvl_chan_sel_ch_bin1_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_chan_sel_ch_bin2 : system_darkquad29_wvl_chan_sel_ch_bin2_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb3_OPB_Rst,
      Sl_DBus => opb3_Sl_DBus(128 to 159),
      Sl_errAck => opb3_Sl_errAck(4),
      Sl_retry => opb3_Sl_retry(4),
      Sl_toutSup => opb3_Sl_toutSup(4),
      Sl_xferAck => opb3_Sl_xferAck(4),
      OPB_ABus => opb3_OPB_ABus,
      OPB_BE => opb3_OPB_BE,
      OPB_DBus => opb3_OPB_DBus,
      OPB_RNW => opb3_OPB_RNW,
      OPB_select => opb3_OPB_select,
      OPB_seqAddr => opb3_OPB_seqAddr,
      user_data_out => darkquad29_wvl_chan_sel_ch_bin2_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_chan_sel_ch_bin3 : system_darkquad29_wvl_chan_sel_ch_bin3_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb3_OPB_Rst,
      Sl_DBus => opb3_Sl_DBus(160 to 191),
      Sl_errAck => opb3_Sl_errAck(5),
      Sl_retry => opb3_Sl_retry(5),
      Sl_toutSup => opb3_Sl_toutSup(5),
      Sl_xferAck => opb3_Sl_xferAck(5),
      OPB_ABus => opb3_OPB_ABus,
      OPB_BE => opb3_OPB_BE,
      OPB_DBus => opb3_OPB_DBus,
      OPB_RNW => opb3_OPB_RNW,
      OPB_select => opb3_OPB_select,
      OPB_seqAddr => opb3_OPB_seqAddr,
      user_data_out => darkquad29_wvl_chan_sel_ch_bin3_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_chan_sel_load : system_darkquad29_wvl_chan_sel_load_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb3_OPB_Rst,
      Sl_DBus => opb3_Sl_DBus(192 to 223),
      Sl_errAck => opb3_Sl_errAck(6),
      Sl_retry => opb3_Sl_retry(6),
      Sl_toutSup => opb3_Sl_toutSup(6),
      Sl_xferAck => opb3_Sl_xferAck(6),
      OPB_ABus => opb3_OPB_ABus,
      OPB_BE => opb3_OPB_BE,
      OPB_DBus => opb3_OPB_DBus,
      OPB_RNW => opb3_OPB_RNW,
      OPB_select => opb3_OPB_select,
      OPB_seqAddr => opb3_OPB_seqAddr,
      user_data_out => darkquad29_wvl_chan_sel_load_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_check_lag_data_ch : system_darkquad29_wvl_check_lag_data_ch_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb3_OPB_Rst,
      Sl_DBus => opb3_Sl_DBus(224 to 255),
      Sl_errAck => opb3_Sl_errAck(7),
      Sl_retry => opb3_Sl_retry(7),
      Sl_toutSup => opb3_Sl_toutSup(7),
      Sl_xferAck => opb3_Sl_xferAck(7),
      OPB_ABus => opb3_OPB_ABus,
      OPB_BE => opb3_OPB_BE,
      OPB_DBus => opb3_OPB_DBus,
      OPB_RNW => opb3_OPB_RNW,
      OPB_select => opb3_OPB_select,
      OPB_seqAddr => opb3_OPB_seqAddr,
      user_data_in => darkquad29_wvl_check_lag_data_ch_user_data_in,
      user_clk => adc0_clk
    );

  darkquad29_wvl_check_lag_dds_ch : system_darkquad29_wvl_check_lag_dds_ch_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb3_OPB_Rst,
      Sl_DBus => opb3_Sl_DBus(256 to 287),
      Sl_errAck => opb3_Sl_errAck(8),
      Sl_retry => opb3_Sl_retry(8),
      Sl_toutSup => opb3_Sl_toutSup(8),
      Sl_xferAck => opb3_Sl_xferAck(8),
      OPB_ABus => opb3_OPB_ABus,
      OPB_BE => opb3_OPB_BE,
      OPB_DBus => opb3_OPB_DBus,
      OPB_RNW => opb3_OPB_RNW,
      OPB_select => opb3_OPB_select,
      OPB_seqAddr => opb3_OPB_seqAddr,
      user_data_in => darkquad29_wvl_check_lag_dds_ch_user_data_in,
      user_clk => adc0_clk
    );

  darkquad29_wvl_check_lag_latch : system_darkquad29_wvl_check_lag_latch_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb3_OPB_Rst,
      Sl_DBus => opb3_Sl_DBus(288 to 319),
      Sl_errAck => opb3_Sl_errAck(9),
      Sl_retry => opb3_Sl_retry(9),
      Sl_toutSup => opb3_Sl_toutSup(9),
      Sl_xferAck => opb3_Sl_xferAck(9),
      OPB_ABus => opb3_OPB_ABus,
      OPB_BE => opb3_OPB_BE,
      OPB_DBus => opb3_OPB_DBus,
      OPB_RNW => opb3_OPB_RNW,
      OPB_select => opb3_OPB_select,
      OPB_seqAddr => opb3_OPB_seqAddr,
      user_data_out => darkquad29_wvl_check_lag_latch_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_conv_phase0_centers : system_darkquad29_wvl_conv_phase0_centers_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb3_OPB_Rst,
      Sl_DBus => opb3_Sl_DBus(320 to 351),
      Sl_errAck => opb3_Sl_errAck(10),
      Sl_retry => opb3_Sl_retry(10),
      Sl_toutSup => opb3_Sl_toutSup(10),
      Sl_xferAck => opb3_Sl_xferAck(10),
      OPB_ABus => opb3_OPB_ABus,
      OPB_BE => opb3_OPB_BE,
      OPB_DBus => opb3_OPB_DBus,
      OPB_RNW => opb3_OPB_RNW,
      OPB_select => opb3_OPB_select,
      OPB_seqAddr => opb3_OPB_seqAddr,
      user_data_out => darkquad29_wvl_conv_phase0_centers_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_conv_phase0_load_centers : system_darkquad29_wvl_conv_phase0_load_centers_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb3_OPB_Rst,
      Sl_DBus => opb3_Sl_DBus(352 to 383),
      Sl_errAck => opb3_Sl_errAck(11),
      Sl_retry => opb3_Sl_retry(11),
      Sl_toutSup => opb3_Sl_toutSup(11),
      Sl_xferAck => opb3_Sl_xferAck(11),
      OPB_ABus => opb3_OPB_ABus,
      OPB_BE => opb3_OPB_BE,
      OPB_DBus => opb3_OPB_DBus,
      OPB_RNW => opb3_OPB_RNW,
      OPB_select => opb3_OPB_select,
      OPB_seqAddr => opb3_OPB_seqAddr,
      user_data_out => darkquad29_wvl_conv_phase0_load_centers_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_conv_phase1_centers : system_darkquad29_wvl_conv_phase1_centers_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb3_OPB_Rst,
      Sl_DBus => opb3_Sl_DBus(384 to 415),
      Sl_errAck => opb3_Sl_errAck(12),
      Sl_retry => opb3_Sl_retry(12),
      Sl_toutSup => opb3_Sl_toutSup(12),
      Sl_xferAck => opb3_Sl_xferAck(12),
      OPB_ABus => opb3_OPB_ABus,
      OPB_BE => opb3_OPB_BE,
      OPB_DBus => opb3_OPB_DBus,
      OPB_RNW => opb3_OPB_RNW,
      OPB_select => opb3_OPB_select,
      OPB_seqAddr => opb3_OPB_seqAddr,
      user_data_out => darkquad29_wvl_conv_phase1_centers_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_conv_phase1_load_centers : system_darkquad29_wvl_conv_phase1_load_centers_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb3_OPB_Rst,
      Sl_DBus => opb3_Sl_DBus(416 to 447),
      Sl_errAck => opb3_Sl_errAck(13),
      Sl_retry => opb3_Sl_retry(13),
      Sl_toutSup => opb3_Sl_toutSup(13),
      Sl_xferAck => opb3_Sl_xferAck(13),
      OPB_ABus => opb3_OPB_ABus,
      OPB_BE => opb3_OPB_BE,
      OPB_DBus => opb3_OPB_DBus,
      OPB_RNW => opb3_OPB_RNW,
      OPB_select => opb3_OPB_select,
      OPB_seqAddr => opb3_OPB_seqAddr,
      user_data_out => darkquad29_wvl_conv_phase1_load_centers_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_conv_phase2_centers : system_darkquad29_wvl_conv_phase2_centers_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb3_OPB_Rst,
      Sl_DBus => opb3_Sl_DBus(448 to 479),
      Sl_errAck => opb3_Sl_errAck(14),
      Sl_retry => opb3_Sl_retry(14),
      Sl_toutSup => opb3_Sl_toutSup(14),
      Sl_xferAck => opb3_Sl_xferAck(14),
      OPB_ABus => opb3_OPB_ABus,
      OPB_BE => opb3_OPB_BE,
      OPB_DBus => opb3_OPB_DBus,
      OPB_RNW => opb3_OPB_RNW,
      OPB_select => opb3_OPB_select,
      OPB_seqAddr => opb3_OPB_seqAddr,
      user_data_out => darkquad29_wvl_conv_phase2_centers_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_conv_phase2_load_centers : system_darkquad29_wvl_conv_phase2_load_centers_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb3_OPB_Rst,
      Sl_DBus => opb3_Sl_DBus(480 to 511),
      Sl_errAck => opb3_Sl_errAck(15),
      Sl_retry => opb3_Sl_retry(15),
      Sl_toutSup => opb3_Sl_toutSup(15),
      Sl_xferAck => opb3_Sl_xferAck(15),
      OPB_ABus => opb3_OPB_ABus,
      OPB_BE => opb3_OPB_BE,
      OPB_DBus => opb3_OPB_DBus,
      OPB_RNW => opb3_OPB_RNW,
      OPB_select => opb3_OPB_select,
      OPB_seqAddr => opb3_OPB_seqAddr,
      user_data_out => darkquad29_wvl_conv_phase2_load_centers_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_conv_phase3_centers : system_darkquad29_wvl_conv_phase3_centers_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb3_OPB_Rst,
      Sl_DBus => opb3_Sl_DBus(512 to 543),
      Sl_errAck => opb3_Sl_errAck(16),
      Sl_retry => opb3_Sl_retry(16),
      Sl_toutSup => opb3_Sl_toutSup(16),
      Sl_xferAck => opb3_Sl_xferAck(16),
      OPB_ABus => opb3_OPB_ABus,
      OPB_BE => opb3_OPB_BE,
      OPB_DBus => opb3_OPB_DBus,
      OPB_RNW => opb3_OPB_RNW,
      OPB_select => opb3_OPB_select,
      OPB_seqAddr => opb3_OPB_seqAddr,
      user_data_out => darkquad29_wvl_conv_phase3_centers_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_conv_phase3_load_centers : system_darkquad29_wvl_conv_phase3_load_centers_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb3_OPB_Rst,
      Sl_DBus => opb3_Sl_DBus(544 to 575),
      Sl_errAck => opb3_Sl_errAck(17),
      Sl_retry => opb3_Sl_retry(17),
      Sl_toutSup => opb3_Sl_toutSup(17),
      Sl_xferAck => opb3_Sl_xferAck(17),
      OPB_ABus => opb3_OPB_ABus,
      OPB_BE => opb3_OPB_BE,
      OPB_DBus => opb3_OPB_DBus,
      OPB_RNW => opb3_OPB_RNW,
      OPB_select => opb3_OPB_select,
      OPB_seqAddr => opb3_OPB_seqAddr,
      user_data_out => darkquad29_wvl_conv_phase3_load_centers_user_data_out,
      user_clk => adc0_clk
    );

  qdr0_controller : system_qdr0_controller_wrapper
    port map (
      clk0 => adc0_clk,
      clk180 => adc0_clk180,
      clk270 => adc0_clk270,
      dly_clk => sys_clk2x,
      reset => darkquad29_wvl_dds_lut_qdr0_reset,
      idelay_rdy => idelay_rdy,
      qdr_k_n => qdr0_k_n,
      qdr_k => qdr0_k,
      qdr_d => qdr0_d,
      qdr_sa => qdr0_sa,
      qdr_w_n => qdr0_w_n,
      qdr_r_n => qdr0_r_n,
      qdr_q => qdr0_q,
      qdr_dll_off_n => qdr0_dll_off_n,
      phy_rdy => darkquad29_wvl_dds_lut_qdr0_phy_ready,
      cal_fail => darkquad29_wvl_dds_lut_qdr0_cal_fail,
      dly_extra_clk => darkquad29_wvl_dds_lut_qdr0_dly_extra_clk,
      dly_en_i => darkquad29_wvl_dds_lut_qdr0_dly_en_i,
      dly_en_o => darkquad29_wvl_dds_lut_qdr0_dly_en_o,
      dly_inc_dec => darkquad29_wvl_dds_lut_qdr0_dly_inc_dec,
      dly_cntrs => darkquad29_wvl_dds_lut_qdr0_dly_cntrs,
      usr_addr => darkquad29_wvl_dds_lut_qdr0_qdr_addr,
      usr_wr_strb => darkquad29_wvl_dds_lut_qdr0_qdr_wr_strb,
      usr_wr_data => darkquad29_wvl_dds_lut_qdr0_qdr_wr_data,
      usr_wr_be => darkquad29_wvl_dds_lut_qdr0_qdr_wr_be,
      usr_rd_strb => darkquad29_wvl_dds_lut_qdr0_qdr_rd_strb,
      usr_rd_data => darkquad29_wvl_dds_lut_qdr0_qdr_rd_data,
      usr_rd_dvld => darkquad29_wvl_dds_lut_qdr0_qdr_rd_dvld
    );

  qdr0_sniffer : system_qdr0_sniffer_wrapper
    port map (
      OPB_Clk_config => epb_clk,
      OPB_Rst_config => opb0_OPB_Rst,
      Sl_DBus_config => opb0_Sl_DBus(640 to 671),
      Sl_errAck_config => opb0_Sl_errAck(20),
      Sl_retry_config => opb0_Sl_retry(20),
      Sl_toutSup_config => opb0_Sl_toutSup(20),
      Sl_xferAck_config => opb0_Sl_xferAck(20),
      OPB_ABus_config => opb0_OPB_ABus,
      OPB_BE_config => opb0_OPB_BE,
      OPB_DBus_config => opb0_OPB_DBus,
      OPB_RNW_config => opb0_OPB_RNW,
      OPB_select_config => opb0_OPB_select,
      OPB_seqAddr_config => opb0_OPB_seqAddr,
      OPB_Clk => epb_clk,
      OPB_Rst => opb0_OPB_Rst,
      Sl_DBus => opb0_Sl_DBus(608 to 639),
      Sl_errAck => opb0_Sl_errAck(19),
      Sl_retry => opb0_Sl_retry(19),
      Sl_toutSup => opb0_Sl_toutSup(19),
      Sl_xferAck => opb0_Sl_xferAck(19),
      OPB_ABus => opb0_OPB_ABus,
      OPB_BE => opb0_OPB_BE,
      OPB_DBus => opb0_OPB_DBus,
      OPB_RNW => opb0_OPB_RNW,
      OPB_select => opb0_OPB_select,
      OPB_seqAddr => opb0_OPB_seqAddr,
      qdr_clk => adc0_clk,
      master_addr => darkquad29_wvl_dds_lut_qdr0_qdr_addr,
      master_wr_strb => darkquad29_wvl_dds_lut_qdr0_qdr_wr_strb,
      master_wr_data => darkquad29_wvl_dds_lut_qdr0_qdr_wr_data,
      master_wr_be => darkquad29_wvl_dds_lut_qdr0_qdr_wr_be,
      master_rd_strb => darkquad29_wvl_dds_lut_qdr0_qdr_rd_strb,
      master_rd_data => darkquad29_wvl_dds_lut_qdr0_qdr_rd_data,
      master_rd_dvld => darkquad29_wvl_dds_lut_qdr0_qdr_rd_dvld,
      slave_addr => darkquad29_wvl_dds_lut_qdr0_address,
      slave_wr_strb => darkquad29_wvl_dds_lut_qdr0_wr_en,
      slave_wr_data => darkquad29_wvl_dds_lut_qdr0_data_in,
      slave_wr_be => darkquad29_wvl_dds_lut_qdr0_be,
      slave_rd_strb => darkquad29_wvl_dds_lut_qdr0_rd_en,
      slave_rd_data => darkquad29_wvl_dds_lut_qdr0_data_out,
      slave_rd_dvld => darkquad29_wvl_dds_lut_qdr0_data_valid,
      slave_ack => darkquad29_wvl_dds_lut_qdr0_ack,
      dly_clk => sys_clk2x,
      dly_en_i => darkquad29_wvl_dds_lut_qdr0_dly_en_i,
      dly_en_o => darkquad29_wvl_dds_lut_qdr0_dly_en_o,
      dly_inc_dec => darkquad29_wvl_dds_lut_qdr0_dly_inc_dec,
      dly_cntrs => darkquad29_wvl_dds_lut_qdr0_dly_cntrs,
      dly_extra_clk => darkquad29_wvl_dds_lut_qdr0_dly_extra_clk,
      phy_rdy => darkquad29_wvl_dds_lut_qdr0_phy_ready,
      cal_fail => darkquad29_wvl_dds_lut_qdr0_cal_fail,
      qdr_reset => darkquad29_wvl_dds_lut_qdr0_reset
    );

  qdr1_controller : system_qdr1_controller_wrapper
    port map (
      clk0 => adc0_clk,
      clk180 => adc0_clk180,
      clk270 => adc0_clk270,
      dly_clk => sys_clk2x,
      reset => darkquad29_wvl_dds_lut_qdr1_reset,
      idelay_rdy => idelay_rdy,
      qdr_k_n => qdr1_k_n,
      qdr_k => qdr1_k,
      qdr_d => qdr1_d,
      qdr_sa => qdr1_sa,
      qdr_w_n => qdr1_w_n,
      qdr_r_n => qdr1_r_n,
      qdr_q => qdr1_q,
      qdr_dll_off_n => qdr1_dll_off_n,
      phy_rdy => darkquad29_wvl_dds_lut_qdr1_phy_ready,
      cal_fail => darkquad29_wvl_dds_lut_qdr1_cal_fail,
      dly_extra_clk => darkquad29_wvl_dds_lut_qdr1_dly_extra_clk,
      dly_en_i => darkquad29_wvl_dds_lut_qdr1_dly_en_i,
      dly_en_o => darkquad29_wvl_dds_lut_qdr1_dly_en_o,
      dly_inc_dec => darkquad29_wvl_dds_lut_qdr1_dly_inc_dec,
      dly_cntrs => darkquad29_wvl_dds_lut_qdr1_dly_cntrs,
      usr_addr => darkquad29_wvl_dds_lut_qdr1_qdr_addr,
      usr_wr_strb => darkquad29_wvl_dds_lut_qdr1_qdr_wr_strb,
      usr_wr_data => darkquad29_wvl_dds_lut_qdr1_qdr_wr_data,
      usr_wr_be => darkquad29_wvl_dds_lut_qdr1_qdr_wr_be,
      usr_rd_strb => darkquad29_wvl_dds_lut_qdr1_qdr_rd_strb,
      usr_rd_data => darkquad29_wvl_dds_lut_qdr1_qdr_rd_data,
      usr_rd_dvld => darkquad29_wvl_dds_lut_qdr1_qdr_rd_dvld
    );

  qdr1_sniffer : system_qdr1_sniffer_wrapper
    port map (
      OPB_Clk_config => epb_clk,
      OPB_Rst_config => opb0_OPB_Rst,
      Sl_DBus_config => opb0_Sl_DBus(704 to 735),
      Sl_errAck_config => opb0_Sl_errAck(22),
      Sl_retry_config => opb0_Sl_retry(22),
      Sl_toutSup_config => opb0_Sl_toutSup(22),
      Sl_xferAck_config => opb0_Sl_xferAck(22),
      OPB_ABus_config => opb0_OPB_ABus,
      OPB_BE_config => opb0_OPB_BE,
      OPB_DBus_config => opb0_OPB_DBus,
      OPB_RNW_config => opb0_OPB_RNW,
      OPB_select_config => opb0_OPB_select,
      OPB_seqAddr_config => opb0_OPB_seqAddr,
      OPB_Clk => epb_clk,
      OPB_Rst => opb0_OPB_Rst,
      Sl_DBus => opb0_Sl_DBus(672 to 703),
      Sl_errAck => opb0_Sl_errAck(21),
      Sl_retry => opb0_Sl_retry(21),
      Sl_toutSup => opb0_Sl_toutSup(21),
      Sl_xferAck => opb0_Sl_xferAck(21),
      OPB_ABus => opb0_OPB_ABus,
      OPB_BE => opb0_OPB_BE,
      OPB_DBus => opb0_OPB_DBus,
      OPB_RNW => opb0_OPB_RNW,
      OPB_select => opb0_OPB_select,
      OPB_seqAddr => opb0_OPB_seqAddr,
      qdr_clk => adc0_clk,
      master_addr => darkquad29_wvl_dds_lut_qdr1_qdr_addr,
      master_wr_strb => darkquad29_wvl_dds_lut_qdr1_qdr_wr_strb,
      master_wr_data => darkquad29_wvl_dds_lut_qdr1_qdr_wr_data,
      master_wr_be => darkquad29_wvl_dds_lut_qdr1_qdr_wr_be,
      master_rd_strb => darkquad29_wvl_dds_lut_qdr1_qdr_rd_strb,
      master_rd_data => darkquad29_wvl_dds_lut_qdr1_qdr_rd_data,
      master_rd_dvld => darkquad29_wvl_dds_lut_qdr1_qdr_rd_dvld,
      slave_addr => darkquad29_wvl_dds_lut_qdr1_address,
      slave_wr_strb => darkquad29_wvl_dds_lut_qdr1_wr_en,
      slave_wr_data => darkquad29_wvl_dds_lut_qdr1_data_in,
      slave_wr_be => darkquad29_wvl_dds_lut_qdr1_be,
      slave_rd_strb => darkquad29_wvl_dds_lut_qdr1_rd_en,
      slave_rd_data => darkquad29_wvl_dds_lut_qdr1_data_out,
      slave_rd_dvld => darkquad29_wvl_dds_lut_qdr1_data_valid,
      slave_ack => darkquad29_wvl_dds_lut_qdr1_ack,
      dly_clk => sys_clk2x,
      dly_en_i => darkquad29_wvl_dds_lut_qdr1_dly_en_i,
      dly_en_o => darkquad29_wvl_dds_lut_qdr1_dly_en_o,
      dly_inc_dec => darkquad29_wvl_dds_lut_qdr1_dly_inc_dec,
      dly_cntrs => darkquad29_wvl_dds_lut_qdr1_dly_cntrs,
      dly_extra_clk => darkquad29_wvl_dds_lut_qdr1_dly_extra_clk,
      phy_rdy => darkquad29_wvl_dds_lut_qdr1_phy_ready,
      cal_fail => darkquad29_wvl_dds_lut_qdr1_cal_fail,
      qdr_reset => darkquad29_wvl_dds_lut_qdr1_reset
    );

  qdr2_controller : system_qdr2_controller_wrapper
    port map (
      clk0 => adc0_clk,
      clk180 => adc0_clk180,
      clk270 => adc0_clk270,
      dly_clk => sys_clk2x,
      reset => darkquad29_wvl_dds_lut_qdr2_reset,
      idelay_rdy => idelay_rdy,
      qdr_k_n => qdr2_k_n,
      qdr_k => qdr2_k,
      qdr_d => qdr2_d,
      qdr_sa => qdr2_sa,
      qdr_w_n => qdr2_w_n,
      qdr_r_n => qdr2_r_n,
      qdr_q => qdr2_q,
      qdr_dll_off_n => qdr2_dll_off_n,
      phy_rdy => darkquad29_wvl_dds_lut_qdr2_phy_ready,
      cal_fail => darkquad29_wvl_dds_lut_qdr2_cal_fail,
      dly_extra_clk => darkquad29_wvl_dds_lut_qdr2_dly_extra_clk,
      dly_en_i => darkquad29_wvl_dds_lut_qdr2_dly_en_i,
      dly_en_o => darkquad29_wvl_dds_lut_qdr2_dly_en_o,
      dly_inc_dec => darkquad29_wvl_dds_lut_qdr2_dly_inc_dec,
      dly_cntrs => darkquad29_wvl_dds_lut_qdr2_dly_cntrs,
      usr_addr => darkquad29_wvl_dds_lut_qdr2_qdr_addr,
      usr_wr_strb => darkquad29_wvl_dds_lut_qdr2_qdr_wr_strb,
      usr_wr_data => darkquad29_wvl_dds_lut_qdr2_qdr_wr_data,
      usr_wr_be => darkquad29_wvl_dds_lut_qdr2_qdr_wr_be,
      usr_rd_strb => darkquad29_wvl_dds_lut_qdr2_qdr_rd_strb,
      usr_rd_data => darkquad29_wvl_dds_lut_qdr2_qdr_rd_data,
      usr_rd_dvld => darkquad29_wvl_dds_lut_qdr2_qdr_rd_dvld
    );

  qdr2_sniffer : system_qdr2_sniffer_wrapper
    port map (
      OPB_Clk_config => epb_clk,
      OPB_Rst_config => opb0_OPB_Rst,
      Sl_DBus_config => opb0_Sl_DBus(768 to 799),
      Sl_errAck_config => opb0_Sl_errAck(24),
      Sl_retry_config => opb0_Sl_retry(24),
      Sl_toutSup_config => opb0_Sl_toutSup(24),
      Sl_xferAck_config => opb0_Sl_xferAck(24),
      OPB_ABus_config => opb0_OPB_ABus,
      OPB_BE_config => opb0_OPB_BE,
      OPB_DBus_config => opb0_OPB_DBus,
      OPB_RNW_config => opb0_OPB_RNW,
      OPB_select_config => opb0_OPB_select,
      OPB_seqAddr_config => opb0_OPB_seqAddr,
      OPB_Clk => epb_clk,
      OPB_Rst => opb0_OPB_Rst,
      Sl_DBus => opb0_Sl_DBus(736 to 767),
      Sl_errAck => opb0_Sl_errAck(23),
      Sl_retry => opb0_Sl_retry(23),
      Sl_toutSup => opb0_Sl_toutSup(23),
      Sl_xferAck => opb0_Sl_xferAck(23),
      OPB_ABus => opb0_OPB_ABus,
      OPB_BE => opb0_OPB_BE,
      OPB_DBus => opb0_OPB_DBus,
      OPB_RNW => opb0_OPB_RNW,
      OPB_select => opb0_OPB_select,
      OPB_seqAddr => opb0_OPB_seqAddr,
      qdr_clk => adc0_clk,
      master_addr => darkquad29_wvl_dds_lut_qdr2_qdr_addr,
      master_wr_strb => darkquad29_wvl_dds_lut_qdr2_qdr_wr_strb,
      master_wr_data => darkquad29_wvl_dds_lut_qdr2_qdr_wr_data,
      master_wr_be => darkquad29_wvl_dds_lut_qdr2_qdr_wr_be,
      master_rd_strb => darkquad29_wvl_dds_lut_qdr2_qdr_rd_strb,
      master_rd_data => darkquad29_wvl_dds_lut_qdr2_qdr_rd_data,
      master_rd_dvld => darkquad29_wvl_dds_lut_qdr2_qdr_rd_dvld,
      slave_addr => darkquad29_wvl_dds_lut_qdr2_address,
      slave_wr_strb => darkquad29_wvl_dds_lut_qdr2_wr_en,
      slave_wr_data => darkquad29_wvl_dds_lut_qdr2_data_in,
      slave_wr_be => darkquad29_wvl_dds_lut_qdr2_be,
      slave_rd_strb => darkquad29_wvl_dds_lut_qdr2_rd_en,
      slave_rd_data => darkquad29_wvl_dds_lut_qdr2_data_out,
      slave_rd_dvld => darkquad29_wvl_dds_lut_qdr2_data_valid,
      slave_ack => darkquad29_wvl_dds_lut_qdr2_ack,
      dly_clk => sys_clk2x,
      dly_en_i => darkquad29_wvl_dds_lut_qdr2_dly_en_i,
      dly_en_o => darkquad29_wvl_dds_lut_qdr2_dly_en_o,
      dly_inc_dec => darkquad29_wvl_dds_lut_qdr2_dly_inc_dec,
      dly_cntrs => darkquad29_wvl_dds_lut_qdr2_dly_cntrs,
      dly_extra_clk => darkquad29_wvl_dds_lut_qdr2_dly_extra_clk,
      phy_rdy => darkquad29_wvl_dds_lut_qdr2_phy_ready,
      cal_fail => darkquad29_wvl_dds_lut_qdr2_cal_fail,
      qdr_reset => darkquad29_wvl_dds_lut_qdr2_reset
    );

  qdr3_controller : system_qdr3_controller_wrapper
    port map (
      clk0 => adc0_clk,
      clk180 => adc0_clk180,
      clk270 => adc0_clk270,
      dly_clk => sys_clk2x,
      reset => darkquad29_wvl_dds_lut_qdr3_reset,
      idelay_rdy => idelay_rdy,
      qdr_k_n => qdr3_k_n,
      qdr_k => qdr3_k,
      qdr_d => qdr3_d,
      qdr_sa => qdr3_sa,
      qdr_w_n => qdr3_w_n,
      qdr_r_n => qdr3_r_n,
      qdr_q => qdr3_q,
      qdr_dll_off_n => qdr3_dll_off_n,
      phy_rdy => darkquad29_wvl_dds_lut_qdr3_phy_ready,
      cal_fail => darkquad29_wvl_dds_lut_qdr3_cal_fail,
      dly_extra_clk => darkquad29_wvl_dds_lut_qdr3_dly_extra_clk,
      dly_en_i => darkquad29_wvl_dds_lut_qdr3_dly_en_i,
      dly_en_o => darkquad29_wvl_dds_lut_qdr3_dly_en_o,
      dly_inc_dec => darkquad29_wvl_dds_lut_qdr3_dly_inc_dec,
      dly_cntrs => darkquad29_wvl_dds_lut_qdr3_dly_cntrs,
      usr_addr => darkquad29_wvl_dds_lut_qdr3_qdr_addr,
      usr_wr_strb => darkquad29_wvl_dds_lut_qdr3_qdr_wr_strb,
      usr_wr_data => darkquad29_wvl_dds_lut_qdr3_qdr_wr_data,
      usr_wr_be => darkquad29_wvl_dds_lut_qdr3_qdr_wr_be,
      usr_rd_strb => darkquad29_wvl_dds_lut_qdr3_qdr_rd_strb,
      usr_rd_data => darkquad29_wvl_dds_lut_qdr3_qdr_rd_data,
      usr_rd_dvld => darkquad29_wvl_dds_lut_qdr3_qdr_rd_dvld
    );

  qdr3_sniffer : system_qdr3_sniffer_wrapper
    port map (
      OPB_Clk_config => epb_clk,
      OPB_Rst_config => opb0_OPB_Rst,
      Sl_DBus_config => opb0_Sl_DBus(832 to 863),
      Sl_errAck_config => opb0_Sl_errAck(26),
      Sl_retry_config => opb0_Sl_retry(26),
      Sl_toutSup_config => opb0_Sl_toutSup(26),
      Sl_xferAck_config => opb0_Sl_xferAck(26),
      OPB_ABus_config => opb0_OPB_ABus,
      OPB_BE_config => opb0_OPB_BE,
      OPB_DBus_config => opb0_OPB_DBus,
      OPB_RNW_config => opb0_OPB_RNW,
      OPB_select_config => opb0_OPB_select,
      OPB_seqAddr_config => opb0_OPB_seqAddr,
      OPB_Clk => epb_clk,
      OPB_Rst => opb0_OPB_Rst,
      Sl_DBus => opb0_Sl_DBus(800 to 831),
      Sl_errAck => opb0_Sl_errAck(25),
      Sl_retry => opb0_Sl_retry(25),
      Sl_toutSup => opb0_Sl_toutSup(25),
      Sl_xferAck => opb0_Sl_xferAck(25),
      OPB_ABus => opb0_OPB_ABus,
      OPB_BE => opb0_OPB_BE,
      OPB_DBus => opb0_OPB_DBus,
      OPB_RNW => opb0_OPB_RNW,
      OPB_select => opb0_OPB_select,
      OPB_seqAddr => opb0_OPB_seqAddr,
      qdr_clk => adc0_clk,
      master_addr => darkquad29_wvl_dds_lut_qdr3_qdr_addr,
      master_wr_strb => darkquad29_wvl_dds_lut_qdr3_qdr_wr_strb,
      master_wr_data => darkquad29_wvl_dds_lut_qdr3_qdr_wr_data,
      master_wr_be => darkquad29_wvl_dds_lut_qdr3_qdr_wr_be,
      master_rd_strb => darkquad29_wvl_dds_lut_qdr3_qdr_rd_strb,
      master_rd_data => darkquad29_wvl_dds_lut_qdr3_qdr_rd_data,
      master_rd_dvld => darkquad29_wvl_dds_lut_qdr3_qdr_rd_dvld,
      slave_addr => darkquad29_wvl_dds_lut_qdr3_address,
      slave_wr_strb => darkquad29_wvl_dds_lut_qdr3_wr_en,
      slave_wr_data => darkquad29_wvl_dds_lut_qdr3_data_in,
      slave_wr_be => darkquad29_wvl_dds_lut_qdr3_be,
      slave_rd_strb => darkquad29_wvl_dds_lut_qdr3_rd_en,
      slave_rd_data => darkquad29_wvl_dds_lut_qdr3_data_out,
      slave_rd_dvld => darkquad29_wvl_dds_lut_qdr3_data_valid,
      slave_ack => darkquad29_wvl_dds_lut_qdr3_ack,
      dly_clk => sys_clk2x,
      dly_en_i => darkquad29_wvl_dds_lut_qdr3_dly_en_i,
      dly_en_o => darkquad29_wvl_dds_lut_qdr3_dly_en_o,
      dly_inc_dec => darkquad29_wvl_dds_lut_qdr3_dly_inc_dec,
      dly_cntrs => darkquad29_wvl_dds_lut_qdr3_dly_cntrs,
      dly_extra_clk => darkquad29_wvl_dds_lut_qdr3_dly_extra_clk,
      phy_rdy => darkquad29_wvl_dds_lut_qdr3_phy_ready,
      cal_fail => darkquad29_wvl_dds_lut_qdr3_cal_fail,
      qdr_reset => darkquad29_wvl_dds_lut_qdr3_reset
    );

  darkquad29_wvl_dds_lut_run : system_darkquad29_wvl_dds_lut_run_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb3_OPB_Rst,
      Sl_DBus => opb3_Sl_DBus(576 to 607),
      Sl_errAck => opb3_Sl_errAck(18),
      Sl_retry => opb3_Sl_retry(18),
      Sl_toutSup => opb3_Sl_toutSup(18),
      Sl_xferAck => opb3_Sl_xferAck(18),
      OPB_ABus => opb3_OPB_ABus,
      OPB_BE => opb3_OPB_BE,
      OPB_DBus => opb3_OPB_DBus,
      OPB_RNW => opb3_OPB_RNW,
      OPB_select => opb3_OPB_select,
      OPB_seqAddr => opb3_OPB_seqAddr,
      user_data_out => darkquad29_wvl_dds_lut_run_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_dds_shift : system_darkquad29_wvl_dds_shift_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb3_OPB_Rst,
      Sl_DBus => opb3_Sl_DBus(608 to 639),
      Sl_errAck => opb3_Sl_errAck(19),
      Sl_retry => opb3_Sl_retry(19),
      Sl_toutSup => opb3_Sl_toutSup(19),
      Sl_xferAck => opb3_Sl_xferAck(19),
      OPB_ABus => opb3_OPB_ABus,
      OPB_BE => opb3_OPB_BE,
      OPB_DBus => opb3_OPB_DBus,
      OPB_RNW => opb3_OPB_RNW,
      OPB_select => opb3_OPB_select,
      OPB_seqAddr => opb3_OPB_seqAddr,
      user_data_out => darkquad29_wvl_dds_shift_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_gbe64_dest_ip : system_darkquad29_wvl_gbe64_dest_ip_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb3_OPB_Rst,
      Sl_DBus => opb3_Sl_DBus(640 to 671),
      Sl_errAck => opb3_Sl_errAck(20),
      Sl_retry => opb3_Sl_retry(20),
      Sl_toutSup => opb3_Sl_toutSup(20),
      Sl_xferAck => opb3_Sl_xferAck(20),
      OPB_ABus => opb3_OPB_ABus,
      OPB_BE => opb3_OPB_BE,
      OPB_DBus => opb3_OPB_DBus,
      OPB_RNW => opb3_OPB_RNW,
      OPB_select => opb3_OPB_select,
      OPB_seqAddr => opb3_OPB_seqAddr,
      user_data_out => darkquad29_wvl_gbe64_dest_ip_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_gbe64_one_gbe : system_darkquad29_wvl_gbe64_one_gbe_wrapper
    port map (
      app_clk => adc0_clk,
      app_tx_rst => darkquad29_wvl_gbe64_one_gbe_app_tx_rst,
      app_rx_rst => darkquad29_wvl_gbe64_one_gbe_app_rx_rst,
      mac_tx_rst => darkquad29_wvl_gbe64_one_gbe_app_tx_rst,
      mac_rx_rst => darkquad29_wvl_gbe64_one_gbe_app_rx_rst,
      app_tx_data => darkquad29_wvl_gbe64_one_gbe_app_tx_data,
      app_tx_dvld => darkquad29_wvl_gbe64_one_gbe_app_tx_dvld,
      app_tx_eof => darkquad29_wvl_gbe64_one_gbe_app_tx_eof,
      app_tx_destip => darkquad29_wvl_gbe64_one_gbe_app_tx_destip,
      app_tx_destport => darkquad29_wvl_gbe64_one_gbe_app_tx_destport,
      app_tx_afull => darkquad29_wvl_gbe64_one_gbe_app_tx_afull,
      app_tx_overflow => darkquad29_wvl_gbe64_one_gbe_app_tx_overflow,
      app_rx_data => darkquad29_wvl_gbe64_one_gbe_app_rx_data,
      app_rx_dvld => darkquad29_wvl_gbe64_one_gbe_app_rx_dvld,
      app_rx_eof => darkquad29_wvl_gbe64_one_gbe_app_rx_eof,
      app_rx_srcip => darkquad29_wvl_gbe64_one_gbe_app_rx_srcip,
      app_rx_srcport => darkquad29_wvl_gbe64_one_gbe_app_rx_srcport,
      app_rx_badframe => darkquad29_wvl_gbe64_one_gbe_app_rx_badframe,
      app_rx_overrun => darkquad29_wvl_gbe64_one_gbe_app_rx_overrun,
      app_rx_ack => darkquad29_wvl_gbe64_one_gbe_app_rx_ack,
      app_dbg_data => darkquad29_wvl_gbe64_one_gbe_app_dbg_data,
      app_dbg_dvld => darkquad29_wvl_gbe64_one_gbe_app_dbg_dvld,
      mac_rx_clk => mac_mac_rx_clk,
      mac_rx_data => mac_mac_rx_data,
      mac_rx_dvld => mac_mac_rx_dvld,
      mac_rx_goodframe => mac_mac_rx_goodframe,
      mac_rx_badframe => mac_mac_rx_badframe,
      mac_tx_clk => mac_mac_tx_clk,
      mac_tx_data => mac_mac_tx_data,
      mac_tx_dvld => mac_mac_tx_dvld,
      mac_tx_ack => mac_mac_tx_ack,
      mac_syncacquired => mac_mac_syncacquired,
      OPB_Clk => epb_clk,
      OPB_Rst => opb3_OPB_Rst,
      OPB_RNW => opb3_OPB_RNW,
      OPB_select => opb3_OPB_select,
      OPB_ABus => opb3_OPB_ABus,
      OPB_BE => opb3_OPB_BE,
      OPB_DBus => opb3_OPB_DBus,
      Sl_DBus => opb3_Sl_DBus(672 to 703),
      Sl_errAck => opb3_Sl_errAck(21),
      Sl_retry => opb3_Sl_retry(21),
      Sl_toutSup => opb3_Sl_toutSup(21),
      Sl_xferAck => opb3_Sl_xferAck(21)
    );

  darkquad29_wvl_gbe64_rst : system_darkquad29_wvl_gbe64_rst_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb3_OPB_Rst,
      Sl_DBus => opb3_Sl_DBus(704 to 735),
      Sl_errAck => opb3_Sl_errAck(22),
      Sl_retry => opb3_Sl_retry(22),
      Sl_toutSup => opb3_Sl_toutSup(22),
      Sl_xferAck => opb3_Sl_xferAck(22),
      OPB_ABus => opb3_OPB_ABus,
      OPB_BE => opb3_OPB_BE,
      OPB_DBus => opb3_OPB_DBus,
      OPB_RNW => opb3_OPB_RNW,
      OPB_select => opb3_OPB_select,
      OPB_seqAddr => opb3_OPB_seqAddr,
      user_data_out => darkquad29_wvl_gbe64_rst_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_gbe64_tx_afull : system_darkquad29_wvl_gbe64_tx_afull_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb3_OPB_Rst,
      Sl_DBus => opb3_Sl_DBus(736 to 767),
      Sl_errAck => opb3_Sl_errAck(23),
      Sl_retry => opb3_Sl_retry(23),
      Sl_toutSup => opb3_Sl_toutSup(23),
      Sl_xferAck => opb3_Sl_xferAck(23),
      OPB_ABus => opb3_OPB_ABus,
      OPB_BE => opb3_OPB_BE,
      OPB_DBus => opb3_OPB_DBus,
      OPB_RNW => opb3_OPB_RNW,
      OPB_select => opb3_OPB_select,
      OPB_seqAddr => opb3_OPB_seqAddr,
      user_data_in => darkquad29_wvl_gbe64_tx_afull_user_data_in,
      user_clk => adc0_clk
    );

  darkquad29_wvl_gbe64_tx_overrun : system_darkquad29_wvl_gbe64_tx_overrun_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb3_OPB_Rst,
      Sl_DBus => opb3_Sl_DBus(768 to 799),
      Sl_errAck => opb3_Sl_errAck(24),
      Sl_retry => opb3_Sl_retry(24),
      Sl_toutSup => opb3_Sl_toutSup(24),
      Sl_xferAck => opb3_Sl_xferAck(24),
      OPB_ABus => opb3_OPB_ABus,
      OPB_BE => opb3_OPB_BE,
      OPB_DBus => opb3_OPB_DBus,
      OPB_RNW => opb3_OPB_RNW,
      OPB_select => opb3_OPB_select,
      OPB_seqAddr => opb3_OPB_seqAddr,
      user_data_in => darkquad29_wvl_gbe64_tx_overrun_user_data_in,
      user_clk => adc0_clk
    );

  darkquad29_wvl_gbe64_words_per_frame : system_darkquad29_wvl_gbe64_words_per_frame_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb3_OPB_Rst,
      Sl_DBus => opb3_Sl_DBus(800 to 831),
      Sl_errAck => opb3_Sl_errAck(25),
      Sl_retry => opb3_Sl_retry(25),
      Sl_toutSup => opb3_Sl_toutSup(25),
      Sl_xferAck => opb3_Sl_xferAck(25),
      OPB_ABus => opb3_OPB_ABus,
      OPB_BE => opb3_OPB_BE,
      OPB_DBus => opb3_OPB_DBus,
      OPB_RNW => opb3_OPB_RNW,
      OPB_select => opb3_OPB_select,
      OPB_seqAddr => opb3_OPB_seqAddr,
      user_data_out => darkquad29_wvl_gbe64_words_per_frame_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_n_eof_sent : system_darkquad29_wvl_n_eof_sent_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb3_OPB_Rst,
      Sl_DBus => opb3_Sl_DBus(832 to 863),
      Sl_errAck => opb3_Sl_errAck(26),
      Sl_retry => opb3_Sl_retry(26),
      Sl_toutSup => opb3_Sl_toutSup(26),
      Sl_xferAck => opb3_Sl_xferAck(26),
      OPB_ABus => opb3_OPB_ABus,
      OPB_BE => opb3_OPB_BE,
      OPB_DBus => opb3_OPB_DBus,
      OPB_RNW => opb3_OPB_RNW,
      OPB_select => opb3_OPB_select,
      OPB_seqAddr => opb3_OPB_seqAddr,
      user_data_in => darkquad29_wvl_n_eof_sent_user_data_in,
      user_clk => adc0_clk
    );

  darkquad29_wvl_n_photons : system_darkquad29_wvl_n_photons_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb3_OPB_Rst,
      Sl_DBus => opb3_Sl_DBus(864 to 895),
      Sl_errAck => opb3_Sl_errAck(27),
      Sl_retry => opb3_Sl_retry(27),
      Sl_toutSup => opb3_Sl_toutSup(27),
      Sl_xferAck => opb3_Sl_xferAck(27),
      OPB_ABus => opb3_OPB_ABus,
      OPB_BE => opb3_OPB_BE,
      OPB_DBus => opb3_OPB_DBus,
      OPB_RNW => opb3_OPB_RNW,
      OPB_select => opb3_OPB_select,
      OPB_seqAddr => opb3_OPB_seqAddr,
      user_data_in => darkquad29_wvl_n_photons_user_data_in,
      user_clk => adc0_clk
    );

  darkquad29_wvl_pfb_fft_check_fft_oflow : system_darkquad29_wvl_pfb_fft_check_fft_oflow_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb3_OPB_Rst,
      Sl_DBus => opb3_Sl_DBus(896 to 927),
      Sl_errAck => opb3_Sl_errAck(28),
      Sl_retry => opb3_Sl_retry(28),
      Sl_toutSup => opb3_Sl_toutSup(28),
      Sl_xferAck => opb3_Sl_xferAck(28),
      OPB_ABus => opb3_OPB_ABus,
      OPB_BE => opb3_OPB_BE,
      OPB_DBus => opb3_OPB_DBus,
      OPB_RNW => opb3_OPB_RNW,
      OPB_select => opb3_OPB_select,
      OPB_seqAddr => opb3_OPB_seqAddr,
      user_data_in => darkquad29_wvl_pfb_fft_check_fft_oflow_user_data_in,
      user_clk => adc0_clk
    );

  darkquad29_wvl_phase_dmp_ch_we : system_darkquad29_wvl_phase_dmp_ch_we_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb3_OPB_Rst,
      Sl_DBus => opb3_Sl_DBus(928 to 959),
      Sl_errAck => opb3_Sl_errAck(29),
      Sl_retry => opb3_Sl_retry(29),
      Sl_toutSup => opb3_Sl_toutSup(29),
      Sl_xferAck => opb3_Sl_xferAck(29),
      OPB_ABus => opb3_OPB_ABus,
      OPB_BE => opb3_OPB_BE,
      OPB_DBus => opb3_OPB_DBus,
      OPB_RNW => opb3_OPB_RNW,
      OPB_select => opb3_OPB_select,
      OPB_seqAddr => opb3_OPB_seqAddr,
      user_data_out => darkquad29_wvl_phase_dmp_ch_we_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_phase_dmp_on : system_darkquad29_wvl_phase_dmp_on_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb3_OPB_Rst,
      Sl_DBus => opb3_Sl_DBus(960 to 991),
      Sl_errAck => opb3_Sl_errAck(30),
      Sl_retry => opb3_Sl_retry(30),
      Sl_toutSup => opb3_Sl_toutSup(30),
      Sl_xferAck => opb3_Sl_xferAck(30),
      OPB_ABus => opb3_OPB_ABus,
      OPB_BE => opb3_OPB_BE,
      OPB_DBus => opb3_OPB_DBus,
      OPB_RNW => opb3_OPB_RNW,
      OPB_select => opb3_OPB_select,
      OPB_seqAddr => opb3_OPB_seqAddr,
      user_data_out => darkquad29_wvl_phase_dmp_on_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_phase_port : system_darkquad29_wvl_phase_port_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb3_OPB_Rst,
      Sl_DBus => opb3_Sl_DBus(992 to 1023),
      Sl_errAck => opb3_Sl_errAck(31),
      Sl_retry => opb3_Sl_retry(31),
      Sl_toutSup => opb3_Sl_toutSup(31),
      Sl_xferAck => opb3_Sl_xferAck(31),
      OPB_ABus => opb3_OPB_ABus,
      OPB_BE => opb3_OPB_BE,
      OPB_DBus => opb3_OPB_DBus,
      OPB_RNW => opb3_OPB_RNW,
      OPB_select => opb3_OPB_select,
      OPB_seqAddr => opb3_OPB_seqAddr,
      user_data_out => darkquad29_wvl_phase_port_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_photon_port : system_darkquad29_wvl_photon_port_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb4_OPB_Rst,
      Sl_DBus => opb4_Sl_DBus(0 to 31),
      Sl_errAck => opb4_Sl_errAck(0),
      Sl_retry => opb4_Sl_retry(0),
      Sl_toutSup => opb4_Sl_toutSup(0),
      Sl_xferAck => opb4_Sl_xferAck(0),
      OPB_ABus => opb4_OPB_ABus,
      OPB_BE => opb4_OPB_BE,
      OPB_DBus => opb4_OPB_DBus,
      OPB_RNW => opb4_OPB_RNW,
      OPB_select => opb4_OPB_select,
      OPB_seqAddr => opb4_OPB_seqAddr,
      user_data_out => darkquad29_wvl_photon_port_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_prog_fir0_load_chan : system_darkquad29_wvl_prog_fir0_load_chan_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb4_OPB_Rst,
      Sl_DBus => opb4_Sl_DBus(32 to 63),
      Sl_errAck => opb4_Sl_errAck(1),
      Sl_retry => opb4_Sl_retry(1),
      Sl_toutSup => opb4_Sl_toutSup(1),
      Sl_xferAck => opb4_Sl_xferAck(1),
      OPB_ABus => opb4_OPB_ABus,
      OPB_BE => opb4_OPB_BE,
      OPB_DBus => opb4_OPB_DBus,
      OPB_RNW => opb4_OPB_RNW,
      OPB_select => opb4_OPB_select,
      OPB_seqAddr => opb4_OPB_seqAddr,
      user_data_out => darkquad29_wvl_prog_fir0_load_chan_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_prog_fir0_single_chan_coeffs_ramblk : system_darkquad29_wvl_prog_fir0_single_chan_coeffs_ramblk_wrapper
    port map (
      clk => adc0_clk,
      bram_we => darkquad29_wvl_prog_fir0_single_chan_coeffs_we,
      bram_en_a => net_gnd0,
      bram_addr => darkquad29_wvl_prog_fir0_single_chan_coeffs_addr,
      bram_rd_data => darkquad29_wvl_prog_fir0_single_chan_coeffs_data_out,
      bram_wr_data => darkquad29_wvl_prog_fir0_single_chan_coeffs_data_in,
      BRAM_Rst_B => darkquad29_wvl_prog_fir0_single_chan_coeffs_ramblk_portb_BRAM_Rst,
      BRAM_Clk_B => darkquad29_wvl_prog_fir0_single_chan_coeffs_ramblk_portb_BRAM_Clk,
      BRAM_EN_B => darkquad29_wvl_prog_fir0_single_chan_coeffs_ramblk_portb_BRAM_EN,
      BRAM_WEN_B => darkquad29_wvl_prog_fir0_single_chan_coeffs_ramblk_portb_BRAM_WEN,
      BRAM_Addr_B => darkquad29_wvl_prog_fir0_single_chan_coeffs_ramblk_portb_BRAM_Addr,
      BRAM_Din_B => darkquad29_wvl_prog_fir0_single_chan_coeffs_ramblk_portb_BRAM_Din,
      BRAM_Dout_B => darkquad29_wvl_prog_fir0_single_chan_coeffs_ramblk_portb_BRAM_Dout
    );

  darkquad29_wvl_prog_fir0_single_chan_coeffs : system_darkquad29_wvl_prog_fir0_single_chan_coeffs_wrapper
    port map (
      opb_clk => epb_clk,
      opb_rst => opb4_OPB_Rst,
      opb_abus => opb4_OPB_ABus,
      opb_dbus => opb4_OPB_DBus,
      sln_dbus => opb4_Sl_DBus(64 to 95),
      opb_select => opb4_OPB_select,
      opb_rnw => opb4_OPB_RNW,
      opb_seqaddr => opb4_OPB_seqAddr,
      opb_be => opb4_OPB_BE,
      sln_xferack => opb4_Sl_xferAck(2),
      sln_errack => opb4_Sl_errAck(2),
      sln_toutsup => opb4_Sl_toutSup(2),
      sln_retry => opb4_Sl_retry(2),
      bram_rst => darkquad29_wvl_prog_fir0_single_chan_coeffs_ramblk_portb_BRAM_Rst,
      bram_clk => darkquad29_wvl_prog_fir0_single_chan_coeffs_ramblk_portb_BRAM_Clk,
      bram_en => darkquad29_wvl_prog_fir0_single_chan_coeffs_ramblk_portb_BRAM_EN,
      bram_wen => darkquad29_wvl_prog_fir0_single_chan_coeffs_ramblk_portb_BRAM_WEN,
      bram_addr => darkquad29_wvl_prog_fir0_single_chan_coeffs_ramblk_portb_BRAM_Addr,
      bram_din => darkquad29_wvl_prog_fir0_single_chan_coeffs_ramblk_portb_BRAM_Din,
      bram_dout => darkquad29_wvl_prog_fir0_single_chan_coeffs_ramblk_portb_BRAM_Dout
    );

  darkquad29_wvl_prog_fir1_load_chan : system_darkquad29_wvl_prog_fir1_load_chan_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb4_OPB_Rst,
      Sl_DBus => opb4_Sl_DBus(96 to 127),
      Sl_errAck => opb4_Sl_errAck(3),
      Sl_retry => opb4_Sl_retry(3),
      Sl_toutSup => opb4_Sl_toutSup(3),
      Sl_xferAck => opb4_Sl_xferAck(3),
      OPB_ABus => opb4_OPB_ABus,
      OPB_BE => opb4_OPB_BE,
      OPB_DBus => opb4_OPB_DBus,
      OPB_RNW => opb4_OPB_RNW,
      OPB_select => opb4_OPB_select,
      OPB_seqAddr => opb4_OPB_seqAddr,
      user_data_out => darkquad29_wvl_prog_fir1_load_chan_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_prog_fir1_single_chan_coeffs_ramblk : system_darkquad29_wvl_prog_fir1_single_chan_coeffs_ramblk_wrapper
    port map (
      clk => adc0_clk,
      bram_we => darkquad29_wvl_prog_fir1_single_chan_coeffs_we,
      bram_en_a => net_gnd0,
      bram_addr => darkquad29_wvl_prog_fir1_single_chan_coeffs_addr,
      bram_rd_data => darkquad29_wvl_prog_fir1_single_chan_coeffs_data_out,
      bram_wr_data => darkquad29_wvl_prog_fir1_single_chan_coeffs_data_in,
      BRAM_Rst_B => darkquad29_wvl_prog_fir1_single_chan_coeffs_ramblk_portb_BRAM_Rst,
      BRAM_Clk_B => darkquad29_wvl_prog_fir1_single_chan_coeffs_ramblk_portb_BRAM_Clk,
      BRAM_EN_B => darkquad29_wvl_prog_fir1_single_chan_coeffs_ramblk_portb_BRAM_EN,
      BRAM_WEN_B => darkquad29_wvl_prog_fir1_single_chan_coeffs_ramblk_portb_BRAM_WEN,
      BRAM_Addr_B => darkquad29_wvl_prog_fir1_single_chan_coeffs_ramblk_portb_BRAM_Addr,
      BRAM_Din_B => darkquad29_wvl_prog_fir1_single_chan_coeffs_ramblk_portb_BRAM_Din,
      BRAM_Dout_B => darkquad29_wvl_prog_fir1_single_chan_coeffs_ramblk_portb_BRAM_Dout
    );

  darkquad29_wvl_prog_fir1_single_chan_coeffs : system_darkquad29_wvl_prog_fir1_single_chan_coeffs_wrapper
    port map (
      opb_clk => epb_clk,
      opb_rst => opb4_OPB_Rst,
      opb_abus => opb4_OPB_ABus,
      opb_dbus => opb4_OPB_DBus,
      sln_dbus => opb4_Sl_DBus(128 to 159),
      opb_select => opb4_OPB_select,
      opb_rnw => opb4_OPB_RNW,
      opb_seqaddr => opb4_OPB_seqAddr,
      opb_be => opb4_OPB_BE,
      sln_xferack => opb4_Sl_xferAck(4),
      sln_errack => opb4_Sl_errAck(4),
      sln_toutsup => opb4_Sl_toutSup(4),
      sln_retry => opb4_Sl_retry(4),
      bram_rst => darkquad29_wvl_prog_fir1_single_chan_coeffs_ramblk_portb_BRAM_Rst,
      bram_clk => darkquad29_wvl_prog_fir1_single_chan_coeffs_ramblk_portb_BRAM_Clk,
      bram_en => darkquad29_wvl_prog_fir1_single_chan_coeffs_ramblk_portb_BRAM_EN,
      bram_wen => darkquad29_wvl_prog_fir1_single_chan_coeffs_ramblk_portb_BRAM_WEN,
      bram_addr => darkquad29_wvl_prog_fir1_single_chan_coeffs_ramblk_portb_BRAM_Addr,
      bram_din => darkquad29_wvl_prog_fir1_single_chan_coeffs_ramblk_portb_BRAM_Din,
      bram_dout => darkquad29_wvl_prog_fir1_single_chan_coeffs_ramblk_portb_BRAM_Dout
    );

  darkquad29_wvl_prog_fir2_load_chan : system_darkquad29_wvl_prog_fir2_load_chan_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb4_OPB_Rst,
      Sl_DBus => opb4_Sl_DBus(160 to 191),
      Sl_errAck => opb4_Sl_errAck(5),
      Sl_retry => opb4_Sl_retry(5),
      Sl_toutSup => opb4_Sl_toutSup(5),
      Sl_xferAck => opb4_Sl_xferAck(5),
      OPB_ABus => opb4_OPB_ABus,
      OPB_BE => opb4_OPB_BE,
      OPB_DBus => opb4_OPB_DBus,
      OPB_RNW => opb4_OPB_RNW,
      OPB_select => opb4_OPB_select,
      OPB_seqAddr => opb4_OPB_seqAddr,
      user_data_out => darkquad29_wvl_prog_fir2_load_chan_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_prog_fir2_single_chan_coeffs_ramblk : system_darkquad29_wvl_prog_fir2_single_chan_coeffs_ramblk_wrapper
    port map (
      clk => adc0_clk,
      bram_we => darkquad29_wvl_prog_fir2_single_chan_coeffs_we,
      bram_en_a => net_gnd0,
      bram_addr => darkquad29_wvl_prog_fir2_single_chan_coeffs_addr,
      bram_rd_data => darkquad29_wvl_prog_fir2_single_chan_coeffs_data_out,
      bram_wr_data => darkquad29_wvl_prog_fir2_single_chan_coeffs_data_in,
      BRAM_Rst_B => darkquad29_wvl_prog_fir2_single_chan_coeffs_ramblk_portb_BRAM_Rst,
      BRAM_Clk_B => darkquad29_wvl_prog_fir2_single_chan_coeffs_ramblk_portb_BRAM_Clk,
      BRAM_EN_B => darkquad29_wvl_prog_fir2_single_chan_coeffs_ramblk_portb_BRAM_EN,
      BRAM_WEN_B => darkquad29_wvl_prog_fir2_single_chan_coeffs_ramblk_portb_BRAM_WEN,
      BRAM_Addr_B => darkquad29_wvl_prog_fir2_single_chan_coeffs_ramblk_portb_BRAM_Addr,
      BRAM_Din_B => darkquad29_wvl_prog_fir2_single_chan_coeffs_ramblk_portb_BRAM_Din,
      BRAM_Dout_B => darkquad29_wvl_prog_fir2_single_chan_coeffs_ramblk_portb_BRAM_Dout
    );

  darkquad29_wvl_prog_fir2_single_chan_coeffs : system_darkquad29_wvl_prog_fir2_single_chan_coeffs_wrapper
    port map (
      opb_clk => epb_clk,
      opb_rst => opb4_OPB_Rst,
      opb_abus => opb4_OPB_ABus,
      opb_dbus => opb4_OPB_DBus,
      sln_dbus => opb4_Sl_DBus(192 to 223),
      opb_select => opb4_OPB_select,
      opb_rnw => opb4_OPB_RNW,
      opb_seqaddr => opb4_OPB_seqAddr,
      opb_be => opb4_OPB_BE,
      sln_xferack => opb4_Sl_xferAck(6),
      sln_errack => opb4_Sl_errAck(6),
      sln_toutsup => opb4_Sl_toutSup(6),
      sln_retry => opb4_Sl_retry(6),
      bram_rst => darkquad29_wvl_prog_fir2_single_chan_coeffs_ramblk_portb_BRAM_Rst,
      bram_clk => darkquad29_wvl_prog_fir2_single_chan_coeffs_ramblk_portb_BRAM_Clk,
      bram_en => darkquad29_wvl_prog_fir2_single_chan_coeffs_ramblk_portb_BRAM_EN,
      bram_wen => darkquad29_wvl_prog_fir2_single_chan_coeffs_ramblk_portb_BRAM_WEN,
      bram_addr => darkquad29_wvl_prog_fir2_single_chan_coeffs_ramblk_portb_BRAM_Addr,
      bram_din => darkquad29_wvl_prog_fir2_single_chan_coeffs_ramblk_portb_BRAM_Din,
      bram_dout => darkquad29_wvl_prog_fir2_single_chan_coeffs_ramblk_portb_BRAM_Dout
    );

  darkquad29_wvl_prog_fir3_load_chan : system_darkquad29_wvl_prog_fir3_load_chan_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb4_OPB_Rst,
      Sl_DBus => opb4_Sl_DBus(224 to 255),
      Sl_errAck => opb4_Sl_errAck(7),
      Sl_retry => opb4_Sl_retry(7),
      Sl_toutSup => opb4_Sl_toutSup(7),
      Sl_xferAck => opb4_Sl_xferAck(7),
      OPB_ABus => opb4_OPB_ABus,
      OPB_BE => opb4_OPB_BE,
      OPB_DBus => opb4_OPB_DBus,
      OPB_RNW => opb4_OPB_RNW,
      OPB_select => opb4_OPB_select,
      OPB_seqAddr => opb4_OPB_seqAddr,
      user_data_out => darkquad29_wvl_prog_fir3_load_chan_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_prog_fir3_single_chan_coeffs_ramblk : system_darkquad29_wvl_prog_fir3_single_chan_coeffs_ramblk_wrapper
    port map (
      clk => adc0_clk,
      bram_we => darkquad29_wvl_prog_fir3_single_chan_coeffs_we,
      bram_en_a => net_gnd0,
      bram_addr => darkquad29_wvl_prog_fir3_single_chan_coeffs_addr,
      bram_rd_data => darkquad29_wvl_prog_fir3_single_chan_coeffs_data_out,
      bram_wr_data => darkquad29_wvl_prog_fir3_single_chan_coeffs_data_in,
      BRAM_Rst_B => darkquad29_wvl_prog_fir3_single_chan_coeffs_ramblk_portb_BRAM_Rst,
      BRAM_Clk_B => darkquad29_wvl_prog_fir3_single_chan_coeffs_ramblk_portb_BRAM_Clk,
      BRAM_EN_B => darkquad29_wvl_prog_fir3_single_chan_coeffs_ramblk_portb_BRAM_EN,
      BRAM_WEN_B => darkquad29_wvl_prog_fir3_single_chan_coeffs_ramblk_portb_BRAM_WEN,
      BRAM_Addr_B => darkquad29_wvl_prog_fir3_single_chan_coeffs_ramblk_portb_BRAM_Addr,
      BRAM_Din_B => darkquad29_wvl_prog_fir3_single_chan_coeffs_ramblk_portb_BRAM_Din,
      BRAM_Dout_B => darkquad29_wvl_prog_fir3_single_chan_coeffs_ramblk_portb_BRAM_Dout
    );

  darkquad29_wvl_prog_fir3_single_chan_coeffs : system_darkquad29_wvl_prog_fir3_single_chan_coeffs_wrapper
    port map (
      opb_clk => epb_clk,
      opb_rst => opb4_OPB_Rst,
      opb_abus => opb4_OPB_ABus,
      opb_dbus => opb4_OPB_DBus,
      sln_dbus => opb4_Sl_DBus(256 to 287),
      opb_select => opb4_OPB_select,
      opb_rnw => opb4_OPB_RNW,
      opb_seqaddr => opb4_OPB_seqAddr,
      opb_be => opb4_OPB_BE,
      sln_xferack => opb4_Sl_xferAck(8),
      sln_errack => opb4_Sl_errAck(8),
      sln_toutsup => opb4_Sl_toutSup(8),
      sln_retry => opb4_Sl_retry(8),
      bram_rst => darkquad29_wvl_prog_fir3_single_chan_coeffs_ramblk_portb_BRAM_Rst,
      bram_clk => darkquad29_wvl_prog_fir3_single_chan_coeffs_ramblk_portb_BRAM_Clk,
      bram_en => darkquad29_wvl_prog_fir3_single_chan_coeffs_ramblk_portb_BRAM_EN,
      bram_wen => darkquad29_wvl_prog_fir3_single_chan_coeffs_ramblk_portb_BRAM_WEN,
      bram_addr => darkquad29_wvl_prog_fir3_single_chan_coeffs_ramblk_portb_BRAM_Addr,
      bram_din => darkquad29_wvl_prog_fir3_single_chan_coeffs_ramblk_portb_BRAM_Din,
      bram_dout => darkquad29_wvl_prog_fir3_single_chan_coeffs_ramblk_portb_BRAM_Dout
    );

  darkquad29_wvl_run : system_darkquad29_wvl_run_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb4_OPB_Rst,
      Sl_DBus => opb4_Sl_DBus(288 to 319),
      Sl_errAck => opb4_Sl_errAck(9),
      Sl_retry => opb4_Sl_retry(9),
      Sl_toutSup => opb4_Sl_toutSup(9),
      Sl_xferAck => opb4_Sl_xferAck(9),
      OPB_ABus => opb4_OPB_ABus,
      OPB_BE => opb4_OPB_BE,
      OPB_DBus => opb4_OPB_DBus,
      OPB_RNW => opb4_OPB_RNW,
      OPB_select => opb4_OPB_select,
      OPB_seqAddr => opb4_OPB_seqAddr,
      user_data_out => darkquad29_wvl_run_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_sel_ch : system_darkquad29_wvl_sel_ch_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb4_OPB_Rst,
      Sl_DBus => opb4_Sl_DBus(320 to 351),
      Sl_errAck => opb4_Sl_errAck(10),
      Sl_retry => opb4_Sl_retry(10),
      Sl_toutSup => opb4_Sl_toutSup(10),
      Sl_xferAck => opb4_Sl_xferAck(10),
      OPB_ABus => opb4_OPB_ABus,
      OPB_BE => opb4_OPB_BE,
      OPB_DBus => opb4_OPB_DBus,
      OPB_RNW => opb4_OPB_RNW,
      OPB_select => opb4_OPB_select,
      OPB_seqAddr => opb4_OPB_seqAddr,
      user_data_out => darkquad29_wvl_sel_ch_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_snp_phs_ss_bram_ramblk : system_darkquad29_wvl_snp_phs_ss_bram_ramblk_wrapper
    port map (
      clk => adc0_clk,
      bram_we => darkquad29_wvl_snp_phs_ss_bram_we,
      bram_en_a => net_gnd0,
      bram_addr => darkquad29_wvl_snp_phs_ss_bram_addr,
      bram_rd_data => darkquad29_wvl_snp_phs_ss_bram_data_out,
      bram_wr_data => darkquad29_wvl_snp_phs_ss_bram_data_in,
      BRAM_Rst_B => darkquad29_wvl_snp_phs_ss_bram_ramblk_portb_BRAM_Rst,
      BRAM_Clk_B => darkquad29_wvl_snp_phs_ss_bram_ramblk_portb_BRAM_Clk,
      BRAM_EN_B => darkquad29_wvl_snp_phs_ss_bram_ramblk_portb_BRAM_EN,
      BRAM_WEN_B => darkquad29_wvl_snp_phs_ss_bram_ramblk_portb_BRAM_WEN,
      BRAM_Addr_B => darkquad29_wvl_snp_phs_ss_bram_ramblk_portb_BRAM_Addr,
      BRAM_Din_B => darkquad29_wvl_snp_phs_ss_bram_ramblk_portb_BRAM_Din,
      BRAM_Dout_B => darkquad29_wvl_snp_phs_ss_bram_ramblk_portb_BRAM_Dout
    );

  darkquad29_wvl_snp_phs_ss_bram : system_darkquad29_wvl_snp_phs_ss_bram_wrapper
    port map (
      opb_clk => epb_clk,
      opb_rst => opb4_OPB_Rst,
      opb_abus => opb4_OPB_ABus,
      opb_dbus => opb4_OPB_DBus,
      sln_dbus => opb4_Sl_DBus(352 to 383),
      opb_select => opb4_OPB_select,
      opb_rnw => opb4_OPB_RNW,
      opb_seqaddr => opb4_OPB_seqAddr,
      opb_be => opb4_OPB_BE,
      sln_xferack => opb4_Sl_xferAck(11),
      sln_errack => opb4_Sl_errAck(11),
      sln_toutsup => opb4_Sl_toutSup(11),
      sln_retry => opb4_Sl_retry(11),
      bram_rst => darkquad29_wvl_snp_phs_ss_bram_ramblk_portb_BRAM_Rst,
      bram_clk => darkquad29_wvl_snp_phs_ss_bram_ramblk_portb_BRAM_Clk,
      bram_en => darkquad29_wvl_snp_phs_ss_bram_ramblk_portb_BRAM_EN,
      bram_wen => darkquad29_wvl_snp_phs_ss_bram_ramblk_portb_BRAM_WEN,
      bram_addr => darkquad29_wvl_snp_phs_ss_bram_ramblk_portb_BRAM_Addr,
      bram_din => darkquad29_wvl_snp_phs_ss_bram_ramblk_portb_BRAM_Din,
      bram_dout => darkquad29_wvl_snp_phs_ss_bram_ramblk_portb_BRAM_Dout
    );

  darkquad29_wvl_snp_phs_ss_ctrl : system_darkquad29_wvl_snp_phs_ss_ctrl_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb4_OPB_Rst,
      Sl_DBus => opb4_Sl_DBus(384 to 415),
      Sl_errAck => opb4_Sl_errAck(12),
      Sl_retry => opb4_Sl_retry(12),
      Sl_toutSup => opb4_Sl_toutSup(12),
      Sl_xferAck => opb4_Sl_xferAck(12),
      OPB_ABus => opb4_OPB_ABus,
      OPB_BE => opb4_OPB_BE,
      OPB_DBus => opb4_OPB_DBus,
      OPB_RNW => opb4_OPB_RNW,
      OPB_select => opb4_OPB_select,
      OPB_seqAddr => opb4_OPB_seqAddr,
      user_data_out => darkquad29_wvl_snp_phs_ss_ctrl_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_snp_phs_ss_status : system_darkquad29_wvl_snp_phs_ss_status_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb4_OPB_Rst,
      Sl_DBus => opb4_Sl_DBus(416 to 447),
      Sl_errAck => opb4_Sl_errAck(13),
      Sl_retry => opb4_Sl_retry(13),
      Sl_toutSup => opb4_Sl_toutSup(13),
      Sl_xferAck => opb4_Sl_xferAck(13),
      OPB_ABus => opb4_OPB_ABus,
      OPB_BE => opb4_OPB_BE,
      OPB_DBus => opb4_OPB_DBus,
      OPB_RNW => opb4_OPB_RNW,
      OPB_select => opb4_OPB_select,
      OPB_seqAddr => opb4_OPB_seqAddr,
      user_data_in => darkquad29_wvl_snp_phs_ss_status_user_data_in,
      user_clk => adc0_clk
    );

  darkquad29_wvl_start_cap : system_darkquad29_wvl_start_cap_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb4_OPB_Rst,
      Sl_DBus => opb4_Sl_DBus(448 to 479),
      Sl_errAck => opb4_Sl_errAck(14),
      Sl_retry => opb4_Sl_retry(14),
      Sl_toutSup => opb4_Sl_toutSup(14),
      Sl_xferAck => opb4_Sl_xferAck(14),
      OPB_ABus => opb4_OPB_ABus,
      OPB_BE => opb4_OPB_BE,
      OPB_DBus => opb4_OPB_DBus,
      OPB_RNW => opb4_OPB_RNW,
      OPB_select => opb4_OPB_select,
      OPB_seqAddr => opb4_OPB_seqAddr,
      user_data_out => darkquad29_wvl_start_cap_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_timekeeper_base_ts : system_darkquad29_wvl_timekeeper_base_ts_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb4_OPB_Rst,
      Sl_DBus => opb4_Sl_DBus(480 to 511),
      Sl_errAck => opb4_Sl_errAck(15),
      Sl_retry => opb4_Sl_retry(15),
      Sl_toutSup => opb4_Sl_toutSup(15),
      Sl_xferAck => opb4_Sl_xferAck(15),
      OPB_ABus => opb4_OPB_ABus,
      OPB_BE => opb4_OPB_BE,
      OPB_DBus => opb4_OPB_DBus,
      OPB_RNW => opb4_OPB_RNW,
      OPB_select => opb4_OPB_select,
      OPB_seqAddr => opb4_OPB_seqAddr,
      user_data_out => darkquad29_wvl_timekeeper_base_ts_user_data_out,
      user_clk => adc0_clk
    );

  darkquad29_wvl_timekeeper_sec_now : system_darkquad29_wvl_timekeeper_sec_now_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb4_OPB_Rst,
      Sl_DBus => opb4_Sl_DBus(512 to 543),
      Sl_errAck => opb4_Sl_errAck(16),
      Sl_retry => opb4_Sl_retry(16),
      Sl_toutSup => opb4_Sl_toutSup(16),
      Sl_xferAck => opb4_Sl_xferAck(16),
      OPB_ABus => opb4_OPB_ABus,
      OPB_BE => opb4_OPB_BE,
      OPB_DBus => opb4_OPB_DBus,
      OPB_RNW => opb4_OPB_RNW,
      OPB_select => opb4_OPB_select,
      OPB_seqAddr => opb4_OPB_seqAddr,
      user_data_in => darkquad29_wvl_timekeeper_sec_now_user_data_in,
      user_clk => adc0_clk
    );

  darkquad29_wvl_trig_snp : system_darkquad29_wvl_trig_snp_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb4_OPB_Rst,
      Sl_DBus => opb4_Sl_DBus(544 to 575),
      Sl_errAck => opb4_Sl_errAck(17),
      Sl_retry => opb4_Sl_retry(17),
      Sl_toutSup => opb4_Sl_toutSup(17),
      Sl_xferAck => opb4_Sl_xferAck(17),
      OPB_ABus => opb4_OPB_ABus,
      OPB_BE => opb4_OPB_BE,
      OPB_DBus => opb4_OPB_DBus,
      OPB_RNW => opb4_OPB_RNW,
      OPB_select => opb4_OPB_select,
      OPB_seqAddr => opb4_OPB_seqAddr,
      user_data_out => darkquad29_wvl_trig_snp_user_data_out,
      user_clk => adc0_clk
    );

  opb1 : system_opb1_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb1_OPB_Rst,
      SYS_Rst => sys_reset,
      Debug_SYS_Rst => net_gnd0,
      WDT_Rst => net_gnd0,
      M_ABus => opb1_M_ABus,
      M_BE => opb1_M_BE,
      M_beXfer => net_gnd1(0 to 0),
      M_busLock => opb1_M_busLock(0 to 0),
      M_DBus => opb1_M_DBus,
      M_DBusEn => net_gnd1(0 to 0),
      M_DBusEn32_63 => net_vcc1(0 to 0),
      M_dwXfer => net_gnd1(0 to 0),
      M_fwXfer => net_gnd1(0 to 0),
      M_hwXfer => net_gnd1(0 to 0),
      M_request => opb1_M_request(0 to 0),
      M_RNW => opb1_M_RNW(0 to 0),
      M_select => opb1_M_select(0 to 0),
      M_seqAddr => opb1_M_seqAddr(0 to 0),
      Sl_beAck => net_gnd32,
      Sl_DBus => opb1_Sl_DBus,
      Sl_DBusEn => net_vcc32,
      Sl_DBusEn32_63 => net_vcc32,
      Sl_errAck => opb1_Sl_errAck,
      Sl_dwAck => net_gnd32,
      Sl_fwAck => net_gnd32,
      Sl_hwAck => net_gnd32,
      Sl_retry => opb1_Sl_retry,
      Sl_toutSup => opb1_Sl_toutSup,
      Sl_xferAck => opb1_Sl_xferAck,
      OPB_MRequest => open,
      OPB_ABus => opb1_OPB_ABus,
      OPB_BE => opb1_OPB_BE,
      OPB_beXfer => open,
      OPB_beAck => open,
      OPB_busLock => open,
      OPB_rdDBus => open,
      OPB_wrDBus => open,
      OPB_DBus => opb1_OPB_DBus,
      OPB_errAck => opb1_OPB_errAck,
      OPB_dwAck => open,
      OPB_dwXfer => open,
      OPB_fwAck => open,
      OPB_fwXfer => open,
      OPB_hwAck => open,
      OPB_hwXfer => open,
      OPB_MGrant => opb1_OPB_MGrant(0 to 0),
      OPB_pendReq => open,
      OPB_retry => opb1_OPB_retry,
      OPB_RNW => opb1_OPB_RNW,
      OPB_select => opb1_OPB_select,
      OPB_seqAddr => opb1_OPB_seqAddr,
      OPB_timeout => opb1_OPB_timeout,
      OPB_toutSup => open,
      OPB_xferAck => opb1_OPB_xferAck
    );

  opb2opb_bridge_opb1 : system_opb2opb_bridge_opb1_wrapper
    port map (
      MOPB_Clk => epb_clk,
      SOPB_Clk => epb_clk,
      MOPB_Rst => opb1_OPB_Rst,
      SOPB_Rst => opb0_OPB_Rst,
      SOPB_ABus => opb0_OPB_ABus,
      SOPB_BE => opb0_OPB_BE,
      SOPB_DBus => opb0_OPB_DBus,
      SOPB_RNW => opb0_OPB_RNW,
      SOPB_select => opb0_OPB_select,
      SOPB_seqAddr => opb0_OPB_seqAddr,
      Sl_DBus => opb0_Sl_DBus(864 to 895),
      Sl_errAck => opb0_Sl_errAck(27),
      Sl_retry => opb0_Sl_retry(27),
      Sl_toutSup => opb0_Sl_toutSup(27),
      Sl_xferAck => opb0_Sl_xferAck(27),
      M_ABus => opb1_M_ABus,
      M_BE => opb1_M_BE,
      M_busLock => opb1_M_busLock(0),
      M_DBus => opb1_M_DBus,
      M_request => opb1_M_request(0),
      M_RNW => opb1_M_RNW(0),
      M_select => opb1_M_select(0),
      M_seqAddr => opb1_M_seqAddr(0),
      MOPB_DBus => opb1_OPB_DBus,
      MOPB_errAck => opb1_OPB_errAck,
      MOPB_MGrant => opb1_OPB_MGrant(0),
      MOPB_retry => opb1_OPB_retry,
      MOPB_timeout => opb1_OPB_timeout,
      MOPB_xferAck => opb1_OPB_xferAck
    );

  opb2 : system_opb2_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb2_OPB_Rst,
      SYS_Rst => sys_reset,
      Debug_SYS_Rst => net_gnd0,
      WDT_Rst => net_gnd0,
      M_ABus => opb2_M_ABus,
      M_BE => opb2_M_BE,
      M_beXfer => net_gnd1(0 to 0),
      M_busLock => opb2_M_busLock(0 to 0),
      M_DBus => opb2_M_DBus,
      M_DBusEn => net_gnd1(0 to 0),
      M_DBusEn32_63 => net_vcc1(0 to 0),
      M_dwXfer => net_gnd1(0 to 0),
      M_fwXfer => net_gnd1(0 to 0),
      M_hwXfer => net_gnd1(0 to 0),
      M_request => opb2_M_request(0 to 0),
      M_RNW => opb2_M_RNW(0 to 0),
      M_select => opb2_M_select(0 to 0),
      M_seqAddr => opb2_M_seqAddr(0 to 0),
      Sl_beAck => net_gnd32,
      Sl_DBus => opb2_Sl_DBus,
      Sl_DBusEn => net_vcc32,
      Sl_DBusEn32_63 => net_vcc32,
      Sl_errAck => opb2_Sl_errAck,
      Sl_dwAck => net_gnd32,
      Sl_fwAck => net_gnd32,
      Sl_hwAck => net_gnd32,
      Sl_retry => opb2_Sl_retry,
      Sl_toutSup => opb2_Sl_toutSup,
      Sl_xferAck => opb2_Sl_xferAck,
      OPB_MRequest => open,
      OPB_ABus => opb2_OPB_ABus,
      OPB_BE => opb2_OPB_BE,
      OPB_beXfer => open,
      OPB_beAck => open,
      OPB_busLock => open,
      OPB_rdDBus => open,
      OPB_wrDBus => open,
      OPB_DBus => opb2_OPB_DBus,
      OPB_errAck => opb2_OPB_errAck,
      OPB_dwAck => open,
      OPB_dwXfer => open,
      OPB_fwAck => open,
      OPB_fwXfer => open,
      OPB_hwAck => open,
      OPB_hwXfer => open,
      OPB_MGrant => opb2_OPB_MGrant(0 to 0),
      OPB_pendReq => open,
      OPB_retry => opb2_OPB_retry,
      OPB_RNW => opb2_OPB_RNW,
      OPB_select => opb2_OPB_select,
      OPB_seqAddr => opb2_OPB_seqAddr,
      OPB_timeout => opb2_OPB_timeout,
      OPB_toutSup => open,
      OPB_xferAck => opb2_OPB_xferAck
    );

  opb2opb_bridge_opb2 : system_opb2opb_bridge_opb2_wrapper
    port map (
      MOPB_Clk => epb_clk,
      SOPB_Clk => epb_clk,
      MOPB_Rst => opb2_OPB_Rst,
      SOPB_Rst => opb0_OPB_Rst,
      SOPB_ABus => opb0_OPB_ABus,
      SOPB_BE => opb0_OPB_BE,
      SOPB_DBus => opb0_OPB_DBus,
      SOPB_RNW => opb0_OPB_RNW,
      SOPB_select => opb0_OPB_select,
      SOPB_seqAddr => opb0_OPB_seqAddr,
      Sl_DBus => opb0_Sl_DBus(896 to 927),
      Sl_errAck => opb0_Sl_errAck(28),
      Sl_retry => opb0_Sl_retry(28),
      Sl_toutSup => opb0_Sl_toutSup(28),
      Sl_xferAck => opb0_Sl_xferAck(28),
      M_ABus => opb2_M_ABus,
      M_BE => opb2_M_BE,
      M_busLock => opb2_M_busLock(0),
      M_DBus => opb2_M_DBus,
      M_request => opb2_M_request(0),
      M_RNW => opb2_M_RNW(0),
      M_select => opb2_M_select(0),
      M_seqAddr => opb2_M_seqAddr(0),
      MOPB_DBus => opb2_OPB_DBus,
      MOPB_errAck => opb2_OPB_errAck,
      MOPB_MGrant => opb2_OPB_MGrant(0),
      MOPB_retry => opb2_OPB_retry,
      MOPB_timeout => opb2_OPB_timeout,
      MOPB_xferAck => opb2_OPB_xferAck
    );

  opb3 : system_opb3_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb3_OPB_Rst,
      SYS_Rst => sys_reset,
      Debug_SYS_Rst => net_gnd0,
      WDT_Rst => net_gnd0,
      M_ABus => opb3_M_ABus,
      M_BE => opb3_M_BE,
      M_beXfer => net_gnd1(0 to 0),
      M_busLock => opb3_M_busLock(0 to 0),
      M_DBus => opb3_M_DBus,
      M_DBusEn => net_gnd1(0 to 0),
      M_DBusEn32_63 => net_vcc1(0 to 0),
      M_dwXfer => net_gnd1(0 to 0),
      M_fwXfer => net_gnd1(0 to 0),
      M_hwXfer => net_gnd1(0 to 0),
      M_request => opb3_M_request(0 to 0),
      M_RNW => opb3_M_RNW(0 to 0),
      M_select => opb3_M_select(0 to 0),
      M_seqAddr => opb3_M_seqAddr(0 to 0),
      Sl_beAck => net_gnd32,
      Sl_DBus => opb3_Sl_DBus,
      Sl_DBusEn => net_vcc32,
      Sl_DBusEn32_63 => net_vcc32,
      Sl_errAck => opb3_Sl_errAck,
      Sl_dwAck => net_gnd32,
      Sl_fwAck => net_gnd32,
      Sl_hwAck => net_gnd32,
      Sl_retry => opb3_Sl_retry,
      Sl_toutSup => opb3_Sl_toutSup,
      Sl_xferAck => opb3_Sl_xferAck,
      OPB_MRequest => open,
      OPB_ABus => opb3_OPB_ABus,
      OPB_BE => opb3_OPB_BE,
      OPB_beXfer => open,
      OPB_beAck => open,
      OPB_busLock => open,
      OPB_rdDBus => open,
      OPB_wrDBus => open,
      OPB_DBus => opb3_OPB_DBus,
      OPB_errAck => opb3_OPB_errAck,
      OPB_dwAck => open,
      OPB_dwXfer => open,
      OPB_fwAck => open,
      OPB_fwXfer => open,
      OPB_hwAck => open,
      OPB_hwXfer => open,
      OPB_MGrant => opb3_OPB_MGrant(0 to 0),
      OPB_pendReq => open,
      OPB_retry => opb3_OPB_retry,
      OPB_RNW => opb3_OPB_RNW,
      OPB_select => opb3_OPB_select,
      OPB_seqAddr => opb3_OPB_seqAddr,
      OPB_timeout => opb3_OPB_timeout,
      OPB_toutSup => open,
      OPB_xferAck => opb3_OPB_xferAck
    );

  opb2opb_bridge_opb3 : system_opb2opb_bridge_opb3_wrapper
    port map (
      MOPB_Clk => epb_clk,
      SOPB_Clk => epb_clk,
      MOPB_Rst => opb3_OPB_Rst,
      SOPB_Rst => opb0_OPB_Rst,
      SOPB_ABus => opb0_OPB_ABus,
      SOPB_BE => opb0_OPB_BE,
      SOPB_DBus => opb0_OPB_DBus,
      SOPB_RNW => opb0_OPB_RNW,
      SOPB_select => opb0_OPB_select,
      SOPB_seqAddr => opb0_OPB_seqAddr,
      Sl_DBus => opb0_Sl_DBus(928 to 959),
      Sl_errAck => opb0_Sl_errAck(29),
      Sl_retry => opb0_Sl_retry(29),
      Sl_toutSup => opb0_Sl_toutSup(29),
      Sl_xferAck => opb0_Sl_xferAck(29),
      M_ABus => opb3_M_ABus,
      M_BE => opb3_M_BE,
      M_busLock => opb3_M_busLock(0),
      M_DBus => opb3_M_DBus,
      M_request => opb3_M_request(0),
      M_RNW => opb3_M_RNW(0),
      M_select => opb3_M_select(0),
      M_seqAddr => opb3_M_seqAddr(0),
      MOPB_DBus => opb3_OPB_DBus,
      MOPB_errAck => opb3_OPB_errAck,
      MOPB_MGrant => opb3_OPB_MGrant(0),
      MOPB_retry => opb3_OPB_retry,
      MOPB_timeout => opb3_OPB_timeout,
      MOPB_xferAck => opb3_OPB_xferAck
    );

  opb4 : system_opb4_wrapper
    port map (
      OPB_Clk => epb_clk,
      OPB_Rst => opb4_OPB_Rst,
      SYS_Rst => sys_reset,
      Debug_SYS_Rst => net_gnd0,
      WDT_Rst => net_gnd0,
      M_ABus => opb4_M_ABus,
      M_BE => opb4_M_BE,
      M_beXfer => net_gnd1(0 to 0),
      M_busLock => opb4_M_busLock(0 to 0),
      M_DBus => opb4_M_DBus,
      M_DBusEn => net_gnd1(0 to 0),
      M_DBusEn32_63 => net_vcc1(0 to 0),
      M_dwXfer => net_gnd1(0 to 0),
      M_fwXfer => net_gnd1(0 to 0),
      M_hwXfer => net_gnd1(0 to 0),
      M_request => opb4_M_request(0 to 0),
      M_RNW => opb4_M_RNW(0 to 0),
      M_select => opb4_M_select(0 to 0),
      M_seqAddr => opb4_M_seqAddr(0 to 0),
      Sl_beAck => net_gnd18,
      Sl_DBus => opb4_Sl_DBus,
      Sl_DBusEn => net_vcc18,
      Sl_DBusEn32_63 => net_vcc18,
      Sl_errAck => opb4_Sl_errAck,
      Sl_dwAck => net_gnd18,
      Sl_fwAck => net_gnd18,
      Sl_hwAck => net_gnd18,
      Sl_retry => opb4_Sl_retry,
      Sl_toutSup => opb4_Sl_toutSup,
      Sl_xferAck => opb4_Sl_xferAck,
      OPB_MRequest => open,
      OPB_ABus => opb4_OPB_ABus,
      OPB_BE => opb4_OPB_BE,
      OPB_beXfer => open,
      OPB_beAck => open,
      OPB_busLock => open,
      OPB_rdDBus => open,
      OPB_wrDBus => open,
      OPB_DBus => opb4_OPB_DBus,
      OPB_errAck => opb4_OPB_errAck,
      OPB_dwAck => open,
      OPB_dwXfer => open,
      OPB_fwAck => open,
      OPB_fwXfer => open,
      OPB_hwAck => open,
      OPB_hwXfer => open,
      OPB_MGrant => opb4_OPB_MGrant(0 to 0),
      OPB_pendReq => open,
      OPB_retry => opb4_OPB_retry,
      OPB_RNW => opb4_OPB_RNW,
      OPB_select => opb4_OPB_select,
      OPB_seqAddr => opb4_OPB_seqAddr,
      OPB_timeout => opb4_OPB_timeout,
      OPB_toutSup => open,
      OPB_xferAck => opb4_OPB_xferAck
    );

  opb2opb_bridge_opb4 : system_opb2opb_bridge_opb4_wrapper
    port map (
      MOPB_Clk => epb_clk,
      SOPB_Clk => epb_clk,
      MOPB_Rst => opb4_OPB_Rst,
      SOPB_Rst => opb0_OPB_Rst,
      SOPB_ABus => opb0_OPB_ABus,
      SOPB_BE => opb0_OPB_BE,
      SOPB_DBus => opb0_OPB_DBus,
      SOPB_RNW => opb0_OPB_RNW,
      SOPB_select => opb0_OPB_select,
      SOPB_seqAddr => opb0_OPB_seqAddr,
      Sl_DBus => opb0_Sl_DBus(960 to 991),
      Sl_errAck => opb0_Sl_errAck(30),
      Sl_retry => opb0_Sl_retry(30),
      Sl_toutSup => opb0_Sl_toutSup(30),
      Sl_xferAck => opb0_Sl_xferAck(30),
      M_ABus => opb4_M_ABus,
      M_BE => opb4_M_BE,
      M_busLock => opb4_M_busLock(0),
      M_DBus => opb4_M_DBus,
      M_request => opb4_M_request(0),
      M_RNW => opb4_M_RNW(0),
      M_select => opb4_M_select(0),
      M_seqAddr => opb4_M_seqAddr(0),
      MOPB_DBus => opb4_OPB_DBus,
      MOPB_errAck => opb4_OPB_errAck,
      MOPB_MGrant => opb4_OPB_MGrant(0),
      MOPB_retry => opb4_OPB_retry,
      MOPB_timeout => opb4_OPB_timeout,
      MOPB_xferAck => opb4_OPB_xferAck
    );

end architecture STRUCTURE;

