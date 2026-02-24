set_property PACKAGE_PIN R14 [get_ports rst_n]
set_property IOSTANDARD LVCMOS33 [get_ports rst_n]
set_property PACKAGE_PIN V4 [get_ports clk]
set_property IOSTANDARD SSTL135 [get_ports clk]

create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 2048 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list u_mig_7series_0/u_mig_7series_0_mig/u_ddr3_infrastructure/gen_mmcm.mmcm_i_0]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 6 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {dma_ctrl_u/n_state[0]} {dma_ctrl_u/n_state[1]} {dma_ctrl_u/n_state[2]} {dma_ctrl_u/n_state[3]} {dma_ctrl_u/n_state[4]} {dma_ctrl_u/n_state[5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 28 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {dma_ctrl_u/s_axi_araddr[0]} {dma_ctrl_u/s_axi_araddr[1]} {dma_ctrl_u/s_axi_araddr[2]} {dma_ctrl_u/s_axi_araddr[3]} {dma_ctrl_u/s_axi_araddr[4]} {dma_ctrl_u/s_axi_araddr[5]} {dma_ctrl_u/s_axi_araddr[6]} {dma_ctrl_u/s_axi_araddr[7]} {dma_ctrl_u/s_axi_araddr[8]} {dma_ctrl_u/s_axi_araddr[9]} {dma_ctrl_u/s_axi_araddr[10]} {dma_ctrl_u/s_axi_araddr[11]} {dma_ctrl_u/s_axi_araddr[12]} {dma_ctrl_u/s_axi_araddr[13]} {dma_ctrl_u/s_axi_araddr[14]} {dma_ctrl_u/s_axi_araddr[15]} {dma_ctrl_u/s_axi_araddr[16]} {dma_ctrl_u/s_axi_araddr[17]} {dma_ctrl_u/s_axi_araddr[18]} {dma_ctrl_u/s_axi_araddr[19]} {dma_ctrl_u/s_axi_araddr[20]} {dma_ctrl_u/s_axi_araddr[21]} {dma_ctrl_u/s_axi_araddr[22]} {dma_ctrl_u/s_axi_araddr[23]} {dma_ctrl_u/s_axi_araddr[24]} {dma_ctrl_u/s_axi_araddr[25]} {dma_ctrl_u/s_axi_araddr[26]} {dma_ctrl_u/s_axi_araddr[27]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 2 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {dma_ctrl_u/s_axi_arburst[0]} {dma_ctrl_u/s_axi_arburst[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 3 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {dma_ctrl_u/s_axi_arsize[0]} {dma_ctrl_u/s_axi_arsize[1]} {dma_ctrl_u/s_axi_arsize[2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 8 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {dma_ctrl_u/rf_data_cnt[0]} {dma_ctrl_u/rf_data_cnt[1]} {dma_ctrl_u/rf_data_cnt[2]} {dma_ctrl_u/rf_data_cnt[3]} {dma_ctrl_u/rf_data_cnt[4]} {dma_ctrl_u/rf_data_cnt[5]} {dma_ctrl_u/rf_data_cnt[6]} {dma_ctrl_u/rf_data_cnt[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 4 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {dma_ctrl_u/s_axi_arid[0]} {dma_ctrl_u/s_axi_arid[1]} {dma_ctrl_u/s_axi_arid[2]} {dma_ctrl_u/s_axi_arid[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 28 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {dma_ctrl_u/s_axi_awaddr[0]} {dma_ctrl_u/s_axi_awaddr[1]} {dma_ctrl_u/s_axi_awaddr[2]} {dma_ctrl_u/s_axi_awaddr[3]} {dma_ctrl_u/s_axi_awaddr[4]} {dma_ctrl_u/s_axi_awaddr[5]} {dma_ctrl_u/s_axi_awaddr[6]} {dma_ctrl_u/s_axi_awaddr[7]} {dma_ctrl_u/s_axi_awaddr[8]} {dma_ctrl_u/s_axi_awaddr[9]} {dma_ctrl_u/s_axi_awaddr[10]} {dma_ctrl_u/s_axi_awaddr[11]} {dma_ctrl_u/s_axi_awaddr[12]} {dma_ctrl_u/s_axi_awaddr[13]} {dma_ctrl_u/s_axi_awaddr[14]} {dma_ctrl_u/s_axi_awaddr[15]} {dma_ctrl_u/s_axi_awaddr[16]} {dma_ctrl_u/s_axi_awaddr[17]} {dma_ctrl_u/s_axi_awaddr[18]} {dma_ctrl_u/s_axi_awaddr[19]} {dma_ctrl_u/s_axi_awaddr[20]} {dma_ctrl_u/s_axi_awaddr[21]} {dma_ctrl_u/s_axi_awaddr[22]} {dma_ctrl_u/s_axi_awaddr[23]} {dma_ctrl_u/s_axi_awaddr[24]} {dma_ctrl_u/s_axi_awaddr[25]} {dma_ctrl_u/s_axi_awaddr[26]} {dma_ctrl_u/s_axi_awaddr[27]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 6 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {dma_ctrl_u/c_state[0]} {dma_ctrl_u/c_state[1]} {dma_ctrl_u/c_state[2]} {dma_ctrl_u/c_state[3]} {dma_ctrl_u/c_state[4]} {dma_ctrl_u/c_state[5]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 2 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {dma_ctrl_u/s_axi_awburst[0]} {dma_ctrl_u/s_axi_awburst[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 4 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {dma_ctrl_u/s_axi_awid[0]} {dma_ctrl_u/s_axi_awid[1]} {dma_ctrl_u/s_axi_awid[2]} {dma_ctrl_u/s_axi_awid[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 8 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {dma_ctrl_u/s_axi_awlen[0]} {dma_ctrl_u/s_axi_awlen[1]} {dma_ctrl_u/s_axi_awlen[2]} {dma_ctrl_u/s_axi_awlen[3]} {dma_ctrl_u/s_axi_awlen[4]} {dma_ctrl_u/s_axi_awlen[5]} {dma_ctrl_u/s_axi_awlen[6]} {dma_ctrl_u/s_axi_awlen[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 3 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {dma_ctrl_u/s_axi_awsize[0]} {dma_ctrl_u/s_axi_awsize[1]} {dma_ctrl_u/s_axi_awsize[2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 8 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {dma_ctrl_u/s_axi_arlen[0]} {dma_ctrl_u/s_axi_arlen[1]} {dma_ctrl_u/s_axi_arlen[2]} {dma_ctrl_u/s_axi_arlen[3]} {dma_ctrl_u/s_axi_arlen[4]} {dma_ctrl_u/s_axi_arlen[5]} {dma_ctrl_u/s_axi_arlen[6]} {dma_ctrl_u/s_axi_arlen[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 4 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {dma_ctrl_u/s_axi_bid[0]} {dma_ctrl_u/s_axi_bid[1]} {dma_ctrl_u/s_axi_bid[2]} {dma_ctrl_u/s_axi_bid[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 9 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {dma_ctrl_u/wr_data_cnt[0]} {dma_ctrl_u/wr_data_cnt[1]} {dma_ctrl_u/wr_data_cnt[2]} {dma_ctrl_u/wr_data_cnt[3]} {dma_ctrl_u/wr_data_cnt[4]} {dma_ctrl_u/wr_data_cnt[5]} {dma_ctrl_u/wr_data_cnt[6]} {dma_ctrl_u/wr_data_cnt[7]} {dma_ctrl_u/wr_data_cnt[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 2 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list {dma_ctrl_u/s_axi_rresp[0]} {dma_ctrl_u/s_axi_rresp[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 8 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list {dma_ctrl_u/wf_data_cnt[0]} {dma_ctrl_u/wf_data_cnt[1]} {dma_ctrl_u/wf_data_cnt[2]} {dma_ctrl_u/wf_data_cnt[3]} {dma_ctrl_u/wf_data_cnt[4]} {dma_ctrl_u/wf_data_cnt[5]} {dma_ctrl_u/wf_data_cnt[6]} {dma_ctrl_u/wf_data_cnt[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 128 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list {dma_ctrl_u/s_axi_rdata[0]} {dma_ctrl_u/s_axi_rdata[1]} {dma_ctrl_u/s_axi_rdata[2]} {dma_ctrl_u/s_axi_rdata[3]} {dma_ctrl_u/s_axi_rdata[4]} {dma_ctrl_u/s_axi_rdata[5]} {dma_ctrl_u/s_axi_rdata[6]} {dma_ctrl_u/s_axi_rdata[7]} {dma_ctrl_u/s_axi_rdata[8]} {dma_ctrl_u/s_axi_rdata[9]} {dma_ctrl_u/s_axi_rdata[10]} {dma_ctrl_u/s_axi_rdata[11]} {dma_ctrl_u/s_axi_rdata[12]} {dma_ctrl_u/s_axi_rdata[13]} {dma_ctrl_u/s_axi_rdata[14]} {dma_ctrl_u/s_axi_rdata[15]} {dma_ctrl_u/s_axi_rdata[16]} {dma_ctrl_u/s_axi_rdata[17]} {dma_ctrl_u/s_axi_rdata[18]} {dma_ctrl_u/s_axi_rdata[19]} {dma_ctrl_u/s_axi_rdata[20]} {dma_ctrl_u/s_axi_rdata[21]} {dma_ctrl_u/s_axi_rdata[22]} {dma_ctrl_u/s_axi_rdata[23]} {dma_ctrl_u/s_axi_rdata[24]} {dma_ctrl_u/s_axi_rdata[25]} {dma_ctrl_u/s_axi_rdata[26]} {dma_ctrl_u/s_axi_rdata[27]} {dma_ctrl_u/s_axi_rdata[28]} {dma_ctrl_u/s_axi_rdata[29]} {dma_ctrl_u/s_axi_rdata[30]} {dma_ctrl_u/s_axi_rdata[31]} {dma_ctrl_u/s_axi_rdata[32]} {dma_ctrl_u/s_axi_rdata[33]} {dma_ctrl_u/s_axi_rdata[34]} {dma_ctrl_u/s_axi_rdata[35]} {dma_ctrl_u/s_axi_rdata[36]} {dma_ctrl_u/s_axi_rdata[37]} {dma_ctrl_u/s_axi_rdata[38]} {dma_ctrl_u/s_axi_rdata[39]} {dma_ctrl_u/s_axi_rdata[40]} {dma_ctrl_u/s_axi_rdata[41]} {dma_ctrl_u/s_axi_rdata[42]} {dma_ctrl_u/s_axi_rdata[43]} {dma_ctrl_u/s_axi_rdata[44]} {dma_ctrl_u/s_axi_rdata[45]} {dma_ctrl_u/s_axi_rdata[46]} {dma_ctrl_u/s_axi_rdata[47]} {dma_ctrl_u/s_axi_rdata[48]} {dma_ctrl_u/s_axi_rdata[49]} {dma_ctrl_u/s_axi_rdata[50]} {dma_ctrl_u/s_axi_rdata[51]} {dma_ctrl_u/s_axi_rdata[52]} {dma_ctrl_u/s_axi_rdata[53]} {dma_ctrl_u/s_axi_rdata[54]} {dma_ctrl_u/s_axi_rdata[55]} {dma_ctrl_u/s_axi_rdata[56]} {dma_ctrl_u/s_axi_rdata[57]} {dma_ctrl_u/s_axi_rdata[58]} {dma_ctrl_u/s_axi_rdata[59]} {dma_ctrl_u/s_axi_rdata[60]} {dma_ctrl_u/s_axi_rdata[61]} {dma_ctrl_u/s_axi_rdata[62]} {dma_ctrl_u/s_axi_rdata[63]} {dma_ctrl_u/s_axi_rdata[64]} {dma_ctrl_u/s_axi_rdata[65]} {dma_ctrl_u/s_axi_rdata[66]} {dma_ctrl_u/s_axi_rdata[67]} {dma_ctrl_u/s_axi_rdata[68]} {dma_ctrl_u/s_axi_rdata[69]} {dma_ctrl_u/s_axi_rdata[70]} {dma_ctrl_u/s_axi_rdata[71]} {dma_ctrl_u/s_axi_rdata[72]} {dma_ctrl_u/s_axi_rdata[73]} {dma_ctrl_u/s_axi_rdata[74]} {dma_ctrl_u/s_axi_rdata[75]} {dma_ctrl_u/s_axi_rdata[76]} {dma_ctrl_u/s_axi_rdata[77]} {dma_ctrl_u/s_axi_rdata[78]} {dma_ctrl_u/s_axi_rdata[79]} {dma_ctrl_u/s_axi_rdata[80]} {dma_ctrl_u/s_axi_rdata[81]} {dma_ctrl_u/s_axi_rdata[82]} {dma_ctrl_u/s_axi_rdata[83]} {dma_ctrl_u/s_axi_rdata[84]} {dma_ctrl_u/s_axi_rdata[85]} {dma_ctrl_u/s_axi_rdata[86]} {dma_ctrl_u/s_axi_rdata[87]} {dma_ctrl_u/s_axi_rdata[88]} {dma_ctrl_u/s_axi_rdata[89]} {dma_ctrl_u/s_axi_rdata[90]} {dma_ctrl_u/s_axi_rdata[91]} {dma_ctrl_u/s_axi_rdata[92]} {dma_ctrl_u/s_axi_rdata[93]} {dma_ctrl_u/s_axi_rdata[94]} {dma_ctrl_u/s_axi_rdata[95]} {dma_ctrl_u/s_axi_rdata[96]} {dma_ctrl_u/s_axi_rdata[97]} {dma_ctrl_u/s_axi_rdata[98]} {dma_ctrl_u/s_axi_rdata[99]} {dma_ctrl_u/s_axi_rdata[100]} {dma_ctrl_u/s_axi_rdata[101]} {dma_ctrl_u/s_axi_rdata[102]} {dma_ctrl_u/s_axi_rdata[103]} {dma_ctrl_u/s_axi_rdata[104]} {dma_ctrl_u/s_axi_rdata[105]} {dma_ctrl_u/s_axi_rdata[106]} {dma_ctrl_u/s_axi_rdata[107]} {dma_ctrl_u/s_axi_rdata[108]} {dma_ctrl_u/s_axi_rdata[109]} {dma_ctrl_u/s_axi_rdata[110]} {dma_ctrl_u/s_axi_rdata[111]} {dma_ctrl_u/s_axi_rdata[112]} {dma_ctrl_u/s_axi_rdata[113]} {dma_ctrl_u/s_axi_rdata[114]} {dma_ctrl_u/s_axi_rdata[115]} {dma_ctrl_u/s_axi_rdata[116]} {dma_ctrl_u/s_axi_rdata[117]} {dma_ctrl_u/s_axi_rdata[118]} {dma_ctrl_u/s_axi_rdata[119]} {dma_ctrl_u/s_axi_rdata[120]} {dma_ctrl_u/s_axi_rdata[121]} {dma_ctrl_u/s_axi_rdata[122]} {dma_ctrl_u/s_axi_rdata[123]} {dma_ctrl_u/s_axi_rdata[124]} {dma_ctrl_u/s_axi_rdata[125]} {dma_ctrl_u/s_axi_rdata[126]} {dma_ctrl_u/s_axi_rdata[127]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 2 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list {dma_ctrl_u/s_axi_bresp[0]} {dma_ctrl_u/s_axi_bresp[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 128 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list {dma_ctrl_u/s_axi_wdata[0]} {dma_ctrl_u/s_axi_wdata[1]} {dma_ctrl_u/s_axi_wdata[2]} {dma_ctrl_u/s_axi_wdata[3]} {dma_ctrl_u/s_axi_wdata[4]} {dma_ctrl_u/s_axi_wdata[5]} {dma_ctrl_u/s_axi_wdata[6]} {dma_ctrl_u/s_axi_wdata[7]} {dma_ctrl_u/s_axi_wdata[8]} {dma_ctrl_u/s_axi_wdata[9]} {dma_ctrl_u/s_axi_wdata[10]} {dma_ctrl_u/s_axi_wdata[11]} {dma_ctrl_u/s_axi_wdata[12]} {dma_ctrl_u/s_axi_wdata[13]} {dma_ctrl_u/s_axi_wdata[14]} {dma_ctrl_u/s_axi_wdata[15]} {dma_ctrl_u/s_axi_wdata[16]} {dma_ctrl_u/s_axi_wdata[17]} {dma_ctrl_u/s_axi_wdata[18]} {dma_ctrl_u/s_axi_wdata[19]} {dma_ctrl_u/s_axi_wdata[20]} {dma_ctrl_u/s_axi_wdata[21]} {dma_ctrl_u/s_axi_wdata[22]} {dma_ctrl_u/s_axi_wdata[23]} {dma_ctrl_u/s_axi_wdata[24]} {dma_ctrl_u/s_axi_wdata[25]} {dma_ctrl_u/s_axi_wdata[26]} {dma_ctrl_u/s_axi_wdata[27]} {dma_ctrl_u/s_axi_wdata[28]} {dma_ctrl_u/s_axi_wdata[29]} {dma_ctrl_u/s_axi_wdata[30]} {dma_ctrl_u/s_axi_wdata[31]} {dma_ctrl_u/s_axi_wdata[32]} {dma_ctrl_u/s_axi_wdata[33]} {dma_ctrl_u/s_axi_wdata[34]} {dma_ctrl_u/s_axi_wdata[35]} {dma_ctrl_u/s_axi_wdata[36]} {dma_ctrl_u/s_axi_wdata[37]} {dma_ctrl_u/s_axi_wdata[38]} {dma_ctrl_u/s_axi_wdata[39]} {dma_ctrl_u/s_axi_wdata[40]} {dma_ctrl_u/s_axi_wdata[41]} {dma_ctrl_u/s_axi_wdata[42]} {dma_ctrl_u/s_axi_wdata[43]} {dma_ctrl_u/s_axi_wdata[44]} {dma_ctrl_u/s_axi_wdata[45]} {dma_ctrl_u/s_axi_wdata[46]} {dma_ctrl_u/s_axi_wdata[47]} {dma_ctrl_u/s_axi_wdata[48]} {dma_ctrl_u/s_axi_wdata[49]} {dma_ctrl_u/s_axi_wdata[50]} {dma_ctrl_u/s_axi_wdata[51]} {dma_ctrl_u/s_axi_wdata[52]} {dma_ctrl_u/s_axi_wdata[53]} {dma_ctrl_u/s_axi_wdata[54]} {dma_ctrl_u/s_axi_wdata[55]} {dma_ctrl_u/s_axi_wdata[56]} {dma_ctrl_u/s_axi_wdata[57]} {dma_ctrl_u/s_axi_wdata[58]} {dma_ctrl_u/s_axi_wdata[59]} {dma_ctrl_u/s_axi_wdata[60]} {dma_ctrl_u/s_axi_wdata[61]} {dma_ctrl_u/s_axi_wdata[62]} {dma_ctrl_u/s_axi_wdata[63]} {dma_ctrl_u/s_axi_wdata[64]} {dma_ctrl_u/s_axi_wdata[65]} {dma_ctrl_u/s_axi_wdata[66]} {dma_ctrl_u/s_axi_wdata[67]} {dma_ctrl_u/s_axi_wdata[68]} {dma_ctrl_u/s_axi_wdata[69]} {dma_ctrl_u/s_axi_wdata[70]} {dma_ctrl_u/s_axi_wdata[71]} {dma_ctrl_u/s_axi_wdata[72]} {dma_ctrl_u/s_axi_wdata[73]} {dma_ctrl_u/s_axi_wdata[74]} {dma_ctrl_u/s_axi_wdata[75]} {dma_ctrl_u/s_axi_wdata[76]} {dma_ctrl_u/s_axi_wdata[77]} {dma_ctrl_u/s_axi_wdata[78]} {dma_ctrl_u/s_axi_wdata[79]} {dma_ctrl_u/s_axi_wdata[80]} {dma_ctrl_u/s_axi_wdata[81]} {dma_ctrl_u/s_axi_wdata[82]} {dma_ctrl_u/s_axi_wdata[83]} {dma_ctrl_u/s_axi_wdata[84]} {dma_ctrl_u/s_axi_wdata[85]} {dma_ctrl_u/s_axi_wdata[86]} {dma_ctrl_u/s_axi_wdata[87]} {dma_ctrl_u/s_axi_wdata[88]} {dma_ctrl_u/s_axi_wdata[89]} {dma_ctrl_u/s_axi_wdata[90]} {dma_ctrl_u/s_axi_wdata[91]} {dma_ctrl_u/s_axi_wdata[92]} {dma_ctrl_u/s_axi_wdata[93]} {dma_ctrl_u/s_axi_wdata[94]} {dma_ctrl_u/s_axi_wdata[95]} {dma_ctrl_u/s_axi_wdata[96]} {dma_ctrl_u/s_axi_wdata[97]} {dma_ctrl_u/s_axi_wdata[98]} {dma_ctrl_u/s_axi_wdata[99]} {dma_ctrl_u/s_axi_wdata[100]} {dma_ctrl_u/s_axi_wdata[101]} {dma_ctrl_u/s_axi_wdata[102]} {dma_ctrl_u/s_axi_wdata[103]} {dma_ctrl_u/s_axi_wdata[104]} {dma_ctrl_u/s_axi_wdata[105]} {dma_ctrl_u/s_axi_wdata[106]} {dma_ctrl_u/s_axi_wdata[107]} {dma_ctrl_u/s_axi_wdata[108]} {dma_ctrl_u/s_axi_wdata[109]} {dma_ctrl_u/s_axi_wdata[110]} {dma_ctrl_u/s_axi_wdata[111]} {dma_ctrl_u/s_axi_wdata[112]} {dma_ctrl_u/s_axi_wdata[113]} {dma_ctrl_u/s_axi_wdata[114]} {dma_ctrl_u/s_axi_wdata[115]} {dma_ctrl_u/s_axi_wdata[116]} {dma_ctrl_u/s_axi_wdata[117]} {dma_ctrl_u/s_axi_wdata[118]} {dma_ctrl_u/s_axi_wdata[119]} {dma_ctrl_u/s_axi_wdata[120]} {dma_ctrl_u/s_axi_wdata[121]} {dma_ctrl_u/s_axi_wdata[122]} {dma_ctrl_u/s_axi_wdata[123]} {dma_ctrl_u/s_axi_wdata[124]} {dma_ctrl_u/s_axi_wdata[125]} {dma_ctrl_u/s_axi_wdata[126]} {dma_ctrl_u/s_axi_wdata[127]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 16 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list {dma_ctrl_u/s_axi_wstrb[0]} {dma_ctrl_u/s_axi_wstrb[1]} {dma_ctrl_u/s_axi_wstrb[2]} {dma_ctrl_u/s_axi_wstrb[3]} {dma_ctrl_u/s_axi_wstrb[4]} {dma_ctrl_u/s_axi_wstrb[5]} {dma_ctrl_u/s_axi_wstrb[6]} {dma_ctrl_u/s_axi_wstrb[7]} {dma_ctrl_u/s_axi_wstrb[8]} {dma_ctrl_u/s_axi_wstrb[9]} {dma_ctrl_u/s_axi_wstrb[10]} {dma_ctrl_u/s_axi_wstrb[11]} {dma_ctrl_u/s_axi_wstrb[12]} {dma_ctrl_u/s_axi_wstrb[13]} {dma_ctrl_u/s_axi_wstrb[14]} {dma_ctrl_u/s_axi_wstrb[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 4 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list {dma_ctrl_u/s_axi_rid[0]} {dma_ctrl_u/s_axi_rid[1]} {dma_ctrl_u/s_axi_rid[2]} {dma_ctrl_u/s_axi_rid[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 1 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list dma_ctrl_u/rf_rd_en]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
set_property port_width 1 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list dma_ctrl_u/rf_wr_en]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
set_property port_width 1 [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list dma_ctrl_u/s_axi_arready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
set_property port_width 1 [get_debug_ports u_ila_0/probe25]
connect_debug_port u_ila_0/probe25 [get_nets [list dma_ctrl_u/s_axi_arvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe26]
set_property port_width 1 [get_debug_ports u_ila_0/probe26]
connect_debug_port u_ila_0/probe26 [get_nets [list dma_ctrl_u/s_axi_awready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe27]
set_property port_width 1 [get_debug_ports u_ila_0/probe27]
connect_debug_port u_ila_0/probe27 [get_nets [list dma_ctrl_u/s_axi_awvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe28]
set_property port_width 1 [get_debug_ports u_ila_0/probe28]
connect_debug_port u_ila_0/probe28 [get_nets [list dma_ctrl_u/s_axi_bready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe29]
set_property port_width 1 [get_debug_ports u_ila_0/probe29]
connect_debug_port u_ila_0/probe29 [get_nets [list dma_ctrl_u/s_axi_bvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe30]
set_property port_width 1 [get_debug_ports u_ila_0/probe30]
connect_debug_port u_ila_0/probe30 [get_nets [list dma_ctrl_u/s_axi_rlast]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe31]
set_property port_width 1 [get_debug_ports u_ila_0/probe31]
connect_debug_port u_ila_0/probe31 [get_nets [list dma_ctrl_u/s_axi_rready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe32]
set_property port_width 1 [get_debug_ports u_ila_0/probe32]
connect_debug_port u_ila_0/probe32 [get_nets [list dma_ctrl_u/s_axi_rvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe33]
set_property port_width 1 [get_debug_ports u_ila_0/probe33]
connect_debug_port u_ila_0/probe33 [get_nets [list dma_ctrl_u/s_axi_wlast]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe34]
set_property port_width 1 [get_debug_ports u_ila_0/probe34]
connect_debug_port u_ila_0/probe34 [get_nets [list dma_ctrl_u/s_axi_wready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe35]
set_property port_width 1 [get_debug_ports u_ila_0/probe35]
connect_debug_port u_ila_0/probe35 [get_nets [list dma_ctrl_u/s_axi_wvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe36]
set_property port_width 1 [get_debug_ports u_ila_0/probe36]
connect_debug_port u_ila_0/probe36 [get_nets [list dma_ctrl_u/wf_rd_en]]
create_debug_core u_ila_1 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_1]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_1]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_1]
set_property C_DATA_DEPTH 2048 [get_debug_cores u_ila_1]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_1]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_1]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_1]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_1]
set_property port_width 1 [get_debug_ports u_ila_1/clk]
connect_debug_port u_ila_1/clk [get_nets [list clk_IBUF_BUFG]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe0]
set_property port_width 16 [get_debug_ports u_ila_1/probe0]
connect_debug_port u_ila_1/probe0 [get_nets [list {dma_ctrl_u/rf_rd_data[0]} {dma_ctrl_u/rf_rd_data[1]} {dma_ctrl_u/rf_rd_data[2]} {dma_ctrl_u/rf_rd_data[3]} {dma_ctrl_u/rf_rd_data[4]} {dma_ctrl_u/rf_rd_data[5]} {dma_ctrl_u/rf_rd_data[6]} {dma_ctrl_u/rf_rd_data[7]} {dma_ctrl_u/rf_rd_data[8]} {dma_ctrl_u/rf_rd_data[9]} {dma_ctrl_u/rf_rd_data[10]} {dma_ctrl_u/rf_rd_data[11]} {dma_ctrl_u/rf_rd_data[12]} {dma_ctrl_u/rf_rd_data[13]} {dma_ctrl_u/rf_rd_data[14]} {dma_ctrl_u/rf_rd_data[15]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe1]
set_property port_width 16 [get_debug_ports u_ila_1/probe1]
connect_debug_port u_ila_1/probe1 [get_nets [list {dma_ctrl_u/wf_wr_data[0]} {dma_ctrl_u/wf_wr_data[1]} {dma_ctrl_u/wf_wr_data[2]} {dma_ctrl_u/wf_wr_data[3]} {dma_ctrl_u/wf_wr_data[4]} {dma_ctrl_u/wf_wr_data[5]} {dma_ctrl_u/wf_wr_data[6]} {dma_ctrl_u/wf_wr_data[7]} {dma_ctrl_u/wf_wr_data[8]} {dma_ctrl_u/wf_wr_data[9]} {dma_ctrl_u/wf_wr_data[10]} {dma_ctrl_u/wf_wr_data[11]} {dma_ctrl_u/wf_wr_data[12]} {dma_ctrl_u/wf_wr_data[13]} {dma_ctrl_u/wf_wr_data[14]} {dma_ctrl_u/wf_wr_data[15]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe2]
set_property port_width 1 [get_debug_ports u_ila_1/probe2]
connect_debug_port u_ila_1/probe2 [get_nets [list dma_ctrl_u/wf_wr_en]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_IBUF_BUFG]
