type 'a btree = End | Node of 'a * 'a btree * 'a btree;;
type 'a bst = 'a btree;;

let bt = Node (9, 
  Node (3, Node (7, End, End), Node (4, End, End)),
  Node (2, Node (5, Node (1, End, End), End), Node (6, End, Node (7, End, End)))
);;

let rec dfs_inorder t = match t with
  | Node (x, left, right) -> (dfs_inorder left) @ [x] @(dfs_inorder right)
  | End -> [];; 

let rec dfs_preorder t = match t with
  | Node (x, left, right) -> [x] @ (dfs_preorder left) @ (dfs_preorder right)
  | End -> [];; 

let rec dfs_postorder t = match t with
  | Node (x, left, right) -> (dfs_postorder left) @ (dfs_postorder right) @ [x]
  | End -> [];;