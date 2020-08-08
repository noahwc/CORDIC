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
	.file	"cordic_V_fixed_point_neon.c"
	.text
	.align	2
	.global	cordic_V_fixed_point
	.arch armv7-a
	.syntax unified
	.arm
	.fpu neon
	.type	cordic_V_fixed_point, %function
cordic_V_fixed_point:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	lsr	r3, r0, #16
	sub	sp, sp, #28
	uxth	r0, r0
	str	r3, [sp, #16]
	str	r0, [sp, #20]
	vldr	d16, [sp, #16]
	cmp	r3, #0
	movgt	r9, #1
	mvnle	r9, #0
	vmov	d17, d16  @ v2si
	mvngt	r2, #0
	movle	r2, #1
	mul	r3, r9, r3
	vmov.32	d17[0], r3
	mul	r0, r2, r0
	vrev64.32	d16, d16
	vmov.32	d17[1], r0
	vadd.i32	d17, d17, d16
	vmov.32	r3, d17[1]
	cmp	r3, #0
	movgt	fp, #1
	mvnle	fp, #0
	vrev64.32	d16, d17
	vmov.32	r0, d17[0]
	asr	r3, r3, #1
	mvngt	r2, #0
	movle	r2, #1
	mul	r3, fp, r3
	vmov.32	d16[0], r3
	asr	r3, r0, #1
	mul	r3, r2, r3
	vmov.32	d16[1], r3
	vadd.i32	d17, d16, d17
	vmov.32	r3, d17[1]
	cmp	r3, #0
	movgt	r8, #1
	mvnle	r8, #0
	vrev64.32	d16, d17
	vmov.32	r0, d17[0]
	asr	r3, r3, #2
	mul	r3, r8, r3
	mvngt	r2, #0
	movle	r2, #1
	vmov.32	d16[0], r3
	asr	r3, r0, #2
	mul	r3, r2, r3
	vmov.32	d16[1], r3
	vadd.i32	d16, d16, d17
	vmov.32	r3, d16[1]
	cmp	r3, #0
	movgt	r7, #1
	mvnle	r7, #0
	vrev64.32	d17, d16
	asr	r3, r3, #3
	mul	r3, r7, r3
	vmov.32	r2, d16[0]
	vmov.32	d17[0], r3
	mvngt	r3, #0
	movle	r3, #1
	asr	r2, r2, #3
	mul	r3, r3, r2
	vmov.32	d17[1], r3
	vadd.i32	d16, d17, d16
	vmov.32	r3, d16[1]
	cmp	r3, #0
	movgt	r6, #1
	mvnle	r6, #0
	vrev64.32	d17, d16
	asr	r3, r3, #4
	mul	r3, r6, r3
	vmov.32	r2, d16[0]
	vmov.32	d17[0], r3
	mvngt	r3, #0
	movle	r3, #1
	asr	r2, r2, #4
	mul	r3, r3, r2
	vmov.32	d17[1], r3
	vadd.i32	d17, d17, d16
	vmov.32	r3, d17[1]
	cmp	r3, #0
	movgt	r5, #1
	mvnle	r5, #0
	vrev64.32	d16, d17
	asr	r3, r3, #5
	mul	r3, r5, r3
	vmov.32	r2, d17[0]
	vmov.32	d16[0], r3
	mvngt	r3, #0
	movle	r3, #1
	asr	r2, r2, #5
	mul	r3, r3, r2
	vmov.32	d16[1], r3
	vadd.i32	d17, d16, d17
	vmov.32	r3, d17[1]
	cmp	r3, #0
	movgt	r4, #1
	mvnle	r4, #0
	vrev64.32	d16, d17
	asr	r3, r3, #6
	mul	r3, r4, r3
	vmov.32	r2, d17[0]
	vmov.32	d16[0], r3
	mvngt	r3, #0
	movle	r3, #1
	asr	r2, r2, #6
	mul	r3, r3, r2
	vmov.32	d16[1], r3
	vadd.i32	d16, d16, d17
	vmov.32	r3, d16[1]
	cmp	r3, #0
	movgt	r0, #1
	mvnle	r0, #0
	vrev64.32	d17, d16
	asr	r3, r3, #7
	mul	r3, r0, r3
	vmov.32	r2, d16[0]
	vmov.32	d17[0], r3
	mvngt	r3, #0
	movle	r3, #1
	asr	r2, r2, #7
	mul	r3, r3, r2
	vmov.32	d17[1], r3
	vadd.i32	d16, d17, d16
	vmov.32	r3, d16[1]
	cmp	r3, #0
	movgt	r2, #1
	mvnle	r2, #0
	vrev64.32	d17, d16
	asr	r3, r3, #8
	mul	r3, r2, r3
	str	r2, [sp]
	vmov.32	r2, d16[0]
	vmov.32	d17[0], r3
	mvngt	r3, #0
	movle	r3, #1
	asr	r2, r2, #8
	mul	r3, r3, r2
	vmov.32	d17[1], r3
	vadd.i32	d17, d17, d16
	vmov.32	r3, d17[1]
	cmp	r3, #0
	movgt	ip, #1
	mvnle	ip, #0
	vrev64.32	d16, d17
	asr	r3, r3, #9
	mul	r3, ip, r3
	vmov.32	r2, d17[0]
	vmov.32	d16[0], r3
	mvngt	r3, #0
	movle	r3, #1
	asr	r2, r2, #9
	mul	r3, r3, r2
	vmov.32	d16[1], r3
	vadd.i32	d17, d16, d17
	vmov.32	r3, d17[1]
	cmp	r3, #0
	movgt	lr, #1
	mvnle	lr, #0
	vrev64.32	d16, d17
	asr	r3, r3, #10
	mul	r3, lr, r3
	vmov.32	r2, d17[0]
	vmov.32	d16[0], r3
	mvngt	r3, #0
	movle	r3, #1
	asr	r2, r2, #10
	mul	r3, r3, r2
	vmov.32	d16[1], r3
	vadd.i32	d16, d16, d17
	vmov.32	r3, d16[1]
	cmp	r3, #0
	movgt	r10, #1
	mvnle	r10, #0
	vrev64.32	d17, d16
	asr	r3, r3, #11
	mul	r3, r10, r3
	vmov.32	r2, d16[0]
	vmov.32	d17[0], r3
	mvngt	r3, #0
	movle	r3, #1
	asr	r2, r2, #11
	mul	r3, r3, r2
	vmov.32	d17[1], r3
	vadd.i32	d16, d17, d16
	vmov.32	r3, d16[1]
	cmp	r3, #0
	str	lr, [sp, #8]
	movgt	lr, #1
	mvnle	lr, #0
	vrev64.32	d17, d16
	asr	r3, r3, #12
	mul	r3, lr, r3
	vmov.32	r2, d16[0]
	vmov.32	d17[0], r3
	mvngt	r3, #0
	movle	r3, #1
	asr	r2, r2, #12
	mul	r3, r3, r2
	vmov.32	d17[1], r3
	vadd.i32	d17, d17, d16
	vmov.32	r3, d17[1]
	cmp	r3, #0
	str	ip, [sp, #4]
	movgt	ip, #1
	mvnle	ip, #0
	vrev64.32	d16, d17
	asr	r3, r3, #13
	mul	r3, ip, r3
	vmov.32	r2, d17[0]
	vmov.32	d16[0], r3
	mvngt	r3, #0
	movle	r3, #1
	asr	r2, r2, #13
	mul	r3, r3, r2
	vmov.32	d16[1], r3
	vadd.i32	d17, d16, d17
	vmov.32	r3, d17[1]
	cmp	r3, #0
	movgt	r2, #1
	mvnle	r2, #0
	vrev64.32	d16, d17
	asr	r3, r3, #14
	mul	r3, r2, r3
	str	r10, [sp, #12]
	vmov.32	r10, d17[0]
	vmov.32	d16[0], r3
	mvngt	r3, #0
	movle	r3, #1
	asr	r10, r10, #14
	mul	r3, r3, r10
	vmov.32	d16[1], r3
	movw	r3, #:lower16:z_table
	movt	r3, #:upper16:z_table
	ldr	r10, [r3, #4]
	vadd.i32	d16, d16, d17
	mul	r10, r10, fp
	ldr	fp, [r3]
	mla	r9, fp, r9, r10
	ldr	fp, [r3, #8]
	ldr	r10, [sp, #12]
	mla	r9, fp, r8, r9
	ldr	fp, [r3, #12]
	mla	r9, fp, r7, r9
	ldr	fp, [r3, #16]
	mla	r9, fp, r6, r9
	ldr	r6, [r3, #20]
	mla	r5, r6, r5, r9
	ldr	r6, [r3, #24]
	mla	r4, r6, r4, r5
	ldr	r5, [r3, #28]
	vmov.32	r6, d16[1]
	mla	r4, r5, r0, r4
	ldr	r0, [r3, #32]
	ldr	r5, [sp]
	mla	r4, r0, r5, r4
	vmov.32	r0, d16[0]
	ldr	r5, [r3, #36]
	orr	r0, r0, r6, lsl #16
	ldr	r6, [sp, #4]
	mla	r4, r5, r6, r4
	ldr	r5, [r3, #40]
	ldr	r6, [sp, #8]
	mla	r4, r5, r6, r4
	ldr	r5, [r3, #44]
	mla	r4, r5, r10, r4
	ldr	r5, [r3, #48]
	mla	lr, r5, lr, r4
	ldr	r4, [r3, #52]
	ldr	r3, [r3, #56]
	mla	ip, r4, ip, lr
	mla	r2, r3, r2, ip
	str	r2, [r1]
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
	.size	cordic_V_fixed_point, .-cordic_V_fixed_point
	.comm	z_table,60,4
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
