global strcpy
global __strcpy:function hidden
extern __memcpy
extern __strlen

strcpy:
__strcpy:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16

	mov	[rbp - 8], rdi
	mov	[rbp - 16], rsi

	mov	rdi, rsi
	call	__strlen
	inc	rax

	mov	rdx, rax
	mov	rdi, [rbp - 8]
	mov	rsi, [rbp - 16]
	call	__memcpy

.end:
	leave
	ret
