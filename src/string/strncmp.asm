global strncmp
global __strncmp:function hidden
extern __memcmp
extern __strcmp
extern __strlen

strncmp:
__strncmp:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 64

	mov	[rbp - 8], rdi
	mov	[rbp - 16], rsi
	mov	[rbp - 24], rdx

	call	__strlen
	inc	rax
	mov	[rbp - 32], rax

	mov	rdi, [rbp - 16]
	call	__strlen
	inc	rax
	mov	[rbp - 40], rax

	mov	rdx, [rbp - 24]
	cmp	[rbp - 32], rdx
	jbe	.str_less_n
	ja	.str_greater_n
	
	mov	rdx, [rbp - 24]
	cmp	[rbp - 40], rdx
	jbe	.str_less_n
	ja	.str_greater_n

.str_less_n:
	mov	rdi, [rbp - 8]
	mov	rsi, [rbp - 16]
	call	__strcmp
	jmp	.end

.str_greater_n:
	mov	rdi, [rbp - 8]
	mov	rsi, [rbp - 16]
	mov	rdx, [rbp - 24]
	call	__memcmp
	jmp	.end

.end:
	leave
	ret
