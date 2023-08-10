(* Strings use double quote and charecter literals use single quotes *)
let st = "Sam Maji";;
let ch = 's';;

(* String.make -> char to string *)
(* ^ to concat strings *)
let st = (String.make 1 'O') ^ "Caml";

(* %c -> char
   %d -> int
   %f -> float
   %s -> string *)
Printf.printf "%.2f" 3.293;;

(* There's also unformatted read and write functions. *)
print_string "hello world\n" ;;
print_endline "hello world" ;;

(* User input *)
let line = read_line () ;;