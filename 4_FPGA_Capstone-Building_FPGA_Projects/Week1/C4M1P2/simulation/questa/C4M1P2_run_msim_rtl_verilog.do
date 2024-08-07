transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/contardii/Desktop/FPGA-Design-for-Embedded-Systems-Specialization/4_FPGA_Capstone-Building_FPGA_Projects/Week1/C4M1P2 {C:/Users/contardii/Desktop/FPGA-Design-for-Embedded-Systems-Specialization/4_FPGA_Capstone-Building_FPGA_Projects/Week1/C4M1P2/DE10_LITE_Golden_Top.v}
vcom -93 -work work {C:/Users/contardii/Desktop/FPGA-Design-for-Embedded-Systems-Specialization/4_FPGA_Capstone-Building_FPGA_Projects/Week1/C4M1P2/C4M1P2.vhd}

vcom -93 -work work {C:/Users/contardii/Desktop/FPGA-Design-for-Embedded-Systems-Specialization/4_FPGA_Capstone-Building_FPGA_Projects/Week1/C4M1P2/C4M1P2.vhd}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  C4M1P2

add wave *
view structure
view signals
run -all
