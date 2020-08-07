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
	push	{r4, r5, r6, lr}
	vpush.64	{d8}
	sub	sp, sp, #8
	mov	r4, r0
	mov	r5, r1
	bl	clock
	uxth	r3, r4
	mov	r6, r0
	lsr	r0, r4, #16
	str	r3, [sp]
	str	r0, [sp, #4]
	vldr	d16, [sp]
	cmp	r0, #0
	vrev64.32	d17, d16
	beq	.L34
	mov	ip, #1
	vldr	d18, .L49
.L2:
	vmov.32	d17[0], r0
	vmov.32	d17[1], r3
	vmla.i32	d16, d17, d18
	movw	r3, #:lower16:z_table
	vmov.32	r2, d16[1]
	movt	r3, #:upper16:z_table
	ldr	r1, [r3]
	cmp	r2, #0
	vrev64.32	d17, d16
	mul	r1, r1, ip
	ble	.L35
	mov	r4, #1
	vldr	d18, .L49
.L3:
	vmov.32	r0, d16[0]
	asr	r2, r2, #1
	vmov.32	d17[0], r2
	asr	r2, r0, #1
	vmov.32	d17[1], r2
	vmla.i32	d16, d17, d18
	vmov.32	r2, d16[1]
	ldr	r0, [r3, #4]
	cmp	r2, #0
	vrev64.32	d17, d16
	mla	r0, r0, r4, r1
	ble	.L36
	mov	r4, #1
	vldr	d18, .L49
.L4:
	vmov.32	r1, d16[0]
	asr	r2, r2, #2
	vmov.32	d17[0], r2
	asr	r2, r1, #2
	vmov.32	d17[1], r2
	vmla.i32	d16, d17, d18
	vmov.32	r2, d16[1]
	ldr	r1, [r3, #8]
	cmp	r2, #0
	vrev64.32	d17, d16
	mla	r4, r1, r4, r0
	ble	.L37
	mov	r0, #1
	vldr	d18, .L49
.L5:
	vmov.32	r1, d16[0]
	asr	r2, r2, #3
	vmov.32	d17[0], r2
	asr	r2, r1, #3
	vmov.32	d17[1], r2
	vmla.i32	d16, d17, d18
	vmov.32	r2, d16[1]
	ldr	r1, [r3, #12]
	cmp	r2, #0
	vrev64.32	d17, d16
	mla	r4, r1, r0, r4
	ble	.L38
	mov	r0, #1
	vldr	d18, .L49
.L6:
	vmov.32	r1, d16[0]
	asr	r2, r2, #4
	vmov.32	d17[0], r2
	asr	r2, r1, #4
	vmov.32	d17[1], r2
	vmla.i32	d16, d17, d18
	vmov.32	r2, d16[1]
	ldr	r1, [r3, #16]
	cmp	r2, #0
	vrev64.32	d17, d16
	mla	r0, r1, r0, r4
	ble	.L39
	mov	r4, #1
	vldr	d18, .L49
.L7:
	vmov.32	r1, d16[0]
	asr	r2, r2, #5
	vmov.32	d17[0], r2
	asr	r2, r1, #5
	vmov.32	d17[1], r2
	vmla.i32	d16, d17, d18
	vmov.32	r2, d16[1]
	ldr	r1, [r3, #20]
	cmp	r2, #0
	vrev64.32	d17, d16
	mla	r0, r1, r4, r0
	ble	.L40
	mov	r4, #1
	vldr	d18, .L49
.L8:
	vmov.32	r1, d16[0]
	asr	r2, r2, #6
	vmov.32	d17[0], r2
	asr	r2, r1, #6
	vmov.32	d17[1], r2
	vmla.i32	d16, d17, d18
	vmov.32	r2, d16[1]
	ldr	r1, [r3, #24]
	cmp	r2, #0
	vrev64.32	d17, d16
	mla	r4, r1, r4, r0
	ble	.L41
	mov	r0, #1
	vldr	d18, .L49
.L9:
	vmov.32	r1, d16[0]
	asr	r2, r2, #7
	vmov.32	d17[0], r2
	asr	r2, r1, #7
	vmov.32	d17[1], r2
	vmla.i32	d16, d17, d18
	vmov.32	r2, d16[1]
	ldr	r1, [r3, #28]
	cmp	r2, #0
	vrev64.32	d17, d16
	mla	r4, r1, r0, r4
	ble	.L42
	mov	r0, #1
	vldr	d18, .L49
.L10:
	vmov.32	r1, d16[0]
	asr	r2, r2, #8
	vmov.32	d17[0], r2
	asr	r2, r1, #8
	vmov.32	d17[1], r2
	vmla.i32	d16, d17, d18
	vmov.32	r2, d16[1]
	ldr	r1, [r3, #32]
	cmp	r2, #0
	vrev64.32	d17, d16
	mla	r0, r1, r0, r4
	ble	.L43
	mov	r4, #1
	vldr	d18, .L49
.L11:
	vmov.32	r1, d16[0]
	asr	r2, r2, #9
	vmov.32	d17[0], r2
	asr	r2, r1, #9
	vmov.32	d17[1], r2
	vmla.i32	d16, d17, d18
	vmov.32	r2, d16[1]
	ldr	r1, [r3, #36]
	cmp	r2, #0
	vrev64.32	d17, d16
	mla	r0, r1, r4, r0
	ble	.L44
	mov	r4, #1
	vldr	d18, .L49
.L12:
	vmov.32	r1, d16[0]
	asr	r2, r2, #10
	vmov.32	d17[0], r2
	asr	r2, r1, #10
	vmov.32	d17[1], r2
	vmla.i32	d16, d17, d18
	vmov.32	r2, d16[1]
	ldr	r1, [r3, #40]
	cmp	r2, #0
	vrev64.32	d17, d16
	mla	r4, r1, r4, r0
	ble	.L45
	mov	r0, #1
	vldr	d18, .L49
.L13:
	vmov.32	r1, d16[0]
	asr	r2, r2, #11
	vmov.32	d17[0], r2
	asr	r2, r1, #11
	vmov.32	d17[1], r2
	vmla.i32	d16, d17, d18
	vmov.32	r2, d16[1]
	ldr	r1, [r3, #44]
	cmp	r2, #0
	vrev64.32	d17, d16
	mla	r4, r1, r0, r4
	ble	.L46
	mov	r0, #1
	vldr	d18, .L49
.L14:
	vmov.32	r1, d16[0]
	asr	r2, r2, #12
	vmov.32	d17[0], r2
	asr	r2, r1, #12
	vmov.32	d17[1], r2
	vmla.i32	d16, d17, d18
	vmov.32	r2, d16[1]
	ldr	r1, [r3, #48]
	cmp	r2, #0
	vrev64.32	d17, d16
	mla	r0, r1, r0, r4
	ble	.L47
	mov	r4, #1
	vldr	d18, .L49
.L15:
	vmov.32	r1, d16[0]
	asr	r2, r2, #13
	vmov.32	d17[0], r2
	asr	r2, r1, #13
	vmov.32	d17[1], r2
	vmla.i32	d16, d17, d18
	vmov.32	r2, d16[1]
	ldr	r1, [r3, #52]
	cmp	r2, #0
	vrev64.32	d17, d16
	mla	r0, r1, r4, r0
	ble	.L48
	mov	r4, #1
	vldr	d18, .L49
.L16:
	vmov.32	r1, d16[0]
	asr	r2, r2, #14
	vmov.32	d17[0], r2
	asr	r2, r1, #14
	vmov.32	d17[1], r2
	vmla.i32	d16, d17, d18
	ldr	r3, [r3, #56]
	vmov	d8, d16  @ v2si
	mla	r4, r3, r4, r0
	bl	clock
	sub	r1, r0, r6
	movw	r0, #:lower16:.LC0
	movt	r0, #:upper16:.LC0
	bl	printf
	vmov.32	r0, d8[1]
	vmov.32	r3, d8[0]
	orr	r0, r3, r0, lsl #16
	str	r4, [r5]
	add	sp, sp, #8
	@ sp needed
	vldm	sp!, {d8}
	pop	{r4, r5, r6, pc}
.L34:
	mvn	ip, #0
	vldr	d18, .L49+8
	b	.L2
.L48:
	mvn	r4, #0
	vldr	d18, .L49+8
	b	.L16
.L47:
	mvn	r4, #0
	vldr	d18, .L49+8
	b	.L15
.L46:
	mvn	r0, #0
	vldr	d18, .L49+8
	b	.L14
.L45:
	mvn	r0, #0
	vldr	d18, .L49+8
	b	.L13
.L44:
	mvn	r4, #0
	vldr	d18, .L49+8
	b	.L12
.L43:
	mvn	r4, #0
	vldr	d18, .L49+8
	b	.L11
.L42:
	mvn	r0, #0
	vldr	d18, .L49+8
	b	.L10
.L41:
	mvn	r0, #0
	vldr	d18, .L49+8
	b	.L9
.L40:
	mvn	r4, #0
	vldr	d18, .L49+8
	b	.L8
.L39:
	mvn	r4, #0
	vldr	d18, .L49+8
	b	.L7
.L50:
	.align	3
.L49:
	.word	1
	.word	-1
	.word	-1
	.word	1
.L38:
	mvn	r0, #0
	vldr	d18, .L49+8
	b	.L6
.L37:
	mvn	r0, #0
	vldr	d18, .L49+8
	b	.L5
.L36:
	mvn	r4, #0
	vldr	d18, .L49+8
	b	.L4
.L35:
	mvn	r4, #0
	vldr	d18, .L49+8
	b	.L3
	.size	cordic_V_fixed_point, .-cordic_V_fixed_point
	.comm	z_table,60,4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Execution time: %ld \012\000"
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
