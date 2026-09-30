global tolower
global __tolower:function hidden

tolower:
__tolower:
	mov	eax, edi

	cmp	edi, 'A'
	jb	.end
	cmp	edi, 'Z'
	ja	.end

	add	eax, 32

.end:
	ret
