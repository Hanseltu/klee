#!/bin/bash

rm -rf klee-*

# execute klee
#klee --libc=uclibc malloc.bc
/home/haoxin/haoxin-data/smu-research/klee/smu-build/bin/klee -link-llvm-lib=/home/haoxin/haoxin-data/smu-research/cgc/cgc-env-64/cb-multios/build64/include/libcgc.so.bc --write-cvcs \
-link-llvm-lib=/home/haoxin/haoxin-data/smu-research/cgc/cgc-env-64/cb-multios/build64/include/tiny-AES128-C/libtiny-AES128-C.so.bc \
--libc=uclibc --posix-runtime 3D_Image_Toolkit.bc
#klee malloc.ll
