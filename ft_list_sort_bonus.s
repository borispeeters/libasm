					global		_ft_list_sort

; rdx = node
; rcx = prev
; r8 = tmp
; r9 = sorted
; r10 = ft_strcmp
					section		.text
_ft_list_sort:

					cmp			rdi, 0					; protection for **begin == NULL
					je			return
					cmp			qword [rdi], 0			; protection for *begin == NULL
					je			return
					cmp			rsi, 0					; protection for function == NULL
					je			return
					mov			r10, rsi
					xor			r9, r9					; sorted = 0
					jmp			check_sort
sorted:
					mov			rcx, [rdi]				; prev = *begin
					mov			rdx, [rcx + 8]			; node = prev->next
					mov			r9, 1					; sorted = 1
					jmp			check_loop
loop:
					push		rsp
					push		rdi
					push		rcx
					mov			rdi, [rdx]				; node->data
					mov			rsi, [rcx]				; prev->data
					call		r10						; call ft_strcmp
					pop			rcx
					pop			rdi
					pop			rsp
					cmp			rax, 0
					jge			next					; if ft_strcmp return is less than zero, swap data
					mov			r8, [rdx]				; swap the two datas
					mov			r11, [rcx]
					mov			[rdx], r11
					mov			[rcx], r8
					xor			r9, r9					; sorted = 0, list is not sorted yet
next:
					mov			rcx, rdx				; prev = node
					mov			rdx, [rdx + 8]			; node = node->next
check_loop:
					cmp			rdx, 0					; keep looping through the list as long as node is not null
					jne			loop
check_sort:
					cmp			r9, 0					; is our list not sorted yet?
					je			sorted					; then go sort it again
return:
					ret