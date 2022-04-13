verilog = iverilog

test:
	$(verilog) tb_serial_adder4.v -o serial_adder4
	vvp serial_adder4

clean:
	rm serial_adder4 serial_adder4.vcd