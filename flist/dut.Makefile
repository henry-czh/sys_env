
dut-$(CONFIG_CORE_A) += +define+CORE_A
dut-$(CONFIG_CORE_B) += +define+CORE_B
dut-$(CONFIG_CORE) += -f $(PROJ_HOME)/core/core.flist

dut-$(CONFIG_TOP) += -f $(PROJ_HOME)/top/top.flist
