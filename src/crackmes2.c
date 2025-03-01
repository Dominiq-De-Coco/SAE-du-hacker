#include <stdio.h>
#include <string.h>

int main() {
    char login[20];
    char password[20];

    const char *correct_login = "du6Thoo7";
    const char *correct_password = "EW8ingoh";

    printf("Login: ");
    scanf("%19s", login);

    printf("Password: ");
    scanf("%19s", password);

    if (strcmp(login, correct_login) != 0) {
        printf("** ACCESS DENIED **\n");
        return 1;
    }

    if (strcmp(password, correct_password) != 0) {
        printf("** ACCESS DENIED **\n");
        return 1;
    }

    printf("** ACCESS GRANTED **\n");
    return 0;
}

