// Come on everybody
// I say now let's play a game
// I betcha I can make a rhyme
// Out of anybody's name

import java.lang.RuntimeException;

public class TheNameGame
{
    public static void main(String args[])
    {
        if (args.length != 1)
        {
             throw new RuntimeException("usage: the-name-game NAME");
        }

        Name n = new Name(args[0]);
        System.out.println(n.rhyme());
        System.exit(0);
    }
}
