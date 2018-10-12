
-------------------------------------------------------------------
-- System Generator version 14.3 VHDL source file.
--
-- Copyright(C) 2012 by Xilinx, Inc.  All rights reserved.  This
-- text/file contains proprietary, confidential information of Xilinx,
-- Inc., is distributed under license from Xilinx, Inc., and may be used,
-- copied and/or disclosed only pursuant to the terms of a valid license
-- agreement with Xilinx, Inc.  Xilinx hereby grants you a license to use
-- this text/file solely for design, simulation, implementation and
-- creation of design files limited to Xilinx devices or technologies.
-- Use with non-Xilinx devices or technologies is expressly prohibited
-- and immediately terminates your license unless covered by a separate
-- agreement.
--
-- Xilinx is providing this design, code, or information "as is" solely
-- for use in developing programs and solutions for Xilinx devices.  By
-- providing this design, code, or information as one possible
-- implementation of this feature, application or standard, Xilinx is
-- making no representation that this implementation is free from any
-- claims of infringement.  You are responsible for obtaining any rights
-- you may require for your implementation.  Xilinx expressly disclaims
-- any warranty whatsoever with respect to the adequacy of the
-- implementation, including but not limited to warranties of
-- merchantability or fitness for a particular purpose.
--
-- Xilinx products are not intended for use in life support appliances,
-- devices, or systems.  Use in such applications is expressly prohibited.
--
-- Any modifications that are made to the source code are done at the user's
-- sole risk and will be unsupported.
--
-- This copyright and support notice must be retained as part of this
-- text at all times.  (c) Copyright 1995-2012 Xilinx, Inc.  All rights
-- reserved.
-------------------------------------------------------------------
-- The following code must appear in the VHDL architecture header:

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
component darkquad29_wvl_cw  port (
    ce: in std_logic := '1'; 
    clk: in std_logic; -- clock period = 4.0 ns (250.0 Mhz)
    darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_data: in std_logic_vector(7 downto 0); 
    darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_full: in std_logic; 
    darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_val: in std_logic; 
    darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_full: in std_logic; 
    darkquad29_wvl_a2g_ctrl_en_bram_dump_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_a2g_ctrl_in_val_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_a2g_ctrl_lut_dump_buffer_size_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_data_out: in std_logic_vector(7 downto 0); 
    darkquad29_wvl_a2g_ctrl_lut_dump_data_period_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_a2g_ctrl_rst_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_a2g_ctrl_tx_en_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_acc_iq_avg0_ss_bram_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_acc_iq_avg0_ss_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_acc_iq_avg1_ss_bram_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_acc_iq_avg1_ss_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_acc_iq_avg2_ss_bram_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_acc_iq_avg2_ss_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_acc_iq_avg3_ss_bram_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_acc_iq_avg3_ss_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_acc_iq_start_acc_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_adc_in_adcdac_2g_user_data_i0: in std_logic_vector(11 downto 0); 
    darkquad29_wvl_adc_in_adcdac_2g_user_data_i1: in std_logic_vector(11 downto 0); 
    darkquad29_wvl_adc_in_adcdac_2g_user_data_i2: in std_logic_vector(11 downto 0); 
    darkquad29_wvl_adc_in_adcdac_2g_user_data_i3: in std_logic_vector(11 downto 0); 
    darkquad29_wvl_adc_in_adcdac_2g_user_data_i4: in std_logic_vector(11 downto 0); 
    darkquad29_wvl_adc_in_adcdac_2g_user_data_i5: in std_logic_vector(11 downto 0); 
    darkquad29_wvl_adc_in_adcdac_2g_user_data_i6: in std_logic_vector(11 downto 0); 
    darkquad29_wvl_adc_in_adcdac_2g_user_data_i7: in std_logic_vector(11 downto 0); 
    darkquad29_wvl_adc_in_adcdac_2g_user_data_q0: in std_logic_vector(11 downto 0); 
    darkquad29_wvl_adc_in_adcdac_2g_user_data_q1: in std_logic_vector(11 downto 0); 
    darkquad29_wvl_adc_in_adcdac_2g_user_data_q2: in std_logic_vector(11 downto 0); 
    darkquad29_wvl_adc_in_adcdac_2g_user_data_q3: in std_logic_vector(11 downto 0); 
    darkquad29_wvl_adc_in_adcdac_2g_user_data_q4: in std_logic_vector(11 downto 0); 
    darkquad29_wvl_adc_in_adcdac_2g_user_data_q5: in std_logic_vector(11 downto 0); 
    darkquad29_wvl_adc_in_adcdac_2g_user_data_q6: in std_logic_vector(11 downto 0); 
    darkquad29_wvl_adc_in_adcdac_2g_user_data_q7: in std_logic_vector(11 downto 0); 
    darkquad29_wvl_adc_in_adcdac_2g_user_info_i0: in std_logic_vector(1 downto 0); 
    darkquad29_wvl_adc_in_adcdac_2g_user_info_i1: in std_logic_vector(1 downto 0); 
    darkquad29_wvl_adc_in_adcdac_2g_user_info_i2: in std_logic_vector(1 downto 0); 
    darkquad29_wvl_adc_in_adcdac_2g_user_info_i3: in std_logic_vector(1 downto 0); 
    darkquad29_wvl_adc_in_adcdac_2g_user_info_i4: in std_logic_vector(1 downto 0); 
    darkquad29_wvl_adc_in_adcdac_2g_user_info_i5: in std_logic_vector(1 downto 0); 
    darkquad29_wvl_adc_in_adcdac_2g_user_info_i6: in std_logic_vector(1 downto 0); 
    darkquad29_wvl_adc_in_adcdac_2g_user_info_i7: in std_logic_vector(1 downto 0); 
    darkquad29_wvl_adc_in_adcdac_2g_user_info_q0: in std_logic_vector(1 downto 0); 
    darkquad29_wvl_adc_in_adcdac_2g_user_info_q1: in std_logic_vector(1 downto 0); 
    darkquad29_wvl_adc_in_adcdac_2g_user_info_q2: in std_logic_vector(1 downto 0); 
    darkquad29_wvl_adc_in_adcdac_2g_user_info_q3: in std_logic_vector(1 downto 0); 
    darkquad29_wvl_adc_in_adcdac_2g_user_info_q4: in std_logic_vector(1 downto 0); 
    darkquad29_wvl_adc_in_adcdac_2g_user_info_q5: in std_logic_vector(1 downto 0); 
    darkquad29_wvl_adc_in_adcdac_2g_user_info_q6: in std_logic_vector(1 downto 0); 
    darkquad29_wvl_adc_in_adcdac_2g_user_info_q7: in std_logic_vector(1 downto 0); 
    darkquad29_wvl_adc_in_adcdac_2g_user_mmcm_locked: in std_logic; 
    darkquad29_wvl_adc_in_adcdac_2g_user_sync: in std_logic; 
    darkquad29_wvl_adc_in_adcdac_2g_user_valid: in std_logic; 
    darkquad29_wvl_adc_in_dly_val_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_adc_in_i_scale_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_adc_in_inc_phs_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_adc_in_load_dly_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_adc_in_pos_phs_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_adc_in_snp_cal0_ss_bram_data_out: in std_logic_vector(63 downto 0); 
    darkquad29_wvl_adc_in_snp_cal0_ss_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_adc_in_snp_cal1_ss_bram_data_out: in std_logic_vector(63 downto 0); 
    darkquad29_wvl_adc_in_snp_cal1_ss_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_adc_in_snp_cal2_ss_bram_data_out: in std_logic_vector(63 downto 0); 
    darkquad29_wvl_adc_in_snp_cal2_ss_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_adc_in_snp_cal3_ss_bram_data_out: in std_logic_vector(63 downto 0); 
    darkquad29_wvl_adc_in_snp_cal3_ss_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_adc_in_trig_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_board_num_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_capture0_base_kf_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_capture0_base_kq_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_capture0_cps_lim_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_data_out: in std_logic_vector(63 downto 0); 
    darkquad29_wvl_capture0_load_thresh_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_capture0_pix_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_capture0_threshold_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_capture0_use_energy_cal_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_capture1_base_kf_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_capture1_base_kq_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_capture1_cps_lim_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_data_out: in std_logic_vector(63 downto 0); 
    darkquad29_wvl_capture1_load_thresh_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_capture1_pix_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_capture1_threshold_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_capture1_use_energy_cal_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_capture2_base_kf_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_capture2_base_kq_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_capture2_cps_lim_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_data_out: in std_logic_vector(63 downto 0); 
    darkquad29_wvl_capture2_load_thresh_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_capture2_pix_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_capture2_threshold_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_capture2_use_energy_cal_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_capture3_base_kf_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_capture3_base_kq_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_capture3_cps_lim_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_data_out: in std_logic_vector(63 downto 0); 
    darkquad29_wvl_capture3_load_thresh_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_capture3_pix_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_capture3_threshold_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_capture3_use_energy_cal_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_chan_sel_ch_bin0_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_chan_sel_ch_bin1_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_chan_sel_ch_bin2_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_chan_sel_ch_bin3_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_chan_sel_load_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_check_lag_latch_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_conv_phase0_centers_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_conv_phase0_load_centers_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_conv_phase1_centers_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_conv_phase1_load_centers_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_conv_phase2_centers_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_conv_phase2_load_centers_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_conv_phase3_centers_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_conv_phase3_load_centers_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_dds_lut_qdr0_ack: in std_logic; 
    darkquad29_wvl_dds_lut_qdr0_cal_fail: in std_logic; 
    darkquad29_wvl_dds_lut_qdr0_data_out: in std_logic_vector(71 downto 0); 
    darkquad29_wvl_dds_lut_qdr0_data_valid: in std_logic; 
    darkquad29_wvl_dds_lut_qdr0_phy_ready: in std_logic; 
    darkquad29_wvl_dds_lut_qdr1_ack: in std_logic; 
    darkquad29_wvl_dds_lut_qdr1_cal_fail: in std_logic; 
    darkquad29_wvl_dds_lut_qdr1_data_out: in std_logic_vector(71 downto 0); 
    darkquad29_wvl_dds_lut_qdr1_data_valid: in std_logic; 
    darkquad29_wvl_dds_lut_qdr1_phy_ready: in std_logic; 
    darkquad29_wvl_dds_lut_qdr2_ack: in std_logic; 
    darkquad29_wvl_dds_lut_qdr2_cal_fail: in std_logic; 
    darkquad29_wvl_dds_lut_qdr2_data_out: in std_logic_vector(71 downto 0); 
    darkquad29_wvl_dds_lut_qdr2_data_valid: in std_logic; 
    darkquad29_wvl_dds_lut_qdr2_phy_ready: in std_logic; 
    darkquad29_wvl_dds_lut_qdr3_ack: in std_logic; 
    darkquad29_wvl_dds_lut_qdr3_cal_fail: in std_logic; 
    darkquad29_wvl_dds_lut_qdr3_data_out: in std_logic_vector(71 downto 0); 
    darkquad29_wvl_dds_lut_qdr3_data_valid: in std_logic; 
    darkquad29_wvl_dds_lut_qdr3_phy_ready: in std_logic; 
    darkquad29_wvl_dds_lut_run_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_dds_shift_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_gbe64_dest_ip_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_gbe64_one_gbe_app_dbg_data: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_gbe64_one_gbe_app_dbg_dvld: in std_logic; 
    darkquad29_wvl_gbe64_one_gbe_app_rx_badframe: in std_logic; 
    darkquad29_wvl_gbe64_one_gbe_app_rx_data: in std_logic_vector(7 downto 0); 
    darkquad29_wvl_gbe64_one_gbe_app_rx_dvld: in std_logic; 
    darkquad29_wvl_gbe64_one_gbe_app_rx_eof: in std_logic; 
    darkquad29_wvl_gbe64_one_gbe_app_rx_overrun: in std_logic; 
    darkquad29_wvl_gbe64_one_gbe_app_rx_srcip: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_gbe64_one_gbe_app_rx_srcport: in std_logic_vector(15 downto 0); 
    darkquad29_wvl_gbe64_one_gbe_app_tx_afull: in std_logic; 
    darkquad29_wvl_gbe64_one_gbe_app_tx_overflow: in std_logic; 
    darkquad29_wvl_gbe64_rst_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_gbe64_words_per_frame_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_phase_dmp_ch_we_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_phase_dmp_on_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_phase_port_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_photon_port_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_prog_fir0_load_chan_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_prog_fir0_single_chan_coeffs_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_prog_fir1_load_chan_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_prog_fir1_single_chan_coeffs_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_prog_fir2_load_chan_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_prog_fir2_single_chan_coeffs_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_prog_fir3_load_chan_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_prog_fir3_single_chan_coeffs_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_run_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_sel_ch_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_snp_phs_ss_bram_data_out: in std_logic_vector(63 downto 0); 
    darkquad29_wvl_snp_phs_ss_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_start_cap_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_timekeeper_base_ts_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_trig_snp_user_data_out: in std_logic_vector(31 downto 0); 
    darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_rst: out std_logic; 
    darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_data: out std_logic_vector(7 downto 0); 
    darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_rst: out std_logic; 
    darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_val: out std_logic; 
    darkquad29_wvl_a2g_ctrl_last_tx_data_user_data_in: out std_logic_vector(31 downto 0); 
    darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_addr: out std_logic_vector(11 downto 0); 
    darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_data_in: out std_logic_vector(7 downto 0); 
    darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_we: out std_logic; 
    darkquad29_wvl_a2g_ctrl_lut_dump_sending_data_user_data_in: out std_logic_vector(31 downto 0); 
    darkquad29_wvl_a2g_ctrl_reg_rx_full_user_data_in: out std_logic_vector(31 downto 0); 
    darkquad29_wvl_a2g_ctrl_reg_tx_full_user_data_in: out std_logic_vector(31 downto 0); 
    darkquad29_wvl_a2g_ctrl_v7_ready_user_data_in: out std_logic_vector(31 downto 0); 
    darkquad29_wvl_acc_iq_avg0_ss_bram_addr: out std_logic_vector(9 downto 0); 
    darkquad29_wvl_acc_iq_avg0_ss_bram_data_in: out std_logic_vector(31 downto 0); 
    darkquad29_wvl_acc_iq_avg0_ss_bram_we: out std_logic; 
    darkquad29_wvl_acc_iq_avg0_ss_status_user_data_in: out std_logic_vector(31 downto 0); 
    darkquad29_wvl_acc_iq_avg1_ss_bram_addr: out std_logic_vector(9 downto 0); 
    darkquad29_wvl_acc_iq_avg1_ss_bram_data_in: out std_logic_vector(31 downto 0); 
    darkquad29_wvl_acc_iq_avg1_ss_bram_we: out std_logic; 
    darkquad29_wvl_acc_iq_avg1_ss_status_user_data_in: out std_logic_vector(31 downto 0); 
    darkquad29_wvl_acc_iq_avg2_ss_bram_addr: out std_logic_vector(9 downto 0); 
    darkquad29_wvl_acc_iq_avg2_ss_bram_data_in: out std_logic_vector(31 downto 0); 
    darkquad29_wvl_acc_iq_avg2_ss_bram_we: out std_logic; 
    darkquad29_wvl_acc_iq_avg2_ss_status_user_data_in: out std_logic_vector(31 downto 0); 
    darkquad29_wvl_acc_iq_avg3_ss_bram_addr: out std_logic_vector(9 downto 0); 
    darkquad29_wvl_acc_iq_avg3_ss_bram_data_in: out std_logic_vector(31 downto 0); 
    darkquad29_wvl_acc_iq_avg3_ss_bram_we: out std_logic; 
    darkquad29_wvl_acc_iq_avg3_ss_status_user_data_in: out std_logic_vector(31 downto 0); 
    darkquad29_wvl_adc_in_adcdac_2g_user_dly_val: out std_logic_vector(4 downto 0); 
    darkquad29_wvl_adc_in_adcdac_2g_user_inc_mmcm_phs: out std_logic; 
    darkquad29_wvl_adc_in_adcdac_2g_user_load_dly0: out std_logic_vector(5 downto 0); 
    darkquad29_wvl_adc_in_adcdac_2g_user_pos_mmcm_phs: out std_logic; 
    darkquad29_wvl_adc_in_adcdac_2g_user_rdy_i0: out std_logic; 
    darkquad29_wvl_adc_in_locked_user_data_in: out std_logic_vector(31 downto 0); 
    darkquad29_wvl_adc_in_n_miss_pps_user_data_in: out std_logic_vector(31 downto 0); 
    darkquad29_wvl_adc_in_raw_pps_user_data_in: out std_logic_vector(31 downto 0); 
    darkquad29_wvl_adc_in_snp_cal0_ss_bram_addr: out std_logic_vector(8 downto 0); 
    darkquad29_wvl_adc_in_snp_cal0_ss_bram_data_in: out std_logic_vector(63 downto 0); 
    darkquad29_wvl_adc_in_snp_cal0_ss_bram_we: out std_logic; 
    darkquad29_wvl_adc_in_snp_cal0_ss_status_user_data_in: out std_logic_vector(31 downto 0); 
    darkquad29_wvl_adc_in_snp_cal1_ss_bram_addr: out std_logic_vector(8 downto 0); 
    darkquad29_wvl_adc_in_snp_cal1_ss_bram_data_in: out std_logic_vector(63 downto 0); 
    darkquad29_wvl_adc_in_snp_cal1_ss_bram_we: out std_logic; 
    darkquad29_wvl_adc_in_snp_cal1_ss_status_user_data_in: out std_logic_vector(31 downto 0); 
    darkquad29_wvl_adc_in_snp_cal2_ss_bram_addr: out std_logic_vector(8 downto 0); 
    darkquad29_wvl_adc_in_snp_cal2_ss_bram_data_in: out std_logic_vector(63 downto 0); 
    darkquad29_wvl_adc_in_snp_cal2_ss_bram_we: out std_logic; 
    darkquad29_wvl_adc_in_snp_cal2_ss_status_user_data_in: out std_logic_vector(31 downto 0); 
    darkquad29_wvl_adc_in_snp_cal3_ss_bram_addr: out std_logic_vector(8 downto 0); 
    darkquad29_wvl_adc_in_snp_cal3_ss_bram_data_in: out std_logic_vector(63 downto 0); 
    darkquad29_wvl_adc_in_snp_cal3_ss_bram_we: out std_logic; 
    darkquad29_wvl_adc_in_snp_cal3_ss_status_user_data_in: out std_logic_vector(31 downto 0); 
    darkquad29_wvl_adc_in_ts0_user_data_in: out std_logic_vector(31 downto 0); 
    darkquad29_wvl_adc_in_ts1_user_data_in: out std_logic_vector(31 downto 0); 
    darkquad29_wvl_adc_in_ts2_user_data_in: out std_logic_vector(31 downto 0); 
    darkquad29_wvl_adc_in_ts3_user_data_in: out std_logic_vector(31 downto 0); 
    darkquad29_wvl_adc_in_valid_user_data_in: out std_logic_vector(31 downto 0); 
    darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_addr: out std_logic_vector(9 downto 0); 
    darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_data_in: out std_logic_vector(63 downto 0); 
    darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_we: out std_logic; 
    darkquad29_wvl_capture0_pix_addr: out std_logic_vector(9 downto 0); 
    darkquad29_wvl_capture0_pix_data_in: out std_logic_vector(31 downto 0); 
    darkquad29_wvl_capture0_pix_we: out std_logic; 
    darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_addr: out std_logic_vector(9 downto 0); 
    darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_data_in: out std_logic_vector(63 downto 0); 
    darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_we: out std_logic; 
    darkquad29_wvl_capture1_pix_addr: out std_logic_vector(9 downto 0); 
    darkquad29_wvl_capture1_pix_data_in: out std_logic_vector(31 downto 0); 
    darkquad29_wvl_capture1_pix_we: out std_logic; 
    darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_addr: out std_logic_vector(9 downto 0); 
    darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_data_in: out std_logic_vector(63 downto 0); 
    darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_we: out std_logic; 
    darkquad29_wvl_capture2_pix_addr: out std_logic_vector(9 downto 0); 
    darkquad29_wvl_capture2_pix_data_in: out std_logic_vector(31 downto 0); 
    darkquad29_wvl_capture2_pix_we: out std_logic; 
    darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_addr: out std_logic_vector(9 downto 0); 
    darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_data_in: out std_logic_vector(63 downto 0); 
    darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_we: out std_logic; 
    darkquad29_wvl_capture3_pix_addr: out std_logic_vector(9 downto 0); 
    darkquad29_wvl_capture3_pix_data_in: out std_logic_vector(31 downto 0); 
    darkquad29_wvl_capture3_pix_we: out std_logic; 
    darkquad29_wvl_check_lag_data_ch_user_data_in: out std_logic_vector(31 downto 0); 
    darkquad29_wvl_check_lag_dds_ch_user_data_in: out std_logic_vector(31 downto 0); 
    darkquad29_wvl_dds_lut_qdr0_address: out std_logic_vector(31 downto 0); 
    darkquad29_wvl_dds_lut_qdr0_be: out std_logic_vector(7 downto 0); 
    darkquad29_wvl_dds_lut_qdr0_data_in: out std_logic_vector(71 downto 0); 
    darkquad29_wvl_dds_lut_qdr0_rd_en: out std_logic; 
    darkquad29_wvl_dds_lut_qdr0_wr_en: out std_logic; 
    darkquad29_wvl_dds_lut_qdr1_address: out std_logic_vector(31 downto 0); 
    darkquad29_wvl_dds_lut_qdr1_be: out std_logic_vector(7 downto 0); 
    darkquad29_wvl_dds_lut_qdr1_data_in: out std_logic_vector(71 downto 0); 
    darkquad29_wvl_dds_lut_qdr1_rd_en: out std_logic; 
    darkquad29_wvl_dds_lut_qdr1_wr_en: out std_logic; 
    darkquad29_wvl_dds_lut_qdr2_address: out std_logic_vector(31 downto 0); 
    darkquad29_wvl_dds_lut_qdr2_be: out std_logic_vector(7 downto 0); 
    darkquad29_wvl_dds_lut_qdr2_data_in: out std_logic_vector(71 downto 0); 
    darkquad29_wvl_dds_lut_qdr2_rd_en: out std_logic; 
    darkquad29_wvl_dds_lut_qdr2_wr_en: out std_logic; 
    darkquad29_wvl_dds_lut_qdr3_address: out std_logic_vector(31 downto 0); 
    darkquad29_wvl_dds_lut_qdr3_be: out std_logic_vector(7 downto 0); 
    darkquad29_wvl_dds_lut_qdr3_data_in: out std_logic_vector(71 downto 0); 
    darkquad29_wvl_dds_lut_qdr3_rd_en: out std_logic; 
    darkquad29_wvl_dds_lut_qdr3_wr_en: out std_logic; 
    darkquad29_wvl_gbe64_one_gbe_app_rx_ack: out std_logic; 
    darkquad29_wvl_gbe64_one_gbe_app_rx_rst: out std_logic; 
    darkquad29_wvl_gbe64_one_gbe_app_tx_data: out std_logic_vector(7 downto 0); 
    darkquad29_wvl_gbe64_one_gbe_app_tx_destip: out std_logic_vector(31 downto 0); 
    darkquad29_wvl_gbe64_one_gbe_app_tx_destport: out std_logic_vector(15 downto 0); 
    darkquad29_wvl_gbe64_one_gbe_app_tx_dvld: out std_logic; 
    darkquad29_wvl_gbe64_one_gbe_app_tx_eof: out std_logic; 
    darkquad29_wvl_gbe64_one_gbe_app_tx_rst: out std_logic; 
    darkquad29_wvl_gbe64_tx_afull_user_data_in: out std_logic_vector(31 downto 0); 
    darkquad29_wvl_gbe64_tx_overrun_user_data_in: out std_logic_vector(31 downto 0); 
    darkquad29_wvl_n_eof_sent_user_data_in: out std_logic_vector(31 downto 0); 
    darkquad29_wvl_n_photons_user_data_in: out std_logic_vector(31 downto 0); 
    darkquad29_wvl_pfb_fft_check_fft_oflow_user_data_in: out std_logic_vector(31 downto 0); 
    darkquad29_wvl_prog_fir0_single_chan_coeffs_addr: out std_logic_vector(9 downto 0); 
    darkquad29_wvl_prog_fir0_single_chan_coeffs_data_in: out std_logic_vector(31 downto 0); 
    darkquad29_wvl_prog_fir0_single_chan_coeffs_we: out std_logic; 
    darkquad29_wvl_prog_fir1_single_chan_coeffs_addr: out std_logic_vector(9 downto 0); 
    darkquad29_wvl_prog_fir1_single_chan_coeffs_data_in: out std_logic_vector(31 downto 0); 
    darkquad29_wvl_prog_fir1_single_chan_coeffs_we: out std_logic; 
    darkquad29_wvl_prog_fir2_single_chan_coeffs_addr: out std_logic_vector(9 downto 0); 
    darkquad29_wvl_prog_fir2_single_chan_coeffs_data_in: out std_logic_vector(31 downto 0); 
    darkquad29_wvl_prog_fir2_single_chan_coeffs_we: out std_logic; 
    darkquad29_wvl_prog_fir3_single_chan_coeffs_addr: out std_logic_vector(9 downto 0); 
    darkquad29_wvl_prog_fir3_single_chan_coeffs_data_in: out std_logic_vector(31 downto 0); 
    darkquad29_wvl_prog_fir3_single_chan_coeffs_we: out std_logic; 
    darkquad29_wvl_snp_phs_ss_bram_addr: out std_logic_vector(8 downto 0); 
    darkquad29_wvl_snp_phs_ss_bram_data_in: out std_logic_vector(63 downto 0); 
    darkquad29_wvl_snp_phs_ss_bram_we: out std_logic; 
    darkquad29_wvl_snp_phs_ss_status_user_data_in: out std_logic_vector(31 downto 0); 
    darkquad29_wvl_timekeeper_sec_now_user_data_in: out std_logic_vector(31 downto 0)
  );
end component;
-- COMP_TAG_END ------ End COMPONENT Declaration ------------

-- The following code must appear in the VHDL architecture
-- body.  Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name : darkquad29_wvl_cw
  port map (
    ce => ce,
    clk => clk,
    darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_data => darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_data,
    darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_full => darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_full,
    darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_val => darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_val,
    darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_full => darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_full,
    darkquad29_wvl_a2g_ctrl_en_bram_dump_user_data_out => darkquad29_wvl_a2g_ctrl_en_bram_dump_user_data_out,
    darkquad29_wvl_a2g_ctrl_in_val_user_data_out => darkquad29_wvl_a2g_ctrl_in_val_user_data_out,
    darkquad29_wvl_a2g_ctrl_lut_dump_buffer_size_user_data_out => darkquad29_wvl_a2g_ctrl_lut_dump_buffer_size_user_data_out,
    darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_data_out => darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_data_out,
    darkquad29_wvl_a2g_ctrl_lut_dump_data_period_user_data_out => darkquad29_wvl_a2g_ctrl_lut_dump_data_period_user_data_out,
    darkquad29_wvl_a2g_ctrl_rst_user_data_out => darkquad29_wvl_a2g_ctrl_rst_user_data_out,
    darkquad29_wvl_a2g_ctrl_tx_en_user_data_out => darkquad29_wvl_a2g_ctrl_tx_en_user_data_out,
    darkquad29_wvl_acc_iq_avg0_ss_bram_data_out => darkquad29_wvl_acc_iq_avg0_ss_bram_data_out,
    darkquad29_wvl_acc_iq_avg0_ss_ctrl_user_data_out => darkquad29_wvl_acc_iq_avg0_ss_ctrl_user_data_out,
    darkquad29_wvl_acc_iq_avg1_ss_bram_data_out => darkquad29_wvl_acc_iq_avg1_ss_bram_data_out,
    darkquad29_wvl_acc_iq_avg1_ss_ctrl_user_data_out => darkquad29_wvl_acc_iq_avg1_ss_ctrl_user_data_out,
    darkquad29_wvl_acc_iq_avg2_ss_bram_data_out => darkquad29_wvl_acc_iq_avg2_ss_bram_data_out,
    darkquad29_wvl_acc_iq_avg2_ss_ctrl_user_data_out => darkquad29_wvl_acc_iq_avg2_ss_ctrl_user_data_out,
    darkquad29_wvl_acc_iq_avg3_ss_bram_data_out => darkquad29_wvl_acc_iq_avg3_ss_bram_data_out,
    darkquad29_wvl_acc_iq_avg3_ss_ctrl_user_data_out => darkquad29_wvl_acc_iq_avg3_ss_ctrl_user_data_out,
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
    darkquad29_wvl_adc_in_dly_val_user_data_out => darkquad29_wvl_adc_in_dly_val_user_data_out,
    darkquad29_wvl_adc_in_i_scale_user_data_out => darkquad29_wvl_adc_in_i_scale_user_data_out,
    darkquad29_wvl_adc_in_inc_phs_user_data_out => darkquad29_wvl_adc_in_inc_phs_user_data_out,
    darkquad29_wvl_adc_in_load_dly_user_data_out => darkquad29_wvl_adc_in_load_dly_user_data_out,
    darkquad29_wvl_adc_in_pos_phs_user_data_out => darkquad29_wvl_adc_in_pos_phs_user_data_out,
    darkquad29_wvl_adc_in_snp_cal0_ss_bram_data_out => darkquad29_wvl_adc_in_snp_cal0_ss_bram_data_out,
    darkquad29_wvl_adc_in_snp_cal0_ss_ctrl_user_data_out => darkquad29_wvl_adc_in_snp_cal0_ss_ctrl_user_data_out,
    darkquad29_wvl_adc_in_snp_cal1_ss_bram_data_out => darkquad29_wvl_adc_in_snp_cal1_ss_bram_data_out,
    darkquad29_wvl_adc_in_snp_cal1_ss_ctrl_user_data_out => darkquad29_wvl_adc_in_snp_cal1_ss_ctrl_user_data_out,
    darkquad29_wvl_adc_in_snp_cal2_ss_bram_data_out => darkquad29_wvl_adc_in_snp_cal2_ss_bram_data_out,
    darkquad29_wvl_adc_in_snp_cal2_ss_ctrl_user_data_out => darkquad29_wvl_adc_in_snp_cal2_ss_ctrl_user_data_out,
    darkquad29_wvl_adc_in_snp_cal3_ss_bram_data_out => darkquad29_wvl_adc_in_snp_cal3_ss_bram_data_out,
    darkquad29_wvl_adc_in_snp_cal3_ss_ctrl_user_data_out => darkquad29_wvl_adc_in_snp_cal3_ss_ctrl_user_data_out,
    darkquad29_wvl_adc_in_trig_user_data_out => darkquad29_wvl_adc_in_trig_user_data_out,
    darkquad29_wvl_board_num_user_data_out => darkquad29_wvl_board_num_user_data_out,
    darkquad29_wvl_capture0_base_kf_user_data_out => darkquad29_wvl_capture0_base_kf_user_data_out,
    darkquad29_wvl_capture0_base_kq_user_data_out => darkquad29_wvl_capture0_base_kq_user_data_out,
    darkquad29_wvl_capture0_cps_lim_user_data_out => darkquad29_wvl_capture0_cps_lim_user_data_out,
    darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_data_out => darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_data_out,
    darkquad29_wvl_capture0_load_thresh_user_data_out => darkquad29_wvl_capture0_load_thresh_user_data_out,
    darkquad29_wvl_capture0_pix_data_out => darkquad29_wvl_capture0_pix_data_out,
    darkquad29_wvl_capture0_threshold_user_data_out => darkquad29_wvl_capture0_threshold_user_data_out,
    darkquad29_wvl_capture0_use_energy_cal_user_data_out => darkquad29_wvl_capture0_use_energy_cal_user_data_out,
    darkquad29_wvl_capture1_base_kf_user_data_out => darkquad29_wvl_capture1_base_kf_user_data_out,
    darkquad29_wvl_capture1_base_kq_user_data_out => darkquad29_wvl_capture1_base_kq_user_data_out,
    darkquad29_wvl_capture1_cps_lim_user_data_out => darkquad29_wvl_capture1_cps_lim_user_data_out,
    darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_data_out => darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_data_out,
    darkquad29_wvl_capture1_load_thresh_user_data_out => darkquad29_wvl_capture1_load_thresh_user_data_out,
    darkquad29_wvl_capture1_pix_data_out => darkquad29_wvl_capture1_pix_data_out,
    darkquad29_wvl_capture1_threshold_user_data_out => darkquad29_wvl_capture1_threshold_user_data_out,
    darkquad29_wvl_capture1_use_energy_cal_user_data_out => darkquad29_wvl_capture1_use_energy_cal_user_data_out,
    darkquad29_wvl_capture2_base_kf_user_data_out => darkquad29_wvl_capture2_base_kf_user_data_out,
    darkquad29_wvl_capture2_base_kq_user_data_out => darkquad29_wvl_capture2_base_kq_user_data_out,
    darkquad29_wvl_capture2_cps_lim_user_data_out => darkquad29_wvl_capture2_cps_lim_user_data_out,
    darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_data_out => darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_data_out,
    darkquad29_wvl_capture2_load_thresh_user_data_out => darkquad29_wvl_capture2_load_thresh_user_data_out,
    darkquad29_wvl_capture2_pix_data_out => darkquad29_wvl_capture2_pix_data_out,
    darkquad29_wvl_capture2_threshold_user_data_out => darkquad29_wvl_capture2_threshold_user_data_out,
    darkquad29_wvl_capture2_use_energy_cal_user_data_out => darkquad29_wvl_capture2_use_energy_cal_user_data_out,
    darkquad29_wvl_capture3_base_kf_user_data_out => darkquad29_wvl_capture3_base_kf_user_data_out,
    darkquad29_wvl_capture3_base_kq_user_data_out => darkquad29_wvl_capture3_base_kq_user_data_out,
    darkquad29_wvl_capture3_cps_lim_user_data_out => darkquad29_wvl_capture3_cps_lim_user_data_out,
    darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_data_out => darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_data_out,
    darkquad29_wvl_capture3_load_thresh_user_data_out => darkquad29_wvl_capture3_load_thresh_user_data_out,
    darkquad29_wvl_capture3_pix_data_out => darkquad29_wvl_capture3_pix_data_out,
    darkquad29_wvl_capture3_threshold_user_data_out => darkquad29_wvl_capture3_threshold_user_data_out,
    darkquad29_wvl_capture3_use_energy_cal_user_data_out => darkquad29_wvl_capture3_use_energy_cal_user_data_out,
    darkquad29_wvl_chan_sel_ch_bin0_user_data_out => darkquad29_wvl_chan_sel_ch_bin0_user_data_out,
    darkquad29_wvl_chan_sel_ch_bin1_user_data_out => darkquad29_wvl_chan_sel_ch_bin1_user_data_out,
    darkquad29_wvl_chan_sel_ch_bin2_user_data_out => darkquad29_wvl_chan_sel_ch_bin2_user_data_out,
    darkquad29_wvl_chan_sel_ch_bin3_user_data_out => darkquad29_wvl_chan_sel_ch_bin3_user_data_out,
    darkquad29_wvl_chan_sel_load_user_data_out => darkquad29_wvl_chan_sel_load_user_data_out,
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
    darkquad29_wvl_dds_lut_qdr1_ack => darkquad29_wvl_dds_lut_qdr1_ack,
    darkquad29_wvl_dds_lut_qdr1_cal_fail => darkquad29_wvl_dds_lut_qdr1_cal_fail,
    darkquad29_wvl_dds_lut_qdr1_data_out => darkquad29_wvl_dds_lut_qdr1_data_out,
    darkquad29_wvl_dds_lut_qdr1_data_valid => darkquad29_wvl_dds_lut_qdr1_data_valid,
    darkquad29_wvl_dds_lut_qdr1_phy_ready => darkquad29_wvl_dds_lut_qdr1_phy_ready,
    darkquad29_wvl_dds_lut_qdr2_ack => darkquad29_wvl_dds_lut_qdr2_ack,
    darkquad29_wvl_dds_lut_qdr2_cal_fail => darkquad29_wvl_dds_lut_qdr2_cal_fail,
    darkquad29_wvl_dds_lut_qdr2_data_out => darkquad29_wvl_dds_lut_qdr2_data_out,
    darkquad29_wvl_dds_lut_qdr2_data_valid => darkquad29_wvl_dds_lut_qdr2_data_valid,
    darkquad29_wvl_dds_lut_qdr2_phy_ready => darkquad29_wvl_dds_lut_qdr2_phy_ready,
    darkquad29_wvl_dds_lut_qdr3_ack => darkquad29_wvl_dds_lut_qdr3_ack,
    darkquad29_wvl_dds_lut_qdr3_cal_fail => darkquad29_wvl_dds_lut_qdr3_cal_fail,
    darkquad29_wvl_dds_lut_qdr3_data_out => darkquad29_wvl_dds_lut_qdr3_data_out,
    darkquad29_wvl_dds_lut_qdr3_data_valid => darkquad29_wvl_dds_lut_qdr3_data_valid,
    darkquad29_wvl_dds_lut_qdr3_phy_ready => darkquad29_wvl_dds_lut_qdr3_phy_ready,
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
    darkquad29_wvl_gbe64_rst_user_data_out => darkquad29_wvl_gbe64_rst_user_data_out,
    darkquad29_wvl_gbe64_words_per_frame_user_data_out => darkquad29_wvl_gbe64_words_per_frame_user_data_out,
    darkquad29_wvl_phase_dmp_ch_we_user_data_out => darkquad29_wvl_phase_dmp_ch_we_user_data_out,
    darkquad29_wvl_phase_dmp_on_user_data_out => darkquad29_wvl_phase_dmp_on_user_data_out,
    darkquad29_wvl_phase_port_user_data_out => darkquad29_wvl_phase_port_user_data_out,
    darkquad29_wvl_photon_port_user_data_out => darkquad29_wvl_photon_port_user_data_out,
    darkquad29_wvl_prog_fir0_load_chan_user_data_out => darkquad29_wvl_prog_fir0_load_chan_user_data_out,
    darkquad29_wvl_prog_fir0_single_chan_coeffs_data_out => darkquad29_wvl_prog_fir0_single_chan_coeffs_data_out,
    darkquad29_wvl_prog_fir1_load_chan_user_data_out => darkquad29_wvl_prog_fir1_load_chan_user_data_out,
    darkquad29_wvl_prog_fir1_single_chan_coeffs_data_out => darkquad29_wvl_prog_fir1_single_chan_coeffs_data_out,
    darkquad29_wvl_prog_fir2_load_chan_user_data_out => darkquad29_wvl_prog_fir2_load_chan_user_data_out,
    darkquad29_wvl_prog_fir2_single_chan_coeffs_data_out => darkquad29_wvl_prog_fir2_single_chan_coeffs_data_out,
    darkquad29_wvl_prog_fir3_load_chan_user_data_out => darkquad29_wvl_prog_fir3_load_chan_user_data_out,
    darkquad29_wvl_prog_fir3_single_chan_coeffs_data_out => darkquad29_wvl_prog_fir3_single_chan_coeffs_data_out,
    darkquad29_wvl_run_user_data_out => darkquad29_wvl_run_user_data_out,
    darkquad29_wvl_sel_ch_user_data_out => darkquad29_wvl_sel_ch_user_data_out,
    darkquad29_wvl_snp_phs_ss_bram_data_out => darkquad29_wvl_snp_phs_ss_bram_data_out,
    darkquad29_wvl_snp_phs_ss_ctrl_user_data_out => darkquad29_wvl_snp_phs_ss_ctrl_user_data_out,
    darkquad29_wvl_start_cap_user_data_out => darkquad29_wvl_start_cap_user_data_out,
    darkquad29_wvl_timekeeper_base_ts_user_data_out => darkquad29_wvl_timekeeper_base_ts_user_data_out,
    darkquad29_wvl_trig_snp_user_data_out => darkquad29_wvl_trig_snp_user_data_out,
    darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_rst => darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_rst,
    darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_data => darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_data,
    darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_rst => darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_rst,
    darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_val => darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_val,
    darkquad29_wvl_a2g_ctrl_last_tx_data_user_data_in => darkquad29_wvl_a2g_ctrl_last_tx_data_user_data_in,
    darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_addr => darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_addr,
    darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_data_in => darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_data_in,
    darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_we => darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_we,
    darkquad29_wvl_a2g_ctrl_lut_dump_sending_data_user_data_in => darkquad29_wvl_a2g_ctrl_lut_dump_sending_data_user_data_in,
    darkquad29_wvl_a2g_ctrl_reg_rx_full_user_data_in => darkquad29_wvl_a2g_ctrl_reg_rx_full_user_data_in,
    darkquad29_wvl_a2g_ctrl_reg_tx_full_user_data_in => darkquad29_wvl_a2g_ctrl_reg_tx_full_user_data_in,
    darkquad29_wvl_a2g_ctrl_v7_ready_user_data_in => darkquad29_wvl_a2g_ctrl_v7_ready_user_data_in,
    darkquad29_wvl_acc_iq_avg0_ss_bram_addr => darkquad29_wvl_acc_iq_avg0_ss_bram_addr,
    darkquad29_wvl_acc_iq_avg0_ss_bram_data_in => darkquad29_wvl_acc_iq_avg0_ss_bram_data_in,
    darkquad29_wvl_acc_iq_avg0_ss_bram_we => darkquad29_wvl_acc_iq_avg0_ss_bram_we,
    darkquad29_wvl_acc_iq_avg0_ss_status_user_data_in => darkquad29_wvl_acc_iq_avg0_ss_status_user_data_in,
    darkquad29_wvl_acc_iq_avg1_ss_bram_addr => darkquad29_wvl_acc_iq_avg1_ss_bram_addr,
    darkquad29_wvl_acc_iq_avg1_ss_bram_data_in => darkquad29_wvl_acc_iq_avg1_ss_bram_data_in,
    darkquad29_wvl_acc_iq_avg1_ss_bram_we => darkquad29_wvl_acc_iq_avg1_ss_bram_we,
    darkquad29_wvl_acc_iq_avg1_ss_status_user_data_in => darkquad29_wvl_acc_iq_avg1_ss_status_user_data_in,
    darkquad29_wvl_acc_iq_avg2_ss_bram_addr => darkquad29_wvl_acc_iq_avg2_ss_bram_addr,
    darkquad29_wvl_acc_iq_avg2_ss_bram_data_in => darkquad29_wvl_acc_iq_avg2_ss_bram_data_in,
    darkquad29_wvl_acc_iq_avg2_ss_bram_we => darkquad29_wvl_acc_iq_avg2_ss_bram_we,
    darkquad29_wvl_acc_iq_avg2_ss_status_user_data_in => darkquad29_wvl_acc_iq_avg2_ss_status_user_data_in,
    darkquad29_wvl_acc_iq_avg3_ss_bram_addr => darkquad29_wvl_acc_iq_avg3_ss_bram_addr,
    darkquad29_wvl_acc_iq_avg3_ss_bram_data_in => darkquad29_wvl_acc_iq_avg3_ss_bram_data_in,
    darkquad29_wvl_acc_iq_avg3_ss_bram_we => darkquad29_wvl_acc_iq_avg3_ss_bram_we,
    darkquad29_wvl_acc_iq_avg3_ss_status_user_data_in => darkquad29_wvl_acc_iq_avg3_ss_status_user_data_in,
    darkquad29_wvl_adc_in_adcdac_2g_user_dly_val => darkquad29_wvl_adc_in_adcdac_2g_user_dly_val,
    darkquad29_wvl_adc_in_adcdac_2g_user_inc_mmcm_phs => darkquad29_wvl_adc_in_adcdac_2g_user_inc_mmcm_phs,
    darkquad29_wvl_adc_in_adcdac_2g_user_load_dly0 => darkquad29_wvl_adc_in_adcdac_2g_user_load_dly0,
    darkquad29_wvl_adc_in_adcdac_2g_user_pos_mmcm_phs => darkquad29_wvl_adc_in_adcdac_2g_user_pos_mmcm_phs,
    darkquad29_wvl_adc_in_adcdac_2g_user_rdy_i0 => darkquad29_wvl_adc_in_adcdac_2g_user_rdy_i0,
    darkquad29_wvl_adc_in_locked_user_data_in => darkquad29_wvl_adc_in_locked_user_data_in,
    darkquad29_wvl_adc_in_n_miss_pps_user_data_in => darkquad29_wvl_adc_in_n_miss_pps_user_data_in,
    darkquad29_wvl_adc_in_raw_pps_user_data_in => darkquad29_wvl_adc_in_raw_pps_user_data_in,
    darkquad29_wvl_adc_in_snp_cal0_ss_bram_addr => darkquad29_wvl_adc_in_snp_cal0_ss_bram_addr,
    darkquad29_wvl_adc_in_snp_cal0_ss_bram_data_in => darkquad29_wvl_adc_in_snp_cal0_ss_bram_data_in,
    darkquad29_wvl_adc_in_snp_cal0_ss_bram_we => darkquad29_wvl_adc_in_snp_cal0_ss_bram_we,
    darkquad29_wvl_adc_in_snp_cal0_ss_status_user_data_in => darkquad29_wvl_adc_in_snp_cal0_ss_status_user_data_in,
    darkquad29_wvl_adc_in_snp_cal1_ss_bram_addr => darkquad29_wvl_adc_in_snp_cal1_ss_bram_addr,
    darkquad29_wvl_adc_in_snp_cal1_ss_bram_data_in => darkquad29_wvl_adc_in_snp_cal1_ss_bram_data_in,
    darkquad29_wvl_adc_in_snp_cal1_ss_bram_we => darkquad29_wvl_adc_in_snp_cal1_ss_bram_we,
    darkquad29_wvl_adc_in_snp_cal1_ss_status_user_data_in => darkquad29_wvl_adc_in_snp_cal1_ss_status_user_data_in,
    darkquad29_wvl_adc_in_snp_cal2_ss_bram_addr => darkquad29_wvl_adc_in_snp_cal2_ss_bram_addr,
    darkquad29_wvl_adc_in_snp_cal2_ss_bram_data_in => darkquad29_wvl_adc_in_snp_cal2_ss_bram_data_in,
    darkquad29_wvl_adc_in_snp_cal2_ss_bram_we => darkquad29_wvl_adc_in_snp_cal2_ss_bram_we,
    darkquad29_wvl_adc_in_snp_cal2_ss_status_user_data_in => darkquad29_wvl_adc_in_snp_cal2_ss_status_user_data_in,
    darkquad29_wvl_adc_in_snp_cal3_ss_bram_addr => darkquad29_wvl_adc_in_snp_cal3_ss_bram_addr,
    darkquad29_wvl_adc_in_snp_cal3_ss_bram_data_in => darkquad29_wvl_adc_in_snp_cal3_ss_bram_data_in,
    darkquad29_wvl_adc_in_snp_cal3_ss_bram_we => darkquad29_wvl_adc_in_snp_cal3_ss_bram_we,
    darkquad29_wvl_adc_in_snp_cal3_ss_status_user_data_in => darkquad29_wvl_adc_in_snp_cal3_ss_status_user_data_in,
    darkquad29_wvl_adc_in_ts0_user_data_in => darkquad29_wvl_adc_in_ts0_user_data_in,
    darkquad29_wvl_adc_in_ts1_user_data_in => darkquad29_wvl_adc_in_ts1_user_data_in,
    darkquad29_wvl_adc_in_ts2_user_data_in => darkquad29_wvl_adc_in_ts2_user_data_in,
    darkquad29_wvl_adc_in_ts3_user_data_in => darkquad29_wvl_adc_in_ts3_user_data_in,
    darkquad29_wvl_adc_in_valid_user_data_in => darkquad29_wvl_adc_in_valid_user_data_in,
    darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_addr => darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_addr,
    darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_data_in => darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_data_in,
    darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_we => darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_we,
    darkquad29_wvl_capture0_pix_addr => darkquad29_wvl_capture0_pix_addr,
    darkquad29_wvl_capture0_pix_data_in => darkquad29_wvl_capture0_pix_data_in,
    darkquad29_wvl_capture0_pix_we => darkquad29_wvl_capture0_pix_we,
    darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_addr => darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_addr,
    darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_data_in => darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_data_in,
    darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_we => darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_we,
    darkquad29_wvl_capture1_pix_addr => darkquad29_wvl_capture1_pix_addr,
    darkquad29_wvl_capture1_pix_data_in => darkquad29_wvl_capture1_pix_data_in,
    darkquad29_wvl_capture1_pix_we => darkquad29_wvl_capture1_pix_we,
    darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_addr => darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_addr,
    darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_data_in => darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_data_in,
    darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_we => darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_we,
    darkquad29_wvl_capture2_pix_addr => darkquad29_wvl_capture2_pix_addr,
    darkquad29_wvl_capture2_pix_data_in => darkquad29_wvl_capture2_pix_data_in,
    darkquad29_wvl_capture2_pix_we => darkquad29_wvl_capture2_pix_we,
    darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_addr => darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_addr,
    darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_data_in => darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_data_in,
    darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_we => darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_we,
    darkquad29_wvl_capture3_pix_addr => darkquad29_wvl_capture3_pix_addr,
    darkquad29_wvl_capture3_pix_data_in => darkquad29_wvl_capture3_pix_data_in,
    darkquad29_wvl_capture3_pix_we => darkquad29_wvl_capture3_pix_we,
    darkquad29_wvl_check_lag_data_ch_user_data_in => darkquad29_wvl_check_lag_data_ch_user_data_in,
    darkquad29_wvl_check_lag_dds_ch_user_data_in => darkquad29_wvl_check_lag_dds_ch_user_data_in,
    darkquad29_wvl_dds_lut_qdr0_address => darkquad29_wvl_dds_lut_qdr0_address,
    darkquad29_wvl_dds_lut_qdr0_be => darkquad29_wvl_dds_lut_qdr0_be,
    darkquad29_wvl_dds_lut_qdr0_data_in => darkquad29_wvl_dds_lut_qdr0_data_in,
    darkquad29_wvl_dds_lut_qdr0_rd_en => darkquad29_wvl_dds_lut_qdr0_rd_en,
    darkquad29_wvl_dds_lut_qdr0_wr_en => darkquad29_wvl_dds_lut_qdr0_wr_en,
    darkquad29_wvl_dds_lut_qdr1_address => darkquad29_wvl_dds_lut_qdr1_address,
    darkquad29_wvl_dds_lut_qdr1_be => darkquad29_wvl_dds_lut_qdr1_be,
    darkquad29_wvl_dds_lut_qdr1_data_in => darkquad29_wvl_dds_lut_qdr1_data_in,
    darkquad29_wvl_dds_lut_qdr1_rd_en => darkquad29_wvl_dds_lut_qdr1_rd_en,
    darkquad29_wvl_dds_lut_qdr1_wr_en => darkquad29_wvl_dds_lut_qdr1_wr_en,
    darkquad29_wvl_dds_lut_qdr2_address => darkquad29_wvl_dds_lut_qdr2_address,
    darkquad29_wvl_dds_lut_qdr2_be => darkquad29_wvl_dds_lut_qdr2_be,
    darkquad29_wvl_dds_lut_qdr2_data_in => darkquad29_wvl_dds_lut_qdr2_data_in,
    darkquad29_wvl_dds_lut_qdr2_rd_en => darkquad29_wvl_dds_lut_qdr2_rd_en,
    darkquad29_wvl_dds_lut_qdr2_wr_en => darkquad29_wvl_dds_lut_qdr2_wr_en,
    darkquad29_wvl_dds_lut_qdr3_address => darkquad29_wvl_dds_lut_qdr3_address,
    darkquad29_wvl_dds_lut_qdr3_be => darkquad29_wvl_dds_lut_qdr3_be,
    darkquad29_wvl_dds_lut_qdr3_data_in => darkquad29_wvl_dds_lut_qdr3_data_in,
    darkquad29_wvl_dds_lut_qdr3_rd_en => darkquad29_wvl_dds_lut_qdr3_rd_en,
    darkquad29_wvl_dds_lut_qdr3_wr_en => darkquad29_wvl_dds_lut_qdr3_wr_en,
    darkquad29_wvl_gbe64_one_gbe_app_rx_ack => darkquad29_wvl_gbe64_one_gbe_app_rx_ack,
    darkquad29_wvl_gbe64_one_gbe_app_rx_rst => darkquad29_wvl_gbe64_one_gbe_app_rx_rst,
    darkquad29_wvl_gbe64_one_gbe_app_tx_data => darkquad29_wvl_gbe64_one_gbe_app_tx_data,
    darkquad29_wvl_gbe64_one_gbe_app_tx_destip => darkquad29_wvl_gbe64_one_gbe_app_tx_destip,
    darkquad29_wvl_gbe64_one_gbe_app_tx_destport => darkquad29_wvl_gbe64_one_gbe_app_tx_destport,
    darkquad29_wvl_gbe64_one_gbe_app_tx_dvld => darkquad29_wvl_gbe64_one_gbe_app_tx_dvld,
    darkquad29_wvl_gbe64_one_gbe_app_tx_eof => darkquad29_wvl_gbe64_one_gbe_app_tx_eof,
    darkquad29_wvl_gbe64_one_gbe_app_tx_rst => darkquad29_wvl_gbe64_one_gbe_app_tx_rst,
    darkquad29_wvl_gbe64_tx_afull_user_data_in => darkquad29_wvl_gbe64_tx_afull_user_data_in,
    darkquad29_wvl_gbe64_tx_overrun_user_data_in => darkquad29_wvl_gbe64_tx_overrun_user_data_in,
    darkquad29_wvl_n_eof_sent_user_data_in => darkquad29_wvl_n_eof_sent_user_data_in,
    darkquad29_wvl_n_photons_user_data_in => darkquad29_wvl_n_photons_user_data_in,
    darkquad29_wvl_pfb_fft_check_fft_oflow_user_data_in => darkquad29_wvl_pfb_fft_check_fft_oflow_user_data_in,
    darkquad29_wvl_prog_fir0_single_chan_coeffs_addr => darkquad29_wvl_prog_fir0_single_chan_coeffs_addr,
    darkquad29_wvl_prog_fir0_single_chan_coeffs_data_in => darkquad29_wvl_prog_fir0_single_chan_coeffs_data_in,
    darkquad29_wvl_prog_fir0_single_chan_coeffs_we => darkquad29_wvl_prog_fir0_single_chan_coeffs_we,
    darkquad29_wvl_prog_fir1_single_chan_coeffs_addr => darkquad29_wvl_prog_fir1_single_chan_coeffs_addr,
    darkquad29_wvl_prog_fir1_single_chan_coeffs_data_in => darkquad29_wvl_prog_fir1_single_chan_coeffs_data_in,
    darkquad29_wvl_prog_fir1_single_chan_coeffs_we => darkquad29_wvl_prog_fir1_single_chan_coeffs_we,
    darkquad29_wvl_prog_fir2_single_chan_coeffs_addr => darkquad29_wvl_prog_fir2_single_chan_coeffs_addr,
    darkquad29_wvl_prog_fir2_single_chan_coeffs_data_in => darkquad29_wvl_prog_fir2_single_chan_coeffs_data_in,
    darkquad29_wvl_prog_fir2_single_chan_coeffs_we => darkquad29_wvl_prog_fir2_single_chan_coeffs_we,
    darkquad29_wvl_prog_fir3_single_chan_coeffs_addr => darkquad29_wvl_prog_fir3_single_chan_coeffs_addr,
    darkquad29_wvl_prog_fir3_single_chan_coeffs_data_in => darkquad29_wvl_prog_fir3_single_chan_coeffs_data_in,
    darkquad29_wvl_prog_fir3_single_chan_coeffs_we => darkquad29_wvl_prog_fir3_single_chan_coeffs_we,
    darkquad29_wvl_snp_phs_ss_bram_addr => darkquad29_wvl_snp_phs_ss_bram_addr,
    darkquad29_wvl_snp_phs_ss_bram_data_in => darkquad29_wvl_snp_phs_ss_bram_data_in,
    darkquad29_wvl_snp_phs_ss_bram_we => darkquad29_wvl_snp_phs_ss_bram_we,
    darkquad29_wvl_snp_phs_ss_status_user_data_in => darkquad29_wvl_snp_phs_ss_status_user_data_in,
    darkquad29_wvl_timekeeper_sec_now_user_data_in => darkquad29_wvl_timekeeper_sec_now_user_data_in);
-- INST_TAG_END ------ End INSTANTIATION Template ------------
