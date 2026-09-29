global memset
global __memset:function hidden

memset:
__memset:
	xor	r10d, r10d
	mov	rax, rdi

.loop:
	cmp	r10, rdx
	je	.end

	mov	byte [rdi + r10], sil
	inc	r10
	jmp	.loop

.end:
	ret
