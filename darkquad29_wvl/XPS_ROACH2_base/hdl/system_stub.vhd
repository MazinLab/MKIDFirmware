-------------------------------------------------------------------------------
-- system_stub.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity system_stub is
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
end system_stub;

architecture STRUCTURE of system_stub is

  component system is
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
  end component;

  attribute BOX_TYPE : STRING;
  attribute BOX_TYPE of system : component is "user_black_box";

begin

  system_i : system
    port map (
      sys_clk_n => sys_clk_n,
      sys_clk_p => sys_clk_p,
      aux_clk_n => aux_clk_n,
      aux_clk_p => aux_clk_p,
      epb_clk_in => epb_clk_in,
      epb_data => epb_data,
      epb_addr => epb_addr,
      epb_cs_n => epb_cs_n,
      epb_be_n => epb_be_n,
      epb_r_w_n => epb_r_w_n,
      epb_oe_n => epb_oe_n,
      epb_doe_n => epb_doe_n,
      epb_rdy => epb_rdy,
      ppc_irq_n => ppc_irq_n,
      sgmii_rx_n => sgmii_rx_n,
      sgmii_rx_p => sgmii_rx_p,
      sgmii_tx_n => sgmii_tx_n,
      sgmii_tx_p => sgmii_tx_p,
      sgmii_clkref_n => sgmii_clkref_n,
      sgmii_clkref_p => sgmii_clkref_p,
      adc_ctrl_tx_data_p => adc_ctrl_tx_data_p,
      adc_ctrl_tx_data_n => adc_ctrl_tx_data_n,
      adc_ctrl_rx_data_p => adc_ctrl_rx_data_p,
      adc_ctrl_rx_data_n => adc_ctrl_rx_data_n,
      adc_valid_p => adc_valid_p,
      adc_valid_n => adc_valid_n,
      adc_data0_p => adc_data0_p,
      adc_data0_n => adc_data0_n,
      adc_info0_p => adc_info0_p,
      adc_info0_n => adc_info0_n,
      adc_data1_p => adc_data1_p,
      adc_data1_n => adc_data1_n,
      adc_info1_p => adc_info1_p,
      adc_info1_n => adc_info1_n,
      adc_data2z0_p => adc_data2z0_p,
      adc_data2z0_n => adc_data2z0_n,
      adc_info2_p => adc_info2_p,
      adc_info2_n => adc_info2_n,
      adc_data3_p => adc_data3_p,
      adc_data3_n => adc_data3_n,
      adc_info3_p => adc_info3_p,
      adc_info3_n => adc_info3_n,
      adc_data0_smpl_clk_p => adc_data0_smpl_clk_p,
      adc_data0_smpl_clk_n => adc_data0_smpl_clk_n,
      adc_sync_pps_p => adc_sync_pps_p,
      adc_sync_pps_n => adc_sync_pps_n,
      adc_data0_rdy_p => adc_data0_rdy_p,
      adc_data0_rdy_n => adc_data0_rdy_n,
      adc_sync_out_p => adc_sync_out_p,
      adc_sync_out_n => adc_sync_out_n,
      qdr0_k_n => qdr0_k_n,
      qdr0_k => qdr0_k,
      qdr0_d => qdr0_d,
      qdr0_sa => qdr0_sa,
      qdr0_w_n => qdr0_w_n,
      qdr0_r_n => qdr0_r_n,
      qdr0_q => qdr0_q,
      qdr0_dll_off_n => qdr0_dll_off_n,
      qdr1_k_n => qdr1_k_n,
      qdr1_k => qdr1_k,
      qdr1_d => qdr1_d,
      qdr1_sa => qdr1_sa,
      qdr1_w_n => qdr1_w_n,
      qdr1_r_n => qdr1_r_n,
      qdr1_q => qdr1_q,
      qdr1_dll_off_n => qdr1_dll_off_n,
      qdr2_k_n => qdr2_k_n,
      qdr2_k => qdr2_k,
      qdr2_d => qdr2_d,
      qdr2_sa => qdr2_sa,
      qdr2_w_n => qdr2_w_n,
      qdr2_r_n => qdr2_r_n,
      qdr2_q => qdr2_q,
      qdr2_dll_off_n => qdr2_dll_off_n,
      qdr3_k_n => qdr3_k_n,
      qdr3_k => qdr3_k,
      qdr3_d => qdr3_d,
      qdr3_sa => qdr3_sa,
      qdr3_w_n => qdr3_w_n,
      qdr3_r_n => qdr3_r_n,
      qdr3_q => qdr3_q,
      qdr3_dll_off_n => qdr3_dll_off_n
    );

end architecture STRUCTURE;

