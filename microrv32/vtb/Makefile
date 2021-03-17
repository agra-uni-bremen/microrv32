top_sim:
	iverilog -g2005 -t vvp -Wall -s MicroRV32Top_TB -o sim/tb.vvp -I rtl rtl/MicroRV32Top_TB.v  
	vvp -l sim/tb.log sim/tb.vvp
top_synth:
	yosys -d -s synth/top.ys -l synth/synth_top.log
	nextpnr-ice40 -l synth/pnr_top.log --hx8k --package ct256 --json synth/top.json --pcf synth/pins.pcf --asc synth/top.asc
	icepack -v synth/top.asc synth/top.bit
clean:
	rm -f sim/*.log
	rm -f sim/*.vvp
	rm -f sim/*.vcd
	rm -f synth/*.blif
	rm -f synth/*.json
	rm -f synth/*.asc
	rm -f synth/*.bit
	rm -f synth/*.log