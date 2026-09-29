global strnlen
global __strnlen:function hidden
extern __memchr
extern __strlen

strnlen:
__strnlen:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16

	mov	rdx, rsi
	mov	[rbp - 8], rdx
	xor	esi, esi
	mov	[rbp - 16], rdi
	call	__memchr

	cmp	rax, 0
	je	.nulunfound

	mov	rdi, [rbp - 16]
	call	__strlen
	jmp	.end

.nulunfound:
	mov	rax, [rbp - 8]

.end:
	leave
	ret
