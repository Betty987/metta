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

!(max-value (1 6 3 4))
