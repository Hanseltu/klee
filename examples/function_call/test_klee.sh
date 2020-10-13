#!/bin/bash

rm -rf klee-*

# recompile first
clang -emit-llvm -c call_test.c

# change .bc to readable .ll
llvm-dis call_test.bc

# execute klee
klee call_test.bc
