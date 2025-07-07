// Custom handler for SIGINT
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <signal.h>

void myCtrlCHandler(int);
int main(void)
{
    // Setting the structure for custom handler
    struct sigaction newAction, oldAction;

    newAction.sa_flags = 0; // Initialize flag to zero.
    newAction.sa_handler = myCtrlCHandler;  // Set the handler to the function to be executed when interrupt is received.
    if(sigemptyset(&newAction.sa_mask) == -1){ // Empty the mask.
        perror("Error while setting the mask.\n");
        return 1;
    }

    if(sigaction(SIGINT, &newAction, &oldAction) == -1){
        perror("Error while setting the action for INTERRUPT.\n");
        return 1;
        
    }

    while(1);

    printf("Normal termination after Ctrl+C");
    return 0;
}
// TODO: Termination is not working.
void myCtrlCHandler(int signalNumber){
    printf("Ctrl+C Received!\n");
}