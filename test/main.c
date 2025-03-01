#include <stdio.h>
#include "s_string.h"

extern int s_strlen(const char *str);

int main() {
    char *test = "Hello, world!";
    printf("Longueur : %d\n", s_strlen(test));
    return 0;
}
