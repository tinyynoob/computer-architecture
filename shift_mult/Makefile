verilog = iverilog


test: sm
	vvp sm

sm: tb_shift_multiplier.v shift_multiplier.v
	$(verilog) -o $@ tb_shift_multiplier.v

clean:
	-rm sm sm.vcd