#include <stdio.h>
#include <string.h>

int main() {
    char login[50];
    char password[50];

    printf("------ CRACKMES 1 -----\n\n");
    printf("Login: ");
    scanf("%s", login);
    printf("Password: ");
    scanf("%s", password);

    // Vérification du login et du mot de passe
    if (strcmp(login, "superuser") == 0 && strcmp(password, "AlphaPass") == 0) {
        printf("** ACCESS GRANTED **\n");
    } else {
        printf("** ACCESS DENIED **\n");
    }

    return 0;
}
