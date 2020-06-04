				global		_ft_atoi_base
				default		rel

				section		.text
_ft_atoi_base:
				cmp			rdi, 0
				je			error
				cmp			rsi, 0
				je			error
				xor			rcx, rcx					; counter for str
				xor			rax, rax					; ans = 0
				mov			rdx, 1						; rdx: check for negative
				lea			r11, [upper]
				lea			r10, [lower]
				xor			r9, r9						; counter is 0
inc_lower:
				inc			r9							; i++
valid_lower:
				mov			r8b, byte [rsi + r9]		; r8b = base[i]
				cmp			r8b, 0						; are we done going over our base?
				je			check_space
				cmp			byte [r10 + r9], r8b		; compare our base with the valid one
				je			inc_lower
				xor			r9, r9						; invalid base
				jmp			valid_upper
inc_upper:
				inc			r9
valid_upper:
				mov			r8b, byte [rsi + r9]
				cmp			r8b, 0
				je			check_space
				cmp			byte [r11 + r9], r8b
				je			inc_upper
				xor			r9, r9
check_space:
				cmp			r9, 0
				je			error
				cmp			r9, 1
				je			error						; if base_len is 0 or 1, error
				cmp			byte [rdi + rcx], 9
				je			skip_space
				cmp			byte [rdi + rcx], 10
				je			skip_space
				cmp			byte [rdi + rcx], 11
				je			skip_space
				cmp			byte [rdi + rcx], 12		; skip past isspace(3)
				je			skip_space
				cmp			byte [rdi + rcx], 13
				je			skip_space
				cmp			byte [rdi + rcx], 32
				je			skip_space
check_sign:
				cmp			byte [rdi + rcx], 45
				je			minus_sign
				cmp			byte [rdi + rcx], 43
				je			plus_sign
				jmp			loop_str
skip_space:
				inc			rcx
				jmp			check_space
minus_sign:
				mov			rdx, -1						; our return number is negative
				inc			rcx
				jmp			loop_str
plus_sign:
				inc			rcx
				jmp			loop_str
loop_str:
				cmp			byte [rdi + rcx], 0			; are we done looping through our str?
				je			return
				xor			r10, r10					; i = 0
check_base:
				mov			r8b, byte [rsi + r10]
				cmp			r8b, 0						; are we done going over our base?
				je			error
				cmp			r8b, [rdi + rcx]
				je			fill_ans					; if we found the base number, proceed to fill ans
				inc			r10							; i++
				jmp			check_base
fill_ans:
				imul		rax, r9						; ans = ans * base_len
				add			rax, r10					; ans = ans + base_num
				inc			rcx							; increment loop counter
				jmp			loop_str
return:
				imul		rax, rdx					; if minus sign was found, multiply ret by -1
				ret
error:
				mov			rax, 0						; return 0
				ret

				section		.data
upper			db			"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ", 0	; valid uppercase base
lower			db			"0123456789abcdefghijklmnopqrstuvwxyz", 0	; valid lowercase base