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
	.file	"cordic_V_fixed_point_clean.c"
	.text
	.align	2
	.global	cordic_V_fixed_point
	.arch armv7-a
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	cordic_V_fixed_point, %function
cordic_V_fixed_point:
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	sub	sp, sp, #60
	mov	r4, r0
	str	r1, [sp, #52]
	bl	clock
	movw	r3, #:lower16:z_table
	movw	r2, #34464
	movt	r3, #:upper16:z_table
	str	r0, [sp, #48]
	ldrd	r0, [r3, #28]
	str	r1, [sp]
	ldr	r1, [r3, #36]
	ldr	r5, [r3]
	str	r1, [sp, #4]
	ldr	r1, [r3, #40]
	ldr	r10, [r3, #4]
	str	r1, [sp, #8]
	ldr	r1, [r3, #44]
	ldr	r9, [r3, #8]
	str	r1, [sp, #12]
	ldr	r1, [r3, #48]
	ldr	r8, [r3, #12]
	ldr	r7, [r3, #16]
	ldr	lr, [r3, #20]
	ldr	ip, [r3, #24]
	str	r1, [sp, #16]
	ldr	r1, [r3, #52]
	ldr	r3, [r3, #56]
	str	r1, [sp, #20]
	str	r3, [sp, #24]
	lsr	r1, r4, #16
	uxth	r3, r4
	rsb	r4, r5, #0
	str	r3, [sp, #40]
	str	r4, [sp, #44]
	add	r4, r1, r3
	sub	r3, r1, r3
	str	r5, [sp, #28]
	str	r4, [sp, #32]
	str	r3, [sp, #36]
	movt	r2, 1
.L31:
	cmp	r1, #0
	ldreq	r4, [sp, #40]
	ldrne	r3, [sp, #36]
	moveq	r3, r4
	ldrne	r4, [sp, #32]
	asr	fp, r3, #1
	asr	r6, r4, #1
	ldreq	r5, [sp, #44]
	ldrne	r5, [sp, #28]
	cmp	r3, #0
	addle	r3, r6, r3
	subgt	r3, r3, r6
	suble	r4, r4, fp
	addgt	r4, fp, r4
	asr	r6, r4, #2
	asr	fp, r3, #2
	suble	r5, r5, r10
	addgt	r5, r10, r5
	cmp	r3, #0
	addle	r3, r6, r3
	subgt	r3, r3, r6
	suble	r4, r4, fp
	addgt	r4, fp, r4
	asr	r6, r4, #3
	asr	fp, r3, #3
	suble	r5, r5, r9
	addgt	r5, r9, r5
	cmp	r3, #0
	addle	r3, r6, r3
	subgt	r3, r3, r6
	suble	r4, r4, fp
	addgt	r4, fp, r4
	asr	r6, r4, #4
	asr	fp, r3, #4
	suble	r5, r5, r8
	addgt	r5, r8, r5
	cmp	r3, #0
	addle	r3, r6, r3
	subgt	r3, r3, r6
	suble	r4, r4, fp
	addgt	r4, fp, r4
	asr	r6, r4, #5
	asr	fp, r3, #5
	suble	r5, r5, r7
	addgt	r5, r7, r5
	cmp	r3, #0
	addle	r3, r6, r3
	subgt	r3, r3, r6
	suble	r4, r4, fp
	addgt	r4, fp, r4
	asr	r6, r4, #6
	asr	fp, r3, #6
	suble	r5, r5, lr
	addgt	r5, r5, lr
	cmp	r3, #0
	addle	r3, r6, r3
	subgt	r3, r3, r6
	suble	r4, r4, fp
	addgt	r4, fp, r4
	asr	r6, r4, #7
	asr	fp, r3, #7
	suble	r5, r5, ip
	addgt	r5, r5, ip
	cmp	r3, #0
	addle	r3, r6, r3
	subgt	r3, r3, r6
	suble	r4, r4, fp
	addgt	r4, fp, r4
	asr	r6, r4, #8
	suble	r5, r5, r0
	addgt	r5, r5, r0
	cmp	r3, #0
	asr	fp, r3, #8
	addle	r3, r3, r6
	subgt	r3, r3, r6
	ldrle	r6, [sp]
	ldrgt	r6, [sp]
	suble	r4, r4, fp
	addgt	r4, r4, fp
	suble	r5, r5, r6
	addgt	r5, r5, r6
	cmp	r3, #0
	asr	r6, r4, #9
	asr	fp, r3, #9
	addle	r3, r3, r6
	subgt	r3, r3, r6
	ldrle	r6, [sp, #4]
	ldrgt	r6, [sp, #4]
	suble	r4, r4, fp
	addgt	r4, r4, fp
	suble	r5, r5, r6
	addgt	r5, r5, r6
	cmp	r3, #0
	asr	r6, r4, #10
	asr	fp, r3, #10
	addle	r3, r3, r6
	subgt	r3, r3, r6
	ldrle	r6, [sp, #8]
	ldrgt	r6, [sp, #8]
	suble	r4, r4, fp
	addgt	r4, r4, fp
	suble	r5, r5, r6
	addgt	r5, r5, r6
	cmp	r3, #0
	asr	r6, r4, #11
	asr	fp, r3, #11
	addle	r3, r3, r6
	subgt	r3, r3, r6
	ldrle	r6, [sp, #12]
	ldrgt	r6, [sp, #12]
	suble	r4, r4, fp
	addgt	r4, r4, fp
	suble	r5, r5, r6
	addgt	r5, r5, r6
	cmp	r3, #0
	asr	r6, r4, #12
	asr	fp, r3, #12
	addle	r3, r3, r6
	subgt	r3, r3, r6
	ldrle	r6, [sp, #16]
	ldrgt	r6, [sp, #16]
	suble	r4, r4, fp
	addgt	r4, r4, fp
	suble	r5, r5, r6
	addgt	r5, r5, r6
	cmp	r3, #0
	asr	r6, r4, #13
	asr	fp, r3, #13
	addle	r3, r3, r6
	subgt	r3, r3, r6
	ldrle	r6, [sp, #20]
	ldrgt	r6, [sp, #20]
	suble	r4, r4, fp
	addgt	r4, r4, fp
	suble	r5, r5, r6
	addgt	r5, r5, r6
	cmp	r3, #0
	asr	r6, r3, #14
	asr	fp, r4, #14
	suble	r6, r4, r6
	addgt	r6, r4, r6
	ldrle	r4, [sp, #24]
	ldrgt	r4, [sp, #24]
	addle	r3, r3, fp
	suble	r5, r5, r4
	subgt	r3, r3, fp
	addgt	r5, r5, r4
	subs	r2, r2, #1
	bne	.L31
	mov	r4, r3
	bl	clock
	ldr	r3, [sp, #48]
	sub	r1, r0, r3
	movw	r0, #:lower16:.LC0
	movt	r0, #:upper16:.LC0
	bl	printf
	ldr	r3, [sp, #52]
	orr	r0, r6, r4, lsl #16
	str	r5, [r3]
	add	sp, sp, #60
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
