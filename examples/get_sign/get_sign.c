/*
 * First KLEE tutorial: testing a small function
 */
#include <stdio.h>
#include "klee/klee.h"

int get_sign(int x) {
  if (x == 0)
     return 0;

  if (x < 0)
     return -1;
  else
     return 1;
}

int main() {
  int a;
  printf("hello\n");
  klee_make_symbolic(&a, sizeof(a), "a");
  return get_sign(a);
}
