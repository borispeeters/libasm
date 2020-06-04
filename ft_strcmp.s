			global		_ft_strcmp

			section		.text
_ft_strcmp:
			xor			rcx, rcx				; initialize the counter to 0
loop:
			mov			r8b, byte [rdi + rcx]
			cmp			r8b, 0
			je			compare					; exit loop when s1 has reached its end
			cmp			byte [rsi + rcx], 0
			je			compare					; exit loop when s2 has reached its end
			cmp			r8b, byte [rsi + rcx]	; are the ascii values for the current character not equal? exit the loop
			jne			compare
			inc			rcx						; increment the loop counter
			jmp			loop
compare:
			cmp			r8b, byte [rsi + rcx]
			je			equal
			ja			positive
			jb			negative
equal:
			xor		rax, rax
			ret
positive:
			mov		rax, 1
			ret
negative:
			mov		rax, -1
			ret