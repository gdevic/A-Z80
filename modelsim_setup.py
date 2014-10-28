#!/usr/bin/env python
#
# This script sets up the environment to run ModelSim on each module.
#
# It sets up a relative path to your specific directory mapping by creating
# a file "mgc_location_map". We use loction mapping, and all paths to source
# files are relative.
#
import os

def setup():
    # Create mgc_location_map with relative path mapping
    # Assumes this directory hierarchy:
    # $ROOT/<block>/<module>/simulation/modelsim/work/<this script>.py
    with open("mgc_location_map", "w") as f:
        f.write("$ROOT\n")
        path = os.path.abspath("../../../.")
        f.write(os.path.dirname(path))

# Return to our current directory after each module has been visited
abspath = os.path.abspath(__file__)
dname = os.path.dirname(abspath)

# Visit each ModelSim project directory...
os.chdir("cpu/alu/simulation/modelsim")
setup()
os.chdir(dname)

os.chdir("cpu/bus/simulation/modelsim")
setup()
os.chdir(dname)

os.chdir("cpu/control/simulation/modelsim")
setup()
os.chdir(dname)

os.chdir("cpu/registers/simulation/modelsim")
setup()
os.chdir(dname)

os.chdir("cpu/toplevel/simulation/modelsim")
setup()
os.chdir(dname)

os.chdir("host/basic/simulation/modelsim")
setup()
os.chdir(dname)

os.chdir("host/basic/uart/modelsim")
setup()
os.chdir(dname)
