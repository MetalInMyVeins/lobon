global memcmp
global __memcmp:function hidden

memcmp:
__memcmp:
	xor	eax, eax
	cmp	rdx, 0
	je	.end

	xor	r10d, r10d
	xor	r8d, r8d

.loop:
	cmp	r10, rdx
	je	.end

	mov	r8b, byte [rdi + r10]
	cmp	r8b, byte [rsi + r10]
	jne	.calc_diff
	inc	r10
	jmp	.loop

.calc_diff:
	sub	r8b, byte [rsi + r10]
	movsx	eax, r8b

.end:
	ret
