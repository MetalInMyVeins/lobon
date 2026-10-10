global strncpy
global __strncpy:function hidden
extern __memcpy
extern __strcpy
extern __strlen

strncpy:
__strncpy:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32

	mov	[rbp - 8], rdi
	mov	[rbp - 16], rsi
	mov	[rbp - 24], rdx

	mov	rdi, rsi
	call	__strlen
	mov	[rbp - 32], rax

	cmp	rax, [rbp - 24]
	jb	.less_n
	
	mov	rdi, [rbp - 8]
	mov	rsi, [rbp - 16]
	mov	rdx, [rbp - 24]
	call	__memcpy
	jmp	.end

.less_n:
	mov	rdi, [rbp - 8]
	mov	rsi, [rbp - 16]
	call	__strcpy

	mov	r10, [rbp - 32]
	mov	rdi, [rbp - 8]

.loop:
	cmp	r10, [rbp - 24]
	je	.end

	mov	byte [rdi + r10], 0
	inc	r10
	jmp	.loop

.end:
	leave
	ret
