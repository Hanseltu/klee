#!/bin/bash

rm -rf klee-*

# recompile first
clang -emit-llvm -c test.c

# change .bc to readable .ll
llvm-dis test.bc

# execute klee
klee test.bc
