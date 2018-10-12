//-----------------------------------------------------------------------------
// system_qdr1_controller_wrapper.v
//-----------------------------------------------------------------------------

module system_qdr1_controller_wrapper
  (
    clk0,
    clk180,
    clk270,
    dly_clk,
    reset,
    idelay_rdy,
    qdr_k_n,
    qdr_k,
    qdr_d,
    qdr_sa,
    qdr_w_n,
    qdr_r_n,
    qdr_q,
    qdr_dll_off_n,
    phy_rdy,
    cal_fail,
    dly_extra_clk,
    dly_en_i,
    dly_en_o,
    dly_inc_dec,
    dly_cntrs,
    usr_addr,
    usr_wr_strb,
    usr_wr_data,
    usr_wr_be,
    usr_rd_strb,
    usr_rd_data,
    usr_rd_dvld
  );
  input clk0;
  input clk180;
  input clk270;
  input dly_clk;
  input reset;
  input idelay_rdy;
  output qdr_k_n;
  output qdr_k;
  output [35:0] qdr_d;
  output [20:0] qdr_sa;
  output qdr_w_n;
  output qdr_r_n;
  input [35:0] qdr_q;
  output qdr_dll_off_n;
  output phy_rdy;
  output cal_fail;
  input dly_extra_clk;
  input [35:0] dly_en_i;
  input [36:0] dly_en_o;
  input dly_inc_dec;
  output [364:0] dly_cntrs;
  input [20:0] usr_addr;
  input usr_wr_strb;
  input [71:0] usr_wr_data;
  input [7:0] usr_wr_be;
  input usr_rd_strb;
  output [71:0] usr_rd_data;
  output usr_rd_dvld;

  qdr_controller
    #(
      .DATA_WIDTH ( 36 ),
      .BW_WIDTH ( 4 ),
      .ADDR_WIDTH ( 21 ),
      .BURST_LENGTH ( 4 ),
      .CLK_FREQ ( 250 )
    )
    qdr1_controller (
      .clk0 ( clk0 ),
      .clk180 ( clk180 ),
      .clk270 ( clk270 ),
      .dly_clk ( dly_clk ),
      .reset ( reset ),
      .idelay_rdy ( idelay_rdy ),
      .qdr_k_n ( qdr_k_n ),
      .qdr_k ( qdr_k ),
      .qdr_d ( qdr_d ),
      .qdr_sa ( qdr_sa ),
      .qdr_w_n ( qdr_w_n ),
      .qdr_r_n ( qdr_r_n ),
      .qdr_q ( qdr_q ),
      .qdr_dll_off_n ( qdr_dll_off_n ),
      .phy_rdy ( phy_rdy ),
      .cal_fail ( cal_fail ),
      .dly_extra_clk ( dly_extra_clk ),
      .dly_en_i ( dly_en_i ),
      .dly_en_o ( dly_en_o ),
      .dly_inc_dec ( dly_inc_dec ),
      .dly_cntrs ( dly_cntrs ),
      .usr_addr ( usr_addr ),
      .usr_wr_strb ( usr_wr_strb ),
      .usr_wr_data ( usr_wr_data ),
      .usr_wr_be ( usr_wr_be ),
      .usr_rd_strb ( usr_rd_strb ),
      .usr_rd_data ( usr_rd_data ),
      .usr_rd_dvld ( usr_rd_dvld )
    );

endmodule

