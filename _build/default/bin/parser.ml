
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | VAR of (
# 5 "bin/parser.mly"
       (string)
# 15 "bin/parser.ml"
  )
    | RPARENS
    | LPARENS
    | LAMBDA
    | INT of (
# 6 "bin/parser.mly"
       (int)
# 23 "bin/parser.ml"
  )
    | EOF
    | ARROW
  
end

include MenhirBasics

# 1 "bin/parser.mly"
  
  open Tree

# 36 "bin/parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_term_opt) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: term_opt. *)

  | MenhirState02 : (('s, _menhir_box_term_opt) _menhir_cell1_LPARENS, _menhir_box_term_opt) _menhir_state
    (** State 02.
        Stack shape : LPARENS.
        Start symbol: term_opt. *)

  | MenhirState03 : (('s, _menhir_box_term_opt) _menhir_cell1_LAMBDA, _menhir_box_term_opt) _menhir_state
    (** State 03.
        Stack shape : LAMBDA.
        Start symbol: term_opt. *)

  | MenhirState04 : (('s, _menhir_box_term_opt) _menhir_cell1_VAR, _menhir_box_term_opt) _menhir_state
    (** State 04.
        Stack shape : VAR.
        Start symbol: term_opt. *)

  | MenhirState07 : ((('s, _menhir_box_term_opt) _menhir_cell1_LAMBDA, _menhir_box_term_opt) _menhir_cell1_nonempty_list_VAR_, _menhir_box_term_opt) _menhir_state
    (** State 07.
        Stack shape : LAMBDA nonempty_list(VAR).
        Start symbol: term_opt. *)

  | MenhirState09 : (((('s, _menhir_box_term_opt) _menhir_cell1_LAMBDA, _menhir_box_term_opt) _menhir_cell1_nonempty_list_VAR_, _menhir_box_term_opt) _menhir_cell1_expr_var, _menhir_box_term_opt) _menhir_state
    (** State 09.
        Stack shape : LAMBDA nonempty_list(VAR) expr_var.
        Start symbol: term_opt. *)

  | MenhirState13 : (((('s, _menhir_box_term_opt) _menhir_cell1_LAMBDA, _menhir_box_term_opt) _menhir_cell1_nonempty_list_VAR_, _menhir_box_term_opt) _menhir_cell1_expr_parens, _menhir_box_term_opt) _menhir_state
    (** State 13.
        Stack shape : LAMBDA nonempty_list(VAR) expr_parens.
        Start symbol: term_opt. *)

  | MenhirState18 : (((('s, _menhir_box_term_opt) _menhir_cell1_LAMBDA, _menhir_box_term_opt) _menhir_cell1_nonempty_list_VAR_, _menhir_box_term_opt) _menhir_cell1_expr_int, _menhir_box_term_opt) _menhir_state
    (** State 18.
        Stack shape : LAMBDA nonempty_list(VAR) expr_int.
        Start symbol: term_opt. *)

  | MenhirState22 : (((('s, _menhir_box_term_opt) _menhir_cell1_LAMBDA, _menhir_box_term_opt) _menhir_cell1_nonempty_list_VAR_, _menhir_box_term_opt) _menhir_cell1_expr_apply, _menhir_box_term_opt) _menhir_state
    (** State 22.
        Stack shape : LAMBDA nonempty_list(VAR) expr_apply.
        Start symbol: term_opt. *)

  | MenhirState26 : ((('s, _menhir_box_term_opt) _menhir_cell1_LPARENS, _menhir_box_term_opt) _menhir_cell1_expr_var, _menhir_box_term_opt) _menhir_state
    (** State 26.
        Stack shape : LPARENS expr_var.
        Start symbol: term_opt. *)

  | MenhirState28 : ((('s, _menhir_box_term_opt) _menhir_cell1_LPARENS, _menhir_box_term_opt) _menhir_cell1_expr_parens, _menhir_box_term_opt) _menhir_state
    (** State 28.
        Stack shape : LPARENS expr_parens.
        Start symbol: term_opt. *)

  | MenhirState32 : ((('s, _menhir_box_term_opt) _menhir_cell1_LPARENS, _menhir_box_term_opt) _menhir_cell1_expr_int, _menhir_box_term_opt) _menhir_state
    (** State 32.
        Stack shape : LPARENS expr_int.
        Start symbol: term_opt. *)

  | MenhirState34 : ((('s, _menhir_box_term_opt) _menhir_cell1_LPARENS, _menhir_box_term_opt) _menhir_cell1_expr_apply, _menhir_box_term_opt) _menhir_state
    (** State 34.
        Stack shape : LPARENS expr_apply.
        Start symbol: term_opt. *)

  | MenhirState38 : (('s, _menhir_box_term_opt) _menhir_cell1_expr_var, _menhir_box_term_opt) _menhir_state
    (** State 38.
        Stack shape : expr_var.
        Start symbol: term_opt. *)

  | MenhirState40 : (('s, _menhir_box_term_opt) _menhir_cell1_expr_parens, _menhir_box_term_opt) _menhir_state
    (** State 40.
        Stack shape : expr_parens.
        Start symbol: term_opt. *)

  | MenhirState44 : (('s, _menhir_box_term_opt) _menhir_cell1_expr_int, _menhir_box_term_opt) _menhir_state
    (** State 44.
        Stack shape : expr_int.
        Start symbol: term_opt. *)

  | MenhirState46 : (('s, _menhir_box_term_opt) _menhir_cell1_expr_apply, _menhir_box_term_opt) _menhir_state
    (** State 46.
        Stack shape : expr_apply.
        Start symbol: term_opt. *)


and ('s, 'r) _menhir_cell1_expr_apply = 
  | MenhirCell1_expr_apply of 's * ('s, 'r) _menhir_state * (Tree.expr)

and ('s, 'r) _menhir_cell1_expr_int = 
  | MenhirCell1_expr_int of 's * ('s, 'r) _menhir_state * (Tree.expr)

and ('s, 'r) _menhir_cell1_expr_parens = 
  | MenhirCell1_expr_parens of 's * ('s, 'r) _menhir_state * (Tree.expr)

and ('s, 'r) _menhir_cell1_expr_var = 
  | MenhirCell1_expr_var of 's * ('s, 'r) _menhir_state * (Tree.expr)

and ('s, 'r) _menhir_cell1_nonempty_list_VAR_ = 
  | MenhirCell1_nonempty_list_VAR_ of 's * ('s, 'r) _menhir_state * (string list)

and ('s, 'r) _menhir_cell1_LAMBDA = 
  | MenhirCell1_LAMBDA of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LPARENS = 
  | MenhirCell1_LPARENS of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_VAR = 
  | MenhirCell1_VAR of 's * ('s, 'r) _menhir_state * (
# 5 "bin/parser.mly"
       (string)
# 150 "bin/parser.ml"
)

and _menhir_box_term_opt = 
  | MenhirBox_term_opt of (Tree.expr option) [@@unboxed]

let _menhir_action_01 =
  fun _1 _1_inlined1 ->
    let arg = _1_inlined1 in
    let lambda = _1 in
    (
# 42 "bin/parser.mly"
                                          ( App (lambda, arg) )
# 163 "bin/parser.ml"
     : (Tree.expr))

let _menhir_action_02 =
  fun _1 _1_inlined1 ->
    let arg = _1_inlined1 in
    let lambda = _1 in
    (
# 42 "bin/parser.mly"
                                          ( App (lambda, arg) )
# 173 "bin/parser.ml"
     : (Tree.expr))

let _menhir_action_03 =
  fun _1 _1_inlined1 ->
    let arg = _1_inlined1 in
    let lambda = _1 in
    (
# 42 "bin/parser.mly"
                                          ( App (lambda, arg) )
# 183 "bin/parser.ml"
     : (Tree.expr))

let _menhir_action_04 =
  fun _1 _1_inlined1 ->
    let arg = _1_inlined1 in
    let lambda = _1 in
    (
# 42 "bin/parser.mly"
                                          ( App (lambda, arg) )
# 193 "bin/parser.ml"
     : (Tree.expr))

let _menhir_action_05 =
  fun _1 _1_inlined1 ->
    let arg = _1_inlined1 in
    let lambda = _1 in
    (
# 42 "bin/parser.mly"
                                          ( App (lambda, arg) )
# 203 "bin/parser.ml"
     : (Tree.expr))

let _menhir_action_06 =
  fun _1 _1_inlined1 ->
    let arg = _1_inlined1 in
    let lambda = _1 in
    (
# 42 "bin/parser.mly"
                                          ( App (lambda, arg) )
# 213 "bin/parser.ml"
     : (Tree.expr))

let _menhir_action_07 =
  fun _1 _1_inlined1 ->
    let arg = _1_inlined1 in
    let lambda = _1 in
    (
# 42 "bin/parser.mly"
                                          ( App (lambda, arg) )
# 223 "bin/parser.ml"
     : (Tree.expr))

let _menhir_action_08 =
  fun _1 _1_inlined1 ->
    let arg = _1_inlined1 in
    let lambda = _1 in
    (
# 42 "bin/parser.mly"
                                          ( App (lambda, arg) )
# 233 "bin/parser.ml"
     : (Tree.expr))

let _menhir_action_09 =
  fun _1 _1_inlined1 ->
    let arg = _1_inlined1 in
    let lambda = _1 in
    (
# 42 "bin/parser.mly"
                                          ( App (lambda, arg) )
# 243 "bin/parser.ml"
     : (Tree.expr))

let _menhir_action_10 =
  fun _1 lambda ->
    let arg = _1 in
    (
# 43 "bin/parser.mly"
                                          ( App (lambda, arg) )
# 252 "bin/parser.ml"
     : (Tree.expr))

let _menhir_action_11 =
  fun _1 lambda ->
    let arg = _1 in
    (
# 43 "bin/parser.mly"
                                          ( App (lambda, arg) )
# 261 "bin/parser.ml"
     : (Tree.expr))

let _menhir_action_12 =
  fun _1 lambda ->
    let arg = _1 in
    (
# 43 "bin/parser.mly"
                                          ( App (lambda, arg) )
# 270 "bin/parser.ml"
     : (Tree.expr))

let _menhir_action_13 =
  fun num ->
    (
# 35 "bin/parser.mly"
               ( Int num )
# 278 "bin/parser.ml"
     : (Tree.expr))

let _menhir_action_14 =
  fun _1 _1_inlined1 _3 params ->
    let body = _1_inlined1 in
    (
# 39 "bin/parser.mly"
    ( List.fold_right (fun param body -> Abs (param, body) ) params body )
# 287 "bin/parser.ml"
     : (Tree.expr))

let _menhir_action_15 =
  fun _1 _1_inlined1 _3 params ->
    let body = _1_inlined1 in
    (
# 39 "bin/parser.mly"
    ( List.fold_right (fun param body -> Abs (param, body) ) params body )
# 296 "bin/parser.ml"
     : (Tree.expr))

let _menhir_action_16 =
  fun _1 _1_inlined1 _3 params ->
    let body = _1_inlined1 in
    (
# 39 "bin/parser.mly"
    ( List.fold_right (fun param body -> Abs (param, body) ) params body )
# 305 "bin/parser.ml"
     : (Tree.expr))

let _menhir_action_17 =
  fun _1 _1_inlined1 _3 params ->
    let body = _1_inlined1 in
    (
# 39 "bin/parser.mly"
    ( List.fold_right (fun param body -> Abs (param, body) ) params body )
# 314 "bin/parser.ml"
     : (Tree.expr))

let _menhir_action_18 =
  fun _1 _1_inlined1 _3 params ->
    let body = _1_inlined1 in
    (
# 39 "bin/parser.mly"
    ( List.fold_right (fun param body -> Abs (param, body) ) params body )
# 323 "bin/parser.ml"
     : (Tree.expr))

let _menhir_action_19 =
  fun _1 _1_inlined1 _3 ->
    let expr = _1_inlined1 in
    (
# 46 "bin/parser.mly"
                                   ( expr )
# 332 "bin/parser.ml"
     : (Tree.expr))

let _menhir_action_20 =
  fun _1 _1_inlined1 _3 ->
    let expr = _1_inlined1 in
    (
# 46 "bin/parser.mly"
                                   ( expr )
# 341 "bin/parser.ml"
     : (Tree.expr))

let _menhir_action_21 =
  fun _1 _1_inlined1 _3 ->
    let expr = _1_inlined1 in
    (
# 46 "bin/parser.mly"
                                   ( expr )
# 350 "bin/parser.ml"
     : (Tree.expr))

let _menhir_action_22 =
  fun _1 _1_inlined1 _3 ->
    let expr = _1_inlined1 in
    (
# 46 "bin/parser.mly"
                                   ( expr )
# 359 "bin/parser.ml"
     : (Tree.expr))

let _menhir_action_23 =
  fun _1 _1_inlined1 _3 ->
    let expr = _1_inlined1 in
    (
# 46 "bin/parser.mly"
                                   ( expr )
# 368 "bin/parser.ml"
     : (Tree.expr))

let _menhir_action_24 =
  fun var ->
    (
# 32 "bin/parser.mly"
               ( Var var )
# 376 "bin/parser.ml"
     : (Tree.expr))

let _menhir_action_25 =
  fun x ->
    (
# 218 "<standard.mly>"
    ( [ x ] )
# 384 "bin/parser.ml"
     : (string list))

let _menhir_action_26 =
  fun x xs ->
    (
# 220 "<standard.mly>"
    ( x :: xs )
# 392 "bin/parser.ml"
     : (string list))

let _menhir_action_27 =
  fun _1 ->
    (
# 18 "bin/parser.mly"
         ( None )
# 400 "bin/parser.ml"
     : (Tree.expr option))

let _menhir_action_28 =
  fun _1 _2 ->
    let expr = _1 in
    (
# 19 "bin/parser.mly"
                      ( Some expr )
# 409 "bin/parser.ml"
     : (Tree.expr option))

let _menhir_action_29 =
  fun _1 _2 ->
    let expr = _1 in
    (
# 19 "bin/parser.mly"
                      ( Some expr )
# 418 "bin/parser.ml"
     : (Tree.expr option))

let _menhir_action_30 =
  fun _1 _2 ->
    let expr = _1 in
    (
# 19 "bin/parser.mly"
                      ( Some expr )
# 427 "bin/parser.ml"
     : (Tree.expr option))

let _menhir_action_31 =
  fun _1 _2 ->
    let expr = _1 in
    (
# 19 "bin/parser.mly"
                      ( Some expr )
# 436 "bin/parser.ml"
     : (Tree.expr option))

let _menhir_action_32 =
  fun _1 _2 ->
    let expr = _1 in
    (
# 19 "bin/parser.mly"
                      ( Some expr )
# 445 "bin/parser.ml"
     : (Tree.expr option))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | ARROW ->
        "ARROW"
    | EOF ->
        "EOF"
    | INT _ ->
        "INT"
    | LAMBDA ->
        "LAMBDA"
    | LPARENS ->
        "LPARENS"
    | RPARENS ->
        "RPARENS"
    | VAR _ ->
        "VAR"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37-39"]
  
  let rec _menhir_goto_term_opt : type  ttv_stack. ttv_stack -> _ -> _menhir_box_term_opt =
    fun _menhir_stack _v ->
      MenhirBox_term_opt _v
  
  let rec _menhir_run_42 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_term_opt =
    fun _menhir_stack _v _tok ->
      match (_tok : MenhirBasics.token) with
      | EOF ->
          let (_1, _2) = (_v, ()) in
          let _v = _menhir_action_32 _1 _2 in
          _menhir_goto_term_opt _menhir_stack _v
      | _ ->
          _eRR ()
  
  let rec _menhir_run_10 : type  ttv_stack. (ttv_stack, _menhir_box_term_opt) _menhir_cell1_expr_var -> _ -> _ -> _ -> _ -> _menhir_box_term_opt =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_expr_var (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _1_inlined1 = _v in
      let _v = _menhir_action_05 _1 _1_inlined1 in
      _menhir_goto_expr_apply _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_expr_apply : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_term_opt) _menhir_state -> _ -> _menhir_box_term_opt =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState00 ->
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState02 ->
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState07 ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_46 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_term_opt) _menhir_state -> _ -> _menhir_box_term_opt =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | VAR _v_0 ->
          let _menhir_stack = MenhirCell1_expr_apply (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let var = _v_0 in
          let _v = _menhir_action_24 var in
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | LPARENS ->
          let _menhir_stack = MenhirCell1_expr_apply (_menhir_stack, _menhir_s, _v) in
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState46
      | INT _v_2 ->
          let _menhir_stack = MenhirCell1_expr_apply (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let num = _v_2 in
          let _v = _menhir_action_13 num in
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | EOF ->
          let (_1, _2) = (_v, ()) in
          let _v = _menhir_action_31 _1 _2 in
          _menhir_goto_term_opt _menhir_stack _v
      | _ ->
          _eRR ()
  
  and _menhir_run_23 : type  ttv_stack. (ttv_stack, _menhir_box_term_opt) _menhir_cell1_expr_apply -> _ -> _ -> _ -> _ -> _menhir_box_term_opt =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_expr_apply (_menhir_stack, _menhir_s, lambda) = _menhir_stack in
      let _1 = _v in
      let _v = _menhir_action_11 _1 lambda in
      _menhir_goto_expr_apply _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_02 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_term_opt) _menhir_state -> _menhir_box_term_opt =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let var = _v in
            _menhir_action_24 var
          in
          (match (_tok : MenhirBasics.token) with
          | VAR _v_0 ->
              let _menhir_stack = MenhirCell1_LPARENS (_menhir_stack, _menhir_s) in
              let _menhir_stack = MenhirCell1_expr_var (_menhir_stack, MenhirState02, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let var = _v_0 in
              let _v = _menhir_action_24 var in
              _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | RPARENS ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_1, _1_inlined1, _3) = ((), _v, ()) in
              let _v = _menhir_action_20 _1 _1_inlined1 _3 in
              _menhir_goto_expr_parens _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | LPARENS ->
              let _menhir_stack = MenhirCell1_LPARENS (_menhir_stack, _menhir_s) in
              let _menhir_stack = MenhirCell1_expr_var (_menhir_stack, MenhirState02, _v) in
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState26
          | INT _v_2 ->
              let _menhir_stack = MenhirCell1_LPARENS (_menhir_stack, _menhir_s) in
              let _menhir_stack = MenhirCell1_expr_var (_menhir_stack, MenhirState02, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let num = _v_2 in
              let _v = _menhir_action_13 num in
              _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | _ ->
              _eRR ())
      | LPARENS ->
          let _menhir_stack = MenhirCell1_LPARENS (_menhir_stack, _menhir_s) in
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState02
      | LAMBDA ->
          let _menhir_stack = MenhirCell1_LPARENS (_menhir_stack, _menhir_s) in
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState02
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let num = _v in
            _menhir_action_13 num
          in
          (match (_tok : MenhirBasics.token) with
          | VAR _v_4 ->
              let _menhir_stack = MenhirCell1_LPARENS (_menhir_stack, _menhir_s) in
              let _menhir_stack = MenhirCell1_expr_int (_menhir_stack, MenhirState02, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let var = _v_4 in
              let _v = _menhir_action_24 var in
              _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | RPARENS ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_1, _1_inlined1, _3) = ((), _v, ()) in
              let _v = _menhir_action_19 _1 _1_inlined1 _3 in
              _menhir_goto_expr_parens _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | LPARENS ->
              let _menhir_stack = MenhirCell1_LPARENS (_menhir_stack, _menhir_s) in
              let _menhir_stack = MenhirCell1_expr_int (_menhir_stack, MenhirState02, _v) in
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState32
          | INT _v_6 ->
              let _menhir_stack = MenhirCell1_LPARENS (_menhir_stack, _menhir_s) in
              let _menhir_stack = MenhirCell1_expr_int (_menhir_stack, MenhirState02, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let num = _v_6 in
              let _v = _menhir_action_13 num in
              _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_expr_parens : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_term_opt) _menhir_state -> _ -> _menhir_box_term_opt =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState00 ->
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState02 ->
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState46 ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState34 ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState22 ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState44 ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState32 ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState18 ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState40 ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState28 ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState13 ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState07 ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState38 ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState26 ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState09 ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_40 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_term_opt) _menhir_state -> _ -> _menhir_box_term_opt =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | VAR _v_0 ->
          let _menhir_stack = MenhirCell1_expr_parens (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let var = _v_0 in
          let _v = _menhir_action_24 var in
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | LPARENS ->
          let _menhir_stack = MenhirCell1_expr_parens (_menhir_stack, _menhir_s, _v) in
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
      | INT _v_2 ->
          let _menhir_stack = MenhirCell1_expr_parens (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let num = _v_2 in
          let _v = _menhir_action_13 num in
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | EOF ->
          let (_1, _2) = (_v, ()) in
          let _v = _menhir_action_30 _1 _2 in
          _menhir_goto_term_opt _menhir_stack _v
      | _ ->
          _eRR ()
  
  and _menhir_run_14 : type  ttv_stack. (ttv_stack, _menhir_box_term_opt) _menhir_cell1_expr_parens -> _ -> _ -> _ -> _ -> _menhir_box_term_opt =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_expr_parens (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _1_inlined1 = _v in
      let _v = _menhir_action_08 _1 _1_inlined1 in
      _menhir_goto_expr_apply _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_16 : type  ttv_stack. (ttv_stack, _menhir_box_term_opt) _menhir_cell1_expr_parens -> _ -> _ -> _ -> _ -> _menhir_box_term_opt =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_expr_parens (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _1_inlined1 = _v in
      let _v = _menhir_action_07 _1 _1_inlined1 in
      _menhir_goto_expr_apply _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_28 : type  ttv_stack. ((ttv_stack, _menhir_box_term_opt) _menhir_cell1_LPARENS as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_term_opt) _menhir_state -> _ -> _menhir_box_term_opt =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | VAR _v_0 ->
          let _menhir_stack = MenhirCell1_expr_parens (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let var = _v_0 in
          let _v = _menhir_action_24 var in
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | RPARENS ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPARENS (_menhir_stack, _menhir_s) = _menhir_stack in
          let (_1, _1_inlined1, _3) = ((), _v, ()) in
          let _v = _menhir_action_21 _1 _1_inlined1 _3 in
          _menhir_goto_expr_parens _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | LPARENS ->
          let _menhir_stack = MenhirCell1_expr_parens (_menhir_stack, _menhir_s, _v) in
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState28
      | INT _v_2 ->
          let _menhir_stack = MenhirCell1_expr_parens (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let num = _v_2 in
          let _v = _menhir_action_13 num in
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_24 : type  ttv_stack. (ttv_stack, _menhir_box_term_opt) _menhir_cell1_expr_apply -> _ -> _ -> _ -> _ -> _menhir_box_term_opt =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_expr_apply (_menhir_stack, _menhir_s, lambda) = _menhir_stack in
      let _1 = _v in
      let _v = _menhir_action_12 _1 lambda in
      _menhir_goto_expr_apply _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_20 : type  ttv_stack. (ttv_stack, _menhir_box_term_opt) _menhir_cell1_expr_int -> _ -> _ -> _ -> _ -> _menhir_box_term_opt =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_expr_int (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _1_inlined1 = _v in
      let _v = _menhir_action_03 _1 _1_inlined1 in
      _menhir_goto_expr_apply _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_15 : type  ttv_stack. (ttv_stack, _menhir_box_term_opt) _menhir_cell1_expr_parens -> _ -> _ -> _ -> _ -> _menhir_box_term_opt =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_expr_parens (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _1_inlined1 = _v in
      let _v = _menhir_action_09 _1 _1_inlined1 in
      _menhir_goto_expr_apply _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_13 : type  ttv_stack. (((ttv_stack, _menhir_box_term_opt) _menhir_cell1_LAMBDA, _menhir_box_term_opt) _menhir_cell1_nonempty_list_VAR_ as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_term_opt) _menhir_state -> _ -> _menhir_box_term_opt =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | VAR _v_0 ->
          let _menhir_stack = MenhirCell1_expr_parens (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let var = _v_0 in
          let _v = _menhir_action_24 var in
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | LPARENS ->
          let _menhir_stack = MenhirCell1_expr_parens (_menhir_stack, _menhir_s, _v) in
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
      | INT _v_2 ->
          let _menhir_stack = MenhirCell1_expr_parens (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let num = _v_2 in
          let _v = _menhir_action_13 num in
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | EOF | RPARENS ->
          let MenhirCell1_nonempty_list_VAR_ (_menhir_stack, _, params) = _menhir_stack in
          let MenhirCell1_LAMBDA (_menhir_stack, _menhir_s) = _menhir_stack in
          let (_1, _1_inlined1, _3) = ((), _v, ()) in
          let _v = _menhir_action_16 _1 _1_inlined1 _3 params in
          _menhir_goto_expr_lambda _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_expr_lambda : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_term_opt) _menhir_state -> _ -> _menhir_box_term_opt =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState00 ->
          _menhir_run_42 _menhir_stack _v _tok
      | MenhirState02 ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState07 ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_30 : type  ttv_stack. (ttv_stack, _menhir_box_term_opt) _menhir_cell1_LPARENS -> _ -> _ -> _ -> _ -> _menhir_box_term_opt =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RPARENS ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPARENS (_menhir_stack, _menhir_s) = _menhir_stack in
          let (_1, _1_inlined1, _3) = ((), _v, ()) in
          let _v = _menhir_action_23 _1 _1_inlined1 _3 in
          _menhir_goto_expr_parens _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_17 : type  ttv_stack. ((ttv_stack, _menhir_box_term_opt) _menhir_cell1_LAMBDA, _menhir_box_term_opt) _menhir_cell1_nonempty_list_VAR_ -> _ -> _ -> _ -> _ -> _menhir_box_term_opt =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_nonempty_list_VAR_ (_menhir_stack, _, params) = _menhir_stack in
      let MenhirCell1_LAMBDA (_menhir_stack, _menhir_s) = _menhir_stack in
      let (_1, _1_inlined1, _3) = ((), _v, ()) in
      let _v = _menhir_action_18 _1 _1_inlined1 _3 params in
      _menhir_goto_expr_lambda _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_11 : type  ttv_stack. (ttv_stack, _menhir_box_term_opt) _menhir_cell1_expr_var -> _ -> _ -> _ -> _ -> _menhir_box_term_opt =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_expr_var (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _1_inlined1 = _v in
      let _v = _menhir_action_06 _1 _1_inlined1 in
      _menhir_goto_expr_apply _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_12 : type  ttv_stack. (ttv_stack, _menhir_box_term_opt) _menhir_cell1_expr_var -> _ -> _ -> _ -> _ -> _menhir_box_term_opt =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_expr_var (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _1_inlined1 = _v in
      let _v = _menhir_action_04 _1 _1_inlined1 in
      _menhir_goto_expr_apply _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_03 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_term_opt) _menhir_state -> _menhir_box_term_opt =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LAMBDA (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState03
      | _ ->
          _eRR ()
  
  and _menhir_run_04 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_term_opt) _menhir_state -> _menhir_box_term_opt =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v_0 ->
          let _menhir_stack = MenhirCell1_VAR (_menhir_stack, _menhir_s, _v) in
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState04
      | ARROW ->
          let x = _v in
          let _v = _menhir_action_25 x in
          _menhir_goto_nonempty_list_VAR_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_nonempty_list_VAR_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_term_opt) _menhir_state -> _menhir_box_term_opt =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState03 ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState04 ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_06 : type  ttv_stack. ((ttv_stack, _menhir_box_term_opt) _menhir_cell1_LAMBDA as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_term_opt) _menhir_state -> _menhir_box_term_opt =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v_0 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v_1 =
            let var = _v_0 in
            _menhir_action_24 var
          in
          (match (_tok : MenhirBasics.token) with
          | VAR _v_2 ->
              let _menhir_stack = MenhirCell1_nonempty_list_VAR_ (_menhir_stack, _menhir_s, _v) in
              let _menhir_stack = MenhirCell1_expr_var (_menhir_stack, MenhirState07, _v_1) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let var = _v_2 in
              let _v = _menhir_action_24 var in
              _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | LPARENS ->
              let _menhir_stack = MenhirCell1_nonempty_list_VAR_ (_menhir_stack, _menhir_s, _v) in
              let _menhir_stack = MenhirCell1_expr_var (_menhir_stack, MenhirState07, _v_1) in
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState09
          | INT _v_4 ->
              let _menhir_stack = MenhirCell1_nonempty_list_VAR_ (_menhir_stack, _menhir_s, _v) in
              let _menhir_stack = MenhirCell1_expr_var (_menhir_stack, MenhirState07, _v_1) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let num = _v_4 in
              let _v = _menhir_action_13 num in
              _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | EOF | RPARENS ->
              let MenhirCell1_LAMBDA (_menhir_stack, _menhir_s) = _menhir_stack in
              let (_1, _1_inlined1, _3, params) = ((), _v_1, (), _v) in
              let _v = _menhir_action_15 _1 _1_inlined1 _3 params in
              _menhir_goto_expr_lambda _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | LPARENS ->
          let _menhir_stack = MenhirCell1_nonempty_list_VAR_ (_menhir_stack, _menhir_s, _v) in
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState07
      | LAMBDA ->
          let _menhir_stack = MenhirCell1_nonempty_list_VAR_ (_menhir_stack, _menhir_s, _v) in
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState07
      | INT _v_6 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v_7 =
            let num = _v_6 in
            _menhir_action_13 num
          in
          (match (_tok : MenhirBasics.token) with
          | VAR _v_8 ->
              let _menhir_stack = MenhirCell1_nonempty_list_VAR_ (_menhir_stack, _menhir_s, _v) in
              let _menhir_stack = MenhirCell1_expr_int (_menhir_stack, MenhirState07, _v_7) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let var = _v_8 in
              let _v = _menhir_action_24 var in
              _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | LPARENS ->
              let _menhir_stack = MenhirCell1_nonempty_list_VAR_ (_menhir_stack, _menhir_s, _v) in
              let _menhir_stack = MenhirCell1_expr_int (_menhir_stack, MenhirState07, _v_7) in
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState18
          | INT _v_10 ->
              let _menhir_stack = MenhirCell1_nonempty_list_VAR_ (_menhir_stack, _menhir_s, _v) in
              let _menhir_stack = MenhirCell1_expr_int (_menhir_stack, MenhirState07, _v_7) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let num = _v_10 in
              let _v = _menhir_action_13 num in
              _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | EOF | RPARENS ->
              let MenhirCell1_LAMBDA (_menhir_stack, _menhir_s) = _menhir_stack in
              let (_1, _1_inlined1, _3, params) = ((), _v_7, (), _v) in
              let _v = _menhir_action_14 _1 _1_inlined1 _3 params in
              _menhir_goto_expr_lambda _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_19 : type  ttv_stack. (ttv_stack, _menhir_box_term_opt) _menhir_cell1_expr_int -> _ -> _ -> _ -> _ -> _menhir_box_term_opt =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_expr_int (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _1_inlined1 = _v in
      let _v = _menhir_action_02 _1 _1_inlined1 in
      _menhir_goto_expr_apply _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_21 : type  ttv_stack. (ttv_stack, _menhir_box_term_opt) _menhir_cell1_expr_int -> _ -> _ -> _ -> _ -> _menhir_box_term_opt =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_expr_int (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _1_inlined1 = _v in
      let _v = _menhir_action_01 _1 _1_inlined1 in
      _menhir_goto_expr_apply _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_05 : type  ttv_stack. (ttv_stack, _menhir_box_term_opt) _menhir_cell1_VAR -> _ -> _ -> _ -> _menhir_box_term_opt =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_VAR (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_26 x xs in
      _menhir_goto_nonempty_list_VAR_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_25 : type  ttv_stack. (ttv_stack, _menhir_box_term_opt) _menhir_cell1_expr_apply -> _ -> _ -> _ -> _ -> _menhir_box_term_opt =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_expr_apply (_menhir_stack, _menhir_s, lambda) = _menhir_stack in
      let _1 = _v in
      let _v = _menhir_action_10 _1 lambda in
      _menhir_goto_expr_apply _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_34 : type  ttv_stack. ((ttv_stack, _menhir_box_term_opt) _menhir_cell1_LPARENS as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_term_opt) _menhir_state -> _ -> _menhir_box_term_opt =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | VAR _v_0 ->
          let _menhir_stack = MenhirCell1_expr_apply (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let var = _v_0 in
          let _v = _menhir_action_24 var in
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | RPARENS ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPARENS (_menhir_stack, _menhir_s) = _menhir_stack in
          let (_1, _1_inlined1, _3) = ((), _v, ()) in
          let _v = _menhir_action_22 _1 _1_inlined1 _3 in
          _menhir_goto_expr_parens _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | LPARENS ->
          let _menhir_stack = MenhirCell1_expr_apply (_menhir_stack, _menhir_s, _v) in
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState34
      | INT _v_2 ->
          let _menhir_stack = MenhirCell1_expr_apply (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let num = _v_2 in
          let _v = _menhir_action_13 num in
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_22 : type  ttv_stack. (((ttv_stack, _menhir_box_term_opt) _menhir_cell1_LAMBDA, _menhir_box_term_opt) _menhir_cell1_nonempty_list_VAR_ as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_term_opt) _menhir_state -> _ -> _menhir_box_term_opt =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | VAR _v_0 ->
          let _menhir_stack = MenhirCell1_expr_apply (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let var = _v_0 in
          let _v = _menhir_action_24 var in
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | LPARENS ->
          let _menhir_stack = MenhirCell1_expr_apply (_menhir_stack, _menhir_s, _v) in
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
      | INT _v_2 ->
          let _menhir_stack = MenhirCell1_expr_apply (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let num = _v_2 in
          let _v = _menhir_action_13 num in
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | EOF | RPARENS ->
          let MenhirCell1_nonempty_list_VAR_ (_menhir_stack, _, params) = _menhir_stack in
          let MenhirCell1_LAMBDA (_menhir_stack, _menhir_s) = _menhir_stack in
          let (_1, _1_inlined1, _3) = ((), _v, ()) in
          let _v = _menhir_action_17 _1 _1_inlined1 _3 params in
          _menhir_goto_expr_lambda _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  let rec _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_term_opt =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VAR _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let var = _v in
            _menhir_action_24 var
          in
          (match (_tok : MenhirBasics.token) with
          | VAR _v_0 ->
              let _menhir_stack = MenhirCell1_expr_var (_menhir_stack, MenhirState00, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let var = _v_0 in
              let _v = _menhir_action_24 var in
              _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | LPARENS ->
              let _menhir_stack = MenhirCell1_expr_var (_menhir_stack, MenhirState00, _v) in
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState38
          | INT _v_2 ->
              let _menhir_stack = MenhirCell1_expr_var (_menhir_stack, MenhirState00, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let num = _v_2 in
              let _v = _menhir_action_13 num in
              _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | EOF ->
              let (_1, _2) = (_v, ()) in
              let _v = _menhir_action_29 _1 _2 in
              _menhir_goto_term_opt _menhir_stack _v
          | _ ->
              _eRR ())
      | LPARENS ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | LAMBDA ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let num = _v in
            _menhir_action_13 num
          in
          (match (_tok : MenhirBasics.token) with
          | VAR _v_4 ->
              let _menhir_stack = MenhirCell1_expr_int (_menhir_stack, MenhirState00, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let var = _v_4 in
              let _v = _menhir_action_24 var in
              _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | LPARENS ->
              let _menhir_stack = MenhirCell1_expr_int (_menhir_stack, MenhirState00, _v) in
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState44
          | INT _v_6 ->
              let _menhir_stack = MenhirCell1_expr_int (_menhir_stack, MenhirState00, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let num = _v_6 in
              let _v = _menhir_action_13 num in
              _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | EOF ->
              let (_1, _2) = (_v, ()) in
              let _v = _menhir_action_28 _1 _2 in
              _menhir_goto_term_opt _menhir_stack _v
          | _ ->
              _eRR ())
      | EOF ->
          let _v =
            let _1 = () in
            _menhir_action_27 _1
          in
          MenhirBox_term_opt _v
      | _ ->
          _eRR ()
  
end

let term_opt =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_term_opt v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
