/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   main_bonus.c                                       :+:    :+:            */
/*                                                     +:+                    */
/*   By: bpeeters <bpeeters@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/03/07 05:45:44 by bpeeters       #+#    #+#                */
/*   Updated: 2020/03/10 02:14:48 by bpeeters      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"
#include <stdio.h>
#include <stdlib.h>

void	test_atoi(void)
{
	int	ret;

	printf("\natoi_base\n");
	ret = ft_atoi_base("123", "0123456789");
	printf("atoi:   %d\n", ret);
	ret = strtol("123", NULL, 10);
	printf("strtol: %d\n", ret);
	ret = ft_atoi_base("abc5712", "0123456789abcdef");
	printf("atoi:   %d\n", ret);
	ret = strtol("abc5712", NULL, 16);
	printf("strtol: %d\n", ret);
}

void	print_list(t_list *list)
{
	while (list)
	{
		printf("%s\n", list->data);
		list = list->next;
	}
}

int		main(void)
{
	t_list	*list;
	int		size;

	list = NULL;
	size = ft_list_size(list);
	printf("size: %d\n", size);
	printf("\nlist_push_front\n");
	ft_list_push_front(&list, "test2");
	ft_list_push_front(&list, "test3");
	ft_list_push_front(&list, "test1");
	print_list(list);
	size = ft_list_size(list);
	printf("size: %d\n", size);
	printf("\nlist_sort\n");
	ft_list_sort(&list, &ft_strcmp);
	print_list(list);
	printf("\nlist_remove_if\n");
	ft_list_remove_if(&list, "test1", &ft_strcmp);
	print_list(list);
	test_atoi();
	return (0);
}
