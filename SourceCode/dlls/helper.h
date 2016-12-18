// Helper.h by MegaVolt85
// Reimplements functions not supported by Windows CE
extern const void *calloc(size_t nmemb, size_t size);
extern const char *itoa(int value, char *str, int base);
extern const int isspace(int character);
extern const int isprint(int ch);
extern const int isalpha(int ch);
extern const int isdigit(int ch);
extern const int isalnum(int ch);
extern const int stricmp(const char *a, const char *b);
extern const int strnicmp(const char *a, const char *b, int n);