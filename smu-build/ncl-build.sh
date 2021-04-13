cmake -DENABLE_SOLVER_STP=ON -DENABLE_POSIX_RUNTIME=ON -DENABLE_KLEE_UCLIBC=ON -DKLEE_UCLIBC_PATH=/users/htu42656/smu-research/klee-uclibc -DLLVM_CONFIG_BINARY=/users/htu42656/compilers/llvm-9.0/llvm-src/build/bin/llvm-config -DLLVMCC=/users/htu42656/compilers/llvm-9.0/llvm-src/build/bin/clang -DLLVMCXX=/users/htu42656/compilers/llvm-9.0/llvm-src/build/bin/clang++ -DCMAKE_BUILD_TYPE=Debug -DCMAKE_C_COMPILER=clang-9 -DCMAKE_CXX_COMPILER=clang++-9 ..

make -j24


