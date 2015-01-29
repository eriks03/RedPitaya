set_false_path -from [get_clocks adc_clk] -to [get_clocks dac_clk_out]
set_property LOC DNA_PORT_X0Y0 [get_cells i_hk/i_DNA]


create_generated_clock -name {i_daisy/tx_cfg_sel[1]} -source [get_pins {i_daisy/tx_cfg_sel_reg[1]/C}] -divide_by 1 [get_pins {i_daisy/tx_cfg_sel_reg[1]/Q}]
create_generated_clock -name {i_daisy/tx_cfg_sel[2]} -source [get_pins {i_daisy/tx_cfg_sel_reg[2]/C}] -divide_by 1 [get_pins {i_daisy/tx_cfg_sel_reg[2]/Q}]
create_generated_clock -name i_hk/dna_clk -source [get_pins {i_ps/system_i/system_i/processing_system7_0/inst/PS7_i/FCLKCLK[0]}] -divide_by 1 [get_pins i_hk/dna_clk_reg/Q]
create_generated_clock -name dac_clk_o -source [get_pins i_analog/i_dac_clk/C] -divide_by 1 -invert [get_ports dac_clk_o]
create_generated_clock -name dac_sel_o -source [get_pins i_analog/i_dac_sel/C] -divide_by 1 [get_ports dac_sel_o]
create_generated_clock -name dac_wrt_o -source [get_pins i_analog/i_dac_wrt/C] -divide_by 1 -invert [get_ports dac_wrt_o]
create_generated_clock -name {daisy_p_o[1]} -source [get_pins i_daisy/i_tx/ODDR_clk/C] -divide_by 1 [get_ports {daisy_p_o[1]}]
set_clock_groups -asynchronous -group [get_clocks par_clk] -group [get_clocks adc_clk]
