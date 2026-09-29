global strlen
global __strlen:function hidden

strlen:
__strlen:
	mov	sil, byte [rdi]
	xor	eax, eax

.loop:
	cmp	sil, 0
	je	.end
	inc	rax
	inc	rdi
	mov	sil, byte [rdi]
	jmp	.loop

.end:
	ret
