#!/usr/bin/Rscript --slave

# Come on everybody
# I say now let's play a game
# I betcha I can make a rhyme
# Out of anybody's name

# R is probably not the best language for text manipulation, but it is
# workable.

combine <- function(letter, name) {
  # Combine a letter and a name according to the rules of the name game

  first <- tolower(substring(name, 1, 1));
  stem <- substring(name, 2);

  if (grepl("[aeiou]", first)) {
    # Vowel rule: eg 'b' + "Emily" -> 'bemily"
    return(paste(letter, first, stem, sep=""));
  }
  else if (grepl("^[cht]", stem)) {
    # Two initial consonants: drop both, eg 'b' + "Shirley" -> "birley"
    return(paste(letter, substring(stem, 2), sep=""));
  }
  else if (grepl("[bfm]", letter) && letter == first) {
    # Letter matches first of name rule: eg 'm' + "Maggie" -> "aggie"
    # That's the only rule that is contrary
    return(stem);
  }
  else {
    # Normal rule: eg 'f' + "Rupert" -> "fupert"
    return(paste(letter, stem, sep=""));
  }
}

rhymeName <- function(name) {
  # Rhyme name according to the rules of the name game

  if (nchar(name) < 2 || ! grepl("^[a-zA-Z]+$", name)) {
    return(paste(name, "isn't a name, so I can't rhyme\n"));
  }

  return(paste(name, ", ", name, ", ",
               "bo-", combine('b', name), "\n",
               "Banana-fana fo-", combine('f', name), "\n",
               "Fee-fi mo-", combine('m', name), "\n",
               name, "!\n",
               sep=""));
}

# Execution starts here

argv <- commandArgs(TRUE)
if (length(argv) != 1) {
  cat("usage: the-name-game NAME\n")
  q(status = 1)
}

cat(rhymeName(argv[1]));
