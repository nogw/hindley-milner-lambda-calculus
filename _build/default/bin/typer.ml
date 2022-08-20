open Tree

module StringMap = Map.Make (String)

let make_constraint = StringMap.add

let rec refine_type subst = function
  | TyInt -> TyInt
  | TyVar var ->
    if StringMap.mem var subst
      then refine_type subst (StringMap.find var subst)
      else TyVar var
  | TyArrow (arg, return) -> TyArrow (refine_type subst arg, refine_type subst return)
;;

module StringSet = Set.Make (String)

let rec type_vars_from_type = function
  | TyVar var -> StringSet.singleton var
  | TyArrow (arg, return) ->
    StringSet.union (type_vars_from_type arg) (type_vars_from_type return)
  | TyInt -> StringSet.empty
;;

let environment_add var typ env = StringMap.add var typ env

let instantiate_type nt typ type_vars =
  let aggregate v acc = StringMap.add v (nt ()) acc in
  let subst = StringSet.fold aggregate type_vars StringMap.empty in
  refine_type subst typ
;;

exception UnboundVariable of string

let environment_get nt var env =
  if StringMap.mem var env
  then (
    let typ, type_vars = StringMap.find var env in
    instantiate_type nt typ type_vars)
  else raise (UnboundVariable var)
;;

let refine_env subst env =
  let refine_entry (typ, var) =
    refine_type (StringSet.fold StringMap.remove var subst) typ, var
  in
  StringMap.map refine_entry env
;;

exception CannotUnify of type_expr * type_expr

let rec unify t1 t2 subst =
  let t1' = refine_type subst t1 in
  let t2' = refine_type subst t2 in
  let no_cycle var typ = not (StringSet.mem var (type_vars_from_type typ)) in
  match t1', t2' with
  | TyVar v1, TyVar v2 when v1 = v2 -> subst
  | TyVar v1, _ when no_cycle v1 t2 -> make_constraint v1 t2 subst
  | _, TyVar _ -> unify t2' t1' subst
  | TyArrow (arg, return), TyArrow (arg', return') ->
    unify arg arg' (unify return return' subst)
  | TyInt, TyInt -> subst
  | a, b -> raise (CannotUnify (a, b))
;;

let make_new_type () =
  let t = ref 0 in
  fun () ->
    let n = !t in
    let _ = t := !t + 1 in
    TyVar ("t" ^ string_of_int n)
;;

let rec inspect_expr nt env expr typ subst =
  match expr with
  | Int _ -> unify typ TyInt subst
  | Var var ->
    let var_type = refine_type subst (environment_get nt var env) in
    unify typ var_type subst
  | Abs (param, body) ->
    let param_typ = nt () in
    let body_typ = nt () in
    let new_subst = unify typ (TyArrow (param_typ, body_typ)) subst in
    let new_env = environment_add param (param_typ, StringSet.empty) env in
    inspect_expr nt new_env body body_typ new_subst
  | App (lambda, arg) ->
    let arg_type = nt () in
    let lambda_type = TyArrow (arg_type, typ) in
    let expr_subst = inspect_expr nt env arg arg_type subst in
    let lambda_type' = refine_type expr_subst lambda_type in
    inspect_expr nt (refine_env expr_subst env) lambda lambda_type' expr_subst
;;

let make_new_char () =
  let t = ref (Char.code 'a') in
  fun () ->
    let n = !t in
    let _ = t := !t + 1 in
    Printf.sprintf "'%c" (Char.chr n)
;;

let pretty_tyvars ty =
  let nc = make_new_char () in
  let vars = type_vars_from_type ty in
  let make_subs var subs = StringMap.add var (TyVar (nc ())) subs in
  let subs = StringSet.fold make_subs vars StringMap.empty in
  refine_type subs ty
;;

let type_of expr =
  let env = StringMap.empty in
  let empty_subst = StringMap.empty in
  let new_type = make_new_type () in
  let expr_type = new_type () in
  let subst = inspect_expr new_type env expr expr_type empty_subst in
  pretty_tyvars (refine_type subst expr_type)
;;