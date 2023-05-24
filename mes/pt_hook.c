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



/*********************************************************************************************/
/*********************************************************************************************/
/****************************** Assignment 2 *************************************************/
/*********************************************************************************************/
/*********************************************************************************************/

// Function declaration
int pt_led_demo_a2(int count, int delay);

/*
* Function: _pt_A2
* Description: Two integers from the user are required for this function. The first number 
toggles the 8-led cycle, while the second number changes the busy_delay function's delay
 between LEDs in accordance with the user-passed delay.
* Parameters: an integer - int action
* Returns: void
*/
void _pt_A2(int action)
{
    if(action==CMD_SHORT_HELP) return;
    if(action==CMD_LONG_HELP) {
        printf("Addition Test\n\n"
        "This command tests new addition function\n"
    );
    return;
    }

    // count input
    uint32_t count;
    int fetch_status1;  
    fetch_status1 = fetch_uint32_arg(&count);
    // check the count variable is valid or not
    if(fetch_status1) {
    // Use a default count value
    count = 1;
    }
    
    // delay input
    uint32_t delay;
    int fetch_status;
    fetch_status = fetch_uint32_arg(&delay);
    if(fetch_status) {
    // Use a default delay value
    delay = 0xFFFFFF;
    }

    printf("pt_led_demo_a2 returned: %d\n", pt_led_demo_a2(count, delay) );
}

ADD_CMD("a2demo", _pt_A2,"Toggles all 8 LEDs using a loop (default value: count: 1, delay: 0xFFFFFF)")

