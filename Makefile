microrv32/rtl/RiscV32Core.v:
	cd microrv32 && sbt "runMain core.microrv32.RiscV32CoreTop"

clean:
	cd microrv32 && make clean
