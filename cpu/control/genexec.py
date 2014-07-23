#!/usr/bin/env python
# This script reads Z80 instruction timing data from a spreadsheet text file
# and generates a Verilog include file defining the control block execution matrix.
#
# Input timing file is exported from the Excel file as a TAB-delimited text file.
#
import string
import sys
import csv

# Input file exported from a timing spreadsheet:
fname = "Instruction timings.csv"

# Helper function to shorten the condition string. This strips all extended
# PLA logic conditions for the purpose of $display-ing a simpler string
def shortCondition(condString):
    end = condString.find("]") + 1
    return condString[0:end]

imatrix = []

# Read the content of a file and using the csv reader remove any quotes from the input fields
content = []
with open(fname, 'rb') as csvFile:
    reader = csv.reader(csvFile, delimiter='\t', quotechar='"')
    for row in reader:
        content.append('\t'.join(row))

# Search for the section that contains the list of control wires
for line in content:
    col = line.split('\t')          # Split the string into a list of columns
    col_clean = filter(None, col)   # Removed all empty fields (between the separators)
    if len(col_clean)==0:           # Ignore completely empty lines
        continue
    if col_clean[0].startswith("#end"):
        imatrix.append("end\n")

    # Print comment lines
    if col_clean[0].startswith('//'):
        imatrix.append(col_clean[0])
    if col_clean[0].startswith('#if'):
        condition = col_clean[1]
        description = col_clean[2]
        imatrix.append("if ({0}) begin".format(condition))
        imatrix.append("    $display(\"{0} {1}\");".format(shortCondition(condition), description))
        
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
            c = col[6].split(';')
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

# Create a file containing the logic matrix code
with open('exec_matrix.i', 'w') as file:
    for item in imatrix:
        file.write("{}\n".format(item))
