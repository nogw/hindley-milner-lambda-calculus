let type_expr expr =
  Printf.printf "%s : %s\n" 
    (Tree.show_expr expr) 
    (Tree.show_type (Typer.type_of expr))
;;

let () =
  [ "fun id -> id"
  ; "fun x -> fun y -> y(x)"
  ; "(fun id -> id) 1"
  ; "(fun id -> (fun x -> x) id) ((fun id -> id) 1)"
  ]
  |> List.iter (
    fun e -> 
      Lexer.from_string Parser.term_opt e 
      |> Option.get 
      |> type_expr
  );;