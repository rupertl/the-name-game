// Come on everybody
// I say now let's play a game
// I betcha I can make a rhyme
// Out of anybody's name

use std::os;
use std::ascii::StrAsciiExt;

fn rhyme_name(name: &str) -> String {
    // Rhyme name according to the rules of the name game
    if name.len() < 2  || name.char_at(0) < 'A' || name.char_at(0) > 'Z' {
        name.to_string() + " isn't a name, so I can't rhyme"
    } else {
        name.to_string() +  ", " + name + ", bo-" + combine("b", name) + "\n" +
            "Banana-fana fo-" + combine("f", name) + "\n" +
            "Fee-fi mo-" + combine("m", name) + "\n" +
            name + "!"
    }
}

fn is_vowel(letter: char) -> bool {
    match letter { 'a' | 'e' | 'i' | 'o' | 'u' => true, _ => false }
}

fn is_c_h_or_t(letter: char) -> bool {
    match letter { 'c' | 'h' | 't' => true, _ => false }
}

fn is_b_f_or_m(letter: char) -> bool {
    match letter { 'b' | 'f' | 'm' => true, _ => false }
}

fn combine(letter: &str, name: &str) -> String {
    // Combine a letter and a name according to the rules of the name game
    let first = name.to_ascii_lower().as_slice().char_at(0);
    let stem = name.slice_from(1);

    if is_vowel(first) {
        // Vowel rule: eg 'b' + "Emily" -> 'bemily"
        letter.to_string() + first.to_string() + stem
    }
    else if stem.len() > 2 && is_c_h_or_t(stem.char_at(0)) {
        // Two initial consonants: drop both, eg 'b' + "Shirley" -> "birley"
        letter.to_string() + stem.slice_from(1)
    } else if letter.char_at(0) == first && is_b_f_or_m(first) {
        // Letter matches first of name rule: eg 'm' + "Maggie" -> "aggie"
        // That's the only rule that is contrary
        stem.to_string()
    } else {
        // Normal rule: eg 'f' + "Rupert" -> "fupert"
        letter.to_string() + stem
    }

}

fn main() {
    let args = os::args();
    if args.len() != 2 {
        println!("usage: the-name-game NAME");
        os::set_exit_status(1);
    }
    else {
        println!("{}", rhyme_name(args[1].as_slice()));
        os::set_exit_status(0);
    }
}
