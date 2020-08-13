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
	.file	"test.c"
	.text
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.arch armv7-a
	.syntax unified
	.arm
	.fpu neon
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r0, #:lower16:.LC0
	push	{r4, r5, r6, lr}
	movt	r0, #:upper16:.LC0
	bl	puts
	movw	r0, #:lower16:.LC1
	mov	r1, #0
	movt	r0, #:upper16:.LC1
	bl	printf
	movw	r0, #:lower16:.LC2
	mov	r5, #12
	movt	r0, #:upper16:.LC2
	bl	puts
	mov	r4, #31
	movt	r5, 65525
.L4:
	asr	r3, r5, r4
	tst	r3, #1
	movne	r0, #49
	moveq	r0, #48
	bl	putchar
	subs	r4, r4, #1
	bcs	.L4
	mov	r0, #10
	bl	putchar
	mov	r0, #0
	pop	{r4, r5, r6, pc}
	.size	main, .-main
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Enter an integer in decimal number system\000"
	.space	2
.LC1:
	.ascii	"%d in binary number system is:\012\000"
.LC2:
	.ascii	"Vectoring CORDIC:\012\000"
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
