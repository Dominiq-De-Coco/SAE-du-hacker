#include <stdio.h>

extern int s_strlen(const char *str);
extern char* s_strcpy(char *dest, const char *src);
extern int s_strncmp(const char *str1, const char *str2, int n);
extern int s_abs(int x);
extern int s_pow(int base, int exp);
extern void s_puts(const char *str);

int main() {
    char source[] = "Hello, World!";
    char dest[50];

    // Tests pour s_string.s
    printf("Longueur de '%s' : %d\n", source, s_strlen(source));
    s_strcpy(dest, source);
    printf("Copie de '%s' : '%s'\n", source, dest);
    if (s_strncmp(source, dest, 5) == 0)
        printf("Les 5 premiers caractères sont égaux.\n");
    else
        printf("Les 5 premiers caractères sont différents.\n");

    // Tests pour s_math.s
    printf("Valeur absolue de -42 : %d\n", s_abs(-42));
    printf("2 puissance 4 : %d\n", s_pow(2, 4));

    // Tests pour s_stdio.s
    s_puts("Test de s_puts: Hello, World!");

    return 0;
}

