						global		_ft_list_push_front
						extern		_malloc

						section		.text
_ft_list_push_front:
						push		rsp
						cmp			rdi, 0					; protection for **begin == NULL
						je			return
						push		rdi
						push		rsi
						mov			rdi, 16					; set size to malloc to 16
						call		_malloc
						pop			rsi
						pop			rdi
						cmp			rax, 0					; check if malloc failed
						je			return
						mov			[rax], rsi				; elem->data = data
						mov			rcx, [rdi]				; rcx = *begin
						mov			[rax + 8], rcx			; elem->next = *begin
						mov			[rdi], rax				; *begin = elem
return:
						pop			rsp
						ret