@ Function Declaration : int add_test(int x, int y)
@ Test code for my own new function called from C
@ This is a comment. Anything after an @ symbol is ignored.
@@ This is also a comment. Some people use double @@ symbols.
    .code 16 @ This directive selects the instruction set being generated.

@ The value 16 selects Thumb, with the value 32 selecting ARM.
    .text @ Tell the assembler that the upcoming section is to be considered

@ assembly language instructions - Code section (text -> ROM)
@@ Function Header Block
    .align 2 @ Code alignment - 2^n alignment (n=2)

@ This causes the assembler to use 4 byte alignment
    .syntax unified @ Sets the instruction set to the new unified ARM + THUMB

@ instructions. The default is divided (separate instruction sets)
    .global add_test @ Make the symbol name for the function visible to the linker

    .code 16 @ 16bit THUMB code (BOTH .code and .thumb_func are required)
    .thumb_func @ Specifies that the following symbol is the name of a THUMB

@ encoded function. Necessary for interlinking between ARM and THUMB code.
    .type add_test, %function @ Declares that the symbol is a function (not strictly required)
    @ Actual declaration of the symbol
    @ Data section - initialized values


@ Function Declaration : int add_test(int x, int y)
@
@ Input: r0, r1 (i.e. r0 holds x, r1 holds y)
@ Returns: r0
@
@ Here is the actual add_test function
    add_test:
    push {r4,r5, lr}    @ push the r4, r5 and lr register on the stack
   
    mov r5, r0
    mov r4, #0

    loop:
    cmp r4, #8
    beq exit
    mov r0, r4
    bl   BSP_LED_Toggle             @ call BSP C function using Branch with Link (bl)
    
    mov r0, r5
    bl busy_delay

    add r4, r4, #1
    b loop



    exit:
    pop {r4,r5, lr}      @ pop the r4,r5 and lr register out of the stack
    bx lr                @ Return (Branch eXchange) to the address in the link register (lr)



    .size add_test, .-add_test @@ - symbol size (not strictly required, but makes the debugger happy)


@ Function Declaration : int busy_delay(int cycles)
@
@ Input: r0 (i.e. r0 holds number of cycles to delay)
@ Returns: r0
@
@ Here is the actual function. DO NOT MODIFY THIS FUNCTION.
    busy_delay:
    push {r5}
    mov r5, r0

    delay_1oop:
    subs r5, r5, #1
    bge delay_1oop
    mov r0, #0 @ Return zero (success)
    pop {r5}
    bx lr @ Return (Branch eXchange) to the address in the link register (lr)



@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   Assignment 2 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Assembly file ended by single .end directive on its own line
    .code 16 @ This directive selects the instruction set being generated.

@ The value 16 selects Thumb, with the value 32 selecting ARM.
    .text @ Tell the assembler that the upcoming section is to be considered

@ assembly language instructions - Code section (text -> ROM)
@@ Function Header Block
    .align 2 @ Code alignment - 2^n alignment (n=2)

@ This causes the assembler to use 4 byte alignment
    .syntax unified @ Sets the instruction set to the new unified ARM + THUMB

@ instructions. The default is divided (separate instruction sets)
    .global pt_led_demo_a2

    .code 16 @ 16bit THUMB code (BOTH .code and .thumb_func are required)
    .thumb_func @ Specifies that the following symbol is the name of a THUMB

@ encoded function. Necessary for interlinking between ARM and THUMB code.
    .type pt_led_demo_a2, %function @ Declares that the symbol is a function (not strictly required)
    @ Actual declaration of the symbol
    @ Data section - initialized values

@ Function Declaration : int pt_led_demo_a2(int count, int delay)
@
@ Input: r0, r1 (i.e. r0 holds count, r1 holds delay)
@ Returns: r0
@
@ Here is the actual pt_led_demo_a2 function
    pt_led_demo_a2:
    push {r4,r5,r6,lr}    @ push the r4, r5, r6 and lr register on the stack
   
    mov r4, r0            @ copy the count value and save it in r4 
    mov r5, r1            @ copy the delay value and save it in r5
    mov r6, #8            @ The r6 holds the LEDs index

    @ This main_loop will repeat 8 LEDs based on the user's input
    main_loop:
    subs r4,r4, #1          @ Subtract to count down the loop
    blt exit_main_loop      @ If r4 < 0, exit the loop

        


    @ exit main loop
    exit_main_loop:
    pop {r4,r5,r6,lr}        @ pop the r4,r5,r6 and lr register out of the stack
    bx lr                    @ Return (Branch eXchange) to the address in the link register (lr)



    .size add_test, .-add_test @@ - symbol size (not strictly required, but makes the debugger happy)


    .end
    Things past the end directive are not processed, as you can see here.