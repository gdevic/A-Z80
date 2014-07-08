#!/usr/bin/env python
# This script creates directories needed by ModelSim for a particular library
# ModelSim needs these folders to compile library modules in it, but it can't
# create them (!). Run this script to create them instead of having to check
# in empty folders.
#
import os

with open("_info") as f:
    for line in f:
        if line.startswith("v") and not os.path.exists(line[1:].strip()):
            print line[1:].strip()
            os.mkdir(line[1:].strip())
