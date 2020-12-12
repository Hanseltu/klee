#!/bin/bash

rm -rf klee-*

# recompile first
clang -emit-llvm -c example.c

# change .bc to readable .ll
llvm-dis example.bc

# execute klee
klee --libc=uclibc example.bc
