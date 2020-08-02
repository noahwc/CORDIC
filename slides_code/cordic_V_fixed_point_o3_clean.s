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
	.file	"cordic_V_fixed_point.c"
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
	movw	r2, #:lower16:z_table
	lsrs	r3, r0, #16
	uxth	r0, r0
	moveq	ip, r0
	movt	r2, #:upper16:z_table
	push	{r4, r5, lr}
	ldr	lr, [r2]
	addne	ip, r0, r3
	subne	r0, r3, r0
	rsbeq	lr, lr, #0
	asr	r3, ip, #1
	cmp	r0, #0
	ldr	r4, [r2, #4]
	asr	r5, r0, #1
	subgt	r3, r0, r3
	addle	r3, r0, r3
	addgt	ip, ip, r5
	suble	ip, ip, r5
	asr	r0, r3, #2
	asr	r5, ip, #2
	addgt	lr, lr, r4
	suble	lr, lr, r4
	cmp	r3, #0
	ldr	r4, [r2, #8]
	addgt	r0, ip, r0
	suble	r0, ip, r0
	subgt	r3, r3, r5
	addle	r3, r3, r5
	asr	r5, r3, #3
	addgt	ip, lr, r4
	suble	ip, lr, r4
	cmp	r3, #0
	asr	r4, r0, #3
	ldr	lr, [r2, #12]
	subgt	r3, r3, r4
	addle	r3, r3, r4
	addgt	r0, r0, r5
	suble	r0, r0, r5
	asr	r4, r0, #4
	asr	r5, r3, #4
	addgt	ip, ip, lr
	suble	ip, ip, lr
	cmp	r3, #0
	ldr	lr, [r2, #16]
	subgt	r3, r3, r4
	addle	r3, r3, r4
	addgt	r0, r0, r5
	suble	r0, r0, r5
	asr	r4, r0, #5
	asr	r5, r3, #5
	addgt	ip, ip, lr
	suble	ip, ip, lr
	cmp	r3, #0
	ldr	lr, [r2, #20]
	subgt	r3, r3, r4
	addle	r3, r3, r4
	addgt	r0, r0, r5
	suble	r0, r0, r5
	asr	r4, r0, #6
	asr	r5, r3, #6
	addgt	ip, ip, lr
	suble	ip, ip, lr
	cmp	r3, #0
	ldr	lr, [r2, #24]
	subgt	r3, r3, r4
	addle	r3, r3, r4
	addgt	r0, r0, r5
	suble	r0, r0, r5
	asr	r4, r0, #7
	asr	r5, r3, #7
	addgt	ip, ip, lr
	suble	ip, ip, lr
	cmp	r3, #0
	ldr	lr, [r2, #28]
	subgt	r3, r3, r4
	addle	r3, r3, r4
	addgt	r0, r0, r5
	suble	r0, r0, r5
	asr	r4, r0, #8
	asr	r5, r3, #8
	addgt	ip, ip, lr
	suble	ip, ip, lr
	cmp	r3, #0
	ldr	lr, [r2, #32]
	subgt	r3, r3, r4
	addle	r3, r3, r4
	addgt	r0, r0, r5
	suble	r0, r0, r5
	asr	r4, r0, #9
	asr	r5, r3, #9
	addgt	ip, ip, lr
	suble	ip, ip, lr
	cmp	r3, #0
	ldr	lr, [r2, #36]
	subgt	r3, r3, r4
	addle	r3, r3, r4
	addgt	r0, r0, r5
	suble	r0, r0, r5
	asr	r4, r0, #10
	asr	r5, r3, #10
	addgt	ip, ip, lr
	suble	ip, ip, lr
	cmp	r3, #0
	ldr	lr, [r2, #40]
	subgt	r3, r3, r4
	addle	r3, r3, r4
	addgt	r0, r0, r5
	suble	r0, r0, r5
	asr	r4, r0, #11
	asr	r5, r3, #11
	addgt	ip, ip, lr
	suble	ip, ip, lr
	cmp	r3, #0
	ldr	lr, [r2, #44]
	subgt	r3, r3, r4
	addle	r3, r3, r4
	addgt	r0, r0, r5
	suble	r0, r0, r5
	asr	r4, r0, #12
	asr	r5, r3, #12
	addgt	ip, ip, lr
	suble	ip, ip, lr
	cmp	r3, #0
	ldr	lr, [r2, #48]
	subgt	r3, r3, r4
	addle	r3, r3, r4
	addgt	r0, r0, r5
	suble	r0, r0, r5
	asr	r4, r0, #13
	asr	r5, r3, #13
	addgt	ip, ip, lr
	suble	ip, ip, lr
	cmp	r3, #0
	ldr	lr, [r2, #52]
	addgt	r0, r0, r5
	subgt	r3, r3, r4
	suble	r0, r0, r5
	addle	r3, r3, r4
	ldr	r2, [r2, #56]
	asr	r4, r3, #14
	addgt	ip, ip, lr
	suble	ip, ip, lr
	cmp	r3, #0
	asr	lr, r0, #14
	subgt	r3, r3, lr
	addgt	r0, r4, r0
	addgt	r2, r2, ip
	suble	r0, r0, r4
	addle	r3, lr, r3
	suble	r2, ip, r2
	str	r2, [r1]
	orr	r0, r0, r3, lsl #16
	pop	{r4, r5, pc}
	.size	cordic_V_fixed_point, .-cordic_V_fixed_point
	.comm	z_table,60,4
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
