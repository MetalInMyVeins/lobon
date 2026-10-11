global strrchr
global __strrchr:function hidden
extern __strlen

strrchr:
__strrchr:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16

	mov	[rbp - 8], rdi
	mov	[rbp - 12], esi
	call	__strlen

	mov	rdx, rax
	mov	rdi, [rbp - 8]
	mov	esi, [rbp - 12]

.loop:
	cmp	rdx, 0
	je	.not_found

	cmp	byte [rdi + rdx - 1], sil
	je	.found

	dec	rdx
	jmp	.loop

.found:
	mov	rax, [rbp - 8]
	add	rax, rdx
	dec	rax
	jmp	.end

.not_found:
	xor	eax, eax

.end:
	leave
	ret
