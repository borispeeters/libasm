			global		_ft_strdup
			extern		_malloc
			extern		_ft_strlen
			extern		_ft_strcpy

			section		.text
_ft_strdup:
			push		rdi						; save the pointer to s1 in rdi
			call		_ft_strlen				; returns the length of s1 in rax
			mov			rdi, rax				; the length of s1 is now in rdi
			inc			rdi						; strlen + 1 for \0
			call		_malloc					; calls malloc with the length of s1 as argument, rax now contains a pointer to s2
			mov			rdi, rax				; rdi now points to s2
			pop			rsi						; rsi now points to s1
			cmp			rdi, 0					; malloc protection
			je			error
			sub			rsp, 8					; align stack
			call		_ft_strcpy				; copies the contents from s1 into s2
			add			rsp, 8					; restore stack pointer
			ret
error:
			xor			rax, rax				; in case of error we return null
			ret