#!/usr/bin/env ocaml

(*
   Come on everybody
   I say now let's play a game
   I betcha I can make a rhyme
   Out of anybody's name
*)

#load "str.cma"

open Printf
open Str

let combine letter name =
  (* Combine a letter and a name according to the rules of the name game *)
  let first = String.lowercase (String.sub name 0 1) in
  let stem =  String.sub name 1 ((String.length name) - 1) in
  if Str.string_match (regexp "[aeiou]") first 0
  then
    (* Vowel rule: eg 'b' + "Emily" -> "bemily" *)
    letter ^ first ^ stem
  else if Str.string_match (regexp "^[cht].*") stem 0
  then
    (* Two initial consonants: drop both, eg 'b' + "Shirley" -> "birley" *)
    letter ^ String.sub stem 1 ((String.length stem) -1)
  else if (Str.string_match (regexp "[bfm]") letter 0) && letter = first
  then
    (* Letter matches first of name rule: eg 'm' + "Maggie" -> "aggie"
     * That's the only rule that is contrary *)
    stem
  else
    (* Normal rule: eg 'f' + "Rupert" -> "fupert" *)
    letter ^ stem


let rhyme_name name =
  (* Rhyme name according to the rules of the name game *)
  if String.length name < 2 ||
    not(Str.string_match (regexp_case_fold "^[a-z]+$") name 0)
  then
    name ^ " isn't a name, so I can't rhyme"
  else
    name ^ ", " ^ name ^ ", bo-" ^ (combine "b" name) ^ "\n" ^
      "Banana-fana fo-" ^ (combine "f" name) ^ "\n" ^
      "Fee-fi mo-" ^ (combine "m" name) ^ "\n" ^
      name ^ "!"


let () =
  if Array.length Sys.argv <> 2
  then
    (printf "usage: the-name-game NAME\n"; exit 1)
  else
    printf "%s\n" (rhyme_name Sys.argv.(1));

(* What an interesting language. Really like the type inference, but
   the syntax needs some getting use to. *)
