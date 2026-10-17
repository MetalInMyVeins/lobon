global strncat
global __strncat:function hidden
extern __strlen

strncat:
__strncat:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32

	mov	[rbp - 8], rdi
	mov	[rbp - 16], rsi
	mov	[rbp - 24], rdx

	call	__strlen
	mov	r10, rax

	xor	r8d, r8d
	xor	r9d, r9d

	mov	rdi, [rbp - 8]
	mov	rsi, [rbp - 16]
	mov	rdx, [rbp - 24]

.loop:
	cmp	r8, rdx
	je	.loop_end

	cmp	byte [rsi + r8], 0
	je	.loop_end

	mov	r9b, byte [rsi + r8]
	mov	byte [rdi + r10], r9b

	inc	r10
	inc	r8
	jmp	.loop

.loop_end:
	mov	byte [rdi + r10], 0
	mov	rax, rdi

.end:
	leave
	ret
