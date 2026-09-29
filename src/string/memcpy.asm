global memcpy
global __memcpy:function hidden

memcpy:
__memcpy:
	xor	r10d, r10d
	xor	r8d, r8d
	mov	rax, rdi

.loop:
	cmp	r10, rdx
	je	.end

	mov	r8b, byte [rsi + r10]
	mov	byte [rdi + r10], r8b
	inc	r10
	jmp	.loop

.end:
	ret
