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
	.file	"cordic_V_fixed_point_pipelined.c"
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
	str	r1, [sp, #24]
	bl	clock
	uxth	r1, r4
	str	r0, [sp, #4]
	lsrs	r0, r4, #16
	movne	r3, r1
	rsbeq	r3, r1, #0
	sub	r3, r0, r3
	mvneq	r2, #0
	movne	r2, #1
	cmp	r3, #0
	movgt	fp, #1
	mvnle	fp, #0
	add	r1, r1, r0
	str	r2, [sp]
	asr	r2, r1, #1
	mls	r2, fp, r2, r3
	cmp	r2, #0
	movgt	r9, #1
	mvnle	r9, #0
	asr	r0, r3, #1
	mla	r1, fp, r0, r1
	asr	r3, r1, #2
	mls	r3, r9, r3, r2
	cmp	r3, #0
	movgt	r8, #1
	mvnle	r8, #0
	asr	r0, r2, #2
	mla	r0, r9, r0, r1
	asr	r1, r0, #3
	mls	r1, r8, r1, r3
	cmp	r1, #0
	movgt	r7, #1
	mvnle	r7, #0
	asr	r3, r3, #3
	mla	r0, r8, r3, r0
	asr	r3, r0, #4
	mls	r3, r7, r3, r1
	cmp	r3, #0
	movgt	r2, #1
	mvnle	r2, #0
	asr	r1, r1, #4
	mla	r0, r7, r1, r0
	asr	r1, r0, #5
	mls	r1, r2, r1, r3
	cmp	r1, #0
	movgt	ip, #1
	mvnle	ip, #0
	asr	r3, r3, #5
	mla	r0, r2, r3, r0
	asr	r4, r0, #6
	mls	r4, ip, r4, r1
	cmp	r4, #0
	movgt	lr, #1
	mvnle	lr, #0
	asr	r1, r1, #6
	mla	r0, ip, r1, r0
	str	ip, [sp, #8]
	asr	ip, r0, #7
	mls	ip, lr, ip, r4
	mov	r1, lr
	cmp	ip, #0
	movgt	r5, #1
	mvnle	r5, #0
	asr	lr, r4, #7
	mla	r0, r1, lr, r0
	asr	r4, r0, #8
	mls	r4, r5, r4, ip
	mov	lr, r5
	cmp	r4, #0
	movgt	r5, #1
	mvnle	r5, #0
	asr	r3, ip, #8
	str	lr, [sp, #16]
	mla	lr, lr, r3, r0
	asr	r0, lr, #9
	mls	r0, r5, r0, r4
	cmp	r0, #0
	movgt	r6, #1
	mvnle	r6, #0
	str	r1, [sp, #12]
	asr	r1, r4, #9
	mla	r3, r5, r1, lr
	asr	lr, r3, #10
	mls	lr, r6, lr, r0
	cmp	lr, #0
	str	r5, [sp, #20]
	movgt	r5, #1
	mvnle	r5, #0
	asr	ip, r0, #10
	mla	r1, r6, ip, r3
	asr	r0, r1, #11
	mls	r0, r5, r0, lr
	cmp	r0, #0
	movgt	r4, #1
	mvnle	r4, #0
	movw	r3, #:lower16:z_table
	asr	ip, lr, #11
	mla	ip, r5, ip, r1
	asr	r1, ip, #12
	mls	r1, r4, r1, r0
	cmp	r1, #0
	movgt	lr, #1
	mvnle	lr, #0
	movt	r3, #:upper16:z_table
	ldr	r10, [r3, #4]
	asr	r0, r0, #12
	mul	r10, r10, fp
	str	r0, [sp, #28]
	ldr	fp, [r3]
	ldr	r0, [sp]
	mla	r10, fp, r0, r10
	ldr	fp, [r3, #8]
	ldr	r0, [sp, #28]
	mla	r10, fp, r9, r10
	ldr	r9, [r3, #12]
	mla	r0, r4, r0, ip
	mla	r10, r9, r8, r10
	ldr	r9, [r3, #16]
	ldr	ip, [sp, #12]
	mla	r10, r9, r7, r10
	ldr	r9, [r3, #20]
	asr	r7, r0, #13
	mls	r7, lr, r7, r1
	mla	r9, r9, r2, r10
	ldr	r10, [r3, #24]
	ldr	r2, [sp, #8]
	cmp	r7, #0
	movgt	r8, #1
	mvnle	r8, #0
	mla	r9, r10, r2, r9
	ldr	r2, [r3, #28]
	asr	r1, r1, #13
	mla	r9, r2, ip, r9
	ldr	r2, [r3, #32]
	ldr	ip, [sp, #16]
	mla	r0, lr, r1, r0
	mla	r9, r2, ip, r9
	ldr	r1, [sp, #20]
	ldr	r2, [r3, #36]
	mla	r9, r2, r1, r9
	ldr	r2, [r3, #40]
	mla	r6, r2, r6, r9
	ldr	r2, [r3, #44]
	mla	r5, r2, r5, r6
	ldr	r6, [r3, #48]
	ldr	r2, [r3, #56]
	mla	r4, r6, r4, r5
	ldr	r5, [r3, #52]
	asr	r3, r0, #14
	mla	lr, r5, lr, r4
	asr	r5, r7, #14
	mla	r4, r2, r8, lr
	mls	r7, r8, r3, r7
	mla	r5, r8, r5, r0
	bl	clock
	ldr	r3, [sp, #4]
	sub	r1, r0, r3
	movw	r0, #:lower16:.LC0
	movt	r0, #:upper16:.LC0
	bl	printf
	ldr	r3, [sp, #24]
	orr	r0, r5, r7, lsl #16
	str	r4, [r3]
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
	.size	cordic_V_fixed_point, .-cordic_V_fixed_point
	.comm	z_table,60,4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Execution time for cordic: %ld \012\000"
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
