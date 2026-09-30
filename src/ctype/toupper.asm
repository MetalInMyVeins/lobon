global toupper
global __toupper:function hidden

toupper:
__toupper:
	mov	eax, edi

	cmp	edi, 'a'
	jb	.end
	cmp	edi, 'z'
	ja	.end

	sub	eax, 32

.end:
	ret
