#include <unistd.h>
#include <stdio.h>

int main(void){
    int sec = 5;
    alarm(sec);
    printf("Alarm is set to %d seconds.\n", sec);

    while(1) ;
    
    return 0;
}
