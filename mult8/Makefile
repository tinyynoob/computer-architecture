verilog = iverilog

.PHONY: run clean

tb_pipe_multiplier: tb_pipe_multiplier.v pipe_multiplier.v
	$(verilog) -o $@ $<

tb_unsigned_multiplier: tb_unsigned_multiplier.v unsigned_multiplier.v
	$(verilog) -o $@ $<



clean:
	-rm tb_unsigned_multiplier
	-rm tb_pipe_multiplier tb_pipe_multiplier.vcd