			global		_ft_read

			section		.text
_ft_read:
			mov			rax, 0x2000003	; 3 is the read syscall number
			syscall
			jc			error			; if an error happens...
			ret
error:
			mov			rax, -1			; ...return -1
			ret