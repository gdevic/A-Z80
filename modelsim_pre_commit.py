#!/usr/bin/env python
#
# This script prepares ModelSim *.mpf files for committing to git
#
# Why is this necessary?
#
# ModelSim notoriously shuffles the list of project files that are stored in its
# configuration file (*.mpf) even if no files were added or removed. That results
# in a version system (git, in this case) to always report mpf files as changed
# and needed to be committed even if there has been no _effective_ change to it.
#
# This script simply sorts the list of project files in a consistent way so
# no change will result in files looking the same way.
#
# Run this script before committing changes to git.
#
import os
import glob

def fixup():
    # Open and read any ModelSim project file (we normally have one per project)
    for file in glob.glob("*.mpf"):
        in_file_section = 0
        # We use the fact that a file property line immediately follows the file name
        current_name = ""
        pf = {}
        with open(file, "r") as f, open(file+".new", "w") as g:
            for line in f:
                if "Project_File_P_" in line:
                    pf[current_name] = line.partition(" = ")[2]
                    in_file_section = 1
                    continue
                if "Project_File_" in line:
                    current_name = line.partition(" = ")[2]
                    in_file_section = 1
                    # When we are already at it, make sure project files are relative to the $ROOT
                    if "$ROOT" not in line:
                        g.write("; Warning: Path {0} is not relative to the $ROOT!\n".format(current_name.strip()))
                    continue
                # We are not in the file section any more since we are here
                if in_file_section:
                    # Flush out our file list in a predictable order
                    i = 0
                    for k,v in sorted(pf.items()):
                        g.write("Project_File_{0} = {1}".format(i, k))
                        g.write("Project_File_P_{0} = {1}".format(i, v))
                        i = i + 1
                    in_file_section = 0
                g.write(line)
        # Lastly, replace old mpf file with the new one
        os.remove(file)
        os.rename(file+".new", file)

# Return to our current directory after each module has been visited
abspath = os.path.abspath(__file__)
dname = os.path.dirname(abspath)

# Visit each ModelSim project directory...
os.chdir("cpu/alu/simulation/modelsim")
fixup()
os.chdir(dname)

os.chdir("cpu/bus/simulation/modelsim")
fixup()
os.chdir(dname)

os.chdir("cpu/control/simulation/modelsim")
fixup()
os.chdir(dname)

os.chdir("cpu/registers/simulation/modelsim")
fixup()
os.chdir(dname)

os.chdir("cpu/toplevel/simulation/modelsim")
fixup()
os.chdir(dname)

os.chdir("host/toplevel/simulation/modelsim")
fixup()
os.chdir(dname)

os.chdir("host/uart/simulation/modelsim")
fixup()
os.chdir(dname)
