			global		_ft_strlen

			section		.text
_ft_strlen:
			mov			rax, -1					; initialize loop counter
loop:
			inc			rax
			cmp			byte [rdi + rax], 0		; check if str is at the end of the line
			jne			loop					; are we done? if not, go through the loop again
			ret