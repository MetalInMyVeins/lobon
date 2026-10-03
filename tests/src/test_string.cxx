#include <gtest/gtest.h>
#include <stdlib.h>
#include <string.h>

#include "lobon_string.h"

TEST(String, Memchr)
{
	const char* s = "iamamachine";
	const char* t = (const char*)memchr(s, 'h', 11);
	EXPECT_EQ(*t, 'h');
	const void* u = lobon_memchr(s, 'x', 11);
	EXPECT_EQ(u, nullptr);
}

TEST(String, Memcmp)
{
	const char* s1 = "applicate";
	const char* s2 = "application";
	int x = memcmp(s1, s2, 3);
	int y = lobon_memcmp(s1, s2, 3);
	EXPECT_EQ(x, y);
	x = memcmp(s2, s1, 5);
	y = lobon_memcmp(s2, s1, 5);
	EXPECT_EQ(x, y);
}

TEST(String, Memcpy)
{
	const char* s1 = "asdfghij";
	char* s2 = (char*)malloc(5);
	s2[4] = '\0';
	const char* t = (const char*)lobon_memcpy((void*)s2, (void*)s1, 4);
	EXPECT_EQ(t[0], 'a');
	EXPECT_EQ(t[1], 's');
	EXPECT_EQ(t[2], 'd');
	EXPECT_EQ(t[3], 'f');
	EXPECT_EQ(t[4], '\0');
	EXPECT_EQ(lobon_strlen(t), 4);
}

TEST(String, Memmove)
{
	char str[] = "ABCDEFGHI";
	const char* s1 = (const char*)lobon_memmove(str, str + 1, 5);
	EXPECT_STREQ(s1, "BCDEFFGHI");
	const char* s2 = (const char*)lobon_memmove(str + 6, str + 3, 3);
	EXPECT_STREQ(s2, "EFF");
	const char* s3 = (const char*)lobon_memmove(str + 2, str + 1, 4);
	EXPECT_STREQ(s3, "CDEFEFF");
}

TEST(String, Memset)
{
	char* s = (char*)malloc(5);
	s[4] = '\0';
	char* t = (char*)lobon_memset(s, 'a', 4);
	EXPECT_EQ(t[0], 'a');
	EXPECT_EQ(t[1], 'a');
	EXPECT_EQ(t[2], 'a');
	EXPECT_EQ(t[3], 'a');
	EXPECT_EQ(t[4], '\0');
	EXPECT_EQ(lobon_strlen(t), 4);
	free(s);

	int* ptr = (int*)malloc(sizeof(int) * 10);
	lobon_memset(ptr, 100, 10);
	char* cptr = (char*)ptr;
	for (size_t i = 0; i < 10; ++i)
	{
		EXPECT_EQ(cptr[i], 100);
	}
	free(ptr);
}

TEST(String, Strcat)
{
	char dest[20] = "asdf";
	const char* src = "ghij";
	const char* t = lobon_strcat(dest, src);
	EXPECT_STREQ(t, "asdfghij");
}

TEST(String, Strcmp)
{
	const char* s1 = "iamamachine";
	const char* s2 = "iamamameshshabok";
	int x = strcmp(s1, s2);
	int y = lobon_strcmp(s1, s2);
	EXPECT_EQ(x, y);
	x = strcmp(s2, s1);
	y = lobon_strcmp(s2, s1);
	EXPECT_EQ(x, y);
	const char* a1 = "abc";
	const char* a2 = "abcd";
	x = strcmp(a1, a2);
	y = lobon_strcmp(a1, a2);
	EXPECT_EQ(x, y);
	x = strcmp(a2, a1);
	y = lobon_strcmp(a2, a1);
	EXPECT_EQ(x, y);
}

TEST(String, Strcpy)
{
	const char* s1 = "asdfghij";
	char* s2 = (char*)malloc(15);
	for (size_t i = 0; i < 15; ++i)
	{
		s2[i] = 1;
	}
	const char* t = lobon_strcpy(s2, s1);
	EXPECT_EQ(t[0], 'a');
	EXPECT_EQ(t[1], 's');
	EXPECT_EQ(t[2], 'd');
	EXPECT_EQ(t[3], 'f');
	EXPECT_EQ(t[4], 'g');
	EXPECT_EQ(t[5], 'h');
	EXPECT_EQ(t[6], 'i');
	EXPECT_EQ(t[7], 'j');
	EXPECT_EQ(t[8], '\0');
	EXPECT_EQ(lobon_strlen(t), 8);
}

TEST(String, Strlen)
{
	const char* s = "asdf";
	EXPECT_EQ(lobon_strlen(s), 4UL);

	char* p = (char*)malloc(11);
	p[0] = 'k';
	p[1] = 'c';
	p[2] = 'u';
	p[3] = 'f';
	p[4] = 'l';
	p[5] = 'e';
	p[6] = 'a';
	p[7] = 'r';
	p[8] = 's';
	p[9] = 'i';
	p[10] = '\0';
	EXPECT_EQ(lobon_strlen(p), 10UL);
	free(p);
}

TEST(String, Strncmp)
{
	const char* s1 = "iamamachine";
	const char* s2 = "iamamachinary";
	int a1 = strncmp(s1, s2, strlen(s1) + 1);
	int b1 = strncmp(s1, s2, strlen(s2) + 1);
	int c1 = strncmp(s2, s1, strlen(s1) + 1);
	int d1 = strncmp(s2, s1, strlen(s2) + 1);
	int a2 = lobon_strncmp(s1, s2, lobon_strlen(s1) + 1);
	int b2 = lobon_strncmp(s1, s2, lobon_strlen(s2) + 1);
	int c2 = lobon_strncmp(s2, s1, lobon_strlen(s1) + 1);
	int d2 = lobon_strncmp(s2, s1, lobon_strlen(s2) + 1);
	EXPECT_EQ(a1, a2);
	EXPECT_EQ(b1, b2);
	EXPECT_EQ(c1, c2);
	EXPECT_EQ(d1, d2);

	const char* s11 = "iama\0machine";
	const char* s22 = "iamamac\0hinary";
	a1 = strncmp(s11, s22, strlen(s11) + 1);
	b1 = strncmp(s11, s22, strlen(s22) + 1);
	c1 = strncmp(s22, s11, strlen(s11) + 1);
	d1 = strncmp(s22, s11, strlen(s22) + 1);
	a2 = lobon_strncmp(s11, s22, lobon_strlen(s11) + 1);
	b2 = lobon_strncmp(s11, s22, lobon_strlen(s22) + 1);
	c2 = lobon_strncmp(s22, s11, lobon_strlen(s11) + 1);
	d2 = lobon_strncmp(s22, s11, lobon_strlen(s22) + 1);
	EXPECT_EQ(a1, a2);
	EXPECT_EQ(b1, b2);
	EXPECT_EQ(c1, c2);
	EXPECT_EQ(d1, d2);

	const char* s111 = "abcdef";
	const char* s222 = "abc";
	a1 = strncmp(s111, s222, strlen(s111) + 1);
	b1 = strncmp(s111, s222, strlen(s222) + 1);
	c1 = strncmp(s222, s111, strlen(s111) + 1);
	d1 = strncmp(s222, s111, strlen(s222) + 1);
	a2 = lobon_strncmp(s111, s222, lobon_strlen(s111) + 1);
	b2 = lobon_strncmp(s111, s222, lobon_strlen(s222) + 1);
	c2 = lobon_strncmp(s222, s111, lobon_strlen(s111) + 1);
	d2 = lobon_strncmp(s222, s111, lobon_strlen(s222) + 1);
	EXPECT_EQ(a1, a2);
	EXPECT_EQ(b1, b2);
	EXPECT_EQ(c1, c2);
	EXPECT_EQ(d1, d2);
}

TEST(String, Strncpy)
{
	char dest[10];
	for (int i = 0; i < 10; ++i)
	{
		dest[i] = 1;
	}
	const char* s1 = "hi";
	const char* a = lobon_strncpy(dest, s1, 5);
	EXPECT_EQ(a[0], 'h');
	EXPECT_EQ(a[1], 'i');
	EXPECT_EQ(a[2], '\0');
	EXPECT_EQ(a[3], '\0');
	EXPECT_EQ(a[4], '\0');
	EXPECT_EQ(a[5], 1);
	EXPECT_EQ(a[6], 1);
	EXPECT_EQ(a[7], 1);
	EXPECT_EQ(a[8], 1);
	EXPECT_EQ(a[9], 1);

	const char* s2 = "longtextsizemorethan10";
	const char* b = lobon_strncpy(dest, s2, 10);
	EXPECT_STREQ(b, "longtextsi");
}
