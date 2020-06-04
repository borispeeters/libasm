						global		_ft_list_remove_if
						extern		_free

; rdi = **begin_list
; rsi = data_ref
; rdx = ft_strcmp
; rcx = data_ref
; r8 = prev
; r9 = node
; r10 = tmp
; r11 = **begin_list
						section		.text
_ft_list_remove_if:
						push		rsp
						cmp			rdx, 0				; protection for function == NULL
						je			return
						cmp			rdi, 0				; protection for **begin == NULL
						je			return
						mov			r9, [rdi]			; node = *begin_list
						cmp			r9, 0
						je			return
						xor			r8, r8				; initialize prev and tmp to null
						xor			r10, r10
loop:
						push		rdi
						push		rsi
						push		rdx
						push		r8
						push		r9
						push		r10
						mov			rdi, [r9]			; first argument is node->data
						call		rdx
						pop			r10
						pop			r9
						pop			r8
						pop			rdx
						pop			rsi
						pop			rdi
						cmp			rax, 0				; compare strcmp return with 0
						jne			prep_node
						cmp			r9, [rdi]			; is node at the beginning of the list?
						jne			set_new_link
						mov			rcx, [r9 + 8]
						mov			[rdi], rcx			; *begin_list = node->next
						jmp			free_node
set_new_link:
						mov			rcx, [r9 + 8]
						mov			[r8 + 8], rcx		; prev->next = node->next
free_node:
						mov			r10, r9				; tmp = node
						mov			r9, [r9 + 8]		; node = node->next
						push		rdi
						push		rsi
						push		rdx
						push		r8
						push		r9
						push		r10
						mov			rdi, r10			; tmp is argument to free
						call		_free				; free tmp
						pop			r10
						pop			r9
						pop			r8
						pop			rdx
						pop			rsi
						pop			rdi
						jmp			loop_check
prep_node:
						mov			r8, r9				; prev = node
						mov			r9, [r9 + 8]		; node = node->next
loop_check:
						cmp			r9, 0
						jne			loop
return:
						pop			rsp
						ret