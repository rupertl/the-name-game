import java.lang.RuntimeException;

public class Name
{
    private String name;

    /** Constructs a new name and checks if it is invalid */
    Name(String the_name) throws IllegalArgumentException
    {
        if (the_name.length() < 2 || ! the_name.matches("[a-zA-Z]+"))
        {
            throw new IllegalArgumentException(
                the_name + " isn't a name that I can rhyme");
        }

        name = the_name;
    }

    /** Return a rhyme for the name */
    public String rhyme()
    {
        String rhyme = new String();

        rhyme  = name + ", " + name + ", bo-" + combine("b") + "\n";
        rhyme += "Banana-fana fo-" + combine("f") + "\n";
        rhyme += "Fee-fi mo-" + combine("m") + "\n";
        rhyme += name + "!";

        return rhyme;
    }

    /** Combine a letter and a name according to the rules of the name game */
    private String combine(String letter)
    {
        String first = name.substring(0, 1).toLowerCase();
        String stem = name.substring(1);

        System.out.println("first " + first + ", stem " + stem);

        if (first.matches("[aeiou]"))
        {
            // Vowel rule: eg 'b' + "Emily" -> 'bemily"
            return new String(letter + first + stem);
        }
        else if (stem.substring(0, 1).matches("[cht]"))
        {
            // Two initial consonants: drop both, eg 'b' + "Shirley" -> "birley"
            return new String(letter + stem.substring(1));
        }
        else if (letter.matches("[bfm]") && letter.equals(first))
        {
            // Letter matches first of name rule: eg 'm' + "Maggie" -> "aggie"
            // That's the only rule that is contrary
            return stem;
        }
        else
        {
            // Normal rule: eg 'f' + "Rupert" -> "fupert"
            return new String(letter + stem);
        }
    }
}
