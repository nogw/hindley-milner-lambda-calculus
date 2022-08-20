# hindley-milner-lambda-calculus
a very simple implementation of the hindley-milner type system

```ocaml
(* 'a -> 'a *)
fun id -> id

(* 'a -> ('a -> 'b) -> 'b *)
fun x -> fun y -> y(x)

(* int *)
(fun id -> id) 1

(* int *)
(fun id -> (fun x -> x) id) ((fun id -> id) 1)
```