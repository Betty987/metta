(=(is-member () $val) False)  ; Base case: Empty list, return False

(=(is-member $list $val) (
    let* (
        ($head (car-atom $list))   ; Extract the first element
        ($tail (cdr-atom $list))   ; Extract the rest of the list
    ) (if (== $head $val) True (is-member $tail $val))  ; Check and recurse
))

!(is-member (1 2 3) 9)
