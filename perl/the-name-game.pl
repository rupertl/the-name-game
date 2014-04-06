#!/usr/bin/env perl

# Come on everybody
# I say now let's play a game
# I betcha I can make a rhyme
# Out of anybody's name

# This being Perl, of course there is a CPAN module to do what you
# want in Lingua::EN::Namegame. However it's fun to do it yourself,

use strict;
use warnings;

my $help_short = "-h";
my $help_long = "--help";
if (scalar(@ARGV) != 1)
{
    print("usage: the-name-game NAME\n");
    exit 1;
}

rhyme_name($ARGV[0]);
exit 0;

sub rhyme_name
{
    my $name = shift;
    if (! check_name($name))
    {
        printf("%s isn't a name, so I can't rhyme\n", $name);
        return;
    }

    printf("%s, %s, ", $name, $name);
    printf("bo-%s\n", combine('b', $name));
    printf("Banana-fana fo-%s\n", combine('f', $name));
    printf("Fee-fi mo-%s\n", combine('m', $name));
    printf("%s!\n", $name);
}

sub check_name
{
    # Check the name has at least two letters and all letters are alphabetic

    my $name = shift;

    return if length($name) < 2;
    return $name =~ /^[a-z]+$/i;
}

sub combine
{
    # Combine a letter and a name according to the rules of the name game

    my ($letter, $name) = @_;
    
    my ($first, @rest) = split('', lc($name));
    my $stem = join('', @rest);
                               
    if ($first =~ /[aeiou]/i)
    {
        # Vowel rule: eg 'b' + "Emily" -> 'bemily"
        return $letter . $first . $stem;
    }
    elsif ($stem =~ /^[cht]/)
    {
        # Two initial consonants: drop both, eg 'b' + "Shirley" -> "birley"
        return $letter . substr($stem, 1);
    }
    elsif (($letter =~ /[bfm]/) && $letter eq $first)
    {
        # Letter matches first of name rule: eg 'm' + "Maggie" -> "aggie"
        # That's the only rule that is contrary
        return $stem;
    }
    else
    {
        # Normal rule: eg 'f' + "Rupert" -> "fupert"
        return $letter  . $stem;
    }
}
