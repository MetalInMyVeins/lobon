global memmove
global __memmove:function hidden

; memmove guarantees to work properly even if src and dest
; overlaps. For overlapping addresses, src is either bigger
; or smaller than dest.
; If dest > src, the copy loop should go backward.
; If dest < src, the copy loop should go forward.
memmove:
__memmove:
	mov	rax, rdi

	xor	r10d, r10d
	xor	r8d, r8d
	xor	r9d, r9d

	cmp	rdi, rsi
	je	.end
	jb	.dest_less_src

.dest_greater_src:
	mov	r10, rdx
.loop1:
	cmp	r10, 1
	jb	.end

	mov	r8b, byte [rsi + r10 - 1]
	mov	byte [rdi + r10 - 1], r8b
	dec	r10
	jmp	.loop1

.dest_less_src:
	mov	r10, 0
.loop2:
	cmp	r10, rdx
	je	.end

	mov	r8b, byte [rsi + r10]
	mov	byte [rdi + r10], r8b
	inc	r10
	jmp	.loop2

.end:
	ret
