function [str,opb_addr_end,plb_addr_end,opb_addr_start] = gen_mhs_ip(blk_obj,opb_addr_start,plb_addr_start,plb_name,opb_name)
opb_addr_end = opb_addr_start;
plb_addr_end = plb_addr_start;

blk_name  = get(blk_obj, 'simulink_name');
inst_name = clear_name(blk_name);
hw_sys    = get(blk_obj,'hw_sys');
xsg_obj   = get(blk_obj,'xsg_obj');
use_spi   = get(blk_obj, 'use_spi')
clk_rate  = get(blk_obj,'adc_clk_rate')*6  % in MHz
fabric_clk_rate   = clk_rate*(4/6)         % in MHz
fabric_clk_period = (1000/fabric_clk_rate) % in ns
bit_clk_period    = (1000/clk_rate)        % in ns

str = '';

%%%%% SPI Controller Entry %%%%%
if strcmp(use_spi,'on') 
    str = [str, 'BEGIN spi_controller',                                     '\n'];
    str = [str, '  PARAMETER INSTANCE = ', inst_name, '_spi_controller',    '\n'];
    str = [str, '  PARAMETER HW_VER   = 1.00.a',                            '\n'];
    str = [str, '  PORT clk           = adc0_clk',                          '\n'];
    str = [str, '  PORT cs_n          = spi_cs_n',                          '\n'];
    str = [str, '  PORT sdata         = spi_sdata',                         '\n'];
    str = [str, '  PORT sclk          = spi_sclk',                          '\n'];
    str = [str, '  PORT data          = ', inst_name, '_user_sdata',        '\n'];
    str = [str, '  PORT wr_strobe     = ', inst_name, '_user_spi_strb',     '\n'];
    str = [str, 'END',                                                      '\n'];
    str = [str, '',                                                         '\n'];
    str = [str, '# SPI -- CS',                                              '\n'];
    str = [str, 'BEGIN gpio_simulink2ext',                                  '\n'];
    str = [str, ' PARAMETER INSTANCE  = ', inst_name, '_spi_cs_gpio',       '\n'];
    str = [str, ' PARAMETER HW_VER    = 1.00.a',                            '\n'];
    str = [str, ' PARAMETER DDR       = 0',                                 '\n'];
    str = [str, ' PARAMETER WIDTH     = 1',                                 '\n'];
    str = [str, ' PARAMETER CLK_PHASE = 0',                                 '\n'];
    str = [str, ' PARAMETER REG_IOB   = true',                              '\n'];
    str = [str, ' PORT gateway        = spi_cs_n',                          '\n'];
    str = [str, ' PORT io_pad         = ', inst_name, '_spi_cs_gpio_ext',   '\n'];
    str = [str, ' PORT clk            = adc0_clk',                          '\n'];
    str = [str, ' PORT clk90          = adc0_clk90',                        '\n'];
    str = [str, 'END',                                                      '\n'];
    str = [str, 'PORT ', inst_name,'_spi_cs_gpio_ext = ', inst_name,'_spi_cs_gpio_ext, DIR = O, VEC = [0:0]','\n'];
    str = [str, '',                                                         '\n'];
    str = [str, '# SPI -- SCLK',                                            '\n'];
    str = [str, 'BEGIN gpio_simulink2ext',                                  '\n'];
    str = [str, ' PARAMETER INSTANCE  = ', inst_name, '_spi_clk_gpio',      '\n'];
    str = [str, ' PARAMETER HW_VER    = 1.00.a',                            '\n'];
    str = [str, ' PARAMETER DDR       = 0',                                 '\n'];
    str = [str, ' PARAMETER WIDTH     = 1',                                 '\n'];
    str = [str, ' PARAMETER CLK_PHASE = 0',                                 '\n'];
    str = [str, ' PARAMETER REG_IOB   = true',                              '\n'];
    str = [str, ' PORT gateway        = spi_sclk',                          '\n'];
    str = [str, ' PORT io_pad         = ', inst_name, '_spi_sclk_gpio_ext', '\n'];
    str = [str, ' PORT clk            = adc0_clk',                          '\n'];
    str = [str, ' PORT clk90          = adc0_clk90',                        '\n'];
    str = [str, 'END',                                                      '\n'];
    str = [str, 'PORT ', inst_name,'_spi_sclk_gpio_ext = ', inst_name,'_spi_sclk_gpio_ext, DIR = O, VEC = [0:0]','\n'];
    str = [str, '',                                                         '\n'];
    str = [str, '# SPI -- SDATA',                                           '\n'];
    str = [str, 'BEGIN gpio_simulink2ext',                                  '\n'];
    str = [str, ' PARAMETER INSTANCE  = ', inst_name, '_spi_data_gpio',     '\n'];
    str = [str, ' PARAMETER HW_VER    = 1.00.a',                            '\n'];
    str = [str, ' PARAMETER DDR       = 0',                                 '\n'];
    str = [str, ' PARAMETER WIDTH     = 1',                                 '\n'];
    str = [str, ' PARAMETER CLK_PHASE = 0',                                 '\n'];
    str = [str, ' PARAMETER REG_IOB   = true',                              '\n'];
    str = [str, ' PORT gateway        = spi_sdata',                         '\n'];
    str = [str, ' PORT io_pad         = ', inst_name, '_spi_data_gpio_ext', '\n'];
    str = [str, ' PORT clk            = adc0_clk',                          '\n'];
    str = [str, ' PORT clk90          = adc0_clk90',                        '\n'];
    str = [str, 'END',                                                      '\n'];
    str = [str, 'PORT ',inst_name,'_spi_data_gpio_ext = ',inst_name,'_spi_data_gpio_ext, DIR = O, VEC = [0:0]','\n'];
    str = [str, '',                                                         '\n'];
end
%%% ADC OPB interface -- for calibration/status
%%% TODO: Combine the SPI interface with this core
str = [str, 'BEGIN opb_x64_adc',                                            '\n'];
str = [str, '  PARAMETER INSTANCE   = ', inst_name, 'opb_x64_adc_inst',     '\n'];
str = [str, '  PARAMETER HW_VER     = 1.00.a',                              '\n'];
str = [str, '  PARAMETER C_BASEADDR = 0x00010000',                          '\n'];
str = [str, '  PARAMETER C_HIGHADDR = 0x0001FFFF',                          '\n'];
str = [str, '  BUS_INTERFACE SOPB   = opb0',                                '\n'];
str = [str, '',                                                             '\n'];
str = [str, '  PORT OPB_Clk         = epb_clk',                             '\n'];
str = [str, '  PORT fc_sampled      = fc_sampled',                          '\n'];
str = [str, '  PORT dly_rst         = dly_rst',                             '\n'];
str = [str, '  PORT dly_en          = dly_en',                              '\n'];
str = [str, '  PORT dly_inc_dec_n   = dly_inc_dec_n',                       '\n'];
str = [str, '  PORT dcm_reset       = dcm_reset',                           '\n'];
str = [str, '  PORT dcm_locked      = dcm_locked',                          '\n'];
str = [str, 'END',                                                          '\n'];

%%% ADC Reset line

str = [str, '# reset inverter',                                         '\n'];
str = [str, 'BEGIN signal_invert',                                      '\n'];
str = [str, ' PARAMETER INSTANCE  = ', inst_name, '_rst_invert',        '\n'];
str = [str, ' PARAMETER HW_VER    = 1.00.a',                            '\n'];
str = [str, ' PORT sig_in         = ', inst_name, '_user_rst',          '\n'];
str = [str, ' PORT sig_out        = ', inst_name, '_user_rst_inv',      '\n'];
str = [str, 'END',                                                      '\n'];

str = [str, '# x64 ADC reset',                                          '\n'];
str = [str, 'BEGIN gpio_simulink2ext',                                  '\n'];
str = [str, ' PARAMETER INSTANCE  = ', inst_name, '_rst_gpio',          '\n'];
str = [str, ' PARAMETER HW_VER    = 1.00.a',                            '\n'];
str = [str, ' PARAMETER DDR       = 0',                                 '\n'];
str = [str, ' PARAMETER WIDTH     = 1',                                 '\n'];
str = [str, ' PARAMETER CLK_PHASE = 0',                                 '\n'];
str = [str, ' PARAMETER REG_IOB   = true',                              '\n'];
str = [str, ' PORT gateway        = ', inst_name, '_user_rst_inv',      '\n'];
str = [str, ' PORT io_pad         = ', inst_name, '_rst_gpio_ext',      '\n'];
str = [str, ' PORT clk            = adc0_clk',                          '\n'];
str = [str, ' PORT clk90          = adc0_clk90',                        '\n'];
str = [str, 'END',                                                      '\n'];
str = [str, 'PORT ', inst_name, '_rst_gpio_ext = ', inst_name, '_rst_gpio_ext, DIR = O, VEC = [0:0]', '\n'];
str = [str, '',                                                         '\n'];

if strcmp(hw_sys,'ROACH')
    %%% Control pin GPIO output enable (active low)
    str = [str, '# SPI/Reset pin output enable (active low)',               '\n'];
    str = [str, 'BEGIN gpio_simulink2ext',                                  '\n'];
    str = [str, ' PARAMETER INSTANCE  = ', inst_name, '_ctrl_out_en_inst',  '\n'];
    str = [str, ' PARAMETER HW_VER    = 1.00.a',                            '\n'];
    str = [str, ' PARAMETER DDR       = 0',                                 '\n'];
    str = [str, ' PARAMETER WIDTH     = 1',                                 '\n'];
    str = [str, ' PARAMETER CLK_PHASE = 0',                                 '\n'];
    str = [str, ' PARAMETER REG_IOB   = true',                              '\n'];
    str = [str, ' PORT gateway        = 0b0',                               '\n'];
    str = [str, ' PORT io_pad         = ', inst_name, '_ctrl_out_en',       '\n'];
    str = [str, ' PORT clk            = adc0_clk',                          '\n'];
    str = [str, ' PORT clk90          = adc0_clk90',                        '\n'];
    str = [str, 'END',                                                      '\n'];
    str = [str, 'PORT ', inst_name, '_ctrl_out_en = ', inst_name, '_ctrl_out_en, DIR = O, VEC = [0:0]', '\n'];
    str = [str, '',                                                         '\n'];

    %%% On ROACH2 this DCM has been absorbed into x64_adc_infrastructure
    str = [str, 'BEGIN dcm_module',                                                        '\n'];
    str = [str, ' PARAMETER INSTANCE                = ', inst_name, '_fab_phase_gen',      '\n'];
    str = [str, ' PARAMETER HW_VER                  = 1.00.d',                             '\n'];
    str = [str, ' PARAMETER C_EXT_RESET_HIGH        = 0',                                  '\n'];
    str = [str, ' PARAMETER C_CLK0_BUF              = TRUE',                               '\n'];
    str = [str, ' PARAMETER C_CLK90_BUF             = TRUE',                               '\n'];
    str = [str, ' PARAMETER C_CLK180_BUF            = TRUE',                               '\n'];
    str = [str, ' PARAMETER C_CLK270_BUF            = TRUE',                               '\n'];
    str = [str, ' PARAMETER C_CLKIN_PERIOD          = ', num2str(fabric_clk_period, '%f'), '\n'];
    str = [str, ' PARAMETER C_DFS_FREQUENCY_MODE    = HIGH',                               '\n'];
    str = [str, ' PARAMETER C_DLL_FREQUENCY_MODE    = HIGH',                               '\n'];
    str = [str, ' PORT RST                          = dcm_locked',                         '\n'];
    str = [str, ' PORT CLKIN                        = adc_clk_4x_6d',                      '\n'];
    str = [str, ' PORT CLKFB                        = adc0_clk',                           '\n'];
    str = [str, ' PORT CLK0                         = adc0_clk',                           '\n'];
    str = [str, ' PORT CLK90                        = adc0_clk90',                         '\n'];
    str = [str, ' PORT CLK180                       = adc0_clk180',                        '\n'];
    str = [str, ' PORT CLK270                       = adc0_clk270',                        '\n'];
    str = [str, 'END',                                                                     '\n'];
    str = [str, '\n'];
end



%%% Main ADC user I/O

str = [str, 'BEGIN x64_adc',                                                    '\n'];
str = [str, ' PARAMETER INSTANCE             = ', inst_name,                    '\n'];
str = [str, ' PARAMETER HW_VER               = 1.00.a',                         '\n'];
str = [str, ' PARAMETER ADC_BIT_CLK_PERIOD   = ', num2str(bit_clk_period),      '\n'];
str = [str, ' PORT adc_clk_p                 = adc_clk_p',                      '\n'];
str = [str, ' PORT adc_clk_n                 = adc_clk_n',                      '\n'];
str = [str, ' PORT in_0_n                    = in_0_n',                         '\n'];
str = [str, ' PORT in_0_p                    = in_0_p',                         '\n'];
str = [str, ' PORT fc_0_n                    = fc_0_n',                         '\n'];
str = [str, ' PORT fc_0_p                    = fc_0_p',                         '\n'];
str = [str, ' PORT in_1_n                    = in_1_n',                         '\n'];
str = [str, ' PORT in_1_p                    = in_1_p',                         '\n'];
str = [str, ' PORT fc_1_n                    = fc_1_n',                         '\n'];
str = [str, ' PORT fc_1_p                    = fc_1_p',                         '\n'];
str = [str, ' PORT in_2_n                    = in_2_n',                         '\n'];
str = [str, ' PORT in_2_p                    = in_2_p',                         '\n'];
str = [str, ' PORT fc_2_n                    = fc_2_n',                         '\n'];
str = [str, ' PORT fc_2_p                    = fc_2_p',                         '\n'];
str = [str, ' PORT in_3_n                    = in_3_n',                         '\n'];
str = [str, ' PORT in_3_p                    = in_3_p',                         '\n'];
str = [str, ' PORT fc_3_n                    = fc_3_n',                         '\n'];
str = [str, ' PORT fc_3_p                    = fc_3_p',                         '\n'];
str = [str, ' PORT in_4_n                    = in_4_n',                         '\n'];
str = [str, ' PORT in_4_p                    = in_4_p',                         '\n'];
str = [str, ' PORT fc_4_n                    = fc_4_n',                         '\n'];
str = [str, ' PORT fc_4_p                    = fc_4_p',                         '\n'];
str = [str, ' PORT in_5_n                    = in_5_n',                         '\n'];
str = [str, ' PORT in_5_p                    = in_5_p',                         '\n'];
str = [str, ' PORT fc_5_n                    = fc_5_n',                         '\n'];
str = [str, ' PORT fc_5_p                    = fc_5_p',                         '\n'];
str = [str, ' PORT in_6_n                    = in_6_n',                         '\n'];
str = [str, ' PORT in_6_p                    = in_6_p',                         '\n'];
str = [str, ' PORT fc_6_n                    = fc_6_n',                         '\n'];
str = [str, ' PORT fc_6_p                    = fc_6_p',                         '\n'];
str = [str, ' PORT in_7_n                    = in_7_n',                         '\n'];
str = [str, ' PORT in_7_p                    = in_7_p',                         '\n'];
str = [str, ' PORT fc_7_n                    = fc_7_n',                         '\n'];
str = [str, ' PORT fc_7_p                    = fc_7_p',                         '\n'];
switch hw_sys
    %The out of phase adc clocks don't actually get used, so for ROACH 2 they have been removed.
    %Instead, the four fabric clock phases come straight out of the pcore, rather than using the external dcm module
    case 'ROACH'
        str = [str, ' PORT adc_clk0                  = adc_bit_clk0',                   '\n'];
        str = [str, ' PORT adc_clk90                 = adc_bit_clk90',                  '\n'];
        str = [str, ' PORT adc_clk180                = adc_bit_clk180',                 '\n'];
        str = [str, ' PORT adc_clk270                = adc_bit_clk270',                 '\n'];
        str = [str, ' PORT fab_clk                   = adc_clk_4x_6d',                  '\n'];
    case 'ROACH2'
        str = [str, ' PORT adc_clk0                  = adc_bit_clk0',                   '\n'];
        str = [str, ' PORT fab_clk                   = adc0_clk',                       '\n'];
        str = [str, ' PORT fab_clk90                 = adc0_clk90',                     '\n'];
        str = [str, ' PORT fab_clk180                = adc0_clk180',                    '\n'];
        str = [str, ' PORT fab_clk270                = adc0_clk270',                    '\n'];
end

str = [str, '',                                                                 '\n'];
str = [str, ' PORT adc_data0                 = ', inst_name, '_user_data0',     '\n'];
str = [str, ' PORT adc_data1                 = ', inst_name, '_user_data1',     '\n'];
str = [str, ' PORT adc_data2                 = ', inst_name, '_user_data2',     '\n'];
str = [str, ' PORT adc_data3                 = ', inst_name, '_user_data3',     '\n'];
str = [str, ' PORT adc_data4                 = ', inst_name, '_user_data4',     '\n'];
str = [str, ' PORT adc_data5                 = ', inst_name, '_user_data5',     '\n'];
str = [str, ' PORT adc_data6                 = ', inst_name, '_user_data6',     '\n'];
str = [str, ' PORT adc_data7                 = ', inst_name, '_user_data7',     '\n'];
str = [str, ' PORT adc_data8                 = ', inst_name, '_user_data8',     '\n'];
str = [str, ' PORT adc_data9                 = ', inst_name, '_user_data9',     '\n'];
str = [str, ' PORT adc_data10                = ', inst_name, '_user_data10',    '\n'];
str = [str, ' PORT adc_data11                = ', inst_name, '_user_data11',    '\n'];
str = [str, ' PORT adc_data12                = ', inst_name, '_user_data12',    '\n'];
str = [str, ' PORT adc_data13                = ', inst_name, '_user_data13',    '\n'];
str = [str, ' PORT adc_data14                = ', inst_name, '_user_data14',    '\n'];
str = [str, ' PORT adc_data15                = ', inst_name, '_user_data15',    '\n'];
str = [str, ' PORT adc_dout_sync             = ', inst_name, '_user_chan_sync', '\n'];
str = [str, ' PORT adc_dout_vld              = adc_dout_vld',                   '\n'];
str = [str, ' PORT adc_fifo_of               = adc_fifo_of',                    '\n'];
str = [str, ' PORT adc_fifo_uf               = adc_fifo_uf',                    '\n'];
str = [str, ' PORT reset                     = ', inst_name, '_user_rst',       '\n'];
str = [str, '',                                                                 '\n'];
str = [str, ' PORT dly_clk                   = epb_clk',                        '\n'];
str = [str, ' PORT fc_sampled                = fc_sampled',                     '\n'];
str = [str, ' PORT dly_rst                   = dly_rst',                        '\n'];
str = [str, ' PORT dly_en                    = dly_en',                         '\n'];
str = [str, ' PORT dly_inc_dec_n             = dly_inc_dec_n',                  '\n'];
str = [str, ' PORT dcm_reset                 = dcm_reset',                      '\n'];
str = [str, ' PORT dcm_locked                = dcm_locked',                     '\n'];
str = [str, 'END',                                                              '\n'];
str = [str, '',                                                                 '\n'];

str = [str, 'PORT adc_clk_p = adc_clk_p, DIR = I',               '\n'];
str = [str, 'PORT adc_clk_n = adc_clk_n, DIR = I',               '\n'];
str = [str, 'PORT in_0_n    = in_0_n,    DIR = I, VEC = [7:0]',  '\n'];
str = [str, 'PORT in_0_p    = in_0_p,    DIR = I, VEC = [7:0]',  '\n'];
str = [str, 'PORT fc_0_n    = fc_0_n,    DIR = I',               '\n'];
str = [str, 'PORT fc_0_p    = fc_0_p,    DIR = I',               '\n'];
str = [str, 'PORT in_1_n    = in_1_n,    DIR = I, VEC = [7:0]',  '\n'];
str = [str, 'PORT in_1_p    = in_1_p,    DIR = I, VEC = [7:0]',  '\n'];
str = [str, 'PORT fc_1_n    = fc_1_n,    DIR = I',               '\n'];
str = [str, 'PORT fc_1_p    = fc_1_p,    DIR = I',               '\n'];
str = [str, 'PORT in_2_n    = in_2_n,    DIR = I, VEC = [7:0]',  '\n'];
str = [str, 'PORT in_2_p    = in_2_p,    DIR = I, VEC = [7:0]',  '\n'];
str = [str, 'PORT fc_2_n    = fc_2_n,    DIR = I',               '\n'];
str = [str, 'PORT fc_2_p    = fc_2_p,    DIR = I',               '\n'];
str = [str, 'PORT in_3_n    = in_3_n,    DIR = I, VEC = [7:0]',  '\n'];
str = [str, 'PORT in_3_p    = in_3_p,    DIR = I, VEC = [7:0]',  '\n'];
str = [str, 'PORT fc_3_n    = fc_3_n,    DIR = I',               '\n'];
str = [str, 'PORT fc_3_p    = fc_3_p,    DIR = I',               '\n'];
str = [str, 'PORT in_4_n    = in_4_n,    DIR = I, VEC = [7:0]',  '\n'];
str = [str, 'PORT in_4_p    = in_4_p,    DIR = I, VEC = [7:0]',  '\n'];
str = [str, 'PORT fc_4_n    = fc_4_n,    DIR = I',               '\n'];
str = [str, 'PORT fc_4_p    = fc_4_p,    DIR = I',               '\n'];
str = [str, 'PORT in_5_n    = in_5_n,    DIR = I, VEC = [7:0]',  '\n'];
str = [str, 'PORT in_5_p    = in_5_p,    DIR = I, VEC = [7:0]',  '\n'];
str = [str, 'PORT fc_5_n    = fc_5_n,    DIR = I',               '\n'];
str = [str, 'PORT fc_5_p    = fc_5_p,    DIR = I',               '\n'];
str = [str, 'PORT in_6_n    = in_6_n,    DIR = I, VEC = [7:0]',  '\n'];
str = [str, 'PORT in_6_p    = in_6_p,    DIR = I, VEC = [7:0]',  '\n'];
str = [str, 'PORT fc_6_n    = fc_6_n,    DIR = I',               '\n'];
str = [str, 'PORT fc_6_p    = fc_6_p,    DIR = I',               '\n'];
str = [str, 'PORT in_7_n    = in_7_n,    DIR = I, VEC = [7:0]',  '\n'];
str = [str, 'PORT in_7_p    = in_7_p,    DIR = I, VEC = [7:0]',  '\n'];
str = [str, 'PORT fc_7_n    = fc_7_n,    DIR = I',               '\n'];
str = [str, 'PORT fc_7_p    = fc_7_p,    DIR = I',               '\n'];

str = [str, '\n'];

