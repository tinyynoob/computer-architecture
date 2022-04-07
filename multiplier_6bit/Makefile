verilog = iverilog

multiplier_6bit.vcd: multiplier_6bit
	vvp multiplier_6bit

multiplier_6bit: multiplier_6bit.v tb_multiplier_6bit.v
	$(verilog) -o $@ $^

clean:
	rm -r multiplier_6bit.vcd multiplier_6bit