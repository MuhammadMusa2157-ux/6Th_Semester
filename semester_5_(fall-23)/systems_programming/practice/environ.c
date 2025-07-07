#include <stdio.h>
// environ is included in stdlib
#include <stdlib.h>

extern char **environ;
#define MAILDEFAULT "/var/mail";

int main(void)
{
    int i;

    char *mailp = NULL;
    if (getenv("MAILPATH") == NULL)
        mailp = getenv("MAIL");
    if (mailp == NULL)
        mailp = MAILDEFAULT;
        
    printf("The environment list follows:\n");
    for (i = 0; environ[i] != NULL; i++)
        printf("environ[%d]: %s\n", i, environ[i]);

    return 0;
}