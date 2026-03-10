type formula = 
    | True
    | False 
    | Var of string
    | NOT of formula
    | OR of formula * formula

let () = Printf.printf "hello\n"
let line = read_line ()
let propositions = String.split_on_char ' ' line
let () = List.iter(fun x -> Printf.printf "%s\n" x) propositions