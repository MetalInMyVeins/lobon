global isgraph
global __isgraph:function hidden

isgraph:
__isgraph:
	cmp	edi, 33
	jl	.false
	cmp	edi, 126
	jg	.false
	mov	eax, 1
	jmp	.end

.false:
	xor	eax, eax

.end:
	ret
