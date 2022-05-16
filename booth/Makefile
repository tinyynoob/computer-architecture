verilog = iverilog

.PHONY: run clean

tb_booth: tb_booth.v booth.v
	$(verilog) -o $@ $<


clean:
	-rm tb_booth tb_booth.vcd