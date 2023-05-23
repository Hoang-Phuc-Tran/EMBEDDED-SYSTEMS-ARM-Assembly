/*
* C to assembler menu hook
*
*/
#include <stdio.h>
#include <stdint.h>
#include <ctype.h>
#include "common.h"

int add_test(int x, int y);

void AddTest(int action)
{
    if(action==CMD_SHORT_HELP) return;
    if(action==CMD_LONG_HELP) {
        printf("Addition Test\n\n"
        "This command tests new addition function\n"
    );
    return;
    }

    // input variables
    uint32_t x = 0;
    uint32_t delay;

    int fetch_status;
    fetch_uint32_arg(&x);
    fetch_status = fetch_uint32_arg(&delay);
    if(fetch_status) {
    // Use a default delay value
    delay = 0xFFFFFF;
    }
    // When we call our function, pass the delay value.
    // printf(“<<< here is where we call add_test – can you add a third parameter? >>>”);
    // get inputs from the user

    printf("add_test returned: %d\n", add_test(x, delay) );
}

ADD_CMD("add", AddTest,"Test the new add function")
