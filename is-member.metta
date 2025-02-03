;is-member
(= (is-member () $symbol) False )
(= (is-member $list $symbol) (
    if (== (car-atom $list) $symbol) True (is-member (cdr-atom $list) $symbol) )
)
