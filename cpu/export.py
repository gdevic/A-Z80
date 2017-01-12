#!/usr/bin/env python3
#
# This script exports all core A-Z80 Verilog files to a destination folder of your choice.
# Add all Verilog files (*.v) to your project and ensure that Verilog include files (*.vh)
# are on the include path.
#
#-------------------------------------------------------------------------------
#  Copyright (C) 2014,2017  Goran Devic, www.baltazarstudios.com
#
#  This program is free software; you can redistribute it and/or modify it
#  under the terms of the GNU General Public License as published by the Free
#  Software Foundation; either version 2 of the License, or (at your option)
#  any later version.
#
#  This program is distributed in the hope that it will be useful, but WITHOUT
#  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
#  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
#  more details.
#-------------------------------------------------------------------------------
import sys
import os
from shutil import copyfile

if len(sys.argv) != 2:
    print ("\nUsage: export.py <destination-folder>\n")
    print ("Copies all core A-Z80 Verilog files to a destination folder of your choice.")
    exit(-1)

dest = sys.argv[1]
total = 0

if not os.path.exists(dest):
    print ("ERROR: Destination folder does not exist!")
    exit(-1)

if not os.path.isdir(dest):
    print ("ERROR: Destination is not a directory!")
    exit(-1)

with open('top-level-files.txt') as f:
    files = f.read().splitlines()

with open('copyleft.txt') as f:
    copyleft = f.read()

# Read and copy each file from the list of input files
for infile in files:
    if infile.startswith('+'):
        infile = infile[2:]
    if infile.startswith('Files='):
        files = int(infile[6:])
        if total != files:
            print ("ERROR: Incorrect number of files copied!")
            exit(-1)
        else:
            print ("\nDone copying {0} files.\n".format(files))
    if not os.path.isfile(infile):
        continue
    name = os.path.basename(infile)
    print ('Copying', infile)
    with open(dest + '/' + name, 'wt') as f:
        f.write(copyleft)
        with open(infile) as g:
            f.write(g.read())
    total += 1

print ("All necessary A-Z80 CPU files are copied to", dest)
print ("Add all Verilog files (*.v) to your project and ensure that Verilog include")
print ("files (*.vh) are on the include path.\n")
print ("Use z80_top_direct_n.v as your top-level interface file.\n")
print ("Note for the users of Lattice FPGA toolset: instead of data_pins.v, manually")
print ("copy and use data_pins_lattice.v file instead.")
