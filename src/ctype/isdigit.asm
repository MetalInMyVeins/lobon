global isdigit
global __isdigit:function hidden

isdigit:
__isdigit:
	cmp	edi, 48
	jl	.false
	cmp	edi, 57
	jg	.false
	mov	eax, 1
	jmp	.end

.false:
	xor	eax, eax

.end:
	ret
