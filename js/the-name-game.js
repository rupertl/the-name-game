#!/usr/bin/env nodejs

// Come on everybody
// I say now let's play a game
// I betcha I can make a rhyme
// Out of anybody's name

// Combine LETTER and NAME, eg b and Ann to bann
function combine(letter, name) {
    var first = name.charAt(0).toLowerCase();
    var stem = name.substring(1);

    if (first.match(/[aeiou]/)) {
        // Vowel rule: eg 'b' + "Emily" -> 'bemily"
        return letter + first + stem;
    } else if (stem.charAt(0).match(/[cht]/)) {
        // Two initial consonants: drop both, eg 'b' + "Shirley" -> "birley"
        return letter + stem.substring(1);
    } else if (first.match(/[bmf]/) && letter == first) {
        // Letter matches first of name rule: eg 'm' + "Maggie" -> "aggie"
        // That's the only rule that is contrary
        return stem;
    } else {
        // Normal rule: eg 'f' + "Rupert" -> "fupert"
        return letter + stem;
    }
}

// Check if name can be rhymed and if so constructs the rhyme.
function rhyme_name(name) {
    if (name.length < 2 || ! name.match(/^[a-z]+$/i)) {
        return name + " isn't a name, so I can't rhyme";
    }

    return name + ", " + name + ", bo-" + combine("b", name) + "\n" +
        "Banana-fana fo-" + combine("f", name) + "\n" +
        "Fee-fi mo-" + combine("m", name) + "\n" +
        name + "!";
}

if (process.argv.length < 3) {
    console.log("usage: the-name-game NAME");
    process.exit(1);
}

console.log(rhyme_name(process.argv[2]));
