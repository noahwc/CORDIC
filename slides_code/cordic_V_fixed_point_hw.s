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
	.file	"cordic_V_fixed_point_hw.c"
	.text
	.align	2
	.global	cordic_V_fixed_point
	.arch armv7-a
	.syntax unified
	.arm
	.fpu neon
	.type	cordic_V_fixed_point, %function
cordic_V_fixed_point:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #0
	str	lr, [sp, #-4]!
	movgt	r2, #1
	mvnle	r2, #0
	mov	r3, #0
	.syntax divided
@ 17 "cordic_V_fixed_point_hw.c" 1
	cordic_hw	r0, r0, r3

@ 0 "" 2
	.arm
	.syntax unified
	movw	r3, #:lower16:z_table
	movt	r3, #:upper16:z_table
	ldr	ip, [r3]
	cmp	r0, #0
	mul	ip, ip, r2
	mov	lr, #1
	movgt	r2, #1
	mvnle	r2, #0
	.syntax divided
@ 17 "cordic_V_fixed_point_hw.c" 1
	cordic_hw	r0, r0, lr

@ 0 "" 2
	.arm
	.syntax unified
	ldr	lr, [r3, #4]
	cmp	r0, #0
	mla	ip, lr, r2, ip
	movgt	r2, #1
	mvnle	r2, #0
	mov	lr, #2
	.syntax divided
@ 17 "cordic_V_fixed_point_hw.c" 1
	cordic_hw	r0, r0, lr

@ 0 "" 2
	.arm
	.syntax unified
	ldr	lr, [r3, #8]
	cmp	r0, #0
	mla	r2, lr, r2, ip
	movgt	ip, #1
	mvnle	ip, #0
	mov	lr, #3
	.syntax divided
@ 17 "cordic_V_fixed_point_hw.c" 1
	cordic_hw	r0, r0, lr

@ 0 "" 2
	.arm
	.syntax unified
	ldr	lr, [r3, #12]
	cmp	r0, #0
	mla	r2, lr, ip, r2
	movgt	ip, #1
	mvnle	ip, #0
	mov	lr, #4
	.syntax divided
@ 17 "cordic_V_fixed_point_hw.c" 1
	cordic_hw	r0, r0, lr

@ 0 "" 2
	.arm
	.syntax unified
	ldr	lr, [r3, #16]
	cmp	r0, #0
	mla	ip, lr, ip, r2
	movgt	r2, #1
	mvnle	r2, #0
	mov	lr, #5
	.syntax divided
@ 17 "cordic_V_fixed_point_hw.c" 1
	cordic_hw	r0, r0, lr

@ 0 "" 2
	.arm
	.syntax unified
	ldr	lr, [r3, #20]
	cmp	r0, #0
	mla	ip, lr, r2, ip
	movgt	r2, #1
	mvnle	r2, #0
	mov	lr, #6
	.syntax divided
@ 17 "cordic_V_fixed_point_hw.c" 1
	cordic_hw	r0, r0, lr

@ 0 "" 2
	.arm
	.syntax unified
	ldr	lr, [r3, #24]
	cmp	r0, #0
	mla	r2, lr, r2, ip
	movgt	ip, #1
	mvnle	ip, #0
	mov	lr, #7
	.syntax divided
@ 17 "cordic_V_fixed_point_hw.c" 1
	cordic_hw	r0, r0, lr

@ 0 "" 2
	.arm
	.syntax unified
	ldr	lr, [r3, #28]
	cmp	r0, #0
	mla	r2, lr, ip, r2
	movgt	ip, #1
	mvnle	ip, #0
	mov	lr, #8
	.syntax divided
@ 17 "cordic_V_fixed_point_hw.c" 1
	cordic_hw	r0, r0, lr

@ 0 "" 2
	.arm
	.syntax unified
	ldr	lr, [r3, #32]
	cmp	r0, #0
	mla	ip, lr, ip, r2
	movgt	r2, #1
	mvnle	r2, #0
	mov	lr, #9
	.syntax divided
@ 17 "cordic_V_fixed_point_hw.c" 1
	cordic_hw	r0, r0, lr

@ 0 "" 2
	.arm
	.syntax unified
	ldr	lr, [r3, #36]
	cmp	r0, #0
	mla	ip, lr, r2, ip
	movgt	r2, #1
	mvnle	r2, #0
	mov	lr, #10
	.syntax divided
@ 17 "cordic_V_fixed_point_hw.c" 1
	cordic_hw	r0, r0, lr

@ 0 "" 2
	.arm
	.syntax unified
	ldr	lr, [r3, #40]
	cmp	r0, #0
	mla	r2, lr, r2, ip
	movgt	ip, #1
	mvnle	ip, #0
	mov	lr, #11
	.syntax divided
@ 17 "cordic_V_fixed_point_hw.c" 1
	cordic_hw	r0, r0, lr

@ 0 "" 2
	.arm
	.syntax unified
	ldr	lr, [r3, #44]
	cmp	r0, #0
	mla	r2, lr, ip, r2
	movgt	ip, #1
	mvnle	ip, #0
	mov	lr, #12
	.syntax divided
@ 17 "cordic_V_fixed_point_hw.c" 1
	cordic_hw	r0, r0, lr

@ 0 "" 2
	.arm
	.syntax unified
	ldr	lr, [r3, #48]
	cmp	r0, #0
	mla	ip, lr, ip, r2
	movgt	r2, #1
	mvnle	r2, #0
	mov	lr, #13
	.syntax divided
@ 17 "cordic_V_fixed_point_hw.c" 1
	cordic_hw	r0, r0, lr

@ 0 "" 2
	.arm
	.syntax unified
	ldr	lr, [r3, #52]
	cmp	r0, #0
	mla	ip, lr, r2, ip
	movgt	r2, #1
	mvnle	r2, #0
	mov	lr, #14
	.syntax divided
@ 17 "cordic_V_fixed_point_hw.c" 1
	cordic_hw	r0, r0, lr

@ 0 "" 2
	.arm
	.syntax unified
	ldr	r3, [r3, #56]
	mla	r2, r3, r2, ip
	str	r2, [r1]
	ldr	pc, [sp], #4
	.size	cordic_V_fixed_point, .-cordic_V_fixed_point
	.comm	z_table,60,4
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
