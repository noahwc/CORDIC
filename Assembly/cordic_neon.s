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
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	tst	r0, #65536
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	vmov.i32	d7, #0  @ v2si
	movne	r10, #1
	mvneq	r10, #0
	uxth	r3, r0
	sub	sp, sp, #36
	lsr	r0, r0, #16
	rsb	r2, r3, #0
	strd	r2, [sp, #20]
	str	r0, [sp, #28]
	str	r0, [sp, #16]
	vldr	d17, [sp, #16]
	vmov.32	d7[0], r10
	vldr	d16, [sp, #24]
	vmla.i32	d16, d17, d7[0]
	vrev64.32	d17, d16
	vmov.32	r3, d16[1]
	vshr.s32	d17, d17, #1
	cmp	r3, #0
	vmov.32	r3, d17[1]
	movgt	fp, #1
	mvnle	fp, #0
	vmov.i32	d7, #0  @ v2si
	rsb	r3, r3, #0
	vmov.32	d17[1], r3
	vmov.32	d7[0], fp
	vmla.i32	d16, d17, d7[0]
	vrev64.32	d17, d16
	vmov.32	r3, d16[1]
	vshr.s32	d17, d17, #2
	cmp	r3, #0
	vmov.32	r3, d17[1]
	movgt	r2, #1
	mvnle	r2, #0
	vmov.i32	d7, #0  @ v2si
	rsb	r3, r3, #0
	vmov.32	d17[1], r3
	vmov.32	d7[0], r2
	vmla.i32	d16, d17, d7[0]
	vrev64.32	d17, d16
	vmov.32	r3, d16[1]
	vshr.s32	d17, d17, #3
	cmp	r3, #0
	vmov.32	r3, d17[1]
	movgt	r9, #1
	mvnle	r9, #0
	vmov.i32	d7, #0  @ v2si
	rsb	r3, r3, #0
	vmov.32	d17[1], r3
	vmov.32	d7[0], r9
	vmla.i32	d16, d17, d7[0]
	vrev64.32	d17, d16
	vmov.32	r3, d16[1]
	vshr.s32	d17, d17, #4
	cmp	r3, #0
	vmov.32	r3, d17[1]
	movgt	r8, #1
	mvnle	r8, #0
	vmov.i32	d7, #0  @ v2si
	rsb	r3, r3, #0
	vmov.32	d17[1], r3
	vmov.32	d7[0], r8
	vmla.i32	d16, d17, d7[0]
	vrev64.32	d17, d16
	vmov.32	r3, d16[1]
	vshr.s32	d17, d17, #5
	cmp	r3, #0
	vmov.32	r3, d17[1]
	movgt	r7, #1
	mvnle	r7, #0
	vmov.i32	d7, #0  @ v2si
	rsb	r3, r3, #0
	vmov.32	d17[1], r3
	vmov.32	d7[0], r7
	vmla.i32	d16, d17, d7[0]
	vrev64.32	d17, d16
	vmov.32	r3, d16[1]
	vshr.s32	d17, d17, #6
	cmp	r3, #0
	vmov.32	r3, d17[1]
	movgt	r6, #1
	mvnle	r6, #0
	vmov.i32	d7, #0  @ v2si
	rsb	r3, r3, #0
	vmov.32	d17[1], r3
	vmov.32	d7[0], r6
	vmla.i32	d16, d17, d7[0]
	vrev64.32	d17, d16
	vmov.32	r3, d16[1]
	vshr.s32	d17, d17, #7
	cmp	r3, #0
	vmov.32	r3, d17[1]
	movgt	r5, #1
	mvnle	r5, #0
	vmov.i32	d7, #0  @ v2si
	rsb	r3, r3, #0
	vmov.32	d17[1], r3
	vmov.32	d7[0], r5
	vmla.i32	d16, d17, d7[0]
	vrev64.32	d17, d16
	vmov.32	r3, d16[1]
	vshr.s32	d17, d17, #8
	cmp	r3, #0
	vmov.32	r3, d17[1]
	movgt	r4, #1
	mvnle	r4, #0
	vmov.i32	d7, #0  @ v2si
	rsb	r3, r3, #0
	vmov.32	d17[1], r3
	vmov.32	d7[0], r4
	vmla.i32	d16, d17, d7[0]
	vrev64.32	d17, d16
	vmov.32	r3, d16[1]
	vshr.s32	d17, d17, #9
	cmp	r3, #0
	vmov.32	r3, d17[1]
	movgt	r0, #1
	mvnle	r0, #0
	vmov.i32	d7, #0  @ v2si
	rsb	r3, r3, #0
	vmov.32	d7[0], r0
	vmov.32	d17[1], r3
	vmla.i32	d16, d17, d7[0]
	vrev64.32	d17, d16
	vmov.32	r3, d16[1]
	vshr.s32	d17, d17, #10
	cmp	r3, #0
	vmov.32	r3, d17[1]
	movgt	ip, #1
	mvnle	ip, #0
	vmov.i32	d7, #0  @ v2si
	rsb	r3, r3, #0
	vmov.32	d7[0], ip
	vmov.32	d17[1], r3
	vmla.i32	d16, d17, d7[0]
	vrev64.32	d17, d16
	vmov.32	r3, d16[1]
	vshr.s32	d17, d17, #11
	cmp	r3, #0
	vmov.32	r3, d17[1]
	movgt	lr, #1
	mvnle	lr, #0
	vmov.i32	d7, #0  @ v2si
	rsb	r3, r3, #0
	vmov.32	d7[0], lr
	vmov.32	d17[1], r3
	vmla.i32	d16, d17, d7[0]
	vrev64.32	d17, d16
	vmov.32	r3, d16[1]
	vshr.s32	d17, d17, #12
	cmp	r3, #0
	vmov.32	r3, d17[1]
	str	r0, [sp]
	vmov.i32	d7, #0  @ v2si
	movgt	r0, #1
	mvnle	r0, #0
	rsb	r3, r3, #0
	vmov.32	d17[1], r3
	vmov.32	d7[0], r0
	vmla.i32	d16, d17, d7[0]
	vrev64.32	d17, d16
	vmov.32	r3, d16[1]
	vshr.s32	d17, d17, #13
	cmp	r3, #0
	vmov.32	r3, d17[1]
	str	lr, [sp, #8]
	vmov.i32	d7, #0  @ v2si
	movgt	lr, #1
	mvnle	lr, #0
	rsb	r3, r3, #0
	vmov.32	d17[1], r3
	vmov.32	d7[0], lr
	vmla.i32	d16, d17, d7[0]
	vrev64.32	d17, d16
	vmov.32	r3, d16[1]
	vshr.s32	d17, d17, #14
	cmp	r3, #0
	vmov.32	r3, d17[1]
	str	ip, [sp, #4]
	vmov.i32	d7, #0  @ v2si
	movgt	ip, #1
	mvnle	ip, #0
	rsb	r3, r3, #0
	vmov.32	d17[1], r3
	vmov.32	d7[0], ip
	movw	r3, #:lower16:z_table
	vmla.i32	d16, d17, d7[0]
	movt	r3, #:upper16:z_table
	str	r0, [sp, #12]
	ldr	r0, [r3, #4]
	mul	r0, r0, fp
	ldr	fp, [r3]
	mla	r10, fp, r10, r0
	ldr	fp, [r3, #8]
	ldr	r0, [r3, #12]
	mla	r10, fp, r2, r10
	mla	r9, r0, r9, r10
	ldr	fp, [r3, #16]
	ldr	r0, [r3, #20]
	mla	r9, fp, r8, r9
	mla	r7, r0, r7, r9
	ldr	r0, [r3, #24]
	ldr	r2, [r3, #28]
	mla	r6, r0, r6, r7
	vmov.32	r0, d16[1]
	mla	r5, r2, r5, r6
	vmov.32	r2, d16[0]
	ldr	r7, [r3, #32]
	ldr	r6, [r3, #36]
	mla	r4, r7, r4, r5
	ldr	r5, [sp]
	ldr	r7, [sp, #4]
	mla	r4, r6, r5, r4
	ldr	r6, [r3, #40]
	ldr	r5, [r3, #44]
	mla	r4, r6, r7, r4
	ldr	r6, [sp, #8]
	ldr	r7, [sp, #12]
	mla	r4, r5, r6, r4
	ldr	r6, [r3, #48]
	ldr	r5, [r3, #52]
	mla	r4, r6, r7, r4
	mla	lr, r5, lr, r4
	ldr	r3, [r3, #56]
	orr	r0, r2, r0, lsl #16
	mla	ip, r3, ip, lr
	str	ip, [r1]
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
	.size	cordic_V_fixed_point, .-cordic_V_fixed_point
	.comm	z_table,60,4
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
