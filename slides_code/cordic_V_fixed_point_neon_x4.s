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
	.file	"cordic_V_fixed_point_neon_x4.c"
	.text
	.align	2
	.global	cordic_V_fixed_point
	.arch armv7-a
	.syntax unified
	.arm
	.fpu neon
	.type	cordic_V_fixed_point, %function
cordic_V_fixed_point:
	@ args = 8, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldrsh	lr, [r1]
	vmov.i32	d17, #0  @ v4hi
	cmp	lr, #0
	movgt	r4, #1
	mvnle	r4, #0
	ldrsh	ip, [r3]
	vmov.16	d17[0], r4
	cmp	ip, #0
	movgt	r6, #1
	mvnle	r6, #0
	ldrsh	r5, [r0]
	ldrsh	r4, [r2]
	sub	sp, sp, #16
	strh	lr, [sp, #10]	@ movhi
	strh	lr, [sp]	@ movhi
	strh	ip, [sp, #14]	@ movhi
	strh	ip, [sp, #4]	@ movhi
	strh	r5, [sp, #8]	@ movhi
	strh	r5, [sp, #2]	@ movhi
	strh	r4, [sp, #12]	@ movhi
	strh	r4, [sp, #6]	@ movhi
	vldr	d18, [sp]
	vmov.16	d17[1], r6
	vldr	d16, [sp, #8]
	vmla.i16	d16, d18, d17
	vmov.s16	ip, d16[1]
	cmp	ip, #0
	movgt	ip, #1
	mvnle	ip, #0
	vmov	d24, d17  @ v4hi
	vmov.s16	lr, d16[3]
	vmov.16	d24[0], ip
	mvngt	ip, #0
	movle	ip, #1
	cmp	lr, #0
	vmov.16	d24[1], ip
	movgt	lr, #1
	mvnle	lr, #0
	mvngt	ip, #0
	movle	ip, #1
	vmov.16	d24[2], lr
	vrev32.16	d18, d16
	vmov.16	d24[3], ip
	vshr.s16	d18, d18, #1
	vmla.i16	d16, d18, d24
	vmov.s16	ip, d16[1]
	cmp	ip, #0
	movgt	ip, #1
	mvnle	ip, #0
	vmov	d25, d24  @ v4hi
	vmov.s16	lr, d16[3]
	vmov.16	d25[0], ip
	mvngt	ip, #0
	movle	ip, #1
	cmp	lr, #0
	vmov.16	d25[1], ip
	movgt	lr, #1
	mvnle	lr, #0
	mvngt	ip, #0
	movle	ip, #1
	vmov.16	d25[2], lr
	vrev32.16	d18, d16
	vmov.16	d25[3], ip
	vshr.s16	d18, d18, #2
	vmla.i16	d16, d18, d25
	vmov.s16	ip, d16[1]
	cmp	ip, #0
	movgt	ip, #1
	mvnle	ip, #0
	vmov	d26, d25  @ v4hi
	vmov.s16	lr, d16[3]
	vmov.16	d26[0], ip
	mvngt	ip, #0
	movle	ip, #1
	cmp	lr, #0
	vmov.16	d26[1], ip
	movgt	lr, #1
	mvnle	lr, #0
	mvngt	ip, #0
	movle	ip, #1
	vmov.16	d26[2], lr
	vrev32.16	d18, d16
	vmov.16	d26[3], ip
	vshr.s16	d18, d18, #3
	vmla.i16	d16, d18, d26
	vmov.s16	ip, d16[1]
	cmp	ip, #0
	movgt	ip, #1
	mvnle	ip, #0
	vmov	d27, d26  @ v4hi
	vmov.s16	lr, d16[3]
	vmov.16	d27[0], ip
	mvngt	ip, #0
	movle	ip, #1
	cmp	lr, #0
	vmov.16	d27[1], ip
	movgt	lr, #1
	mvnle	lr, #0
	mvngt	ip, #0
	movle	ip, #1
	vmov.16	d27[2], lr
	vrev32.16	d18, d16
	vmov.16	d27[3], ip
	vshr.s16	d18, d18, #4
	vmla.i16	d16, d18, d27
	vmov.s16	ip, d16[1]
	cmp	ip, #0
	movgt	ip, #1
	mvnle	ip, #0
	vmov	d28, d27  @ v4hi
	vmov.s16	lr, d16[3]
	vmov.16	d28[0], ip
	mvngt	ip, #0
	movle	ip, #1
	cmp	lr, #0
	vmov.16	d28[1], ip
	movgt	lr, #1
	mvnle	lr, #0
	mvngt	ip, #0
	movle	ip, #1
	vmov.16	d28[2], lr
	vrev32.16	d18, d16
	vmov.16	d28[3], ip
	vshr.s16	d18, d18, #5
	vmla.i16	d16, d18, d28
	vmov.s16	ip, d16[1]
	cmp	ip, #0
	movgt	ip, #1
	mvnle	ip, #0
	vmov	d29, d28  @ v4hi
	vmov.s16	lr, d16[3]
	vmov.16	d29[0], ip
	mvngt	ip, #0
	movle	ip, #1
	cmp	lr, #0
	vmov.16	d29[1], ip
	movgt	lr, #1
	mvnle	lr, #0
	mvngt	ip, #0
	movle	ip, #1
	vmov.16	d29[2], lr
	vrev32.16	d18, d16
	vmov.16	d29[3], ip
	vshr.s16	d18, d18, #6
	vmla.i16	d16, d18, d29
	vmov.s16	ip, d16[1]
	cmp	ip, #0
	movgt	ip, #1
	mvnle	ip, #0
	vmov	d23, d29  @ v4hi
	vmov.s16	lr, d16[3]
	vmov.16	d23[0], ip
	mvngt	ip, #0
	movle	ip, #1
	cmp	lr, #0
	vmov.16	d23[1], ip
	movgt	lr, #1
	mvnle	lr, #0
	mvngt	ip, #0
	movle	ip, #1
	vmov.16	d23[2], lr
	vrev32.16	d18, d16
	vmov.16	d23[3], ip
	vshr.s16	d18, d18, #7
	vmla.i16	d16, d18, d23
	vmov.s16	ip, d16[1]
	cmp	ip, #0
	movgt	ip, #1
	mvnle	ip, #0
	vmov	d22, d23  @ v4hi
	vmov.s16	lr, d16[3]
	vmov.16	d22[0], ip
	mvngt	ip, #0
	movle	ip, #1
	cmp	lr, #0
	vmov.16	d22[1], ip
	movgt	lr, #1
	mvnle	lr, #0
	mvngt	ip, #0
	movle	ip, #1
	vmov.16	d22[2], lr
	vrev32.16	d18, d16
	vmov.16	d22[3], ip
	vshr.s16	d18, d18, #8
	vmla.i16	d16, d18, d22
	vmov.s16	ip, d16[1]
	cmp	ip, #0
	movgt	ip, #1
	mvnle	ip, #0
	vmov	d21, d22  @ v4hi
	vmov.s16	lr, d16[3]
	vmov.16	d21[0], ip
	mvngt	ip, #0
	movle	ip, #1
	cmp	lr, #0
	vmov.16	d21[1], ip
	movgt	lr, #1
	mvnle	lr, #0
	mvngt	ip, #0
	movle	ip, #1
	vmov.16	d21[2], lr
	vrev32.16	d18, d16
	vmov.16	d21[3], ip
	vshr.s16	d18, d18, #9
	vmla.i16	d16, d18, d21
	vmov.s16	ip, d16[1]
	cmp	ip, #0
	movgt	ip, #1
	mvnle	ip, #0
	vmov	d20, d21  @ v4hi
	vmov.s16	lr, d16[3]
	vmov.16	d20[0], ip
	mvngt	ip, #0
	movle	ip, #1
	cmp	lr, #0
	vmov.16	d20[1], ip
	movgt	lr, #1
	mvnle	lr, #0
	mvngt	ip, #0
	movle	ip, #1
	vmov.16	d20[2], lr
	vrev32.16	d18, d16
	vmov.16	d20[3], ip
	vshr.s16	d18, d18, #10
	vmla.i16	d16, d18, d20
	vmov.s16	ip, d16[1]
	cmp	ip, #0
	movgt	ip, #1
	mvnle	ip, #0
	vmov	d19, d20  @ v4hi
	vmov.s16	lr, d16[3]
	vmov.16	d19[0], ip
	mvngt	ip, #0
	movle	ip, #1
	cmp	lr, #0
	vmov.16	d19[1], ip
	movgt	lr, #1
	mvnle	lr, #0
	mvngt	ip, #0
	movle	ip, #1
	vmov.16	d19[2], lr
	vrev32.16	d18, d16
	vmov.16	d19[3], ip
	vshr.s16	d18, d18, #11
	vmla.i16	d16, d18, d19
	vmov.s16	ip, d16[1]
	cmp	ip, #0
	movgt	ip, #1
	mvnle	ip, #0
	vmov	d18, d19  @ v4hi
	vmov.s16	lr, d16[3]
	vmov.16	d18[0], ip
	mvngt	ip, #0
	movle	ip, #1
	cmp	lr, #0
	vmov.16	d18[1], ip
	movgt	ip, #1
	mvnle	ip, #0
	mvngt	lr, #0
	movle	lr, #1
	vmov.16	d18[2], ip
	vrev32.16	d31, d16
	movw	ip, #:lower16:z_table
	vmov.16	d18[3], lr
	movt	ip, #:upper16:z_table
	vshr.s16	d31, d31, #12
	vld1.16	{d30}, [ip]
	vmla.i16	d16, d31, d18
	add	lr, ip, #2
	vmul.i16	d17, d30, d17
	vld1.16	{d30}, [lr]
	add	r4, ip, #4
	vmov.s16	lr, d16[1]
	vmla.i16	d17, d30, d24
	vld1.16	{d24}, [r4]
	cmp	lr, #0
	movgt	lr, #1
	mvnle	lr, #0
	add	r4, ip, #6
	vmla.i16	d17, d24, d25
	vmov	d24, d18  @ v4hi
	vld1.16	{d25}, [r4]
	vmov.s16	r4, d16[3]
	vmov.16	d24[0], lr
	add	r5, ip, #8
	mvngt	lr, #0
	movle	lr, #1
	vmla.i16	d17, d25, d26
	vld1.16	{d25}, [r5]
	cmp	r4, #0
	vmov.16	d24[1], lr
	add	r4, ip, #10
	movgt	lr, #1
	mvnle	lr, #0
	vld1.16	{d26}, [r4]
	vmla.i16	d17, d25, d27
	vmov.16	d24[2], lr
	add	r4, ip, #12
	mvngt	lr, #0
	movle	lr, #1
	vrev32.16	d25, d16
	vmla.i16	d17, d26, d28
	vld1.16	{d26}, [r4]
	vmov.16	d24[3], lr
	vshr.s16	d25, d25, #13
	add	lr, ip, #14
	vmla.i16	d17, d26, d29
	vld1.16	{d26}, [lr]
	vmla.i16	d16, d25, d24
	add	lr, ip, #16
	vmla.i16	d17, d26, d23
	vld1.16	{d23}, [lr]
	add	r4, ip, #18
	vmov.s16	lr, d16[1]
	vmla.i16	d17, d23, d22
	vld1.16	{d22}, [r4]
	cmp	lr, #0
	movgt	lr, #1
	mvnle	lr, #0
	vmla.i16	d17, d22, d21
	vmov	d21, d24  @ v4hi
	add	r4, ip, #20
	vmov.16	d21[0], lr
	vld1.16	{d22}, [r4]
	mvngt	lr, #0
	movle	lr, #1
	vmla.i16	d17, d22, d20
	vmov	d20, d21  @ v4hi
	vmov.s16	r4, d16[3]
	add	r5, ip, #22
	vmov.16	d20[1], lr
	vld1.16	{d22}, [r5]
	cmp	r4, #0
	movgt	lr, #1
	mvnle	lr, #0
	vmla.i16	d17, d22, d19
	vmov	d19, d20  @ v4hi
	add	r4, ip, #24
	vld1.16	{d21}, [r4]
	vmov.16	d19[2], lr
	vrev32.16	d20, d16
	mvngt	lr, #0
	movle	lr, #1
	vmla.i16	d17, d21, d18
	vmov	d18, d19  @ v4hi
	add	r4, ip, #26
	vld1.16	{d21}, [r4]
	vmov.16	d18[3], lr
	vshr.s16	d19, d20, #14
	add	ip, ip, #28
	vld1.16	{d20}, [ip]
	vmla.i16	d16, d19, d18
	vmla.i16	d17, d21, d24
	vmov.s16	r4, d16[0]
	vmla.i16	d17, d20, d18
	vmov.s16	r8, d16[1]
	vmov.s16	r7, d16[2]
	vmov.s16	lr, d16[3]
	vmov.s16	r6, d17[0]
	vmov.s16	ip, d17[2]
	str	r4, [r0]
	mov	r0, #0
	ldr	r5, [sp, #40]
	ldr	r4, [sp, #44]
	str	r8, [r1]
	str	r7, [r2]
	str	lr, [r3]
	str	r6, [r5]
	str	ip, [r4]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
	.size	cordic_V_fixed_point, .-cordic_V_fixed_point
	.comm	z_table,30,4
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
