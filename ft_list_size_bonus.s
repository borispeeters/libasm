				global		_ft_list_size

				section		.text
_ft_list_size:
				xor			rax, rax		; initialize size to 0
loop:
				cmp			rdi, 0			; check if list pointer is null
				je			done			; if it is, exit the loop
				mov			rdi, [rdi + 8]	; go to the next element in the list
				inc			rax				; increment size by 1
				jmp			loop
done:
				ret