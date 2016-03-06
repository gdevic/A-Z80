#!/usr/bin/env python3
#
# This script reads 'exec_matrix.vh' file and compiles it into an alternate format
# that can be used with Xilinx toolchain.
#
# Xilinx synthesis tool is effectively not capable of processing that file.
# Altera Quartus has no problems compiling it.
#
#-------------------------------------------------------------------------------
#  Copyright (C) 2016  Goran Devic
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
import os
import io
import copy
import tokenize
from io import BytesIO
from tokenize import NAME, INDENT, DEDENT, ENCODING

# Input file to process
fname = "exec_matrix.vh"

# Output file to contain compiled version of the input
oname = "exec_matrix_compiled.vh"

# Output file to contain a list of temporary wires used by the compiled Verilog file
tname = "temp_wires.vh"

# Define a list of control signals that are 2-bits wide
ctls_wide = ['ctl_reg_gp_sel', 'ctl_reg_gp_hilo', 'ctl_reg_sys_hilo', 'ctl_pf_sel']

# Help recognizing control signal names
def is_ctl(name):
    return name.startswith('ctl_') or name=='validPLA' or name=='nextM' or name=='setM1' \
        or name=='fFetch' or name=='fMRead' or name=='fMWrite' or name=='fIORead' or name=='fIOWrite' \
        or name=='ixy_d' or name=='setIXIY' or name=='setCBED' or name=='nonRep' or name=='pc_inc_hold'

def str2tok(s):
    t = io.BytesIO(bytes(s.encode()))
    return list(tokenize.tokenize(t.readline))[1:-1]

def tok2str(tokens):
    line = [ tokens[n][m].string for n in range(len(tokens)) for m in range(len(tokens[n])) ]
    return ''.join(line)

def get_rval(tokens, i):
    assert (tokens[i+1].string=='=' or tokens[i+1].string=='|=')
    paren = list(str2tok('()'))
    rval = paren[:1]
    while (tokens[i+2].string!=';'):
        rval.append(tokens[i+2])
        i += 1
    rval.extend(paren[1:2])
    return [rval]

def decomment(s):
    i = s.find('//') # Remove trailing comments from a line
    if i>=0:
        return s[:i]
    i = s.find('/*') # Remove comments within a line
    j = s.find('*/')
    if i>=0 and j>=0:
        return decomment(s[:i] + s[j+2:])
    return s

#--------------------------------------------------------------------------------
# Generate a sequential-or form for all control wires
#--------------------------------------------------------------------------------
def sequential_or(f, t, tokens):
    incond = False              # Inside an "if" condition state
    cond = []                   # Condition nested lists
    ccond = []                  # Currently scanned condition list
    ctls = {}                   # Dictionary of control wires and their equations
    ccwires = []                # List of wires at the current condition list level
    i = 0                       # Current index into the tokens list
    while i < len(tokens):
        tok = tokens[i]
        (toknum, tokval, _, _, _) = tok
        if incond and not (toknum==NAME and tokval=='begin'):
            if toknum != DEDENT and toknum != INDENT:
                ccond.append(tok)
        if toknum==NAME:
            if tokval=='if':
                incond = True
            if tokval=='begin': # Push a condition list
                incond = False
                cond.append(copy.deepcopy(ccond))
                ccond.clear()
                ccwires.clear()
            if tokval=='end': # Pop a condition list
                cond.pop()
            if is_ctl(tokval) and not incond:
                rval = get_rval(tokens, i)
                linesub = tok2str(cond)
                rhs = tok2str(rval)
                line = "{0} = {0} | ".format(tokval)
                if tokval in ccwires: # Check for duplicate assignments
                    hint = [ cond[n][m].string for n in range(len(cond)) for m in range(len(cond[n])) ]
                    print ("WARNING: {0}: Multiple assignment of {1}".format(''.join(hint), tokval))
                ccwires.append(tokval) # Track this wire as assigned at this condition level
                if tokval in ctls_wide:
                    tr = linesub.translate(str.maketrans(dict.fromkeys('~','n'))) # Make temporary name
                    tmpname = "{0}_{1}_{2}".format(tokval, tr.translate(str.maketrans(dict.fromkeys('[]()&',None))), len(ccwires))
                    t.write("reg {0};\n".format(tmpname))
                    line = "{0} = {1};\n".format(tmpname, linesub) + line
                    line += "({{{0},{0}}}){1}".format(tmpname, rhs)
                else:
                    line += linesub + rhs
                line = line.replace(')(', ')&(')
                line = line.replace('&&', '&')
                line = line.replace('(1)&', '')
                line = line.replace('&(1)', '')
                i += len(rval[0])
                f.write ('{0};\n'.format(line))
        i += 1

#--------------------------------------------------------------------------------
tokens = []
# Input file which we are processing
with open(fname) as f:
    lines = f.readlines()

for line in lines:
    src = decomment(line)
    src = bytes(src.encode())
    src = io.BytesIO(src)
    toklist = list(tokenize.tokenize(src.readline))
    tokens.extend(toklist)

with open(oname, 'w') as f:
    with open(tname, 'w') as t:
        f.write("// Automatically generated by gencompile.py\n\n")
        t.write("// Automatically generated by gencompile.py\n\n")
        sequential_or(f, t, tokens)

# Touch a file that includes 'exec_matrix_compiled.vh' to ensure it will recompile correctly
os.utime("execute.v", None)
