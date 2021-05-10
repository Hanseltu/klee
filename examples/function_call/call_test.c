/*
 * First KLEE tutorial: testing a small function
 */
#include <stdio.h>
#include "klee/klee.h"

//1 path function
int func1(int a){
    char s = 'c';
    int b =1111, c=2222;
    long long d=3333;
    d = 4444;
    //d = func2(b, c);
    if (a > 0){
        d = 6666;
        int e = d;
        int f;
        return a + b + c + d;
    }
    return a;
}

// 2 pathes function
int func2(int a, int b){
    //int local_a, local_b = 0;
    //int var_a = func1(a);
    //int var_b = func3(b);
    //int temp = func4(a,b);
    //if (var_a > var_b)
    //    return 1;
    return a+b;
}

// 3 pathes function
int func3(int x) {
  if (x == 0)
     return 0;

  if (x < 0)
     return -1;
  else
     return 1;
}

// 4 pathes function
int func4(int a, int b){
    if (a > 0) return 1;
    if (a < 0){
        if (b > 0) return 2;
        else return 3;
    }
    return 4;
}


int main() {
  int a;
  //printf("hello\n");
  klee_make_symbolic(&a, sizeof(a), "a");
  //klee_make_symbolic(&b, sizeof(a), "b");
  //klee_make_symbolic(&c, sizeof(a), "c");
  //klee_make_symbolic(&d, sizeof(a), "d");
  //klee_make_symbolic(&e, sizeof(a), "e");
  //klee_make_symbolic(&f, sizeof(a), "f");
  //klee_make_symbolic(&g, sizeof(a), "g");

  int ret1 = func1(a);
  //int ret2 = func2(b, c);
  //int ret3 = func3(d);
  //int ret4 = func4(f, g);
  klee_print_expr("test:", a);
  return 0;
}
