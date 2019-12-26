# # author 	: czh
# data 		: 2019-12-25
# version	: 0.1

#================
# user varial
#================
tc=
dir=

#================
# configuration
#================
CONFIG_TOP=y
CONFIG_CORE=y
CONFIG_VERIF_CORE=y
CONFIG_CORE_A=y
#================
# user varial
#================
PROJ_HOME = ~/sys_env/sid
curdir = $(CURDIR)
workplace = $(CURDIR)/simdir/$(tc)
export PROJ_HOME curdir

#================
# add file flist
#================
dut-y=
verif-y=
cfg-y=
include $(CURDIR)/flist/dut.Makefile
include $(CURDIR)/flist/verif.Makefile

#================================
# create temp dir
#================================
createtewp:
	@mkdir -p $(workplace)

#================================
# compile: first of three steps
#================================
comp:
	@echo $(dut-y)
	@echo $(verif-y)
	@echo $(cfg-y)
	@cd $(CURDIR)/compile; \
		ncvlog -cdslib $(CURDIR)/lib/cds.lib -hdlvar $(CURDIR)/lib/hdl.var \
			   $(dut-y) $(verif-y) $(cfg-y)
#================================
# elab: second of three steps
#================================
elab:
	@cd $(CURDIR)/compile; \
		ncvlog -cdslib $(CURDIR)/lib/cds.lib -hdlvar $(CURDIR)/lib/hdl.var; \
			   -messages $(dut-y) $(verif-y) $(cfg-y)
#===================================
# simulation:third of three steps
#===================================
sim:createwp
	@cd $(workplace); \
		ncsim -cdslib $(CURDIR)/lib/cds.lib -hdlvar $(CURDIR)/lib/hdl.var; \
			  -messages cfg:config
#===============
# run: one step
#================
run:createwp
	@cd $(workplace); \
		irun -cdslib $(CURDIR)/lib/cds.lib -hdlvar $(CURDIR)/lib/hdl.var; \
			  -messages cfg:config
#=========================
# clean all temp files
#=========================
clean:
	@rm -rf $(CURDIR)/compile/*/*;
	@cd $(workplace);rm -rf *.log *.history *.key 

PHONY += comp elab sim run clean
.PHONY: $(PHONY)
