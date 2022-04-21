    .arch armv7-a
    .eabi_attribute 28, 1
    .eabi_attribute 20, 1
    .eabi_attribute 21, 1
    .eabi_attribute 23, 3
    .eabi_attribute 24, 1
    .eabi_attribute 25, 1
    .eabi_attribute 26, 2
    .eabi_attribute 30, 2
    .eabi_attribute 34, 1
    .eabi_attribute 18, 4
    .file	"pipe.c"
    .text
    .align	2
    .global	cordic_V_fixed_point
    .arch armv7-a
    .syntax unified
    .arm
    .fpu vfpv3-d16
    .type	cordic_V_fixed_point, %function
cordic_V_fixed_point:
    @ args = 0, pretend = 0, frame = 32
    @ frame_needed = 0, uses_anonymous_args = 0
    lsrs	r3, r0, #16
    uxth	r0, r0
    movne	r2, r0
    push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
    rsbeq	r2, r0, #0
    sub	sp, sp, #36
    str	r1, [sp, #24]
    sub	r2, r3, r2
    mvneq	r1, #0
    movne	r1, #1
    cmp	r2, #0
    movgt	fp, #1
    mvnle	fp, #0
    str	r1, [sp, #4]
    add	r1, r0, r3
    asr	r3, r1, #1
    mls	r3, fp, r3, r2
    cmp	r3, #0
    movgt	r8, #1
    mvnle	r8, #0
    asr	r0, r2, #1
    mla	r0, fp, r0, r1
    asr	r2, r0, #2
    mls	r2, r8, r2, r3
    cmp	r2, #0
    movgt	r7, #1
    mvnle	r7, #0
    asr	r1, r3, #2
    mla	r0, r8, r1, r0
    asr	r3, r0, #3
    mls	r3, r7, r3, r2
    cmp	r3, #0
    movgt	r6, #1
    mvnle	r6, #0
    asr	r1, r2, #3
    mla	r1, r7, r1, r0
    asr	r2, r1, #4
    mls	r2, r6, r2, r3
    cmp	r2, #0
    movgt	r5, #1
    mvnle	r5, #0
    asr	r3, r3, #4
    mla	r1, r6, r3, r1
    asr	r3, r1, #5
    mls	r3, r5, r3, r2
    cmp	r3, #0
    movgt	r9, #1
    mvnle	r9, #0
    asr	r2, r2, #5
    mla	r2, r5, r2, r1
    asr	r1, r2, #6
    mls	r1, r9, r1, r3
    cmp	r1, #0
    movgt	ip, #1
    mvnle	ip, #0
    asr	r3, r3, #6
    mla	r2, r9, r3, r2
    asr	r0, r2, #7
    mls	r0, ip, r0, r1
    mov	r3, ip
    cmp	r0, #0
    movgt	ip, #1
    mvnle	ip, #0
    asr	r1, r1, #7
    mla	r1, r3, r1, r2
    asr	lr, r1, #8
    mls	lr, ip, lr, r0
    cmp	lr, #0
    movgt	r4, #1
    mvnle	r4, #0
    str	r3, [sp, #8]
    asr	r3, r0, #8
    str	ip, [sp, #12]
    mla	ip, ip, r3, r1
    asr	r1, ip, #9
    mls	r1, r4, r1, lr
    cmp	r1, #0
    movgt	r10, #1
    mvnle	r10, #0
    asr	r2, lr, #9
    mla	r3, r4, r2, ip
    asr	ip, r3, #10
    mls	ip, r10, ip, r1
    cmp	ip, #0
    str	r4, [sp, #16]
    movgt	r4, #1
    mvnle	r4, #0
    asr	r0, r1, #10
    mla	r2, r10, r0, r3
    asr	r1, r2, #11
    mls	r1, r4, r1, ip
    cmp	r1, #0
    movgt	lr, #1
    mvnle	lr, #0
    movw	r3, #:lower16:z_table
    asr	r0, ip, #11
    mla	r0, r4, r0, r2
    asr	r2, r0, #12
    mls	r2, lr, r2, r1
    cmp	r2, #0
    movgt	ip, #1
    mvnle	ip, #0
    movt	r3, #:upper16:z_table
    str	r10, [sp, #20]
    ldr	r10, [r3, #4]
    asr	r1, r1, #12
    mul	r10, r10, fp
    str	r1, [sp, #28]
    ldr	fp, [r3]
    ldr	r1, [sp, #4]
    mla	r10, fp, r1, r10
    ldr	fp, [r3, #8]
    ldr	r1, [sp, #28]
    mla	r10, fp, r8, r10
    ldr	r8, [r3, #12]
    mla	r1, lr, r1, r0
    mla	r10, r8, r7, r10
    ldr	r8, [r3, #16]
    ldr	r0, [sp, #8]
    mla	r10, r8, r6, r10
    asr	r6, r1, #13
    mls	r6, ip, r6, r2
    ldr	r8, [r3, #20]
    cmp	r6, #0
    mla	r10, r8, r5, r10
    ldr	r8, [r3, #24]
    movgt	r7, #1
    mvnle	r7, #0
    mla	r9, r8, r9, r10
    ldr	r8, [r3, #28]
    ldr	r5, [r3, #32]
    mla	r9, r8, r0, r9
    ldr	r0, [sp, #12]
    asr	r2, r2, #13
    mla	r5, r5, r0, r9
    mla	r1, ip, r2, r1
    ldr	r8, [r3, #36]
    ldr	r2, [sp, #16]
    ldr	r10, [sp, #20]
    mla	r5, r8, r2, r5
    ldr	r2, [r3, #40]
    asr	r0, r1, #14
    mla	r5, r2, r10, r5
    ldr	r2, [r3, #44]
    mls	r0, r7, r0, r6
    mla	r4, r2, r4, r5
    ldr	r2, [r3, #48]
    mla	lr, r2, lr, r4
    ldr	r4, [r3, #52]
    asr	r2, r6, #14
    mla	ip, r4, ip, lr
    ldr	r3, [r3, #56]
    mla	r1, r7, r2, r1
    mla	ip, r3, r7, ip
    ldr	r3, [sp, #24]
    orr	r0, r1, r0, lsl #16
    str	ip, [r3]
    add	sp, sp, #36
    @ sp needed
    pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
    .size	cordic_V_fixed_point, .-cordic_V_fixed_point
    .comm	z_table,60,4
    .ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
    .section	.note.GNU-stack,"",%progbits
