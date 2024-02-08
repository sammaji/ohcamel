(** SOURCE: https://ocaml.org/exercises **)

(** Tail of a List **)
let rec last lst = match lst with
| [] -> None
| x::[] -> Some x
| x::xs -> last xs;;

(** Last Two Elements of a List **)
let rec last_two lst = match lst with
| [] | _::[] -> None
| x::xs::[] -> Some (x, xs)
| x::xs -> last_two xs;;

(** Run-Length Encoding **)
let encode lst =
  let rec encode' lst acc = match lst with
    | [] -> []
    | x::[] -> [(acc+1, x)]
    | x::xs::xs' when x = xs -> encode' (xs::xs') (acc+1)
    | x::xs::xs' -> (acc+1, x) :: encode' (xs::xs') 0 in
  encode' lst 0;;

(** Modified Run-Length Encoding **)
type 'a rle =
  | One of 'a
  | Many of int * 'a;;

let encode lst =
  let rec encode' lst acc = match lst with
    | [] -> []
    | x::[] -> if acc = 0 then [One x] else [Many (acc+1, x)] 
    | x::xs::xs' when x = xs -> encode' (xs::xs') (acc+1)
    | x::xs::xs' when acc = 0 -> (One x) :: encode' (xs::xs') 0
    | x::xs::xs' -> Many (acc+1, x) :: encode' (xs::xs') 0 in
  encode' lst 0;;