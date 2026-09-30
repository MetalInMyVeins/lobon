global strlen
global __strlen:function hidden

strlen:
__strlen:
	mov	sil, byte [rdi]
	xor	eax, eax

.loop:
	test	sil, sil
	je	.end

	inc	rax
	inc	rdi
	mov	sil, byte [rdi]
	jmp	.loop

.end:
	ret
