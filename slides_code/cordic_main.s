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
	.file	"cordic_main.c"
	.text
	.align	2
	.global	verify
	.arch armv7-a
	.syntax unified
	.arm
	.fpu neon
	.type	verify, %function
verify:
	@ args = 8, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	vmov	s15, r0	@ int
	push	{r4, r5, lr}
	vpush.64	{d8, d9, d10}
	vldr.64	d9, .L6
	vcvt.f64.s32	d10, s15
	vmov	s15, r1	@ int
	sub	sp, sp, #20
	strd	r0, [sp]
	vmul.f64	d10, d10, d9
	movw	r0, #:lower16:.LC0
	vcvt.f64.s32	d8, s15
	strd	r2, [sp, #8]
	ldr	r1, [sp]
	vmov	r2, r3, d10
	movt	r0, #:upper16:.LC0
	vmul.f64	d8, d8, d9
	ldr	r5, [sp, #56]
	ldr	r4, [sp, #60]
	bl	printf
	movw	r0, #:lower16:.LC1
	vmov	r2, r3, d8
	ldr	r1, [sp, #4]
	movt	r0, #:upper16:.LC1
	bl	printf
	vldr.32	s15, [sp, #8]	@ int
	vcvt.f64.s32	d16, s15
	movw	r0, #:lower16:.LC2
	vmul.f64	d16, d16, d9
	vmov	r1, s15	@ int
	vmov	r2, r3, d16
	movt	r0, #:upper16:.LC2
	bl	printf
	vldr.32	s15, [sp, #12]	@ int
	vcvt.f64.s32	d16, s15
	movw	r0, #:lower16:.LC3
	vmul.f64	d16, d16, d9
	vmov	r1, s15	@ int
	vmov	r2, r3, d16
	movt	r0, #:upper16:.LC3
	bl	printf
	vmov	s15, r5	@ int
	vcvt.f64.s32	d16, s15
	movw	r0, #:lower16:.LC4
	vmul.f64	d16, d16, d9
	mov	r1, r5
	vmov	r2, r3, d16
	movt	r0, #:upper16:.LC4
	bl	printf
	vmov	s15, r4	@ int
	vcvt.f64.s32	d16, s15
	movw	r0, #:lower16:.LC5
	vmul.f64	d16, d16, d9
	mov	r1, r4
	vmov	r2, r3, d16
	movt	r0, #:upper16:.LC5
	bl	printf
	vmul.f64	d8, d8, d8
	vmla.f64	d8, d10, d10
	vcmp.f64	d8, #0
	vmrs	APSR_nzcv, FPSCR
	vsqrt.f64	d9, d8
	bmi	.L5
.L2:
	movw	r0, #:lower16:.LC6
	vmov	r2, r3, d9
	movt	r0, #:upper16:.LC6
	add	sp, sp, #20
	@ sp needed
	vldm	sp!, {d8-d10}
	pop	{r4, r5, lr}
	b	printf
.L5:
	vmov.f64	d0, d8
	bl	sqrt
	b	.L2
.L7:
	.align	3
.L6:
	.word	0
	.word	1056964608
	.size	verify, .-verify
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu neon
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r0, #:lower16:.LC7
	str	lr, [sp, #-4]!
	movt	r0, #:upper16:.LC7
	sub	sp, sp, #20
	bl	puts
	movw	r0, #27852
	add	r1, sp, #12
	movt	r0, 24903
	bl	cordic_V_fixed_point
	ldr	r2, [sp, #12]
	lsr	r3, r0, #16
	str	r3, [sp]
	str	r2, [sp, #4]
	uxth	r3, r0
	movw	r2, #23906
	movw	r1, #24903
	movw	r0, #27852
	bl	verify
	add	sp, sp, #20
	@ sp needed
	ldr	pc, [sp], #4
	.size	main, .-main
	.global	z_table
	.data
	.align	3
	.type	z_table, %object
	.size	z_table, 60
z_table:
	.word	25735
	.word	15192
	.word	8027
	.word	4074
	.word	2045
	.word	1023
	.word	511
	.word	255
	.word	127
	.word	63
	.word	31
	.word	15
	.word	7
	.word	3
	.word	1
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"x_i_init = %5i\011x_d_init = %f\012\000"
	.space	2
.LC1:
	.ascii	"y_i_init = %5i\011y_d_init = %f\012\000"
	.space	2
.LC2:
	.ascii	"z_i_init = %5i\011z_d_init = %f (rad)\012\012\000"
	.space	3
.LC3:
	.ascii	"x_i_calc = %5i\011x_d_calc = %f\012\000"
	.space	2
.LC4:
	.ascii	"y_i_calc = %5i\011y_d_calc = %f\012\000"
	.space	2
.LC5:
	.ascii	"z_i_calc = %5i\011z_d_calc = %f (rad)\012\012\000"
	.space	3
.LC6:
	.ascii	"Modulus = SQRT(x_d_init^2 + y_d_init^2) = %f\012\000"
	.space	2
.LC7:
	.ascii	"Vectoring CORDIC:\012\000"
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
