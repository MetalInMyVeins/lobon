#include <gtest/gtest.h>

#include "lobon_ctype.h"
#include "lobon_string.h"

TEST(Ctype, Isdigit)
{
	const char* s = "0123456789abcd";
	for (size_t i = 0; i < lobon_strlen(s); ++i)
	{
		if (i <= 9)
			EXPECT_EQ(lobon_isdigit(s[i]), true);
		else
			EXPECT_EQ(lobon_isdigit(s[i]), false);
	}
}

TEST(Ctype, Islower)
{
	const char* s = "01#asdfAiZ0";
	EXPECT_EQ(lobon_islower(s[0]), false);
	EXPECT_EQ(lobon_islower(s[1]), false);
	EXPECT_EQ(lobon_islower(s[2]), false);
	EXPECT_EQ(lobon_islower(s[3]), true);
	EXPECT_EQ(lobon_islower(s[4]), true);
	EXPECT_EQ(lobon_islower(s[5]), true);
	EXPECT_EQ(lobon_islower(s[6]), true);
	EXPECT_EQ(lobon_islower(s[7]), false);
	EXPECT_EQ(lobon_islower(s[8]), true);
	EXPECT_EQ(lobon_islower(s[9]), false);
	EXPECT_EQ(lobon_islower(s[10]), false);
}

TEST(Ctype, Isupper)
{
	const char* s = "01#asdfAFZ0";
	EXPECT_EQ(lobon_isupper(s[0]), false);
	EXPECT_EQ(lobon_isupper(s[1]), false);
	EXPECT_EQ(lobon_isupper(s[2]), false);
	EXPECT_EQ(lobon_isupper(s[3]), false);
	EXPECT_EQ(lobon_isupper(s[4]), false);
	EXPECT_EQ(lobon_isupper(s[5]), false);
	EXPECT_EQ(lobon_isupper(s[6]), false);
	EXPECT_EQ(lobon_isupper(s[7]), true);
	EXPECT_EQ(lobon_isupper(s[8]), true);
	EXPECT_EQ(lobon_isupper(s[9]), true);
	EXPECT_EQ(lobon_isupper(s[10]), false);
}

TEST(Ctype, Tolower)
{
	const char* s1 = "MACHINE";
	char s2[10];
	for (size_t i = 0; i < lobon_strlen(s1); ++i)
	{
		s2[i] = lobon_tolower(s1[i]);
		if (i == lobon_strlen(s1) - 1)
			s2[i + 1] = '\0';
	}
	EXPECT_STREQ(s2, "machine");
}

TEST(Ctype, Toupper)
{
	const char* s1 = "machine";
	char s2[10];
	for (size_t i = 0; i < lobon_strlen(s1); ++i)
	{
		s2[i] = lobon_toupper(s1[i]);
		if (i == lobon_strlen(s1) - 1)
			s2[i + 1] = '\0';
	}
	EXPECT_STREQ(s2, "MACHINE");
}
