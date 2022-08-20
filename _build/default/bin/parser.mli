
(* The type of tokens. *)

type token = 
  | VAR of (string)
  | RPARENS
  | LPARENS
  | LAMBDA
  | INT of (int)
  | EOF
  | ARROW

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val term_opt: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Tree.expr option)
