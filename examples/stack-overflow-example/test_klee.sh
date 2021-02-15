#!/bin/bash

rm -rf klee-*

# recompile first
clang-9 -emit-llvm -c example.c

# change .bc to readable .ll
llvm-dis-9 example.bc

# execute klee
klee --libc=uclibc example.bc
