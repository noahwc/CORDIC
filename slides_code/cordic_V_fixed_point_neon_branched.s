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
	.file	"cordic_V_fixed_point_neon_branched.c"
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
	str	lr, [sp, #-4]!
	lsr	r3, r0, #16
	sub	sp, sp, #12
	uxth	r0, r0
	str	r3, [sp]
	str	r0, [sp, #4]
	vldr	d18, [sp]
	vmov	d16, d18  @ v2si
	vmov.32	d16[0], r3
	rsb	r0, r0, #0
	cmp	r3, #0
	vmov.32	d16[1], r0
	vrev64.32	d18, d18
	movw	r3, #:lower16:z_table
	ble	.L34
	vadd.i32	d16, d18, d16
	movt	r3, #:upper16:z_table
	ldr	r2, [r3]
.L3:
	vmov.32	ip, d16[1]
	vrev64.32	d19, d16
	vmov.32	r0, d16[0]
	asr	lr, ip, #1
	vmov.32	d19[0], lr
	rsb	r0, r0, #0
	asr	r0, r0, #1
	cmp	ip, #0
	vmov.32	d19[1], r0
	ble	.L35
	vadd.i32	d16, d16, d19
	ldr	r0, [r3, #4]
	add	r2, r2, r0
.L5:
	vmov.32	ip, d16[1]
	vrev64.32	d18, d16
	vmov.32	r0, d16[0]
	asr	lr, ip, #2
	vmov.32	d18[0], lr
	rsb	r0, r0, #0
	asr	r0, r0, #2
	cmp	ip, #0
	vmov.32	d18[1], r0
	ble	.L36
	vadd.i32	d16, d16, d18
	ldr	r0, [r3, #8]
	add	r2, r2, r0
.L7:
	vmov.32	ip, d16[1]
	vrev64.32	d17, d16
	vmov.32	r0, d16[0]
	asr	lr, ip, #3
	vmov.32	d17[0], lr
	rsb	r0, r0, #0
	asr	r0, r0, #3
	cmp	ip, #0
	vmov.32	d17[1], r0
	ble	.L37
	vadd.i32	d17, d16, d17
	ldr	r0, [r3, #12]
	add	r2, r2, r0
.L9:
	vmov.32	ip, d17[1]
	vrev64.32	d16, d17
	vmov.32	r0, d17[0]
	asr	lr, ip, #4
	vmov.32	d16[0], lr
	rsb	r0, r0, #0
	asr	r0, r0, #4
	cmp	ip, #0
	vmov.32	d16[1], r0
	ble	.L38
	vadd.i32	d16, d17, d16
	ldr	r0, [r3, #16]
	add	r2, r2, r0
.L11:
	vmov.32	ip, d16[1]
	vrev64.32	d19, d16
	vmov.32	r0, d16[0]
	asr	lr, ip, #5
	vmov.32	d19[0], lr
	rsb	r0, r0, #0
	asr	r0, r0, #5
	cmp	ip, #0
	vmov.32	d19[1], r0
	ble	.L39
	vadd.i32	d16, d16, d19
	ldr	r0, [r3, #20]
	add	r2, r2, r0
.L13:
	vmov.32	ip, d16[1]
	vrev64.32	d18, d16
	vmov.32	r0, d16[0]
	asr	lr, ip, #6
	vmov.32	d18[0], lr
	rsb	r0, r0, #0
	asr	r0, r0, #6
	cmp	ip, #0
	vmov.32	d18[1], r0
	ble	.L40
	vadd.i32	d16, d16, d18
	ldr	r0, [r3, #24]
	add	r2, r2, r0
.L15:
	vmov.32	ip, d16[1]
	vrev64.32	d17, d16
	vmov.32	r0, d16[0]
	asr	lr, ip, #7
	vmov.32	d17[0], lr
	rsb	r0, r0, #0
	asr	r0, r0, #7
	cmp	ip, #0
	vmov.32	d17[1], r0
	ble	.L41
	vadd.i32	d17, d16, d17
	ldr	r0, [r3, #28]
	add	r2, r2, r0
.L17:
	vmov.32	ip, d17[1]
	vrev64.32	d16, d17
	vmov.32	r0, d17[0]
	asr	lr, ip, #8
	vmov.32	d16[0], lr
	rsb	r0, r0, #0
	asr	r0, r0, #8
	cmp	ip, #0
	vmov.32	d16[1], r0
	ble	.L42
	vadd.i32	d17, d17, d16
	ldr	r0, [r3, #32]
	add	r2, r2, r0
.L19:
	vmov.32	ip, d17[1]
	vrev64.32	d19, d17
	vmov.32	r0, d17[0]
	asr	lr, ip, #9
	vmov.32	d19[0], lr
	rsb	r0, r0, #0
	asr	r0, r0, #9
	cmp	ip, #0
	vmov.32	d19[1], r0
	ble	.L43
	vadd.i32	d17, d17, d19
	ldr	r0, [r3, #36]
	add	r2, r2, r0
.L21:
	vmov.32	ip, d17[1]
	vrev64.32	d18, d17
	vmov.32	r0, d17[0]
	asr	lr, ip, #10
	vmov.32	d18[0], lr
	rsb	r0, r0, #0
	asr	r0, r0, #10
	cmp	ip, #0
	vmov.32	d18[1], r0
	ble	.L44
	vadd.i32	d18, d17, d18
	ldr	r0, [r3, #40]
	add	r2, r2, r0
.L23:
	vmov.32	ip, d18[1]
	vrev64.32	d17, d18
	vmov.32	r0, d18[0]
	asr	lr, ip, #11
	vmov.32	d17[0], lr
	rsb	r0, r0, #0
	asr	r0, r0, #11
	cmp	ip, #0
	vmov.32	d17[1], r0
	ble	.L45
	vadd.i32	d18, d18, d17
	ldr	r0, [r3, #44]
	add	r2, r2, r0
.L25:
	vmov.32	ip, d18[1]
	vrev64.32	d16, d18
	vmov.32	r0, d18[0]
	asr	lr, ip, #12
	vmov.32	d16[0], lr
	rsb	r0, r0, #0
	asr	r0, r0, #12
	cmp	ip, #0
	vmov.32	d16[1], r0
	ble	.L46
	vadd.i32	d18, d18, d16
	ldr	r0, [r3, #48]
	add	r2, r2, r0
.L27:
	vmov.32	ip, d18[1]
	vrev64.32	d16, d18
	vmov.32	r0, d18[0]
	asr	lr, ip, #13
	vmov.32	d16[0], lr
	rsb	r0, r0, #0
	asr	r0, r0, #13
	cmp	ip, #0
	vmov.32	d16[1], r0
	ble	.L47
	vadd.i32	d16, d18, d16
	ldr	r0, [r3, #52]
	add	r2, r2, r0
.L29:
	vmov.32	ip, d16[1]
	vrev64.32	d17, d16
	vmov.32	r0, d16[0]
	asr	lr, ip, #14
	vmov.32	d17[0], lr
	rsb	r0, r0, #0
	asr	r0, r0, #14
	cmp	ip, #0
	vmov.32	d17[1], r0
	ble	.L30
	vadd.i32	d16, d17, d16
	ldr	r3, [r3, #56]
	add	r2, r2, r3
.L31:
	vmov.32	r0, d16[1]
	vmov.32	r3, d16[0]
	orr	r0, r3, r0, lsl #16
	str	r2, [r1]
	add	sp, sp, #12
	@ sp needed
	ldr	pc, [sp], #4
.L34:
	movt	r3, #:upper16:z_table
	ldr	r2, [r3]
	vsub.i32	d16, d18, d16
	rsb	r2, r2, #0
	b	.L3
.L30:
	ldr	r3, [r3, #56]
	vsub.i32	d16, d16, d17
	sub	r2, r2, r3
	b	.L31
.L47:
	ldr	r0, [r3, #52]
	vsub.i32	d16, d18, d16
	sub	r2, r2, r0
	b	.L29
.L46:
	ldr	r0, [r3, #48]
	vsub.i32	d18, d18, d16
	sub	r2, r2, r0
	b	.L27
.L45:
	ldr	r0, [r3, #44]
	vsub.i32	d18, d18, d17
	sub	r2, r2, r0
	b	.L25
.L44:
	ldr	r0, [r3, #40]
	vsub.i32	d18, d17, d18
	sub	r2, r2, r0
	b	.L23
.L43:
	ldr	r0, [r3, #36]
	vsub.i32	d17, d17, d19
	sub	r2, r2, r0
	b	.L21
.L42:
	ldr	r0, [r3, #32]
	vsub.i32	d17, d17, d16
	sub	r2, r2, r0
	b	.L19
.L41:
	ldr	r0, [r3, #28]
	vsub.i32	d17, d16, d17
	sub	r2, r2, r0
	b	.L17
.L40:
	ldr	r0, [r3, #24]
	vsub.i32	d16, d16, d18
	sub	r2, r2, r0
	b	.L15
.L39:
	ldr	r0, [r3, #20]
	vsub.i32	d16, d16, d19
	sub	r2, r2, r0
	b	.L13
.L38:
	ldr	r0, [r3, #16]
	vsub.i32	d16, d17, d16
	sub	r2, r2, r0
	b	.L11
.L37:
	ldr	r0, [r3, #12]
	vsub.i32	d17, d16, d17
	sub	r2, r2, r0
	b	.L9
.L36:
	ldr	r0, [r3, #8]
	vsub.i32	d16, d16, d18
	sub	r2, r2, r0
	b	.L7
.L35:
	ldr	r0, [r3, #4]
	vsub.i32	d16, d16, d19
	sub	r2, r2, r0
	b	.L5
	.size	cordic_V_fixed_point, .-cordic_V_fixed_point
	.comm	z_table,60,4
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
