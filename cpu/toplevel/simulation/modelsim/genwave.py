#!/usr/bin/env python
#
# This script reads file containing global variables and creates a list of waveform
# definitions to be loaded into ModelSim's Wave window.
#

prefix = '/test_fuse/dut/'

with open('../../globals.i') as f, open('globals.do', 'wt') as f2:
    lines = f.read().splitlines()
    lines = filter(None, lines)

    f2.write("onerror {resume}\n")

    group = "general"
    for line in lines:
        radix = ""
        wire = ""
        if "Module:" in line:
            group = line.split()[2]
        if line.startswith('wire'):
            line = line.rstrip(';')
            tokens = line.split()
            if '[' in tokens[1]:
                radix = "-radix hexadecimal "
                wire = tokens[2]
            else:
                wire = tokens[1]
            f2.write("add wave -noupdate -expand -group " + group + " " + radix + prefix +  wire + "\n")
    f2.write('TreeUpdate [SetDefaultTree]\n')
    f2.write('configure wave -justifyvalue left\n')
    f2.write('configure wave -signalnamewidth 1\n')
    f2.write('configure wave -namecolwidth 180\n')
    f2.write('configure wave -valuecolwidth 40\n')
    f2.write('configure wave -datasetprefix 0\n')
    f2.write('configure wave -rowmargin 4\n')
    f2.write('configure wave -childrowmargin 2\n')
    f2.write('configure wave -timeline 0\n')
    f2.write('configure wave -timelineunits ps\n')
    f2.write('update\n')
    f2.write('WaveRestoreZoom {100 ps} {10000 ps}\n')
