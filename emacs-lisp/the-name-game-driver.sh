#!/bin/sh

# Call emacs to run the-name-game-batch with first arg as parameter
emacs -Q --batch --load=emacs-lisp/the-name-game.el --funcall=the-name-game-batch $1 2> /dev/null

