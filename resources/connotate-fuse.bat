Rem Fuse tests are read from the fuse directory and modified versions
Rem are stored in the same folder, but with the .out extension

python connotate-fuse.py ..\cpu\toplevel\fuse\regress.in
python connotate-fuse.py ..\cpu\toplevel\fuse\regress.expected
python connotate-fuse.py ..\cpu\toplevel\fuse\tests.in
python connotate-fuse.py ..\cpu\toplevel\fuse\tests.expected
