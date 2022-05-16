all: clean compile simulate
clean:
	rm -rf csrc DVEfiles simv.daidir inter.vpd ucli.key
	rm -rf simv
	rm -rf sim.log
	rm -rf *.vcd
compile:
	vcs -f flist -top bus_arbiter -full64 -sverilog -LDFLAGS -Wl,--no-as-needed -debug_access+r -cpp g++-4.8 -cc gcc-4.8
simulate:
	./simv -l sim.log
show:
	gtkwave reg_file.vcd