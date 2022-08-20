%{
  open Tree
%}

%token <string> VAR
%token <int> INT
%token LAMBDA
%token ARROW
%token LPARENS
%token RPARENS
%token EOF

%start <Tree.expr option> term_opt

%%

let term_opt :=
  | EOF; { None }
  | expr = expr; EOF; { Some expr }

let expr ==
  | expr_atom
  | expr_apply
  | expr_lambda

let expr_atom ==
  | expr_int
  | expr_var
  | expr_parens

let expr_var :=
  | var = VAR; { Var var }

let expr_int :=
  | num = INT; { Int num }

let expr_lambda :=
  | LAMBDA; params = nonempty_list(VAR); ARROW; body = expr;
    { List.fold_right (fun param body -> Abs (param, body) ) params body }

let expr_apply :=
  | lambda = expr_atom;  arg = expr_atom; { App (lambda, arg) }
  | lambda = expr_apply; arg = expr_atom; { App (lambda, arg) }

let expr_parens :=
  | LPARENS; expr = expr; RPARENS; { expr }
