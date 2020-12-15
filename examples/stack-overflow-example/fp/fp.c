#include <stdio.h>
#include <string.h>

void bof(char *bof) {
    char buf[10];
    strcpy(buf, bof);
    printf("buf = %s\n", buf);
}

int main(int argc, char* argv[]) {
    char buf[20] = "I love SMU!";
    bof(buf);
    return 0;
}
