# in oscar-2020
#cmake -DENABLE_SOLVER_STP=ON -DENABLE_POSIX_RUNTIME=ON -DKLEE_UCLIBC_PATH=/home/github/uclibc -DLLVM_CONFIG_BINARY=/home/tuhaoxin/compilers/llvm/llvm-9.0/llvm-src/build/bin/llvm-config -DLLVMCC=/home/tuhaoxin/compilers/llvm/llvm-9.0/llvm-src/build/bin/clang -DLLVMCXX=/home/tuhaoxin/compilers/llvm/llvm-9.0/llvm-src/build/bin/clang++ -DCMAKE_BUILD_TYPE=Debug ..

# in ubuntu 16.04
#cmake -DENABLE_SOLVER_STP=ON -DENABLE_POSIX_RUNTIME=ON -DENABLE_KLEE_UCLIBC=ON -DKLEE_UCLIBC_PATH=/home/haoxin/symbolic-execution/uclibc \
#    -DLLVM_CONFIG_BINARY=/home/haoxin/corpus-compilers/llvm-9.0/llvm-src/build/bin/llvm-config \
#    -DLLVMCC=/home/haoxin/corpus-compilers/llvm-9.0/llvm-src/build/bin/clang \
#    -DLLVMCXX=/home/haoxin/corpus-compilers/llvm-9.0/llvm-src/build/bin/clang++ \
#    -DCMAKE_C_COMPILER=/home/haoxin/corpus-compilers/llvm-9.0/llvm-src/build/bin/clang  -DCMAKE_CXX_COMPILER=/home/haoxin/corpus-compilers/llvm-9.0/llvm-src/build/bin/clang++ -DCMAKE_BUILD_TYPE=Debug ..

make -j4
sudo make install
