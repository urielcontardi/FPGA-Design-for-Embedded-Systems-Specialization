// Copyright (C) 2024  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 23.1std.1 Build 993 05/14/2024 SC Lite Edition"
// CREATED		"Tue Aug 20 20:06:51 2024"

module pwm_led_top(
	MAX10_CLK1_50,
	SW,
	ARDUINO_IO,
	LEDR
);


input wire	MAX10_CLK1_50;
input wire	[2:0] SW;
output wire	[0:0] ARDUINO_IO;
output wire	[0:0] LEDR;

wire	[2:0] duty_cycle;
wire	duty_cycle_clk;
wire	pwm;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;

assign	ARDUINO_IO[0] = SYNTHESIZED_WIRE_1;
assign	LEDR[0] = SYNTHESIZED_WIRE_1;




pwm_pll	b2v_inst(
	.inclk0(MAX10_CLK1_50),
	.c0(SYNTHESIZED_WIRE_0),
	.c1(duty_cycle_clk));

assign	SYNTHESIZED_WIRE_1 =  ~pwm;


debouncer	b2v_inst3(
	.noisy(SW[0]),
	.clk(duty_cycle_clk)
	);


debouncer	b2v_inst4(
	.noisy(SW[1]),
	.clk(duty_cycle_clk)
	);


debouncer	b2v_inst5(
	.noisy(SW[2]),
	.clk(duty_cycle_clk)
	);


pwm_gen	b2v_inst6(
	.clk(SYNTHESIZED_WIRE_0),
	.duty_cycle(duty_cycle),
	.pwm(pwm));


endmodule
