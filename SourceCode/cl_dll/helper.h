// Helper.h by MegaVolt85
// Reimplements functions not supported by Windows CE
extern int stricmp(const char *a, const char *b);
extern int isspace(int character);
extern void *calloc(size_t nmemb, size_t size);
extern int strnicmp(const char *a, const char *b, int n);
extern int isprint(int ch);
extern int isalpha(int ch);
extern int isdigit(int ch);
extern int isalpha(int ch);
extern char *itoa(int value, char *str, int base);
extern int isalnum(int ch);