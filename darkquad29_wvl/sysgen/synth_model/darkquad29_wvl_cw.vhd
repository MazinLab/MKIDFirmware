
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
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.conv_pkg.all;
-- synopsys translate_off
library unisim;
use unisim.vcomponents.all;
-- synopsys translate_on
entity xlclockdriver is
  generic (
    period: integer := 2;
    log_2_period: integer := 0;
    pipeline_regs: integer := 5;
    use_bufg: integer := 0
  );
  port (
    sysclk: in std_logic;
    sysclr: in std_logic;
    sysce: in std_logic;
    clk: out std_logic;
    clr: out std_logic;
    ce: out std_logic;
    ce_logic: out std_logic
  );
end xlclockdriver;
architecture behavior of xlclockdriver is
  component bufg
    port (
      i: in std_logic;
      o: out std_logic
    );
  end component;
  component synth_reg_w_init
    generic (
      width: integer;
      init_index: integer;
      init_value: bit_vector;
      latency: integer
    );
    port (
      i: in std_logic_vector(width - 1 downto 0);
      ce: in std_logic;
      clr: in std_logic;
      clk: in std_logic;
      o: out std_logic_vector(width - 1 downto 0)
    );
  end component;
  function size_of_uint(inp: integer; power_of_2: boolean)
    return integer
  is
    constant inp_vec: std_logic_vector(31 downto 0) :=
      integer_to_std_logic_vector(inp,32, xlUnsigned);
    variable result: integer;
  begin
    result := 32;
    for i in 0 to 31 loop
      if inp_vec(i) = '1' then
        result := i;
      end if;
    end loop;
    if power_of_2 then
      return result;
    else
      return result+1;
    end if;
  end;
  function is_power_of_2(inp: std_logic_vector)
    return boolean
  is
    constant width: integer := inp'length;
    variable vec: std_logic_vector(width - 1 downto 0);
    variable single_bit_set: boolean;
    variable more_than_one_bit_set: boolean;
    variable result: boolean;
  begin
    vec := inp;
    single_bit_set := false;
    more_than_one_bit_set := false;
    -- synopsys translate_off
    if (is_XorU(vec)) then
      return false;
    end if;
     -- synopsys translate_on
    if width > 0 then
      for i in 0 to width - 1 loop
        if vec(i) = '1' then
          if single_bit_set then
            more_than_one_bit_set := true;
          end if;
          single_bit_set := true;
        end if;
      end loop;
    end if;
    if (single_bit_set and not(more_than_one_bit_set)) then
      result := true;
    else
      result := false;
    end if;
    return result;
  end;
  function ce_reg_init_val(index, period : integer)
    return integer
  is
     variable result: integer;
   begin
      result := 0;
      if ((index mod period) = 0) then
          result := 1;
      end if;
      return result;
  end;
  function remaining_pipe_regs(num_pipeline_regs, period : integer)
    return integer
  is
     variable factor, result: integer;
  begin
      factor := (num_pipeline_regs / period);
      result := num_pipeline_regs - (period * factor) + 1;
      return result;
  end;

  function sg_min(L, R: INTEGER) return INTEGER is
  begin
      if L < R then
            return L;
      else
            return R;
      end if;
  end;
  constant max_pipeline_regs : integer := 8;
  constant pipe_regs : integer := 5;
  constant num_pipeline_regs : integer := sg_min(pipeline_regs, max_pipeline_regs);
  constant rem_pipeline_regs : integer := remaining_pipe_regs(num_pipeline_regs,period);
  constant period_floor: integer := max(2, period);
  constant power_of_2_counter: boolean :=
    is_power_of_2(integer_to_std_logic_vector(period_floor,32, xlUnsigned));
  constant cnt_width: integer :=
    size_of_uint(period_floor, power_of_2_counter);
  constant clk_for_ce_pulse_minus1: std_logic_vector(cnt_width - 1 downto 0) :=
    integer_to_std_logic_vector((period_floor - 2),cnt_width, xlUnsigned);
  constant clk_for_ce_pulse_minus2: std_logic_vector(cnt_width - 1 downto 0) :=
    integer_to_std_logic_vector(max(0,period - 3),cnt_width, xlUnsigned);
  constant clk_for_ce_pulse_minus_regs: std_logic_vector(cnt_width - 1 downto 0) :=
    integer_to_std_logic_vector(max(0,period - rem_pipeline_regs),cnt_width, xlUnsigned);
  signal clk_num: unsigned(cnt_width - 1 downto 0) := (others => '0');
  signal ce_vec : std_logic_vector(num_pipeline_regs downto 0);
  attribute MAX_FANOUT : string;
  attribute MAX_FANOUT of ce_vec:signal is "REDUCE";
  signal ce_vec_logic : std_logic_vector(num_pipeline_regs downto 0);
  attribute MAX_FANOUT of ce_vec_logic:signal is "REDUCE";
  signal internal_ce: std_logic_vector(0 downto 0);
  signal internal_ce_logic: std_logic_vector(0 downto 0);
  signal cnt_clr, cnt_clr_dly: std_logic_vector (0 downto 0);
begin
  clk <= sysclk;
  clr <= sysclr;
  cntr_gen: process(sysclk)
  begin
    if sysclk'event and sysclk = '1'  then
      if (sysce = '1') then
        if ((cnt_clr_dly(0) = '1') or (sysclr = '1')) then
          clk_num <= (others => '0');
        else
          clk_num <= clk_num + 1;
        end if;
    end if;
    end if;
  end process;
  clr_gen: process(clk_num, sysclr)
  begin
    if power_of_2_counter then
      cnt_clr(0) <= sysclr;
    else
      if (unsigned_to_std_logic_vector(clk_num) = clk_for_ce_pulse_minus1
          or sysclr = '1') then
        cnt_clr(0) <= '1';
      else
        cnt_clr(0) <= '0';
      end if;
    end if;
  end process;
  clr_reg: synth_reg_w_init
    generic map (
      width => 1,
      init_index => 0,
      init_value => b"0000",
      latency => 1
    )
    port map (
      i => cnt_clr,
      ce => sysce,
      clr => sysclr,
      clk => sysclk,
      o => cnt_clr_dly
    );
  pipelined_ce : if period > 1 generate
      ce_gen: process(clk_num)
      begin
          if unsigned_to_std_logic_vector(clk_num) = clk_for_ce_pulse_minus_regs then
              ce_vec(num_pipeline_regs) <= '1';
          else
              ce_vec(num_pipeline_regs) <= '0';
          end if;
      end process;
      ce_pipeline: for index in num_pipeline_regs downto 1 generate
          ce_reg : synth_reg_w_init
              generic map (
                  width => 1,
                  init_index => ce_reg_init_val(index, period),
                  init_value => b"0000",
                  latency => 1
                  )
              port map (
                  i => ce_vec(index downto index),
                  ce => sysce,
                  clr => sysclr,
                  clk => sysclk,
                  o => ce_vec(index-1 downto index-1)
                  );
      end generate;
      internal_ce <= ce_vec(0 downto 0);
  end generate;
  pipelined_ce_logic: if period > 1 generate
      ce_gen_logic: process(clk_num)
      begin
          if unsigned_to_std_logic_vector(clk_num) = clk_for_ce_pulse_minus_regs then
              ce_vec_logic(num_pipeline_regs) <= '1';
          else
              ce_vec_logic(num_pipeline_regs) <= '0';
          end if;
      end process;
      ce_logic_pipeline: for index in num_pipeline_regs downto 1 generate
          ce_logic_reg : synth_reg_w_init
              generic map (
                  width => 1,
                  init_index => ce_reg_init_val(index, period),
                  init_value => b"0000",
                  latency => 1
                  )
              port map (
                  i => ce_vec_logic(index downto index),
                  ce => sysce,
                  clr => sysclr,
                  clk => sysclk,
                  o => ce_vec_logic(index-1 downto index-1)
                  );
      end generate;
      internal_ce_logic <= ce_vec_logic(0 downto 0);
  end generate;
  use_bufg_true: if period > 1 and use_bufg = 1 generate
    ce_bufg_inst: bufg
      port map (
        i => internal_ce(0),
        o => ce
      );
    ce_bufg_inst_logic: bufg
      port map (
        i => internal_ce_logic(0),
        o => ce_logic
      );
  end generate;
  use_bufg_false: if period > 1 and (use_bufg = 0) generate
    ce <= internal_ce(0);
    ce_logic <= internal_ce_logic(0);
  end generate;
  generate_system_clk: if period = 1 generate
    ce <= sysce;
    ce_logic <= sysce;
  end generate;
end architecture behavior;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

entity default_clock_driver_darkquad29_wvl is
  port (
    sysce: in std_logic; 
    sysce_clr: in std_logic; 
    sysclk: in std_logic; 
    ce_1: out std_logic; 
    clk_1: out std_logic
  );
end default_clock_driver_darkquad29_wvl;

architecture structural of default_clock_driver_darkquad29_wvl is
  attribute syn_noprune: boolean;
  attribute syn_noprune of structural : architecture is true;
  attribute optimize_primitives: boolean;
  attribute optimize_primitives of structural : architecture is false;
  attribute dont_touch: boolean;
  attribute dont_touch of structural : architecture is true;

  signal sysce_clr_x0: std_logic;
  signal sysce_x0: std_logic;
  signal sysclk_x0: std_logic;
  signal xlclockdriver_1_ce: std_logic;
  signal xlclockdriver_1_clk: std_logic;

begin
  sysce_x0 <= sysce;
  sysce_clr_x0 <= sysce_clr;
  sysclk_x0 <= sysclk;
  ce_1 <= xlclockdriver_1_ce;
  clk_1 <= xlclockdriver_1_clk;

  xlclockdriver_1: entity work.xlclockdriver
    generic map (
      log_2_period => 1,
      period => 1,
      use_bufg => 0
    )
    port map (
      sysce => sysce_x0,
      sysclk => sysclk_x0,
      sysclr => sysce_clr_x0,
      ce => xlclockdriver_1_ce,
      clk => xlclockdriver_1_clk
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

entity darkquad29_wvl_cw is
  port (
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
end darkquad29_wvl_cw;

architecture structural of darkquad29_wvl_cw is
  component xlpersistentdff
    port (
      clk: in std_logic; 
      d: in std_logic; 
      q: out std_logic
    );
  end component;
  attribute syn_black_box: boolean;
  attribute syn_black_box of xlpersistentdff: component is true;
  attribute box_type: string;
  attribute box_type of xlpersistentdff: component is "black_box";
  attribute syn_noprune: boolean;
  attribute optimize_primitives: boolean;
  attribute dont_touch: boolean;
  attribute syn_noprune of xlpersistentdff: component is true;
  attribute optimize_primitives of xlpersistentdff: component is false;
  attribute dont_touch of xlpersistentdff: component is true;

  signal ce_1_sg_x1119: std_logic;
  attribute MAX_FANOUT: string;
  attribute MAX_FANOUT of ce_1_sg_x1119: signal is "REDUCE";
  signal clkNet: std_logic;
  signal clk_1_sg_x1119: std_logic;
  signal darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_data_net: std_logic_vector(7 downto 0);
  signal darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_full_net: std_logic;
  signal darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_rst_net: std_logic;
  signal darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_val_net: std_logic;
  signal darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_data_net: std_logic_vector(7 downto 0);
  signal darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_full_net: std_logic;
  signal darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_rst_net: std_logic;
  signal darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_val_net: std_logic;
  signal darkquad29_wvl_a2g_ctrl_en_bram_dump_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_a2g_ctrl_in_val_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_a2g_ctrl_last_tx_data_user_data_in_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_a2g_ctrl_lut_dump_buffer_size_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_addr_net: std_logic_vector(11 downto 0);
  signal darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_data_in_net: std_logic_vector(7 downto 0);
  signal darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_data_out_net: std_logic_vector(7 downto 0);
  signal darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_we_net: std_logic;
  signal darkquad29_wvl_a2g_ctrl_lut_dump_data_period_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_a2g_ctrl_lut_dump_sending_data_user_data_in_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_a2g_ctrl_reg_rx_full_user_data_in_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_a2g_ctrl_reg_tx_full_user_data_in_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_a2g_ctrl_rst_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_a2g_ctrl_tx_en_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_a2g_ctrl_v7_ready_user_data_in_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_acc_iq_avg0_ss_bram_addr_net: std_logic_vector(9 downto 0);
  signal darkquad29_wvl_acc_iq_avg0_ss_bram_data_in_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_acc_iq_avg0_ss_bram_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_acc_iq_avg0_ss_bram_we_net: std_logic;
  signal darkquad29_wvl_acc_iq_avg0_ss_ctrl_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_acc_iq_avg0_ss_status_user_data_in_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_acc_iq_avg1_ss_bram_addr_net: std_logic_vector(9 downto 0);
  signal darkquad29_wvl_acc_iq_avg1_ss_bram_data_in_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_acc_iq_avg1_ss_bram_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_acc_iq_avg1_ss_bram_we_net: std_logic;
  signal darkquad29_wvl_acc_iq_avg1_ss_ctrl_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_acc_iq_avg1_ss_status_user_data_in_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_acc_iq_avg2_ss_bram_addr_net: std_logic_vector(9 downto 0);
  signal darkquad29_wvl_acc_iq_avg2_ss_bram_data_in_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_acc_iq_avg2_ss_bram_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_acc_iq_avg2_ss_bram_we_net: std_logic;
  signal darkquad29_wvl_acc_iq_avg2_ss_ctrl_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_acc_iq_avg2_ss_status_user_data_in_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_acc_iq_avg3_ss_bram_addr_net: std_logic_vector(9 downto 0);
  signal darkquad29_wvl_acc_iq_avg3_ss_bram_data_in_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_acc_iq_avg3_ss_bram_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_acc_iq_avg3_ss_bram_we_net: std_logic;
  signal darkquad29_wvl_acc_iq_avg3_ss_ctrl_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_acc_iq_avg3_ss_status_user_data_in_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_acc_iq_start_acc_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_data_i0_net: std_logic_vector(11 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_data_i1_net: std_logic_vector(11 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_data_i2_net: std_logic_vector(11 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_data_i3_net: std_logic_vector(11 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_data_i4_net: std_logic_vector(11 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_data_i5_net: std_logic_vector(11 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_data_i6_net: std_logic_vector(11 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_data_i7_net: std_logic_vector(11 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_data_q0_net: std_logic_vector(11 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_data_q1_net: std_logic_vector(11 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_data_q2_net: std_logic_vector(11 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_data_q3_net: std_logic_vector(11 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_data_q4_net: std_logic_vector(11 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_data_q5_net: std_logic_vector(11 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_data_q6_net: std_logic_vector(11 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_data_q7_net: std_logic_vector(11 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_dly_val_net: std_logic_vector(4 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_inc_mmcm_phs_net: std_logic;
  signal darkquad29_wvl_adc_in_adcdac_2g_user_info_i0_net: std_logic_vector(1 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_info_i1_net: std_logic_vector(1 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_info_i2_net: std_logic_vector(1 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_info_i3_net: std_logic_vector(1 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_info_i4_net: std_logic_vector(1 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_info_i5_net: std_logic_vector(1 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_info_i6_net: std_logic_vector(1 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_info_i7_net: std_logic_vector(1 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_info_q0_net: std_logic_vector(1 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_info_q1_net: std_logic_vector(1 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_info_q2_net: std_logic_vector(1 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_info_q3_net: std_logic_vector(1 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_info_q4_net: std_logic_vector(1 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_info_q5_net: std_logic_vector(1 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_info_q6_net: std_logic_vector(1 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_info_q7_net: std_logic_vector(1 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_load_dly0_net: std_logic_vector(5 downto 0);
  signal darkquad29_wvl_adc_in_adcdac_2g_user_mmcm_locked_net: std_logic;
  signal darkquad29_wvl_adc_in_adcdac_2g_user_pos_mmcm_phs_net: std_logic;
  signal darkquad29_wvl_adc_in_adcdac_2g_user_rdy_i0_net: std_logic;
  signal darkquad29_wvl_adc_in_adcdac_2g_user_sync_net: std_logic;
  signal darkquad29_wvl_adc_in_adcdac_2g_user_valid_net: std_logic;
  signal darkquad29_wvl_adc_in_dly_val_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_adc_in_i_scale_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_adc_in_inc_phs_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_adc_in_load_dly_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_adc_in_locked_user_data_in_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_adc_in_n_miss_pps_user_data_in_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_adc_in_pos_phs_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_adc_in_raw_pps_user_data_in_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_adc_in_snp_cal0_ss_bram_addr_net: std_logic_vector(8 downto 0);
  signal darkquad29_wvl_adc_in_snp_cal0_ss_bram_data_in_net: std_logic_vector(63 downto 0);
  signal darkquad29_wvl_adc_in_snp_cal0_ss_bram_data_out_net: std_logic_vector(63 downto 0);
  signal darkquad29_wvl_adc_in_snp_cal0_ss_bram_we_net: std_logic;
  signal darkquad29_wvl_adc_in_snp_cal0_ss_ctrl_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_adc_in_snp_cal0_ss_status_user_data_in_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_adc_in_snp_cal1_ss_bram_addr_net: std_logic_vector(8 downto 0);
  signal darkquad29_wvl_adc_in_snp_cal1_ss_bram_data_in_net: std_logic_vector(63 downto 0);
  signal darkquad29_wvl_adc_in_snp_cal1_ss_bram_data_out_net: std_logic_vector(63 downto 0);
  signal darkquad29_wvl_adc_in_snp_cal1_ss_bram_we_net: std_logic;
  signal darkquad29_wvl_adc_in_snp_cal1_ss_ctrl_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_adc_in_snp_cal1_ss_status_user_data_in_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_adc_in_snp_cal2_ss_bram_addr_net: std_logic_vector(8 downto 0);
  signal darkquad29_wvl_adc_in_snp_cal2_ss_bram_data_in_net: std_logic_vector(63 downto 0);
  signal darkquad29_wvl_adc_in_snp_cal2_ss_bram_data_out_net: std_logic_vector(63 downto 0);
  signal darkquad29_wvl_adc_in_snp_cal2_ss_bram_we_net: std_logic;
  signal darkquad29_wvl_adc_in_snp_cal2_ss_ctrl_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_adc_in_snp_cal2_ss_status_user_data_in_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_adc_in_snp_cal3_ss_bram_addr_net: std_logic_vector(8 downto 0);
  signal darkquad29_wvl_adc_in_snp_cal3_ss_bram_data_in_net: std_logic_vector(63 downto 0);
  signal darkquad29_wvl_adc_in_snp_cal3_ss_bram_data_out_net: std_logic_vector(63 downto 0);
  signal darkquad29_wvl_adc_in_snp_cal3_ss_bram_we_net: std_logic;
  signal darkquad29_wvl_adc_in_snp_cal3_ss_ctrl_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_adc_in_snp_cal3_ss_status_user_data_in_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_adc_in_trig_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_adc_in_ts0_user_data_in_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_adc_in_ts1_user_data_in_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_adc_in_ts2_user_data_in_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_adc_in_ts3_user_data_in_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_adc_in_valid_user_data_in_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_board_num_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture0_base_kf_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture0_base_kq_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture0_cps_lim_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_addr_net: std_logic_vector(9 downto 0);
  signal darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_data_in_net: std_logic_vector(63 downto 0);
  signal darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_data_out_net: std_logic_vector(63 downto 0);
  signal darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_we_net: std_logic;
  signal darkquad29_wvl_capture0_load_thresh_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture0_pix_addr_net: std_logic_vector(9 downto 0);
  signal darkquad29_wvl_capture0_pix_data_in_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture0_pix_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture0_pix_we_net: std_logic;
  signal darkquad29_wvl_capture0_threshold_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture0_use_energy_cal_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture1_base_kf_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture1_base_kq_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture1_cps_lim_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_addr_net: std_logic_vector(9 downto 0);
  signal darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_data_in_net: std_logic_vector(63 downto 0);
  signal darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_data_out_net: std_logic_vector(63 downto 0);
  signal darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_we_net: std_logic;
  signal darkquad29_wvl_capture1_load_thresh_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture1_pix_addr_net: std_logic_vector(9 downto 0);
  signal darkquad29_wvl_capture1_pix_data_in_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture1_pix_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture1_pix_we_net: std_logic;
  signal darkquad29_wvl_capture1_threshold_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture1_use_energy_cal_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture2_base_kf_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture2_base_kq_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture2_cps_lim_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_addr_net: std_logic_vector(9 downto 0);
  signal darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_data_in_net: std_logic_vector(63 downto 0);
  signal darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_data_out_net: std_logic_vector(63 downto 0);
  signal darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_we_net: std_logic;
  signal darkquad29_wvl_capture2_load_thresh_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture2_pix_addr_net: std_logic_vector(9 downto 0);
  signal darkquad29_wvl_capture2_pix_data_in_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture2_pix_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture2_pix_we_net: std_logic;
  signal darkquad29_wvl_capture2_threshold_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture2_use_energy_cal_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture3_base_kf_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture3_base_kq_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture3_cps_lim_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_addr_net: std_logic_vector(9 downto 0);
  signal darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_data_in_net: std_logic_vector(63 downto 0);
  signal darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_data_out_net: std_logic_vector(63 downto 0);
  signal darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_we_net: std_logic;
  signal darkquad29_wvl_capture3_load_thresh_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture3_pix_addr_net: std_logic_vector(9 downto 0);
  signal darkquad29_wvl_capture3_pix_data_in_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture3_pix_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture3_pix_we_net: std_logic;
  signal darkquad29_wvl_capture3_threshold_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_capture3_use_energy_cal_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_chan_sel_ch_bin0_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_chan_sel_ch_bin1_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_chan_sel_ch_bin2_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_chan_sel_ch_bin3_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_chan_sel_load_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_check_lag_data_ch_user_data_in_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_check_lag_dds_ch_user_data_in_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_check_lag_latch_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_conv_phase0_centers_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_conv_phase0_load_centers_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_conv_phase1_centers_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_conv_phase1_load_centers_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_conv_phase2_centers_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_conv_phase2_load_centers_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_conv_phase3_centers_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_conv_phase3_load_centers_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_dds_lut_qdr0_ack_net: std_logic;
  signal darkquad29_wvl_dds_lut_qdr0_address_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_dds_lut_qdr0_be_net: std_logic_vector(7 downto 0);
  signal darkquad29_wvl_dds_lut_qdr0_cal_fail_net: std_logic;
  signal darkquad29_wvl_dds_lut_qdr0_data_in_net: std_logic_vector(71 downto 0);
  signal darkquad29_wvl_dds_lut_qdr0_data_out_net: std_logic_vector(71 downto 0);
  signal darkquad29_wvl_dds_lut_qdr0_data_valid_net: std_logic;
  signal darkquad29_wvl_dds_lut_qdr0_phy_ready_net: std_logic;
  signal darkquad29_wvl_dds_lut_qdr0_rd_en_net: std_logic;
  signal darkquad29_wvl_dds_lut_qdr0_wr_en_net: std_logic;
  signal darkquad29_wvl_dds_lut_qdr1_ack_net: std_logic;
  signal darkquad29_wvl_dds_lut_qdr1_address_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_dds_lut_qdr1_be_net: std_logic_vector(7 downto 0);
  signal darkquad29_wvl_dds_lut_qdr1_cal_fail_net: std_logic;
  signal darkquad29_wvl_dds_lut_qdr1_data_in_net: std_logic_vector(71 downto 0);
  signal darkquad29_wvl_dds_lut_qdr1_data_out_net: std_logic_vector(71 downto 0);
  signal darkquad29_wvl_dds_lut_qdr1_data_valid_net: std_logic;
  signal darkquad29_wvl_dds_lut_qdr1_phy_ready_net: std_logic;
  signal darkquad29_wvl_dds_lut_qdr1_rd_en_net: std_logic;
  signal darkquad29_wvl_dds_lut_qdr1_wr_en_net: std_logic;
  signal darkquad29_wvl_dds_lut_qdr2_ack_net: std_logic;
  signal darkquad29_wvl_dds_lut_qdr2_address_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_dds_lut_qdr2_be_net: std_logic_vector(7 downto 0);
  signal darkquad29_wvl_dds_lut_qdr2_cal_fail_net: std_logic;
  signal darkquad29_wvl_dds_lut_qdr2_data_in_net: std_logic_vector(71 downto 0);
  signal darkquad29_wvl_dds_lut_qdr2_data_out_net: std_logic_vector(71 downto 0);
  signal darkquad29_wvl_dds_lut_qdr2_data_valid_net: std_logic;
  signal darkquad29_wvl_dds_lut_qdr2_phy_ready_net: std_logic;
  signal darkquad29_wvl_dds_lut_qdr2_rd_en_net: std_logic;
  signal darkquad29_wvl_dds_lut_qdr2_wr_en_net: std_logic;
  signal darkquad29_wvl_dds_lut_qdr3_ack_net: std_logic;
  signal darkquad29_wvl_dds_lut_qdr3_address_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_dds_lut_qdr3_be_net: std_logic_vector(7 downto 0);
  signal darkquad29_wvl_dds_lut_qdr3_cal_fail_net: std_logic;
  signal darkquad29_wvl_dds_lut_qdr3_data_in_net: std_logic_vector(71 downto 0);
  signal darkquad29_wvl_dds_lut_qdr3_data_out_net: std_logic_vector(71 downto 0);
  signal darkquad29_wvl_dds_lut_qdr3_data_valid_net: std_logic;
  signal darkquad29_wvl_dds_lut_qdr3_phy_ready_net: std_logic;
  signal darkquad29_wvl_dds_lut_qdr3_rd_en_net: std_logic;
  signal darkquad29_wvl_dds_lut_qdr3_wr_en_net: std_logic;
  signal darkquad29_wvl_dds_lut_run_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_dds_shift_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_gbe64_dest_ip_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_gbe64_one_gbe_app_dbg_data_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_gbe64_one_gbe_app_dbg_dvld_net: std_logic;
  signal darkquad29_wvl_gbe64_one_gbe_app_rx_ack_net: std_logic;
  signal darkquad29_wvl_gbe64_one_gbe_app_rx_badframe_net: std_logic;
  signal darkquad29_wvl_gbe64_one_gbe_app_rx_data_net: std_logic_vector(7 downto 0);
  signal darkquad29_wvl_gbe64_one_gbe_app_rx_dvld_net: std_logic;
  signal darkquad29_wvl_gbe64_one_gbe_app_rx_eof_net: std_logic;
  signal darkquad29_wvl_gbe64_one_gbe_app_rx_overrun_net: std_logic;
  signal darkquad29_wvl_gbe64_one_gbe_app_rx_rst_net: std_logic;
  signal darkquad29_wvl_gbe64_one_gbe_app_rx_srcip_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_gbe64_one_gbe_app_rx_srcport_net: std_logic_vector(15 downto 0);
  signal darkquad29_wvl_gbe64_one_gbe_app_tx_afull_net: std_logic;
  signal darkquad29_wvl_gbe64_one_gbe_app_tx_data_net: std_logic_vector(7 downto 0);
  signal darkquad29_wvl_gbe64_one_gbe_app_tx_destip_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_gbe64_one_gbe_app_tx_destport_net: std_logic_vector(15 downto 0);
  signal darkquad29_wvl_gbe64_one_gbe_app_tx_dvld_net: std_logic;
  signal darkquad29_wvl_gbe64_one_gbe_app_tx_eof_net: std_logic;
  signal darkquad29_wvl_gbe64_one_gbe_app_tx_overflow_net: std_logic;
  signal darkquad29_wvl_gbe64_one_gbe_app_tx_rst_net: std_logic;
  signal darkquad29_wvl_gbe64_rst_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_gbe64_tx_afull_user_data_in_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_gbe64_tx_overrun_user_data_in_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_gbe64_words_per_frame_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_n_eof_sent_user_data_in_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_n_photons_user_data_in_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_pfb_fft_check_fft_oflow_user_data_in_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_phase_dmp_ch_we_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_phase_dmp_on_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_phase_port_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_photon_port_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_prog_fir0_load_chan_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_prog_fir0_single_chan_coeffs_addr_net: std_logic_vector(9 downto 0);
  signal darkquad29_wvl_prog_fir0_single_chan_coeffs_data_in_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_prog_fir0_single_chan_coeffs_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_prog_fir0_single_chan_coeffs_we_net: std_logic;
  signal darkquad29_wvl_prog_fir1_load_chan_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_prog_fir1_single_chan_coeffs_addr_net: std_logic_vector(9 downto 0);
  signal darkquad29_wvl_prog_fir1_single_chan_coeffs_data_in_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_prog_fir1_single_chan_coeffs_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_prog_fir1_single_chan_coeffs_we_net: std_logic;
  signal darkquad29_wvl_prog_fir2_load_chan_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_prog_fir2_single_chan_coeffs_addr_net: std_logic_vector(9 downto 0);
  signal darkquad29_wvl_prog_fir2_single_chan_coeffs_data_in_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_prog_fir2_single_chan_coeffs_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_prog_fir2_single_chan_coeffs_we_net: std_logic;
  signal darkquad29_wvl_prog_fir3_load_chan_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_prog_fir3_single_chan_coeffs_addr_net: std_logic_vector(9 downto 0);
  signal darkquad29_wvl_prog_fir3_single_chan_coeffs_data_in_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_prog_fir3_single_chan_coeffs_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_prog_fir3_single_chan_coeffs_we_net: std_logic;
  signal darkquad29_wvl_run_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_sel_ch_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_snp_phs_ss_bram_addr_net: std_logic_vector(8 downto 0);
  signal darkquad29_wvl_snp_phs_ss_bram_data_in_net: std_logic_vector(63 downto 0);
  signal darkquad29_wvl_snp_phs_ss_bram_data_out_net: std_logic_vector(63 downto 0);
  signal darkquad29_wvl_snp_phs_ss_bram_we_net: std_logic;
  signal darkquad29_wvl_snp_phs_ss_ctrl_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_snp_phs_ss_status_user_data_in_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_start_cap_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_timekeeper_base_ts_user_data_out_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_timekeeper_sec_now_user_data_in_net: std_logic_vector(31 downto 0);
  signal darkquad29_wvl_trig_snp_user_data_out_net: std_logic_vector(31 downto 0);
  signal persistentdff_inst_q: std_logic;
  attribute syn_keep: boolean;
  attribute syn_keep of persistentdff_inst_q: signal is true;
  attribute keep: boolean;
  attribute keep of persistentdff_inst_q: signal is true;
  attribute preserve_signal: boolean;
  attribute preserve_signal of persistentdff_inst_q: signal is true;

begin
  clkNet <= clk;
  darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_data_net <= darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_data;
  darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_full_net <= darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_full;
  darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_val_net <= darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_val;
  darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_full_net <= darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_full;
  darkquad29_wvl_a2g_ctrl_en_bram_dump_user_data_out_net <= darkquad29_wvl_a2g_ctrl_en_bram_dump_user_data_out;
  darkquad29_wvl_a2g_ctrl_in_val_user_data_out_net <= darkquad29_wvl_a2g_ctrl_in_val_user_data_out;
  darkquad29_wvl_a2g_ctrl_lut_dump_buffer_size_user_data_out_net <= darkquad29_wvl_a2g_ctrl_lut_dump_buffer_size_user_data_out;
  darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_data_out_net <= darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_data_out;
  darkquad29_wvl_a2g_ctrl_lut_dump_data_period_user_data_out_net <= darkquad29_wvl_a2g_ctrl_lut_dump_data_period_user_data_out;
  darkquad29_wvl_a2g_ctrl_rst_user_data_out_net <= darkquad29_wvl_a2g_ctrl_rst_user_data_out;
  darkquad29_wvl_a2g_ctrl_tx_en_user_data_out_net <= darkquad29_wvl_a2g_ctrl_tx_en_user_data_out;
  darkquad29_wvl_acc_iq_avg0_ss_bram_data_out_net <= darkquad29_wvl_acc_iq_avg0_ss_bram_data_out;
  darkquad29_wvl_acc_iq_avg0_ss_ctrl_user_data_out_net <= darkquad29_wvl_acc_iq_avg0_ss_ctrl_user_data_out;
  darkquad29_wvl_acc_iq_avg1_ss_bram_data_out_net <= darkquad29_wvl_acc_iq_avg1_ss_bram_data_out;
  darkquad29_wvl_acc_iq_avg1_ss_ctrl_user_data_out_net <= darkquad29_wvl_acc_iq_avg1_ss_ctrl_user_data_out;
  darkquad29_wvl_acc_iq_avg2_ss_bram_data_out_net <= darkquad29_wvl_acc_iq_avg2_ss_bram_data_out;
  darkquad29_wvl_acc_iq_avg2_ss_ctrl_user_data_out_net <= darkquad29_wvl_acc_iq_avg2_ss_ctrl_user_data_out;
  darkquad29_wvl_acc_iq_avg3_ss_bram_data_out_net <= darkquad29_wvl_acc_iq_avg3_ss_bram_data_out;
  darkquad29_wvl_acc_iq_avg3_ss_ctrl_user_data_out_net <= darkquad29_wvl_acc_iq_avg3_ss_ctrl_user_data_out;
  darkquad29_wvl_acc_iq_start_acc_user_data_out_net <= darkquad29_wvl_acc_iq_start_acc_user_data_out;
  darkquad29_wvl_adc_in_adcdac_2g_user_data_i0_net <= darkquad29_wvl_adc_in_adcdac_2g_user_data_i0;
  darkquad29_wvl_adc_in_adcdac_2g_user_data_i1_net <= darkquad29_wvl_adc_in_adcdac_2g_user_data_i1;
  darkquad29_wvl_adc_in_adcdac_2g_user_data_i2_net <= darkquad29_wvl_adc_in_adcdac_2g_user_data_i2;
  darkquad29_wvl_adc_in_adcdac_2g_user_data_i3_net <= darkquad29_wvl_adc_in_adcdac_2g_user_data_i3;
  darkquad29_wvl_adc_in_adcdac_2g_user_data_i4_net <= darkquad29_wvl_adc_in_adcdac_2g_user_data_i4;
  darkquad29_wvl_adc_in_adcdac_2g_user_data_i5_net <= darkquad29_wvl_adc_in_adcdac_2g_user_data_i5;
  darkquad29_wvl_adc_in_adcdac_2g_user_data_i6_net <= darkquad29_wvl_adc_in_adcdac_2g_user_data_i6;
  darkquad29_wvl_adc_in_adcdac_2g_user_data_i7_net <= darkquad29_wvl_adc_in_adcdac_2g_user_data_i7;
  darkquad29_wvl_adc_in_adcdac_2g_user_data_q0_net <= darkquad29_wvl_adc_in_adcdac_2g_user_data_q0;
  darkquad29_wvl_adc_in_adcdac_2g_user_data_q1_net <= darkquad29_wvl_adc_in_adcdac_2g_user_data_q1;
  darkquad29_wvl_adc_in_adcdac_2g_user_data_q2_net <= darkquad29_wvl_adc_in_adcdac_2g_user_data_q2;
  darkquad29_wvl_adc_in_adcdac_2g_user_data_q3_net <= darkquad29_wvl_adc_in_adcdac_2g_user_data_q3;
  darkquad29_wvl_adc_in_adcdac_2g_user_data_q4_net <= darkquad29_wvl_adc_in_adcdac_2g_user_data_q4;
  darkquad29_wvl_adc_in_adcdac_2g_user_data_q5_net <= darkquad29_wvl_adc_in_adcdac_2g_user_data_q5;
  darkquad29_wvl_adc_in_adcdac_2g_user_data_q6_net <= darkquad29_wvl_adc_in_adcdac_2g_user_data_q6;
  darkquad29_wvl_adc_in_adcdac_2g_user_data_q7_net <= darkquad29_wvl_adc_in_adcdac_2g_user_data_q7;
  darkquad29_wvl_adc_in_adcdac_2g_user_info_i0_net <= darkquad29_wvl_adc_in_adcdac_2g_user_info_i0;
  darkquad29_wvl_adc_in_adcdac_2g_user_info_i1_net <= darkquad29_wvl_adc_in_adcdac_2g_user_info_i1;
  darkquad29_wvl_adc_in_adcdac_2g_user_info_i2_net <= darkquad29_wvl_adc_in_adcdac_2g_user_info_i2;
  darkquad29_wvl_adc_in_adcdac_2g_user_info_i3_net <= darkquad29_wvl_adc_in_adcdac_2g_user_info_i3;
  darkquad29_wvl_adc_in_adcdac_2g_user_info_i4_net <= darkquad29_wvl_adc_in_adcdac_2g_user_info_i4;
  darkquad29_wvl_adc_in_adcdac_2g_user_info_i5_net <= darkquad29_wvl_adc_in_adcdac_2g_user_info_i5;
  darkquad29_wvl_adc_in_adcdac_2g_user_info_i6_net <= darkquad29_wvl_adc_in_adcdac_2g_user_info_i6;
  darkquad29_wvl_adc_in_adcdac_2g_user_info_i7_net <= darkquad29_wvl_adc_in_adcdac_2g_user_info_i7;
  darkquad29_wvl_adc_in_adcdac_2g_user_info_q0_net <= darkquad29_wvl_adc_in_adcdac_2g_user_info_q0;
  darkquad29_wvl_adc_in_adcdac_2g_user_info_q1_net <= darkquad29_wvl_adc_in_adcdac_2g_user_info_q1;
  darkquad29_wvl_adc_in_adcdac_2g_user_info_q2_net <= darkquad29_wvl_adc_in_adcdac_2g_user_info_q2;
  darkquad29_wvl_adc_in_adcdac_2g_user_info_q3_net <= darkquad29_wvl_adc_in_adcdac_2g_user_info_q3;
  darkquad29_wvl_adc_in_adcdac_2g_user_info_q4_net <= darkquad29_wvl_adc_in_adcdac_2g_user_info_q4;
  darkquad29_wvl_adc_in_adcdac_2g_user_info_q5_net <= darkquad29_wvl_adc_in_adcdac_2g_user_info_q5;
  darkquad29_wvl_adc_in_adcdac_2g_user_info_q6_net <= darkquad29_wvl_adc_in_adcdac_2g_user_info_q6;
  darkquad29_wvl_adc_in_adcdac_2g_user_info_q7_net <= darkquad29_wvl_adc_in_adcdac_2g_user_info_q7;
  darkquad29_wvl_adc_in_adcdac_2g_user_mmcm_locked_net <= darkquad29_wvl_adc_in_adcdac_2g_user_mmcm_locked;
  darkquad29_wvl_adc_in_adcdac_2g_user_sync_net <= darkquad29_wvl_adc_in_adcdac_2g_user_sync;
  darkquad29_wvl_adc_in_adcdac_2g_user_valid_net <= darkquad29_wvl_adc_in_adcdac_2g_user_valid;
  darkquad29_wvl_adc_in_dly_val_user_data_out_net <= darkquad29_wvl_adc_in_dly_val_user_data_out;
  darkquad29_wvl_adc_in_i_scale_user_data_out_net <= darkquad29_wvl_adc_in_i_scale_user_data_out;
  darkquad29_wvl_adc_in_inc_phs_user_data_out_net <= darkquad29_wvl_adc_in_inc_phs_user_data_out;
  darkquad29_wvl_adc_in_load_dly_user_data_out_net <= darkquad29_wvl_adc_in_load_dly_user_data_out;
  darkquad29_wvl_adc_in_pos_phs_user_data_out_net <= darkquad29_wvl_adc_in_pos_phs_user_data_out;
  darkquad29_wvl_adc_in_snp_cal0_ss_bram_data_out_net <= darkquad29_wvl_adc_in_snp_cal0_ss_bram_data_out;
  darkquad29_wvl_adc_in_snp_cal0_ss_ctrl_user_data_out_net <= darkquad29_wvl_adc_in_snp_cal0_ss_ctrl_user_data_out;
  darkquad29_wvl_adc_in_snp_cal1_ss_bram_data_out_net <= darkquad29_wvl_adc_in_snp_cal1_ss_bram_data_out;
  darkquad29_wvl_adc_in_snp_cal1_ss_ctrl_user_data_out_net <= darkquad29_wvl_adc_in_snp_cal1_ss_ctrl_user_data_out;
  darkquad29_wvl_adc_in_snp_cal2_ss_bram_data_out_net <= darkquad29_wvl_adc_in_snp_cal2_ss_bram_data_out;
  darkquad29_wvl_adc_in_snp_cal2_ss_ctrl_user_data_out_net <= darkquad29_wvl_adc_in_snp_cal2_ss_ctrl_user_data_out;
  darkquad29_wvl_adc_in_snp_cal3_ss_bram_data_out_net <= darkquad29_wvl_adc_in_snp_cal3_ss_bram_data_out;
  darkquad29_wvl_adc_in_snp_cal3_ss_ctrl_user_data_out_net <= darkquad29_wvl_adc_in_snp_cal3_ss_ctrl_user_data_out;
  darkquad29_wvl_adc_in_trig_user_data_out_net <= darkquad29_wvl_adc_in_trig_user_data_out;
  darkquad29_wvl_board_num_user_data_out_net <= darkquad29_wvl_board_num_user_data_out;
  darkquad29_wvl_capture0_base_kf_user_data_out_net <= darkquad29_wvl_capture0_base_kf_user_data_out;
  darkquad29_wvl_capture0_base_kq_user_data_out_net <= darkquad29_wvl_capture0_base_kq_user_data_out;
  darkquad29_wvl_capture0_cps_lim_user_data_out_net <= darkquad29_wvl_capture0_cps_lim_user_data_out;
  darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_data_out_net <= darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_data_out;
  darkquad29_wvl_capture0_load_thresh_user_data_out_net <= darkquad29_wvl_capture0_load_thresh_user_data_out;
  darkquad29_wvl_capture0_pix_data_out_net <= darkquad29_wvl_capture0_pix_data_out;
  darkquad29_wvl_capture0_threshold_user_data_out_net <= darkquad29_wvl_capture0_threshold_user_data_out;
  darkquad29_wvl_capture0_use_energy_cal_user_data_out_net <= darkquad29_wvl_capture0_use_energy_cal_user_data_out;
  darkquad29_wvl_capture1_base_kf_user_data_out_net <= darkquad29_wvl_capture1_base_kf_user_data_out;
  darkquad29_wvl_capture1_base_kq_user_data_out_net <= darkquad29_wvl_capture1_base_kq_user_data_out;
  darkquad29_wvl_capture1_cps_lim_user_data_out_net <= darkquad29_wvl_capture1_cps_lim_user_data_out;
  darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_data_out_net <= darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_data_out;
  darkquad29_wvl_capture1_load_thresh_user_data_out_net <= darkquad29_wvl_capture1_load_thresh_user_data_out;
  darkquad29_wvl_capture1_pix_data_out_net <= darkquad29_wvl_capture1_pix_data_out;
  darkquad29_wvl_capture1_threshold_user_data_out_net <= darkquad29_wvl_capture1_threshold_user_data_out;
  darkquad29_wvl_capture1_use_energy_cal_user_data_out_net <= darkquad29_wvl_capture1_use_energy_cal_user_data_out;
  darkquad29_wvl_capture2_base_kf_user_data_out_net <= darkquad29_wvl_capture2_base_kf_user_data_out;
  darkquad29_wvl_capture2_base_kq_user_data_out_net <= darkquad29_wvl_capture2_base_kq_user_data_out;
  darkquad29_wvl_capture2_cps_lim_user_data_out_net <= darkquad29_wvl_capture2_cps_lim_user_data_out;
  darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_data_out_net <= darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_data_out;
  darkquad29_wvl_capture2_load_thresh_user_data_out_net <= darkquad29_wvl_capture2_load_thresh_user_data_out;
  darkquad29_wvl_capture2_pix_data_out_net <= darkquad29_wvl_capture2_pix_data_out;
  darkquad29_wvl_capture2_threshold_user_data_out_net <= darkquad29_wvl_capture2_threshold_user_data_out;
  darkquad29_wvl_capture2_use_energy_cal_user_data_out_net <= darkquad29_wvl_capture2_use_energy_cal_user_data_out;
  darkquad29_wvl_capture3_base_kf_user_data_out_net <= darkquad29_wvl_capture3_base_kf_user_data_out;
  darkquad29_wvl_capture3_base_kq_user_data_out_net <= darkquad29_wvl_capture3_base_kq_user_data_out;
  darkquad29_wvl_capture3_cps_lim_user_data_out_net <= darkquad29_wvl_capture3_cps_lim_user_data_out;
  darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_data_out_net <= darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_data_out;
  darkquad29_wvl_capture3_load_thresh_user_data_out_net <= darkquad29_wvl_capture3_load_thresh_user_data_out;
  darkquad29_wvl_capture3_pix_data_out_net <= darkquad29_wvl_capture3_pix_data_out;
  darkquad29_wvl_capture3_threshold_user_data_out_net <= darkquad29_wvl_capture3_threshold_user_data_out;
  darkquad29_wvl_capture3_use_energy_cal_user_data_out_net <= darkquad29_wvl_capture3_use_energy_cal_user_data_out;
  darkquad29_wvl_chan_sel_ch_bin0_user_data_out_net <= darkquad29_wvl_chan_sel_ch_bin0_user_data_out;
  darkquad29_wvl_chan_sel_ch_bin1_user_data_out_net <= darkquad29_wvl_chan_sel_ch_bin1_user_data_out;
  darkquad29_wvl_chan_sel_ch_bin2_user_data_out_net <= darkquad29_wvl_chan_sel_ch_bin2_user_data_out;
  darkquad29_wvl_chan_sel_ch_bin3_user_data_out_net <= darkquad29_wvl_chan_sel_ch_bin3_user_data_out;
  darkquad29_wvl_chan_sel_load_user_data_out_net <= darkquad29_wvl_chan_sel_load_user_data_out;
  darkquad29_wvl_check_lag_latch_user_data_out_net <= darkquad29_wvl_check_lag_latch_user_data_out;
  darkquad29_wvl_conv_phase0_centers_user_data_out_net <= darkquad29_wvl_conv_phase0_centers_user_data_out;
  darkquad29_wvl_conv_phase0_load_centers_user_data_out_net <= darkquad29_wvl_conv_phase0_load_centers_user_data_out;
  darkquad29_wvl_conv_phase1_centers_user_data_out_net <= darkquad29_wvl_conv_phase1_centers_user_data_out;
  darkquad29_wvl_conv_phase1_load_centers_user_data_out_net <= darkquad29_wvl_conv_phase1_load_centers_user_data_out;
  darkquad29_wvl_conv_phase2_centers_user_data_out_net <= darkquad29_wvl_conv_phase2_centers_user_data_out;
  darkquad29_wvl_conv_phase2_load_centers_user_data_out_net <= darkquad29_wvl_conv_phase2_load_centers_user_data_out;
  darkquad29_wvl_conv_phase3_centers_user_data_out_net <= darkquad29_wvl_conv_phase3_centers_user_data_out;
  darkquad29_wvl_conv_phase3_load_centers_user_data_out_net <= darkquad29_wvl_conv_phase3_load_centers_user_data_out;
  darkquad29_wvl_dds_lut_qdr0_ack_net <= darkquad29_wvl_dds_lut_qdr0_ack;
  darkquad29_wvl_dds_lut_qdr0_cal_fail_net <= darkquad29_wvl_dds_lut_qdr0_cal_fail;
  darkquad29_wvl_dds_lut_qdr0_data_out_net <= darkquad29_wvl_dds_lut_qdr0_data_out;
  darkquad29_wvl_dds_lut_qdr0_data_valid_net <= darkquad29_wvl_dds_lut_qdr0_data_valid;
  darkquad29_wvl_dds_lut_qdr0_phy_ready_net <= darkquad29_wvl_dds_lut_qdr0_phy_ready;
  darkquad29_wvl_dds_lut_qdr1_ack_net <= darkquad29_wvl_dds_lut_qdr1_ack;
  darkquad29_wvl_dds_lut_qdr1_cal_fail_net <= darkquad29_wvl_dds_lut_qdr1_cal_fail;
  darkquad29_wvl_dds_lut_qdr1_data_out_net <= darkquad29_wvl_dds_lut_qdr1_data_out;
  darkquad29_wvl_dds_lut_qdr1_data_valid_net <= darkquad29_wvl_dds_lut_qdr1_data_valid;
  darkquad29_wvl_dds_lut_qdr1_phy_ready_net <= darkquad29_wvl_dds_lut_qdr1_phy_ready;
  darkquad29_wvl_dds_lut_qdr2_ack_net <= darkquad29_wvl_dds_lut_qdr2_ack;
  darkquad29_wvl_dds_lut_qdr2_cal_fail_net <= darkquad29_wvl_dds_lut_qdr2_cal_fail;
  darkquad29_wvl_dds_lut_qdr2_data_out_net <= darkquad29_wvl_dds_lut_qdr2_data_out;
  darkquad29_wvl_dds_lut_qdr2_data_valid_net <= darkquad29_wvl_dds_lut_qdr2_data_valid;
  darkquad29_wvl_dds_lut_qdr2_phy_ready_net <= darkquad29_wvl_dds_lut_qdr2_phy_ready;
  darkquad29_wvl_dds_lut_qdr3_ack_net <= darkquad29_wvl_dds_lut_qdr3_ack;
  darkquad29_wvl_dds_lut_qdr3_cal_fail_net <= darkquad29_wvl_dds_lut_qdr3_cal_fail;
  darkquad29_wvl_dds_lut_qdr3_data_out_net <= darkquad29_wvl_dds_lut_qdr3_data_out;
  darkquad29_wvl_dds_lut_qdr3_data_valid_net <= darkquad29_wvl_dds_lut_qdr3_data_valid;
  darkquad29_wvl_dds_lut_qdr3_phy_ready_net <= darkquad29_wvl_dds_lut_qdr3_phy_ready;
  darkquad29_wvl_dds_lut_run_user_data_out_net <= darkquad29_wvl_dds_lut_run_user_data_out;
  darkquad29_wvl_dds_shift_user_data_out_net <= darkquad29_wvl_dds_shift_user_data_out;
  darkquad29_wvl_gbe64_dest_ip_user_data_out_net <= darkquad29_wvl_gbe64_dest_ip_user_data_out;
  darkquad29_wvl_gbe64_one_gbe_app_dbg_data_net <= darkquad29_wvl_gbe64_one_gbe_app_dbg_data;
  darkquad29_wvl_gbe64_one_gbe_app_dbg_dvld_net <= darkquad29_wvl_gbe64_one_gbe_app_dbg_dvld;
  darkquad29_wvl_gbe64_one_gbe_app_rx_badframe_net <= darkquad29_wvl_gbe64_one_gbe_app_rx_badframe;
  darkquad29_wvl_gbe64_one_gbe_app_rx_data_net <= darkquad29_wvl_gbe64_one_gbe_app_rx_data;
  darkquad29_wvl_gbe64_one_gbe_app_rx_dvld_net <= darkquad29_wvl_gbe64_one_gbe_app_rx_dvld;
  darkquad29_wvl_gbe64_one_gbe_app_rx_eof_net <= darkquad29_wvl_gbe64_one_gbe_app_rx_eof;
  darkquad29_wvl_gbe64_one_gbe_app_rx_overrun_net <= darkquad29_wvl_gbe64_one_gbe_app_rx_overrun;
  darkquad29_wvl_gbe64_one_gbe_app_rx_srcip_net <= darkquad29_wvl_gbe64_one_gbe_app_rx_srcip;
  darkquad29_wvl_gbe64_one_gbe_app_rx_srcport_net <= darkquad29_wvl_gbe64_one_gbe_app_rx_srcport;
  darkquad29_wvl_gbe64_one_gbe_app_tx_afull_net <= darkquad29_wvl_gbe64_one_gbe_app_tx_afull;
  darkquad29_wvl_gbe64_one_gbe_app_tx_overflow_net <= darkquad29_wvl_gbe64_one_gbe_app_tx_overflow;
  darkquad29_wvl_gbe64_rst_user_data_out_net <= darkquad29_wvl_gbe64_rst_user_data_out;
  darkquad29_wvl_gbe64_words_per_frame_user_data_out_net <= darkquad29_wvl_gbe64_words_per_frame_user_data_out;
  darkquad29_wvl_phase_dmp_ch_we_user_data_out_net <= darkquad29_wvl_phase_dmp_ch_we_user_data_out;
  darkquad29_wvl_phase_dmp_on_user_data_out_net <= darkquad29_wvl_phase_dmp_on_user_data_out;
  darkquad29_wvl_phase_port_user_data_out_net <= darkquad29_wvl_phase_port_user_data_out;
  darkquad29_wvl_photon_port_user_data_out_net <= darkquad29_wvl_photon_port_user_data_out;
  darkquad29_wvl_prog_fir0_load_chan_user_data_out_net <= darkquad29_wvl_prog_fir0_load_chan_user_data_out;
  darkquad29_wvl_prog_fir0_single_chan_coeffs_data_out_net <= darkquad29_wvl_prog_fir0_single_chan_coeffs_data_out;
  darkquad29_wvl_prog_fir1_load_chan_user_data_out_net <= darkquad29_wvl_prog_fir1_load_chan_user_data_out;
  darkquad29_wvl_prog_fir1_single_chan_coeffs_data_out_net <= darkquad29_wvl_prog_fir1_single_chan_coeffs_data_out;
  darkquad29_wvl_prog_fir2_load_chan_user_data_out_net <= darkquad29_wvl_prog_fir2_load_chan_user_data_out;
  darkquad29_wvl_prog_fir2_single_chan_coeffs_data_out_net <= darkquad29_wvl_prog_fir2_single_chan_coeffs_data_out;
  darkquad29_wvl_prog_fir3_load_chan_user_data_out_net <= darkquad29_wvl_prog_fir3_load_chan_user_data_out;
  darkquad29_wvl_prog_fir3_single_chan_coeffs_data_out_net <= darkquad29_wvl_prog_fir3_single_chan_coeffs_data_out;
  darkquad29_wvl_run_user_data_out_net <= darkquad29_wvl_run_user_data_out;
  darkquad29_wvl_sel_ch_user_data_out_net <= darkquad29_wvl_sel_ch_user_data_out;
  darkquad29_wvl_snp_phs_ss_bram_data_out_net <= darkquad29_wvl_snp_phs_ss_bram_data_out;
  darkquad29_wvl_snp_phs_ss_ctrl_user_data_out_net <= darkquad29_wvl_snp_phs_ss_ctrl_user_data_out;
  darkquad29_wvl_start_cap_user_data_out_net <= darkquad29_wvl_start_cap_user_data_out;
  darkquad29_wvl_timekeeper_base_ts_user_data_out_net <= darkquad29_wvl_timekeeper_base_ts_user_data_out;
  darkquad29_wvl_trig_snp_user_data_out_net <= darkquad29_wvl_trig_snp_user_data_out;
  darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_rst <= darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_rst_net;
  darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_data <= darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_data_net;
  darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_rst <= darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_rst_net;
  darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_val <= darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_val_net;
  darkquad29_wvl_a2g_ctrl_last_tx_data_user_data_in <= darkquad29_wvl_a2g_ctrl_last_tx_data_user_data_in_net;
  darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_addr <= darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_addr_net;
  darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_data_in <= darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_data_in_net;
  darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_we <= darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_we_net;
  darkquad29_wvl_a2g_ctrl_lut_dump_sending_data_user_data_in <= darkquad29_wvl_a2g_ctrl_lut_dump_sending_data_user_data_in_net;
  darkquad29_wvl_a2g_ctrl_reg_rx_full_user_data_in <= darkquad29_wvl_a2g_ctrl_reg_rx_full_user_data_in_net;
  darkquad29_wvl_a2g_ctrl_reg_tx_full_user_data_in <= darkquad29_wvl_a2g_ctrl_reg_tx_full_user_data_in_net;
  darkquad29_wvl_a2g_ctrl_v7_ready_user_data_in <= darkquad29_wvl_a2g_ctrl_v7_ready_user_data_in_net;
  darkquad29_wvl_acc_iq_avg0_ss_bram_addr <= darkquad29_wvl_acc_iq_avg0_ss_bram_addr_net;
  darkquad29_wvl_acc_iq_avg0_ss_bram_data_in <= darkquad29_wvl_acc_iq_avg0_ss_bram_data_in_net;
  darkquad29_wvl_acc_iq_avg0_ss_bram_we <= darkquad29_wvl_acc_iq_avg0_ss_bram_we_net;
  darkquad29_wvl_acc_iq_avg0_ss_status_user_data_in <= darkquad29_wvl_acc_iq_avg0_ss_status_user_data_in_net;
  darkquad29_wvl_acc_iq_avg1_ss_bram_addr <= darkquad29_wvl_acc_iq_avg1_ss_bram_addr_net;
  darkquad29_wvl_acc_iq_avg1_ss_bram_data_in <= darkquad29_wvl_acc_iq_avg1_ss_bram_data_in_net;
  darkquad29_wvl_acc_iq_avg1_ss_bram_we <= darkquad29_wvl_acc_iq_avg1_ss_bram_we_net;
  darkquad29_wvl_acc_iq_avg1_ss_status_user_data_in <= darkquad29_wvl_acc_iq_avg1_ss_status_user_data_in_net;
  darkquad29_wvl_acc_iq_avg2_ss_bram_addr <= darkquad29_wvl_acc_iq_avg2_ss_bram_addr_net;
  darkquad29_wvl_acc_iq_avg2_ss_bram_data_in <= darkquad29_wvl_acc_iq_avg2_ss_bram_data_in_net;
  darkquad29_wvl_acc_iq_avg2_ss_bram_we <= darkquad29_wvl_acc_iq_avg2_ss_bram_we_net;
  darkquad29_wvl_acc_iq_avg2_ss_status_user_data_in <= darkquad29_wvl_acc_iq_avg2_ss_status_user_data_in_net;
  darkquad29_wvl_acc_iq_avg3_ss_bram_addr <= darkquad29_wvl_acc_iq_avg3_ss_bram_addr_net;
  darkquad29_wvl_acc_iq_avg3_ss_bram_data_in <= darkquad29_wvl_acc_iq_avg3_ss_bram_data_in_net;
  darkquad29_wvl_acc_iq_avg3_ss_bram_we <= darkquad29_wvl_acc_iq_avg3_ss_bram_we_net;
  darkquad29_wvl_acc_iq_avg3_ss_status_user_data_in <= darkquad29_wvl_acc_iq_avg3_ss_status_user_data_in_net;
  darkquad29_wvl_adc_in_adcdac_2g_user_dly_val <= darkquad29_wvl_adc_in_adcdac_2g_user_dly_val_net;
  darkquad29_wvl_adc_in_adcdac_2g_user_inc_mmcm_phs <= darkquad29_wvl_adc_in_adcdac_2g_user_inc_mmcm_phs_net;
  darkquad29_wvl_adc_in_adcdac_2g_user_load_dly0 <= darkquad29_wvl_adc_in_adcdac_2g_user_load_dly0_net;
  darkquad29_wvl_adc_in_adcdac_2g_user_pos_mmcm_phs <= darkquad29_wvl_adc_in_adcdac_2g_user_pos_mmcm_phs_net;
  darkquad29_wvl_adc_in_adcdac_2g_user_rdy_i0 <= darkquad29_wvl_adc_in_adcdac_2g_user_rdy_i0_net;
  darkquad29_wvl_adc_in_locked_user_data_in <= darkquad29_wvl_adc_in_locked_user_data_in_net;
  darkquad29_wvl_adc_in_n_miss_pps_user_data_in <= darkquad29_wvl_adc_in_n_miss_pps_user_data_in_net;
  darkquad29_wvl_adc_in_raw_pps_user_data_in <= darkquad29_wvl_adc_in_raw_pps_user_data_in_net;
  darkquad29_wvl_adc_in_snp_cal0_ss_bram_addr <= darkquad29_wvl_adc_in_snp_cal0_ss_bram_addr_net;
  darkquad29_wvl_adc_in_snp_cal0_ss_bram_data_in <= darkquad29_wvl_adc_in_snp_cal0_ss_bram_data_in_net;
  darkquad29_wvl_adc_in_snp_cal0_ss_bram_we <= darkquad29_wvl_adc_in_snp_cal0_ss_bram_we_net;
  darkquad29_wvl_adc_in_snp_cal0_ss_status_user_data_in <= darkquad29_wvl_adc_in_snp_cal0_ss_status_user_data_in_net;
  darkquad29_wvl_adc_in_snp_cal1_ss_bram_addr <= darkquad29_wvl_adc_in_snp_cal1_ss_bram_addr_net;
  darkquad29_wvl_adc_in_snp_cal1_ss_bram_data_in <= darkquad29_wvl_adc_in_snp_cal1_ss_bram_data_in_net;
  darkquad29_wvl_adc_in_snp_cal1_ss_bram_we <= darkquad29_wvl_adc_in_snp_cal1_ss_bram_we_net;
  darkquad29_wvl_adc_in_snp_cal1_ss_status_user_data_in <= darkquad29_wvl_adc_in_snp_cal1_ss_status_user_data_in_net;
  darkquad29_wvl_adc_in_snp_cal2_ss_bram_addr <= darkquad29_wvl_adc_in_snp_cal2_ss_bram_addr_net;
  darkquad29_wvl_adc_in_snp_cal2_ss_bram_data_in <= darkquad29_wvl_adc_in_snp_cal2_ss_bram_data_in_net;
  darkquad29_wvl_adc_in_snp_cal2_ss_bram_we <= darkquad29_wvl_adc_in_snp_cal2_ss_bram_we_net;
  darkquad29_wvl_adc_in_snp_cal2_ss_status_user_data_in <= darkquad29_wvl_adc_in_snp_cal2_ss_status_user_data_in_net;
  darkquad29_wvl_adc_in_snp_cal3_ss_bram_addr <= darkquad29_wvl_adc_in_snp_cal3_ss_bram_addr_net;
  darkquad29_wvl_adc_in_snp_cal3_ss_bram_data_in <= darkquad29_wvl_adc_in_snp_cal3_ss_bram_data_in_net;
  darkquad29_wvl_adc_in_snp_cal3_ss_bram_we <= darkquad29_wvl_adc_in_snp_cal3_ss_bram_we_net;
  darkquad29_wvl_adc_in_snp_cal3_ss_status_user_data_in <= darkquad29_wvl_adc_in_snp_cal3_ss_status_user_data_in_net;
  darkquad29_wvl_adc_in_ts0_user_data_in <= darkquad29_wvl_adc_in_ts0_user_data_in_net;
  darkquad29_wvl_adc_in_ts1_user_data_in <= darkquad29_wvl_adc_in_ts1_user_data_in_net;
  darkquad29_wvl_adc_in_ts2_user_data_in <= darkquad29_wvl_adc_in_ts2_user_data_in_net;
  darkquad29_wvl_adc_in_ts3_user_data_in <= darkquad29_wvl_adc_in_ts3_user_data_in_net;
  darkquad29_wvl_adc_in_valid_user_data_in <= darkquad29_wvl_adc_in_valid_user_data_in_net;
  darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_addr <= darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_addr_net;
  darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_data_in <= darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_data_in_net;
  darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_we <= darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_we_net;
  darkquad29_wvl_capture0_pix_addr <= darkquad29_wvl_capture0_pix_addr_net;
  darkquad29_wvl_capture0_pix_data_in <= darkquad29_wvl_capture0_pix_data_in_net;
  darkquad29_wvl_capture0_pix_we <= darkquad29_wvl_capture0_pix_we_net;
  darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_addr <= darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_addr_net;
  darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_data_in <= darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_data_in_net;
  darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_we <= darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_we_net;
  darkquad29_wvl_capture1_pix_addr <= darkquad29_wvl_capture1_pix_addr_net;
  darkquad29_wvl_capture1_pix_data_in <= darkquad29_wvl_capture1_pix_data_in_net;
  darkquad29_wvl_capture1_pix_we <= darkquad29_wvl_capture1_pix_we_net;
  darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_addr <= darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_addr_net;
  darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_data_in <= darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_data_in_net;
  darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_we <= darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_we_net;
  darkquad29_wvl_capture2_pix_addr <= darkquad29_wvl_capture2_pix_addr_net;
  darkquad29_wvl_capture2_pix_data_in <= darkquad29_wvl_capture2_pix_data_in_net;
  darkquad29_wvl_capture2_pix_we <= darkquad29_wvl_capture2_pix_we_net;
  darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_addr <= darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_addr_net;
  darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_data_in <= darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_data_in_net;
  darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_we <= darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_we_net;
  darkquad29_wvl_capture3_pix_addr <= darkquad29_wvl_capture3_pix_addr_net;
  darkquad29_wvl_capture3_pix_data_in <= darkquad29_wvl_capture3_pix_data_in_net;
  darkquad29_wvl_capture3_pix_we <= darkquad29_wvl_capture3_pix_we_net;
  darkquad29_wvl_check_lag_data_ch_user_data_in <= darkquad29_wvl_check_lag_data_ch_user_data_in_net;
  darkquad29_wvl_check_lag_dds_ch_user_data_in <= darkquad29_wvl_check_lag_dds_ch_user_data_in_net;
  darkquad29_wvl_dds_lut_qdr0_address <= darkquad29_wvl_dds_lut_qdr0_address_net;
  darkquad29_wvl_dds_lut_qdr0_be <= darkquad29_wvl_dds_lut_qdr0_be_net;
  darkquad29_wvl_dds_lut_qdr0_data_in <= darkquad29_wvl_dds_lut_qdr0_data_in_net;
  darkquad29_wvl_dds_lut_qdr0_rd_en <= darkquad29_wvl_dds_lut_qdr0_rd_en_net;
  darkquad29_wvl_dds_lut_qdr0_wr_en <= darkquad29_wvl_dds_lut_qdr0_wr_en_net;
  darkquad29_wvl_dds_lut_qdr1_address <= darkquad29_wvl_dds_lut_qdr1_address_net;
  darkquad29_wvl_dds_lut_qdr1_be <= darkquad29_wvl_dds_lut_qdr1_be_net;
  darkquad29_wvl_dds_lut_qdr1_data_in <= darkquad29_wvl_dds_lut_qdr1_data_in_net;
  darkquad29_wvl_dds_lut_qdr1_rd_en <= darkquad29_wvl_dds_lut_qdr1_rd_en_net;
  darkquad29_wvl_dds_lut_qdr1_wr_en <= darkquad29_wvl_dds_lut_qdr1_wr_en_net;
  darkquad29_wvl_dds_lut_qdr2_address <= darkquad29_wvl_dds_lut_qdr2_address_net;
  darkquad29_wvl_dds_lut_qdr2_be <= darkquad29_wvl_dds_lut_qdr2_be_net;
  darkquad29_wvl_dds_lut_qdr2_data_in <= darkquad29_wvl_dds_lut_qdr2_data_in_net;
  darkquad29_wvl_dds_lut_qdr2_rd_en <= darkquad29_wvl_dds_lut_qdr2_rd_en_net;
  darkquad29_wvl_dds_lut_qdr2_wr_en <= darkquad29_wvl_dds_lut_qdr2_wr_en_net;
  darkquad29_wvl_dds_lut_qdr3_address <= darkquad29_wvl_dds_lut_qdr3_address_net;
  darkquad29_wvl_dds_lut_qdr3_be <= darkquad29_wvl_dds_lut_qdr3_be_net;
  darkquad29_wvl_dds_lut_qdr3_data_in <= darkquad29_wvl_dds_lut_qdr3_data_in_net;
  darkquad29_wvl_dds_lut_qdr3_rd_en <= darkquad29_wvl_dds_lut_qdr3_rd_en_net;
  darkquad29_wvl_dds_lut_qdr3_wr_en <= darkquad29_wvl_dds_lut_qdr3_wr_en_net;
  darkquad29_wvl_gbe64_one_gbe_app_rx_ack <= darkquad29_wvl_gbe64_one_gbe_app_rx_ack_net;
  darkquad29_wvl_gbe64_one_gbe_app_rx_rst <= darkquad29_wvl_gbe64_one_gbe_app_rx_rst_net;
  darkquad29_wvl_gbe64_one_gbe_app_tx_data <= darkquad29_wvl_gbe64_one_gbe_app_tx_data_net;
  darkquad29_wvl_gbe64_one_gbe_app_tx_destip <= darkquad29_wvl_gbe64_one_gbe_app_tx_destip_net;
  darkquad29_wvl_gbe64_one_gbe_app_tx_destport <= darkquad29_wvl_gbe64_one_gbe_app_tx_destport_net;
  darkquad29_wvl_gbe64_one_gbe_app_tx_dvld <= darkquad29_wvl_gbe64_one_gbe_app_tx_dvld_net;
  darkquad29_wvl_gbe64_one_gbe_app_tx_eof <= darkquad29_wvl_gbe64_one_gbe_app_tx_eof_net;
  darkquad29_wvl_gbe64_one_gbe_app_tx_rst <= darkquad29_wvl_gbe64_one_gbe_app_tx_rst_net;
  darkquad29_wvl_gbe64_tx_afull_user_data_in <= darkquad29_wvl_gbe64_tx_afull_user_data_in_net;
  darkquad29_wvl_gbe64_tx_overrun_user_data_in <= darkquad29_wvl_gbe64_tx_overrun_user_data_in_net;
  darkquad29_wvl_n_eof_sent_user_data_in <= darkquad29_wvl_n_eof_sent_user_data_in_net;
  darkquad29_wvl_n_photons_user_data_in <= darkquad29_wvl_n_photons_user_data_in_net;
  darkquad29_wvl_pfb_fft_check_fft_oflow_user_data_in <= darkquad29_wvl_pfb_fft_check_fft_oflow_user_data_in_net;
  darkquad29_wvl_prog_fir0_single_chan_coeffs_addr <= darkquad29_wvl_prog_fir0_single_chan_coeffs_addr_net;
  darkquad29_wvl_prog_fir0_single_chan_coeffs_data_in <= darkquad29_wvl_prog_fir0_single_chan_coeffs_data_in_net;
  darkquad29_wvl_prog_fir0_single_chan_coeffs_we <= darkquad29_wvl_prog_fir0_single_chan_coeffs_we_net;
  darkquad29_wvl_prog_fir1_single_chan_coeffs_addr <= darkquad29_wvl_prog_fir1_single_chan_coeffs_addr_net;
  darkquad29_wvl_prog_fir1_single_chan_coeffs_data_in <= darkquad29_wvl_prog_fir1_single_chan_coeffs_data_in_net;
  darkquad29_wvl_prog_fir1_single_chan_coeffs_we <= darkquad29_wvl_prog_fir1_single_chan_coeffs_we_net;
  darkquad29_wvl_prog_fir2_single_chan_coeffs_addr <= darkquad29_wvl_prog_fir2_single_chan_coeffs_addr_net;
  darkquad29_wvl_prog_fir2_single_chan_coeffs_data_in <= darkquad29_wvl_prog_fir2_single_chan_coeffs_data_in_net;
  darkquad29_wvl_prog_fir2_single_chan_coeffs_we <= darkquad29_wvl_prog_fir2_single_chan_coeffs_we_net;
  darkquad29_wvl_prog_fir3_single_chan_coeffs_addr <= darkquad29_wvl_prog_fir3_single_chan_coeffs_addr_net;
  darkquad29_wvl_prog_fir3_single_chan_coeffs_data_in <= darkquad29_wvl_prog_fir3_single_chan_coeffs_data_in_net;
  darkquad29_wvl_prog_fir3_single_chan_coeffs_we <= darkquad29_wvl_prog_fir3_single_chan_coeffs_we_net;
  darkquad29_wvl_snp_phs_ss_bram_addr <= darkquad29_wvl_snp_phs_ss_bram_addr_net;
  darkquad29_wvl_snp_phs_ss_bram_data_in <= darkquad29_wvl_snp_phs_ss_bram_data_in_net;
  darkquad29_wvl_snp_phs_ss_bram_we <= darkquad29_wvl_snp_phs_ss_bram_we_net;
  darkquad29_wvl_snp_phs_ss_status_user_data_in <= darkquad29_wvl_snp_phs_ss_status_user_data_in_net;
  darkquad29_wvl_timekeeper_sec_now_user_data_in <= darkquad29_wvl_timekeeper_sec_now_user_data_in_net;

  darkquad29_wvl_x0: entity work.darkquad29_wvl
    port map (
      ce_1 => ce_1_sg_x1119,
      clk_1 => clk_1_sg_x1119,
      darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_data => darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_data_net,
      darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_full => darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_full_net,
      darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_val => darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_val_net,
      darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_full => darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_full_net,
      darkquad29_wvl_a2g_ctrl_en_bram_dump_user_data_out => darkquad29_wvl_a2g_ctrl_en_bram_dump_user_data_out_net,
      darkquad29_wvl_a2g_ctrl_in_val_user_data_out => darkquad29_wvl_a2g_ctrl_in_val_user_data_out_net,
      darkquad29_wvl_a2g_ctrl_lut_dump_buffer_size_user_data_out => darkquad29_wvl_a2g_ctrl_lut_dump_buffer_size_user_data_out_net,
      darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_data_out => darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_data_out_net,
      darkquad29_wvl_a2g_ctrl_lut_dump_data_period_user_data_out => darkquad29_wvl_a2g_ctrl_lut_dump_data_period_user_data_out_net,
      darkquad29_wvl_a2g_ctrl_rst_user_data_out => darkquad29_wvl_a2g_ctrl_rst_user_data_out_net,
      darkquad29_wvl_a2g_ctrl_tx_en_user_data_out => darkquad29_wvl_a2g_ctrl_tx_en_user_data_out_net,
      darkquad29_wvl_acc_iq_avg0_ss_bram_data_out => darkquad29_wvl_acc_iq_avg0_ss_bram_data_out_net,
      darkquad29_wvl_acc_iq_avg0_ss_ctrl_user_data_out => darkquad29_wvl_acc_iq_avg0_ss_ctrl_user_data_out_net,
      darkquad29_wvl_acc_iq_avg1_ss_bram_data_out => darkquad29_wvl_acc_iq_avg1_ss_bram_data_out_net,
      darkquad29_wvl_acc_iq_avg1_ss_ctrl_user_data_out => darkquad29_wvl_acc_iq_avg1_ss_ctrl_user_data_out_net,
      darkquad29_wvl_acc_iq_avg2_ss_bram_data_out => darkquad29_wvl_acc_iq_avg2_ss_bram_data_out_net,
      darkquad29_wvl_acc_iq_avg2_ss_ctrl_user_data_out => darkquad29_wvl_acc_iq_avg2_ss_ctrl_user_data_out_net,
      darkquad29_wvl_acc_iq_avg3_ss_bram_data_out => darkquad29_wvl_acc_iq_avg3_ss_bram_data_out_net,
      darkquad29_wvl_acc_iq_avg3_ss_ctrl_user_data_out => darkquad29_wvl_acc_iq_avg3_ss_ctrl_user_data_out_net,
      darkquad29_wvl_acc_iq_start_acc_user_data_out => darkquad29_wvl_acc_iq_start_acc_user_data_out_net,
      darkquad29_wvl_adc_in_adcdac_2g_user_data_i0 => darkquad29_wvl_adc_in_adcdac_2g_user_data_i0_net,
      darkquad29_wvl_adc_in_adcdac_2g_user_data_i1 => darkquad29_wvl_adc_in_adcdac_2g_user_data_i1_net,
      darkquad29_wvl_adc_in_adcdac_2g_user_data_i2 => darkquad29_wvl_adc_in_adcdac_2g_user_data_i2_net,
      darkquad29_wvl_adc_in_adcdac_2g_user_data_i3 => darkquad29_wvl_adc_in_adcdac_2g_user_data_i3_net,
      darkquad29_wvl_adc_in_adcdac_2g_user_data_i4 => darkquad29_wvl_adc_in_adcdac_2g_user_data_i4_net,
      darkquad29_wvl_adc_in_adcdac_2g_user_data_i5 => darkquad29_wvl_adc_in_adcdac_2g_user_data_i5_net,
      darkquad29_wvl_adc_in_adcdac_2g_user_data_i6 => darkquad29_wvl_adc_in_adcdac_2g_user_data_i6_net,
      darkquad29_wvl_adc_in_adcdac_2g_user_data_i7 => darkquad29_wvl_adc_in_adcdac_2g_user_data_i7_net,
      darkquad29_wvl_adc_in_adcdac_2g_user_data_q0 => darkquad29_wvl_adc_in_adcdac_2g_user_data_q0_net,
      darkquad29_wvl_adc_in_adcdac_2g_user_data_q1 => darkquad29_wvl_adc_in_adcdac_2g_user_data_q1_net,
      darkquad29_wvl_adc_in_adcdac_2g_user_data_q2 => darkquad29_wvl_adc_in_adcdac_2g_user_data_q2_net,
      darkquad29_wvl_adc_in_adcdac_2g_user_data_q3 => darkquad29_wvl_adc_in_adcdac_2g_user_data_q3_net,
      darkquad29_wvl_adc_in_adcdac_2g_user_data_q4 => darkquad29_wvl_adc_in_adcdac_2g_user_data_q4_net,
      darkquad29_wvl_adc_in_adcdac_2g_user_data_q5 => darkquad29_wvl_adc_in_adcdac_2g_user_data_q5_net,
      darkquad29_wvl_adc_in_adcdac_2g_user_data_q6 => darkquad29_wvl_adc_in_adcdac_2g_user_data_q6_net,
      darkquad29_wvl_adc_in_adcdac_2g_user_data_q7 => darkquad29_wvl_adc_in_adcdac_2g_user_data_q7_net,
      darkquad29_wvl_adc_in_adcdac_2g_user_info_i0 => darkquad29_wvl_adc_in_adcdac_2g_user_info_i0_net,
      darkquad29_wvl_adc_in_adcdac_2g_user_info_i1 => darkquad29_wvl_adc_in_adcdac_2g_user_info_i1_net,
      darkquad29_wvl_adc_in_adcdac_2g_user_info_i2 => darkquad29_wvl_adc_in_adcdac_2g_user_info_i2_net,
      darkquad29_wvl_adc_in_adcdac_2g_user_info_i3 => darkquad29_wvl_adc_in_adcdac_2g_user_info_i3_net,
      darkquad29_wvl_adc_in_adcdac_2g_user_info_i4 => darkquad29_wvl_adc_in_adcdac_2g_user_info_i4_net,
      darkquad29_wvl_adc_in_adcdac_2g_user_info_i5 => darkquad29_wvl_adc_in_adcdac_2g_user_info_i5_net,
      darkquad29_wvl_adc_in_adcdac_2g_user_info_i6 => darkquad29_wvl_adc_in_adcdac_2g_user_info_i6_net,
      darkquad29_wvl_adc_in_adcdac_2g_user_info_i7 => darkquad29_wvl_adc_in_adcdac_2g_user_info_i7_net,
      darkquad29_wvl_adc_in_adcdac_2g_user_info_q0 => darkquad29_wvl_adc_in_adcdac_2g_user_info_q0_net,
      darkquad29_wvl_adc_in_adcdac_2g_user_info_q1 => darkquad29_wvl_adc_in_adcdac_2g_user_info_q1_net,
      darkquad29_wvl_adc_in_adcdac_2g_user_info_q2 => darkquad29_wvl_adc_in_adcdac_2g_user_info_q2_net,
      darkquad29_wvl_adc_in_adcdac_2g_user_info_q3 => darkquad29_wvl_adc_in_adcdac_2g_user_info_q3_net,
      darkquad29_wvl_adc_in_adcdac_2g_user_info_q4 => darkquad29_wvl_adc_in_adcdac_2g_user_info_q4_net,
      darkquad29_wvl_adc_in_adcdac_2g_user_info_q5 => darkquad29_wvl_adc_in_adcdac_2g_user_info_q5_net,
      darkquad29_wvl_adc_in_adcdac_2g_user_info_q6 => darkquad29_wvl_adc_in_adcdac_2g_user_info_q6_net,
      darkquad29_wvl_adc_in_adcdac_2g_user_info_q7 => darkquad29_wvl_adc_in_adcdac_2g_user_info_q7_net,
      darkquad29_wvl_adc_in_adcdac_2g_user_mmcm_locked => darkquad29_wvl_adc_in_adcdac_2g_user_mmcm_locked_net,
      darkquad29_wvl_adc_in_adcdac_2g_user_sync => darkquad29_wvl_adc_in_adcdac_2g_user_sync_net,
      darkquad29_wvl_adc_in_adcdac_2g_user_valid => darkquad29_wvl_adc_in_adcdac_2g_user_valid_net,
      darkquad29_wvl_adc_in_dly_val_user_data_out => darkquad29_wvl_adc_in_dly_val_user_data_out_net,
      darkquad29_wvl_adc_in_i_scale_user_data_out => darkquad29_wvl_adc_in_i_scale_user_data_out_net,
      darkquad29_wvl_adc_in_inc_phs_user_data_out => darkquad29_wvl_adc_in_inc_phs_user_data_out_net,
      darkquad29_wvl_adc_in_load_dly_user_data_out => darkquad29_wvl_adc_in_load_dly_user_data_out_net,
      darkquad29_wvl_adc_in_pos_phs_user_data_out => darkquad29_wvl_adc_in_pos_phs_user_data_out_net,
      darkquad29_wvl_adc_in_snp_cal0_ss_bram_data_out => darkquad29_wvl_adc_in_snp_cal0_ss_bram_data_out_net,
      darkquad29_wvl_adc_in_snp_cal0_ss_ctrl_user_data_out => darkquad29_wvl_adc_in_snp_cal0_ss_ctrl_user_data_out_net,
      darkquad29_wvl_adc_in_snp_cal1_ss_bram_data_out => darkquad29_wvl_adc_in_snp_cal1_ss_bram_data_out_net,
      darkquad29_wvl_adc_in_snp_cal1_ss_ctrl_user_data_out => darkquad29_wvl_adc_in_snp_cal1_ss_ctrl_user_data_out_net,
      darkquad29_wvl_adc_in_snp_cal2_ss_bram_data_out => darkquad29_wvl_adc_in_snp_cal2_ss_bram_data_out_net,
      darkquad29_wvl_adc_in_snp_cal2_ss_ctrl_user_data_out => darkquad29_wvl_adc_in_snp_cal2_ss_ctrl_user_data_out_net,
      darkquad29_wvl_adc_in_snp_cal3_ss_bram_data_out => darkquad29_wvl_adc_in_snp_cal3_ss_bram_data_out_net,
      darkquad29_wvl_adc_in_snp_cal3_ss_ctrl_user_data_out => darkquad29_wvl_adc_in_snp_cal3_ss_ctrl_user_data_out_net,
      darkquad29_wvl_adc_in_trig_user_data_out => darkquad29_wvl_adc_in_trig_user_data_out_net,
      darkquad29_wvl_board_num_user_data_out => darkquad29_wvl_board_num_user_data_out_net,
      darkquad29_wvl_capture0_base_kf_user_data_out => darkquad29_wvl_capture0_base_kf_user_data_out_net,
      darkquad29_wvl_capture0_base_kq_user_data_out => darkquad29_wvl_capture0_base_kq_user_data_out_net,
      darkquad29_wvl_capture0_cps_lim_user_data_out => darkquad29_wvl_capture0_cps_lim_user_data_out_net,
      darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_data_out => darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_data_out_net,
      darkquad29_wvl_capture0_load_thresh_user_data_out => darkquad29_wvl_capture0_load_thresh_user_data_out_net,
      darkquad29_wvl_capture0_pix_data_out => darkquad29_wvl_capture0_pix_data_out_net,
      darkquad29_wvl_capture0_threshold_user_data_out => darkquad29_wvl_capture0_threshold_user_data_out_net,
      darkquad29_wvl_capture0_use_energy_cal_user_data_out => darkquad29_wvl_capture0_use_energy_cal_user_data_out_net,
      darkquad29_wvl_capture1_base_kf_user_data_out => darkquad29_wvl_capture1_base_kf_user_data_out_net,
      darkquad29_wvl_capture1_base_kq_user_data_out => darkquad29_wvl_capture1_base_kq_user_data_out_net,
      darkquad29_wvl_capture1_cps_lim_user_data_out => darkquad29_wvl_capture1_cps_lim_user_data_out_net,
      darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_data_out => darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_data_out_net,
      darkquad29_wvl_capture1_load_thresh_user_data_out => darkquad29_wvl_capture1_load_thresh_user_data_out_net,
      darkquad29_wvl_capture1_pix_data_out => darkquad29_wvl_capture1_pix_data_out_net,
      darkquad29_wvl_capture1_threshold_user_data_out => darkquad29_wvl_capture1_threshold_user_data_out_net,
      darkquad29_wvl_capture1_use_energy_cal_user_data_out => darkquad29_wvl_capture1_use_energy_cal_user_data_out_net,
      darkquad29_wvl_capture2_base_kf_user_data_out => darkquad29_wvl_capture2_base_kf_user_data_out_net,
      darkquad29_wvl_capture2_base_kq_user_data_out => darkquad29_wvl_capture2_base_kq_user_data_out_net,
      darkquad29_wvl_capture2_cps_lim_user_data_out => darkquad29_wvl_capture2_cps_lim_user_data_out_net,
      darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_data_out => darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_data_out_net,
      darkquad29_wvl_capture2_load_thresh_user_data_out => darkquad29_wvl_capture2_load_thresh_user_data_out_net,
      darkquad29_wvl_capture2_pix_data_out => darkquad29_wvl_capture2_pix_data_out_net,
      darkquad29_wvl_capture2_threshold_user_data_out => darkquad29_wvl_capture2_threshold_user_data_out_net,
      darkquad29_wvl_capture2_use_energy_cal_user_data_out => darkquad29_wvl_capture2_use_energy_cal_user_data_out_net,
      darkquad29_wvl_capture3_base_kf_user_data_out => darkquad29_wvl_capture3_base_kf_user_data_out_net,
      darkquad29_wvl_capture3_base_kq_user_data_out => darkquad29_wvl_capture3_base_kq_user_data_out_net,
      darkquad29_wvl_capture3_cps_lim_user_data_out => darkquad29_wvl_capture3_cps_lim_user_data_out_net,
      darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_data_out => darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_data_out_net,
      darkquad29_wvl_capture3_load_thresh_user_data_out => darkquad29_wvl_capture3_load_thresh_user_data_out_net,
      darkquad29_wvl_capture3_pix_data_out => darkquad29_wvl_capture3_pix_data_out_net,
      darkquad29_wvl_capture3_threshold_user_data_out => darkquad29_wvl_capture3_threshold_user_data_out_net,
      darkquad29_wvl_capture3_use_energy_cal_user_data_out => darkquad29_wvl_capture3_use_energy_cal_user_data_out_net,
      darkquad29_wvl_chan_sel_ch_bin0_user_data_out => darkquad29_wvl_chan_sel_ch_bin0_user_data_out_net,
      darkquad29_wvl_chan_sel_ch_bin1_user_data_out => darkquad29_wvl_chan_sel_ch_bin1_user_data_out_net,
      darkquad29_wvl_chan_sel_ch_bin2_user_data_out => darkquad29_wvl_chan_sel_ch_bin2_user_data_out_net,
      darkquad29_wvl_chan_sel_ch_bin3_user_data_out => darkquad29_wvl_chan_sel_ch_bin3_user_data_out_net,
      darkquad29_wvl_chan_sel_load_user_data_out => darkquad29_wvl_chan_sel_load_user_data_out_net,
      darkquad29_wvl_check_lag_latch_user_data_out => darkquad29_wvl_check_lag_latch_user_data_out_net,
      darkquad29_wvl_conv_phase0_centers_user_data_out => darkquad29_wvl_conv_phase0_centers_user_data_out_net,
      darkquad29_wvl_conv_phase0_load_centers_user_data_out => darkquad29_wvl_conv_phase0_load_centers_user_data_out_net,
      darkquad29_wvl_conv_phase1_centers_user_data_out => darkquad29_wvl_conv_phase1_centers_user_data_out_net,
      darkquad29_wvl_conv_phase1_load_centers_user_data_out => darkquad29_wvl_conv_phase1_load_centers_user_data_out_net,
      darkquad29_wvl_conv_phase2_centers_user_data_out => darkquad29_wvl_conv_phase2_centers_user_data_out_net,
      darkquad29_wvl_conv_phase2_load_centers_user_data_out => darkquad29_wvl_conv_phase2_load_centers_user_data_out_net,
      darkquad29_wvl_conv_phase3_centers_user_data_out => darkquad29_wvl_conv_phase3_centers_user_data_out_net,
      darkquad29_wvl_conv_phase3_load_centers_user_data_out => darkquad29_wvl_conv_phase3_load_centers_user_data_out_net,
      darkquad29_wvl_dds_lut_qdr0_ack => darkquad29_wvl_dds_lut_qdr0_ack_net,
      darkquad29_wvl_dds_lut_qdr0_cal_fail => darkquad29_wvl_dds_lut_qdr0_cal_fail_net,
      darkquad29_wvl_dds_lut_qdr0_data_out => darkquad29_wvl_dds_lut_qdr0_data_out_net,
      darkquad29_wvl_dds_lut_qdr0_data_valid => darkquad29_wvl_dds_lut_qdr0_data_valid_net,
      darkquad29_wvl_dds_lut_qdr0_phy_ready => darkquad29_wvl_dds_lut_qdr0_phy_ready_net,
      darkquad29_wvl_dds_lut_qdr1_ack => darkquad29_wvl_dds_lut_qdr1_ack_net,
      darkquad29_wvl_dds_lut_qdr1_cal_fail => darkquad29_wvl_dds_lut_qdr1_cal_fail_net,
      darkquad29_wvl_dds_lut_qdr1_data_out => darkquad29_wvl_dds_lut_qdr1_data_out_net,
      darkquad29_wvl_dds_lut_qdr1_data_valid => darkquad29_wvl_dds_lut_qdr1_data_valid_net,
      darkquad29_wvl_dds_lut_qdr1_phy_ready => darkquad29_wvl_dds_lut_qdr1_phy_ready_net,
      darkquad29_wvl_dds_lut_qdr2_ack => darkquad29_wvl_dds_lut_qdr2_ack_net,
      darkquad29_wvl_dds_lut_qdr2_cal_fail => darkquad29_wvl_dds_lut_qdr2_cal_fail_net,
      darkquad29_wvl_dds_lut_qdr2_data_out => darkquad29_wvl_dds_lut_qdr2_data_out_net,
      darkquad29_wvl_dds_lut_qdr2_data_valid => darkquad29_wvl_dds_lut_qdr2_data_valid_net,
      darkquad29_wvl_dds_lut_qdr2_phy_ready => darkquad29_wvl_dds_lut_qdr2_phy_ready_net,
      darkquad29_wvl_dds_lut_qdr3_ack => darkquad29_wvl_dds_lut_qdr3_ack_net,
      darkquad29_wvl_dds_lut_qdr3_cal_fail => darkquad29_wvl_dds_lut_qdr3_cal_fail_net,
      darkquad29_wvl_dds_lut_qdr3_data_out => darkquad29_wvl_dds_lut_qdr3_data_out_net,
      darkquad29_wvl_dds_lut_qdr3_data_valid => darkquad29_wvl_dds_lut_qdr3_data_valid_net,
      darkquad29_wvl_dds_lut_qdr3_phy_ready => darkquad29_wvl_dds_lut_qdr3_phy_ready_net,
      darkquad29_wvl_dds_lut_run_user_data_out => darkquad29_wvl_dds_lut_run_user_data_out_net,
      darkquad29_wvl_dds_shift_user_data_out => darkquad29_wvl_dds_shift_user_data_out_net,
      darkquad29_wvl_gbe64_dest_ip_user_data_out => darkquad29_wvl_gbe64_dest_ip_user_data_out_net,
      darkquad29_wvl_gbe64_one_gbe_app_dbg_data => darkquad29_wvl_gbe64_one_gbe_app_dbg_data_net,
      darkquad29_wvl_gbe64_one_gbe_app_dbg_dvld => darkquad29_wvl_gbe64_one_gbe_app_dbg_dvld_net,
      darkquad29_wvl_gbe64_one_gbe_app_rx_badframe => darkquad29_wvl_gbe64_one_gbe_app_rx_badframe_net,
      darkquad29_wvl_gbe64_one_gbe_app_rx_data => darkquad29_wvl_gbe64_one_gbe_app_rx_data_net,
      darkquad29_wvl_gbe64_one_gbe_app_rx_dvld => darkquad29_wvl_gbe64_one_gbe_app_rx_dvld_net,
      darkquad29_wvl_gbe64_one_gbe_app_rx_eof => darkquad29_wvl_gbe64_one_gbe_app_rx_eof_net,
      darkquad29_wvl_gbe64_one_gbe_app_rx_overrun => darkquad29_wvl_gbe64_one_gbe_app_rx_overrun_net,
      darkquad29_wvl_gbe64_one_gbe_app_rx_srcip => darkquad29_wvl_gbe64_one_gbe_app_rx_srcip_net,
      darkquad29_wvl_gbe64_one_gbe_app_rx_srcport => darkquad29_wvl_gbe64_one_gbe_app_rx_srcport_net,
      darkquad29_wvl_gbe64_one_gbe_app_tx_afull => darkquad29_wvl_gbe64_one_gbe_app_tx_afull_net,
      darkquad29_wvl_gbe64_one_gbe_app_tx_overflow => darkquad29_wvl_gbe64_one_gbe_app_tx_overflow_net,
      darkquad29_wvl_gbe64_rst_user_data_out => darkquad29_wvl_gbe64_rst_user_data_out_net,
      darkquad29_wvl_gbe64_words_per_frame_user_data_out => darkquad29_wvl_gbe64_words_per_frame_user_data_out_net,
      darkquad29_wvl_phase_dmp_ch_we_user_data_out => darkquad29_wvl_phase_dmp_ch_we_user_data_out_net,
      darkquad29_wvl_phase_dmp_on_user_data_out => darkquad29_wvl_phase_dmp_on_user_data_out_net,
      darkquad29_wvl_phase_port_user_data_out => darkquad29_wvl_phase_port_user_data_out_net,
      darkquad29_wvl_photon_port_user_data_out => darkquad29_wvl_photon_port_user_data_out_net,
      darkquad29_wvl_prog_fir0_load_chan_user_data_out => darkquad29_wvl_prog_fir0_load_chan_user_data_out_net,
      darkquad29_wvl_prog_fir0_single_chan_coeffs_data_out => darkquad29_wvl_prog_fir0_single_chan_coeffs_data_out_net,
      darkquad29_wvl_prog_fir1_load_chan_user_data_out => darkquad29_wvl_prog_fir1_load_chan_user_data_out_net,
      darkquad29_wvl_prog_fir1_single_chan_coeffs_data_out => darkquad29_wvl_prog_fir1_single_chan_coeffs_data_out_net,
      darkquad29_wvl_prog_fir2_load_chan_user_data_out => darkquad29_wvl_prog_fir2_load_chan_user_data_out_net,
      darkquad29_wvl_prog_fir2_single_chan_coeffs_data_out => darkquad29_wvl_prog_fir2_single_chan_coeffs_data_out_net,
      darkquad29_wvl_prog_fir3_load_chan_user_data_out => darkquad29_wvl_prog_fir3_load_chan_user_data_out_net,
      darkquad29_wvl_prog_fir3_single_chan_coeffs_data_out => darkquad29_wvl_prog_fir3_single_chan_coeffs_data_out_net,
      darkquad29_wvl_run_user_data_out => darkquad29_wvl_run_user_data_out_net,
      darkquad29_wvl_sel_ch_user_data_out => darkquad29_wvl_sel_ch_user_data_out_net,
      darkquad29_wvl_snp_phs_ss_bram_data_out => darkquad29_wvl_snp_phs_ss_bram_data_out_net,
      darkquad29_wvl_snp_phs_ss_ctrl_user_data_out => darkquad29_wvl_snp_phs_ss_ctrl_user_data_out_net,
      darkquad29_wvl_start_cap_user_data_out => darkquad29_wvl_start_cap_user_data_out_net,
      darkquad29_wvl_timekeeper_base_ts_user_data_out => darkquad29_wvl_timekeeper_base_ts_user_data_out_net,
      darkquad29_wvl_trig_snp_user_data_out => darkquad29_wvl_trig_snp_user_data_out_net,
      darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_rst => darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_rx_rst_net,
      darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_data => darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_data_net,
      darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_rst => darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_rst_net,
      darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_val => darkquad29_wvl_a2g_ctrl_adcdac_2g_ctrl_user_tx_val_net,
      darkquad29_wvl_a2g_ctrl_last_tx_data_user_data_in => darkquad29_wvl_a2g_ctrl_last_tx_data_user_data_in_net,
      darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_addr => darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_addr_net,
      darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_data_in => darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_data_in_net,
      darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_we => darkquad29_wvl_a2g_ctrl_lut_dump_dac_lut_buffer_we_net,
      darkquad29_wvl_a2g_ctrl_lut_dump_sending_data_user_data_in => darkquad29_wvl_a2g_ctrl_lut_dump_sending_data_user_data_in_net,
      darkquad29_wvl_a2g_ctrl_reg_rx_full_user_data_in => darkquad29_wvl_a2g_ctrl_reg_rx_full_user_data_in_net,
      darkquad29_wvl_a2g_ctrl_reg_tx_full_user_data_in => darkquad29_wvl_a2g_ctrl_reg_tx_full_user_data_in_net,
      darkquad29_wvl_a2g_ctrl_v7_ready_user_data_in => darkquad29_wvl_a2g_ctrl_v7_ready_user_data_in_net,
      darkquad29_wvl_acc_iq_avg0_ss_bram_addr => darkquad29_wvl_acc_iq_avg0_ss_bram_addr_net,
      darkquad29_wvl_acc_iq_avg0_ss_bram_data_in => darkquad29_wvl_acc_iq_avg0_ss_bram_data_in_net,
      darkquad29_wvl_acc_iq_avg0_ss_bram_we => darkquad29_wvl_acc_iq_avg0_ss_bram_we_net,
      darkquad29_wvl_acc_iq_avg0_ss_status_user_data_in => darkquad29_wvl_acc_iq_avg0_ss_status_user_data_in_net,
      darkquad29_wvl_acc_iq_avg1_ss_bram_addr => darkquad29_wvl_acc_iq_avg1_ss_bram_addr_net,
      darkquad29_wvl_acc_iq_avg1_ss_bram_data_in => darkquad29_wvl_acc_iq_avg1_ss_bram_data_in_net,
      darkquad29_wvl_acc_iq_avg1_ss_bram_we => darkquad29_wvl_acc_iq_avg1_ss_bram_we_net,
      darkquad29_wvl_acc_iq_avg1_ss_status_user_data_in => darkquad29_wvl_acc_iq_avg1_ss_status_user_data_in_net,
      darkquad29_wvl_acc_iq_avg2_ss_bram_addr => darkquad29_wvl_acc_iq_avg2_ss_bram_addr_net,
      darkquad29_wvl_acc_iq_avg2_ss_bram_data_in => darkquad29_wvl_acc_iq_avg2_ss_bram_data_in_net,
      darkquad29_wvl_acc_iq_avg2_ss_bram_we => darkquad29_wvl_acc_iq_avg2_ss_bram_we_net,
      darkquad29_wvl_acc_iq_avg2_ss_status_user_data_in => darkquad29_wvl_acc_iq_avg2_ss_status_user_data_in_net,
      darkquad29_wvl_acc_iq_avg3_ss_bram_addr => darkquad29_wvl_acc_iq_avg3_ss_bram_addr_net,
      darkquad29_wvl_acc_iq_avg3_ss_bram_data_in => darkquad29_wvl_acc_iq_avg3_ss_bram_data_in_net,
      darkquad29_wvl_acc_iq_avg3_ss_bram_we => darkquad29_wvl_acc_iq_avg3_ss_bram_we_net,
      darkquad29_wvl_acc_iq_avg3_ss_status_user_data_in => darkquad29_wvl_acc_iq_avg3_ss_status_user_data_in_net,
      darkquad29_wvl_adc_in_adcdac_2g_user_dly_val => darkquad29_wvl_adc_in_adcdac_2g_user_dly_val_net,
      darkquad29_wvl_adc_in_adcdac_2g_user_inc_mmcm_phs => darkquad29_wvl_adc_in_adcdac_2g_user_inc_mmcm_phs_net,
      darkquad29_wvl_adc_in_adcdac_2g_user_load_dly0 => darkquad29_wvl_adc_in_adcdac_2g_user_load_dly0_net,
      darkquad29_wvl_adc_in_adcdac_2g_user_pos_mmcm_phs => darkquad29_wvl_adc_in_adcdac_2g_user_pos_mmcm_phs_net,
      darkquad29_wvl_adc_in_adcdac_2g_user_rdy_i0 => darkquad29_wvl_adc_in_adcdac_2g_user_rdy_i0_net,
      darkquad29_wvl_adc_in_locked_user_data_in => darkquad29_wvl_adc_in_locked_user_data_in_net,
      darkquad29_wvl_adc_in_n_miss_pps_user_data_in => darkquad29_wvl_adc_in_n_miss_pps_user_data_in_net,
      darkquad29_wvl_adc_in_raw_pps_user_data_in => darkquad29_wvl_adc_in_raw_pps_user_data_in_net,
      darkquad29_wvl_adc_in_snp_cal0_ss_bram_addr => darkquad29_wvl_adc_in_snp_cal0_ss_bram_addr_net,
      darkquad29_wvl_adc_in_snp_cal0_ss_bram_data_in => darkquad29_wvl_adc_in_snp_cal0_ss_bram_data_in_net,
      darkquad29_wvl_adc_in_snp_cal0_ss_bram_we => darkquad29_wvl_adc_in_snp_cal0_ss_bram_we_net,
      darkquad29_wvl_adc_in_snp_cal0_ss_status_user_data_in => darkquad29_wvl_adc_in_snp_cal0_ss_status_user_data_in_net,
      darkquad29_wvl_adc_in_snp_cal1_ss_bram_addr => darkquad29_wvl_adc_in_snp_cal1_ss_bram_addr_net,
      darkquad29_wvl_adc_in_snp_cal1_ss_bram_data_in => darkquad29_wvl_adc_in_snp_cal1_ss_bram_data_in_net,
      darkquad29_wvl_adc_in_snp_cal1_ss_bram_we => darkquad29_wvl_adc_in_snp_cal1_ss_bram_we_net,
      darkquad29_wvl_adc_in_snp_cal1_ss_status_user_data_in => darkquad29_wvl_adc_in_snp_cal1_ss_status_user_data_in_net,
      darkquad29_wvl_adc_in_snp_cal2_ss_bram_addr => darkquad29_wvl_adc_in_snp_cal2_ss_bram_addr_net,
      darkquad29_wvl_adc_in_snp_cal2_ss_bram_data_in => darkquad29_wvl_adc_in_snp_cal2_ss_bram_data_in_net,
      darkquad29_wvl_adc_in_snp_cal2_ss_bram_we => darkquad29_wvl_adc_in_snp_cal2_ss_bram_we_net,
      darkquad29_wvl_adc_in_snp_cal2_ss_status_user_data_in => darkquad29_wvl_adc_in_snp_cal2_ss_status_user_data_in_net,
      darkquad29_wvl_adc_in_snp_cal3_ss_bram_addr => darkquad29_wvl_adc_in_snp_cal3_ss_bram_addr_net,
      darkquad29_wvl_adc_in_snp_cal3_ss_bram_data_in => darkquad29_wvl_adc_in_snp_cal3_ss_bram_data_in_net,
      darkquad29_wvl_adc_in_snp_cal3_ss_bram_we => darkquad29_wvl_adc_in_snp_cal3_ss_bram_we_net,
      darkquad29_wvl_adc_in_snp_cal3_ss_status_user_data_in => darkquad29_wvl_adc_in_snp_cal3_ss_status_user_data_in_net,
      darkquad29_wvl_adc_in_ts0_user_data_in => darkquad29_wvl_adc_in_ts0_user_data_in_net,
      darkquad29_wvl_adc_in_ts1_user_data_in => darkquad29_wvl_adc_in_ts1_user_data_in_net,
      darkquad29_wvl_adc_in_ts2_user_data_in => darkquad29_wvl_adc_in_ts2_user_data_in_net,
      darkquad29_wvl_adc_in_ts3_user_data_in => darkquad29_wvl_adc_in_ts3_user_data_in_net,
      darkquad29_wvl_adc_in_valid_user_data_in => darkquad29_wvl_adc_in_valid_user_data_in_net,
      darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_addr => darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_addr_net,
      darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_data_in => darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_data_in_net,
      darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_we => darkquad29_wvl_capture0_energy_cal_lut_energy_coeffs_we_net,
      darkquad29_wvl_capture0_pix_addr => darkquad29_wvl_capture0_pix_addr_net,
      darkquad29_wvl_capture0_pix_data_in => darkquad29_wvl_capture0_pix_data_in_net,
      darkquad29_wvl_capture0_pix_we => darkquad29_wvl_capture0_pix_we_net,
      darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_addr => darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_addr_net,
      darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_data_in => darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_data_in_net,
      darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_we => darkquad29_wvl_capture1_energy_cal_lut_energy_coeffs_we_net,
      darkquad29_wvl_capture1_pix_addr => darkquad29_wvl_capture1_pix_addr_net,
      darkquad29_wvl_capture1_pix_data_in => darkquad29_wvl_capture1_pix_data_in_net,
      darkquad29_wvl_capture1_pix_we => darkquad29_wvl_capture1_pix_we_net,
      darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_addr => darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_addr_net,
      darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_data_in => darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_data_in_net,
      darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_we => darkquad29_wvl_capture2_energy_cal_lut_energy_coeffs_we_net,
      darkquad29_wvl_capture2_pix_addr => darkquad29_wvl_capture2_pix_addr_net,
      darkquad29_wvl_capture2_pix_data_in => darkquad29_wvl_capture2_pix_data_in_net,
      darkquad29_wvl_capture2_pix_we => darkquad29_wvl_capture2_pix_we_net,
      darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_addr => darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_addr_net,
      darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_data_in => darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_data_in_net,
      darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_we => darkquad29_wvl_capture3_energy_cal_lut_energy_coeffs_we_net,
      darkquad29_wvl_capture3_pix_addr => darkquad29_wvl_capture3_pix_addr_net,
      darkquad29_wvl_capture3_pix_data_in => darkquad29_wvl_capture3_pix_data_in_net,
      darkquad29_wvl_capture3_pix_we => darkquad29_wvl_capture3_pix_we_net,
      darkquad29_wvl_check_lag_data_ch_user_data_in => darkquad29_wvl_check_lag_data_ch_user_data_in_net,
      darkquad29_wvl_check_lag_dds_ch_user_data_in => darkquad29_wvl_check_lag_dds_ch_user_data_in_net,
      darkquad29_wvl_dds_lut_qdr0_address => darkquad29_wvl_dds_lut_qdr0_address_net,
      darkquad29_wvl_dds_lut_qdr0_be => darkquad29_wvl_dds_lut_qdr0_be_net,
      darkquad29_wvl_dds_lut_qdr0_data_in => darkquad29_wvl_dds_lut_qdr0_data_in_net,
      darkquad29_wvl_dds_lut_qdr0_rd_en => darkquad29_wvl_dds_lut_qdr0_rd_en_net,
      darkquad29_wvl_dds_lut_qdr0_wr_en => darkquad29_wvl_dds_lut_qdr0_wr_en_net,
      darkquad29_wvl_dds_lut_qdr1_address => darkquad29_wvl_dds_lut_qdr1_address_net,
      darkquad29_wvl_dds_lut_qdr1_be => darkquad29_wvl_dds_lut_qdr1_be_net,
      darkquad29_wvl_dds_lut_qdr1_data_in => darkquad29_wvl_dds_lut_qdr1_data_in_net,
      darkquad29_wvl_dds_lut_qdr1_rd_en => darkquad29_wvl_dds_lut_qdr1_rd_en_net,
      darkquad29_wvl_dds_lut_qdr1_wr_en => darkquad29_wvl_dds_lut_qdr1_wr_en_net,
      darkquad29_wvl_dds_lut_qdr2_address => darkquad29_wvl_dds_lut_qdr2_address_net,
      darkquad29_wvl_dds_lut_qdr2_be => darkquad29_wvl_dds_lut_qdr2_be_net,
      darkquad29_wvl_dds_lut_qdr2_data_in => darkquad29_wvl_dds_lut_qdr2_data_in_net,
      darkquad29_wvl_dds_lut_qdr2_rd_en => darkquad29_wvl_dds_lut_qdr2_rd_en_net,
      darkquad29_wvl_dds_lut_qdr2_wr_en => darkquad29_wvl_dds_lut_qdr2_wr_en_net,
      darkquad29_wvl_dds_lut_qdr3_address => darkquad29_wvl_dds_lut_qdr3_address_net,
      darkquad29_wvl_dds_lut_qdr3_be => darkquad29_wvl_dds_lut_qdr3_be_net,
      darkquad29_wvl_dds_lut_qdr3_data_in => darkquad29_wvl_dds_lut_qdr3_data_in_net,
      darkquad29_wvl_dds_lut_qdr3_rd_en => darkquad29_wvl_dds_lut_qdr3_rd_en_net,
      darkquad29_wvl_dds_lut_qdr3_wr_en => darkquad29_wvl_dds_lut_qdr3_wr_en_net,
      darkquad29_wvl_gbe64_one_gbe_app_rx_ack => darkquad29_wvl_gbe64_one_gbe_app_rx_ack_net,
      darkquad29_wvl_gbe64_one_gbe_app_rx_rst => darkquad29_wvl_gbe64_one_gbe_app_rx_rst_net,
      darkquad29_wvl_gbe64_one_gbe_app_tx_data => darkquad29_wvl_gbe64_one_gbe_app_tx_data_net,
      darkquad29_wvl_gbe64_one_gbe_app_tx_destip => darkquad29_wvl_gbe64_one_gbe_app_tx_destip_net,
      darkquad29_wvl_gbe64_one_gbe_app_tx_destport => darkquad29_wvl_gbe64_one_gbe_app_tx_destport_net,
      darkquad29_wvl_gbe64_one_gbe_app_tx_dvld => darkquad29_wvl_gbe64_one_gbe_app_tx_dvld_net,
      darkquad29_wvl_gbe64_one_gbe_app_tx_eof => darkquad29_wvl_gbe64_one_gbe_app_tx_eof_net,
      darkquad29_wvl_gbe64_one_gbe_app_tx_rst => darkquad29_wvl_gbe64_one_gbe_app_tx_rst_net,
      darkquad29_wvl_gbe64_tx_afull_user_data_in => darkquad29_wvl_gbe64_tx_afull_user_data_in_net,
      darkquad29_wvl_gbe64_tx_overrun_user_data_in => darkquad29_wvl_gbe64_tx_overrun_user_data_in_net,
      darkquad29_wvl_n_eof_sent_user_data_in => darkquad29_wvl_n_eof_sent_user_data_in_net,
      darkquad29_wvl_n_photons_user_data_in => darkquad29_wvl_n_photons_user_data_in_net,
      darkquad29_wvl_pfb_fft_check_fft_oflow_user_data_in => darkquad29_wvl_pfb_fft_check_fft_oflow_user_data_in_net,
      darkquad29_wvl_prog_fir0_single_chan_coeffs_addr => darkquad29_wvl_prog_fir0_single_chan_coeffs_addr_net,
      darkquad29_wvl_prog_fir0_single_chan_coeffs_data_in => darkquad29_wvl_prog_fir0_single_chan_coeffs_data_in_net,
      darkquad29_wvl_prog_fir0_single_chan_coeffs_we => darkquad29_wvl_prog_fir0_single_chan_coeffs_we_net,
      darkquad29_wvl_prog_fir1_single_chan_coeffs_addr => darkquad29_wvl_prog_fir1_single_chan_coeffs_addr_net,
      darkquad29_wvl_prog_fir1_single_chan_coeffs_data_in => darkquad29_wvl_prog_fir1_single_chan_coeffs_data_in_net,
      darkquad29_wvl_prog_fir1_single_chan_coeffs_we => darkquad29_wvl_prog_fir1_single_chan_coeffs_we_net,
      darkquad29_wvl_prog_fir2_single_chan_coeffs_addr => darkquad29_wvl_prog_fir2_single_chan_coeffs_addr_net,
      darkquad29_wvl_prog_fir2_single_chan_coeffs_data_in => darkquad29_wvl_prog_fir2_single_chan_coeffs_data_in_net,
      darkquad29_wvl_prog_fir2_single_chan_coeffs_we => darkquad29_wvl_prog_fir2_single_chan_coeffs_we_net,
      darkquad29_wvl_prog_fir3_single_chan_coeffs_addr => darkquad29_wvl_prog_fir3_single_chan_coeffs_addr_net,
      darkquad29_wvl_prog_fir3_single_chan_coeffs_data_in => darkquad29_wvl_prog_fir3_single_chan_coeffs_data_in_net,
      darkquad29_wvl_prog_fir3_single_chan_coeffs_we => darkquad29_wvl_prog_fir3_single_chan_coeffs_we_net,
      darkquad29_wvl_snp_phs_ss_bram_addr => darkquad29_wvl_snp_phs_ss_bram_addr_net,
      darkquad29_wvl_snp_phs_ss_bram_data_in => darkquad29_wvl_snp_phs_ss_bram_data_in_net,
      darkquad29_wvl_snp_phs_ss_bram_we => darkquad29_wvl_snp_phs_ss_bram_we_net,
      darkquad29_wvl_snp_phs_ss_status_user_data_in => darkquad29_wvl_snp_phs_ss_status_user_data_in_net,
      darkquad29_wvl_timekeeper_sec_now_user_data_in => darkquad29_wvl_timekeeper_sec_now_user_data_in_net
    );

  default_clock_driver_darkquad29_wvl_x0: entity work.default_clock_driver_darkquad29_wvl
    port map (
      sysce => '1',
      sysce_clr => '0',
      sysclk => clkNet,
      ce_1 => ce_1_sg_x1119,
      clk_1 => clk_1_sg_x1119
    );

  persistentdff_inst: xlpersistentdff
    port map (
      clk => clkNet,
      d => persistentdff_inst_q,
      q => persistentdff_inst_q
    );

end structural;
