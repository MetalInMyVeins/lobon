global strcmp
global __strcmp:function hidden
extern __memcmp
extern __strlen

strcmp:
__strcmp:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32

	mov	[rbp - 24], rdi
	mov	[rbp - 32], rsi
	call	__strlen
	inc	rax
	mov	[rbp - 8], rax

	mov	rdi, [rbp - 32]
	call	__strlen
	inc	rax
	mov	[rbp - 16], rax

	cmp	[rbp - 8], rax
	jle	.1lessequ2
	jmp	.2less1

.1lessequ2:
	mov	rdi, [rbp - 24]
	mov	rsi, [rbp - 32]
	mov	rdx, [rbp - 8]
	call	__memcmp
	jmp	.end

.2less1:
	mov	rdi, [rbp - 24]
	mov	rsi, [rbp - 32]
	mov	rdx, rax
	call	__memcmp
	jmp	.end

.end:
	leave
	ret
