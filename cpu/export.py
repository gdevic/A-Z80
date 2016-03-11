#!/usr/bin/env python3
#
# This script exports all core A-Z80 Verilog files to a destination of your choice.
# The files copied are necessary and sufficient to include with your custom project.
#
#-------------------------------------------------------------------------------
#  Copyright (C) 2014, 2016  Goran Devic, www.baltazarstudios.com
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
    print ("Copies all core A-Z80 Verilog files to a destination of your choice.")
    print ("The files copied are necessary and sufficient to include with your project.")
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
            print ("\nDone copying {0} files.".format(files))
    if not os.path.isfile(infile):
        continue
    name = os.path.basename(infile)
    print ('Copying', infile)
    with open(dest + '/' + name, 'wt') as f:
        f.write(copyleft)
        with open(infile) as g:
            f.write(g.read())
    total += 1
