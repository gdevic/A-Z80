#!/usr/bin/env python3
#
# This script reads the exec_matrix.vh file and generates a compiled version
# with each control wire written as sum of products.
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
from tokenize import NAME, INDENT, DEDENT

def str2tok(s):
    t = io.BytesIO(bytes(s.encode()))
    return list(tokenize.tokenize(t.readline))[1:-1]

#--------------------------------------------------------------------------------
# Build a sum-of-products form
#--------------------------------------------------------------------------------
def sum_of_products(f, tokens):
    incond = False              # Inside an "if" condition state
    cond = []                   # Condition nested lists
    ccond = []                  # Currently scanned condition list
    ctls = {}                   # List of control wires and their expressions

    def is_ctl(name):
        return name.startswith('ctl_') or name=='validPLA' or name=='nextM' or name=='setM1' \
            or name=='fFetch' or name=='fMRead' or name=='fMWrite' or name=='fIORead' or name=='fIOWrite' \
            or name=='ixy_d' or name=='setIXIY' or name=='setCBED' or name=='nonRep' or name=='pc_inc'

        name.startswith('fM') or name.startswith('valid') or name.startswith('set') \
            or name.startswith('nextM') or name.startswith('ixy') or name.startswith('pc_inc') or name.startswith('nonRep')

    for i in range(0, len(tokens)):
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
            if tokval=='end': # Pop a condition list
                cond.pop()
            if is_ctl(tokval) and not incond:
                if tokval in ctls:
                    ctls[tokval].append(copy.deepcopy(list(str2tok('|'))))
                    ctls[tokval].extend(copy.deepcopy(cond))
                else:
                    ctls[tokval] = copy.deepcopy(cond)

    for name in ctls:
        line = name + " = "
        conditions = ctls[name]
        n = len(conditions)
        for i in range(n):
            cond = conditions[i]
            line += tokenize.untokenize(cond).strip()
            if i==n-1:
                line = line.replace(')(', ')&(')
                #print ('{0};'.format(line))
                f.write ('{0};\n'.format(line))

#--------------------------------------------------------------------------------
tokens = []
#--------------------------------------------------------------------------------
# Input file that we are processing
with open("exec_matrix.vh") as f:
    lines = f.readlines()

for line in lines:
    src = bytes(line.encode())
    src = io.BytesIO(src)
    tokens.extend(list(tokenize.tokenize(src.readline)))

with open('exec_matrix_compiled.vh', 'w') as f:
    sum_of_products(f, tokens)

# Touch a file that includes 'exec_matrix_compiled.vh' to ensure it will recompile correctly
os.utime("execute.v", None)
