			global		_ft_strcpy

			section		.text
_ft_strcpy:
			xor			rcx, rcx				; initialize the counter to 0
loop:
			mov			al, byte [rsi + rcx]	; copy the contents from src into dest
			mov			byte [rdi + rcx], al
			inc			rcx						; increment the counter
			cmp			al, 0					; check if we have reached a null terminator
			jne			loop					; if we haven't, go through the loop again
done:
			mov			rax, rdi				; return a pointer to the beginning of the dst string
			ret