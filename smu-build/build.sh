cmake -DENABLE_SOLVER_STP=ON -DENABLE_POSIX_RUNTIME=ON -DENABLE_KLEE_UCLIBC=ON -DKLEE_UCLIBC_PATH=/home/haoxin/haoxin-data/smu-research/klee-uclibc -DLLVM_CONFIG_BINARY=/home/haoxin/haoxin-data/dut-research/compilers/llvm-9.0/llvm-src/build/bin/llvm-config -DLLVMCC=/home/haoxin/haoxin-data/dut-research/compilers/llvm-9.0/llvm-src/build/bin/clang -DLLVMCXX=/home/haoxin/haoxin-data/dut-research/compilers/llvm-9.0/llvm-src/build/bin/clang++ -DCMAKE_BUILD_TYPE=Debug -DCMAKE_C_COMPILER=clang-9 -DCMAKE_CXX_COMPILER=clang++-9 ..

make -j10 

sudo make install
