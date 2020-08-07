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
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	vpush.64	{d8}
	mov	r5, r0
	sub	sp, sp, #12
	mov	r4, r1
	bl	clock
	uxth	r3, r5
	lsr	r5, r5, #16
	stm	sp, {r3, r5}
	mov	r6, r0
	vldr	d8, [sp]
	mov	r0, #0
	vrev64.32	d16, d8
	mov	r5, r0
	ldr	lr, .L8
.L3:
	vmov.32	r2, d16[0]
	vmov.32	r1, d8[1]
	asr	r2, r2, r0
	vmov.32	r3, d16[1]
	vmov.32	d16[0], r2
	cmp	r1, #0
	movgt	ip, #1
	mvnle	ip, #0
	asr	r3, r3, r0
	vmov.32	d16[1], r3
	mvngt	r1, #0
	movle	r1, #1
	mul	r7, ip, r2
	mul	r2, r2, r7
	vmov.32	d16[0], r2
	mul	r2, r1, r3
	mul	r3, r3, r2
	vmov.32	d16[1], r3
	vadd.i32	d8, d8, d16
	ldr	r3, [lr, #4]!
	add	r0, r0, #1
	cmp	r0, #15
	mla	r5, r3, ip, r5
	vrev64.32	d16, d8
	bne	.L3
	bl	clock
	sub	r1, r0, r6
	movw	r0, #:lower16:.LC0
	movt	r0, #:upper16:.LC0
	bl	printf
	vmov.32	r0, d8[1]
	vmov.32	r3, d8[0]
	orr	r0, r3, r0, lsl #16
	str	r5, [r4]
	add	sp, sp, #12
	@ sp needed
	vldm	sp!, {d8}
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
	.ascii	"Execution time: %ld \012\000"
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
