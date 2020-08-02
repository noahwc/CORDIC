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
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	sub	sp, sp, #36
	mov	r4, r0
	str	r1, [sp, #12]
	bl	clock
	str	r0, [sp, #8]
	lsrs	r0, r4, #16
	movne	r8, #1
	mvneq	r8, #0
	uxth	r4, r4
	mls	r2, r8, r4, r0
	cmp	r2, #0
	movgt	fp, #1
	mvnle	fp, #0
	mla	r4, r8, r0, r4
	asr	r3, r4, #1
	mls	r3, fp, r3, r2
	cmp	r3, #0
	movgt	r7, #1
	mvnle	r7, #0
	asr	r2, r2, #1
	mla	r0, fp, r2, r4
	asr	r2, r0, #2
	mls	r2, r7, r2, r3
	cmp	r2, #0
	movgt	r6, #1
	mvnle	r6, #0
	asr	r1, r3, #2
	mla	r1, r7, r1, r0
	asr	r3, r1, #3
	mls	r3, r6, r3, r2
	cmp	r3, #0
	movgt	r5, #1
	mvnle	r5, #0
	asr	r2, r2, #3
	mla	r1, r6, r2, r1
	asr	r2, r1, #4
	mls	r2, r5, r2, r3
	cmp	r2, #0
	movgt	ip, #1
	mvnle	ip, #0
	asr	r3, r3, #4
	mla	r1, r5, r3, r1
	asr	r3, r1, #5
	mls	r3, ip, r3, r2
	cmp	r3, #0
	movgt	r9, #1
	mvnle	r9, #0
	asr	r2, r2, #5
	mla	r1, ip, r2, r1
	asr	r2, r1, #6
	mls	r2, r9, r2, r3
	cmp	r2, #0
	movgt	r4, #1
	mvnle	r4, #0
	asr	r3, r3, #6
	mla	r3, r9, r3, r1
	asr	r1, r3, #7
	mls	r1, r4, r1, r2
	cmp	r1, #0
	movgt	lr, #1
	mvnle	lr, #0
	asr	r2, r2, #7
	mla	r3, r4, r2, r3
	asr	r2, r3, #8
	mls	r2, lr, r2, r1
	cmp	r2, #0
	movgt	r10, #1
	mvnle	r10, #0
	asr	r1, r1, #8
	mla	r3, lr, r1, r3
	asr	r1, r3, #9
	mls	r1, r10, r1, r2
	cmp	r1, #0
	movgt	r0, #1
	mvnle	r0, #0
	asr	r2, r2, #9
	mla	r3, r10, r2, r3
	str	lr, [sp, #16]
	asr	lr, r3, #10
	mls	lr, r0, lr, r1
	cmp	lr, #0
	mov	r2, r0
	movgt	r2, #1
	mvnle	r2, #0
	str	r10, [sp, #20]
	mov	r10, r2
	asr	r2, r1, #10
	mla	r2, r0, r2, r3
	asr	r1, r2, #11
	mls	r1, r10, r1, lr
	cmp	r1, #0
	mov	r3, r10
	movgt	r3, #1
	mvnle	r3, #0
	str	r3, [sp, #4]
	movw	r3, #:lower16:z_table
	str	r0, [sp, #24]
	asr	r0, lr, #11
	mla	r0, r10, r0, r2
	ldr	lr, [sp, #4]
	asr	r2, r0, #12
	mls	r2, lr, r2, r1
	cmp	r2, #0
	movgt	lr, #1
	mvnle	lr, #0
	movt	r3, #:upper16:z_table
	str	r10, [sp, #28]
	ldr	r10, [r3, #4]
	asr	r1, r1, #12
	mul	r10, r10, fp
	ldr	fp, [r3]
	mla	r10, fp, r8, r10
	ldr	r8, [r3, #8]
	ldr	fp, [sp, #4]
	mla	r10, r8, r7, r10
	mla	r1, fp, r1, r0
	ldr	r0, [r3, #12]
	mla	r10, r0, r6, r10
	ldr	r0, [r3, #16]
	asr	r6, r1, #13
	mla	r0, r0, r5, r10
	ldr	r5, [r3, #20]
	mls	r6, lr, r6, r2
	mla	r0, r5, ip, r0
	ldr	ip, [r3, #24]
	cmp	r6, #0
	mla	r0, ip, r9, r0
	ldr	ip, [r3, #28]
	ldr	r5, [sp, #16]
	mla	r0, ip, r4, r0
	movgt	ip, #1
	mvnle	ip, #0
	ldr	r4, [r3, #32]
	asr	r2, r2, #13
	mla	r2, lr, r2, r1
	mla	r1, r4, r5, r0
	ldr	r10, [sp, #20]
	ldr	r0, [r3, #36]
	ldr	r4, [sp, #24]
	mla	r1, r0, r10, r1
	ldr	r0, [r3, #40]
	ldr	r10, [sp, #28]
	mla	r1, r0, r4, r1
	ldr	r0, [r3, #44]
	ldr	r5, [r3, #56]
	mla	r1, r0, r10, r1
	ldr	r0, [r3, #48]
	asr	r4, r6, #14
	mla	r1, r0, fp, r1
	ldr	r0, [r3, #52]
	asr	r3, r2, #14
	mla	lr, r0, lr, r1
	mls	r6, ip, r3, r6
	mla	r5, r5, ip, lr
	mla	r4, ip, r4, r2
	bl	clock
	ldr	r3, [sp, #8]
	sub	r1, r0, r3
	movw	r0, #:lower16:.LC0
	movt	r0, #:upper16:.LC0
	bl	printf
	ldr	r3, [sp, #12]
	orr	r0, r4, r6, lsl #16
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
