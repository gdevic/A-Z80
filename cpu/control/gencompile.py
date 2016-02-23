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
from tokenize import NAME, INDENT, DEDENT, ENCODING

# Define a list of control signals which we don't convert into the sums-of-products format
ctls_ignored = ['ctl_reg_gp_sel', 'ctl_reg_gp_hilo', 'ctl_reg_sys_hilo', 'ctl_flags_cf2_sel']

# Define control signal names that are to be converted into the sums-of-products format
def is_ctl(name):
    return name.startswith('ctl_') or name=='validPLA' or name=='nextM' or name=='setM1' \
        or name=='fFetch' or name=='fMRead' or name=='fMWrite' or name=='fIORead' or name=='fIOWrite' \
        or name=='ixy_d' or name=='setIXIY' or name=='setCBED' or name=='nonRep' or name=='pc_inc'

def str2tok(s):
    t = io.BytesIO(bytes(s.encode()))
    return list(tokenize.tokenize(t.readline))[1:-1]

def get_rval(tokens, i):
    assert (tokens[i+1].string=='=')
    paren = list(str2tok('()'))
    rval = paren[:1]
    while (tokens[i+2].string!=';'):
        rval.append(tokens[i+2])
        i += 1
    rval.extend(paren[1:2])
    return [rval]

#--------------------------------------------------------------------------------
# Generate a sequential-or form for all control wires
#--------------------------------------------------------------------------------
def sequential_or(f, tokens):
    incond = False              # Inside an "if" condition state
    cond = []                   # Condition nested lists
    ccond = []                  # Currently scanned condition list
    ctls = {}                   # Dictionary of control wires and their equations
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
            if tokval=='end': # Pop a condition list
                cond.pop()
            if is_ctl(tokval) and not incond:
                if tokval in ctls_ignored:
                    while (tokens[i].string!=';'):
                        i += 1
                    continue
                rval = get_rval(tokens, i)
                i += len(rval[0])
                line = "{0} = {0} | ".format(tokval)
                for n in range(len(cond)):
                    for m in range(len(cond[n])):
                        line += cond[n][m].string
                    line += '&'
                for n in range(len(rval[0])):
                    line += rval[0][n].string

                line = line.replace('&&', '&')
                line = line.replace('(1)&', '')
                line = line.replace('&(1)', '')

                f.write ('{0};\n'.format(line))
        i += 1

#--------------------------------------------------------------------------------
# Build a sum-of-products form
#--------------------------------------------------------------------------------
def sum_of_products(f, tokens):
    incond = False              # Inside an "if" condition state
    cond = []                   # Condition nested lists
    ccond = []                  # Currently scanned condition list
    ctls = {}                   # Dictionary of control wires and their equations
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
            if tokval=='end': # Pop a condition list
                cond.pop()
            if is_ctl(tokval) and not incond:
                if tokval in ctls_ignored:
                    while (tokens[i].string!=';'):
                        i += 1
                    continue
                rval = get_rval(tokens, i)
                i += len(rval[0])
                if tokval in ctls:
                    ctls[tokval].append(copy.deepcopy(list(str2tok('|'))))
                    ctls[tokval].extend(copy.deepcopy(cond))
                else:
                    ctls[tokval] = copy.deepcopy(cond)
                ctls[tokval].extend(copy.deepcopy(rval))
        i += 1

    for name in sorted(ctls):
        line = name + " = "
        conditions = ctls[name]
        n = len(conditions)
        for i in range(n):
            cond = conditions[i]
            for t in cond:
                line += t.string
            if i==n-1:
                line = line.replace('(1)', '')
                line = line.replace(')(', ')&(')
                #print ('{0};'.format(line))
                f.write ('{0};\n'.format(line))

#--------------------------------------------------------------------------------
# Write out the original nested-if format using only ignored control signals
#--------------------------------------------------------------------------------
def write_nested_if(f, toklines):
    for tokline in toklines:
        i = 0                   # Current index into the tokens list
        enabled = True
        while i < len(tokline):
            (toknum, tokval, _, _, _) = tokline[i]
            if tokval=='begin':
                enabled = True
            if tokval=='if':
                enabled = False
            if enabled and toknum==NAME and is_ctl(tokval):
                while tokline[i].string!=';':
                    if tokval in ctls_ignored:
                        i += 1
                    else:
                        del tokline[i]
            i += 1

        line = tokenize.untokenize(tokline).decode('utf-8')
        #print (line, end='')
        f.write ('{0}'.format(line))

#--------------------------------------------------------------------------------
tokens = []
toklines = []
#--------------------------------------------------------------------------------
# Input file that we are processing
with open("exec_matrix.vh") as f:
    lines = f.readlines()

for line in lines:
    src = bytes(line.encode())
    src = io.BytesIO(src)
    toklist = list(tokenize.tokenize(src.readline))
    tokens.extend(toklist)
    toklines.append(toklist)

with open('exec_matrix_compiled.vh', 'w') as f:
    sequential_or(f, tokens)
    write_nested_if(f, toklines)
    #sum_of_products(f, tokens)

# Touch a file that includes 'exec_matrix_compiled.vh' to ensure it will recompile correctly
os.utime("execute.v", None)
