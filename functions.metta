;is-member
(= (is-member () $symbol) False )
(= (is-member $list $symbol) (
    if (== (car-atom $list) $symbol) True (is-member (cdr-atom $list) $symbol) )
)

; append
(=(append () $val) ($val))
(=(append $list $val) (
        let* (                                      
            ($head (car-atom $list)) 
            ($tail (cdr-atom $list)) 
            ($dummy (append $tail $val)) 
        ) (cons-atom $head $dummy)
    )
)

!(append (1 2 3) 6)


;max-value

(=(max-value ()) 0)
(=(max-value $list) (
        let* (                                      
            ($head (car-atom $list)) 
            ($tail (cdr-atom $list))
            ($dummy (max-value $tail))
        ) (if (> $head $dummy) $head $dummy)
    )
)

!(max-value (1 7 3 4))



;min-value
(=(min-value ()) 1000000000000)
(=(min-value $list) (
        let* (                                      
            ($head (car-atom $list)) 
            ($tail (cdr-atom $list))
            ($dummy (min-value $tail))
        ) (if (< $head $dummy) $head $dummy)
    )
)

!(min-value (9 1 7 3 4))


;remove-element

(=(remove-element () $val) ())
(=(remove-element $list $val) (
        let* (                                      
            ($head (car-atom $list)) 
            ($tail (cdr-atom $list))
            ($dummy (remove-element $tail $val))
        ) ( if (== $val $head) $dummy (cons-atom $head $dummy))
    )
)

!(remove-element (1 2 3 5 7) 5)
