% darkquad29_wvl/XSG_core_config
darkquad29_wvl_XSG_core_config_type         = 'xps_xsg';
darkquad29_wvl_XSG_core_config_param        = '';

% darkquad29_wvl/a2g_ctrl/adcdac_2g_ctrl
darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_type         = 'xps_adcdac_2g_ctrl';
darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_param        = '';
darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_ip_name      = 'adcdac_2g_ctrl';

% darkquad29_wvl/a2g_ctrl/en_bram_dump
darkquad29_wvl_a2g_ctrl_en_bram_dump_type         = 'xps_sw_reg';
darkquad29_wvl_a2g_ctrl_en_bram_dump_param        = 'in';
darkquad29_wvl_a2g_ctrl_en_bram_dump_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_a2g_ctrl_en_bram_dump_addr_start   = hex2dec('01000000');
darkquad29_wvl_a2g_ctrl_en_bram_dump_addr_end     = hex2dec('010000FF');

% darkquad29_wvl/a2g_ctrl/in_val
darkquad29_wvl_a2g_ctrl_in_val_type         = 'xps_sw_reg';
darkquad29_wvl_a2g_ctrl_in_val_param        = 'in';
darkquad29_wvl_a2g_ctrl_in_val_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_a2g_ctrl_in_val_addr_start   = hex2dec('01000100');
darkquad29_wvl_a2g_ctrl_in_val_addr_end     = hex2dec('010001FF');

% darkquad29_wvl/a2g_ctrl/last_tx_data
darkquad29_wvl_a2g_ctrl_last_tx_data_type         = 'xps_sw_reg';
darkquad29_wvl_a2g_ctrl_last_tx_data_param        = 'out';
darkquad29_wvl_a2g_ctrl_last_tx_data_ip_name      = 'opb_register_simulink2ppc';
darkquad29_wvl_a2g_ctrl_last_tx_data_addr_start   = hex2dec('01000200');
darkquad29_wvl_a2g_ctrl_last_tx_data_addr_end     = hex2dec('010002FF');

% darkquad29_wvl/a2g_ctrl/lut_dump/buffer_size
darkquad29_wvl_a2g_ctrl_lut_dump_buffer_size_type         = 'xps_sw_reg';
darkquad29_wvl_a2g_ctrl_lut_dump_buffer_size_param        = 'in';
darkquad29_wvl_a2g_ctrl_lut_dump_buffer_size_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_a2g_ctrl_lut_dump_buffer_size_addr_start   = hex2dec('01000300');
darkquad29_wvl_a2g_ctrl_lut_dump_buffer_size_addr_end     = hex2dec('010003FF');

% darkquad29_wvl/a2g_ctrl/lut_dump/dac_lut_buffer
darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_type         = 'xps_bram';
darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_param        = '1024';
darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_ip_name      = 'bram_if';
darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_addr_start   = hex2dec('01001000');
darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_addr_end     = hex2dec('01001FFF');

% darkquad29_wvl/a2g_ctrl/lut_dump/data_period
darkquad29_wvl_a2g_ctrl_lut_dump_data_period_type         = 'xps_sw_reg';
darkquad29_wvl_a2g_ctrl_lut_dump_data_period_param        = 'in';
darkquad29_wvl_a2g_ctrl_lut_dump_data_period_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_a2g_ctrl_lut_dump_data_period_addr_start   = hex2dec('01002000');
darkquad29_wvl_a2g_ctrl_lut_dump_data_period_addr_end     = hex2dec('010020FF');

% darkquad29_wvl/a2g_ctrl/lut_dump/sending_data
darkquad29_wvl_a2g_ctrl_lut_dump_sending_data_type         = 'xps_sw_reg';
darkquad29_wvl_a2g_ctrl_lut_dump_sending_data_param        = 'out';
darkquad29_wvl_a2g_ctrl_lut_dump_sending_data_ip_name      = 'opb_register_simulink2ppc';
darkquad29_wvl_a2g_ctrl_lut_dump_sending_data_addr_start   = hex2dec('01002100');
darkquad29_wvl_a2g_ctrl_lut_dump_sending_data_addr_end     = hex2dec('010021FF');

% darkquad29_wvl/a2g_ctrl/reg_rx_full
darkquad29_wvl_a2g_ctrl_reg_rx_full_type         = 'xps_sw_reg';
darkquad29_wvl_a2g_ctrl_reg_rx_full_param        = 'out';
darkquad29_wvl_a2g_ctrl_reg_rx_full_ip_name      = 'opb_register_simulink2ppc';
darkquad29_wvl_a2g_ctrl_reg_rx_full_addr_start   = hex2dec('01002200');
darkquad29_wvl_a2g_ctrl_reg_rx_full_addr_end     = hex2dec('010022FF');

% darkquad29_wvl/a2g_ctrl/reg_tx_full
darkquad29_wvl_a2g_ctrl_reg_tx_full_type         = 'xps_sw_reg';
darkquad29_wvl_a2g_ctrl_reg_tx_full_param        = 'out';
darkquad29_wvl_a2g_ctrl_reg_tx_full_ip_name      = 'opb_register_simulink2ppc';
darkquad29_wvl_a2g_ctrl_reg_tx_full_addr_start   = hex2dec('01002300');
darkquad29_wvl_a2g_ctrl_reg_tx_full_addr_end     = hex2dec('010023FF');

% darkquad29_wvl/a2g_ctrl/rst
darkquad29_wvl_a2g_ctrl_rst_type         = 'xps_sw_reg';
darkquad29_wvl_a2g_ctrl_rst_param        = 'in';
darkquad29_wvl_a2g_ctrl_rst_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_a2g_ctrl_rst_addr_start   = hex2dec('01002400');
darkquad29_wvl_a2g_ctrl_rst_addr_end     = hex2dec('010024FF');

% darkquad29_wvl/a2g_ctrl/tx_en
darkquad29_wvl_a2g_ctrl_tx_en_type         = 'xps_sw_reg';
darkquad29_wvl_a2g_ctrl_tx_en_param        = 'in';
darkquad29_wvl_a2g_ctrl_tx_en_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_a2g_ctrl_tx_en_addr_start   = hex2dec('01002500');
darkquad29_wvl_a2g_ctrl_tx_en_addr_end     = hex2dec('010025FF');

% darkquad29_wvl/a2g_ctrl/v7_ready
darkquad29_wvl_a2g_ctrl_v7_ready_type         = 'xps_sw_reg';
darkquad29_wvl_a2g_ctrl_v7_ready_param        = 'out';
darkquad29_wvl_a2g_ctrl_v7_ready_ip_name      = 'opb_register_simulink2ppc';
darkquad29_wvl_a2g_ctrl_v7_ready_addr_start   = hex2dec('01002600');
darkquad29_wvl_a2g_ctrl_v7_ready_addr_end     = hex2dec('010026FF');

% darkquad29_wvl/acc_iq/avg0/ss/bram
darkquad29_wvl_acc_iq_avg0_ss_bram_type         = 'xps_bram';
darkquad29_wvl_acc_iq_avg0_ss_bram_param        = '1024';
darkquad29_wvl_acc_iq_avg0_ss_bram_ip_name      = 'bram_if';
darkquad29_wvl_acc_iq_avg0_ss_bram_addr_start   = hex2dec('01003000');
darkquad29_wvl_acc_iq_avg0_ss_bram_addr_end     = hex2dec('01003FFF');

% darkquad29_wvl/acc_iq/avg0/ss/ctrl
darkquad29_wvl_acc_iq_avg0_ss_ctrl_type         = 'xps_sw_reg';
darkquad29_wvl_acc_iq_avg0_ss_ctrl_param        = 'in';
darkquad29_wvl_acc_iq_avg0_ss_ctrl_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_acc_iq_avg0_ss_ctrl_addr_start   = hex2dec('01004000');
darkquad29_wvl_acc_iq_avg0_ss_ctrl_addr_end     = hex2dec('010040FF');

% darkquad29_wvl/acc_iq/avg0/ss/status
darkquad29_wvl_acc_iq_avg0_ss_status_type         = 'xps_sw_reg';
darkquad29_wvl_acc_iq_avg0_ss_status_param        = 'out';
darkquad29_wvl_acc_iq_avg0_ss_status_ip_name      = 'opb_register_simulink2ppc';
darkquad29_wvl_acc_iq_avg0_ss_status_addr_start   = hex2dec('01004100');
darkquad29_wvl_acc_iq_avg0_ss_status_addr_end     = hex2dec('010041FF');

% darkquad29_wvl/acc_iq/avg1/ss/bram
darkquad29_wvl_acc_iq_avg1_ss_bram_type         = 'xps_bram';
darkquad29_wvl_acc_iq_avg1_ss_bram_param        = '1024';
darkquad29_wvl_acc_iq_avg1_ss_bram_ip_name      = 'bram_if';
darkquad29_wvl_acc_iq_avg1_ss_bram_addr_start   = hex2dec('01005000');
darkquad29_wvl_acc_iq_avg1_ss_bram_addr_end     = hex2dec('01005FFF');

% darkquad29_wvl/acc_iq/avg1/ss/ctrl
darkquad29_wvl_acc_iq_avg1_ss_ctrl_type         = 'xps_sw_reg';
darkquad29_wvl_acc_iq_avg1_ss_ctrl_param        = 'in';
darkquad29_wvl_acc_iq_avg1_ss_ctrl_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_acc_iq_avg1_ss_ctrl_addr_start   = hex2dec('01006000');
darkquad29_wvl_acc_iq_avg1_ss_ctrl_addr_end     = hex2dec('010060FF');

% darkquad29_wvl/acc_iq/avg1/ss/status
darkquad29_wvl_acc_iq_avg1_ss_status_type         = 'xps_sw_reg';
darkquad29_wvl_acc_iq_avg1_ss_status_param        = 'out';
darkquad29_wvl_acc_iq_avg1_ss_status_ip_name      = 'opb_register_simulink2ppc';
darkquad29_wvl_acc_iq_avg1_ss_status_addr_start   = hex2dec('01006100');
darkquad29_wvl_acc_iq_avg1_ss_status_addr_end     = hex2dec('010061FF');

% darkquad29_wvl/acc_iq/avg2/ss/bram
darkquad29_wvl_acc_iq_avg2_ss_bram_type         = 'xps_bram';
darkquad29_wvl_acc_iq_avg2_ss_bram_param        = '1024';
darkquad29_wvl_acc_iq_avg2_ss_bram_ip_name      = 'bram_if';
darkquad29_wvl_acc_iq_avg2_ss_bram_addr_start   = hex2dec('01080000');
darkquad29_wvl_acc_iq_avg2_ss_bram_addr_end     = hex2dec('01080FFF');

% darkquad29_wvl/acc_iq/avg2/ss/ctrl
darkquad29_wvl_acc_iq_avg2_ss_ctrl_type         = 'xps_sw_reg';
darkquad29_wvl_acc_iq_avg2_ss_ctrl_param        = 'in';
darkquad29_wvl_acc_iq_avg2_ss_ctrl_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_acc_iq_avg2_ss_ctrl_addr_start   = hex2dec('01081000');
darkquad29_wvl_acc_iq_avg2_ss_ctrl_addr_end     = hex2dec('010810FF');

% darkquad29_wvl/acc_iq/avg2/ss/status
darkquad29_wvl_acc_iq_avg2_ss_status_type         = 'xps_sw_reg';
darkquad29_wvl_acc_iq_avg2_ss_status_param        = 'out';
darkquad29_wvl_acc_iq_avg2_ss_status_ip_name      = 'opb_register_simulink2ppc';
darkquad29_wvl_acc_iq_avg2_ss_status_addr_start   = hex2dec('01081100');
darkquad29_wvl_acc_iq_avg2_ss_status_addr_end     = hex2dec('010811FF');

% darkquad29_wvl/acc_iq/avg3/ss/bram
darkquad29_wvl_acc_iq_avg3_ss_bram_type         = 'xps_bram';
darkquad29_wvl_acc_iq_avg3_ss_bram_param        = '1024';
darkquad29_wvl_acc_iq_avg3_ss_bram_ip_name      = 'bram_if';
darkquad29_wvl_acc_iq_avg3_ss_bram_addr_start   = hex2dec('01082000');
darkquad29_wvl_acc_iq_avg3_ss_bram_addr_end     = hex2dec('01082FFF');

% darkquad29_wvl/acc_iq/avg3/ss/ctrl
darkquad29_wvl_acc_iq_avg3_ss_ctrl_type         = 'xps_sw_reg';
darkquad29_wvl_acc_iq_avg3_ss_ctrl_param        = 'in';
darkquad29_wvl_acc_iq_avg3_ss_ctrl_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_acc_iq_avg3_ss_ctrl_addr_start   = hex2dec('01083000');
darkquad29_wvl_acc_iq_avg3_ss_ctrl_addr_end     = hex2dec('010830FF');

% darkquad29_wvl/acc_iq/avg3/ss/status
darkquad29_wvl_acc_iq_avg3_ss_status_type         = 'xps_sw_reg';
darkquad29_wvl_acc_iq_avg3_ss_status_param        = 'out';
darkquad29_wvl_acc_iq_avg3_ss_status_ip_name      = 'opb_register_simulink2ppc';
darkquad29_wvl_acc_iq_avg3_ss_status_addr_start   = hex2dec('01083100');
darkquad29_wvl_acc_iq_avg3_ss_status_addr_end     = hex2dec('010831FF');

% darkquad29_wvl/acc_iq/start_acc
darkquad29_wvl_acc_iq_start_acc_type         = 'xps_sw_reg';
darkquad29_wvl_acc_iq_start_acc_param        = 'in';
darkquad29_wvl_acc_iq_start_acc_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_acc_iq_start_acc_addr_start   = hex2dec('01083200');
darkquad29_wvl_acc_iq_start_acc_addr_end     = hex2dec('010832FF');

% darkquad29_wvl/adc_in/adcdac_2g
darkquad29_wvl_adc_in_adcdac_2g_type         = 'xps_adcdac_2g';
darkquad29_wvl_adc_in_adcdac_2g_param        = '';
darkquad29_wvl_adc_in_adcdac_2g_ip_name      = 'adcdac_2g_interface';

% darkquad29_wvl/adc_in/dly_val
darkquad29_wvl_adc_in_dly_val_type         = 'xps_sw_reg';
darkquad29_wvl_adc_in_dly_val_param        = 'in';
darkquad29_wvl_adc_in_dly_val_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_adc_in_dly_val_addr_start   = hex2dec('01083300');
darkquad29_wvl_adc_in_dly_val_addr_end     = hex2dec('010833FF');

% darkquad29_wvl/adc_in/i_scale
darkquad29_wvl_adc_in_i_scale_type         = 'xps_sw_reg';
darkquad29_wvl_adc_in_i_scale_param        = 'in';
darkquad29_wvl_adc_in_i_scale_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_adc_in_i_scale_addr_start   = hex2dec('01083400');
darkquad29_wvl_adc_in_i_scale_addr_end     = hex2dec('010834FF');

% darkquad29_wvl/adc_in/inc_phs
darkquad29_wvl_adc_in_inc_phs_type         = 'xps_sw_reg';
darkquad29_wvl_adc_in_inc_phs_param        = 'in';
darkquad29_wvl_adc_in_inc_phs_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_adc_in_inc_phs_addr_start   = hex2dec('01083500');
darkquad29_wvl_adc_in_inc_phs_addr_end     = hex2dec('010835FF');

% darkquad29_wvl/adc_in/load_dly
darkquad29_wvl_adc_in_load_dly_type         = 'xps_sw_reg';
darkquad29_wvl_adc_in_load_dly_param        = 'in';
darkquad29_wvl_adc_in_load_dly_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_adc_in_load_dly_addr_start   = hex2dec('01083600');
darkquad29_wvl_adc_in_load_dly_addr_end     = hex2dec('010836FF');

% darkquad29_wvl/adc_in/locked
darkquad29_wvl_adc_in_locked_type         = 'xps_sw_reg';
darkquad29_wvl_adc_in_locked_param        = 'out';
darkquad29_wvl_adc_in_locked_ip_name      = 'opb_register_simulink2ppc';
darkquad29_wvl_adc_in_locked_addr_start   = hex2dec('01083700');
darkquad29_wvl_adc_in_locked_addr_end     = hex2dec('010837FF');

% darkquad29_wvl/adc_in/n_miss_pps
darkquad29_wvl_adc_in_n_miss_pps_type         = 'xps_sw_reg';
darkquad29_wvl_adc_in_n_miss_pps_param        = 'out';
darkquad29_wvl_adc_in_n_miss_pps_ip_name      = 'opb_register_simulink2ppc';
darkquad29_wvl_adc_in_n_miss_pps_addr_start   = hex2dec('01083800');
darkquad29_wvl_adc_in_n_miss_pps_addr_end     = hex2dec('010838FF');

% darkquad29_wvl/adc_in/pos_phs
darkquad29_wvl_adc_in_pos_phs_type         = 'xps_sw_reg';
darkquad29_wvl_adc_in_pos_phs_param        = 'in';
darkquad29_wvl_adc_in_pos_phs_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_adc_in_pos_phs_addr_start   = hex2dec('01083900');
darkquad29_wvl_adc_in_pos_phs_addr_end     = hex2dec('010839FF');

% darkquad29_wvl/adc_in/raw_pps
darkquad29_wvl_adc_in_raw_pps_type         = 'xps_sw_reg';
darkquad29_wvl_adc_in_raw_pps_param        = 'out';
darkquad29_wvl_adc_in_raw_pps_ip_name      = 'opb_register_simulink2ppc';
darkquad29_wvl_adc_in_raw_pps_addr_start   = hex2dec('01083A00');
darkquad29_wvl_adc_in_raw_pps_addr_end     = hex2dec('01083AFF');

% darkquad29_wvl/adc_in/snp_cal0/ss/bram
darkquad29_wvl_adc_in_snp_cal0_ss_bram_type         = 'xps_bram';
darkquad29_wvl_adc_in_snp_cal0_ss_bram_param        = '1024';
darkquad29_wvl_adc_in_snp_cal0_ss_bram_ip_name      = 'bram_if';
darkquad29_wvl_adc_in_snp_cal0_ss_bram_addr_start   = hex2dec('01084000');
darkquad29_wvl_adc_in_snp_cal0_ss_bram_addr_end     = hex2dec('01084FFF');

% darkquad29_wvl/adc_in/snp_cal0/ss/ctrl
darkquad29_wvl_adc_in_snp_cal0_ss_ctrl_type         = 'xps_sw_reg';
darkquad29_wvl_adc_in_snp_cal0_ss_ctrl_param        = 'in';
darkquad29_wvl_adc_in_snp_cal0_ss_ctrl_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_adc_in_snp_cal0_ss_ctrl_addr_start   = hex2dec('01085000');
darkquad29_wvl_adc_in_snp_cal0_ss_ctrl_addr_end     = hex2dec('010850FF');

% darkquad29_wvl/adc_in/snp_cal0/ss/status
darkquad29_wvl_adc_in_snp_cal0_ss_status_type         = 'xps_sw_reg';
darkquad29_wvl_adc_in_snp_cal0_ss_status_param        = 'out';
darkquad29_wvl_adc_in_snp_cal0_ss_status_ip_name      = 'opb_register_simulink2ppc';
darkquad29_wvl_adc_in_snp_cal0_ss_status_addr_start   = hex2dec('01085100');
darkquad29_wvl_adc_in_snp_cal0_ss_status_addr_end     = hex2dec('010851FF');

% darkquad29_wvl/adc_in/snp_cal1/ss/bram
darkquad29_wvl_adc_in_snp_cal1_ss_bram_type         = 'xps_bram';
darkquad29_wvl_adc_in_snp_cal1_ss_bram_param        = '1024';
darkquad29_wvl_adc_in_snp_cal1_ss_bram_ip_name      = 'bram_if';
darkquad29_wvl_adc_in_snp_cal1_ss_bram_addr_start   = hex2dec('01086000');
darkquad29_wvl_adc_in_snp_cal1_ss_bram_addr_end     = hex2dec('01086FFF');

% darkquad29_wvl/adc_in/snp_cal1/ss/ctrl
darkquad29_wvl_adc_in_snp_cal1_ss_ctrl_type         = 'xps_sw_reg';
darkquad29_wvl_adc_in_snp_cal1_ss_ctrl_param        = 'in';
darkquad29_wvl_adc_in_snp_cal1_ss_ctrl_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_adc_in_snp_cal1_ss_ctrl_addr_start   = hex2dec('01087000');
darkquad29_wvl_adc_in_snp_cal1_ss_ctrl_addr_end     = hex2dec('010870FF');

% darkquad29_wvl/adc_in/snp_cal1/ss/status
darkquad29_wvl_adc_in_snp_cal1_ss_status_type         = 'xps_sw_reg';
darkquad29_wvl_adc_in_snp_cal1_ss_status_param        = 'out';
darkquad29_wvl_adc_in_snp_cal1_ss_status_ip_name      = 'opb_register_simulink2ppc';
darkquad29_wvl_adc_in_snp_cal1_ss_status_addr_start   = hex2dec('01087100');
darkquad29_wvl_adc_in_snp_cal1_ss_status_addr_end     = hex2dec('010871FF');

% darkquad29_wvl/adc_in/snp_cal2/ss/bram
darkquad29_wvl_adc_in_snp_cal2_ss_bram_type         = 'xps_bram';
darkquad29_wvl_adc_in_snp_cal2_ss_bram_param        = '1024';
darkquad29_wvl_adc_in_snp_cal2_ss_bram_ip_name      = 'bram_if';
darkquad29_wvl_adc_in_snp_cal2_ss_bram_addr_start   = hex2dec('01088000');
darkquad29_wvl_adc_in_snp_cal2_ss_bram_addr_end     = hex2dec('01088FFF');

% darkquad29_wvl/adc_in/snp_cal2/ss/ctrl
darkquad29_wvl_adc_in_snp_cal2_ss_ctrl_type         = 'xps_sw_reg';
darkquad29_wvl_adc_in_snp_cal2_ss_ctrl_param        = 'in';
darkquad29_wvl_adc_in_snp_cal2_ss_ctrl_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_adc_in_snp_cal2_ss_ctrl_addr_start   = hex2dec('01089000');
darkquad29_wvl_adc_in_snp_cal2_ss_ctrl_addr_end     = hex2dec('010890FF');

% darkquad29_wvl/adc_in/snp_cal2/ss/status
darkquad29_wvl_adc_in_snp_cal2_ss_status_type         = 'xps_sw_reg';
darkquad29_wvl_adc_in_snp_cal2_ss_status_param        = 'out';
darkquad29_wvl_adc_in_snp_cal2_ss_status_ip_name      = 'opb_register_simulink2ppc';
darkquad29_wvl_adc_in_snp_cal2_ss_status_addr_start   = hex2dec('01089100');
darkquad29_wvl_adc_in_snp_cal2_ss_status_addr_end     = hex2dec('010891FF');

% darkquad29_wvl/adc_in/snp_cal3/ss/bram
darkquad29_wvl_adc_in_snp_cal3_ss_bram_type         = 'xps_bram';
darkquad29_wvl_adc_in_snp_cal3_ss_bram_param        = '1024';
darkquad29_wvl_adc_in_snp_cal3_ss_bram_ip_name      = 'bram_if';
darkquad29_wvl_adc_in_snp_cal3_ss_bram_addr_start   = hex2dec('0108A000');
darkquad29_wvl_adc_in_snp_cal3_ss_bram_addr_end     = hex2dec('0108AFFF');

% darkquad29_wvl/adc_in/snp_cal3/ss/ctrl
darkquad29_wvl_adc_in_snp_cal3_ss_ctrl_type         = 'xps_sw_reg';
darkquad29_wvl_adc_in_snp_cal3_ss_ctrl_param        = 'in';
darkquad29_wvl_adc_in_snp_cal3_ss_ctrl_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_adc_in_snp_cal3_ss_ctrl_addr_start   = hex2dec('0108B000');
darkquad29_wvl_adc_in_snp_cal3_ss_ctrl_addr_end     = hex2dec('0108B0FF');

% darkquad29_wvl/adc_in/snp_cal3/ss/status
darkquad29_wvl_adc_in_snp_cal3_ss_status_type         = 'xps_sw_reg';
darkquad29_wvl_adc_in_snp_cal3_ss_status_param        = 'out';
darkquad29_wvl_adc_in_snp_cal3_ss_status_ip_name      = 'opb_register_simulink2ppc';
darkquad29_wvl_adc_in_snp_cal3_ss_status_addr_start   = hex2dec('0108B100');
darkquad29_wvl_adc_in_snp_cal3_ss_status_addr_end     = hex2dec('0108B1FF');

% darkquad29_wvl/adc_in/trig
darkquad29_wvl_adc_in_trig_type         = 'xps_sw_reg';
darkquad29_wvl_adc_in_trig_param        = 'in';
darkquad29_wvl_adc_in_trig_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_adc_in_trig_addr_start   = hex2dec('0108B200');
darkquad29_wvl_adc_in_trig_addr_end     = hex2dec('0108B2FF');

% darkquad29_wvl/adc_in/ts0
darkquad29_wvl_adc_in_ts0_type         = 'xps_sw_reg';
darkquad29_wvl_adc_in_ts0_param        = 'out';
darkquad29_wvl_adc_in_ts0_ip_name      = 'opb_register_simulink2ppc';
darkquad29_wvl_adc_in_ts0_addr_start   = hex2dec('0108B300');
darkquad29_wvl_adc_in_ts0_addr_end     = hex2dec('0108B3FF');

% darkquad29_wvl/adc_in/ts1
darkquad29_wvl_adc_in_ts1_type         = 'xps_sw_reg';
darkquad29_wvl_adc_in_ts1_param        = 'out';
darkquad29_wvl_adc_in_ts1_ip_name      = 'opb_register_simulink2ppc';
darkquad29_wvl_adc_in_ts1_addr_start   = hex2dec('0108B400');
darkquad29_wvl_adc_in_ts1_addr_end     = hex2dec('0108B4FF');

% darkquad29_wvl/adc_in/ts2
darkquad29_wvl_adc_in_ts2_type         = 'xps_sw_reg';
darkquad29_wvl_adc_in_ts2_param        = 'out';
darkquad29_wvl_adc_in_ts2_ip_name      = 'opb_register_simulink2ppc';
darkquad29_wvl_adc_in_ts2_addr_start   = hex2dec('0108B500');
darkquad29_wvl_adc_in_ts2_addr_end     = hex2dec('0108B5FF');

% darkquad29_wvl/adc_in/ts3
darkquad29_wvl_adc_in_ts3_type         = 'xps_sw_reg';
darkquad29_wvl_adc_in_ts3_param        = 'out';
darkquad29_wvl_adc_in_ts3_ip_name      = 'opb_register_simulink2ppc';
darkquad29_wvl_adc_in_ts3_addr_start   = hex2dec('0108B600');
darkquad29_wvl_adc_in_ts3_addr_end     = hex2dec('0108B6FF');

% darkquad29_wvl/adc_in/valid
darkquad29_wvl_adc_in_valid_type         = 'xps_sw_reg';
darkquad29_wvl_adc_in_valid_param        = 'out';
darkquad29_wvl_adc_in_valid_ip_name      = 'opb_register_simulink2ppc';
darkquad29_wvl_adc_in_valid_addr_start   = hex2dec('01100000');
darkquad29_wvl_adc_in_valid_addr_end     = hex2dec('011000FF');

% darkquad29_wvl/board_num
darkquad29_wvl_board_num_type         = 'xps_sw_reg';
darkquad29_wvl_board_num_param        = 'in';
darkquad29_wvl_board_num_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_board_num_addr_start   = hex2dec('01100100');
darkquad29_wvl_board_num_addr_end     = hex2dec('011001FF');

% darkquad29_wvl/capture0/base_kf
darkquad29_wvl_capture0_base_kf_type         = 'xps_sw_reg';
darkquad29_wvl_capture0_base_kf_param        = 'in';
darkquad29_wvl_capture0_base_kf_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_capture0_base_kf_addr_start   = hex2dec('01100200');
darkquad29_wvl_capture0_base_kf_addr_end     = hex2dec('011002FF');

% darkquad29_wvl/capture0/base_kq
darkquad29_wvl_capture0_base_kq_type         = 'xps_sw_reg';
darkquad29_wvl_capture0_base_kq_param        = 'in';
darkquad29_wvl_capture0_base_kq_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_capture0_base_kq_addr_start   = hex2dec('01100300');
darkquad29_wvl_capture0_base_kq_addr_end     = hex2dec('011003FF');

% darkquad29_wvl/capture0/cps_lim
darkquad29_wvl_capture0_cps_lim_type         = 'xps_sw_reg';
darkquad29_wvl_capture0_cps_lim_param        = 'in';
darkquad29_wvl_capture0_cps_lim_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_capture0_cps_lim_addr_start   = hex2dec('01100400');
darkquad29_wvl_capture0_cps_lim_addr_end     = hex2dec('011004FF');

% darkquad29_wvl/capture0/energy_cal_lut/energy_coeffs
darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_type         = 'xps_bram';
darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_param        = '2048';
darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_ip_name      = 'bram_if';
darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_addr_start   = hex2dec('01102000');
darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_addr_end     = hex2dec('01103FFF');

% darkquad29_wvl/capture0/load_thresh
darkquad29_wvl_capture0_load_thresh_type         = 'xps_sw_reg';
darkquad29_wvl_capture0_load_thresh_param        = 'in';
darkquad29_wvl_capture0_load_thresh_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_capture0_load_thresh_addr_start   = hex2dec('01104000');
darkquad29_wvl_capture0_load_thresh_addr_end     = hex2dec('011040FF');

% darkquad29_wvl/capture0/pix
darkquad29_wvl_capture0_pix_type         = 'xps_bram';
darkquad29_wvl_capture0_pix_param        = '1024';
darkquad29_wvl_capture0_pix_ip_name      = 'bram_if';
darkquad29_wvl_capture0_pix_addr_start   = hex2dec('01105000');
darkquad29_wvl_capture0_pix_addr_end     = hex2dec('01105FFF');

% darkquad29_wvl/capture0/threshold
darkquad29_wvl_capture0_threshold_type         = 'xps_sw_reg';
darkquad29_wvl_capture0_threshold_param        = 'in';
darkquad29_wvl_capture0_threshold_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_capture0_threshold_addr_start   = hex2dec('01106000');
darkquad29_wvl_capture0_threshold_addr_end     = hex2dec('011060FF');

% darkquad29_wvl/capture0/use_energy_cal
darkquad29_wvl_capture0_use_energy_cal_type         = 'xps_sw_reg';
darkquad29_wvl_capture0_use_energy_cal_param        = 'in';
darkquad29_wvl_capture0_use_energy_cal_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_capture0_use_energy_cal_addr_start   = hex2dec('01106100');
darkquad29_wvl_capture0_use_energy_cal_addr_end     = hex2dec('011061FF');

% darkquad29_wvl/capture1/base_kf
darkquad29_wvl_capture1_base_kf_type         = 'xps_sw_reg';
darkquad29_wvl_capture1_base_kf_param        = 'in';
darkquad29_wvl_capture1_base_kf_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_capture1_base_kf_addr_start   = hex2dec('01106200');
darkquad29_wvl_capture1_base_kf_addr_end     = hex2dec('011062FF');

% darkquad29_wvl/capture1/base_kq
darkquad29_wvl_capture1_base_kq_type         = 'xps_sw_reg';
darkquad29_wvl_capture1_base_kq_param        = 'in';
darkquad29_wvl_capture1_base_kq_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_capture1_base_kq_addr_start   = hex2dec('01106300');
darkquad29_wvl_capture1_base_kq_addr_end     = hex2dec('011063FF');

% darkquad29_wvl/capture1/cps_lim
darkquad29_wvl_capture1_cps_lim_type         = 'xps_sw_reg';
darkquad29_wvl_capture1_cps_lim_param        = 'in';
darkquad29_wvl_capture1_cps_lim_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_capture1_cps_lim_addr_start   = hex2dec('01106400');
darkquad29_wvl_capture1_cps_lim_addr_end     = hex2dec('011064FF');

% darkquad29_wvl/capture1/energy_cal_lut/energy_coeffs
darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_type         = 'xps_bram';
darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_param        = '2048';
darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_ip_name      = 'bram_if';
darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_addr_start   = hex2dec('01108000');
darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_addr_end     = hex2dec('01109FFF');

% darkquad29_wvl/capture1/load_thresh
darkquad29_wvl_capture1_load_thresh_type         = 'xps_sw_reg';
darkquad29_wvl_capture1_load_thresh_param        = 'in';
darkquad29_wvl_capture1_load_thresh_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_capture1_load_thresh_addr_start   = hex2dec('0110A000');
darkquad29_wvl_capture1_load_thresh_addr_end     = hex2dec('0110A0FF');

% darkquad29_wvl/capture1/pix
darkquad29_wvl_capture1_pix_type         = 'xps_bram';
darkquad29_wvl_capture1_pix_param        = '1024';
darkquad29_wvl_capture1_pix_ip_name      = 'bram_if';
darkquad29_wvl_capture1_pix_addr_start   = hex2dec('0110B000');
darkquad29_wvl_capture1_pix_addr_end     = hex2dec('0110BFFF');

% darkquad29_wvl/capture1/threshold
darkquad29_wvl_capture1_threshold_type         = 'xps_sw_reg';
darkquad29_wvl_capture1_threshold_param        = 'in';
darkquad29_wvl_capture1_threshold_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_capture1_threshold_addr_start   = hex2dec('0110C000');
darkquad29_wvl_capture1_threshold_addr_end     = hex2dec('0110C0FF');

% darkquad29_wvl/capture1/use_energy_cal
darkquad29_wvl_capture1_use_energy_cal_type         = 'xps_sw_reg';
darkquad29_wvl_capture1_use_energy_cal_param        = 'in';
darkquad29_wvl_capture1_use_energy_cal_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_capture1_use_energy_cal_addr_start   = hex2dec('0110C100');
darkquad29_wvl_capture1_use_energy_cal_addr_end     = hex2dec('0110C1FF');

% darkquad29_wvl/capture2/base_kf
darkquad29_wvl_capture2_base_kf_type         = 'xps_sw_reg';
darkquad29_wvl_capture2_base_kf_param        = 'in';
darkquad29_wvl_capture2_base_kf_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_capture2_base_kf_addr_start   = hex2dec('0110C200');
darkquad29_wvl_capture2_base_kf_addr_end     = hex2dec('0110C2FF');

% darkquad29_wvl/capture2/base_kq
darkquad29_wvl_capture2_base_kq_type         = 'xps_sw_reg';
darkquad29_wvl_capture2_base_kq_param        = 'in';
darkquad29_wvl_capture2_base_kq_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_capture2_base_kq_addr_start   = hex2dec('0110C300');
darkquad29_wvl_capture2_base_kq_addr_end     = hex2dec('0110C3FF');

% darkquad29_wvl/capture2/cps_lim
darkquad29_wvl_capture2_cps_lim_type         = 'xps_sw_reg';
darkquad29_wvl_capture2_cps_lim_param        = 'in';
darkquad29_wvl_capture2_cps_lim_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_capture2_cps_lim_addr_start   = hex2dec('0110C400');
darkquad29_wvl_capture2_cps_lim_addr_end     = hex2dec('0110C4FF');

% darkquad29_wvl/capture2/energy_cal_lut/energy_coeffs
darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_type         = 'xps_bram';
darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_param        = '2048';
darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_ip_name      = 'bram_if';
darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_addr_start   = hex2dec('0110E000');
darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_addr_end     = hex2dec('0110FFFF');

% darkquad29_wvl/capture2/load_thresh
darkquad29_wvl_capture2_load_thresh_type         = 'xps_sw_reg';
darkquad29_wvl_capture2_load_thresh_param        = 'in';
darkquad29_wvl_capture2_load_thresh_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_capture2_load_thresh_addr_start   = hex2dec('01110000');
darkquad29_wvl_capture2_load_thresh_addr_end     = hex2dec('011100FF');

% darkquad29_wvl/capture2/pix
darkquad29_wvl_capture2_pix_type         = 'xps_bram';
darkquad29_wvl_capture2_pix_param        = '1024';
darkquad29_wvl_capture2_pix_ip_name      = 'bram_if';
darkquad29_wvl_capture2_pix_addr_start   = hex2dec('01111000');
darkquad29_wvl_capture2_pix_addr_end     = hex2dec('01111FFF');

% darkquad29_wvl/capture2/threshold
darkquad29_wvl_capture2_threshold_type         = 'xps_sw_reg';
darkquad29_wvl_capture2_threshold_param        = 'in';
darkquad29_wvl_capture2_threshold_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_capture2_threshold_addr_start   = hex2dec('01112000');
darkquad29_wvl_capture2_threshold_addr_end     = hex2dec('011120FF');

% darkquad29_wvl/capture2/use_energy_cal
darkquad29_wvl_capture2_use_energy_cal_type         = 'xps_sw_reg';
darkquad29_wvl_capture2_use_energy_cal_param        = 'in';
darkquad29_wvl_capture2_use_energy_cal_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_capture2_use_energy_cal_addr_start   = hex2dec('01112100');
darkquad29_wvl_capture2_use_energy_cal_addr_end     = hex2dec('011121FF');

% darkquad29_wvl/capture3/base_kf
darkquad29_wvl_capture3_base_kf_type         = 'xps_sw_reg';
darkquad29_wvl_capture3_base_kf_param        = 'in';
darkquad29_wvl_capture3_base_kf_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_capture3_base_kf_addr_start   = hex2dec('01112200');
darkquad29_wvl_capture3_base_kf_addr_end     = hex2dec('011122FF');

% darkquad29_wvl/capture3/base_kq
darkquad29_wvl_capture3_base_kq_type         = 'xps_sw_reg';
darkquad29_wvl_capture3_base_kq_param        = 'in';
darkquad29_wvl_capture3_base_kq_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_capture3_base_kq_addr_start   = hex2dec('01112300');
darkquad29_wvl_capture3_base_kq_addr_end     = hex2dec('011123FF');

% darkquad29_wvl/capture3/cps_lim
darkquad29_wvl_capture3_cps_lim_type         = 'xps_sw_reg';
darkquad29_wvl_capture3_cps_lim_param        = 'in';
darkquad29_wvl_capture3_cps_lim_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_capture3_cps_lim_addr_start   = hex2dec('01112400');
darkquad29_wvl_capture3_cps_lim_addr_end     = hex2dec('011124FF');

% darkquad29_wvl/capture3/energy_cal_lut/energy_coeffs
darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_type         = 'xps_bram';
darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_param        = '2048';
darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_ip_name      = 'bram_if';
darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_addr_start   = hex2dec('01114000');
darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_addr_end     = hex2dec('01115FFF');

% darkquad29_wvl/capture3/load_thresh
darkquad29_wvl_capture3_load_thresh_type         = 'xps_sw_reg';
darkquad29_wvl_capture3_load_thresh_param        = 'in';
darkquad29_wvl_capture3_load_thresh_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_capture3_load_thresh_addr_start   = hex2dec('01116000');
darkquad29_wvl_capture3_load_thresh_addr_end     = hex2dec('011160FF');

% darkquad29_wvl/capture3/pix
darkquad29_wvl_capture3_pix_type         = 'xps_bram';
darkquad29_wvl_capture3_pix_param        = '1024';
darkquad29_wvl_capture3_pix_ip_name      = 'bram_if';
darkquad29_wvl_capture3_pix_addr_start   = hex2dec('01117000');
darkquad29_wvl_capture3_pix_addr_end     = hex2dec('01117FFF');

% darkquad29_wvl/capture3/threshold
darkquad29_wvl_capture3_threshold_type         = 'xps_sw_reg';
darkquad29_wvl_capture3_threshold_param        = 'in';
darkquad29_wvl_capture3_threshold_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_capture3_threshold_addr_start   = hex2dec('01180000');
darkquad29_wvl_capture3_threshold_addr_end     = hex2dec('011800FF');

% darkquad29_wvl/capture3/use_energy_cal
darkquad29_wvl_capture3_use_energy_cal_type         = 'xps_sw_reg';
darkquad29_wvl_capture3_use_energy_cal_param        = 'in';
darkquad29_wvl_capture3_use_energy_cal_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_capture3_use_energy_cal_addr_start   = hex2dec('01180100');
darkquad29_wvl_capture3_use_energy_cal_addr_end     = hex2dec('011801FF');

% darkquad29_wvl/chan_sel/ch_bin0
darkquad29_wvl_chan_sel_ch_bin0_type         = 'xps_sw_reg';
darkquad29_wvl_chan_sel_ch_bin0_param        = 'in';
darkquad29_wvl_chan_sel_ch_bin0_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_chan_sel_ch_bin0_addr_start   = hex2dec('01180200');
darkquad29_wvl_chan_sel_ch_bin0_addr_end     = hex2dec('011802FF');

% darkquad29_wvl/chan_sel/ch_bin1
darkquad29_wvl_chan_sel_ch_bin1_type         = 'xps_sw_reg';
darkquad29_wvl_chan_sel_ch_bin1_param        = 'in';
darkquad29_wvl_chan_sel_ch_bin1_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_chan_sel_ch_bin1_addr_start   = hex2dec('01180300');
darkquad29_wvl_chan_sel_ch_bin1_addr_end     = hex2dec('011803FF');

% darkquad29_wvl/chan_sel/ch_bin2
darkquad29_wvl_chan_sel_ch_bin2_type         = 'xps_sw_reg';
darkquad29_wvl_chan_sel_ch_bin2_param        = 'in';
darkquad29_wvl_chan_sel_ch_bin2_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_chan_sel_ch_bin2_addr_start   = hex2dec('01180400');
darkquad29_wvl_chan_sel_ch_bin2_addr_end     = hex2dec('011804FF');

% darkquad29_wvl/chan_sel/ch_bin3
darkquad29_wvl_chan_sel_ch_bin3_type         = 'xps_sw_reg';
darkquad29_wvl_chan_sel_ch_bin3_param        = 'in';
darkquad29_wvl_chan_sel_ch_bin3_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_chan_sel_ch_bin3_addr_start   = hex2dec('01180500');
darkquad29_wvl_chan_sel_ch_bin3_addr_end     = hex2dec('011805FF');

% darkquad29_wvl/chan_sel/load
darkquad29_wvl_chan_sel_load_type         = 'xps_sw_reg';
darkquad29_wvl_chan_sel_load_param        = 'in';
darkquad29_wvl_chan_sel_load_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_chan_sel_load_addr_start   = hex2dec('01180600');
darkquad29_wvl_chan_sel_load_addr_end     = hex2dec('011806FF');

% darkquad29_wvl/check_lag/data_ch
darkquad29_wvl_check_lag_data_ch_type         = 'xps_sw_reg';
darkquad29_wvl_check_lag_data_ch_param        = 'out';
darkquad29_wvl_check_lag_data_ch_ip_name      = 'opb_register_simulink2ppc';
darkquad29_wvl_check_lag_data_ch_addr_start   = hex2dec('01180700');
darkquad29_wvl_check_lag_data_ch_addr_end     = hex2dec('011807FF');

% darkquad29_wvl/check_lag/dds_ch
darkquad29_wvl_check_lag_dds_ch_type         = 'xps_sw_reg';
darkquad29_wvl_check_lag_dds_ch_param        = 'out';
darkquad29_wvl_check_lag_dds_ch_ip_name      = 'opb_register_simulink2ppc';
darkquad29_wvl_check_lag_dds_ch_addr_start   = hex2dec('01180800');
darkquad29_wvl_check_lag_dds_ch_addr_end     = hex2dec('011808FF');

% darkquad29_wvl/check_lag/latch
darkquad29_wvl_check_lag_latch_type         = 'xps_sw_reg';
darkquad29_wvl_check_lag_latch_param        = 'in';
darkquad29_wvl_check_lag_latch_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_check_lag_latch_addr_start   = hex2dec('01180900');
darkquad29_wvl_check_lag_latch_addr_end     = hex2dec('011809FF');

% darkquad29_wvl/conv_phase0/centers
darkquad29_wvl_conv_phase0_centers_type         = 'xps_sw_reg';
darkquad29_wvl_conv_phase0_centers_param        = 'in';
darkquad29_wvl_conv_phase0_centers_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_conv_phase0_centers_addr_start   = hex2dec('01180A00');
darkquad29_wvl_conv_phase0_centers_addr_end     = hex2dec('01180AFF');

% darkquad29_wvl/conv_phase0/load_centers
darkquad29_wvl_conv_phase0_load_centers_type         = 'xps_sw_reg';
darkquad29_wvl_conv_phase0_load_centers_param        = 'in';
darkquad29_wvl_conv_phase0_load_centers_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_conv_phase0_load_centers_addr_start   = hex2dec('01180B00');
darkquad29_wvl_conv_phase0_load_centers_addr_end     = hex2dec('01180BFF');

% darkquad29_wvl/conv_phase1/centers
darkquad29_wvl_conv_phase1_centers_type         = 'xps_sw_reg';
darkquad29_wvl_conv_phase1_centers_param        = 'in';
darkquad29_wvl_conv_phase1_centers_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_conv_phase1_centers_addr_start   = hex2dec('01180C00');
darkquad29_wvl_conv_phase1_centers_addr_end     = hex2dec('01180CFF');

% darkquad29_wvl/conv_phase1/load_centers
darkquad29_wvl_conv_phase1_load_centers_type         = 'xps_sw_reg';
darkquad29_wvl_conv_phase1_load_centers_param        = 'in';
darkquad29_wvl_conv_phase1_load_centers_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_conv_phase1_load_centers_addr_start   = hex2dec('01180D00');
darkquad29_wvl_conv_phase1_load_centers_addr_end     = hex2dec('01180DFF');

% darkquad29_wvl/conv_phase2/centers
darkquad29_wvl_conv_phase2_centers_type         = 'xps_sw_reg';
darkquad29_wvl_conv_phase2_centers_param        = 'in';
darkquad29_wvl_conv_phase2_centers_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_conv_phase2_centers_addr_start   = hex2dec('01180E00');
darkquad29_wvl_conv_phase2_centers_addr_end     = hex2dec('01180EFF');

% darkquad29_wvl/conv_phase2/load_centers
darkquad29_wvl_conv_phase2_load_centers_type         = 'xps_sw_reg';
darkquad29_wvl_conv_phase2_load_centers_param        = 'in';
darkquad29_wvl_conv_phase2_load_centers_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_conv_phase2_load_centers_addr_start   = hex2dec('01180F00');
darkquad29_wvl_conv_phase2_load_centers_addr_end     = hex2dec('01180FFF');

% darkquad29_wvl/conv_phase3/centers
darkquad29_wvl_conv_phase3_centers_type         = 'xps_sw_reg';
darkquad29_wvl_conv_phase3_centers_param        = 'in';
darkquad29_wvl_conv_phase3_centers_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_conv_phase3_centers_addr_start   = hex2dec('01181000');
darkquad29_wvl_conv_phase3_centers_addr_end     = hex2dec('011810FF');

% darkquad29_wvl/conv_phase3/load_centers
darkquad29_wvl_conv_phase3_load_centers_type         = 'xps_sw_reg';
darkquad29_wvl_conv_phase3_load_centers_param        = 'in';
darkquad29_wvl_conv_phase3_load_centers_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_conv_phase3_load_centers_addr_start   = hex2dec('01181100');
darkquad29_wvl_conv_phase3_load_centers_addr_end     = hex2dec('011811FF');

% darkquad29_wvl/dds_lut/qdr0
darkquad29_wvl_dds_lut_qdr0_type         = 'xps_qdr';
darkquad29_wvl_dds_lut_qdr0_param        = '';
darkquad29_wvl_dds_lut_qdr0_addr_start   = hex2dec('0200_0000');
darkquad29_wvl_dds_lut_qdr0_addr_end     = hex2dec('027F_FFFF');

% darkquad29_wvl/dds_lut/qdr1
darkquad29_wvl_dds_lut_qdr1_type         = 'xps_qdr';
darkquad29_wvl_dds_lut_qdr1_param        = '';
darkquad29_wvl_dds_lut_qdr1_addr_start   = hex2dec('0280_0000');
darkquad29_wvl_dds_lut_qdr1_addr_end     = hex2dec('02FF_FFFF');

% darkquad29_wvl/dds_lut/qdr2
darkquad29_wvl_dds_lut_qdr2_type         = 'xps_qdr';
darkquad29_wvl_dds_lut_qdr2_param        = '';
darkquad29_wvl_dds_lut_qdr2_addr_start   = hex2dec('0300_0000');
darkquad29_wvl_dds_lut_qdr2_addr_end     = hex2dec('037F_FFFF');

% darkquad29_wvl/dds_lut/qdr3
darkquad29_wvl_dds_lut_qdr3_type         = 'xps_qdr';
darkquad29_wvl_dds_lut_qdr3_param        = '';
darkquad29_wvl_dds_lut_qdr3_addr_start   = hex2dec('0380_0000');
darkquad29_wvl_dds_lut_qdr3_addr_end     = hex2dec('03FF_FFFF');

% darkquad29_wvl/dds_lut/run
darkquad29_wvl_dds_lut_run_type         = 'xps_sw_reg';
darkquad29_wvl_dds_lut_run_param        = 'in';
darkquad29_wvl_dds_lut_run_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_dds_lut_run_addr_start   = hex2dec('01181200');
darkquad29_wvl_dds_lut_run_addr_end     = hex2dec('011812FF');

% darkquad29_wvl/dds_shift
darkquad29_wvl_dds_shift_type         = 'xps_sw_reg';
darkquad29_wvl_dds_shift_param        = 'in';
darkquad29_wvl_dds_shift_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_dds_shift_addr_start   = hex2dec('01181300');
darkquad29_wvl_dds_shift_addr_end     = hex2dec('011813FF');

% darkquad29_wvl/gbe64/dest_ip
darkquad29_wvl_gbe64_dest_ip_type         = 'xps_sw_reg';
darkquad29_wvl_gbe64_dest_ip_param        = 'in';
darkquad29_wvl_gbe64_dest_ip_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_gbe64_dest_ip_addr_start   = hex2dec('01181400');
darkquad29_wvl_gbe64_dest_ip_addr_end     = hex2dec('011814FF');

% darkquad29_wvl/gbe64/one_gbe
darkquad29_wvl_gbe64_one_gbe_type         = 'xps_onegbe';
darkquad29_wvl_gbe64_one_gbe_param        = '';
darkquad29_wvl_gbe64_one_gbe_ip_name      = 'gbe_udp';
darkquad29_wvl_gbe64_one_gbe_addr_start   = hex2dec('01184000');
darkquad29_wvl_gbe64_one_gbe_addr_end     = hex2dec('01187FFF');

% darkquad29_wvl/gbe64/rst
darkquad29_wvl_gbe64_rst_type         = 'xps_sw_reg';
darkquad29_wvl_gbe64_rst_param        = 'in';
darkquad29_wvl_gbe64_rst_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_gbe64_rst_addr_start   = hex2dec('01188000');
darkquad29_wvl_gbe64_rst_addr_end     = hex2dec('011880FF');

% darkquad29_wvl/gbe64/tx_afull
darkquad29_wvl_gbe64_tx_afull_type         = 'xps_sw_reg';
darkquad29_wvl_gbe64_tx_afull_param        = 'out';
darkquad29_wvl_gbe64_tx_afull_ip_name      = 'opb_register_simulink2ppc';
darkquad29_wvl_gbe64_tx_afull_addr_start   = hex2dec('01188100');
darkquad29_wvl_gbe64_tx_afull_addr_end     = hex2dec('011881FF');

% darkquad29_wvl/gbe64/tx_overrun
darkquad29_wvl_gbe64_tx_overrun_type         = 'xps_sw_reg';
darkquad29_wvl_gbe64_tx_overrun_param        = 'out';
darkquad29_wvl_gbe64_tx_overrun_ip_name      = 'opb_register_simulink2ppc';
darkquad29_wvl_gbe64_tx_overrun_addr_start   = hex2dec('01188200');
darkquad29_wvl_gbe64_tx_overrun_addr_end     = hex2dec('011882FF');

% darkquad29_wvl/gbe64/words_per_frame
darkquad29_wvl_gbe64_words_per_frame_type         = 'xps_sw_reg';
darkquad29_wvl_gbe64_words_per_frame_param        = 'in';
darkquad29_wvl_gbe64_words_per_frame_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_gbe64_words_per_frame_addr_start   = hex2dec('01188300');
darkquad29_wvl_gbe64_words_per_frame_addr_end     = hex2dec('011883FF');

% darkquad29_wvl/n_eof_sent
darkquad29_wvl_n_eof_sent_type         = 'xps_sw_reg';
darkquad29_wvl_n_eof_sent_param        = 'out';
darkquad29_wvl_n_eof_sent_ip_name      = 'opb_register_simulink2ppc';
darkquad29_wvl_n_eof_sent_addr_start   = hex2dec('01188400');
darkquad29_wvl_n_eof_sent_addr_end     = hex2dec('011884FF');

% darkquad29_wvl/n_photons
darkquad29_wvl_n_photons_type         = 'xps_sw_reg';
darkquad29_wvl_n_photons_param        = 'out';
darkquad29_wvl_n_photons_ip_name      = 'opb_register_simulink2ppc';
darkquad29_wvl_n_photons_addr_start   = hex2dec('01188500');
darkquad29_wvl_n_photons_addr_end     = hex2dec('011885FF');

% darkquad29_wvl/pfb_fft/check/fft_oflow
darkquad29_wvl_pfb_fft_check_fft_oflow_type         = 'xps_sw_reg';
darkquad29_wvl_pfb_fft_check_fft_oflow_param        = 'out';
darkquad29_wvl_pfb_fft_check_fft_oflow_ip_name      = 'opb_register_simulink2ppc';
darkquad29_wvl_pfb_fft_check_fft_oflow_addr_start   = hex2dec('01188600');
darkquad29_wvl_pfb_fft_check_fft_oflow_addr_end     = hex2dec('011886FF');

% darkquad29_wvl/phase_dmp/ch_we
darkquad29_wvl_phase_dmp_ch_we_type         = 'xps_sw_reg';
darkquad29_wvl_phase_dmp_ch_we_param        = 'in';
darkquad29_wvl_phase_dmp_ch_we_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_phase_dmp_ch_we_addr_start   = hex2dec('01188700');
darkquad29_wvl_phase_dmp_ch_we_addr_end     = hex2dec('011887FF');

% darkquad29_wvl/phase_dmp/on
darkquad29_wvl_phase_dmp_on_type         = 'xps_sw_reg';
darkquad29_wvl_phase_dmp_on_param        = 'in';
darkquad29_wvl_phase_dmp_on_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_phase_dmp_on_addr_start   = hex2dec('01188800');
darkquad29_wvl_phase_dmp_on_addr_end     = hex2dec('011888FF');

% darkquad29_wvl/phase_port
darkquad29_wvl_phase_port_type         = 'xps_sw_reg';
darkquad29_wvl_phase_port_param        = 'in';
darkquad29_wvl_phase_port_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_phase_port_addr_start   = hex2dec('01188900');
darkquad29_wvl_phase_port_addr_end     = hex2dec('011889FF');

% darkquad29_wvl/photon_port
darkquad29_wvl_photon_port_type         = 'xps_sw_reg';
darkquad29_wvl_photon_port_param        = 'in';
darkquad29_wvl_photon_port_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_photon_port_addr_start   = hex2dec('01200000');
darkquad29_wvl_photon_port_addr_end     = hex2dec('012000FF');

% darkquad29_wvl/prog_fir0/load_chan
darkquad29_wvl_prog_fir0_load_chan_type         = 'xps_sw_reg';
darkquad29_wvl_prog_fir0_load_chan_param        = 'in';
darkquad29_wvl_prog_fir0_load_chan_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_prog_fir0_load_chan_addr_start   = hex2dec('01200100');
darkquad29_wvl_prog_fir0_load_chan_addr_end     = hex2dec('012001FF');

% darkquad29_wvl/prog_fir0/single_chan_coeffs
darkquad29_wvl_prog_fir0_single_chan_coeffs_type         = 'xps_bram';
darkquad29_wvl_prog_fir0_single_chan_coeffs_param        = '1024';
darkquad29_wvl_prog_fir0_single_chan_coeffs_ip_name      = 'bram_if';
darkquad29_wvl_prog_fir0_single_chan_coeffs_addr_start   = hex2dec('01201000');
darkquad29_wvl_prog_fir0_single_chan_coeffs_addr_end     = hex2dec('01201FFF');

% darkquad29_wvl/prog_fir1/load_chan
darkquad29_wvl_prog_fir1_load_chan_type         = 'xps_sw_reg';
darkquad29_wvl_prog_fir1_load_chan_param        = 'in';
darkquad29_wvl_prog_fir1_load_chan_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_prog_fir1_load_chan_addr_start   = hex2dec('01202000');
darkquad29_wvl_prog_fir1_load_chan_addr_end     = hex2dec('012020FF');

% darkquad29_wvl/prog_fir1/single_chan_coeffs
darkquad29_wvl_prog_fir1_single_chan_coeffs_type         = 'xps_bram';
darkquad29_wvl_prog_fir1_single_chan_coeffs_param        = '1024';
darkquad29_wvl_prog_fir1_single_chan_coeffs_ip_name      = 'bram_if';
darkquad29_wvl_prog_fir1_single_chan_coeffs_addr_start   = hex2dec('01203000');
darkquad29_wvl_prog_fir1_single_chan_coeffs_addr_end     = hex2dec('01203FFF');

% darkquad29_wvl/prog_fir2/load_chan
darkquad29_wvl_prog_fir2_load_chan_type         = 'xps_sw_reg';
darkquad29_wvl_prog_fir2_load_chan_param        = 'in';
darkquad29_wvl_prog_fir2_load_chan_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_prog_fir2_load_chan_addr_start   = hex2dec('01204000');
darkquad29_wvl_prog_fir2_load_chan_addr_end     = hex2dec('012040FF');

% darkquad29_wvl/prog_fir2/single_chan_coeffs
darkquad29_wvl_prog_fir2_single_chan_coeffs_type         = 'xps_bram';
darkquad29_wvl_prog_fir2_single_chan_coeffs_param        = '1024';
darkquad29_wvl_prog_fir2_single_chan_coeffs_ip_name      = 'bram_if';
darkquad29_wvl_prog_fir2_single_chan_coeffs_addr_start   = hex2dec('01205000');
darkquad29_wvl_prog_fir2_single_chan_coeffs_addr_end     = hex2dec('01205FFF');

% darkquad29_wvl/prog_fir3/load_chan
darkquad29_wvl_prog_fir3_load_chan_type         = 'xps_sw_reg';
darkquad29_wvl_prog_fir3_load_chan_param        = 'in';
darkquad29_wvl_prog_fir3_load_chan_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_prog_fir3_load_chan_addr_start   = hex2dec('01206000');
darkquad29_wvl_prog_fir3_load_chan_addr_end     = hex2dec('012060FF');

% darkquad29_wvl/prog_fir3/single_chan_coeffs
darkquad29_wvl_prog_fir3_single_chan_coeffs_type         = 'xps_bram';
darkquad29_wvl_prog_fir3_single_chan_coeffs_param        = '1024';
darkquad29_wvl_prog_fir3_single_chan_coeffs_ip_name      = 'bram_if';
darkquad29_wvl_prog_fir3_single_chan_coeffs_addr_start   = hex2dec('01207000');
darkquad29_wvl_prog_fir3_single_chan_coeffs_addr_end     = hex2dec('01207FFF');

% darkquad29_wvl/run
darkquad29_wvl_run_type         = 'xps_sw_reg';
darkquad29_wvl_run_param        = 'in';
darkquad29_wvl_run_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_run_addr_start   = hex2dec('01208000');
darkquad29_wvl_run_addr_end     = hex2dec('012080FF');

% darkquad29_wvl/sel_ch
darkquad29_wvl_sel_ch_type         = 'xps_sw_reg';
darkquad29_wvl_sel_ch_param        = 'in';
darkquad29_wvl_sel_ch_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_sel_ch_addr_start   = hex2dec('01208100');
darkquad29_wvl_sel_ch_addr_end     = hex2dec('012081FF');

% darkquad29_wvl/snp_phs/ss/bram
darkquad29_wvl_snp_phs_ss_bram_type         = 'xps_bram';
darkquad29_wvl_snp_phs_ss_bram_param        = '1024';
darkquad29_wvl_snp_phs_ss_bram_ip_name      = 'bram_if';
darkquad29_wvl_snp_phs_ss_bram_addr_start   = hex2dec('01209000');
darkquad29_wvl_snp_phs_ss_bram_addr_end     = hex2dec('01209FFF');

% darkquad29_wvl/snp_phs/ss/ctrl
darkquad29_wvl_snp_phs_ss_ctrl_type         = 'xps_sw_reg';
darkquad29_wvl_snp_phs_ss_ctrl_param        = 'in';
darkquad29_wvl_snp_phs_ss_ctrl_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_snp_phs_ss_ctrl_addr_start   = hex2dec('0120A000');
darkquad29_wvl_snp_phs_ss_ctrl_addr_end     = hex2dec('0120A0FF');

% darkquad29_wvl/snp_phs/ss/status
darkquad29_wvl_snp_phs_ss_status_type         = 'xps_sw_reg';
darkquad29_wvl_snp_phs_ss_status_param        = 'out';
darkquad29_wvl_snp_phs_ss_status_ip_name      = 'opb_register_simulink2ppc';
darkquad29_wvl_snp_phs_ss_status_addr_start   = hex2dec('0120A100');
darkquad29_wvl_snp_phs_ss_status_addr_end     = hex2dec('0120A1FF');

% darkquad29_wvl/start_cap
darkquad29_wvl_start_cap_type         = 'xps_sw_reg';
darkquad29_wvl_start_cap_param        = 'in';
darkquad29_wvl_start_cap_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_start_cap_addr_start   = hex2dec('0120A200');
darkquad29_wvl_start_cap_addr_end     = hex2dec('0120A2FF');

% darkquad29_wvl/timekeeper/base_ts
darkquad29_wvl_timekeeper_base_ts_type         = 'xps_sw_reg';
darkquad29_wvl_timekeeper_base_ts_param        = 'in';
darkquad29_wvl_timekeeper_base_ts_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_timekeeper_base_ts_addr_start   = hex2dec('0120A300');
darkquad29_wvl_timekeeper_base_ts_addr_end     = hex2dec('0120A3FF');

% darkquad29_wvl/timekeeper/sec_now
darkquad29_wvl_timekeeper_sec_now_type         = 'xps_sw_reg';
darkquad29_wvl_timekeeper_sec_now_param        = 'out';
darkquad29_wvl_timekeeper_sec_now_ip_name      = 'opb_register_simulink2ppc';
darkquad29_wvl_timekeeper_sec_now_addr_start   = hex2dec('0120A400');
darkquad29_wvl_timekeeper_sec_now_addr_end     = hex2dec('0120A4FF');

% darkquad29_wvl/trig_snp
darkquad29_wvl_trig_snp_type         = 'xps_sw_reg';
darkquad29_wvl_trig_snp_param        = 'in';
darkquad29_wvl_trig_snp_ip_name      = 'opb_register_ppc2simulink';
darkquad29_wvl_trig_snp_addr_start   = hex2dec('0120A500');
darkquad29_wvl_trig_snp_addr_end     = hex2dec('0120A5FF');

% OPB to OPB bridge added at 0x1080000
OPB_to_OPB_bridge_added_at_0x1080000_type         = 'xps_opb2opb';
OPB_to_OPB_bridge_added_at_0x1080000_param        = '';

% OPB to OPB bridge added at 0x1100000
OPB_to_OPB_bridge_added_at_0x1100000_type         = 'xps_opb2opb';
OPB_to_OPB_bridge_added_at_0x1100000_param        = '';

% OPB to OPB bridge added at 0x1180000
OPB_to_OPB_bridge_added_at_0x1180000_type         = 'xps_opb2opb';
OPB_to_OPB_bridge_added_at_0x1180000_param        = '';

% OPB to OPB bridge added at 0x1200000
OPB_to_OPB_bridge_added_at_0x1200000_type         = 'xps_opb2opb';
OPB_to_OPB_bridge_added_at_0x1200000_param        = '';

