global isupper
global __isupper:function hidden

isupper:
__isupper:
	cmp	edi, 65
	jl	.false
	cmp	edi, 90
	jg	.false
	mov	eax, 1
	jmp	.end

.false:
	xor	eax, eax

.end:
	ret
