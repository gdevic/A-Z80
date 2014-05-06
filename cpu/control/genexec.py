#!/usr/bin/env python
# This script reads Z80 instruction timing data from a spreadsheet text file
# and generates a set of Verilog include files for control block.
#
# Before exporting the spreadsheet, search for "Region and Language" Windows 7 applet,
# Customize format and select "|" as the List separator. This is our separator character.
#
import string
import sys
import re

# Input file exported from a timing spreadsheet:
fname = "Instruction timings.csv"

ctl = {}
imodule = []
izero = []
imatrix = []
in_defs = False     # States that we are inside the control wire definition section

# Read the content of a file, all at once
with open(fname) as f:
    content = f.read().splitlines()

# Search for the section that contains the list of control wires
for line in content:
    # We have this unfortunate case of | being in our automated dump and causing
    # Excel to export it enclosed with "  Remove it and delete | that it contains.
    match = re.match("^\"([\s\S]*)\"([\s\S]*)", line, re.M|re.I)
    if match:
        line = "{0}{1}".format(match.group(1).replace("|", ""), match.group(2))
    col = line.split('|')           # Split the string into a list of columns
    col_clean = filter(None, col)   # Removed all empty fields (between the separators |)
    if len(col_clean)==0:           # Ignore completely empty lines
        continue
    # A small state machine tracking where we are during a single pass over the list
    if col_clean[0].startswith("#Control"):     # Start of the control section
        in_defs = True
    if col_clean[0].startswith("#!Control"):    # End of the control section
        in_defs = False
    if col_clean[0].startswith("#end"):
        imatrix.append("end\n")

    # We are in the module argument section
    if in_defs:
        # Print comment lines
        if col_clean[0].startswith('//'):
            imodule.append(col_clean[0])
            izero.append(col_clean[0])
        if len(col_clean)==3:
            # Check that the control wire name is not a duplicate
            if ctl.has_key(col_clean[0]):
                sys.exit("Duplicate control wire name " + col_clean[0])
            # Store the control wire and its width to a map
            ctl[col_clean[0]] = col_clean[1]
            # Print the control wire to the module argument section
            name = "{0:<24}".format(col_clean[0] + ',')
            imodule.append("output reg {0}// {1}".format(name, col_clean[2]))
            # Print the control wire to the wire initialization section
            name = "{0:<20}".format(col_clean[0])
            izero.append("{0} = {1}'h0;        // Reset {2}".format(name, col_clean[1], col_clean[2]))
    else:
        # We are in the logic matrix section
        # Print comment lines
        if col_clean[0].startswith('//'):
            imatrix.append(col_clean[0])
        if col_clean[0].startswith('#if'):
            condition = col_clean[1]
            description = col_clean[2]
            imatrix.append("if ({0}) begin".format(condition))
            imatrix.append("    $display(\"{0} {1}\");".format(condition, description))
            # Reset the M and T cycle counters
            M = 1
            T = 1

    # We are in a PLA wire logic description, but consider only lines starting with timing
    # In this section the exact column matters, so we use col instead of col_clean
    if len(col)>=3 and len(col[0])>20 and col[0][0]=='#' and col[0][1]=='0':
        #==================================================================
        # Print the basic timing condition for this set of control signals
        #==================================================================
        state = "    if (M{0} && T{1}) begin ".format(M, T)

        #==================================================================
        # Column F (index 5) is the IO block control wire
        #==================================================================
        if col[5]!='':
            state += "{0:<12}".format(col[5] + '=1;')
        else:
            state += "            "

        #==================================================================
        # Column G (index 6) is one or more state control wires (nextM and setM1)
        #==================================================================
        if col[6]!='':
            c = col[6].split(',')
            for c2 in c:
                state += "{0:<9}".format(c2 + '=1;')
        else:
            state += "         "
        imatrix.append(state + ' end')

        #==================================================================
        # Increment the state according to control signals
        # Yes, a bit hardcoded but it works
        #==================================================================
        T = T + 1
        if "nextM" in col[6]:
            M = M + 1
            T = 1
    # End of the PLA logic matrix

# Create a module arguments section file and print out the argument lines
with open('exec_module.i', 'w') as file:
    for item in imodule:
        file.write("{}\n".format(item))

# Create a file containing the code to set wires to 0
with open('exec_zero.i', 'w') as file:
    for item in izero:
        file.write("{}\n".format(item))

# Create a file containing all logic matrix code
with open('exec_matrix.i', 'w') as file:
    for item in imatrix:
        file.write("{}\n".format(item))
