#include <stdio.h>

// Fonctions de s_string.s
extern int s_strlen(const char *str);
extern char* s_strcpy(char *dest, const char *src);
extern int s_strncmp(const char *str1, const char *str2, int n);

// Fonctions de s_math.s
extern int s_abs(int x);
extern int s_pow(int base, int exp);

// Fonctions de s_stdio.s
extern void s_puts(const char *str);

// Fonctions de s_stdlib.s
extern int s_atoi(const char *str);

int main() {
    char source[] = "Hello, World!";
    char dest[50];

    // --- Tests pour s_string.s ---
    printf("\n--- Tests s_string.s ---\n");
    printf("Longueur de '%s' : %d\n", source, s_strlen(source));
    s_strcpy(dest, source);
    printf("Copie de '%s' : '%s'\n", source, dest);
    if (s_strncmp(source, dest, 5) == 0)
        printf("Les 5 premiers caractères sont égaux.\n");
    else
        printf("Les 5 premiers caractères sont différents.\n");

    // --- Tests pour s_math.s ---
    printf("\n--- Tests s_math.s ---\n");
    printf("Valeur absolue de -42 : %d\n", s_abs(-42));
    printf("2 puissance 4 : %d\n", s_pow(2, 4));
    printf("Valeur absolue de INT_MIN : %d\n", s_abs(-2147483648));
    printf("2 puissance 0 : %d\n", s_pow(2, 0));

    // --- Tests pour s_stdio.s ---
    printf("\n--- Tests s_stdio.s ---\n");
    s_puts("Test de s_puts: Hello, World!");

    // --- Tests pour s_stdlib.s ---
    printf("\n--- Tests s_stdlib.s ---\n");
    printf("Conversion de \"12345\" : %d\n", s_atoi("12345"));
    printf("Conversion de \"-42\" : %d\n", s_atoi("-42"));
    printf("Conversion de \"abc123\" (erreur) : %d\n", s_atoi("abc123"));
    printf("Conversion de \"0\" : %d\n", s_atoi("0"));

    return 0;
}

