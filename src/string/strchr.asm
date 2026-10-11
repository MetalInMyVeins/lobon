global strchr
global __strchr:function hidden
extern __strlen

strchr:
__strchr:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16

	mov	[rbp - 8], rdi
	mov	[rbp - 12], esi
	call	__strlen

	xor	edx, edx
	mov	rdi, [rbp - 8]
	mov	esi, [rbp - 12]

.loop:
	cmp	rdx, rax
	je	.not_found

	cmp	byte [rdi + rdx], sil
	je	.found

	inc	rdx
	jmp	.loop

.found:
	mov	rax, [rbp - 8]
	add	rax, rdx
	jmp	.end

.not_found:
	xor	eax, eax

.end:
	leave
	ret
