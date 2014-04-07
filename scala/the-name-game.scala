#!/bin/sh
exec scala -savecompiled "$0" "$@"
!#

// Come on everybody
// I say now let's play a game
// I betcha I can make a rhyme
// Out of anybody's name

if (args.length != 1) {
  println("usage: the-name-game NAME")
  System.exit(1)
}

println(rhyme_name(args(0)))
System.exit(0)

def rhyme_name(name: String):String = {
  // Rhyme name according to the rules of the name game
  if (name.length < 2 || ! name.matches("(?i)^[a-z]+$"))
    name + " isn't a name, so I can't rhyme"
  else {
    name + ", " + name + ", bo-" + combine("b", name) + "\n" +
    "Banana-fana fo-" + combine("f", name) + "\n" +
    "Fee-fi mo-" + combine("m", name) + "\n" +
    name + "!"
  }
}

def combine(letter: String, name:String): String = {
  // Combine a letter and a name according to the rules of the name game
  val first = name.substring(0, 1).toLowerCase()
  val stem = name.substring(1)

  if (first.matches("[aeiou]"))
    // Vowel rule: eg 'b' + "Emily" -> 'bemily"
    letter + first + stem
  else if (stem.matches("^[cht].*")) {
    // Two initial consonants: drop both, eg 'b' + "Shirley" -> "birley"
    letter + stem.substring(1)
  }
  else if (letter.matches("[bfm]") && letter == first)
    // Letter matches first of name rule: eg 'm' + "Maggie" -> "aggie"
    // That's the only rule that is contrary
    stem
  else
    // Normal rule: eg 'f' + "Rupert" -> "fupert"
    letter + stem
}
