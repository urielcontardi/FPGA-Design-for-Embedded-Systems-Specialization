transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/urielcontardi/Desktop/Projects/FPGA-Design-for-Embedded-Systems-Specialization/4_FPGA_Capstone-Building_FPGA_Projects/Week2/DE10litePWM/source {/home/urielcontardi/Desktop/Projects/FPGA-Design-for-Embedded-Systems-Specialization/4_FPGA_Capstone-Building_FPGA_Projects/Week2/DE10litePWM/source/pwm_led_top.v}
vlog -vlog01compat -work work +incdir+/home/urielcontardi/Desktop/Projects/FPGA-Design-for-Embedded-Systems-Specialization/4_FPGA_Capstone-Building_FPGA_Projects/Week2/DE10litePWM/source {/home/urielcontardi/Desktop/Projects/FPGA-Design-for-Embedded-Systems-Specialization/4_FPGA_Capstone-Building_FPGA_Projects/Week2/DE10litePWM/source/debouncer.v}
vlog -vlog01compat -work work +incdir+/home/urielcontardi/Desktop/Projects/FPGA-Design-for-Embedded-Systems-Specialization/4_FPGA_Capstone-Building_FPGA_Projects/Week2/DE10litePWM/source {/home/urielcontardi/Desktop/Projects/FPGA-Design-for-Embedded-Systems-Specialization/4_FPGA_Capstone-Building_FPGA_Projects/Week2/DE10litePWM/source/pwm_gen.v}
vlog -vlog01compat -work work +incdir+/home/urielcontardi/Desktop/Projects/FPGA-Design-for-Embedded-Systems-Specialization/4_FPGA_Capstone-Building_FPGA_Projects/Week2/DE10litePWM {/home/urielcontardi/Desktop/Projects/FPGA-Design-for-Embedded-Systems-Specialization/4_FPGA_Capstone-Building_FPGA_Projects/Week2/DE10litePWM/pwm_pll.v}
vlog -vlog01compat -work work +incdir+/home/urielcontardi/Desktop/Projects/FPGA-Design-for-Embedded-Systems-Specialization/4_FPGA_Capstone-Building_FPGA_Projects/Week2/DE10litePWM/db {/home/urielcontardi/Desktop/Projects/FPGA-Design-for-Embedded-Systems-Specialization/4_FPGA_Capstone-Building_FPGA_Projects/Week2/DE10litePWM/db/pwm_pll_altpll.v}

