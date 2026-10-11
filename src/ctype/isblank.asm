global isblank
global __isblank:function hidden

isblank:
__isblank:
	cmp	edi, 9
	je	.true
	cmp	edi, 32
	je	.true
	xor	eax, eax
	jmp	.end

.true:
	mov	eax, 1

.end:
	ret
