.section .text
// .global memcmp_1
// .type memcmp_1, %function
// memcmp_1:
//     @ Input:
//     @ r0: pointer to block 1
//     @ r1: pointer to block 2
//     @ r2: size of the blocks

//     push {r4-r11, lr}
//     mov r14,sp

//     mov r3, r2
//     lsrs r3, r3, #4          
//     beq check_remainder     

// loop_32byte:
//     ldm r0!, {r4-r7}        
//     ldm r1!, {r8-r11}       
//     cmp r4, r8              
//     bne different
//     cmp r5, r9              
//     bne different
//     cmp r6, r10              
//     bne different
//     cmp r7, r11              
//     bne different
//     subs r3, r3, #1          
//     bne loop_32byte         

// check_remainder:
//     ands r2, r2, #15         
//     beq done                 

// loop_remainder:
//     ldrb r3, [r0], #1        
//     ldrb r4, [r1], #1        
//     cmp r3, r4              
//     bne different
//     subs r2, r2, #1         
//     bne loop_remainder       

// done:
//     mov r0, #0               
//     mov sp,r14
//     pop {r4-r11, lr}
//     bx lr

// different:
//     sub r0, r3, r4          
//     mov sp,r14
//     pop {r4-r11, lr}
//     bx lr



.global memcmp_
.type memcmp_, %function
memcmp_:
    @ Input:
    @ r0: pointer to block 1
    @ r1: pointer to block 2
    @ r2: size of the blocks

    push {r4-r11, lr}

    
    cmp r2,#20
    blt check_remainder      

loop_32byte:
    ldm r0!, {r3-r7}       
    ldm r1!, {r8-r12}       
    cmp r3, r8              
    bne different
    cmp r4, r9             
    bne different
    cmp r5, r10             
    bne different
    cmp r6, r11             
    bne different
    cmp r7, r12              
    bne different
    subs r2,r2,#20
    cmp r2,#20
    blt check_remainder
    b loop_32byte

check_remainder:
    @ Check the remaining bytes
    CMP r2, #0      
    BEQ done

loop_remainder:
    ldrb r3, [r0], #1       
    ldrb r4, [r1], #1       
    cmp r3, r4               
    bne different
    subs r2, r2, #1          
    bne loop_remainder       

done:
    mov r0, r2               
    pop {r4-r11, lr}
    bx lr

different:
    mov r0,r2         
    pop {r4-r11, lr}
    bx lr
