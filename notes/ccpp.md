## GCC Flags
```bash
-g                Produce debugging information
-MMD              Get the name of header dependencies
-MP               Add a phony target for each dependency other than the main file
-Wfatal-errors    Abort on first error
-Wall             Enables all the warnings about constructions that some users consider questionable
-Wextra           Some extra warnings not enabled by -Wall
-lrt              Link library rt
-l libX.a         Search the library libX when linking
```
## Coverage
```bash
gcc main.c --lcoverage
lcov --capture --directory . --output-file coverage.info
genhtml coverage.info -o coverage/
firefox coverage/index.html
```
## GCC Verbose output
```gcc main.c -wrapper echo```
## Expand include files
```echo '#include<stdlib.h>' | cpp -I/usr/include > stdlibexpanded.c```
## Compiling a lib
```ar rcs```
## Viewing System / Lib Calls
```bash
strace ./app    # trace system calls and signals
ltrace ./app    # trace library calls
```
## Generate dotfiles
```bash
# Do not assemble, output assembler code file
g++ -S -fdump-tree-all-graph main.cpp -o main.as
# Dot is provided by the graphviz package
dot -T pdf main.cpp.165t.optimized.dot > out.pdf
```