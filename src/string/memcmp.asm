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
	movzx	r8d, r8b
	movzx	r9d, byte [rsi + r10]
	sub	r8d, r9d
	mov	eax, r8d

.end:
	ret
