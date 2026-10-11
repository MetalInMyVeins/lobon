global isspace
global __isspace:function hidden

isspace:
__isspace:
	cmp	edi, 9
	je	.true
	cmp	edi, 10
	je	.true
	cmp	edi, 11
	je	.true
	cmp	edi, 12
	je	.true
	cmp	edi, 13
	je	.true
	cmp	edi, 32
	je	.true
	xor	eax, eax
	jmp	.end

.true:
	mov	eax, 1

.end:
	ret
