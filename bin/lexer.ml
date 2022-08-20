open Parser
open Sedlexing.Utf8

let whitespace = [%sedlex.regexp? Plus (' ' | '\t' | '\n')]
let alphabet = [%sedlex.regexp? 'a' .. 'z' | 'A' .. 'Z']
let variable = [%sedlex.regexp? (alphabet | '_'), Star (alphabet | '_')]
let digits = [%sedlex.regexp? Plus ('0' .. '9')]

let rec tokenizer buf =
  match%sedlex buf with 
  | whitespace -> tokenizer buf 
  | digits -> INT (int_of_string (lexeme buf))
  | "fun" -> LAMBDA
  | "->" -> ARROW
  | "(" -> LPARENS
  | ")" -> RPARENS
  | variable -> VAR (lexeme buf)
  | eof -> EOF
  | _ -> failwith "unknown token"

let provider buf () = 
  let token = tokenizer buf in 
  let start, stop = Sedlexing.lexing_positions buf in 
  (token, start, stop)

let from_string parse str =
  let buf = from_string str in 
  let provider = provider buf in 
  MenhirLib.Convert.Simplified.traditional2revised parse provider