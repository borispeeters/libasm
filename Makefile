# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: bpeeters <marvin@codam.nl>                   +#+                      #
#                                                    +#+                       #
#    Created: 2020/03/02 09:49:47 by bpeeters       #+#    #+#                 #
#    Updated: 2020/03/10 02:24:49 by bpeeters      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a
SRC = ft_read.s ft_write.s ft_strlen.s ft_strcpy.s ft_strcmp.s ft_strdup.s
OBJ = $(SRC:.s=.o)
B_SRC = ft_atoi_base_bonus.s ft_list_size_bonus.s ft_list_push_front_bonus.s \
		ft_list_remove_if_bonus.s ft_list_sort_bonus.s
B_OBJ = $(B_SRC:.s=.o)

.PHONY: clean fclean re

all: $(NAME)

$(NAME): $(OBJ)
	ar rcs $(NAME) $?

bonus: $(B_OBJ) $(NAME)
	@touch bonus
	ar rcs $(NAME) $?

%.o: %.s
	nasm -fmacho64 $?

test: all
	gcc main.c -L. -lasm -o libasm
	./libasm
	@$(RM) me.txt og.txt

btest: bonus
	gcc main_bonus.c -L. -lasm -o libasm
	./libasm

clean:
	$(RM) $(OBJ)
	$(RM) $(B_OBJ)
	$(RM) libasm

fclean: clean
	$(RM) $(NAME)
	$(RM) bonus

re: fclean all
