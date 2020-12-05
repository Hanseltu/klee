/*
 * First KLEE tutorial: testing a small function
 */
#include <stdio.h>
#include "klee/klee.h"

int func1(int a1){
    return a1;
}

int func2(int a2, int b2){
    if (a2 >= b2)
        return 0;
    return 1;
}

int func3(int a3) {
  int ret1 = func1(a3);
  int ret2 = func2(0,a3);
  if (a3 == 0)
     return 0;
  if (a3 < 0)
     return ret1;
  else
     return ret2;
}


int main() {
  int a;
  klee_make_symbolic(&a, sizeof(a), "a");
  int ret = func3(a);
  return ret;
}
