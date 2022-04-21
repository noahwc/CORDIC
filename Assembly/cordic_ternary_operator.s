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
	.file	"cordic_V_fixed_point_nobranch.c"
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
	lsrs	r3, r0, #16
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movne	r9, #1
	mvneq	r9, #0
	uxth	r0, r0
	mls	r2, r9, r0, r3
	cmp	r2, #0
	movgt	fp, #1
	mvnle	fp, #0
	mla	r0, r9, r3, r0
	asr	r3, r0, #1
	mls	r3, fp, r3, r2
	cmp	r3, #0
	movgt	r8, #1
	mvnle	r8, #0
	asr	r2, r2, #1
	mla	r0, fp, r2, r0
	asr	r2, r0, #2
	mls	r2, r8, r2, r3
	cmp	r2, #0
	movgt	r7, #1
	mvnle	r7, #0
	asr	r3, r3, #2
	mla	ip, r8, r3, r0
	asr	r3, ip, #3
	mls	r3, r7, r3, r2
	cmp	r3, #0
	movgt	r6, #1
	mvnle	r6, #0
	asr	r0, r2, #3
	mla	r0, r7, r0, ip
	asr	r2, r0, #4
	mls	r2, r6, r2, r3
	cmp	r2, #0
	movgt	ip, #1
	mvnle	ip, #0
	asr	r3, r3, #4
	mla	r0, r6, r3, r0
	asr	r3, r0, #5
	mls	r3, ip, r3, r2
	cmp	r3, #0
	movgt	lr, #1
	mvnle	lr, #0
	asr	r2, r2, #5
	mla	r0, ip, r2, r0
	asr	r2, r0, #6
	mls	r2, lr, r2, r3
	cmp	r2, #0
	movgt	r5, #1
	mvnle	r5, #0
	asr	r3, r3, #6
	mla	r0, lr, r3, r0
	asr	r4, r0, #7
	mls	r4, r5, r4, r2
	mov	r3, r5
	cmp	r4, #0
	movgt	r5, #1
	mvnle	r5, #0
	asr	r2, r2, #7
	mla	r0, r3, r2, r0
	sub	sp, sp, #28
	str	lr, [sp, #4]
	asr	lr, r0, #8
	mls	lr, r5, lr, r4
	mov	r2, r5
	cmp	lr, #0
	movgt	r5, #1
	mvnle	r5, #0
	str	r3, [sp, #8]
	asr	r3, r4, #8
	str	ip, [sp]
	mla	ip, r2, r3, r0
	asr	r0, ip, #9
	mov	r4, r5
	mls	r0, r5, r0, lr
	cmp	r0, #0
	movgt	r5, #1
	mvnle	r5, #0
	asr	r3, lr, #9
	mla	r3, r4, r3, ip
	asr	lr, r3, #10
	mls	lr, r5, lr, r0
	mov	r10, r5
	cmp	lr, #0
	movgt	r5, #1
	mvnle	r5, #0
	str	r2, [sp, #12]
	asr	r2, r0, #10
	mla	r2, r10, r2, r3
	asr	r0, r2, #11
	mls	r0, r5, r0, lr
	cmp	r0, #0
	str	r4, [sp, #16]
	movgt	r4, #1
	mvnle	r4, #0
	movw	r3, #:lower16:z_table
	asr	ip, lr, #11
	mla	ip, r5, ip, r2
	asr	r2, ip, #12
	mls	r2, r4, r2, r0
	cmp	r2, #0
	movgt	lr, #1
	mvnle	lr, #0
	movt	r3, #:upper16:z_table
	str	r10, [sp, #20]
	ldr	r10, [r3, #4]
	asr	r0, r0, #12
	mul	r10, r10, fp
	ldr	fp, [r3]
	mla	r0, r4, r0, ip
	mla	r10, fp, r9, r10
	ldr	r9, [r3, #8]
	ldr	ip, [r3, #12]
	mla	r10, r9, r8, r10
	mla	r10, ip, r7, r10
	ldr	ip, [r3, #16]
	ldr	r7, [sp, #8]
	mla	r10, ip, r6, r10
	ldr	ip, [r3, #20]
	ldr	r6, [sp]
	ldr	r8, [sp, #16]
	mla	ip, ip, r6, r10
	ldr	r10, [r3, #24]
	ldr	r6, [sp, #4]
	mla	r10, r10, r6, ip
	asr	r6, r0, #13
	mls	r6, lr, r6, r2
	ldr	ip, [r3, #28]
	cmp	r6, #0
	mla	ip, ip, r7, r10
	movgt	r7, #1
	mvnle	r7, #0
	asr	r2, r2, #13
	ldr	r10, [r3, #32]
	mla	r2, lr, r2, r0
	ldr	r0, [sp, #12]
	mla	ip, r10, r0, ip
	ldr	r0, [r3, #36]
	ldr	r10, [sp, #20]
	mla	r0, r0, r8, ip
	ldr	ip, [r3, #40]
	mla	r0, ip, r10, r0
	ldr	ip, [r3, #44]
	mla	r5, ip, r5, r0
	ldr	r0, [r3, #48]
	ldr	ip, [r3, #56]
	mla	r4, r0, r4, r5
	ldr	r0, [r3, #52]
	asr	r3, r6, #14
	mla	lr, r0, lr, r4
	asr	r0, r2, #14
	mls	r0, r7, r0, r6
	mla	r2, r7, r3, r2
	mla	lr, ip, r7, lr
	orr	r0, r2, r0, lsl #16
	str	lr, [r1]
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
	.size	cordic_V_fixed_point, .-cordic_V_fixed_point
	.comm	z_table,60,4
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
