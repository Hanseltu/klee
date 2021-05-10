#include <stdio.h>

int call_me(int a){
    return call_me(a);
}

int main(int argc, char* argv[]){
    int a = 10;
    int ret = call_me(a);
    printf("ret = %d\n", ret);
    return 0;
}
