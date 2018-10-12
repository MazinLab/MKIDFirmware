//-----------------------------------------------------------------------------
// system_darkquad29_adc_in_adcdac_2g_wrapper.v
//-----------------------------------------------------------------------------

module system_darkquad29_adc_in_adcdac_2g_wrapper
  (
    data0_p,
    data0_n,
    data1_p,
    data1_n,
    data2_p,
    data2_n,
    data3_p,
    data3_n,
    info0_p,
    info0_n,
    info1_p,
    info1_n,
    info2_p,
    info2_n,
    info3_p,
    info3_n,
    valid_p,
    valid_n,
    data0_smpl_clk_p,
    data0_smpl_clk_n,
    data0_rdy_p,
    data0_rdy_n,
    sync_out_p,
    sync_out_n,
    sync_pps_p,
    sync_pps_n,
    adc_clk_out,
    adc_clk90_out,
    adc_clk180_out,
    adc_clk270_out,
    sys_clk,
    adc_mmcm_locked,
    user_data_i0,
    user_data_i1,
    user_data_i2,
    user_data_i3,
    user_data_i4,
    user_data_i5,
    user_data_i6,
    user_data_i7,
    user_data_q0,
    user_data_q1,
    user_data_q2,
    user_data_q3,
    user_data_q4,
    user_data_q5,
    user_data_q6,
    user_data_q7,
    user_info_i0,
    user_info_i1,
    user_info_i2,
    user_info_i3,
    user_info_i4,
    user_info_i5,
    user_info_i6,
    user_info_i7,
    user_info_q0,
    user_info_q1,
    user_info_q2,
    user_info_q3,
    user_info_q4,
    user_info_q5,
    user_info_q6,
    user_info_q7,
    user_valid,
    user_rdy_i0,
    user_dly_val,
    user_load_dly0,
    user_pos_mmcm_phs,
    user_inc_mmcm_phs,
    user_sync,
    user_mmcm_locked
  );
  input [11:0] data0_p;
  input [11:0] data0_n;
  input [11:0] data1_p;
  input [11:0] data1_n;
  input [11:0] data2_p;
  input [11:0] data2_n;
  input [11:0] data3_p;
  input [11:0] data3_n;
  input [1:0] info0_p;
  input [1:0] info0_n;
  input [1:0] info1_p;
  input [1:0] info1_n;
  input [1:0] info2_p;
  input [1:0] info2_n;
  input [1:0] info3_p;
  input [1:0] info3_n;
  input valid_p;
  input valid_n;
  input data0_smpl_clk_p;
  input data0_smpl_clk_n;
  output data0_rdy_p;
  output data0_rdy_n;
  output sync_out_p;
  output sync_out_n;
  input sync_pps_p;
  input sync_pps_n;
  output adc_clk_out;
  output adc_clk90_out;
  output adc_clk180_out;
  output adc_clk270_out;
  input sys_clk;
  output adc_mmcm_locked;
  output [11:0] user_data_i0;
  output [11:0] user_data_i1;
  output [11:0] user_data_i2;
  output [11:0] user_data_i3;
  output [11:0] user_data_i4;
  output [11:0] user_data_i5;
  output [11:0] user_data_i6;
  output [11:0] user_data_i7;
  output [11:0] user_data_q0;
  output [11:0] user_data_q1;
  output [11:0] user_data_q2;
  output [11:0] user_data_q3;
  output [11:0] user_data_q4;
  output [11:0] user_data_q5;
  output [11:0] user_data_q6;
  output [11:0] user_data_q7;
  output [1:0] user_info_i0;
  output [1:0] user_info_i1;
  output [1:0] user_info_i2;
  output [1:0] user_info_i3;
  output [1:0] user_info_i4;
  output [1:0] user_info_i5;
  output [1:0] user_info_i6;
  output [1:0] user_info_i7;
  output [1:0] user_info_q0;
  output [1:0] user_info_q1;
  output [1:0] user_info_q2;
  output [1:0] user_info_q3;
  output [1:0] user_info_q4;
  output [1:0] user_info_q5;
  output [1:0] user_info_q6;
  output [1:0] user_info_q7;
  output user_valid;
  input user_rdy_i0;
  input [4:0] user_dly_val;
  input [5:0] user_load_dly0;
  input user_pos_mmcm_phs;
  input user_inc_mmcm_phs;
  output user_sync;
  output user_mmcm_locked;

  adcdac_2g_interface
    darkquad29_adc_in_adcdac_2g (
      .data0_p ( data0_p ),
      .data0_n ( data0_n ),
      .data1_p ( data1_p ),
      .data1_n ( data1_n ),
      .data2_p ( data2_p ),
      .data2_n ( data2_n ),
      .data3_p ( data3_p ),
      .data3_n ( data3_n ),
      .info0_p ( info0_p ),
      .info0_n ( info0_n ),
      .info1_p ( info1_p ),
      .info1_n ( info1_n ),
      .info2_p ( info2_p ),
      .info2_n ( info2_n ),
      .info3_p ( info3_p ),
      .info3_n ( info3_n ),
      .valid_p ( valid_p ),
      .valid_n ( valid_n ),
      .data0_smpl_clk_p ( data0_smpl_clk_p ),
      .data0_smpl_clk_n ( data0_smpl_clk_n ),
      .data0_rdy_p ( data0_rdy_p ),
      .data0_rdy_n ( data0_rdy_n ),
      .sync_out_p ( sync_out_p ),
      .sync_out_n ( sync_out_n ),
      .sync_pps_p ( sync_pps_p ),
      .sync_pps_n ( sync_pps_n ),
      .adc_clk_out ( adc_clk_out ),
      .adc_clk90_out ( adc_clk90_out ),
      .adc_clk180_out ( adc_clk180_out ),
      .adc_clk270_out ( adc_clk270_out ),
      .sys_clk ( sys_clk ),
      .adc_mmcm_locked ( adc_mmcm_locked ),
      .user_data_i0 ( user_data_i0 ),
      .user_data_i1 ( user_data_i1 ),
      .user_data_i2 ( user_data_i2 ),
      .user_data_i3 ( user_data_i3 ),
      .user_data_i4 ( user_data_i4 ),
      .user_data_i5 ( user_data_i5 ),
      .user_data_i6 ( user_data_i6 ),
      .user_data_i7 ( user_data_i7 ),
      .user_data_q0 ( user_data_q0 ),
      .user_data_q1 ( user_data_q1 ),
      .user_data_q2 ( user_data_q2 ),
      .user_data_q3 ( user_data_q3 ),
      .user_data_q4 ( user_data_q4 ),
      .user_data_q5 ( user_data_q5 ),
      .user_data_q6 ( user_data_q6 ),
      .user_data_q7 ( user_data_q7 ),
      .user_info_i0 ( user_info_i0 ),
      .user_info_i1 ( user_info_i1 ),
      .user_info_i2 ( user_info_i2 ),
      .user_info_i3 ( user_info_i3 ),
      .user_info_i4 ( user_info_i4 ),
      .user_info_i5 ( user_info_i5 ),
      .user_info_i6 ( user_info_i6 ),
      .user_info_i7 ( user_info_i7 ),
      .user_info_q0 ( user_info_q0 ),
      .user_info_q1 ( user_info_q1 ),
      .user_info_q2 ( user_info_q2 ),
      .user_info_q3 ( user_info_q3 ),
      .user_info_q4 ( user_info_q4 ),
      .user_info_q5 ( user_info_q5 ),
      .user_info_q6 ( user_info_q6 ),
      .user_info_q7 ( user_info_q7 ),
      .user_valid ( user_valid ),
      .user_rdy_i0 ( user_rdy_i0 ),
      .user_dly_val ( user_dly_val ),
      .user_load_dly0 ( user_load_dly0 ),
      .user_pos_mmcm_phs ( user_pos_mmcm_phs ),
      .user_inc_mmcm_phs ( user_inc_mmcm_phs ),
      .user_sync ( user_sync ),
      .user_mmcm_locked ( user_mmcm_locked )
    );

endmodule

