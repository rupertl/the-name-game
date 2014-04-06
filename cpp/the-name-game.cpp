// Come on everybody
// I say now let's play a game
// I betcha I can make a rhyme
// Out of anybody's name

#include <cctype>
#include <iostream>
#include <set>
#include <string>

using std::set;
using std::string;

void rhyme_name(const string &name);
bool check_name(const string &name);
string combine(char letter, const string &name);

int main(int argc, char *argv[])
{
    if (argc != 2)
    {
        std::cout << "usage: the-name-game NAME" << std::endl;
        return 1;
    }

    rhyme_name(argv[1]);
    return 0;
}

void rhyme_name(const string &name)
{
    if (! check_name(name))
    {
        std::cout << name << " isn't a name, so I can't rhyme" << std::endl;
        return;
    }

    std::cout << name << ", " << name << ", ";
    std::cout << "bo-" << combine('b', name) << std::endl;
    std::cout << "Banana-fana fo-" << combine('f', name) << std::endl;
    std::cout << "Fee-fi mo-" << combine('m', name) << std::endl;
    std::cout << name << "!" << std::endl;
}

bool check_name(const string &name)
{
    // Check the name has at least two letters and all letters are alphabetic

    if (name.size() < 2)
    {
        return false;
    }

    for (const auto &letter : name)
    {
        if (! isalpha(letter))
        {
            return false;
        }
    }

    return true;
}

string combine(char letter, const string &name)
{
    // Combine a letter and a name according to the rules of the name game

    const static set<char> vowels               = {'a', 'e', 'i', 'o', 'u'};
    const static set<char> consonant_exceptions = {'b', 'f', 'm'};
    const static set<char> letter_2_exceptions  = {'c', 'h', 't'};

    char first = tolower(name[0]);
    string stem = name.substr(1);

    if (vowels.find(first) != vowels.end())
    {
        // Vowel rule: eg 'b' + "Emily" -> 'bemily"
        return string(1, letter) + first + stem;
    }
    else if (letter_2_exceptions.find(stem[0]) != letter_2_exceptions.end())
    {
        // Two initial consonants: drop both, eg 'b' + "Shirley" -> "birley"
        return letter + stem.substr(1);
    }
    else if (letter == first &&
             consonant_exceptions.find(first) != consonant_exceptions.end())
    {
        // Letter matches first of name rule: eg 'm' + "Maggie" -> "aggie"
        // That's the only rule that is contrary
        return stem;
    }
    else
    {
        // Normal rule: eg 'f' + "Rupert" -> "fupert"
        return letter + stem;
    }
}
