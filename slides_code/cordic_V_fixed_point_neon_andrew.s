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
	.file	"cordic_V_fixed_point_neon_andrew.c"
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
	push	{r4, r5, r6, r7, lr}
	sub	sp, sp, #28
	mov	r7, r0
	mov	r4, r1
	mov	r5, #0
	bl	clock
	mov	ip, r5
	mov	r6, r0
	uxth	r3, r7
	ldr	r1, .L8
	lsr	r7, r7, #16
	str	r3, [sp]
	str	r7, [sp, #4]
.L3:
	ldr	r3, [sp, #4]
	ldr	r2, [sp, #4]
	cmp	r3, #0
	movgt	r3, #1
	mvnle	r3, #0
	asr	r2, r2, ip
	mul	r2, r3, r2
	str	r2, [sp, #8]
	ldr	r2, [sp]
	ldr	r0, [r1, #4]!
	asr	r2, r2, ip
	mla	r5, r0, r3, r5
	mul	r3, r3, r2
	str	r3, [sp, #12]
	add	r3, sp, #8
	vld1.32	{d17}, [sp:64]
	vld1.32	{d16}, [r3:64]
	vadd.i32	d16, d16, d17
	add	r3, sp, #16
	vst1.32	{d16}, [r3:64]
	add	r3, sp, #4
	vld1.32	{d16}, [r3]
	add	r3, sp, #12
	vld1.32	{d17}, [r3]
	vsub.i32	d16, d16, d17
	add	r3, sp, #20
	vst1.32	{d16}, [r3]
	ldr	r3, [sp, #16]
	add	ip, ip, #1
	str	r3, [sp]
	ldr	r3, [sp, #20]
	cmp	ip, #15
	str	r3, [sp, #4]
	bne	.L3
	bl	clock
	sub	r1, r0, r6
	movw	r0, #:lower16:.LC0
	movt	r0, #:upper16:.LC0
	bl	printf
	ldr	r0, [sp, #4]
	ldr	r3, [sp]
	str	r5, [r4]
	orr	r0, r3, r0, lsl #16
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L9:
	.align	2
.L8:
	.word	z_table-4
	.size	cordic_V_fixed_point, .-cordic_V_fixed_point
	.comm	z_table,60,4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Execution time for cordic: %ld \012\000"
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
