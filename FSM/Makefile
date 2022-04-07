verilog = iverilog

FSM_lab.vcd: FSM_lab
	vvp FSM_lab

FSM_lab: FSM_lab.v tb_FSM_lab.v
	$(verilog) -o $@ $^

clean:
	rm -r FSM_lab FSM_lab.vcd