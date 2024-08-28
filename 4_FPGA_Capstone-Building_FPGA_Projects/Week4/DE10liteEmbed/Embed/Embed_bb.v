
module Embed (
	altpll_1_areset_conduit_export,
	altpll_1_locked_conduit_export,
	clk_clk,
	clk_0_clk,
	dram_addr,
	dram_ba,
	dram_cas_n,
	dram_cke,
	dram_cs_n,
	dram_dq,
	dram_dqm,
	dram_ras_n,
	dram_we_n,
	dram_clk_clk,
	gsensor_MISO,
	gsensor_MOSI,
	gsensor_SCLK,
	gsensor_SS_n,
	ledr_export,
	modular_adc_0_adc_pll_locked_export,
	reset_reset_n,
	reset_0_reset_n,
	sw_export);	

	input		altpll_1_areset_conduit_export;
	output		altpll_1_locked_conduit_export;
	input		clk_clk;
	input		clk_0_clk;
	output	[12:0]	dram_addr;
	output	[1:0]	dram_ba;
	output		dram_cas_n;
	output		dram_cke;
	output		dram_cs_n;
	inout	[15:0]	dram_dq;
	output	[1:0]	dram_dqm;
	output		dram_ras_n;
	output		dram_we_n;
	output		dram_clk_clk;
	input		gsensor_MISO;
	output		gsensor_MOSI;
	output		gsensor_SCLK;
	output		gsensor_SS_n;
	output	[9:0]	ledr_export;
	input		modular_adc_0_adc_pll_locked_export;
	input		reset_reset_n;
	input		reset_0_reset_n;
	input	[9:0]	sw_export;
endmodule
