/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   main.c                                             :+:    :+:            */
/*                                                     +:+                    */
/*   By: bpeeters <marvin@codam.nl>                   +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/03/02 13:46:30 by bpeeters       #+#    #+#                */
/*   Updated: 2020/03/10 02:13:24 by bpeeters      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>
#include <stdio.h>
#include <fcntl.h>
#include <string.h>
#include "libasm.h"

static void	test_write(void)
{
	int		ret;
	char	str[14];

	ft_strcpy(str, "Hello World!\n");
	ret = write(1, str, strlen(str));
	printf("ret: %d\n", ret);
	ret = ft_write(1, str, ft_strlen(str));
	printf("ret: %d\n\n", ret);
	ret = write(42, NULL, -1);
	printf("ret: %d\n", ret);
	ret = ft_write(42, NULL, -1);
	printf("ret: %d\n\n", ret);
}

static void	test_read(void)
{
	int		myfd;
	int		ogfd;
	int		ret;
	char	buf[100];

	myfd = open("me.txt", O_RDWR | O_CREAT, 0644);
	ogfd = open("og.txt", O_RDWR | O_CREAT, 0644);
	write(ogfd, "Now let's test read", 19);
	lseek(ogfd, 0, SEEK_SET);
	ret = read(ogfd, buf, 19);
	buf[ret] = '\0';
	printf("ret: %d\nbuf: %s\n", ret, buf);
	ft_write(myfd, "Now let's test read", 19);
	lseek(myfd, 0, SEEK_SET);
	ret = ft_read(myfd, buf, 19);
	buf[ret] = '\0';
	printf("ret: %d\nbuf: %s\n\n", ret, buf);
	close(myfd);
	close(ogfd);
}

static void	test_cmp(void)
{
	char	str1[7];
	char	str2[7];
	char	*s1;
	char	*s2;
	int		ret;

	s1 = strcpy(str1, "String");
	s2 = strcpy(str2, "Strigg");
	ret = strcmp(s1, s2);
	printf("ret: %d\ns1: %s\ns2: %s\n", ret, s1, s2);
	ret = strcmp(s2, s1);
	printf("ret: %d\n\n", ret);
	s1 = ft_strcpy(str1, "Striks");
	s2 = ft_strcpy(str2, "Straks");
	ret = ft_strcmp(s1, s2);
	printf("ret: %d\ns1: %s\ns2: %s\n", ret, s1, s2);
	ret = ft_strcmp(s2, s1);
	printf("ret: %d\n\n", ret);
}

static void	test_dup(void)
{
	char	str1[10];
	char	*s1;
	char	str2[10];
	char	*s2;

	strcpy(str1, "duplicate");
	s1 = strdup(str1);
	if (strcmp(s1, str1) == 0)
		write(1, "Good job :)\n", 12);
	free(s1);
	ft_strcpy(str2, "duplicate");
	s2 = ft_strdup(str2);
	if (ft_strcmp(s2, str2) == 0)
		ft_write(1, "Good job :)\n", 12);
	free(s2);
}

int			main(void)
{
	test_write();
	test_read();
	test_cmp();
	test_dup();
	return (0);
}
