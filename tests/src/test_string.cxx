#include <gtest/gtest.h>
#include <cstdlib>
#include <cstring>

#include "syslibc_string.h"

TEST(String, Memcmp)
{
	const char* s1 = "applicate";
	const char* s2 = "application";
	int x = memcmp(s1, s2, 3);
	int y = syslibc_memcmp(s1, s2, 3);
	EXPECT_EQ(x, y);
	x = memcmp(s2, s1, 5);
	y = syslibc_memcmp(s2, s1, 5);
	EXPECT_EQ(x, y);
}

TEST(String, Memcpy)
{
	const char* s1 = "asdfghij";
	char* s2 = (char*)malloc(5);
	s2[4] = '\0';
	const char* t = (const char*)syslibc_memcpy((void*)s2, (void*)s1, 4);
	EXPECT_EQ(t[0], 'a');
	EXPECT_EQ(t[1], 's');
	EXPECT_EQ(t[2], 'd');
	EXPECT_EQ(t[3], 'f');
	EXPECT_EQ(t[4], '\0');
	EXPECT_EQ(syslibc_strlen(t), 4);
}

TEST(String, Memmove)
{
	char str[] = "ABCDEFGHI";
	const char* s1 = (const char*)syslibc_memmove(str, str + 1, 5);
	EXPECT_STREQ(s1, "BCDEFFGHI");
	const char* s2 = (const char*)syslibc_memmove(str + 6, str + 3, 3);
	EXPECT_STREQ(s2, "EFF");
	const char* s3 = (const char*)syslibc_memmove(str + 2, str + 1, 4);
	EXPECT_STREQ(s3, "CDEFEFF");
}

TEST(String, Memset)
{
	char* s = (char*)malloc(5);
	s[4] = '\0';
	char* t = (char*)syslibc_memset(s, 'a', 4);
	EXPECT_EQ(t[0], 'a');
	EXPECT_EQ(t[1], 'a');
	EXPECT_EQ(t[2], 'a');
	EXPECT_EQ(t[3], 'a');
	EXPECT_EQ(t[4], '\0');
	EXPECT_EQ(syslibc_strlen(t), 4);
	free(s);

	int* ptr = (int*)malloc(sizeof(int) * 10);
	syslibc_memset(ptr, 100, 10);
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
	const char* t = syslibc_strcat(dest, src);
	EXPECT_STREQ(t, "asdfghij");
}

TEST(String, Strcmp)
{
	const char* s1 = "iamamachine";
	const char* s2 = "iamamameshshabok";
	int x = strcmp(s1, s2);
	int y = syslibc_strcmp(s1, s2);
	EXPECT_EQ(x, y);
	x = strcmp(s2, s1);
	y = syslibc_strcmp(s2, s1);
	EXPECT_EQ(x, y);
}

TEST(String, Strcpy)
{
	const char* s1 = "asdfghij";
	char* s2 = (char*)malloc(15);
	const char* t = syslibc_strcpy(s2, s1);
	EXPECT_EQ(t[0], 'a');
	EXPECT_EQ(t[1], 's');
	EXPECT_EQ(t[2], 'd');
	EXPECT_EQ(t[3], 'f');
	EXPECT_EQ(t[4], 'g');
	EXPECT_EQ(t[5], 'h');
	EXPECT_EQ(t[6], 'i');
	EXPECT_EQ(t[7], 'j');
	EXPECT_EQ(t[8], '\0');
	EXPECT_EQ(syslibc_strlen(t), 8);
}

TEST(String, Strlen)
{
	const char* s = "asdf";
	EXPECT_EQ(syslibc_strlen(s), 4UL);

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
	EXPECT_EQ(syslibc_strlen(p), 10UL);
	free(p);
}
