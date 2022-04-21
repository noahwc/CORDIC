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
.file	"unroll.c"
.text
.align	2
.global	cordic_V_fixed_point
.arch armv7-a
.syntax unified
.arm
.fpu vfpv3-d16
.type	cordic_V_fixed_point, %function
cordic_V_fixed_point:
    @ args = 0, pretend = 0, frame = 0
    @ frame_needed = 0, uses_anonymous_args = 0
    movw	r3, #:lower16:z_table
    uxth	r2, r0
    push	{r4, r5, lr}
    lsrs	lr, r0, #16
    moveq	r0, r2
    movt	r3, #:upper16:z_table
    ldr	ip, [r3]
    addne	r0, r2, lr
    subne	r2, lr, r2
    rsbeq	ip, ip, #0
    asr	lr, r0, #1
    cmp	r2, #0
    ldr	r4, [r3, #4]
    asr	r5, r2, #1
    addgt	r0, r0, r5
    suble	r0, r0, r5
    subgt	lr, r2, lr
    addle	lr, r2, lr
    addgt	ip, ip, r4
    asr	r2, r0, #2
    suble	ip, ip, r4
    asr	r5, lr, #2
    cmp	lr, #0
    ldr	r4, [r3, #8]
    subgt	r2, lr, r2
    addle	r2, r2, lr
    addgt	r0, r5, r0
    suble	r0, r0, r5
    addgt	ip, r4, ip
    asr	r5, r2, #3
    suble	ip, ip, r4
    ldr	lr, [r3, #12]
    asr	r4, r0, #3
    cmp	r2, #0
    subgt	r2, r2, r4
    addle	r2, r2, r4
    addgt	r0, r0, r5
    suble	r0, r0, r5
    asr	r4, r0, #4
    asr	r5, r2, #4
    addgt	ip, ip, lr
    suble	ip, ip, lr
    cmp	r2, #0
    ldr	lr, [r3, #16]
    subgt	r2, r2, r4
    addle	r2, r2, r4
    addgt	r0, r0, r5
    suble	r0, r0, r5
    asr	r4, r0, #5
    asr	r5, r2, #5
    addgt	ip, ip, lr
    suble	ip, ip, lr
    cmp	r2, #0
    ldr	lr, [r3, #20]
    subgt	r2, r2, r4
    addle	r2, r2, r4
    addgt	r0, r0, r5
    suble	r0, r0, r5
    asr	r4, r0, #6
    asr	r5, r2, #6
    addgt	ip, ip, lr
    suble	ip, ip, lr
    cmp	r2, #0
    ldr	lr, [r3, #24]
    subgt	r2, r2, r4
    addle	r2, r2, r4
    addgt	r0, r0, r5
    suble	r0, r0, r5
    asr	r4, r0, #7
    asr	r5, r2, #7
    addgt	ip, ip, lr
    suble	ip, ip, lr
    cmp	r2, #0
    ldr	lr, [r3, #28]
    addgt	r0, r0, r5
    subgt	r2, r2, r4
    suble	r0, r0, r5
    addle	r2, r2, r4
    asr	r5, r2, #8
    asr	r4, r0, #8
    addgt	ip, ip, lr
    suble	ip, ip, lr
    cmp	r2, #0
    ldr	lr, [r3, #32]
    addgt	r0, r0, r5
    suble	r0, r0, r5
    subgt	r2, r2, r4
    addle	r2, r2, r4
    asr	r5, r2, #9
    asr	r4, r0, #9
    addgt	ip, ip, lr
    suble	ip, ip, lr
    cmp	r2, #0
    ldr	lr, [r3, #36]
    addgt	r0, r0, r5
    suble	r0, r0, r5
    subgt	r2, r2, r4
    addle	r2, r2, r4
    addgt	ip, ip, lr
    asr	r4, r0, #10
    suble	ip, ip, lr
    asr	r5, r2, #10
    cmp	r2, #0
    ldr	lr, [r3, #40]
    addgt	r0, r0, r5
    suble	r0, r0, r5
    subgt	r2, r2, r4
    addle	r2, r2, r4
    addgt	ip, ip, lr
    asr	r4, r0, #11
    suble	ip, ip, lr
    asr	r5, r2, #11
    cmp	r2, #0
    ldr	lr, [r3, #44]
    addgt	r0, r0, r5
    suble	r0, r0, r5
    subgt	r2, r2, r4
    addle	r2, r2, r4
    addgt	ip, ip, lr
    suble	ip, ip, lr
    ldr	r4, [r3, #48]
    asr	lr, r0, #12
    cmp	r2, #0
    asr	r5, r2, #12
    addgt	r0, r5, r0
    suble	r0, r0, r5
    subgt	lr, r2, lr
    addle	lr, lr, r2
    addgt	ip, r4, ip
    asr	r2, r0, #13
    suble	ip, ip, r4
    asr	r5, lr, #13
    cmp	lr, #0
    ldr	r4, [r3, #52]
    subgt	r2, lr, r2
    addle	r2, r2, lr
    addgt	r0, r5, r0
    suble	r0, r0, r5
    ldr	r3, [r3, #56]
    asr	lr, r0, #14
    addgt	ip, r4, ip
    suble	ip, ip, r4
    cmp	r2, #0
    asr	r4, r2, #14
    addgt	r0, r0, r4
    subgt	r2, r2, lr
    addgt	r3, ip, r3
    suble	r0, r0, r4
    addle	r2, r2, lr
    suble	r3, ip, r3
    str	r3, [r1]
    orr	r0, r0, r2, lsl #16
    pop	{r4, r5, pc}
    .size	cordic_V_fixed_point, .-cordic_V_fixed_point
    .comm	z_table,60,4
    .ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
    .section	.note.GNU-stack,"",%progbits
