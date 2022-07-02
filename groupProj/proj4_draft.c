#define NULL ((void *))

char* strchr(char* s, char c)
{
    while(*s != 0 && *s != c) 
        ++s;

    if(*s == 0)
        return 0;
    else
        return s;
}