// Stricmp replacement by MegaVolt85

int stricmp(const char *a, const char *b)
{
    const char *s1 = a, *s2 = b;
  
    while (toupper(*s1) == toupper(*s2))
    {
        if (*s1 == 0)
            return 0;
        s1++;
        s2++;
    }
  
    return toupper(*(unsigned const char *)s1) - toupper(*(unsigned const char *)(s2));
}