			global		_ft_write

			section		.text
_ft_write:
			mov			rax, 0x2000004	; 4 is the write syscall number
			syscall
			jc			error			; if an error happens...
			ret
error:
			mov			rax, -1			; ...return -1
			ret