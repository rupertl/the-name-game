#!/usr/bin/env ruby

# Come on everybody
# I say now let's play a game
# I betcha I can make a rhyme
# Out of anybody's name

def combine(letter, name)
  # Combine a letter and a name according to the rules of the name game
  first = name[0].downcase
  stem = name[1..-1]

  if %w(a e i o u).include?(first)
    # Vowel rule: eg 'b' + "Emily" -> 'bemily"
    letter + first + stem
  elsif %w(c h t).include?(stem[0])
    # Two initial consonants: drop both, eg 'b' + "Shirley" -> "birley"
    letter + stem[1..-1]
  elsif %w(b f m).include?(letter) && letter == first
    # Letter matches first of name rule: eg 'm' + "Maggie" -> "aggie"
    # That's the only rule that is contrary
    stem
  else
    # Normal rule: eg 'f' + "Rupert" -> "fupert"
    letter + stem
  end
end

def rhyme_name(name)
  # Rhyme name according to the rules of the name game
  if name.length < 2 || name !~ /^[a-z]+$/i
    puts("#{name} isn't a name, so I can't rhyme")
  else 
    printf "%s, %s, ", name, name
    printf "bo-%s\n", combine('b', name)
    printf "Banana-fana fo-%s\n", combine('f', name)
    printf "Fee-fi mo-%s\n", combine('m', name)
    printf "%s!\n", name
  end
end

# Start of execution here

if ARGV.length != 1
  puts("usage: the-name-game NAME")
  exit 1
end

rhyme_name(ARGV[0])
exit 0
