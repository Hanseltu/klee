#!/bin/bash

rm -rf klee-*

# recompile first
clang-9 -w -emit-llvm -c malloc.c

# change .bc to readable .ll
llvm-dis-9 malloc.bc

# execute klee
#klee malloc.bc 1
../../smu-build/bin/klee --libc=uclibc --posix-runtime malloc.bc
#../../../klee-offical/klee/build-new/bin/klee --libc=uclibc --posix-runtime malloc.bc 
#klee --write-cvcs  malloc.ll --sym-arg 3

#klee malloc.ll
