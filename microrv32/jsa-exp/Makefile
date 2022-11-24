rngSeed ?= 42
# MicroRV32Top or RiscV32Core are generated from the files currently
# RiscV32Core is the default here
target ?= RiscV32Core

hx8kYS = synth_hx8k_rv32.ys
ecp5YS = synth_ecp5_rv32.ys
ifeq ($(target), MicroRV32Top)
hx8kYS = synth_hx8k_soc.ys
ecp5YS = synth_ecp5_soc.ys
endif

synth_hx8k:
	echo $(hx8kYS)
	/usr/bin/time -o tmp/hx8k/time_synth.log -f "%E real\n%U user\n%S system" yosys -d -s $(hx8kYS) -l tmp/hx8k/$(target).log
	grep -A22 "Printing statistics*" tmp/hx8k/$(target).log > tmp/hx8k/synth_stat.log
pnr_hx8k: synth_hx8k
	/usr/bin/time -o tmp/hx8k/time_pnr.log -f "%E real\n%U user\n%S system" nextpnr-ice40 -l tmp/hx8k/$(target)_pnr.log --hx8k --package ct256 --json tmp/hx8k/$(target).json --asc tmp/hx8k/$(target).asc --pcf-allow-unconstrained --seed $(rngSeed)
	grep -A7 "Info: Device utilisation*" tmp/hx8k/$(target)_pnr.log > tmp/hx8k/pnr_stat.log
	grep "Max frequency for clock *" tmp/hx8k/$(target)_pnr.log | tail -1 >> tmp/hx8k/pnr_stat.log
pack_hx8k: pnr_hx8k
	icepack -v tmp/hx8k/$(target).asc tmp/hx8k/$(target).bit
all_hx8k: synth_hx8k pnr_hx8k pack_hx8k
	grep -A22 "Printing statistics*" tmp/hx8k/$(target).log
	grep -A7 "Info: Device utilisation*" tmp/hx8k/$(target)_pnr.log
	grep "Max frequency for clock *" tmp/hx8k/$(target)_pnr.log | tail -1
	
synth_ecp5:
	/usr/bin/time -o tmp/ecp5/time_synth.log -f "%E real\n%U user\n%S system" yosys -d -s $(ecp5YS) -l tmp/ecp5/$(target).log
	grep -A22 "Printing statistics*" tmp/ecp5/$(target).log > tmp/ecp5/synth_stat.log
pnr_ecp5: synth_ecp5
	/usr/bin/time -o tmp/ecp5/time_pnr.log -f "%E real\n%U user\n%S system" nextpnr-ecp5 -l tmp/ecp5/$(target)_pnr.log --um5g-85k --package CABGA381 --json tmp/ecp5/$(target).json --textcfg tmp/ecp5/$(target).cfg --lpf-allow-unconstrained --seed $(rngSeed)
	grep -A8 "Info: Logic utilisation*" tmp/ecp5/$(target)_pnr.log > tmp/ecp5/pnr_stat.log
	grep -A27 "Info: Device utilisation*" tmp/ecp5/$(target)_pnr.log >> tmp/ecp5/pnr_stat.log
	grep "Max frequency for clock *" tmp/ecp5/$(target)_pnr.log | tail -1 >> tmp/ecp5/pnr_stat.log
pack_ecp5: pnr_ecp5
	ecppack -v --svf tmp/ecp5/$(target).svf --input tmp/ecp5/$(target).cfg --bit tmp/ecp5/$(target).bit 
all_ecp5: synth_ecp5 pnr_ecp5 pack_ecp5
	grep -A22 "Printing statistics*" tmp/ecp5/$(target).log
	grep -A8 "Info: Logic utilisation*" tmp/ecp5/$(target)_pnr.log
	grep -A27 "Info: Device utilisation*" tmp/ecp5/$(target)_pnr.log
	grep "Max frequency for clock *" tmp/ecp5/$(target)_pnr.log | tail -1
all: all_hx8k all_ecp5

clean:
	rm -f tmp/*/*.blif
	rm -f tmp/*/*.json
	rm -f tmp/*/*.asc
	rm -f tmp/*/*.bit
	rm -f tmp/*/*.log
	rm -f tmp/*/*.cfg
	rm -f tmp/*/*.svf