(* creating lists *)
let ls1 = [1;2;3;4];;
let ls2 = 1::2::3::4::[];;
let ls3 = [1]@[2]@[3]@[4];;

(*** Understanding Call Signatures ***)
(* eg: List.append;;
   -: 'a list -> a' list -> a' list = <fun>

   'a is a generic type and can be anything like int list or string list

   Here last type represents the return type (a' list)
   The = <fun> indicates a function signature
   *)

(*
   eg: List.filter;;
   -: 'a list -> a' list = <fun>
   
   - : ('a -> bool) -> 'a list -> 'a list = <fun>
   This function takes a lamda function and list as arguments
   and returns a list. Lambda function takes a generic type a' 
   as argument and return a boolean
   *)

(* common functions *)
let nth_value = List.nth ls1 3;;

let ls1 = List.append ls1 [5;6];;

let ls1 = List.filter (fun x -> x<5) ls1 ;;

let ls4 = List.map (fun x -> 2*x) ls1;;

(* You can add an item to the beginning of a list with the "::" constructor
   often referred to as "cons". *)
let ls5 = 1 :: [2; 3] ;; (* Gives [1; 2; 3] *)

(* ------------------------------- *)
(*** Arrays ***)
(* Arrays are enclosed in [| |] *)
let my_array = [| 1; 2; 3 |] ;;

(* You can access array items like this: *)
my_array.(0) ;;
