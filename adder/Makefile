verilog = iverilog

CLA.vcd: CLA
	vvp CLA

CLA: CLA.v CLA_32bit.v t_CLA_32bit.v
	$(verilog) -o $@ $^

clean:
	rm -r CLA.vcd CLA


