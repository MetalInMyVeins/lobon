#include <gtest/gtest.h>

#include "lobon_ctype.h"
#include "lobon_string.h"

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
