verilog = iverilog

.PHONY: run clean

tb_unsigned_multiplier: tb_unsigned_multiplier.v unsigned_multiplier.v
	$(verilog) -o $@ $<

run: tb_unsigned_multiplier
	./$<

clean:
	-rm tb_unsigned_multiplier