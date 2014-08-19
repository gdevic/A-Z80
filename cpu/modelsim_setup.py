#!/usr/bin/env python
#
# This script sets up the environment to run ModelSim on each module.
#
# (1) ModelSim needs existing project library folders in order to compile
# modules but it can't create them (!). This script creates those directories
# instead of having to check in empty folders.
# (2) Sets up a relative path to your specific directory mapping by creating
# a file "mgc_location_map". We use loction mapping, and all paths to source
# files are relative.
#
import os

def setup():
    # Create a set of library folders
    with open("_info") as f:
        for line in f:
            # When a ModelSim library information file starts with:
            # v : the rest of the line contains a name of a module
            # Y : the rest of the line contains a name of an interface
            if (line.startswith("v") or line.startswith("Y")) and not os.path.exists(line[1:].strip()):
                print line[1:].strip()
                os.mkdir(line[1:].strip())

    # Create mgc_location_map with relative path mapping
    # Assumes this directory hierarchy:
    # $ROOT/<module>/simulation/modelsim/work/<this script>.py
    with open("../mgc_location_map", "w") as f:
        f.write("$ROOT\n")
        path = os.path.abspath("../../../.")
        f.write(os.path.dirname(path))

# Return to our current directory after each module has been visited
abspath = os.path.abspath(__file__)
dname = os.path.dirname(abspath)

# Visit each ModelSim project directory...
os.chdir("alu/simulation/modelsim/work")
setup()
os.chdir(dname)

os.chdir("bus/simulation/modelsim/work")
setup()
os.chdir(dname)

os.chdir("control/simulation/modelsim/work")
setup()
os.chdir(dname)

os.chdir("registers/simulation/modelsim/work")
setup()
os.chdir(dname)

os.chdir("toplevel/simulation/modelsim/work")
setup()
os.chdir(dname)
