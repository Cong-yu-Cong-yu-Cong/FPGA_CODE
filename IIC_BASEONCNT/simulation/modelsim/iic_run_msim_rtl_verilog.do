transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/FpgaProgram/IIC {D:/FpgaProgram/IIC/iic.v}

vlog -vlog01compat -work work +incdir+D:/FpgaProgram/IIC/simulation/modelsim {D:/FpgaProgram/IIC/simulation/modelsim/iic.vt}
vlog -vlog01compat -work work +incdir+D:/FpgaProgram/IIC {D:/FpgaProgram/IIC/24LC64.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  iic_vlg_tst

add wave *
view structure
view signals
run -all
