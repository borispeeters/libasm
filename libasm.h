/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   libasm.h                                           :+:    :+:            */
/*                                                     +:+                    */
/*   By: bpeeters <bpeeters@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/03/05 22:33:13 by bpeeters       #+#    #+#                */
/*   Updated: 2020/03/08 00:35:08 by bpeeters      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBASM_H
# define LIBASM_H

# include <unistd.h>

typedef struct		s_list
{
	void			*data;
	struct s_list	*next;
}					t_list;

ssize_t				ft_read(int fd, void *buf, size_t nbyte);
ssize_t				ft_write(int fd, const void *buf, size_t nbyte);
size_t				ft_strlen(const char *s);
char				*ft_strcpy(char *dst, const char *src);
int					ft_strcmp(const char *s1, const char *s2);
char				*ft_strdup(const char *s1);

int					ft_atoi_base(char *str, char *base);
/*
**	Adds a new element of type t_list to the beginning of the list.
*/
void				ft_list_push_front(t_list **begin_list, void *data);
/*
**	Returns the number of elements in the list.
*/
int					ft_list_size(t_list *begin_list);
/*
**	Sorts the list's contents by ascending orer by comparing two links
**	thanks to a function that can compare the data held in those two links.
*/
void				ft_list_sort(t_list **begin_list, int (*cmp)());
/*
**	Erases off the list all elements, whose data is equal to the reference data.
*/
void				ft_list_remove_if(t_list **begin_list, void *data_ref, \
					int (*cmp)());
#endif
