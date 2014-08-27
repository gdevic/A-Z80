mkdir out

connotate-fuse.py regress.in
connotate-fuse.py regress.expected
connotate-fuse.py tests.in
connotate-fuse.py tests.expected

cp regress.in.out out/regress.in
cp regress.expected.out out/regress.expected
cp tests.in.out out/tests.in
cp tests.expected.out out/tests.expected
