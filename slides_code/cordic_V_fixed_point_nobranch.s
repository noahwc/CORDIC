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
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	sub	sp, sp, #36
	mov	r4, r0
	str	r1, [sp, #28]
	bl	clock
	str	r0, [sp, #4]
	lsrs	r0, r4, #16
	movne	r9, #1
	mvneq	r9, #0
	uxth	r4, r4
	mls	r2, r9, r4, r0
	cmp	r2, #0
	movgt	fp, #1
	mvnle	fp, #0
	mla	r4, r9, r0, r4
	asr	r3, r4, #1
	mls	r3, fp, r3, r2
	cmp	r3, #0
	movgt	r8, #1
	mvnle	r8, #0
	asr	r2, r2, #1
	mla	r0, fp, r2, r4
	asr	r2, r0, #2
	mls	r2, r8, r2, r3
	cmp	r2, #0
	movgt	r7, #1
	mvnle	r7, #0
	asr	r1, r3, #2
	mla	r1, r8, r1, r0
	asr	r3, r1, #3
	mls	r3, r7, r3, r2
	cmp	r3, #0
	movgt	r6, #1
	mvnle	r6, #0
	asr	r2, r2, #3
	mla	r1, r7, r2, r1
	asr	r2, r1, #4
	mls	r2, r6, r2, r3
	cmp	r2, #0
	movgt	ip, #1
	mvnle	ip, #0
	asr	r3, r3, #4
	mla	r1, r6, r3, r1
	asr	r3, r1, #5
	mls	r3, ip, r3, r2
	cmp	r3, #0
	movgt	lr, #1
	mvnle	lr, #0
	asr	r2, r2, #5
	mla	r1, ip, r2, r1
	str	ip, [sp, #8]
	asr	ip, r1, #6
	mls	ip, lr, ip, r3
	mov	r2, lr
	cmp	ip, #0
	movgt	lr, #1
	mvnle	lr, #0
	asr	r3, r3, #6
	mla	r3, r2, r3, r1
	asr	r1, r3, #7
	mls	r1, lr, r1, ip
	cmp	r1, #0
	movgt	r4, #1
	mvnle	r4, #0
	str	r2, [sp, #12]
	asr	r2, ip, #7
	mla	r2, lr, r2, r3
	asr	ip, r2, #8
	mls	ip, r4, ip, r1
	cmp	ip, #0
	movgt	r5, #1
	mvnle	r5, #0
	asr	r3, r1, #8
	mla	r0, r4, r3, r2
	asr	r1, r0, #9
	mls	r1, r5, r1, ip
	mov	r10, r5
	cmp	r1, #0
	movgt	r5, #1
	mvnle	r5, #0
	asr	r3, ip, #9
	mla	r3, r10, r3, r0
	asr	ip, r3, #10
	mls	ip, r5, ip, r1
	cmp	ip, #0
	str	r4, [sp, #20]
	movgt	r4, #1
	mvnle	r4, #0
	asr	r2, r1, #10
	mla	r2, r5, r2, r3
	asr	r1, r2, #11
	mls	r1, r4, r1, ip
	cmp	r1, #0
	str	lr, [sp, #16]
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
	str	r10, [sp, #24]
	ldr	r10, [r3, #4]
	asr	r1, r1, #12
	mul	r10, r10, fp
	ldr	fp, [r3]
	mla	r1, lr, r1, r0
	mla	r10, fp, r9, r10
	ldr	r9, [r3, #8]
	ldr	r0, [r3, #12]
	mla	r10, r9, r8, r10
	mla	r10, r0, r7, r10
	ldr	r0, [r3, #16]
	ldr	r7, [sp, #12]
	mla	r10, r0, r6, r10
	ldr	r6, [sp, #8]
	ldr	r0, [r3, #20]
	ldr	r8, [sp, #16]
	mla	r0, r0, r6, r10
	ldr	r6, [r3, #24]
	ldr	r10, [sp, #24]
	mla	r0, r6, r7, r0
	asr	r7, r1, #13
	mls	r7, ip, r7, r2
	ldr	r6, [r3, #28]
	cmp	r7, #0
	mla	r0, r6, r8, r0
	movgt	r8, #1
	mvnle	r8, #0
	asr	r2, r2, #13
	mla	r1, ip, r2, r1
	ldr	r6, [r3, #32]
	ldr	r2, [sp, #20]
	mla	r6, r6, r2, r0
	ldr	r0, [r3, #36]
	ldr	r2, [r3, #40]
	mla	r6, r0, r10, r6
	mla	r5, r2, r5, r6
	ldr	r2, [r3, #44]
	mla	r4, r2, r4, r5
	ldr	r2, [r3, #48]
	ldr	r5, [r3, #56]
	mla	lr, r2, lr, r4
	ldr	r2, [r3, #52]
	asr	r4, r7, #14
	mla	ip, r2, ip, lr
	asr	r3, r1, #14
	mla	r5, r5, r8, ip
	mla	r4, r8, r4, r1
	mls	r7, r8, r3, r7
	bl	clock
	ldr	r3, [sp, #4]
	sub	r1, r0, r3
	movw	r0, #:lower16:.LC0
	movt	r0, #:upper16:.LC0
	bl	printf
	ldr	r3, [sp, #28]
	orr	r0, r4, r7, lsl #16
	str	r5, [r3]
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
	.size	cordic_V_fixed_point, .-cordic_V_fixed_point
	.comm	z_table,60,4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Execution time for 100000 iterations: %ld \012\000"
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
