#ifndef LOBON_CTYPE_H
#define LOBON_CTYPE_H

#ifdef __cplusplus
extern "C" {
#endif

int lobon_isalnum(int c);
int lobon_isalpha(int c);
int lobon_isblank(int c);
int lobon_iscntrl(int c);
int lobon_isdigit(int c);
int lobon_isgraph(int c);
int lobon_islower(int c);
int lobon_isprint(int c);
int lobon_ispunct(int c);
int lobon_isspace(int c);
int lobon_isupper(int c);
int lobon_isxdigit(int c);
int lobon_tolower(int c);
int lobon_toupper(int c);

#ifdef __cplusplus
}
#endif

#endif // LOBON_CTYPE_H
