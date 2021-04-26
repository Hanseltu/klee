#!/bin/bash

rm -rf klee-*

# recompile first
clang-9 -w -emit-llvm -c malloc.c

# change .bc to readable .ll
llvm-dis-9 malloc.bc

# execute klee
klee --libc=uclibc --posix-runtime malloc.bc --sym-arg 3
#../../../klee-offical/klee/build/bin/klee --libc=uclibc --posix-runtime malloc.bc --sym-arg 3
#klee --write-cvcs  malloc.ll --sym-arg 3

#klee malloc.ll
