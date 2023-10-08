type 'a node = Node of 'a * 'a node option | Empty;;

exception LinkedListException of string;;

let ll = Node (10, Some (Node (20, Some (Node (30, None)))));;

let addf value llist = match llist with 
| Empty -> Node (value, None)
| _ -> Node (value, Some (llist));;

let rec addl value llist = match llist with
| Node (x, Some y) -> Node (x, Some (addl value y))
| Node (x, None) -> Node (x, Some (Node (value, None)))
| Empty -> Node (value, None);;

let rec add value index llist = 
    if index = 0 then addf value llist
    else if index < 0 then raise (LinkedListException "Index Out Of Bounds")
    else
        match llist, index with
        | Node (x, Some y), i -> if i=1 then Node (x, Some (addf value y)) else Node (x, Some (add value (i-1) y))
        | Node (x, None), i -> if i=1 then Node (x, Some (Node (value, None))) else raise (LinkedListException "Index Out Of Bounds") 
        | _ -> raise (LinkedListException "");;

let deletef llist = match llist with
| Node (x, Some y) -> y
| Node (_, None) | Empty -> Empty;;

let rec deletel llist =
    let is_last x = match x with
    | Node (x, None) -> true
    | _ -> false in

    match llist with
    | Node (x, Some y) when is_last y -> Node (x, None)
    | Node (x, Some y) -> Node (x, Some (deletel y))
    | Node (_, None) | Empty -> Empty;;

let find value llist =
    let rec find' value index llist = match llist, index with
    | Node (x, None), index when x = value -> index
    | Node (x, Some y), index -> if x = value then index else find' value (index+1) y
    | _ -> -1 in
    find' value 0 llist;;

let rec display llist to_string = match llist with
| Node (x, Some y) -> print_string (to_string x); print_string " -> "; display y to_string
| Node (x, None) -> print_string (to_string x); print_string " -> END"
| Empty -> print_string "EMPTY";;

let display_int x = display x (fun x -> string_of_int x);;