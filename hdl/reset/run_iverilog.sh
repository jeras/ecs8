#!/bin/bash

# cleanup first
rm reset.out
rm reset.vcd

# compile verilog sources (testbench and RTL) and run simulation
iverilog -o reset.out reset.v reset_tb.v
vvp reset.out

# open the waveform and detach it
gtkwave reset.vcd reset.sav
