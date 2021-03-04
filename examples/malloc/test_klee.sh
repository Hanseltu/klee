#!/bin/bash

rm -rf klee-*

# recompile first
clang-9 -w -emit-llvm -c malloc.c

# change .bc to readable .ll
llvm-dis-9 malloc.bc

# execute klee
#klee --libc=uclibc malloc.bc
klee --write-cvcs malloc.ll
#klee malloc.ll
