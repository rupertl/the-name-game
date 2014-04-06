;; Come on everybody
;; I say now let's play a game
;; I betcha I can make a rhyme
;; Out of anybody's name

(defun tng-combine (letter name)
  "Combine LETTER and NAME, eg b and Ann to bann"
  (let* ((name (downcase name))
         (stem (substring name 1))
         (first (substring name 0 1))
         (second (substring name 1 2)))

    (cond ((member first '("a" "e" "i" "o" "u"))
           ;; Vowel rule: eg 'b' + "Emily" -> 'bemily"
           (concat letter name))

          ((member second '("c" "h" "t"))
           ;; Two initial consonants: drop both, eg 'b' + "Shirley" -> "birley"
           (concat letter (substring stem 1)))

          ((and (equal letter first)
                (member first '("b" "m" "f")))
           ;; Letter matches first of name rule: eg 'm' + "Maggie" -> "aggie"
           ;; That's the only rule that is contrary
           stem)

          (t
           ;; Normal rule: eg 'f' + "Rupert" -> "fupert"
           (concat letter stem)))))


(defun tng-rhyme (name)
  "Check is NAME can be rhymed and if so constructs the rhyme."
  (if (or (< (length name) 2)
          (string-match "[^[:alpha:]]" name))
      (error (concat name " isn't a name, so I can't rhyme")))

  (concat
   (format "%s, %s, bo-%s\n" name name (tng-combine "b" name))
   (format "Banana-fana fo-%s\n" (tng-combine "f" name))
   (format "Fee-fi mo-%s\n"  (tng-combine "m" name))
   (format "%s!"  name)))


(defun the-name-game (name)
  "Returns a rhyme for NAME according to the rules of The Name Game."
  (interactive "sName: ")
    (princ (tng-rhyme name)))


(defun the-name-game-batch ()
  "Runs the-name-game using the first command line argument."
  ;; eg emacs -Q --batch --load=the-name-game.el
  ;;          --funcall=the-name-game-batch NAME
  (the-name-game (car argv)))
