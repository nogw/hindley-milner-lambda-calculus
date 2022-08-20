type type_expr =
  | TyInt
  | TyVar of string
  | TyArrow of type_expr * type_expr

let rec show_type = function
  | TyVar v -> v
  | TyInt -> "int"
  | TyArrow (f, c) ->
    (match f with
     | TyArrow _ -> "(" ^ show_type f ^ ")"
     | _ -> show_type f) ^ " -> " ^ show_type c
;;

type expr =
  | Int of int
  | Var of string
  | Abs of string * expr
  | App of expr * expr

let rec show_expr = function
  | Var v -> v
  | Abs (param, body) -> Printf.sprintf "[λ%s -> %s]" param (show_expr body)
  | App (func, value) -> Printf.sprintf "%s(%s)" (show_expr func) (show_expr value)
  | Int v -> string_of_int v;;
