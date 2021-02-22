#!/bin/bash

rm -rf klee-*

# recompile first
clang-9 -emit-llvm -c case.c

# change .bc to readable .ll
llvm-dis-9 case.bc

# execute klee
#klee --libc=uclibc malloc.bc
klee --write-cvcs case.bc
