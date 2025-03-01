#include <stdio.h>
#include <string.h>

int main(int argc, char **argv) {
    // Vérifie si le nombre d'arguments est correct
    if (argc != 3) {
        printf("Missing login and password!\n");
        return 1;
    }

    // Login et mot de passe corrects (basés sur les chaînes trouvées)
    const char *correct_login = "XahHaf1J";
    const char *correct_password = "Fae9v";

    // Comparaison des arguments avec les valeurs correctes
    if (strcmp(argv[1], correct_login) == 0 && strcmp(argv[2], correct_password) == 0) {
        printf("** ACCESS GRANTED **\n");
    } else {
        printf("** ACCESS DENIED **\n");
    }

    return 0;
}

