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
