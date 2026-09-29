global memchr
global __memchr:function hidden

memchr:
__memchr:
	push	rbp
	mov	rbp, rsp

	xor	r10d, r10d

.loop:
	cmp	r10, rdx
	je	.unfound

	cmp	byte [rdi + r10], sil
	je	.found
	inc	r10
	jmp	.loop

.found:
	add	rdi, r10
	mov	rax, rdi
	jmp	.end

.unfound:
	xor	eax, eax

.end:
	leave
	ret
