#!/bin/bash

rm -rf klee-*

# recompile first
clang -emit-llvm -c sort.c

# change .bc to readable .ll
llvm-dis sort.bc

# execute klee
klee sort.bc
