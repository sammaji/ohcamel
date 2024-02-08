(** Flatten a List **)
type 'a node =
  | One of 'a 
  | Many of 'a node list;;

let rec flatten lst = match lst with
| [] -> []
| (Many x)::tl -> (flatten x)@tl
| x::tl -> x::(flatten tl);;


(** Decode a Run-Length Encoded List **)
type 'a rle =
  | One of 'a
  | Many of int * 'a;;

let rec decode lst =
  let rec expand x n = match n with 0 -> [] | n -> x:: expand x (n-1) in
  
  match lst with
  | [] -> []
  | Many (n,x)::tl -> expand x n @ decode tl
  | One x::tl -> x :: decode tl
;;

(** Replicate the Elements of a List a Given Number of Times **)
let rec replicate lst n = 
  let rec expand x n = match n with 0 -> [] | n -> x:: expand x (n-1) in
  match lst with
  | [] -> []
  | hd::tl -> (expand hd n) @ replicate tl n;; 

(* * Generate the Combinations of K Distinct Objects Chosen From the N Elements of a List *
let rec extract lst = 
  let rec extract' x lst = match lst with [] -> [] | hd::tl -> (x::hd::[]) :: extract' x tl in
  match lst with [] -> [] | hd::tl -> (extract' hd tl) @ extract tl;; *)

let is_prime x = 
  let is_div a b = (a / b) * b == a in
  let rec is_composite x acc = if x = 1 then false else 
    match acc with a when a = x -> false | a -> (is_div x a) || (is_composite x (acc+1)) in
  not (is_composite x 2);;