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

!(remove-element (1 2 3 5 8) 5)
