/*
Come on everybody
I say now let's play a game
I betcha I can make a rhyme
Out of anybody's name
*/

#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void rhyme_name(const char *name);
int check_name(const char *name);
char * combine(char letter, const char *name, char *buffer);

int main(int argc, char *argv[])
{
    if (argc != 2)
    {
        puts("usage: the-name-game NAME\n");
        return 1;
    }

    rhyme_name(argv[1]);
    return 0;
}

void rhyme_name(const char *name)
{
    if (! check_name(name))
    {
        printf("%s isn't a name, so I can't rhyme\n", name);
        return;
    }

    char *out = malloc(strlen(name) + 3);
    if (! out)
    {
        printf("I don't have enough memory to rhyme\n");
        return;
    }

    printf("%s, %s, ", name, name);
    printf("bo-%s\n", combine('b', name, out));
    printf("Banana-fana fo-%s\n", combine('f', name, out));
    printf("Fee-fi mo-%s\n", combine('m', name, out));
    printf("%s!\n", name);

    free(out);
}

int check_name(const char *name)
{
    // Check the name has at least two letters and all letters are alphabetic

    if (strlen(name) < 2)
    {
        return 0;
    }

    for (int i = 0; i < strlen(name); ++i)
    {
        if (! isalpha(name[i]))
        {
            return 0;
        }
    }

    return 1;
}

char * combine(char letter, const char *name, char *buffer)
{
    // Combine a letter and a name according to the rules of the name game
    // Copies to buffer, which must be able to hold name + 3 bytes
    // and returns buffer also.

    char first = tolower(name[0]);
    const char *stem = name + 1;

    if (first == 'a' || first == 'e' || first == 'i' ||
        first == 'o' || first == 'u')
    {
        // Vowel rule: eg 'b' + "Emily" -> 'bemily"
        sprintf(buffer, "%c%c%s", letter, first, stem);
    }
    else if (stem[0] == 'c' || stem[0] == 'h' || stem[0] == 't')
    {
        // Two initial consonants: drop both, eg 'b' + "Shirley" -> "birley"
        sprintf(buffer, "%c%s", letter, stem + 1);
    }
    else if ((letter == 'b' || letter == 'f' || letter == 'm') &&
             letter == first)
    {
        // Letter matches first of name rule: eg 'm' + "Maggie" -> "aggie"
        // That's the only rule that is contrary
        strcpy(buffer, stem);
    }
    else
    {
        // Normal rule: eg 'f' + "Rupert" -> "fupert"
        sprintf(buffer, "%c%s", letter, stem);
    }

    return buffer;
}
