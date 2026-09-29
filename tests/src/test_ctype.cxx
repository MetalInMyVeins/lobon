#include <gtest/gtest.h>
#include <ctype.h>
#include <stdlib.h>

#include "syslibc_ctype.h"
#include "syslibc_string.h"

TEST(Ctype, Tolower)
{
	const char* s1 = "MACHINE";
	char s2[10];
	for (size_t i = 0; i < syslibc_strlen(s1); ++i)
	{
		s2[i] = syslibc_tolower(s1[i]);
		if (i == syslibc_strlen(s1) - 1)
			s2[i + 1] = '\0';
	}
	EXPECT_STREQ(s2, "machine");
}
