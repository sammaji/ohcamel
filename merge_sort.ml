let rec merge_sort lst = 
    let split lst =
        let length = List.length lst in
        let middle = length / 2 in
        let rec split_left acc n = function
            | [] -> (List.rev acc, [])
            | x :: xs when n > 0 -> split_left (x :: acc) (n - 1) xs
            | xs -> (List.rev acc, xs)
        in
        let left, right = split_left [] middle lst in
        (left, right) in
    
    let rec merge lst1 lst2 = match lst1, lst2 with
    | [],x | x,[] -> x
    | x::xs, x'::xs' when x < x' -> x::(merge xs (x'::xs'))
    | x::xs, x'::xs' -> x'::(merge (x::xs) xs') in

    if (List.length lst < 2) then lst
    else
        let (first, second) = split lst in
        merge (merge_sort first) (merge_sort second);;